import * as fs from 'fs-extra';
import * as path from 'path';
import { Command } from 'commander';
import { parseMkdocsConfig, flattenNav, readChapterContent } from './parser';
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
  codesDir: string;
  title: string;
  description: string;
  language: string;
  supportedCodeLanguages?: string[]; // 支持的编程语言列表
}

const DOC_LANGUAGE_CONFIG: { [key: string]: DocLanguageConfig } = {
  'zh': {
    mkdocsPath: '../mkdocs.yml',
    docsDir: 'docs',        // 相对于项目根目录
    codesDir: 'codes',      // 相对于项目根目录（支持所有14种语言）
    title: 'Hello 算法',
    description: '动画图解、一键运行的数据结构与算法教程',
    language: 'zh-CN',
    // 中文版支持所有语言
  },
  'zh-hant': {
    mkdocsPath: '../zh-hant/mkdocs.yml',
    docsDir: 'zh-hant/docs',     // 相对于项目根目录
    codesDir: 'zh-hant/codes',   // 相对于项目根目录（支持所有14种语言）
    title: 'Hello 演算法',
    description: '動畫圖解、一鍵執行的資料結構與演算法教程',
    language: 'zh-Hant',
    // 繁体中文版支持所有语言
  },
  'en': {
    mkdocsPath: '../en/mkdocs.yml',
    docsDir: 'en/docs',     // 相对于项目根目录
    codesDir: 'en/codes',   // 相对于项目根目录（仅支持cpp/java/python）
    title: 'Hello Algo',
    description: 'Data Structures and Algorithms Crash Course with Animated Illustrations and Off-the-Shelf Code',
    language: 'en',
    supportedCodeLanguages: ['cpp', 'java', 'python'],
  },
  'ja': {
    mkdocsPath: '../ja/mkdocs.yml',
    docsDir: 'ja/docs',     // 相对于项目根目录
    codesDir: 'ja/codes',   // 相对于项目根目录（仅支持cpp/java/python）
    title: 'Hello アルゴリズム',
    description: 'アニメーションで図解、ワンクリック実行のデータ構造とアルゴリズムチュートリアル',
    language: 'ja',
    supportedCodeLanguages: ['cpp', 'java', 'python'],
  }
};

async function main() {
  // 创建命令行程序
  const program = new Command();
  
  program
    .name('hello-algo-epub')
    .description('将 Hello 算法文档转换为 EPUB 电子书')
    .version('1.0.0')
    .option('-d, --doc-language <lang>', '文档语言 (zh, zh-hant, en, ja)', 'zh')
    .option('-o, --output <path>', '输出 EPUB 文件路径', './hello-algo.epub')
    .option('-l, --language <lang>', `编程语言 (${SUPPORTED_LANGUAGES.join(', ')})`, 'cpp')
    .parse(process.argv);
  
  const options = program.opts();
  
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
  
  // 解析路径（相对于工作目录）
  const workDir = process.cwd();
  
  // 配置文件路径（相对于 epub 目录）
  const mkdocsPath = path.resolve(workDir, docConfig.mkdocsPath);
  const outputPath = path.resolve(workDir, options.output);
  
  // 计算项目根目录
  const repoDir = options.docLanguage === 'zh' 
    ? path.dirname(mkdocsPath)  // zh: mkdocs.yml 在根目录
    : path.dirname(path.dirname(mkdocsPath));  // zh-hant/en/ja: mkdocs.yml 在子目录
  
  // 文档和代码目录（绝对路径）
  const docsDir = path.join(repoDir, docConfig.docsDir);
  const codesDir = path.join(repoDir, docConfig.codesDir);
  
  console.log('开始处理文档...');
  console.log(`文档语言: ${options.docLanguage}`);
  console.log(`编程语言: ${options.language}`);
  console.log(`文档目录: ${docsDir}`);
  console.log(`代码目录: ${codesDir}`);
  console.log(`配置文件: ${mkdocsPath}`);
  console.log(`输出文件: ${outputPath}`);
  
  // 检查目录是否存在
  if (!fs.existsSync(docsDir)) {
    console.error(`错误: 文档目录不存在: ${docsDir}`);
    process.exit(1);
  }

  if (!fs.existsSync(mkdocsPath)) {
    console.error(`错误: 配置文件不存在: ${mkdocsPath}`);
    process.exit(1);
  }

  // 解析配置
  console.log('解析 mkdocs.yml...');
  const nav = parseMkdocsConfig(mkdocsPath);
  
  // 扁平化导航结构
  console.log('提取章节列表...');
  const chapters = flattenNav(nav, docsDir);
  
  console.log(`找到 ${chapters.length} 个章节`);
  
  // 读取章节内容并提取标题
  console.log('读取章节内容...');
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
  console.log(`有效章节数: ${validChapters.length}`);
  console.log(`提取的标题总数: ${allHeadings.length}`);
  
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
    codeLanguage: options.language,
    codesDir: codesDir,  // 传递 codes 目录路径
    docLanguage: options.docLanguage,  // 传递文档语言
  });
  
  // 验证 EPUB 内容完整性
  console.log('\n' + '='.repeat(60));
  console.log('开始验证 EPUB 内容完整性...');
  console.log('='.repeat(60));
  
  const validation = await validateEpubHeadings(outputPath, allHeadings);
  
  if (!validation.success) {
    console.warn('\n⚠️  警告: EPUB 中缺少部分标题');
    console.warn(`缺失标题数: ${validation.missingHeadings.length}\n`);
  } else {
    console.log('\n✅ EPUB 内容验证通过！所有标题都已正确包含。\n');
  }
  
  console.log('完成！');
}

main().catch((error) => {
  console.error('发生错误:', error);
  process.exit(1);
});

