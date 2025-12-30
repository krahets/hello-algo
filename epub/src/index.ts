import * as fs from 'fs-extra';
import * as path from 'path';
import { execSync } from 'child_process';
import { Command } from 'commander';
import { parseMkdocsConfig, flattenNav, readChapterContent, parseVersion } from './parser';
import { generateEpub } from './epub';
import { Chapter, HeadingInfo } from './types';
import { extractHeadings } from './markdown';
import { validateEpubHeadings } from './validator';

// Supported programming languages list
const SUPPORTED_LANGUAGES = [
  'cpp', 'python', 'java', 'csharp', 'go', 'swift',
  'javascript', 'typescript', 'dart', 'rust', 'c',
  'kotlin', 'ruby', 'zig'
];

// Document language configuration
interface DocLanguageConfig {
  mkdocsPath: string;
  docsDir: string;
  title: string;
  description: string;
  language: string;
  supportedCodeLanguages?: string[]; // Supported programming languages list
}

/**
 * Generate output filename
 */
function generateOutputFilename(docLanguage: string, codeLanguage: string, workDir: string, projectRoot: string): string {
  // Get document language configuration
  const docConfig = DOC_LANGUAGE_CONFIG[docLanguage];
  const mkdocsPath = path.resolve(workDir, docConfig.mkdocsPath);

  // Parse version from mkdocs.yml
  const version = parseVersion(mkdocsPath);

  const filename = `hello-algo_${version}_${docLanguage}_${codeLanguage}.epub`;
  const outputDir = path.join(projectRoot, 'build', 'epub', 'outputs');
  fs.ensureDirSync(outputDir);
  return path.join(outputDir, filename);
}

/**
 * Get git repository remote URL
 */
function getGitRemoteUrl(): string {
  try {
    const url = execSync('git remote get-url origin', { encoding: 'utf-8', cwd: process.cwd() }).trim();
    return url;
  } catch (error) {
    console.error('Error: Unable to get git remote URL');
    console.error('Please ensure the current directory is a git repository or manually specify the repository URL');
    throw error;
  }
}

/**
 * Recursively copy directory, skipping existing files
 */
function copyDirectoryRecursive(src: string, dest: string): void {
  if (!fs.existsSync(src)) {
    return;
  }
  
  const stat = fs.statSync(src);
  
  if (stat.isDirectory()) {
    // Ensure target directory exists
    fs.ensureDirSync(dest);
    
    // Read all contents of source directory
    const entries = fs.readdirSync(src);
    
    for (const entry of entries) {
      const srcPath = path.join(src, entry);
      const destPath = path.join(dest, entry);
      
      const entryStat = fs.statSync(srcPath);
      
      if (entryStat.isDirectory()) {
        // Recursively handle subdirectories
        copyDirectoryRecursive(srcPath, destPath);
      } else {
        // Copy file if target doesn't exist
        if (!fs.existsSync(destPath)) {
          fs.copyFileSync(srcPath, destPath);
        }
      }
    }
  } else {
    // If it's a file, copy directly (if target doesn't exist)
    if (!fs.existsSync(dest)) {
      fs.copyFileSync(src, dest);
    }
  }
}

/**
 * Prepare docs branch working directory
 * 1. Clone docs branch to build/epub/hello-algo directory
 * 2. Copy necessary files and directories (skip existing files)
 */
