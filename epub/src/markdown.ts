import { marked } from 'marked';
import * as path from 'path';
import * as fs from 'fs-extra';
import { HeadingInfo } from './types';
import { ImageInfo } from './types';
import hljs from 'highlight.js';

/**
 * 语言配置映射
 */
interface LanguageConfig {
  displayName: string;  // 在 === "语言名" 中使用的显示名称
  dirName: string;      // codes/ 目录下的子目录名
  extension: string;    // 文件扩展名
  useSnakeCase: boolean; // 是否使用下划线命名（false 表示使用驼峰命名）
}

const LANGUAGE_MAP: { [key: string]: LanguageConfig } = {
  cpp: { displayName: 'C++', dirName: 'cpp', extension: '.cpp', useSnakeCase: false },
  python: { displayName: 'Python', dirName: 'python', extension: '.py', useSnakeCase: true },
  java: { displayName: 'Java', dirName: 'java', extension: '.java', useSnakeCase: false },
  csharp: { displayName: 'C#', dirName: 'csharp', extension: '.cs', useSnakeCase: false },
  go: { displayName: 'Go', dirName: 'go', extension: '.go', useSnakeCase: false },
  swift: { displayName: 'Swift', dirName: 'swift', extension: '.swift', useSnakeCase: false },
  javascript: { displayName: 'JS', dirName: 'javascript', extension: '.js', useSnakeCase: false },
  typescript: { displayName: 'TS', dirName: 'typescript', extension: '.ts', useSnakeCase: false },
  dart: { displayName: 'Dart', dirName: 'dart', extension: '.dart', useSnakeCase: false },
  rust: { displayName: 'Rust', dirName: 'rust', extension: '.rs', useSnakeCase: true },
  c: { displayName: 'C', dirName: 'c', extension: '.c', useSnakeCase: true },
  kotlin: { displayName: 'Kotlin', dirName: 'kotlin', extension: '.kt', useSnakeCase: false },
  ruby: { displayName: 'Ruby', dirName: 'ruby', extension: '.rb', useSnakeCase: true },
  zig: { displayName: 'Zig', dirName: 'zig', extension: '.zig', useSnakeCase: true },
};

/**
 * 将 markdown 代码块的语言标识映射到 highlight.js 支持的语言标识
 * 这个映射确保代码高亮能正确工作
 */
function normalizeLanguageForHighlight(lang: string | undefined): string {
  if (!lang || lang.trim() === '') {
    return '';
  }
  
  // 移除 title 属性（如果存在）
  let normalized = lang.replace(/\s+title="[^"]*"/, '').trim().toLowerCase();
  
  // 语言标识映射表：markdown 标识 -> highlight.js 标识
  const langMap: { [key: string]: string } = {
    'py': 'python',
    'python': 'python',
    'cpp': 'cpp',
    'c++': 'cpp',
    'cxx': 'cpp',
    'java': 'java',
    'cs': 'csharp',
    'csharp': 'csharp',
    'c#': 'csharp',
    'go': 'go',
    'golang': 'go',
    'swift': 'swift',
    'js': 'javascript',
    'javascript': 'javascript',
    'ts': 'typescript',
    'typescript': 'typescript',
    'dart': 'dart',
    'rust': 'rust',
    'rs': 'rust',
    'c': 'c',
    'kt': 'kotlin',
    'kotlin': 'kotlin',
    'rb': 'ruby',
    'ruby': 'ruby',
    'zig': 'zig',
  };
  
  // 如果映射表中存在，返回映射后的值
  if (langMap[normalized]) {
    return langMap[normalized];
  }
  
  // 否则返回原始值（可能 highlight.js 支持）
  return normalized;
}

/**
 * 根据编程语言获取注释符号
 */
function getCommentPrefix(lang: string): string {
  // Python 使用 #
  if (lang === 'python' || lang === 'py') {
    return '#';
  }
  // 其他语言使用 //
  return '//';
}

/**
 * 配置 marked 渲染器
 */
function configureMarked() {
  const renderer = new marked.Renderer();
  
  // 自定义标题渲染（标题编号已由MD文档提供）
  renderer.heading = (text: string, level: number) => {
    return `<h${level}>${text}</h${level}>\n`;
  };

  // 自定义图片渲染，用于后续提取图片
  renderer.image = (href: string, title: string | null, text: string) => {
    return `<img src="${href}" alt="${text || ''}" ${title ? `title="${title}"` : ''} />`;
  };

  // 自定义代码块渲染，支持 title 属性和语法高亮
  renderer.code = (code: string, language: string | undefined, escaped: boolean) => {
    let lang = language || '';
    let highlightedCode = code;
    let filename: string | null = null;

    // 从 language 参数中提取 title（格式：cpp title="heap.cpp"）
    // marked 会将整个 infostring 作为 language 参数传递
    if (language) {
      const titleMatch = language.match(/title="([^"]+)"/);
      if (titleMatch) {
        filename = titleMatch[1];
      }
    }

    // 规范化语言标识，确保与 highlight.js 兼容
    const normalizedLang = normalizeLanguageForHighlight(lang);

    // 使用 highlight.js 进行语法高亮
    try {
      if (normalizedLang && normalizedLang !== '' && hljs.getLanguage(normalizedLang)) {
        // 使用规范化的语言标识进行高亮
        const result = hljs.highlight(code, { language: normalizedLang });
        highlightedCode = result.value;
        lang = normalizedLang;
      } else {
        // 如果不支持该语言，使用自动检测
        const result = hljs.highlightAuto(code);
        highlightedCode = result.value;
        lang = result.language || normalizedLang || 'text';
      }
    } catch (error) {
      console.warn(`语法高亮失败，使用原始代码: ${error}`);
      highlightedCode = escaped ? code : escapeHtml(code);
      lang = normalizedLang || 'text';
    }

    // 如果有文件名，将文件名作为注释添加到代码开头
    if (filename && filename.trim() !== '') {
      const commentPrefix = getCommentPrefix(lang);
      const codeWithFilename = `${commentPrefix} ${escapeHtml(filename)}\n\n${highlightedCode}`;
      return `<pre><code class="hljs language-${lang}">${codeWithFilename}</code></pre>`;
    }

    // 没有文件名的普通代码块
    return `<pre><code class="hljs language-${lang}">${highlightedCode}</code></pre>`;
  };

  // 自定义表格渲染，保持原始格式
  renderer.table = (header: string, body: string) => {
    return `<table>\n<thead>\n${header}</thead>\n<tbody>\n${body}</tbody>\n</table>`;
  };

  marked.setOptions({
    renderer,
    gfm: true,
    breaks: false,
    pedantic: false,
  });
}

