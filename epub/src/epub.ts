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
  version?: string;        // 版本号
}

/**
 * 根据文档语言获取目录标题
 */
function getTocTitle(docLanguage?: string): string {
  const tocTitles: { [key: string]: string } = {
    'zh': '目录',
    'zh-hant': '目錄',
    'en': 'Table of Contents',
    'ja': '目次',
  };
  return tocTitles[docLanguage || 'zh'] || '目录';
}

/**
 * 生成首页 HTML
 */
function generateTitlePage(title: string, author: string, docLanguage?: string, version?: string): string {
  const lang = docLanguage || 'zh';

  // 多语言文本配置
  const i18n: { [key: string]: { subtitle: string; authorPrefix: string; authorName: string; readOnline: string; codeRepo: string; versionPrefix: string } } = {
    'zh': {
      subtitle: '动画图解、一键运行的数据结构与算法教程',
      authorPrefix: '作者：',
      authorName: '靳宇栋 (@krahets)',
      readOnline: '在线阅读',
      codeRepo: '代码仓库',
      versionPrefix: '版本',
    },
    'zh-hant': {
      subtitle: '動畫圖解、一鍵運行的資料結構與演算法教程',
      authorPrefix: '作者：',
      authorName: '靳宇棟 (@krahets)',
      readOnline: '線上閱讀',
      codeRepo: '程式碼倉庫',
      versionPrefix: '版本',
    },
    'en': {
      subtitle: 'Data structures and algorithms crash course with animated illustrations and off-the-shelf code',
      authorPrefix: 'Author: ',
      authorName: 'Yudong Jin (@krahets)',
      readOnline: 'Read Online',
      codeRepo: 'Code Repository',
      versionPrefix: 'Version',
    },
    'ja': {
      subtitle: 'アニメーション図解、ワンクリック実行のデータ構造とアルゴリズム教程',
      authorPrefix: '著者：',
      authorName: '靳宇棟 (@krahets)',
      readOnline: 'オンライン閲覧',
      codeRepo: 'コードリポジトリ',
      versionPrefix: 'バージョン',
    },
  };

  const text = i18n[lang] || i18n['zh'];
  const versionText = version ? `${text.versionPrefix} ${version}` : '';

  return `
    <div style="text-align: center; padding: 40px 20px 30px 20px;">
      <h1 style="font-size: 2.2em; margin-bottom: 0.2em; color: #24292e; font-weight: 700; text-align: center;">Hello 算法</h1>

      <p style="font-size: 0.9em; margin: 0.3em 0 1.5em 0; color: #666;">${text.subtitle}</p>

      <p style="font-size: 1em; margin: 1.2em 0 0.8em 0; color: #555;">${text.authorPrefix}${text.authorName}</p>

      ${versionText ? `<p style="font-size: 0.85em; margin: 0.5em 0; color: #888;">${versionText}</p>` : ''}

      <div style="margin: 0.8em auto; padding: 0.6em 1.2em; background-color: #f8f9fa; border-radius: 8px; display: inline-block; max-width: 70%;">
        <p style="font-size: 0.9em; margin: 0.6em 0; color: #333;">
          <strong>${text.readOnline}</strong><br/>
          <a href="https://www.hello-algo.com" style="color: #1581CB; text-decoration: none;">www.hello-algo.com</a>
        </p>
        <p style="font-size: 0.9em; margin: 0.6em 0; color: #333;">
          <strong>${text.codeRepo}</strong><br/>
          <a href="https://github.com/krahets/hello-algo" style="color: #1581CB; text-decoration: none;">github.com/krahets/hello-algo</a>
        </p>
      </div>
    </div>
  `;
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

  // 添加首页（在目录之前）
  const titlePageTitles: { [key: string]: string } = {
    'zh': '首页',
    'zh-hant': '首頁',
    'en': 'Home',
    'ja': 'ホーム',
  };
  const titlePageTitle = titlePageTitles[options.docLanguage || 'zh'] || '首页';

  content.push({
    title: titlePageTitle,
    data: generateTitlePage(options.title, options.author, options.docLanguage, options.version),
    beforeToc: true,  // 在目录之前
    excludeFromToc: false,  // 包含在目录中
    level: 0,
    number: '',
  });

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
    const html = markdownToHtml(chapter.content, chapterDir, codeLanguage, options.docLanguage, chapter.path);
    
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
  
  // 准备字体文件路径
  const fontsDir = path.join(__dirname, '..', 'fonts');
  const fonts: string[] = [];

  // 添加数学字体（所有版本共用）
  const mathJaxMathPath = path.join(fontsDir, 'MathJax_Math-Regular.otf');
  const mathJaxMainPath = path.join(fontsDir, 'MathJax_Main-Regular.otf');

  // 添加代码字体（所有版本共用）
  const jetbrainsMonoPath = path.join(fontsDir, 'JetBrainsMonoNerdFont-Regular.ttf');

  // 根据文档语言选择正文字体
  const docLang = options.docLanguage || 'zh';
  let serifFontPath: string | null = null;
  let serifItalicFontPath: string | null = null;

  if (docLang === 'zh' || docLang === 'zh-hant') {
    // 中文版使用 Noto Serif SC
    serifFontPath = path.join(fontsDir, 'NotoSerifSC-VariableFont_wght.ttf');
  } else if (docLang === 'en') {
    // 英文版使用 Roboto Serif
    serifFontPath = path.join(fontsDir, 'RobotoSerif-VariableFont_GRAD,opsz,wdth,wght.ttf');
    serifItalicFontPath = path.join(fontsDir, 'RobotoSerif-Italic-VariableFont_GRAD,opsz,wdth,wght.ttf');
  } else if (docLang === 'ja') {
    // 日文版使用 Noto Serif JP
    serifFontPath = path.join(fontsDir, 'NotoSerifJP-VariableFont_wght.ttf');
  }

  // 添加数学字体
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

  // 添加正文字体
  if (serifFontPath && fs.existsSync(serifFontPath)) {
    fonts.push(serifFontPath);
  } else if (serifFontPath) {
    console.warn(`警告: 字体文件不存在: ${serifFontPath}`);
  }

  // 添加斜体字体（如果有）
  if (serifItalicFontPath && fs.existsSync(serifItalicFontPath)) {
    fonts.push(serifItalicFontPath);
  } else if (serifItalicFontPath) {
    console.warn(`警告: 字体文件不存在: ${serifItalicFontPath}`);
  }

  // 添加代码字体
  if (fs.existsSync(jetbrainsMonoPath)) {
    fonts.push(jetbrainsMonoPath);
  } else {
    console.warn(`警告: 字体文件不存在: ${jetbrainsMonoPath}`);
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
    // 注入自定义 CSS（根据文档语言）
    css: getCustomCSS(options.docLanguage),
    // 设置封面
    cover: options.cover,
    // 添加字体文件
    fonts: fonts,
    // 根据文档语言设置目录标题
    tocTitle: getTocTitle(options.docLanguage),
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