async function prepareDocsBranch(): Promise<string> {
  // Get project root directory (assuming running from epub directory, or current directory is project root)
  const currentDir = process.cwd();
  let projectRoot: string;

  // If current directory is epub directory, go up to find project root
  if (path.basename(currentDir) === 'epub') {
    projectRoot = path.dirname(currentDir);
  } else {
    // Otherwise assume current directory is project root
    projectRoot = currentDir;
  }

  const buildEpubDir = path.join(projectRoot, 'build', 'epub', 'hello-algo');

  console.log('Preparing docs branch working directory...');
  console.log(`Project root directory: ${projectRoot}`);
  console.log(`Target directory: ${buildEpubDir}`);

  // Create build/epub directory (if it doesn't exist)
  const buildDir = path.join(projectRoot, 'build', 'epub');
  fs.ensureDirSync(buildDir);

  // Get git repository URL
  const repoUrl = getGitRemoteUrl();

  // Check if build/epub/hello-algo directory already exists
  if (fs.existsSync(buildEpubDir)) {
    const gitDir = path.join(buildEpubDir, '.git');

    // Check if it's a git repository
    if (fs.existsSync(gitDir)) {
      console.log('Detected existing git repository, using git pull to update...');
      try {
        // First switch to docs branch (if not on docs branch)
        execSync('git checkout docs', {
          stdio: 'inherit',
          cwd: buildEpubDir
        });

        // Execute git pull to update
        execSync('git pull', {
          stdio: 'inherit',
          cwd: buildEpubDir
        });

        console.log('✓ docs branch update completed');
      } catch (error) {
        console.error('Error: git pull update failed, trying to re-clone...');
        // If pull fails, delete directory and re-clone
        fs.removeSync(buildEpubDir);
        // Continue with clone logic below
      }
    } else {
      // If directory exists but is not a git repository, delete and re-clone
      console.log('Detected existing directory but not a git repository, deleting and re-cloning...');
      fs.removeSync(buildEpubDir);
    }
  }

  // If directory doesn't exist or has been deleted, execute clone
  if (!fs.existsSync(buildEpubDir)) {
    try {
      console.log(`Cloning docs branch: ${repoUrl}`);
      console.log(`Target: ${buildEpubDir}`);

      // Execute git clone, using shallow clone for speed
      execSync(`git clone --branch docs --depth 1 "${repoUrl}" "${buildEpubDir}"`, {
        stdio: 'inherit',
        cwd: projectRoot
      });

      console.log('✓ docs branch clone completed');
    } catch (error) {
      console.error('Error: Failed to clone docs branch');
      throw error;
    }
  }

  // Files and directories to copy
  const itemsToCopy = ['mkdocs.yml', 'docs', 'en', 'ja', 'overrides', 'zh-hant'];

  console.log('\nStarting file copy...');

  for (const item of itemsToCopy) {
    const sourcePath = path.join(projectRoot, item);
    const targetPath = path.join(buildEpubDir, item);

    // Check if source file/directory exists
    if (!fs.existsSync(sourcePath)) {
      console.log(`⚠️  Skipping ${item} (source file does not exist)`);
      continue;
    }

    try {
      const stat = fs.statSync(sourcePath);

      if (stat.isDirectory()) {
        // For directories, recursively copy, skipping existing files
        copyDirectoryRecursive(sourcePath, targetPath);
        console.log(`✓ Copied directory: ${item}`);
      } else {
        // For files, copy if target doesn't exist
        if (!fs.existsSync(targetPath)) {
          fs.copyFileSync(sourcePath, targetPath);
          console.log(`✓ Copied file: ${item}`);
        } else {
          console.log(`⊘ Skipping ${item} (target file already exists)`);
        }
      }
    } catch (error) {
      console.error(`⚠️  Error copying ${item}:`, error instanceof Error ? error.message : String(error));
      // Continue processing other files
    }
  }

  console.log('\n✓ File copy completed');
  console.log(`Working directory: ${buildEpubDir}\n`);

  return buildEpubDir;
}

const DOC_LANGUAGE_CONFIG: { [key: string]: DocLanguageConfig } = {
  'zh': {
    mkdocsPath: 'mkdocs.yml',
    docsDir: 'docs',        // Relative to project root directory
    title: 'Hello 算法',
    description: '动画图解、一键运行的数据结构与算法教程',
    language: 'zh-CN',
    // Chinese version supports all languages
  },
  'zh-hant': {
    mkdocsPath: 'zh-hant/mkdocs.yml',
    docsDir: 'zh-hant/docs',     // Relative to project root directory
    title: 'Hello 演算法',
    description: '動畫圖解、一鍵執行的資料結構與演算法教程',
    language: 'zh-Hant',
    // Traditional Chinese version supports all languages
  },
  'en': {
    mkdocsPath: 'en/mkdocs.yml',
    docsDir: 'en/docs',     // Relative to project root directory
    title: 'Hello Algo',
    description: 'Data Structures and Algorithms Crash Course with Animated Illustrations and Off-the-Shelf Code',
    language: 'en',
    supportedCodeLanguages: ['cpp', 'java', 'python'],
  },
  'ja': {
    mkdocsPath: 'ja/mkdocs.yml',
    docsDir: 'ja/docs',     // Relative to project root directory
    title: 'Hello アルゴリズム',
    description: 'アニメーションで図解、ワンクリック実行のデータ構造とアルゴリズムチュートリアル',
    language: 'ja',
    supportedCodeLanguages: ['cpp', 'java', 'python'],
  }
};

/**
 * Build a single EPUB file
 */
