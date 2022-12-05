import fs from 'fs';
import path from 'path';
import yaml from 'js-yaml';
import { exec } from 'child_process';

export const parentDir = path.resolve(process.cwd(), '..');
const config = yaml.load(fs.readFileSync('../pubspec.yaml'))?.shaders;

export const sourceDir = `${parentDir}/${config?.src ?? 'shaders/src'}`;
export const assetDir = `${parentDir}/${config?.out ?? 'assets/shaders'}`;
export const glslcPath = `${parentDir}/${
  config?.shaderc ?? 'extern/shaderc'
}/bin/glslc`;
export const dartDefDir = `${parentDir}/${config?.dartRef ?? 'lib/shaders'}`;
export const dartDefPath = `${dartDefDir}/user_shaders.g.dart`;

export function snakeCaseToPascalCase(str) {
  return str.replace(/(^|[-_])(\w)/gm, (_, __, g) => {
    return g.toUpperCase();
  });
}

export function snakeCaseToCamelCase(str) {
  return str.replace(/([-_])(\w)/gm, (_, __, g) => {
    return g.toUpperCase();
  });
}

export function execAsync(command) {
  return new Promise((res, rej) => {
    exec(command, (err, stdout, stderr) => {
      if (stdout.length > 0) console.log(stdout);
      if (stderr.length > 0) console.error(stderr);
      if (err) rej(err);
      res();
    });
  });
}

export function findFiles(dirPath, opts) {
  const fileInfos = fs.readdirSync(dirPath, { withFileTypes: true });
  return fileInfos.map((info) => ({
    name: info.name,
    basename: path.basename(info.name, path.extname(info.name)),
    fullname: path.resolve(dirPath, info.name),
    relname: path.resolve(dirPath, info.name).replace(opts.sourceDir, ''),
    extension: path.extname(info.name),
    isFile: info.isFile(),
    isDirectory: info.isDirectory(),
    parent: dirPath,
    relParent: dirPath.replace(opts.sourceDir, ''),
  }));
}

export class RefBuilder {
  files = [];

  classes = {};
  classOrder = [];

  add(file) {
    this.files.push(file);

    const dirs = file.relParent.split('/');
    let className;
    const parentDirs = [];
    const rawParentDirs = [];
    let parentClass;

    for (const dir of dirs) {
      const dirPS = snakeCaseToPascalCase(dir);

      if (dir === '') {
        className = '_$UserShaders';
      } else {
        className = `_$${[...parentDirs, dirPS].join('_')}`;
      }

      if (dir !== '') {
        parentDirs.push(dirPS);
        rawParentDirs.push(dir);
      }

      if (this.classes[className] == undefined) {
        this.classes[className] = {
          name: className,
          children: [],
          dirPath: rawParentDirs.join('/'),
        };
        this.classOrder.push(className);
      }

      const dirClass = this.classes[className];

      if (parentClass != undefined) {
        dirClass.parent = parentClass.name;
        if (!parentClass.children.includes(dirClass.name))
          parentClass.children.push(dirClass.name);
      }

      parentClass = this.classes[className];
    }

    const lastDirClass = this.classes[className];

    if (lastDirClass.shaders == undefined) {
      lastDirClass.shaders = [];
    }

    lastDirClass.shaders.push(file);
  }

  build() {
    const imports = [];
    const classBodies = [
      [
        '// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, camel_case_types',
        '',
        "import 'dart:ui';",
        '',
        'final UserShaders = _$UserShaders();',
      ].join('\n'),
    ];

    for (const className of this.classOrder) {
      const dirClass = this.classes[className];
      let lines = [`class ${className} {`];

      // Imports

      if (dirClass.shaders.length > 0) {
        let dirPath = `assets/shaders/${dirClass.dirPath}`;
        if (!dirPath.endsWith('/')) dirPath = `${dirPath}/`;
        if (!imports.includes(dirPath)) imports.push(dirPath);
      }

      // Child classes

      if (dirClass.children.length > 0) {
        for (const child of dirClass.children) {
          const underscoreIdx = child.lastIndexOf('_');
          const fieldName =
            underscoreIdx == 0
              ? child.substring(2)
              : child.substring(underscoreIdx + 1);
          lines.push(`  final ${fieldName} = ${child}();`);
        }

        lines.push('');
      }

      // Shader fields

      if (dirClass.shaders.length > 0) {
        for (const shader of dirClass.shaders) {
          const fieldName = snakeCaseToCamelCase(shader.basename);
          lines.push(`  late final FragmentShader ${fieldName};`);
        }

        lines.push('');
      }

      // Initializer

      lines.push('  Future<void> initialize() async {');

      if (dirClass.shaders.length > 0) {
        for (const shader of dirClass.shaders) {
          const assetPath = `assets/shaders${shader.relParent}/${shader.basename}.sprv`;
          const fieldName = snakeCaseToCamelCase(shader.basename);
          lines.push(
            `    ${fieldName} = (await FragmentProgram.fromAsset('${assetPath}')).fragmentShader();`
          );
        }
      }

      if (dirClass.children.length > 0) {
        lines.push('');
        for (const child of dirClass.children) {
          const underscoreIdx = child.lastIndexOf('_');
          const fieldName =
            underscoreIdx == 0
              ? child.substring(2)
              : child.substring(underscoreIdx + 1);
          lines.push(`    await ${fieldName}.initialize();`);
        }
      }

      lines.push('  }');

      // Final steps
      lines.push('}');

      classBodies.push(lines.join('\n'));
    }

    imports.sort();

    return {
      imports,
      contents: classBodies.join('\n\n'),
    };
  }
}