function escapeHtml(text: string): string {
  const map: { [key: string]: string } = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;',
  };
  return text.replace(/[&<>"']/g, (m) => map[m]);
}

/**
 * 移除 YAML frontmatter（文件开头的 --- ... --- 块）
 */
function removeYamlFrontmatter(markdown: string): string {
  // 移除文件开头的 YAML frontmatter（--- ... ---）
  return markdown.replace(/^---\s*\n[\s\S]*?\n---\s*\n/, '');
}

/**
 * 移除所有行末的花括号属性标记（如 {data-toc-label="..."} 或 { class="animation-figure" }）
 */
function removeAttributeBlocks(markdown: string): string {
  // 仅移除“看起来像属性块”的花括号：
  // - 内部包含 "="（如 data-toc-label="..."、class="..." 等）
  // - 避免误伤 LaTeX 语法（例如 \begin{aligned}、\text{...} 等不含 "=" 的花括号）
  // 注意：只在非代码块区域处理，避免误删代码块中的内容
  const lines = markdown.split('\n');
  const result: string[] = [];
  let inCodeBlock = false;
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    // 检查是否是代码块开始/结束标记
    if (line.match(/^\s*```/)) {
      inCodeBlock = !inCodeBlock;
      result.push(line);
      continue;
    }
    
    // 如果在代码块内部，直接保留原行，不进行属性块移除
    if (inCodeBlock) {
      result.push(line);
      continue;
    }
    
    // 只在非代码块区域移除行末的属性块
    // 精准匹配：只移除特定格式的属性块
    // 匹配格式：
    //   - {data-toc-label="..."}
    //   - { class="animation-figure" }
    //   - {class="cover-image"}
    // 使用更精确的正则，只匹配常见的HTML/Markdown属性名称
    // 匹配：可选空格 + { + 可选空格 + 属性名 + 可选空格 + = + 可选空格 + "值" + 可选空格 + } + 可选空格 + 行末
    const cleanedLine = line.replace(/\s*\{\s*(?:data-toc-label|class)\s*=\s*"[^"]*"\s*\}\s*$/, '');
    result.push(cleanedLine);
  }
  
  return result.join('\n');
}

/**
 * 将 Markdown 转换为 HTML
 * @param markdown Markdown 文本
 * @param baseDir 基础目录
 * @param language 编程语言（默认为 'cpp'）
 * @param docLanguage 文档语言（可选，用于 admonition 标题本地化：zh, zh-hant, en, ja）
 */
export function markdownToHtml(markdown: string, baseDir: string, language: string = 'cpp', docLanguage?: string): string {
  configureMarked();
  
  // 首先清理不需要的标记
  markdown = removeYamlFrontmatter(markdown);
  markdown = removeAttributeBlocks(markdown);
  
  // 处理多语言代码块，只保留指定语言版本
  markdown = processMultiLanguageCodeBlocks(markdown, language);
  
  // 处理 tabbed 内容（=== "<1>", === "ArrayStack" 等非编程语言标签）
  markdown = processTabbedContent(markdown);
  
  // 处理特殊的 admonition 语法（!!! abstract, !!! success 等）
  const admonitionResult = processAdmonitions(markdown, docLanguage);
  markdown = admonitionResult.markdown;
  const admonitionPlaceholders = admonitionResult.placeholders;
  
  // 兼容 <p align="center"> 写法，将其转换为使用 CSS class 的形式
  markdown = markdown.replace(/<p\s+align="center"\s*>/g, '<p class="text-center">');
  
  // 使用占位符保护数学公式，避免被 marked 转义
  // 使用纯字母数字占位符（避免特殊字符被 Markdown 解析）
  const mathPlaceholders = new Map<string, string>();
  let placeholderCounter = 0;
  
  // 先提取块级公式 $$...$$
  markdown = markdown.replace(/\$\$([\s\S]+?)\$\$/g, (match, formula) => {
    const placeholder = `XMATHBLOCKX${placeholderCounter}X`;
    const rendered = processDisplayMath(formula);
    mathPlaceholders.set(placeholder, rendered);
    placeholderCounter++;
    return placeholder;
  });
  
  // 再提取行内公式 $...$
  markdown = markdown.replace(/\$([^\$\n]+?)\$/g, (match, formula) => {
    const placeholder = `XMATHINLINEX${placeholderCounter}X`;
    const rendered = processInlineMath(formula);
    mathPlaceholders.set(placeholder, rendered);
    placeholderCounter++;
    return placeholder;
  });
  
  // 解析 Markdown
  let html = marked.parse(markdown) as string;
  
  // 替换回数学公式的 HTML
  for (const [placeholder, rendered] of mathPlaceholders.entries()) {
    html = html.replace(new RegExp(placeholder, 'g'), rendered);
  }
  
  // 解析并替换回 admonition 内容占位符
  for (const [placeholder, content] of admonitionPlaceholders.entries()) {
    // 处理内容中的数学公式
    let processedContent = content;
    const contentMathPlaceholders = new Map<string, string>();
    let contentPlaceholderCounter = 0;
    
    // 先提取块级公式 $$...$$
    processedContent = processedContent.replace(/\$\$([\s\S]+?)\$\$/g, (match, formula) => {
      const mathPlaceholder = `XMATHBLOCKX${contentPlaceholderCounter}X`;
      const rendered = processDisplayMath(formula);
      contentMathPlaceholders.set(mathPlaceholder, rendered);
      contentPlaceholderCounter++;
      return mathPlaceholder;
    });
    
    // 再提取行内公式 $...$
    processedContent = processedContent.replace(/\$([^\$\n]+?)\$/g, (match, formula) => {
      const mathPlaceholder = `XMATHINLINEX${contentPlaceholderCounter}X`;
      const rendered = processInlineMath(formula);
      contentMathPlaceholders.set(mathPlaceholder, rendered);
      contentPlaceholderCounter++;
      return mathPlaceholder;
    });
    
    // 解析内容中的 Markdown
    let parsedContent = marked.parse(processedContent) as string;
    
    // 替换回数学公式的 HTML
    for (const [mathPlaceholder, rendered] of contentMathPlaceholders.entries()) {
      parsedContent = parsedContent.replace(new RegExp(mathPlaceholder, 'g'), rendered);
    }
    
    html = html.replace(new RegExp(placeholder, 'g'), parsedContent);
  }
  
  return wrapHtmlContent(html);
}

/**
 * 处理 tabbed 内容（非编程语言的标签页，如步骤说明、不同实现方式等）
 * 这些内容应该全部保留，并转换为合适的 HTML 格式
 */
function processTabbedContent(markdown: string): string {
  // 匹配 === "非编程语言标签" 的内容块
  // 这些标签包括：<1>, <2>, ..., ArrayStack, LinkedListStack, push(), pop() 等
  const lines = markdown.split('\n');
  const result: string[] = [];
  let i = 0;
  
  // 定义编程语言标签（这些不应该被 processTabbedContent 处理）
  const programmingLanguages = [
    'Python', 'C++', 'Java', 'C#', 'Go', 'Swift', 'JS', 'TS', 
    'Dart', 'Rust', 'C', 'Kotlin', 'Ruby', 'Zig'
  ];
  
  while (i < lines.length) {
    const line = lines[i];
    
    // 检查是否是标签行
    const tabMatch = line.match(/^===\s+"([^"]+)"/);
    
    // 只处理非编程语言标签
    if (tabMatch && !programmingLanguages.includes(tabMatch[1])) {
      const tabName = tabMatch[1];
      
      i++;
      
      // 收集该标签下的所有缩进内容
      while (i < lines.length) {
        const contentLine = lines[i];
        
        // 如果遇到下一个 === 标签，结束当前标签内容
        if (contentLine.match(/^===/)) {
          break;
        }
        
        // 如果遇到非缩进的标题或段落，结束当前标签内容
        if (contentLine.trim() && !contentLine.match(/^\s/) && contentLine.match(/^[^#\s]/)) {
          break;
        }
        
        // 移除 4 个空格缩进（MkDocs 的 tabbed 内容通常有 4 个空格缩进）
        result.push(contentLine.replace(/^    /, ''));
        i++;
      }
      
      continue;
    }
    
    // 普通行，直接添加
    result.push(line);
    i++;
  }
  
  return result.join('\n');
}

function processMultiLanguageCodeBlocks(markdown: string, language: string = 'cpp'): string {
  // 获取目标语言的显示名称
  const langConfig = LANGUAGE_MAP[language];
  const targetLangName = langConfig ? langConfig.displayName : 'C++';
  
  // 定义需要过滤的编程语言标签（只有这些标签会被当作多语言代码块处理）
  const programmingLanguages = [
    'Python', 'C++', 'Java', 'C#', 'Go', 'Swift', 'JS', 'TS', 
    'Dart', 'Rust', 'C', 'Kotlin', 'Ruby', 'Zig'
  ];
  
  // 匹配整个多语言代码块组（从第一个 === 到下一个非缩进行或文件结束）
  // 使用更精确的匹配：连续的 === "语言" 块直到遇到非缩进行
  const lines = markdown.split('\n');
  const result: string[] = [];
  let i = 0;
  
  while (i < lines.length) {
    const line = lines[i];
    
    // 检查是否是语言标签行
    const langMatch = line.match(/^===\s+"([^"]+)"/);
    
    // 只处理编程语言标签，其他标签（如 <1>, <2>, ArrayStack 等）保持原样
    if (langMatch && programmingLanguages.includes(langMatch[1])) {
      // 找到了一组多语言代码块的开始
      const blocks: Array<{ lang: string; lines: string[] }> = [];
      let currentLang = langMatch[1];
      let currentBlockLines: string[] = [];
      let inCodeBlock = false;
      
      // 收集所有语言块
      i++; // 跳过第一个语言标签行
      
      while (i < lines.length) {
        const currentLine = lines[i];
        
        // 检查是否是下一个语言标签（必须在代码块外）
        if (!inCodeBlock) {
          const nextLangMatch = currentLine.match(/^===\s+"([^"]+)"/);
          if (nextLangMatch) {
            // 只有当是编程语言标签时才继续处理
            if (programmingLanguages.includes(nextLangMatch[1])) {
              // 保存当前块
              if (currentBlockLines.length > 0) {
                blocks.push({ lang: currentLang, lines: currentBlockLines });
              }
              // 开始新块
              currentLang = nextLangMatch[1];
              currentBlockLines = [];
              i++;
              continue;
            } else {
              // 遇到非编程语言标签（如 <1>, ArrayStack 等），代码块组结束
              if (currentBlockLines.length > 0) {
                blocks.push({ lang: currentLang, lines: currentBlockLines });
              }
              break;
            }
          }
        }
        
        // 检查是否是代码块开始/结束（匹配任意缩进的 ```）
        if (currentLine.match(/^\s*```/)) {
          inCodeBlock = !inCodeBlock;
          currentBlockLines.push(currentLine);
          i++;
          continue;
        }
        
        // 在代码块内部时，所有内容都应该被收集
        if (inCodeBlock) {
          currentBlockLines.push(currentLine);
          i++;
          continue;
        }
        
        // 在代码块外部时，检查是否代码块组结束
        // 如果遇到非缩进的非空行（且不是下一个语言标签），代码块组结束
        if (currentLine.trim()) {
          // 如果是标题行（以 # 开头），代码块组结束
          if (currentLine.match(/^#/)) {
            // 标题行，代码块组结束
            if (currentBlockLines.length > 0) {
              blocks.push({ lang: currentLang, lines: currentBlockLines });
            }
            break;
          } else if (!currentLine.match(/^\s/) && !currentLine.match(/^===/) && !currentLine.match(/^\?\?\?/) && !currentLine.match(/^```/)) {
            // 普通段落（非缩进、非语言标签、非 admonition、非代码块），代码块组结束
            if (currentBlockLines.length > 0) {
              blocks.push({ lang: currentLang, lines: currentBlockLines });
            }
            break;
          }
        }
        
        // 添加到当前块（包括空行和代码块外的缩进行）
        currentBlockLines.push(currentLine);
        i++;
      }
      
      // 如果循环结束，保存最后一个块
      if (currentBlockLines.length > 0) {
        blocks.push({ lang: currentLang, lines: currentBlockLines });
      }
      
      // 查找目标语言版本
      const targetBlock = blocks.find(b => b.lang === targetLangName);
      
      if (targetBlock) {
        // 只保留目标语言版本的代码块（去掉缩进）
        for (const blockLine of targetBlock.lines) {
          // 移除开头的 4 个空格缩进
          result.push(blockLine.replace(/^    /, ''));
        }
      } else if (blocks.length > 0) {
        // 如果没有目标语言版本，保留第一个版本
        for (const blockLine of blocks[0].lines) {
          result.push(blockLine.replace(/^    /, ''));
        }
      }
      
      // i 已经在循环中更新了，继续处理下一行
      continue;
    }
    
    // 普通行，直接添加
    result.push(line);
    i++;
  }
  
  return result.join('\n');
}