async function buildEpub(
  docLanguage: string,
  codeLanguage: string,
  outputPath: string,
  workDir: string,
  validate: boolean = false
): Promise<{ success: boolean; error?: string }> {
  try {
    // Get document language configuration
    const docConfig = DOC_LANGUAGE_CONFIG[docLanguage];
    if (!docConfig) {
      return { success: false, error: `Unsupported document language: ${docLanguage}` };
    }

    // Verify if programming language is supported by this document language
    if (docConfig.supportedCodeLanguages && !docConfig.supportedCodeLanguages.includes(codeLanguage)) {
      return { success: false, error: `Document language "${docLanguage}" does not support programming language "${codeLanguage}"` };
    }

    // Config file path (workDir is now project root directory)
    const mkdocsPath = path.resolve(workDir, docConfig.mkdocsPath);

    // Calculate project root directory (workDir is project root directory)
    const repoDir = workDir;

    // Document directory (absolute path)
    const docsDir = path.join(repoDir, docConfig.docsDir);

    // Check if directory exists
    if (!fs.existsSync(docsDir)) {
      return { success: false, error: `Document directory does not exist: ${docsDir}` };
    }

    if (!fs.existsSync(mkdocsPath)) {
      return { success: false, error: `Config file does not exist: ${mkdocsPath}` };
    }

    // Parse configuration
    const nav = parseMkdocsConfig(mkdocsPath);
    // Parse version from mkdocs.yml
    const version = parseVersion(mkdocsPath);
    
    // Flatten navigation structure
    const chapters = flattenNav(nav, docsDir);
    
    // Read chapter content and extract headings
    const allHeadings: HeadingInfo[] = [];
    
    for (const chapter of chapters) {
      chapter.content = readChapterContent(chapter);
      
      // Extract all headings from this chapter
      if (chapter.content.trim().length > 0) {
        const headings = extractHeadings(chapter.content, chapter.path);
        allHeadings.push(...headings);
      }
    }
    
    // Filter out empty content
    const validChapters = chapters.filter(ch => ch.content.trim().length > 0);

    // Cover image path (select based on document language)
    const epubDir = path.join(__dirname, '..');
    const coverMap: { [key: string]: string } = {
      'zh': path.join(epubDir, 'covers', 'hello-algo-cover-zh.jpg'),
      'zh-hant': path.join(epubDir, 'covers', 'hello-algo-cover-zh-hant.jpg'),
      'en': path.join(epubDir, 'covers', 'hello-algo-cover-en.jpg'),
      'ja': path.join(epubDir, 'covers', 'hello-algo-cover-en.jpg'), // Temporarily use English cover
    };
    const coverPath = coverMap[docLanguage] || coverMap['zh'];

    // Generate EPUB
    await generateEpub(validChapters, docsDir, outputPath, {
      title: docConfig.title,
      author: 'krahets',
      publisher: 'Hello Algorithm',
      description: docConfig.description,
      language: docConfig.language,
      cover: coverPath,
      codeLanguage: codeLanguage,
      docLanguage: docLanguage,
      version: version,
    });
    
    // Validate EPUB content integrity (only execute when enabled)
    if (validate) {
      const validation = await validateEpubHeadings(outputPath, allHeadings);
      
      if (!validation.success) {
        return { success: true, error: `Validation warning: Missing ${validation.missingHeadings.length} headings` };
      }
    }
    
    return { success: true };
  } catch (error) {
    return { success: false, error: error instanceof Error ? error.message : String(error) };
  }
}

