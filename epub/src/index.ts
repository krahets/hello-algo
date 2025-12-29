import * as fs from 'fs-extra';
import * as path from 'path';
import { execSync } from 'child_process';
import { Command } from 'commander';
import { parseMkdocsConfig, flattenNav, readChapterContent, parseVersion } from './parser';
import { generateEpub } from './epub';
import { Chapter, HeadingInfo } from './types';
import { extractHeadings } from './markdown';
import { validateEpubHeadings } from './validator';

// 支持的编程语言列表
const SUPPORTED_LANGUAGES = [
  'cpp', 'python', 'java', 'csharp', 'go', 'swift', 
  'javascript', 'typescript', 'dart', 'rust', 'c', 
  'kotlin', 'ruby', 'zig'
];

// 文档语言配置
interface DocLanguageConfig {
  mkdocsPath: string;
  docsDir: string;
  title: string;
  description: string;
  language: string;
  supportedCodeLanguages?: string[]; // 支持的编程语言列表
}

/**
 * 生成输出文件名
 */
function generateOutputFilename(version: string, docLanguage: string, codeLanguage: string, workDir: string): string {
  const filename = `hello-algo_${version}_${docLanguage}_${codeLanguage}.epub`;
  return path.resolve(workDir, filename);
}

/**
 * 获取git仓库的remote URL
 */
function getGitRemoteUrl(): string {
  try {
    const url = execSync('git remote get-url origin', { encoding: 'utf-8', cwd: process.cwd() }).trim();
    return url;
  } catch (error) {
    console.error('错误: 无法获取git remote URL');
    console.error('请确保当前目录是一个git仓库，或者手动指定仓库URL');
    throw error;
  }
}

/**
 * 递归拷贝目录，跳过已存在的文件
 */
function copyDirectoryRecursive(src: string, dest: string): void {
  if (!fs.existsSync(src)) {
    return;
  }
  
  const stat = fs.statSync(src);
  
  if (stat.isDirectory()) {
    // 确保目标目录存在
    fs.ensureDirSync(dest);
    
    // 读取源目录的所有内容
    const entries = fs.readdirSync(src);
    
    for (const entry of entries) {
      const srcPath = path.join(src, entry);
      const destPath = path.join(dest, entry);
      
      const entryStat = fs.statSync(srcPath);
      
      if (entryStat.isDirectory()) {
        // 递归处理子目录
        copyDirectoryRecursive(srcPath, destPath);
      } else {
        // 拷贝文件，如果目标不存在
        if (!fs.existsSync(destPath)) {
          fs.copyFileSync(srcPath, destPath);
        }
      }
    }
  } else {
    // 如果是文件，直接拷贝（如果目标不存在）
    if (!fs.existsSync(dest)) {
      fs.copyFileSync(src, dest);
    }
  }
}

/**
 * 准备docs分支的工作目录
 * 1. Clone docs分支到build/epub目录
 * 2. 拷贝必要的文件和目录（跳过已存在的文件）
 */
