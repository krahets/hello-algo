import { marked } from 'marked';
import * as path from 'path';
import * as fs from 'fs-extra';
import { HeadingInfo } from './types';
import { ImageInfo } from './types';
import hljs from 'highlight.js';

/**
 * Language configuration mapping
 */
interface LanguageConfig {
  displayName: string;  // Display name used in === "Language Name"
  dirName: string;      // Subdirectory name under codes/ directory
  extension: string;    // File extension
  useSnakeCase: boolean; // Whether to use snake_case naming (false means camelCase)
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
 * Map markdown code block language identifiers to highlight.js supported language identifiers
 * This mapping ensures code highlighting works correctly
 */
function normalizeLanguageForHighlight(lang: string | undefined): string {
  if (!lang || lang.trim() === '') {
    return '';
  }
  
  // Remove title attribute (if exists)
  let normalized = lang.replace(/\s+title="[^"]*"/, '').trim().toLowerCase();
  
  // Language identifier mapping table: markdown identifier -> highlight.js identifier
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
  
  // If exists in mapping table, return mapped value
  if (langMap[normalized]) {
    return langMap[normalized];
  }
  
  // Otherwise return original value (may be supported by highlight.js)
  return normalized;
}

/**
 * Get comment prefix based on programming language
 */
function getCommentPrefix(lang: string): string {
  // Python uses #
  if (lang === 'python' || lang === 'py') {
    return '#';
  }
  // Other languages use //
  return '//';
}

/**
 * Configure marked renderer
 */
function configureMarked() {
  const renderer = new marked.Renderer();
  
  // Custom heading rendering (heading numbers already provided by MD documents)
  renderer.heading = (text: string, level: number) => {
    // Generate anchor ID (remove special characters and spaces)
    const id = text
      .replace(/[^\u4e00-\u9fa5a-zA-Z0-9\s]/g, '') // Keep Chinese, letters, numbers and spaces
      .trim()
      .replace(/\s+/g, '-') // Replace spaces with hyphens
      .toLowerCase();
    return `<h${level} id="${id}">${text}</h${level}>\n`;
  };

  // Custom link rendering, remove links to .md files (invalid in EPUB)
  renderer.link = (href: string, title: string | null, text: string) => {
    // If link points to .md file, only return text content (remove hyperlink)
    if (href && href.endsWith('.md')) {
      return text;
    }
    // Other links remain unchanged
    const titleAttr = title ? ` title="${title}"` : '';
    return `<a href="${href}"${titleAttr}>${text}</a>`;
  };

  // Custom image rendering, for later image extraction
  renderer.image = (href: string, title: string | null, text: string) => {
    return `<img src="${href}" alt="${text || ''}" ${title ? `title="${title}"` : ''} />`;
  };

  // Custom code block rendering, supports title attribute and syntax highlighting
  renderer.code = (code: string, language: string | undefined, escaped: boolean) => {
    let lang = language || '';
    let highlightedCode = code;
    let filename: string | null = null;

    // Extract title from language parameter (format: cpp title="heap.cpp")
    // marked passes the entire infostring as the language parameter
    if (language) {
      const titleMatch = language.match(/title="([^"]+)"/);
      if (titleMatch) {
        filename = titleMatch[1];
      }
    }

    // Normalize language identifier to ensure compatibility with highlight.js
    const normalizedLang = normalizeLanguageForHighlight(lang);

    // Use highlight.js for syntax highlighting
    try {
      if (normalizedLang && normalizedLang !== '' && hljs.getLanguage(normalizedLang)) {
        // Use normalized language identifier for highlighting
        const result = hljs.highlight(code, { language: normalizedLang });
        highlightedCode = result.value;
        lang = normalizedLang;
      } else {
        // If language not supported, use auto-detection
        const result = hljs.highlightAuto(code);
        highlightedCode = result.value;
        lang = result.language || normalizedLang || 'text';
      }
    } catch (error) {
      console.warn(`Syntax highlighting failed, using original code: ${error}`);
      highlightedCode = escaped ? code : escapeHtml(code);
      lang = normalizedLang || 'text';
    }

    // If has filename, add filename as comment at the beginning of code
    if (filename && filename.trim() !== '') {
      const commentPrefix = getCommentPrefix(lang);
      const codeWithFilename = `${commentPrefix} ${escapeHtml(filename)}\n\n${highlightedCode}`;
      return `<pre><code class="hljs language-${lang}">${codeWithFilename}</code></pre>`;
    }

    // Normal code block without filename
    return `<pre><code class="hljs language-${lang}">${highlightedCode}</code></pre>`;
  };