async function main() {
  // Create command line program
  const program = new Command();

  program
    .name('hello-algo-epub')
    .description('Convert Hello Algorithm documentation to EPUB e-book')
    .version('1.0.0')
    .option('-d, --doc-language <lang>', 'Document language (zh, zh-hant, en, ja)', 'zh')
    .option('-o, --output <path>', 'Output EPUB file path')
    .option('-l, --language <lang>', `Programming language (${SUPPORTED_LANGUAGES.join(', ')})`, 'cpp')
    .option('-a, --all', 'Build all combinations of document languages and programming languages')
    .option('--validate', 'Enable EPUB content integrity validation', false)
    .parse(process.argv);

  const options = program.opts();

  // Get project root directory
  const currentDir = process.cwd();
  let projectRoot: string;
  if (path.basename(currentDir) === 'epub') {
    projectRoot = path.dirname(currentDir);
  } else {
    projectRoot = currentDir;
  }

  // Prepare docs branch working directory
  let workDir: string;
  try {
    workDir = await prepareDocsBranch();
  } catch (error) {
    console.error('Failed to prepare docs branch working directory:', error instanceof Error ? error.message : String(error));
    process.exit(1);
  }

  // If using --all, execute batch build
  if (options.all) {
    // Validation: Cannot use --all with other options
    // Check if these options were explicitly provided in command line arguments
    const args = process.argv;
    const hasDocLanguage = args.includes('-d') || args.includes('--doc-language');
    const hasLanguage = args.includes('-l') || args.includes('--language');
    const hasOutput = args.includes('-o') || args.includes('--output');

    if (hasDocLanguage || hasLanguage || hasOutput) {
      console.error('Error: Cannot specify --doc-language, --language, or --output when using --all');
      process.exit(1);
    }

    // Generate all combinations
    const builds: Array<{ docLanguage: string; codeLanguage: string }> = [];

    for (const docLang of Object.keys(DOC_LANGUAGE_CONFIG)) {
      const docConfig = DOC_LANGUAGE_CONFIG[docLang];
      const codeLangs = docConfig.supportedCodeLanguages || SUPPORTED_LANGUAGES;

      for (const codeLang of codeLangs) {
        builds.push({ docLanguage: docLang, codeLanguage: codeLang });
      }
    }

    console.log(`Starting batch build of ${builds.length} EPUB files...\n`);

    const results: Array<{ docLanguage: string; codeLanguage: string; success: boolean; error?: string; outputPath: string }> = [];

    for (let i = 0; i < builds.length; i++) {
      const { docLanguage, codeLanguage } = builds[i];
      const outputPath = generateOutputFilename(docLanguage, codeLanguage, workDir, projectRoot);

      console.log(`[${i + 1}/${builds.length}] Building: ${docLanguage}-${codeLanguage}`);

      const result = await buildEpub(docLanguage, codeLanguage, outputPath, workDir, options.validate);

      if (result.success) {
        console.log(`  ✅ Success: ${path.basename(outputPath)}`);
        if (result.error) {
          console.log(`  ⚠️  ${result.error}`);
        }
      } else {
        console.log(`  ❌ Failed: ${result.error}`);
      }
      console.log();

      results.push({
        docLanguage,
        codeLanguage,
        success: result.success,
        error: result.error,
        outputPath
      });
    }

    // Display statistics
    const successCount = results.filter(r => r.success).length;
    const failCount = results.length - successCount;

    console.log('='.repeat(60));
    console.log('Build completed!');
    console.log(`Success: ${successCount}/${results.length}`);
    console.log(`Failed: ${failCount}/${results.length}`);
    console.log('='.repeat(60));

    if (failCount > 0) {
      console.log('\nFailed builds:');
      results.filter(r => !r.success).forEach(r => {
        console.log(`  - ${r.docLanguage}-${r.codeLanguage}: ${r.error}`);
      });
      process.exit(1);
    }

    return;
  }

  // Single build logic
  // Validate document language parameter
  const supportedDocLanguages = Object.keys(DOC_LANGUAGE_CONFIG);
  if (!supportedDocLanguages.includes(options.docLanguage)) {
    console.error(`Error: Unsupported document language "${options.docLanguage}"`);
    console.error(`Supported document languages: ${supportedDocLanguages.join(', ')}`);
    process.exit(1);
  }

  // Validate programming language parameter
  if (!SUPPORTED_LANGUAGES.includes(options.language)) {
    console.error(`Error: Unsupported programming language "${options.language}"`);
    console.error(`Supported programming languages: ${SUPPORTED_LANGUAGES.join(', ')}`);
    process.exit(1);
  }

  // Get document language configuration
  const docConfig = DOC_LANGUAGE_CONFIG[options.docLanguage];

  // Validate combination of document language and programming language
  if (docConfig.supportedCodeLanguages && !docConfig.supportedCodeLanguages.includes(options.language)) {
    console.error(`Error: Document language "${options.docLanguage}" does not support programming language "${options.language}"`);
    console.error(`${options.docLanguage} supported programming languages: ${docConfig.supportedCodeLanguages.join(', ')}`);
    process.exit(1);
  }

  // If output path not provided, auto-generate filename
  const outputDir = path.join(projectRoot, 'build', 'epub', 'outputs');
  fs.ensureDirSync(outputDir);

  const outputPath = options.output
    ? path.join(outputDir, path.basename(options.output))
    : path.join(outputDir, `hello-algo_${options.docLanguage}_${options.language}.epub`);

  console.log('Starting document processing...');
  console.log(`Document language: ${options.docLanguage}`);
  console.log(`Programming language: ${options.language}`);
  console.log(`Output file: ${outputPath}`);
  console.log();

  const result = await buildEpub(options.docLanguage, options.language, outputPath, workDir, options.validate);

  if (!result.success) {
    console.error(`Build failed: ${result.error}`);
    process.exit(1);
  }

  if (result.error) {
    console.warn(`⚠️  ${result.error}`);
  }

  console.log('Completed!');
}

main().catch((error) => {
  console.error('An error occurred:', error);
  process.exit(1);
});

