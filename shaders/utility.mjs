import fs from 'fs';
import path from 'path';
import yaml from 'js-yaml';
import { exec } from 'child_process';

export const parentDir = path.resolve(process.cwd(), '..');
export const pubspecPath = `${parentDir}/pubspec.yaml`;

export const sourceDir = `${parentDir}/shaders/src`;
export const dartDefDir = `${parentDir}/lib/shaders`;
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

export function loadPubspec() {
  const pubspecStr = fs.readFileSync(pubspecPath, 'utf-8');
  const pubspec = yaml.load(pubspecStr);
  return pubspec;
}

export function findFiles(dirPath, opts) {
  const fileInfos = fs.readdirSync(dirPath, { withFileTypes: true });
  return fileInfos
    .filter((info) => {
      if (!opts?.exclude) return true;
      const fullname = path.resolve(dirPath, info.name);
      for (const pattern of opts.exclude) {
        if (fullname.match(pattern.replace('*', '.*?').replace('.', '\\.')))
          return false;
      }
      if (!opts?.include) return true;
      for (const pattern of opts.include) {
        if (fullname.match(pattern.replace('*', '.*?').replace('.', '\\.')))
          return true;
      }
      return false;
    })
    .map((info) => ({
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

export function updatePubspecShaderList(pubspec, imports) {
  const { flutter } = pubspec;
  if (flutter.shaders == undefined) flutter.shaders = [];
  const { shaders } = flutter;
  shaders.length = 0;
  shaders.push(...imports);

  const newPubspecStr = yaml.dump(pubspec);
  fs.writeFileSync(pubspecPath, newPubspecStr);
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
        className = `_$${[...parentDirs, dirPS]
          .join('_')
          .replace(/^[\d_]+/, '')}`;
      }

      if (dir !== '') {
        parentDirs.push(dirPS);
        rawParentDirs.push(dir);
      }

      if (this.classes[className] == undefined) {
        this.classes[className] = {
          name: className,
          shaders: [],
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
        let dirPath = `shaders/src/${dirClass.dirPath}`;
        if (!dirPath.endsWith('/')) dirPath = `${dirPath}/`;
        for (const shader of dirClass.shaders)
          imports.push(`${dirPath}${shader.name}`);
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
          const assetPath = `shaders/src${shader.relParent}/${shader.name}`;
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