/**
 * 处理行内数学公式
 */
function processInlineMath(formula: string): string {
  const content = processMathContent(formula.trim());
  return `<span class="math-inline">${content}</span>`;
}

/**
 * 处理块级数学公式
 */
function processDisplayMath(formula: string): string {
  let result = formula.trim();
  
  // 处理 aligned 环境
  if (result.includes('\\begin{aligned}')) {
    result = result.replace(/\\begin\{aligned\}([\s\S]*?)\\end\{aligned\}/g, (match, content) => {
      return processAlignedMath(content);
    });
  } else {
    result = processMathContent(result);
  }
  
  return `<div class="math-block">${result}</div>`;
}

/**
 * 处理 aligned 数学环境
 */
function processAlignedMath(content: string): string {
  // 处理 \newline
  let aligned = content.trim().replace(/\\newline/g, '\n');
  
  // 按行分割
  const lines = aligned.split('\n').filter((line: string) => line.trim());
  
  if (lines.length === 0) {
    return processMathContent(content);
  }
  
  // 处理每一行
  const processedLines = lines.map((line: string) => {
    if (line.includes('&')) {
      // 有对齐符号，按 & 分割
      return line.split('&').map((part: string) => processMathContent(part.trim()));
    } else {
      // 没有对齐符号
      return [processMathContent(line.trim())];
    }
  });
  
  // 构建表格
  let html = '<table class="math-aligned">';
  for (const line of processedLines) {
    html += '<tr>';
    for (let i = 0; i < line.length; i++) {
      const cell = line[i] || '';
      const align = i === 0 ? 'right' : 'left';
      html += `<td style="text-align: ${align};">${cell}</td>`;
    }
    html += '</tr>';
  }
  html += '</table>';
  
  return html;
}

