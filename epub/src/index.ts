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

async function main() {
  // 创建命令行程序
  const program = new Command();
  
  program
    .name('hello-algo-epub')
    .description('将 Hello 算法文档转换为 EPUB 电子书')
    .version('1.0.0')
    .option('-c, --config <path>', 'mkdocs 配置文件路径', '../mkdocs.yml')
    .option('-o, --output <path>', '输出 EPUB 文件路径', './hello-algo.epub')
    .option('-l, --language <lang>', `编程语言 (${SUPPORTED_LANGUAGES.join(', ')})`, 'cpp')
    .parse(process.argv);
  
  const options = program.opts();
  
  // 验证语言参数
  if (!SUPPORTED_LANGUAGES.includes(options.language)) {
    console.error(`错误: 不支持的语言 "${options.language}"`);
    console.error(`支持的语言: ${SUPPORTED_LANGUAGES.join(', ')}`);
    process.exit(1);
  }
  
  // 解析路径（相对于工作目录）
  const workDir = process.cwd();
  const mkdocsPath = path.resolve(workDir, options.config);
  const outputPath = path.resolve(workDir, options.output);
  
  // 从 mkdocs 配置文件路径推断项目根目录和文档目录
  const repoDir = path.dirname(mkdocsPath);
  const docsDir = path.join(repoDir, 'docs');
  
  console.log('开始处理文档...');
  console.log(`编程语言: ${options.language}`);
  console.log(`文档目录: ${docsDir}`);
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
  
  // 封面图片路径
  const coverPath = path.join(docsDir, 'assets', 'hero', 'cover_render.png');
  
  // 生成 EPUB
  await generateEpub(validChapters, docsDir, outputPath, {
    title: 'Hello 算法',
    author: 'krahets',
    publisher: 'Hello Algorithm',
    description: '动画图解、一键运行的数据结构与算法教程',
    language: 'zh-CN',
    cover: coverPath,
    codeLanguage: options.language,
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