async function prepareDocsBranch(): Promise<string> {
  // 获取项目根目录（假设从epub目录运行，或者当前目录就是项目根）
  const currentDir = process.cwd();
  let projectRoot: string;
  
  // 如果当前目录是epub目录，向上找项目根
  if (path.basename(currentDir) === 'epub') {
    projectRoot = path.dirname(currentDir);
  } else {
    // 否则认为当前目录就是项目根
    projectRoot = currentDir;
  }
  
  const buildEpubDir = path.join(projectRoot, 'build', 'epub');
  
  console.log('准备docs分支工作目录...');
  console.log(`项目根目录: ${projectRoot}`);
  console.log(`目标目录: ${buildEpubDir}`);
  
  // 创建build目录（如果不存在）
  const buildDir = path.join(projectRoot, 'build');
  fs.ensureDirSync(buildDir);
  
  // 获取git仓库URL
  const repoUrl = getGitRemoteUrl();
  
  // 检查build/epub目录是否已存在
  if (fs.existsSync(buildEpubDir)) {
    const gitDir = path.join(buildEpubDir, '.git');
    
    // 检查是否是git仓库
    if (fs.existsSync(gitDir)) {
      console.log('检测到已存在的git仓库，使用git pull更新...');
      try {
        // 先切换到docs分支（如果不在docs分支上）
        execSync('git checkout docs', {
          stdio: 'inherit',
          cwd: buildEpubDir
        });
        
        // 执行git pull更新
        execSync('git pull', {
          stdio: 'inherit',
          cwd: buildEpubDir
        });
        
        console.log('✓ docs分支更新完成');
      } catch (error) {
        console.error('错误: git pull更新失败，尝试重新clone...');
        // 如果pull失败，删除目录并重新clone
        fs.removeSync(buildEpubDir);
        // 继续执行下面的clone逻辑
      }
    } else {
      // 如果目录存在但不是git仓库，删除并重新clone
      console.log('检测到已存在的目录但不是git仓库，删除并重新clone...');
      fs.removeSync(buildEpubDir);
    }
  }
  
  // 如果目录不存在或已被删除，执行clone
  if (!fs.existsSync(buildEpubDir)) {
    try {
      console.log(`正在clone docs分支: ${repoUrl}`);
      console.log(`目标: ${buildEpubDir}`);
      
      // 执行git clone，使用浅克隆以提高速度
      execSync(`git clone --branch docs --depth 1 "${repoUrl}" "${buildEpubDir}"`, {
        stdio: 'inherit',
        cwd: projectRoot
      });
      
      console.log('✓ docs分支clone完成');
    } catch (error) {
      console.error('错误: clone docs分支失败');
      throw error;
    }
  }
  
  // 需要拷贝的文件和目录列表
  const itemsToCopy = ['mkdocs.yml', 'docs', 'en', 'ja', 'overrides', 'zh-hant'];
  
  console.log('\n开始拷贝文件...');
  
  for (const item of itemsToCopy) {
    const sourcePath = path.join(projectRoot, item);
    const targetPath = path.join(buildEpubDir, item);
    
    // 检查源文件/目录是否存在
    if (!fs.existsSync(sourcePath)) {
      console.log(`⚠️  跳过 ${item}（源文件不存在）`);
      continue;
    }
    
    try {
      const stat = fs.statSync(sourcePath);
      
      if (stat.isDirectory()) {
        // 对于目录，递归拷贝，跳过已存在的文件
        copyDirectoryRecursive(sourcePath, targetPath);
        console.log(`✓ 拷贝目录: ${item}`);
      } else {
        // 对于文件，如果目标不存在则拷贝
        if (!fs.existsSync(targetPath)) {
          fs.copyFileSync(sourcePath, targetPath);
          console.log(`✓ 拷贝文件: ${item}`);
        } else {
          console.log(`⊘ 跳过 ${item}（目标文件已存在）`);
        }
      }
    } catch (error) {
      console.error(`⚠️  拷贝 ${item} 时出错:`, error instanceof Error ? error.message : String(error));
      // 继续处理其他文件
    }
  }
  
  console.log('\n✓ 文件拷贝完成');
  console.log(`工作目录: ${buildEpubDir}\n`);
  
  return buildEpubDir;
}

const DOC_LANGUAGE_CONFIG: { [key: string]: DocLanguageConfig } = {
  'zh': {
    mkdocsPath: 'mkdocs.yml',
    docsDir: 'docs',        // 相对于项目根目录
    title: 'Hello 算法',
    description: '动画图解、一键运行的数据结构与算法教程',
    language: 'zh-CN',
    // 中文版支持所有语言
  },
  'zh-hant': {
    mkdocsPath: 'zh-hant/mkdocs.yml',
    docsDir: 'zh-hant/docs',     // 相对于项目根目录
    title: 'Hello 演算法',
    description: '動畫圖解、一鍵執行的資料結構與演算法教程',
    language: 'zh-Hant',
    // 繁体中文版支持所有语言
  },
  'en': {
    mkdocsPath: 'en/mkdocs.yml',
    docsDir: 'en/docs',     // 相对于项目根目录
    title: 'Hello Algo',
    description: 'Data Structures and Algorithms Crash Course with Animated Illustrations and Off-the-Shelf Code',
    language: 'en',
    supportedCodeLanguages: ['cpp', 'java', 'python'],
  },
  'ja': {
    mkdocsPath: 'ja/mkdocs.yml',
    docsDir: 'ja/docs',     // 相对于项目根目录
    title: 'Hello アルゴリズム',
    description: 'アニメーションで図解、ワンクリック実行のデータ構造とアルゴリズムチュートリアル',
    language: 'ja',
    supportedCodeLanguages: ['cpp', 'java', 'python'],
  }
};

/**
 * 构建单个 EPUB 文件
 */