/**
 * 处理数学公式内容（LaTeX 转 HTML）
 */
function processMathContent(latex: string): string {
  let result = latex.trim();
  
  // 先处理文本和罗马字体（在处理上下标之前，避免嵌套花括号问题）
  result = result.replace(/\\text\s*\{([^}]+)\}/g, '<span class="math-text">$1</span>');
  result = result.replace(/\\mathrm\s*\{([^}]+)\}/g, '<span class="math-roman">$1</span>');
  
  // 处理函数名
  result = result.replace(/\\log/g, '<span class="math-function">log</span>');
  result = result.replace(/\\ln/g, '<span class="math-function">ln</span>');
  result = result.replace(/\\sin/g, '<span class="math-function">sin</span>');
  result = result.replace(/\\cos/g, '<span class="math-function">cos</span>');
  result = result.replace(/\\tan/g, '<span class="math-function">tan</span>');
  
  // 处理下标
  result = result.replace(/_\{([^}]+)\}/g, '<sub>$1</sub>');
  result = result.replace(/_([a-zA-Z0-9])/g, '<sub>$1</sub>');
  
  // 处理上标
  result = result.replace(/\^\{([^}]+)\}/g, '<sup>$1</sup>');
  result = result.replace(/\^([a-zA-Z0-9])/g, '<sup>$1</sup>');
  
  // 处理分数
  result = result.replace(/\\frac\s*\{([^}]+)\}\s*\{([^}]+)\}/g, '$1⁄$2');
  
  // 处理根号
  result = result.replace(/\\sqrt\s*\{([^}]+)\}/g, '√$1');
  
  // 处理希腊字母
  const greekMap: { [key: string]: string } = {
    '\\alpha': 'α', '\\beta': 'β', '\\gamma': 'γ', '\\delta': 'δ',
    '\\epsilon': 'ε', '\\theta': 'θ', '\\lambda': 'λ', '\\mu': 'μ',
    '\\pi': 'π', '\\sigma': 'σ', '\\tau': 'τ', '\\phi': 'φ',
    '\\omega': 'ω', '\\Theta': 'Θ', '\\Omega': 'Ω'
  };
  
  for (const [tex, unicode] of Object.entries(greekMap)) {
    result = result.replace(new RegExp(tex.replace(/\\/g, '\\\\'), 'g'), unicode);
  }
  
  // 处理特殊符号
  result = result.replace(/\\times/g, '×');
  result = result.replace(/\\div/g, '÷');
  result = result.replace(/\\cdot/g, '·');
  result = result.replace(/\\ast/g, '∗');
  result = result.replace(/\\pm/g, '±');
  result = result.replace(/\\mp/g, '∓');
  result = result.replace(/\\leq/g, '≤');
  result = result.replace(/\\geq/g, '≥');
  result = result.replace(/\\neq/g, '≠');
  result = result.replace(/\\ne/g, '≠');
  result = result.replace(/\\approx/g, '≈');
  result = result.replace(/\\equiv/g, '≡');
  result = result.replace(/\\sim/g, '∼');
  result = result.replace(/\\propto/g, '∝');
  result = result.replace(/\\infty/g, '∞');
  result = result.replace(/\\sum/g, '∑');
  result = result.replace(/\\prod/g, '∏');
  result = result.replace(/\\int/g, '∫');
  result = result.replace(/\\dots/g, '...');
  result = result.replace(/\\ldots/g, '…');
  result = result.replace(/\\lfloor/g, '⌊');
  result = result.replace(/\\rfloor/g, '⌋');
  result = result.replace(/\\lceil/g, '⌈');
  result = result.replace(/\\rceil/g, '⌉');
  result = result.replace(/\\in/g, '∈');
  result = result.replace(/\\notin/g, '∉');
  result = result.replace(/\\subset/g, '⊂');
  result = result.replace(/\\supset/g, '⊃');
  result = result.replace(/\\subseteq/g, '⊆');
  result = result.replace(/\\supseteq/g, '⊇');
  result = result.replace(/\\cup/g, '∪');
  result = result.replace(/\\cap/g, '∩');
  result = result.replace(/\\emptyset/g, '∅');
  result = result.replace(/\\forall/g, '∀');
  result = result.replace(/\\exists/g, '∃');
  result = result.replace(/\\land/g, '∧');
  result = result.replace(/\\lor/g, '∨');
  result = result.replace(/\\neg/g, '¬');
  
  // 处理空格命令
  result = result.replace(/\\quad/g, '  ');
  result = result.replace(/\\qquad/g, '    ');
  result = result.replace(/\\,/g, ' ');
  result = result.replace(/\\;/g, ' ');

  // 处理箭头符号
  result = result.replace(/\\rightarrow/g, '→');
  result = result.replace(/\\leftarrow/g, '←');
  result = result.replace(/\\Rightarrow/g, '⇒');
  result = result.replace(/\\Leftarrow/g, '⇐');
  result = result.replace(/\\leftrightarrow/g, '↔');
  result = result.replace(/\\Leftrightarrow/g, '⇔');
  result = result.replace(/\\to/g, '→');
  result = result.replace(/\\gets/g, '←');

  // 处理 LaTeX 括号命令（直接去掉 \left 和 \right，保留括号本身）
  result = result.replace(/\\left\s*/g, '');
  result = result.replace(/\\right\s*/g, '');

  // 处理转义的花括号（使用占位符保护）
  result = result.replace(/\\\{/g, 'LEFTBRACE');
  result = result.replace(/\\\}/g, 'RIGHTBRACE');
  
  // 清理括号和反斜杠
  result = result.replace(/\{|\}/g, '');
  result = result.replace(/\\/g, '');
  
  // 恢复转义的花括号
  result = result.replace(/LEFTBRACE/g, '{');
  result = result.replace(/RIGHTBRACE/g, '}');
  
  // 清理多余的连续空格（但保留 HTML 标签内的空格）
  result = result.replace(/(?<!<[^>]*)\s{2,}(?![^<]*>)/g, ' ');
  
  // 不再将字母转为斜体，保持原始字母
  
  return result;
}


