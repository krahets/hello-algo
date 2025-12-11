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
    
    // 转换为 HTML
    const html = markdownToHtml(chapter.content, chapterDir);
    
    // 构建带编号的标题，保持 mkdocs.yml 中的层级关系
    let displayTitle = chapter.title;
    
    // 如果标题已经包含"第 X 章"，说明是 index.md 使用了父标题，直接使用
    if (chapter.title.match(/第\s*\d+\s*章/)) {
      displayTitle = chapter.title.replace(/\s+/g, ' ').trim(); // 清理多余空格
    } else if (chapter.number !== undefined && chapter.number !== '') {
      // 根据层级决定编号格式
      if (chapter.level === 0) {
        // 顶级章节：第 X 章 标题（如果标题中没有"第 X 章"）
        displayTitle = `第 ${chapter.number} 章 ${chapter.title}`;
      } else if (chapter.level === 1) {
        // 子章节：X.Y 标题
        displayTitle = `${chapter.number} ${chapter.title}`;
      }
    }
    
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
  
  // 准备 EPUB 选项
  const epubOptions: EpubGenOptions = {
    title: options.title,
    author: options.author,
    publisher: options.publisher || 'Hello Algorithm',
    description: options.description || '动画图解、一键运行的数据结构与算法教程',
    language: options.language || 'zh-CN',
    content: content,
    verbose: true,
    // 使用自定义模板来生成嵌套目录
    customNcxTocTemplatePath: path.join(__dirname, '..', 'templates', 'toc.ncx.ejs'),
    customHtmlTocTemplatePath: path.join(__dirname, '..', 'templates', 'toc.xhtml.ejs'),
    // 注入自定义 CSS
    css: getCustomCSS(),
    // 设置封面
    cover: options.cover,
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

