import { marked } from 'marked';
import * as path from 'path';
import * as fs from 'fs-extra';
import { HeadingInfo } from './types';
import { ImageInfo } from './types';
import hljs from 'highlight.js';

/**
 * 配置 marked 渲染器
 */
function configureMarked(headingOffset: number = 0, headingPrefix: string = '') {
  const renderer = new marked.Renderer();
  
  // 用于跟踪标题编号
  let h2Counter = 0; // 二级标题计数器（对应 Markdown 的 ##）
  let h3Counter = 0; // 三级标题计数器（对应 Markdown 的 ###）

  // 自定义标题渲染，支持标题级别偏移和自动编号
  renderer.heading = (text: string, level: number) => {
    const adjustedLevel = Math.min(level + headingOffset, 6); // 最大为 h6
    let numberedText = text;
    
    // 对于二级标题（Markdown 中的 ##），在主标题编号后添加 .1, .2, .3...
    if (level === 2 && headingPrefix) {
      h2Counter++;
      h3Counter = 0; // 重置三级标题计数器
      numberedText = `${headingPrefix}.${h2Counter} ${text}`;
    }
    // 对于三级标题（Markdown 中的 ###），添加 1., 2., 3...
    else if (level === 3) {
      h3Counter++;
      numberedText = `${h3Counter}. ${text}`;
    }
    // 对于四级标题，也可以继续编号（如果需要的话）
    
    return `<h${adjustedLevel}>${numberedText}</h${adjustedLevel}>\n`;
  };

  // 自定义图片渲染，用于后续提取图片
  renderer.image = (href: string, title: string | null, text: string) => {
    return `<img src="${href}" alt="${text || ''}" ${title ? `title="${title}"` : ''} />`;
  };

  // 自定义代码块渲染，支持 title 属性和语法高亮
  renderer.code = (code: string, language: string | undefined, escaped: boolean) => {
    let lang = language || 'text';
    let highlightedCode = code;

    // 从 language 参数中提取 title（格式：cpp title="heap.cpp"）
    // marked 会将整个 infostring 作为 language 参数传递
    if (language) {
      const titleMatch = language.match(/title="([^"]+)"/);
      if (titleMatch) {
        const filename = titleMatch[1];
        // 从 language 中移除 title 部分，只保留语言标识
        lang = language.replace(/\s+title="[^"]+"/, '').trim() || 'text';

        // 使用 highlight.js 进行语法高亮
        try {
          if (lang && lang !== 'text' && hljs.getLanguage(lang)) {
            const result = hljs.highlight(code, { language: lang });
            highlightedCode = result.value;
          } else {
            // 如果不支持该语言，使用自动检测
            const result = hljs.highlightAuto(code);
            highlightedCode = result.value;
            lang = result.language || 'text';
          }
        } catch (error) {
          console.warn(`语法高亮失败，使用原始代码: ${error}`);
          highlightedCode = escapeHtml(code);
        }

        // 将文件名作为注释添加到代码开头
        const codeWithFilename = `// ${escapeHtml(filename)}\n\n${highlightedCode}`;
        return `<pre><code class="hljs language-${lang}">${codeWithFilename}</code></pre>`;
      }
    }

    // 使用 highlight.js 进行语法高亮
    try {
      if (lang && lang !== 'text' && hljs.getLanguage(lang)) {
        const result = hljs.highlight(code, { language: lang });
        highlightedCode = result.value;
      } else {
        // 如果不支持该语言，使用自动检测
        const result = hljs.highlightAuto(code);
        highlightedCode = result.value;
        lang = result.language || 'text';
      }
    } catch (error) {
      console.warn(`语法高亮失败，使用原始代码: ${error}`);
      highlightedCode = escaped ? code : escapeHtml(code);
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
 * 将 Markdown 转换为 HTML
 * @param markdown Markdown 文本
 * @param baseDir 基础目录
 * @param headingOffset 标题级别偏移量（默认为 2，即 H1->H3）
 * @param firstHeadingPrefix 第一个标题的前缀（如章节编号，用于二级标题自动编号）
 * @param removeFirstHeading 是否移除第一个标题
 */
export function markdownToHtml(markdown: string, baseDir: string, headingOffset: number = 2, firstHeadingPrefix: string = '', removeFirstHeading: boolean = false): string {
  configureMarked(headingOffset, firstHeadingPrefix);
  
  // 如果需要移除第一个标题（用于章节级别的文档）
  if (removeFirstHeading) {
    markdown = markdown.replace(/^#\s+.+$/m, '');
  }
  // 否则，如果需要为第一个标题添加前缀（章节编号）
  else if (firstHeadingPrefix) {
    // 匹配第一个 H1 标题（# 标题）并在前面添加编号
    markdown = markdown.replace(/^#\s+(.+)$/m, `# ${firstHeadingPrefix} $1`);
  }
  
  // 处理代码引用标记（在其他处理之前）
  markdown = processCodeReferences(markdown, baseDir);
  
  // 处理多语言代码块，只保留 C++ 版本
  markdown = processMultiLanguageCodeBlocks(markdown);
  
  // 处理 tabbed 内容（=== "<1>", === "ArrayStack" 等非编程语言标签）
  markdown = processTabbedContent(markdown);
  
  // 处理特殊的 admonition 语法（!!! abstract, !!! success 等）
  markdown = processAdmonitions(markdown);
  
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
  
  return wrapHtmlContent(html);
}

/**
 * 处理代码引用标记
 * 格式: [file]{filename}-[class]{classname}-[func]{funcname}
 */
function processCodeReferences(markdown: string, baseDir: string): string {
  // 匹配 ```src 代码块中的引用标记
  const codeBlockRegex = /```src\s*\n\[file\]\{([^}]+)\}-\[class\]\{([^}]*)\}-\[func\]\{([^}]+)\}\s*\n```/g;
  
  markdown = markdown.replace(codeBlockRegex, (match, filename, classname, funcname) => {
    try {
      // 转换函数名：下划线转驼峰 (level_order -> levelOrder)
      let actualFuncName = snakeToCamel(funcname);
      
      // 特殊处理：Python 的 __init__ 在 C++ 中是构造函数（与类名相同）
      if (funcname === '__init__' && classname) {
        // 构造函数名就是类名（首字母大写）
        actualFuncName = snakeToCamel(classname).replace(/^./, (c) => c.toUpperCase());
      }
      
      // 查找代码文件（在 codes/cpp 目录下）
      // baseDir 是 markdown 文件所在目录，如 /path/to/docs/chapter_xxx
      // 需要回到项目根目录：../../
      const projectRoot = path.resolve(baseDir, '..', '..');
      const cppCodesDir = path.join(projectRoot, 'codes', 'cpp');
      
      // 递归查找文件
      const codeFilePath = findCodeFile(cppCodesDir, `${filename}.cpp`);
      
      if (!codeFilePath) {
        console.warn(`未找到代码文件: ${filename}.cpp`);
        return match; // 保持原样
      }
      
      // 读取代码文件
      const codeContent = fs.readFileSync(codeFilePath, 'utf-8');
      
      // 提取函数或方法代码
      let extractedCode = '';
      if (classname) {
        // 提取类方法
        extractedCode = extractClassMethod(codeContent, classname, actualFuncName);
      } else {
        // 提取独立函数
        extractedCode = extractFunction(codeContent, actualFuncName);
      }
      
      if (!extractedCode) {
        console.warn(`未找到函数: ${actualFuncName} in ${filename}.cpp`);
        return match; // 保持原样
      }
      
      // 生成带文件名的代码块
      const codeBlock = `\`\`\`cpp title="${filename}.cpp"\n${extractedCode}\n\`\`\``;
      return codeBlock;
      
    } catch (error) {
      console.error(`处理代码引用时出错: ${filename}`, error);
      return match; // 保持原样
    }
  });
  
  return markdown;
}

/**
 * 将下划线命名转换为驼峰命名
 * 例如: level_order -> levelOrder, while_loop_ii -> whileLoopII
 *       graph_bfs -> graphBFS, climbing_stairs_dfs_mem -> climbingStairsDFSMem
 */
function snakeToCamel(str: string): string {
  // 常见的缩写词（2-4个字母），这些作为独立词时应该全部大写
  const shortAcronyms = ['bfs', 'dfs', 'dp', 'ii', 'id', 'lcro'];
  // 较长的缩写词，应该首字母大写
  const longAcronyms = ['avl', 'bst', 'mem', 'comp'];
  
  const parts = str.split('_');
  return parts.map((word, index) => {
    if (index === 0) {
      // 第一个词保持小写
      return word;
    }
    
    // 如果是多个相同字母（如 ii），全部转大写
    if (/^([a-z])\1+$/.test(word)) {
      return word.toUpperCase();
    }
    
    // 如果是短缩写（2-4个字母），全部转大写
    if (word.length <= 4 && shortAcronyms.includes(word.toLowerCase())) {
      return word.toUpperCase();
    }
    
    // 其他情况（包括长缩写），首字母大写
    return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
  }).join('');
}

/**
 * 递归查找代码文件
 */
function findCodeFile(dir: string, filename: string): string | null {
  try {
    const files = fs.readdirSync(dir);
    
    for (const file of files) {
      const fullPath = path.join(dir, file);
      const stat = fs.statSync(fullPath);
      
      if (stat.isDirectory()) {
        const found = findCodeFile(fullPath, filename);
        if (found) return found;
      } else if (file === filename) {
        return fullPath;
      }
    }
  } catch (error) {
    // 忽略错误，继续查找
  }
  
  return null;
}

/**
 * 提取独立函数代码
 */
function extractFunction(codeContent: string, funcName: string): string {
  // 匹配函数定义（包括注释）
  // 格式: /* 注释 */\nreturnType funcName(params) {\n...\n}
  const lines = codeContent.split('\n');
  let startIdx = -1;
  let endIdx = -1;
  let braceCount = 0;
  let inFunction = false;
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    // 查找函数定义
    if (!inFunction) {
      // 匹配函数签名，如: int forLoop(int n) {
      const funcRegex = new RegExp(`\\b${funcName}\\s*\\(`);
      if (funcRegex.test(line)) {
        // 向上查找注释（如果有）
        startIdx = i;
        // 检查前一行是否有注释
        if (i > 0 && lines[i - 1].trim().startsWith('/*')) {
          startIdx = i - 1;
        }
        inFunction = true;
      }
    }
    
    // 统计大括号
    if (inFunction) {
      for (const char of line) {
        if (char === '{') braceCount++;
        if (char === '}') braceCount--;
      }
      
      // 找到函数结束
      if (braceCount === 0 && line.includes('}')) {
        endIdx = i;
        break;
      }
    }
  }
  
  if (startIdx !== -1 && endIdx !== -1) {
    return lines.slice(startIdx, endIdx + 1).join('\n');
  }
  
  return '';
}

/**
 * 提取类方法代码
 */
function extractClassMethod(codeContent: string, className: string, methodName: string): string {
  // 首先找到类定义
  const lines = codeContent.split('\n');
  let classStartIdx = -1;
  let classEndIdx = -1;
  let braceCount = 0;
  let inClass = false;
  
  // 转换类名：下划线转驼峰并首字母大写
  const actualClassName = snakeToCamel(className).replace(/^./, (c) => c.toUpperCase());
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    
    // 查找类定义（不区分大小写，以支持 AVLTree 这样的首字母缩写）
    if (!inClass) {
      const classRegex = new RegExp(`class\\s+${actualClassName}\\b`, 'i');
      if (classRegex.test(line)) {
        classStartIdx = i;
        inClass = true;
      }
    }
    
    // 统计大括号
    if (inClass) {
      for (const char of line) {
        if (char === '{') braceCount++;
        if (char === '}') {
          braceCount--;
          if (braceCount === 0) {
            classEndIdx = i;
            break;
          }
        }
      }
    }
    
    if (classEndIdx !== -1) break;
  }
  
  if (classStartIdx === -1 || classEndIdx === -1) {
    return '';
  }
  
  // 在类定义中查找方法（忽略访问修饰符）
  let methodStartIdx = -1;
  let methodEndIdx = -1;
  braceCount = 0;
  let inMethod = false;
  let methodBraceStart = false;
  
  for (let i = classStartIdx; i <= classEndIdx; i++) {
    const line = lines[i];
    const trimmedLine = line.trim();
    
    // 跳过访问修饰符行
    if (trimmedLine === 'public:' || trimmedLine === 'private:' || trimmedLine === 'protected:') {
      continue;
    }
    
    if (!inMethod) {
      // 匹配方法签名（可能是返回类型 methodName(参数) 或 methodName(参数)）
      const methodRegex = new RegExp(`\\b${methodName}\\s*\\(`);
      if (methodRegex.test(line)) {
        // 向上查找注释
        methodStartIdx = i;
        // 向上查找多行注释
        for (let j = i - 1; j >= classStartIdx; j--) {
          const prevLine = lines[j].trim();
          if (prevLine.startsWith('/*') || prevLine.startsWith('*') || prevLine.startsWith('//')) {
            methodStartIdx = j;
          } else if (prevLine === '') {
            // 空行，继续向上
            continue;
          } else {
            // 非注释行，停止
            break;
          }
        }
        inMethod = true;
        braceCount = 0;
        methodBraceStart = false;
        
        // 立即处理当前行的大括号（方法签名行可能就包含 {）
        for (const char of line) {
          if (char === '{') {
            braceCount++;
            methodBraceStart = true;
          }
          if (char === '}') {
            braceCount--;
          }
        }
        
        // 检查是否在同一行就结束了（单行方法，虽然罕见）
        if (methodBraceStart && braceCount === 0) {
          methodEndIdx = i;
          break;
        }
        
        continue; // 继续处理下一行
      }
    }
    
    if (inMethod) {
      // 计算大括号
      for (const char of line) {
        if (char === '{') {
          braceCount++;
          methodBraceStart = true;
        }
        if (char === '}') {
          braceCount--;
        }
      }
      
      // 如果已经开始计数，且括号归零，方法结束
      if (methodBraceStart && braceCount === 0) {
        methodEndIdx = i;
        break;
      }
    }
  }
  
  if (methodStartIdx !== -1 && methodEndIdx !== -1) {
    return lines.slice(methodStartIdx, methodEndIdx + 1).join('\n');
  }
  
  return '';
}

/**
 * 处理多语言代码块，只保留 C++ 语言版本
 * 格式: === "语言名" ... ```代码``` ...
 */
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

function processMultiLanguageCodeBlocks(markdown: string): string {
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
        
        // 检查是否是下一个语言标签
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
        
        // 检查是否是代码块开始/结束
        if (currentLine.match(/^\s*```/)) {
          inCodeBlock = !inCodeBlock;
          currentBlockLines.push(currentLine);
          i++;
          continue;
        }
        
        // 检查是否代码块组结束
        // 如果不在代码块内，且遇到非缩进的非空行（且不是下一个语言标签），代码块组结束
        if (!inCodeBlock && currentLine.trim()) {
          // 如果是标题行（以 # 开头）或普通段落（非缩进且不是空行且不是语言标签且不是 admonition），代码块组结束
          // 注意：??? 开头的行是 admonition，应该被包含在当前块中，不应该作为代码块组结束的标志
          // 只有当遇到真正的段落内容（非标题、非语言标签、非 admonition）时才结束
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
        
        // 添加到当前块（包括空行）
        currentBlockLines.push(currentLine);
        i++;
      }
      
      // 如果循环结束，保存最后一个块
      if (currentBlockLines.length > 0) {
        blocks.push({ lang: currentLang, lines: currentBlockLines });
      }
      
      // 查找 C++ 语言版本
      const cppBlock = blocks.find(b => b.lang === 'C++');
      
      if (cppBlock) {
        // 只保留 C++ 语言版本的代码块（去掉缩进）
        for (const blockLine of cppBlock.lines) {
          // 移除开头的 4 个空格缩进
          result.push(blockLine.replace(/^    /, ''));
        }
      } else if (blocks.length > 0) {
        // 如果没有 C++ 版本，保留第一个版本
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
  
  // 将字母转为斜体（避免 HTML 标签内和罗马字体内）
  result = result.replace(/(?<!<[^>]*(?:math-roman)?[^>]*>)(?<!&)([a-zA-Z])(?![^<]*>)(?![a-zA-Z]*;)/g, (match, letter, offset, string) => {
    const before = string.substring(Math.max(0, offset - 10), offset);
    if (before.match(/&[a-zA-Z]*$/)) {
      return letter;
    }
    return `<i>${letter}</i>`;
  });
  
  return result;
}


/**
 * 处理 MkDocs 的 admonition 语法
 * 支持两种格式：
 * 1. !!! note（使用默认标题）
 * 2. !!! note "自定义标题"（使用自定义标题）
 */
function processAdmonitions(markdown: string): string {
  const lines = markdown.split('\n');
  const result: string[] = [];
  let i = 0;
  
  while (i < lines.length) {
    const line = lines[i];
    
    // 检查是否是 admonition 开始
    const admonitionMatch = line.match(/^!!!\s+(\w+)(?:\s+"([^"]+)")?\s*$/);
    
    if (admonitionMatch) {
      const type = admonitionMatch[1];
      const customTitle = admonitionMatch[2];
      const title = customTitle || getAdmonitionTitle(type);
      
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
      
      // 生成 admonition HTML
      const content = contentLines.join('\n').trim();
      result.push(`<div class="admonition ${type}">`);
      result.push(`<div class="admonition-title">${title}</div>`);
      result.push(content);
      result.push(`</div>`);
      
      continue;
    }
    
    // 普通行
    result.push(line);
    i++;
  }
  
  return result.join('\n');
}

function getAdmonitionTitle(type: string): string {
  const titles: { [key: string]: string } = {
    abstract: '摘要',
    success: '成功',
    info: '信息',
    warning: '警告',
    danger: '危险',
    note: '注意',
    tip: '提示',
  };
  return titles[type] || type;
}

/**
 * 获取自定义 CSS 样式
 */
export function getCustomCSS(): string {
  return `
    body {
      font-family: "Noto Sans SC", "Microsoft YaHei", sans-serif;
      line-height: 1.6;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      color: #333;
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
      padding: 14px 16px;
      background-color: #f5f5f5;
      border: 1.5px solid #d0d0d0;
      border-radius: 6px;
      margin: 16px 0;
      line-height: 1.65;
      page-break-inside: auto !important;
      break-inside: auto !important;
    }
    
    pre code {
      background-color: transparent;
      padding: 0;
      border: none;
      white-space: pre-wrap;
      word-wrap: break-word;
      word-break: break-all;
      overflow-wrap: break-word;
      font-family: "Roboto Mono", "Noto Sans Mono", "Droid Sans Mono", "SF Mono", "JetBrains Mono", "Fira Code", "Source Code Pro", "Consolas", "Menlo", "Monaco", "DejaVu Sans Mono", "Liberation Mono", "Courier New", Courier, monospace;
      font-size: 0.85em;
      color: #333;
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
      font-family: Georgia, "Times New Roman", Times, serif;
      font-size: 1.05em;
      vertical-align: baseline;
      line-height: 1.4;
      font-weight: normal;
      letter-spacing: 0.01em;
    }
    .math-inline i {
      font-style: italic;
      font-family: Georgia, "Times New Roman", Times, serif;
    }
    .math-block {
      text-align: center;
      margin: 20px 0;
      padding: 10px;
      font-family: Georgia, "Times New Roman", Times, serif;
    }
    .math-block i {
      font-style: italic;
      font-family: Georgia, "Times New Roman", Times, serif;
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
      font-family: Georgia, "Times New Roman", Times, serif;
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
      border: 2px solid #3498db;
      border-radius: 6px;
      background-color: #f8f9fa;
    }
    .admonition-title {
      font-weight: 600;
      margin-bottom: 8px;
      color: #2c3e50;
    }
    .admonition.note {
      border-color: #17a2b8;
      background-color: #e7f6f8;
    }
    .admonition.tip {
      border-color: #28a745;
      background-color: #d4edda;
    }
    .admonition.success {
      border-color: #28a745;
      background-color: #d4edda;
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
    ul, ol {
      padding-left: 30px;
    }
    li {
      margin: 5px 0;
    }

    /* Syntax highlighting styles (GitHub theme) */
    .hljs {
      display: block;
      padding: 0.5em;
      color: #333;
      background: #f8f8f8;
    }

    .hljs-comment,
    .hljs-quote {
      color: #998;
      font-style: italic;
    }

    .hljs-keyword,
    .hljs-selector-tag,
    .hljs-subst {
      color: #333;
      font-weight: bold;
    }

    .hljs-number,
    .hljs-literal,
    .hljs-variable,
    .hljs-template-variable,
    .hljs-tag .hljs-attr {
      color: #008080;
    }

    .hljs-string,
    .hljs-doctag {
      color: #d14;
    }

    .hljs-title,
    .hljs-section,
    .hljs-selector-id {
      color: #900;
      font-weight: bold;
    }

    .hljs-subst {
      font-weight: normal;
    }

    .hljs-type,
    .hljs-class .hljs-title {
      color: #458;
      font-weight: bold;
    }

    .hljs-tag,
    .hljs-name,
    .hljs-attribute {
      color: #000080;
      font-weight: normal;
    }

    .hljs-regexp,
    .hljs-link {
      color: #009926;
    }

    .hljs-symbol,
    .hljs-bullet {
      color: #990073;
    }

    .hljs-built_in,
    .hljs-builtin-name {
      color: #0086b3;
    }

    .hljs-meta {
      color: #999;
      font-weight: bold;
    }

    .hljs-deletion {
      background: #fdd;
    }

    .hljs-addition {
      background: #dfd;
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

