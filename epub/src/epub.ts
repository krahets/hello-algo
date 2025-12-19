import * as fs from 'fs-extra';
import * as path from 'path';
import { Chapter, ImageInfo, EpubGenOptions } from './types';
import { markdownToHtml, extractImagePaths, readImage, getCustomCSS } from './markdown';

const Epub = require('epub-gen');

export interface EpubOptions {
  title: string;
  author: string;
  publisher?: string;
  description?: string;
  language?: string;
  cover?: string;
  codeLanguage?: string;  // 代码示例的编程语言
  docLanguage?: string;    // 文档语言 (zh, zh-hant, en, ja)
}

/**
 * 生成 EPUB 电子书
 */
export async function generateEpub(
  chapters: Chapter[],
  docsDir: string,
  outputPath: string,
  options: EpubOptions
): Promise<void> {
  console.log('开始生成 EPUB...');
  
  // 创建临时目录存放图片
  const tempDir = path.join(path.dirname(outputPath), 'temp_images');
  fs.ensureDirSync(tempDir);
  
  // 准备内容
  const content: any[] = [];
  const imageMap: { [original: string]: string } = {};
  let imageIndex = 0;
  
  for (const chapter of chapters) {
    if (!chapter.content) {
      continue;
    }
    
    console.log(`处理章节: ${chapter.title}`);
    
    // 读取章节内容
    const markdown = chapter.content;
    const chapterDir = path.dirname(chapter.path);
    
    // 提取图片并复制到临时目录
    const imagePaths = extractImagePaths(markdown, chapter.path);
    for (const { original, fullPath } of imagePaths) {
      if (!imageMap[original]) {
        // 复制图片到临时目录
        const ext = path.extname(fullPath);
        const newFileName = `img_${imageIndex}${ext}`;
        const tempImagePath = path.join(tempDir, newFileName);
        fs.copyFileSync(fullPath, tempImagePath);
        imageMap[original] = tempImagePath;
        imageIndex++;
      }
      
      // 替换 markdown 中的图片路径为绝对路径（使用 file:// 协议）
      const tempImagePath = imageMap[original];
      chapter.content = chapter.content.replace(
        new RegExp(`!\\[[^\\]]*\\]\\(${escapeRegex(original)}\\)`, 'g'),
        `![${path.basename(fullPath)}](file://${tempImagePath})`
      );
    }
    
    // 直接使用章节标题（MD文档已经自带编号）
    const displayTitle = chapter.title.trim();
    
    // 转换为 HTML
    const codeLanguage = options.codeLanguage || 'cpp';
    const html = markdownToHtml(chapter.content, chapterDir, codeLanguage, options.docLanguage);
    
    content.push({
      title: displayTitle,
      data: html,
      // 不使用 beforeToc，让所有章节按顺序自然排列
      // 章节已经按照 mkdocs.yml 的顺序排列，父章节在前，子章节紧跟其后
      beforeToc: false,
      excludeFromToc: false,
      // 添加层级信息，用于生成嵌套目录
      level: chapter.level,
      parentTitle: chapter.parentTitle,
      number: chapter.number,
    });
  }
  
  // 准备字体文件路径（Math 优先，Main 其次）
  const fontsDir = path.join(__dirname, '..', 'fonts');
  const mathJaxMathPath = path.join(fontsDir, 'MathJax_Math-Regular.otf');
  const mathJaxMainPath = path.join(fontsDir, 'MathJax_Main-Regular.otf');
  const fonts: string[] = [];
  if (fs.existsSync(mathJaxMathPath)) {
    fonts.push(mathJaxMathPath);
  } else {
    console.warn(`警告: 字体文件不存在: ${mathJaxMathPath}`);
  }
  if (fs.existsSync(mathJaxMainPath)) {
    fonts.push(mathJaxMainPath);
  } else {
    console.warn(`警告: 字体文件不存在: ${mathJaxMainPath}`);
  }
  
  // 准备 EPUB 选项
  const epubOptions: EpubGenOptions = {
    title: options.title,
    author: options.author,
    publisher: options.publisher || 'Hello Algorithm',
    description: options.description || '动画图解、一键运行的数据结构与算法教程',
    language: options.language || 'zh-CN',
    content: content,
    verbose: true,
    // 禁用自动添加章节标题（我们在 Markdown 中已经处理了）
    appendChapterTitles: false,
    // 使用自定义模板来生成嵌套目录
    customNcxTocTemplatePath: path.join(__dirname, '..', 'templates', 'toc.ncx.ejs'),
    customHtmlTocTemplatePath: path.join(__dirname, '..', 'templates', 'toc.xhtml.ejs'),
    // 注入自定义 CSS
    css: getCustomCSS(),
    // 设置封面
    cover: options.cover,
    // 添加字体文件
    fonts: fonts,
  };
  
  // 生成 EPUB
  try {
    epubOptions.output = outputPath;
    const epub = new Epub(epubOptions);
    await epub.promise;
    console.log(`EPUB 生成成功: ${outputPath}`);
    
    // 清理临时目录
    fs.removeSync(tempDir);
  } catch (error) {
    console.error('生成 EPUB 时出错:', error);
    // 清理临时目录
    fs.removeSync(tempDir);
    throw error;
  }
}

function escapeRegex(str: string): string {
  return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