async function buildEpub(
  docLanguage: string,
  codeLanguage: string,
  outputPath: string,
  workDir: string,
  validate: boolean = false
): Promise<{ success: boolean; error?: string }> {
  try {
    // 获取文档语言配置
    const docConfig = DOC_LANGUAGE_CONFIG[docLanguage];
    if (!docConfig) {
      return { success: false, error: `不支持的文档语言: ${docLanguage}` };
    }
    
    // 验证编程语言是否被该文档语言支持
    if (docConfig.supportedCodeLanguages && !docConfig.supportedCodeLanguages.includes(codeLanguage)) {
      return { success: false, error: `文档语言 "${docLanguage}" 不支持编程语言 "${codeLanguage}"` };
    }
    
    // 配置文件路径（workDir现在是项目根目录）
    const mkdocsPath = path.resolve(workDir, docConfig.mkdocsPath);
    
    // 计算项目根目录（workDir就是项目根目录）
    const repoDir = workDir;
    
    // 文档目录（绝对路径）
    const docsDir = path.join(repoDir, docConfig.docsDir);
    
    // 检查目录是否存在
    if (!fs.existsSync(docsDir)) {
      return { success: false, error: `文档目录不存在: ${docsDir}` };
    }

    if (!fs.existsSync(mkdocsPath)) {
      return { success: false, error: `配置文件不存在: ${mkdocsPath}` };
    }

    // 解析配置
    const nav = parseMkdocsConfig(mkdocsPath);
    const version = parseVersion(mkdocsPath);
    
    // 扁平化导航结构
    const chapters = flattenNav(nav, docsDir);
    
    // 读取章节内容并提取标题
    const allHeadings: HeadingInfo[] = [];
    
    for (const chapter of chapters) {
      chapter.content = readChapterContent(chapter);
      
      // 提取该章节的所有标题
      if (chapter.content.trim().length > 0) {
        const headings = extractHeadings(chapter.content, chapter.path);
        allHeadings.push(...headings);
      }
    }
    
    // 过滤掉空内容
    const validChapters = chapters.filter(ch => ch.content.trim().length > 0);
    
    // 封面图片路径（始终使用主文档目录的封面）
    const mainDocsDir = path.join(repoDir, 'docs');
    const coverPath = path.join(mainDocsDir, 'assets', 'hero', 'cover_render.png');
    
    // 生成 EPUB
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
    
    // 验证 EPUB 内容完整性（仅在启用时执行）
    if (validate) {
      const validation = await validateEpubHeadings(outputPath, allHeadings);
      
      if (!validation.success) {
        return { success: true, error: `验证警告: 缺失 ${validation.missingHeadings.length} 个标题` };
      }
    }
    
    return { success: true };
  } catch (error) {
    return { success: false, error: error instanceof Error ? error.message : String(error) };
  }
}