/**
 * 处理 MkDocs 的 admonition 语法
 * 支持两种格式：
 * 1. !!! note（使用默认标题）
 * 2. !!! note "自定义标题"（使用自定义标题）
 */
function processAdmonitions(markdown: string, docLanguage?: string): { markdown: string; placeholders: Map<string, string> } {
  const lines = markdown.split('\n');
  const result: string[] = [];
  const placeholders = new Map<string, string>();
  let placeholderCounter = 0;
  let i = 0;
  
  while (i < lines.length) {
    const line = lines[i];
    
    // 检查是否是 admonition 开始
    const admonitionMatch = line.match(/^!!!\s+(\w+)(?:\s+"([^"]+)")?\s*$/);
    
    if (admonitionMatch) {
      const type = admonitionMatch[1];
      const customTitle = admonitionMatch[2];
      const title = customTitle || getAdmonitionTitle(type, docLanguage);
      
      i++; // 跳过 admonition 标记行
      
      // 收集所有缩进的内容（4个空格开头）
      const contentLines: string[] = [];
      while (i < lines.length) {
        const contentLine = lines[i];
        
        // 如果是缩进行（4个空格开头），属于 admonition 内容
        if (contentLine.match(/^    /)) {
          // 去掉前4个空格
          contentLines.push(contentLine.substring(4));
          i++;
        } 
        // 如果是空行，也可能属于 admonition 内容（需要检查下一行）
        else if (contentLine.trim() === '') {
          // 向前查看，如果下一行还是缩进的，那这个空行属于 admonition
          if (i + 1 < lines.length && lines[i + 1].match(/^    /)) {
            contentLines.push('');
            i++;
          } else {
            // 否则 admonition 结束
            break;
          }
        }
        // 非缩进非空行，admonition 结束
        else {
          break;
        }
      }
      
      // 生成 admonition HTML 结构，内容部分使用占位符
      const content = contentLines.join('\n').trim();
      const placeholder = `XADMONITIONCONTENTX${placeholderCounter}X`;
      placeholders.set(placeholder, content);
      placeholderCounter++;
      
      result.push(`<div class="admonition ${type}">`);
      // 如果标题为空，则不显示标题
      if (title) {
        result.push(`<div class="admonition-title">${title}</div>`);
      }
      result.push(placeholder);
      result.push(`</div>`);
      
      continue;
    }
    
    // 普通行
    result.push(line);
    i++;
  }
  
  return { markdown: result.join('\n'), placeholders };
}

