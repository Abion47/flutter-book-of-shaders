import fs from 'fs';

import {
  execAsync,
  findFiles,
  RefBuilder,
  sourceDir,
  dartDefDir,
  dartDefPath,
  updatePubspecShaderList,
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

async function main() {
  fs.rmSync(dartDefPath, { force: true });

  const refBuilder = new RefBuilder();

  // Compiling
  const files = recurseDir(sourceDir);
  for (const file of files) {
    console.log(`Adding ${file.relname}...`);
    refBuilder.add(file);
  }

  // Generating dart file
  console.log(`Generating reference class at ${dartDefPath}...`);
  const { imports, contents } = refBuilder.build();

  fs.mkdirSync(dartDefDir, { recursive: true });
  fs.writeFileSync(dartDefPath, contents);

  await execAsync(`dart format ${dartDefPath} > /dev/null`);

  updatePubspecShaderList(imports);
}

// =====================

main();
