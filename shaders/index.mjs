import fs from 'fs';

import {
  execAsync,
  findFiles,
  RefBuilder,
  sourceDir,
  assetDir,
  glslcPath,
  dartDefDir,
  dartDefPath,
} from './utility.mjs';

const shaderExts = ['.glsl', '.frag'];

function recurseDir(dirPath) {
  const files = [];

  const fileInfos = findFiles(dirPath, { sourceDir });

  while (fileInfos.length > 0) {
    const fileInfo = fileInfos.pop();

    if (!fileInfo.isFile && !fileInfo.isDirectory) continue;

    if (fileInfo.isDirectory) {
      fileInfos.push(...findFiles(fileInfo.fullname, { sourceDir }));
    } else if (shaderExts.includes(fileInfo.extension)) {
      files.push(fileInfo);
    }
  }

  files.sort((a, b) => a.relname.localeCompare(b.relname));

  return files;
}

async function compileShader(file) {
  console.log(`Compiling ${file.relname}...`);

  const buildFile = `${file.basename}.sprv`;
  const buildDest = `${assetDir}${file.relParent}/${buildFile}`;

  fs.mkdirSync(`${assetDir}${file.relParent}`, { recursive: true });

  try {
    await execAsync(
      `${glslcPath} --target-env="opengl" -fshader-stage="fragment" -o ${buildDest} ${file.fullname}`
    );
    console.log();
    return true;
  } catch (e) {
    return false;
  }
}

async function main() {
  // Clean-up existing artifacts
  fs.rmSync(assetDir, { recursive: true, force: true });
  fs.rmSync(dartDefPath, { force: true });

  // Set-up
  fs.mkdirSync(assetDir, { recursive: true });
  fs.writeFileSync(
    `${assetDir}/README.txt`,
    'This directory is automaticaly populated. Do not put files in here as they will be deleted when shaders are generated.'
  );

  const refBuilder = new RefBuilder();

  // Compiling
  const files = recurseDir(sourceDir);
  for (const file of files) {
    if (await compileShader(file)) refBuilder.add(file);
  }

  // Generating dart file
  console.log(`Generating reference class at ${dartDefPath}...`);
  const { imports, contents } = refBuilder.build();

  fs.mkdirSync(dartDefDir, { recursive: true });
  fs.writeFileSync(dartDefPath, contents);

  await execAsync(`dart format ${dartDefPath} > /dev/null`);

  console.log('');
  console.log(`Ensure you have the following included your pubspec.yaml assets declaration:
${imports.map((s) => `    - ${s}`).join('\n')}`);
}

// =====================

main();
