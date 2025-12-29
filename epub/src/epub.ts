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
  codeLanguage?: string;  // Programming language for code examples
  docLanguage?: string;    // Document language (zh, zh-hant, en, ja)
  version?: string;        // Version number
}

/**
 * Get table of contents title based on document language
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
 * Generate homepage HTML
 */
function generateTitlePage(title: string, author: string, docLanguage?: string, version?: string, codeLanguage?: string): string {
  const lang = docLanguage || 'zh';

  // Code reviewer mapping by language and document language
  const codeReviewers: { [docLang: string]: { [codeLang: string]: string } } = {
    'zh': {
      'python': '靳宇栋（@krahets）',
      'cpp': '宫兰景（@Gonglja）',
      'java': '靳宇栋（@krahets）',
      'csharp': '@hpstory',
      'go': '刘代富（@Reanon）',
      'swift': '@nuomi1',
      'javascript': '谢发 (@justin-tse)',
      'typescript': '谢发 (@justin-tse)',
      'dart': '刘玉新（@gvenusleo）',
      'rust': '伍志豪（@night-cruise）、荣怡（@rongyi）',
      'c': '宫兰景（@Gonglja）',
      'ruby': '阮春科秀（@khoaxuantu）',
      'kotlin': '陈东辉（@curtishd）',
    },
    'zh-hant': {
      'python': '靳宇棟（@krahets）',
      'cpp': '宮蘭景（@Gonglja）',
      'java': '靳宇棟（@krahets）',
      'csharp': '@hpstory',
      'go': '劉代富（@Reanon）',
      'swift': '@nuomi1',
      'javascript': '謝發 (@justin-tse)',
      'typescript': '謝發 (@justin-tse)',
      'dart': '劉玉新（@gvenusleo）',
      'rust': '伍志豪（@night-cruise）、榮怡（@rongyi）',
      'c': '宮蘭景（@Gonglja）',
      'ruby': '阮春科秀（@khoaxuantu）',
      'kotlin': '陳東輝（@curtishd）',
    },
    'en': {
      'python': 'Yudong Jin (@krahets)',
      'cpp': 'Lanjing Gong (@Gonglja)',
      'java': 'Yudong Jin (@krahets)',
      'csharp': '@hpstory',
      'go': 'Daifu Liu (@Reanon)',
      'swift': '@nuomi1',
      'javascript': 'Fa Xie (@justin-tse)',
      'typescript': 'Fa Xie (@justin-tse)',
      'dart': 'Yuxin Liu (@gvenusleo)',
      'rust': 'Zhihao Wu (@night-cruise), Yi Rong (@rongyi)',
      'c': 'Lanjing Gong (@Gonglja)',
      'ruby': 'Chunke Xiu Ruan (@khoaxuantu)',
      'kotlin': 'Donghui Chen (@curtishd)',
    },
    'ja': {
      'python': '靳宇棟（@krahets）',
      'cpp': '宮蘭景（@Gonglja）',
      'java': '靳宇棟（@krahets）',
      'csharp': '@hpstory',
      'go': '劉代富（@Reanon）',
      'swift': '@nuomi1',
      'javascript': '謝発 (@justin-tse)',
      'typescript': '謝発 (@justin-tse)',
      'dart': '劉玉新（@gvenusleo）',
      'rust': '伍志豪（@night-cruise）、栄怡（@rongyi）',
      'c': '宮蘭景（@Gonglja）',
      'ruby': '阮春科秀（@khoaxuantu）',
      'kotlin': '陳東輝（@curtishd）',
    },
  };

  // Multilingual text configuration
  const i18n: { [key: string]: { subtitle: string; authorPrefix: string; authorName: string; codeReviewPrefix: string; readOnline: string; codeRepo: string; versionPrefix: string } } = {
    'zh': {
      subtitle: '动画图解、一键运行的数据结构与算法教程',
      authorPrefix: '作者：',
      authorName: '靳宇栋 (@krahets)',
      codeReviewPrefix: '代码审阅：',
      readOnline: '在线阅读',
      codeRepo: '代码仓库',
      versionPrefix: '版本',
    },
    'zh-hant': {
      subtitle: '動畫圖解、一鍵運行的資料結構與演算法教程',
      authorPrefix: '作者：',
      authorName: '靳宇棟 (@krahets)',
      codeReviewPrefix: '程式碼審閱：',
      readOnline: '線上閱讀',
      codeRepo: '程式碼倉庫',
      versionPrefix: '版本',
    },
    'en': {
      subtitle: 'Data structures and algorithms crash course with animated illustrations and off-the-shelf code',
      authorPrefix: 'Author: ',
      authorName: 'Yudong Jin (@krahets)',
      codeReviewPrefix: 'Code Review: ',
      readOnline: 'Read Online',
      codeRepo: 'Code Repository',
      versionPrefix: 'Version',
    },
    'ja': {
      subtitle: 'アニメーション図解、ワンクリック実行のデータ構造とアルゴリズム教程',
      authorPrefix: '著者：',
      authorName: '靳宇棟 (@krahets)',
      codeReviewPrefix: 'コードレビュー：',
      readOnline: 'オンライン閲覧',
      codeRepo: 'コードリポジトリ',
      versionPrefix: 'バージョン',
    },
  };

  const text = i18n[lang] || i18n['zh'];
  const versionText = version ? `${text.versionPrefix} ${version}` : '';
  const codeReviewer = codeLanguage && codeReviewers[lang] && codeReviewers[lang][codeLanguage]
    ? codeReviewers[lang][codeLanguage]
    : '';

  return `
    <div style="text-align: center; padding: 40px 20px 30px 20px;">
      <h1 style="font-size: 2.2em; margin-bottom: 0.2em; color: #24292e; font-weight: 700; text-align: center;">Hello 算法</h1>

      <p style="font-size: 0.9em; margin: 0.3em 0 1.5em 0; color: #666;">${text.subtitle}</p>

      <p style="font-size: 1em; margin: 1.2em 0 0.3em 0; color: #555;">${text.authorPrefix}${text.authorName}</p>

      ${codeReviewer ? `<p style="font-size: 1em; margin: 0.3em 0 0.8em 0; color: #555;">${text.codeReviewPrefix}${codeReviewer}</p>` : ''}

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
 * Generate EPUB e-book
 */
export async function generateEpub(
  chapters: Chapter[],
  docsDir: string,
  outputPath: string,
  options: EpubOptions
): Promise<void> {
  console.log('Starting EPUB generation...');

  // Create temporary directory for images
  const tempDir = path.join(path.dirname(outputPath), 'temp_images');
  fs.ensureDirSync(tempDir);
  
  // Prepare content
  const content: any[] = [];
  const imageMap: { [original: string]: string } = {};
  let imageIndex = 0;

  // Add homepage (before table of contents)
  const titlePageTitles: { [key: string]: string } = {
    'zh': '首页',
    'zh-hant': '首頁',
    'en': 'Home',
    'ja': 'ホーム',
  };
  const titlePageTitle = titlePageTitles[options.docLanguage || 'zh'] || '首页';

  content.push({
    title: titlePageTitle,
    data: generateTitlePage(options.title, options.author, options.docLanguage, options.version, options.codeLanguage),
    beforeToc: true,  // Before table of contents
    excludeFromToc: false,  // Include in table of contents
    level: 0,
    number: '',
  });

  for (const chapter of chapters) {
    if (!chapter.content) {
      continue;
    }
    
    console.log(`Processing chapter: ${chapter.title}`);

    // Read chapter content
    const markdown = chapter.content;
    const chapterDir = path.dirname(chapter.path);
    
    // Extract images and copy to temporary directory
    const imagePaths = extractImagePaths(markdown, chapter.path);
    for (const { original, fullPath } of imagePaths) {
      if (!imageMap[original]) {
        // Copy image to temporary directory
        const ext = path.extname(fullPath);
        const newFileName = `img_${imageIndex}${ext}`;
        const tempImagePath = path.join(tempDir, newFileName);
        fs.copyFileSync(fullPath, tempImagePath);
        imageMap[original] = tempImagePath;
        imageIndex++;
      }
      
      // Replace image paths in markdown with absolute paths (using file:// protocol)
      const tempImagePath = imageMap[original];
      chapter.content = chapter.content.replace(
        new RegExp(`!\\[[^\\]]*\\]\\(${escapeRegex(original)}\\)`, 'g'),
        `![${path.basename(fullPath)}](file://${tempImagePath})`
      );
    }
    
    // Use chapter title directly (MD documents already have numbering)
    const displayTitle = chapter.title.trim();
    
    // Convert to HTML
    const codeLanguage = options.codeLanguage || 'cpp';
    const html = markdownToHtml(chapter.content, chapterDir, codeLanguage, options.docLanguage, chapter.path);
    
    content.push({
      title: displayTitle,
      data: html,
      // Do not use beforeToc, let all chapters arrange naturally in order
      // Chapters are already arranged according to mkdocs.yml order, parent chapters first, child chapters follow
      beforeToc: false,
      excludeFromToc: false,
      // Add level information for generating nested table of contents
      level: chapter.level,
      parentTitle: chapter.parentTitle,
      number: chapter.number,
    });
  }
  
  // Prepare font file paths
  const fontsDir = path.join(__dirname, '..', 'fonts');
  const fonts: string[] = [];

  // Add math fonts (shared by all versions)
  const mathJaxMathPath = path.join(fontsDir, 'MathJax_Math-Regular.otf');
  const mathJaxMainPath = path.join(fontsDir, 'MathJax_Main-Regular.otf');

  // Add code font (shared by all versions)
  const jetbrainsMonoPath = path.join(fontsDir, 'JetBrainsMonoNerdFont-Regular.ttf');

  // Select body font based on document language
  const docLang = options.docLanguage || 'zh';
  let serifFontPath: string | null = null;
  let serifItalicFontPath: string | null = null;

  if (docLang === 'zh' || docLang === 'zh-hant') {
    // Chinese version uses Noto Serif SC Regular
    serifFontPath = path.join(fontsDir, 'NotoSerifSC-Regular.ttf');
  } else if (docLang === 'en') {
    // English version uses Roboto Serif
    serifFontPath = path.join(fontsDir, 'RobotoSerif-VariableFont_GRAD,opsz,wdth,wght.ttf');
    serifItalicFontPath = path.join(fontsDir, 'RobotoSerif-Italic-VariableFont_GRAD,opsz,wdth,wght.ttf');
  } else if (docLang === 'ja') {
    // Japanese version uses Noto Serif JP
    serifFontPath = path.join(fontsDir, 'NotoSerifJP-VariableFont_wght.ttf');
  }

  // Add math fonts
  if (fs.existsSync(mathJaxMathPath)) {
    fonts.push(mathJaxMathPath);
  } else {
    console.warn(`Warning: Font file does not exist: ${mathJaxMathPath}`);
  }
  if (fs.existsSync(mathJaxMainPath)) {
    fonts.push(mathJaxMainPath);
  } else {
    console.warn(`Warning: Font file does not exist: ${mathJaxMainPath}`);
  }

  // Add body font
  if (serifFontPath && fs.existsSync(serifFontPath)) {
    fonts.push(serifFontPath);
  } else if (serifFontPath) {
    console.warn(`Warning: Font file does not exist: ${serifFontPath}`);
  }

  // Add italic font (if available)
  if (serifItalicFontPath && fs.existsSync(serifItalicFontPath)) {
    fonts.push(serifItalicFontPath);
  } else if (serifItalicFontPath) {
    console.warn(`Warning: Font file does not exist: ${serifItalicFontPath}`);
  }

  // Add code font
  if (fs.existsSync(jetbrainsMonoPath)) {
    fonts.push(jetbrainsMonoPath);
  } else {
    console.warn(`Warning: Font file does not exist: ${jetbrainsMonoPath}`);
  }
  
  // Prepare EPUB options
  const epubOptions: EpubGenOptions = {
    title: options.title,
    author: options.author,
    publisher: options.publisher || 'Hello Algorithm',
    description: options.description || '动画图解、一键运行的数据结构与算法教程',
    language: options.language || 'zh-CN',
    content: content,
    verbose: true,
    // Disable automatic chapter title addition (we already handle this in Markdown)
    appendChapterTitles: false,
    // Use custom templates to generate nested table of contents
    customNcxTocTemplatePath: path.join(__dirname, '..', 'templates', 'toc.ncx.ejs'),
    customHtmlTocTemplatePath: path.join(__dirname, '..', 'templates', 'toc.xhtml.ejs'),
    // Inject custom CSS (based on document language)
    css: getCustomCSS(options.docLanguage),
    // Set cover
    cover: options.cover,
    // Add font files
    fonts: fonts,
    // Set table of contents title based on document language
    tocTitle: getTocTitle(options.docLanguage),
  };
  
  // Generate EPUB
  try {
    epubOptions.output = outputPath;
    const epub = new Epub(epubOptions);
    await epub.promise;
    console.log(`EPUB generated successfully: ${outputPath}`);

    // Clean up temporary directory
    fs.removeSync(tempDir);
  } catch (error) {
    console.error('Error generating EPUB:', error);
    // Clean up temporary directory
    fs.removeSync(tempDir);
    throw error;
  }
}

function escapeRegex(str: string): string {
  return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