  // Custom table rendering, maintain original format
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
 * Remove YAML frontmatter (--- ... --- block at the beginning of file)
 */
function removeYamlFrontmatter(markdown: string): string {
  // Remove YAML frontmatter at the beginning of file (--- ... ---)
  return markdown.replace(/^---\s*\n[\s\S]*?\n---\s*\n/, '');
}

/**
 * Remove all end-of-line attribute block markers (like {data-toc-label="..."} or { class="animation-figure" })
 */
function removeAttributeBlocks(markdown: string): string {
  // Only remove "attribute block-like" braces:
  // - Contains "=" inside (like data-toc-label="...", class="...", etc.)
  // - Avoid damaging LaTeX syntax (e.g., \begin{aligned}, \text{...} that don't contain "=")
  // Note: Only process in non-code block areas to avoid mistakenly deleting code block content
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

    // If inside code block, keep original line without removing attribute blocks
    if (inCodeBlock) {
      result.push(line);
      continue;
    }

    // Only remove end-of-line attribute blocks in non-code block areas
    // Precise matching: only remove specific format attribute blocks
    // Matching formats:
    //   - {data-toc-label="..."}
    //   - { class="animation-figure" }
    //   - {class="cover-image"}
    // Use more precise regex, only match common HTML/Markdown attribute names
    // Match: optional space + { + optional space + attribute name + optional space + = + optional space + "value" + optional space + } + optional space + end of line
    const cleanedLine = line.replace(/\s*\{\s*(?:data-toc-label|class)\s*=\s*"[^"]*"\s*\}\s*$/, '');
    result.push(cleanedLine);
  }

  return result.join('\n');
}

/**
 * Decrease heading levels (lower all headings by one level)
 * Skip content in code blocks
 */
function decreaseHeadingLevels(markdown: string): string {
  const lines = markdown.split('\n');
  const result: string[] = [];
  let inCodeBlock = false;

  for (const line of lines) {
    // 检查是否是代码块开始/结束标记
    if (line.match(/^\s*```/)) {
      inCodeBlock = !inCodeBlock;
      result.push(line);
      continue;
    }

    // If inside code block, keep original line
    if (inCodeBlock) {
      result.push(line);
      continue;
    }

    // Match heading line: ^#{1,6}\s+
    const headingMatch = line.match(/^(#{1,6})\s+(.+)$/);
    if (headingMatch) {
      const level = headingMatch[1].length;
      const content = headingMatch[2];

      // If already H6, keep unchanged; otherwise increase one level
      if (level < 6) {
        result.push('#' + headingMatch[1] + ' ' + content);
      } else {
        result.push(line);
      }
    } else {
      result.push(line);
    }
  }

  return result.join('\n');
}

/**
 * Convert Markdown to HTML
 * @param markdown Markdown text
 * @param baseDir Base directory
 * @param language Programming language (default 'cpp')
 * @param docLanguage Document language (optional, for admonition title localization: zh, zh-hant, en, ja)
 * @param filePath File path (optional, used to determine if it's index.md)
 */
export function markdownToHtml(markdown: string, baseDir: string, language: string = 'cpp', docLanguage?: string, filePath?: string): string {
  configureMarked();

  // First clean up unwanted markers
  markdown = removeYamlFrontmatter(markdown);
  markdown = removeAttributeBlocks(markdown);

  // If not index.md file, decrease heading levels
  if (filePath && path.basename(filePath, '.md') !== 'index') {
    markdown = decreaseHeadingLevels(markdown);
  }

  // Process multi-language code blocks, only keep specified language version
  markdown = processMultiLanguageCodeBlocks(markdown, language);

  // Process tabbed content (=== "<1>", === "ArrayStack" etc. non-programming language tabs)
  markdown = processTabbedContent(markdown);

  // Process special admonition syntax (!!! abstract, !!! success, etc.)
  const admonitionResult = processAdmonitions(markdown, docLanguage);
  markdown = admonitionResult.markdown;
  const admonitionPlaceholders = admonitionResult.placeholders;
  
  // Support <p align="center"> syntax, convert it to use CSS class
  markdown = markdown.replace(/<p\s+align="center"\s*>/g, '<p class="text-center">');
  
  // Use placeholders to protect math formulas from being escaped by marked
  // Use pure alphanumeric placeholders (avoid special characters being parsed by Markdown)
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
  
  // Parse Markdown
  let html = marked.parse(markdown) as string;
  
  // 替换回数学公式的 HTML
  for (const [placeholder, rendered] of mathPlaceholders.entries()) {
    html = html.replace(new RegExp(placeholder, 'g'), rendered);
  }
  
  // Parse and replace back admonition content placeholders
  for (const [placeholder, content] of admonitionPlaceholders.entries()) {
    // Process math formulas in content
    let processedContent = content;
    const contentMathPlaceholders = new Map<string, string>();
    let contentPlaceholderCounter = 0;
    
    // First extract block-level formulas $$...$$
    processedContent = processedContent.replace(/\$\$([\s\S]+?)\$\$/g, (match, formula) => {
      const mathPlaceholder = `XMATHBLOCKX${contentPlaceholderCounter}X`;
      const rendered = processDisplayMath(formula);
      contentMathPlaceholders.set(mathPlaceholder, rendered);
      contentPlaceholderCounter++;
      return mathPlaceholder;
    });
    
    // Then extract inline formulas $...$
    processedContent = processedContent.replace(/\$([^\$\n]+?)\$/g, (match, formula) => {
      const mathPlaceholder = `XMATHINLINEX${contentPlaceholderCounter}X`;
      const rendered = processInlineMath(formula);
      contentMathPlaceholders.set(mathPlaceholder, rendered);
      contentPlaceholderCounter++;
      return mathPlaceholder;
    });
    
    // Parse Markdown in content
    let parsedContent = marked.parse(processedContent) as string;
    
    // Replace back math formula HTML
    for (const [mathPlaceholder, rendered] of contentMathPlaceholders.entries()) {
      parsedContent = parsedContent.replace(new RegExp(mathPlaceholder, 'g'), rendered);
    }
    
    html = html.replace(new RegExp(placeholder, 'g'), parsedContent);
  }
  
  return wrapHtmlContent(html);
}

/**
 * Process tabbed content (non-programming language tabs, such as step descriptions, different implementation methods, etc.)
 * All this content should be preserved and converted to appropriate HTML format
 */
function processTabbedContent(markdown: string): string {
  // Match === "non-programming language tags" content blocks
  // These tags include: <1>, <2>, ..., ArrayStack, LinkedListStack, push(), pop(), etc.
  const lines = markdown.split('\n');
  const result: string[] = [];
  let i = 0;
  
  // Define programming language tags (these should not be processed by processTabbedContent)
  const programmingLanguages = [
    'Python', 'C++', 'Java', 'C#', 'Go', 'Swift', 'JS', 'TS', 
    'Dart', 'Rust', 'C', 'Kotlin', 'Ruby', 'Zig'
  ];
  
  while (i < lines.length) {
    const line = lines[i];
    
    // Check if it's a tag line
    const tabMatch = line.match(/^===\s+"([^"]+)"/);
    
    // Only process non-programming language tags
    if (tabMatch && !programmingLanguages.includes(tabMatch[1])) {
      const tabName = tabMatch[1];
      
      i++;
      
      // Collect all indented content under this tag
      while (i < lines.length) {
        const contentLine = lines[i];
        
        // If encounter next === tag, end current tag content
        if (contentLine.match(/^===/)) {
          break;
        }
        
        // If encounter non-indented heading or paragraph, end current tag content
        if (contentLine.trim() && !contentLine.match(/^\s/) && contentLine.match(/^[^#\s]/)) {
          break;
        }
        
        // Remove 4 space indentation (MkDocs tabbed content usually has 4 space indentation)
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
  // Get target language display name
  const langConfig = LANGUAGE_MAP[language];
  const targetLangName = langConfig ? langConfig.displayName : 'C++';
  
  // Define programming language tags to filter (only these tags will be treated as multi-language code blocks)
  const programmingLanguages = [
    'Python', 'C++', 'Java', 'C#', 'Go', 'Swift', 'JS', 'TS', 
    'Dart', 'Rust', 'C', 'Kotlin', 'Ruby', 'Zig'
  ];
  
  // Match entire multi-language code block group (from first === to next non-indented line or file end)
  // Use more precise matching: consecutive === "Language" blocks until encountering non-indented line
  const lines = markdown.split('\n');
  const result: string[] = [];
  let i = 0;
  
  while (i < lines.length) {
    const line = lines[i];
    
    // Check if it's a language tag line
    const langMatch = line.match(/^===\s+"([^"]+)"/);
    
    // Only process programming language tags, other tags (like <1>, <2>, ArrayStack, etc.) remain unchanged
    if (langMatch && programmingLanguages.includes(langMatch[1])) {
      // Found the start of a multi-language code block group
      const blocks: Array<{ lang: string; lines: string[] }> = [];
      let currentLang = langMatch[1];
      let currentBlockLines: string[] = [];
      let inCodeBlock = false;
      
      // Collect all language blocks
      i++; // Skip first language tag line
      
      while (i < lines.length) {
        const currentLine = lines[i];
        
        // Check if it's next language tag (must be outside code block)
        if (!inCodeBlock) {
          const nextLangMatch = currentLine.match(/^===\s+"([^"]+)"/);
          if (nextLangMatch) {
            // Only continue processing when it's a programming language tag
            if (programmingLanguages.includes(nextLangMatch[1])) {
              // Save current block
              if (currentBlockLines.length > 0) {
                blocks.push({ lang: currentLang, lines: currentBlockLines });
              }
              // Start new block
              currentLang = nextLangMatch[1];
              currentBlockLines = [];
              i++;
              continue;
            } else {
              // Encounter non-programming language tag (like <1>, ArrayStack, etc.), code block group ends
              if (currentBlockLines.length > 0) {
                blocks.push({ lang: currentLang, lines: currentBlockLines });
              }
              break;
            }
          }
        }
        
        // Check if it's code block start/end (match any indentation ```)

        if (currentLine.match(/^\s*```/)) {
          inCodeBlock = !inCodeBlock;
          currentBlockLines.push(currentLine);
          i++;
          continue;
        }
        
        // When inside code block, all content should be collected
        if (inCodeBlock) {
          currentBlockLines.push(currentLine);
          i++;
          continue;
        }
        
        // When outside code block, check if code block group ends
        // If encounter non-indented non-empty line (and not next language tag), code block group ends
        if (currentLine.trim()) {
          // If it's heading line (starts with #), code block group ends
          if (currentLine.match(/^#/)) {
            // Heading line, code block group ends
            if (currentBlockLines.length > 0) {
              blocks.push({ lang: currentLang, lines: currentBlockLines });
            }
            break;
          } else if (!currentLine.match(/^\s/) && !currentLine.match(/^===/) && !currentLine.match(/^\?\?\?/) && !currentLine.match(/^```/)) {
            // Normal paragraph (non-indented, non-language tag, non-admonition, non-code block), code block group ends
            if (currentBlockLines.length > 0) {
              blocks.push({ lang: currentLang, lines: currentBlockLines });
            }
            break;
          }
        }
        
        // Add to current block (including empty lines and indented lines outside code block)
        currentBlockLines.push(currentLine);
        i++;
      }
      
      // If loop ends, save last block
      if (currentBlockLines.length > 0) {
        blocks.push({ lang: currentLang, lines: currentBlockLines });
      }
      
      // Find target language version
      const targetBlock = blocks.find(b => b.lang === targetLangName);
      
      if (targetBlock) {
        // Only keep target language version code block (remove indentation)
        for (const blockLine of targetBlock.lines) {
          // Remove leading 4 space indentation
          result.push(blockLine.replace(/^    /, ''));
        }
      } else if (blocks.length > 0) {
        // If no target language version, keep first version
        for (const blockLine of blocks[0].lines) {
          result.push(blockLine.replace(/^    /, ''));
        }
      }
      
      // i has already been updated in the loop, continue processing next line
      continue;
    }
    