function getAdmonitionTitle(type: string, docLanguage?: string): string {
  const lang = docLanguage || 'zh';
  
  const titles: { [key: string]: { [key: string]: string } } = {
    'zh': {
      abstract: '摘要',
      success: '成功',
      info: '信息',
      warning: '警告',
      danger: '危险',
      note: '注意',
      tip: '提示',
      question: '问题',
      quote: '引用',
    },
    'zh-hant': {
      abstract: '摘要',
      success: '成功',
      info: '資訊',
      warning: '警告',
      danger: '危險',
      note: '注意',
      tip: '提示',
      question: '問題',
      quote: '引用',
    },
    'en': {
      abstract: 'Summary',
      success: 'Success',
      info: 'Info',
      warning: 'Warning',
      danger: 'Danger',
      note: 'Note',
      tip: 'Hint',
      question: 'Question',
      quote: 'Quote',
    },
    'ja': {
      abstract: '要約',
      success: '成功',
      info: '情報',
      warning: '警告',
      danger: '危険',
      note: '注意',
      tip: 'ヒント',
      question: '質問',
      quote: '引用',
    },
  };
  
  // 如果类型在字典中，使用字典值；如果字典值为空字符串，说明该类型不需要标题
  // 如果类型不在字典中，返回类型本身
  const title = titles[lang]?.[type];
  if (title !== undefined) {
    return title;
  }
  const fallbackTitle = titles['zh']?.[type];
  if (fallbackTitle !== undefined) {
    return fallbackTitle;
  }
  return type;
}

/**
 * 获取自定义 CSS 样式
 */