async function main() {
  // 创建命令行程序
  const program = new Command();
  
  program
    .name('hello-algo-epub')
    .description('将 Hello 算法文档转换为 EPUB 电子书')
    .version('1.0.0')
    .option('-d, --doc-language <lang>', '文档语言 (zh, zh-hant, en, ja)', 'zh')
    .option('-o, --output <path>', '输出 EPUB 文件路径')
    .option('-l, --language <lang>', `编程语言 (${SUPPORTED_LANGUAGES.join(', ')})`, 'cpp')
    .option('-a, --all', '构建所有文档语言和编程语言的组合版本')
    .option('--release-version <version>', '版本号（用于生成输出文件名）', '1.0.0')
    .option('--validate', '启用 EPUB 内容完整性验证', false)
    .parse(process.argv);
  
  const options = program.opts();
  
  // 准备docs分支工作目录
  let workDir: string;
  try {
    workDir = await prepareDocsBranch();
  } catch (error) {
    console.error('准备docs分支工作目录失败:', error instanceof Error ? error.message : String(error));
    process.exit(1);
  }
  
  // 如果使用 --all，执行批量构建
  if (options.all) {
    // 验证：不能同时使用 --all 和其他选项
    // 检查命令行参数中是否显式提供了这些选项
    const args = process.argv;
    const hasDocLanguage = args.includes('-d') || args.includes('--doc-language');
    const hasLanguage = args.includes('-l') || args.includes('--language');
    const hasOutput = args.includes('-o') || args.includes('--output');
    
    if (hasDocLanguage || hasLanguage || hasOutput) {
      console.error('错误: 使用 --all 时不能同时指定 --doc-language、--language 或 --output');
      console.error('请使用 --release-version 选项指定版本号');
      process.exit(1);
    }
    
    const version = options.releaseVersion || '1.0.0';
    
    // 生成所有组合
    const builds: Array<{ docLanguage: string; codeLanguage: string }> = [];
    
    for (const docLang of Object.keys(DOC_LANGUAGE_CONFIG)) {
      const docConfig = DOC_LANGUAGE_CONFIG[docLang];
      const codeLangs = docConfig.supportedCodeLanguages || SUPPORTED_LANGUAGES;
      
      for (const codeLang of codeLangs) {
        builds.push({ docLanguage: docLang, codeLanguage: codeLang });
      }
    }
    
    console.log(`开始批量构建 ${builds.length} 个 EPUB 文件...`);
    console.log(`版本号: ${version}\n`);
    
    const results: Array<{ docLanguage: string; codeLanguage: string; success: boolean; error?: string; outputPath: string }> = [];
    
    for (let i = 0; i < builds.length; i++) {
      const { docLanguage, codeLanguage } = builds[i];
      const outputPath = generateOutputFilename(version, docLanguage, codeLanguage, workDir);
      
      console.log(`[${i + 1}/${builds.length}] 正在构建: ${docLanguage}-${codeLanguage}`);
      
      const result = await buildEpub(docLanguage, codeLanguage, outputPath, workDir, options.validate);
      
      if (result.success) {
        console.log(`  ✅ 成功: ${path.basename(outputPath)}`);
        if (result.error) {
          console.log(`  ⚠️  ${result.error}`);
        }
      } else {
        console.log(`  ❌ 失败: ${result.error}`);
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
    
    // 显示统计信息
    const successCount = results.filter(r => r.success).length;
    const failCount = results.length - successCount;
    
    console.log('='.repeat(60));
    console.log('构建完成！');
    console.log(`成功: ${successCount}/${results.length}`);
    console.log(`失败: ${failCount}/${results.length}`);
    console.log('='.repeat(60));
    
    if (failCount > 0) {
      console.log('\n失败的构建:');
      results.filter(r => !r.success).forEach(r => {
        console.log(`  - ${r.docLanguage}-${r.codeLanguage}: ${r.error}`);
      });
      process.exit(1);
    }
    
    return;
  }
  
  // 单个构建逻辑
  // 验证文档语言参数
  const supportedDocLanguages = Object.keys(DOC_LANGUAGE_CONFIG);
  if (!supportedDocLanguages.includes(options.docLanguage)) {
    console.error(`错误: 不支持的文档语言 "${options.docLanguage}"`);
    console.error(`支持的文档语言: ${supportedDocLanguages.join(', ')}`);
    process.exit(1);
  }
  
  // 验证编程语言参数
  if (!SUPPORTED_LANGUAGES.includes(options.language)) {
    console.error(`错误: 不支持的编程语言 "${options.language}"`);
    console.error(`支持的编程语言: ${SUPPORTED_LANGUAGES.join(', ')}`);
    process.exit(1);
  }
  
  // 获取文档语言配置
  const docConfig = DOC_LANGUAGE_CONFIG[options.docLanguage];
  
  // 验证文档语言和编程语言的组合
  if (docConfig.supportedCodeLanguages && !docConfig.supportedCodeLanguages.includes(options.language)) {
    console.error(`错误: 文档语言 "${options.docLanguage}" 不支持编程语言 "${options.language}"`);
    console.error(`${options.docLanguage} 支持的编程语言: ${docConfig.supportedCodeLanguages.join(', ')}`);
    process.exit(1);
  }
  
  // 如果没有提供输出路径，则自动生成文件名：hello-algo_{docLang}_{codeLang}.epub
  const outputPath = options.output 
    ? path.resolve(workDir, options.output)
    : path.resolve(workDir, `hello-algo_${options.docLanguage}_${options.language}.epub`);
  
  console.log('开始处理文档...');
  console.log(`文档语言: ${options.docLanguage}`);
  console.log(`编程语言: ${options.language}`);
  console.log(`输出文件: ${outputPath}`);
  console.log();
  
  const result = await buildEpub(options.docLanguage, options.language, outputPath, workDir, options.validate);
  
  if (!result.success) {
    console.error(`构建失败: ${result.error}`);
    process.exit(1);
  }
  
  if (result.error) {
    console.warn(`⚠️  ${result.error}`);
  }
  
  console.log('完成！');
}

main().catch((error) => {
  console.error('发生错误:', error);
  process.exit(1);
});