    // 普通行，直接添加
    result.push(line);
    i++;
  }
  
  return result.join('\n');
}

/**
 * Process inline math formulas
 */
function processInlineMath(formula: string): string {
  const content = processMathContent(formula.trim());
  return `<span class="math-inline">${content}</span>`;
}

/**
 * Process block-level math formulas
 */
function processDisplayMath(formula: string): string {
  let result = formula.trim();
  
  // Process aligned environment
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
 * Process aligned math environment
 */
function processAlignedMath(content: string): string {
  // Process \newline
  let aligned = content.trim().replace(/\\newline/g, '\n');
  
  // Split by line
  const lines = aligned.split('\n').filter((line: string) => line.trim());
  
  if (lines.length === 0) {
    return processMathContent(content);
  }
  
  // Process each line
  const processedLines = lines.map((line: string) => {
    if (line.includes('&')) {
      // Has alignment symbol, split by &
      return line.split('&').map((part: string) => processMathContent(part.trim()));
    } else {
      // No alignment symbol
      return [processMathContent(line.trim())];
    }
  });
  
  // Build table
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
 * Process math formula content (LaTeX to HTML)
 */
function processMathContent(latex: string): string {
  let result = latex.trim();
  
  // First process text and roman font (before processing superscripts/subscripts to avoid nested braces issue)
  result = result.replace(/\\text\s*\{([^}]+)\}/g, '<span class="math-text">$1</span>');
  result = result.replace(/\\mathrm\s*\{([^}]+)\}/g, '<span class="math-roman">$1</span>');
  
  // Process function names
  result = result.replace(/\\log/g, '<span class="math-function">log</span>');
  result = result.replace(/\\ln/g, '<span class="math-function">ln</span>');
  result = result.replace(/\\sin/g, '<span class="math-function">sin</span>');
  result = result.replace(/\\cos/g, '<span class="math-function">cos</span>');
  result = result.replace(/\\tan/g, '<span class="math-function">tan</span>');
  
  // Process subscripts
  result = result.replace(/_\{([^}]+)\}/g, '<sub>$1</sub>');
  result = result.replace(/_([a-zA-Z0-9])/g, '<sub>$1</sub>');
  
  // Process superscripts
  result = result.replace(/\^\{([^}]+)\}/g, '<sup>$1</sup>');
  result = result.replace(/\^([a-zA-Z0-9])/g, '<sup>$1</sup>');
  
  // Process fractions
  result = result.replace(/\\frac\s*\{([^}]+)\}\s*\{([^}]+)\}/g, '$1⁄$2');
  
  // Process square root
  result = result.replace(/\\sqrt\s*\{([^}]+)\}/g, '√$1');
  
  // Process Greek letters
  const greekMap: { [key: string]: string } = {
    '\\alpha': 'α', '\\beta': 'β', '\\gamma': 'γ', '\\delta': 'δ',
    '\\epsilon': 'ε', '\\theta': 'θ', '\\lambda': 'λ', '\\mu': 'μ',
    '\\pi': 'π', '\\sigma': 'σ', '\\tau': 'τ', '\\phi': 'φ',
    '\\omega': 'ω', '\\Theta': 'Θ', '\\Omega': 'Ω'
  };
  
  for (const [tex, unicode] of Object.entries(greekMap)) {
    result = result.replace(new RegExp(tex.replace(/\\/g, '\\\\'), 'g'), unicode);
  }
  
  // Process special symbols
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
  
  // Process space commands
  result = result.replace(/\\quad/g, '  ');
  result = result.replace(/\\qquad/g, '    ');
  result = result.replace(/\\,/g, ' ');
  result = result.replace(/\\;/g, ' ');

  // Process arrow symbols
  result = result.replace(/\\rightarrow/g, '→');
  result = result.replace(/\\leftarrow/g, '←');
  result = result.replace(/\\Rightarrow/g, '⇒');
  result = result.replace(/\\Leftarrow/g, '⇐');
  result = result.replace(/\\leftrightarrow/g, '↔');
  result = result.replace(/\\Leftrightarrow/g, '⇔');
  result = result.replace(/\\to/g, '→');
  result = result.replace(/\\gets/g, '←');

  // Process LaTeX bracket commands (remove \left and \right directly, keep brackets themselves)
  result = result.replace(/\\left\s*/g, '');
  result = result.replace(/\\right\s*/g, '');

  // Process escaped braces (use placeholders to protect)
  result = result.replace(/\\\{/g, 'LEFTBRACE');
  result = result.replace(/\\\}/g, 'RIGHTBRACE');
  
  // Clean brackets and backslashes
  result = result.replace(/\{|\}/g, '');
  result = result.replace(/\\/g, '');
  
  // Restore escaped braces
  result = result.replace(/LEFTBRACE/g, '{');
  result = result.replace(/RIGHTBRACE/g, '}');
  
  // Clean consecutive extra spaces (but preserve spaces inside HTML tags)
  result = result.replace(/(?<!<[^>]*)\s{2,}(?![^<]*>)/g, ' ');
  
  // No longer convert letters to italics, keep original letters
  
  return result;
}