export function getCustomCSS(): string {
  return `
    /* 定义 MathJax 数学字体 */
    @font-face {
      font-family: "MathJax_Math";
      src: url(./fonts/MathJax_Math-Regular.otf);
      font-style: normal;
      font-weight: normal;
    }
    @font-face {
      font-family: "MathJax_Main";
      src: url(./fonts/MathJax_Main-Regular.otf);
      font-style: normal;
      font-weight: normal;
    }
    
    body {
      font-family: "Noto Sans SC", "Microsoft YaHei", sans-serif;
      line-height: 1.6;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      color: #333;
    }
    /* 居中对齐的段落（兼容 <p align="center"> 写法，已转换为 .text-center） */
    .text-center {
      text-align: center;
    }
/* 降低粗体文字的粗细度 */
strong, b {
  font-weight: 600;
}
    h1, h2, h3, h4, h5, h6 {
  color: #24292e;
  margin-top: 1.2em;
  margin-bottom: 0.6em;
  font-weight: 600;
  line-height: 1.25;
    }
    /* 分页设置 */
    h1 {
      page-break-before: auto;
    }
    h2 {
      page-break-before: avoid;
    }
    h2, h3, h4, h5, h6 {
      page-break-after: avoid;
    }
/* 章节标题 (第 X 章) */
h1 { font-size: 1.5em; }
/* 小节标题 (X.Y) */
h2 { font-size: 1.3em; }
/* Markdown 文档内的主标题 */
h3 { font-size: 1.15em; }
/* Markdown 文档内的副标题 */
h4 { font-size: 1.05em; }
h5 { font-size: 1.0em; }
h6 { font-size: 1.0em; }
    /* 行内代码 */
    code {
      background-color: #f0f0f0;
      padding: 2px 6px;
      border-radius: 3px;
      border: 1px solid #d0d0d0;
      font-family: "Roboto Mono", "Noto Sans Mono", "Droid Sans Mono", "SF Mono", "JetBrains Mono", "Fira Code", "Source Code Pro", "Consolas", "Menlo", "Monaco", "DejaVu Sans Mono", "Liberation Mono", "Courier New", Courier, monospace;
      font-size: 0.88em;
      color: #333;
    }
    
    /* 代码块 */
    pre {
      padding: 3px 3px;
      background-color: #f5f5f5;
      border: 1.5px solid #d0d0d0;
      border-radius: 6px;
      margin: 16px 0;
      line-height: 1.65;
      page-break-inside: auto !important;
      break-inside: auto !important;
    }

    pre code {
      background-color: #f5f5f5;
      padding: 14px 16px;
      border: none;
      white-space: pre-wrap;
      word-wrap: break-word;
      word-break: break-all;
      overflow-wrap: break-word;
      font-family: "Roboto Mono", "Noto Sans Mono", "Droid Sans Mono", "SF Mono", "JetBrains Mono", "Fira Code", "Source Code Pro", "Consolas", "Menlo", "Monaco", "DejaVu Sans Mono", "Liberation Mono", "Courier New", Courier, monospace;
      font-size: 0.85em;
      color: #24292e;
      display: block;
    }
    img {
      max-width: 100%;
      height: auto;
      display: block;
      margin: 20px auto;
    }
    blockquote {
      border-left: 4px solid #3498db;
      margin: 0;
      padding-left: 20px;
      color: #666;
    }
    table {
      border-collapse: collapse;
      width: 100%;
      margin: 20px 0;
      border: 1px solid #ddd;
      font-size: 0.9em;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: left;
      vertical-align: top;
    }
    th {
      background-color: #f2f2f2;
      font-weight: bold;
      text-align: center;
    }
    tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    table code {
      background-color: #f4f4f4;
      padding: 2px 4px;
      border-radius: 3px;
      font-size: 0.9em;
    }
    .math-inline {
      white-space: nowrap;
      font-family: "MathJax_Math", "MathJax_Main", "STIX Two Math", "Latin Modern Math", "Computer Modern", "Times New Roman", Times, serif;
      font-size: 1.05em;
      vertical-align: baseline;
      line-height: 1.4;
      font-weight: normal;
      letter-spacing: 0.01em;
    }
    .math-inline i {
      font-style: italic;
      font-family: "MathJax_Math", "MathJax_Main", "STIX Two Math", "Latin Modern Math", "Computer Modern", "Times New Roman", Times, serif;
    }
    .math-block {
      text-align: center;
      margin: 20px 0;
      padding: 10px;
      font-family: "MathJax_Math", "MathJax_Main", "STIX Two Math", "Latin Modern Math", "Computer Modern", "Times New Roman", Times, serif;
      font-size: 1.05em;
    }
    .math-block i {
      font-style: italic;
      font-family: "MathJax_Math", "MathJax_Main", "STIX Two Math", "Latin Modern Math", "Computer Modern", "Times New Roman", Times, serif;
    }
    .math-function {
      font-style: normal;
      font-weight: normal;
    }
    .math-text {
      font-style: normal;
      font-weight: normal;
    }
    .math-roman {
      font-style: normal;
      font-weight: normal;
    }
    .math-aligned {
      margin: 10px auto;
      border-collapse: collapse;
      border: none;
      width: auto;
      display: table;
    }
    .math-aligned td {
      border: none;
      padding: 6px 12px;
      vertical-align: middle;
      font-family: "MathJax_Math", "MathJax_Main", "STIX Two Math", "Latin Modern Math", "Computer Modern", "Times New Roman", Times, serif;
      font-size: 1.05em;
    }
    .math-aligned i {
      font-style: italic;
    }
    .math-inline sup,
    .math-block sup {
      font-size: 0.7em;
      vertical-align: super;
    }
    .math-inline sub,
    .math-block sub {
      font-size: 0.7em;
      vertical-align: sub;
    }
    .admonition {
      margin: 20px 0;
      padding: 12px 16px;
      border: 2px solid #6d85df;
      border-radius: 6px;
      background-color: #f8f9fa;
    }
    .admonition-title {
      font-weight: 600;
      margin-bottom: 8px;
      color: #2c3e50;
    }
    .admonition.note {
      border-color: #53bbb1;
      background-color: #f6fbfb;
    }
    .admonition.tip {
      border-color: #53bbb1;
      background-color: #f6fbfb;
    }
    .admonition.success {
      border-color: #82bb81;
      background-color: #f8fcf9;
    }
    .admonition.warning {
      border-color: #ffc107;
      background-color: #fff3cd;
    }
    .admonition.danger {
      border-color: #dc3545;
      background-color: #f8d7da;
    }
    .admonition.info {
      border-color: #17a2b8;
      background-color: #d1ecf1;
    }
    .admonition.abstract {
      border-color: #6d85df;
      background-color: #f8f9fa;
    }
    .admonition.question {
      border-color: #82bb81;
      background-color: #f8fcf9;
    }
    .admonition.quote {
      border-color: #898989;
      background-color: #f9f9f9;
    }
    ul, ol {
      padding-left: 30px;
    }
    li {
      margin: 5px 0;
    }

    /* Syntax highlighting styles (GitHub Light theme) */
    .hljs {
      display: block;
      padding: 14px 16px;
      color: #24292e;
      background: #f5f5f5;
    }

    .hljs-comment,
    .hljs-quote {
      color: #6a737d;
      font-style: italic;
    }

    .hljs-keyword,
    .hljs-selector-tag,
    .hljs-subst {
      color: #d73a49;
      font-weight: bold;
    }

    .hljs-number,
    .hljs-literal,
    .hljs-variable,
    .hljs-template-variable,
    .hljs-tag .hljs-attr {
      color: #005cc5;
    }

    .hljs-string,
    .hljs-doctag {
      color: #032f62;
    }

    .hljs-title,
    .hljs-section,
    .hljs-selector-id {
      color: #6f42c1;
      font-weight: bold;
    }

    .hljs-subst {
      font-weight: normal;
    }

    .hljs-type,
    .hljs-class .hljs-title {
      color: #d73a49;
      font-weight: bold;
    }

    .hljs-tag,
    .hljs-name,
    .hljs-attribute {
      color: #22863a;
      font-weight: normal;
    }

    .hljs-regexp,
    .hljs-link {
      color: #032f62;
    }

    .hljs-symbol,
    .hljs-bullet {
      color: #e36209;
    }

    .hljs-built_in,
    .hljs-builtin-name {
      color: #005cc5;
    }

    .hljs-meta {
      color: #6a737d;
      font-weight: bold;
    }

    .hljs-deletion {
      background: #ffeef0;
    }

    .hljs-addition {
      background: #f0fff4;
    }

    .hljs-emphasis {
      font-style: italic;
    }

    .hljs-strong {
      font-weight: bold;
    }
`;
}