/**
 * Process MkDocs admonition syntax
 * Supports two formats:
 * 1. !!! note (use default title)
 * 2. !!! note "Custom title" (use custom title)
 */
function processAdmonitions(markdown: string, docLanguage?: string): { markdown: string; placeholders: Map<string, string> } {
  const lines = markdown.split('\n');
  const result: string[] = [];
  const placeholders = new Map<string, string>();
  let placeholderCounter = 0;
  let i = 0;
  
  while (i < lines.length) {
    const line = lines[i];
    
    // Check if it's admonition start
    const admonitionMatch = line.match(/^!!!\s+(\w+)(?:\s+"([^"]+)")?\s*$/);
    
    if (admonitionMatch) {
      const type = admonitionMatch[1];
      const customTitle = admonitionMatch[2];
      const title = customTitle || getAdmonitionTitle(type, docLanguage);
      
      i++; // Skip admonition marker line
      
      // Collect all indented content (starting with 4 spaces)
      const contentLines: string[] = [];
      while (i < lines.length) {
        const contentLine = lines[i];
        
        // If it's indented line (starting with 4 spaces), belongs to admonition content
        if (contentLine.match(/^    /)) {
          // Remove first 4 spaces
          contentLines.push(contentLine.substring(4));
          i++;
        } 
        // If it's empty line, may also belong to admonition content (need to check next line)
        else if (contentLine.trim() === '') {
          // Look ahead, if next line is still indented, this empty line belongs to admonition
          if (i + 1 < lines.length && lines[i + 1].match(/^    /)) {
            contentLines.push('');
            i++;
          } else {
            // Otherwise admonition ends
            break;
          }
        }
        // Non-indented non-empty line, admonition ends
        else {
          break;
        }
      }
      
      // Generate admonition HTML structure, content part uses placeholder
      const content = contentLines.join('\n').trim();
      const placeholder = `XADMONITIONCONTENTX${placeholderCounter}X`;
      placeholders.set(placeholder, content);
      placeholderCounter++;
      
      result.push(`<div class="admonition ${type}">`);
      // If title is empty, don't display title
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
  
  // If type is in dictionary, use dictionary value; if dictionary value is empty string, it means this type doesn't need a title
  // If type is not in dictionary, return type itself
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
 * Get custom CSS styles
 */
export function getCustomCSS(docLanguage?: string): string {
  const lang = docLanguage || 'zh';

  // Select font configuration based on document language
  let serifFontName = 'Noto Serif SC';
  let serifFontFile = 'NotoSerifSC-Regular.ttf';
  let serifItalicFontFile: string | null = null;
  let bodyFontFamily = '"Noto Serif SC", "Noto Serif CJK SC", "Source Han Serif SC", serif';

  if (lang === 'en') {
    serifFontName = 'Roboto Serif';
    serifFontFile = 'RobotoSerif-VariableFont_GRAD,opsz,wdth,wght.ttf';
    serifItalicFontFile = 'RobotoSerif-Italic-VariableFont_GRAD,opsz,wdth,wght.ttf';
    bodyFontFamily = '"Roboto Serif", serif';
  } else if (lang === 'ja') {
    serifFontName = 'Noto Serif JP';
    serifFontFile = 'NotoSerifJP-VariableFont_wght.ttf';
    bodyFontFamily = '"Noto Serif JP", "Noto Serif CJK JP", serif';
  } else if (lang === 'zh' || lang === 'zh-hant') {
    // Use default Noto Serif SC Regular
  }

  return `
    /* Define embedded fonts */
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
    @font-face {
      font-family: "${serifFontName}";
      src: url(./fonts/${serifFontFile});
      font-style: normal;
      font-weight: normal;
    }
    ${serifItalicFontFile ? `@font-face {
      font-family: "${serifFontName}";
      src: url(./fonts/${serifItalicFontFile});
      font-style: italic;
      font-weight: normal;
    }` : ''}
    @font-face {
      font-family: "JetBrains Mono";
      src: url(./fonts/JetBrainsMonoNerdFont-Regular.ttf);
      font-style: normal;
      font-weight: normal;
    }

    body {
      font-family: ${bodyFontFamily};
      line-height: 1.6;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      color: #333;
    }
    /* Link styles */
    a {
      color: #1581CB;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    /* Center-aligned paragraphs (compatible with <p align="center"> syntax, converted to .text-center) */
    .text-center {
      text-align: center;
    }
    /* Reduce bold text font weight */
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
    /* Chapter title (Chapter X) */
    h1 {
      font-size: 1.5em;
      text-align: center;
    }
    /* Section title (X.Y) */
    h2 { font-size: 1.3em; }
    /* Main heading within Markdown document */
    h3 { font-size: 1.15em; }
    /* Subheading within Markdown document */
    h4 { font-size: 1.05em; }
    h5 { font-size: 1.0em; }
    h6 { font-size: 1.0em; }
    /* Inline code */
    code {
      background-color: #f0f0f0;
      padding: 2px 6px;
      border-radius: 3px;
      border: 1px solid #d0d0d0;
      font-family: "JetBrains Mono", "Consolas", "Monaco", "Courier New", monospace;
      font-size: 0.82em;
      color: #333;
    }

    /* Code blocks */
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
      font-family: "JetBrains Mono", "Consolas", "Monaco", "Courier New", monospace;
      font-size: 0.78em;
      color: #24292e;
      display: block;
    }
    img {
      max-width: 100%;
      height: auto;
      display: block;
      margin: 20px auto;
      border-radius: 8px;
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
      font-size: 0.8em;
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
      font-size: 1em;
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
      padding: 12px 16px 8px 16px;
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
 * Wrap HTML content (simplified version, styles provided by CSS file)
 */
function wrapHtmlContent(html: string): string {
  return html;
}

/**
 * Extract all headings from Markdown text
 * @param markdown Markdown text
 * @param chapterPath Chapter path (for identification)
 * @returns Heading list
 */
export function extractHeadings(markdown: string, chapterPath: string): HeadingInfo[] {
  const headings: HeadingInfo[] = [];
  const lines = markdown.split('\n');
  let inCodeBlock = false;
  let inFencedBlock = false;
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    // Check code block boundaries (three backticks or tildes)
    if (line.match(/^\s*```/) || line.match(/^\s*~~~/)) {
      inCodeBlock = !inCodeBlock;
      continue;
    }
    
    // Check indented code blocks (4 spaces)
    if (line.match(/^    /) && !inCodeBlock) {
      inFencedBlock = true;
      continue;
    } else if (inFencedBlock && !line.match(/^    /) && line.trim()) {
      inFencedBlock = false;
    }
    
    // Skip content in code blocks
    if (inCodeBlock || inFencedBlock) {
      continue;
    }
    
    // Match ATX-style headings: # ## ### etc.
    const match = line.match(/^(#{1,6})\s+(.+)$/);
    if (match) {
      const level = match[1].length;
      let text = match[2].trim();
      
      // Remove Markdown formatting and math formulas from heading, keep plain text
      text = text
        .replace(/\$[^$]+\$/g, '') // Remove inline math formulas
        .replace(/\*\*(.+?)\*\*/g, '$1') // Remove bold
        .replace(/\*(.+?)\*/g, '$1') // Remove italic
        .replace(/`(.+?)`/g, '$1') // Remove code
        .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1') // Remove links, keep text
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
 * Extract image paths from Markdown
 */
export function extractImagePaths(markdown: string, markdownFilePath: string): Array<{ original: string; fullPath: string }> {
  const imageRegex = /!\[([^\]]*)\]\(([^)]+)\)/g;
  const paths: Array<{ original: string; fullPath: string }> = [];
  let match;
  const markdownDir = path.dirname(markdownFilePath);
  const docsRoot = path.resolve(markdownDir, '..');

  while ((match = imageRegex.exec(markdown)) !== null) {
    const imagePath = match[2];
    // Handle relative paths
    if (!imagePath.startsWith('http://') && !imagePath.startsWith('https://') && !imagePath.startsWith('data:')) {
      // Try multiple possible paths
      const possiblePaths = [
        path.resolve(markdownDir, imagePath),  // Relative to current markdown file
        path.resolve(docsRoot, imagePath),     // Relative to docs root directory
        path.resolve(markdownDir, '..', imagePath), // Parent directory
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
 * Read image file
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
    console.warn(`Unable to read image: ${imagePath}`, error);
    return null;
  }
}

/**
 * Convert image to base64 data URI
 */
export function imageToDataUri(imageInfo: ImageInfo): string {
  const base64 = imageInfo.data.toString('base64');
  return `data:${imageInfo.mimeType};base64,${base64}`;
}