/**
 * 包装 HTML 内容（简化版，样式由 CSS 文件提供）
 */
function wrapHtmlContent(html: string): string {
  return html;
}

/**
 * 从 Markdown 文本中提取所有标题
 * @param markdown Markdown 文本
 * @param chapterPath 章节路径（用于标识）
 * @returns 标题列表
 */
export function extractHeadings(markdown: string, chapterPath: string): HeadingInfo[] {
  const headings: HeadingInfo[] = [];
  const lines = markdown.split('\n');
  let inCodeBlock = false;
  let inFencedBlock = false;
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    // 检查代码块边界（三个反引号或波浪号）
    if (line.match(/^\s*```/) || line.match(/^\s*~~~/)) {
      inCodeBlock = !inCodeBlock;
      continue;
    }
    
    // 检查缩进代码块（4个空格）
    if (line.match(/^    /) && !inCodeBlock) {
      inFencedBlock = true;
      continue;
    } else if (inFencedBlock && !line.match(/^    /) && line.trim()) {
      inFencedBlock = false;
    }
    
    // 跳过代码块内的内容
    if (inCodeBlock || inFencedBlock) {
      continue;
    }
    
    // 匹配 ATX 风格标题：# ## ### 等
    const match = line.match(/^(#{1,6})\s+(.+)$/);
    if (match) {
      const level = match[1].length;
      let text = match[2].trim();
      
      // 移除标题中的 Markdown 格式和数学公式，保留纯文本
      text = text
        .replace(/\$[^$]+\$/g, '') // 移除行内数学公式
        .replace(/\*\*(.+?)\*\*/g, '$1') // 移除粗体
        .replace(/\*(.+?)\*/g, '$1') // 移除斜体
        .replace(/`(.+?)`/g, '$1') // 移除代码
        .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1') // 移除链接，保留文本
        .trim();
      
      if (text) {
        headings.push({
          level,
          text,
          chapterPath,
          lineNumber: i + 1
        });
      }
    }
  }
  
  return headings;
}

/**
 * 提取 Markdown 中的图片路径
 */
export function extractImagePaths(markdown: string, markdownFilePath: string): Array<{ original: string; fullPath: string }> {
  const imageRegex = /!\[([^\]]*)\]\(([^)]+)\)/g;
  const paths: Array<{ original: string; fullPath: string }> = [];
  let match;
  const markdownDir = path.dirname(markdownFilePath);
  const docsRoot = path.resolve(markdownDir, '..');

  while ((match = imageRegex.exec(markdown)) !== null) {
    const imagePath = match[2];
    // 处理相对路径
    if (!imagePath.startsWith('http://') && !imagePath.startsWith('https://') && !imagePath.startsWith('data:')) {
      // 尝试多个可能的路径
      const possiblePaths = [
        path.resolve(markdownDir, imagePath),  // 相对于当前 markdown 文件
        path.resolve(docsRoot, imagePath),     // 相对于 docs 根目录
        path.resolve(markdownDir, '..', imagePath), // 上一级目录
      ];
      
      for (const fullPath of possiblePaths) {
        if (fs.existsSync(fullPath)) {
          paths.push({ original: imagePath, fullPath });
          break;
        }
      }
    }
  }

  return paths;
}

/**
 * 读取图片文件
 */
export function readImage(imagePath: string): ImageInfo | null {
  try {
    const data = fs.readFileSync(imagePath);
    const ext = path.extname(imagePath).toLowerCase();
    const mimeTypes: { [key: string]: string } = {
      '.jpg': 'image/jpeg',
      '.jpeg': 'image/jpeg',
      '.png': 'image/png',
      '.gif': 'image/gif',
      '.svg': 'image/svg+xml',
      '.webp': 'image/webp',
    };
    const mimeType = mimeTypes[ext] || 'image/png';
    
    return {
      src: path.basename(imagePath),
      data,
      mimeType,
    };
  } catch (error) {
    console.warn(`无法读取图片: ${imagePath}`, error);
    return null;
  }
}

/**
 * 将图片转换为 base64 数据 URI
 */
export function imageToDataUri(imageInfo: ImageInfo): string {
  const base64 = imageInfo.data.toString('base64');
  return `data:${imageInfo.mimeType};base64,${base64}`;
}

