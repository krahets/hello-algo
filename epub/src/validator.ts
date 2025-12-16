import * as fs from 'fs-extra';
import * as path from 'path';
import { HeadingInfo } from './types';
const AdmZip = require('adm-zip');

/**
 * 验证 EPUB 中是否包含所有标题
 * @param epubPath EPUB 文件路径
 * @param expectedHeadings 期望的标题列表
 * @returns 验证结果
 */
export async function validateEpubHeadings(
  epubPath: string,
  expectedHeadings: HeadingInfo[]
): Promise<{ success: boolean; missingHeadings: HeadingInfo[]; summary: string }> {
  
  console.log(`\n开始验证 EPUB 内容...`);
  console.log(`期望标题数量: ${expectedHeadings.length}`);
  
  try {
    // 解压 EPUB
    const zip = new AdmZip(epubPath);
    const zipEntries = zip.getEntries();
    
    // 提取所有 XHTML 内容
    let allHtmlContent = '';
    for (const entry of zipEntries) {
      if (entry.entryName.endsWith('.xhtml') || entry.entryName.endsWith('.html')) {
        const content = entry.getData().toString('utf8');
        allHtmlContent += content + '\n';
      }
    }
    
    // 检查每个标题是否存在
    const missingHeadings: HeadingInfo[] = [];
    const foundHeadings: HeadingInfo[] = [];
    
    for (const heading of expectedHeadings) {
      const found = checkHeadingInHtml(allHtmlContent, heading);
      if (found) {
        foundHeadings.push(heading);
      } else {
        missingHeadings.push(heading);
      }
    }
    
    // 生成报告
    const successRate = ((foundHeadings.length / expectedHeadings.length) * 100).toFixed(2);
    
    let summary = `\n${'='.repeat(60)}\n`;
    summary += `EPUB 内容验证报告\n`;
    summary += `${'='.repeat(60)}\n`;
    summary += `总标题数: ${expectedHeadings.length}\n`;
    summary += `已找到: ${foundHeadings.length}\n`;
    summary += `缺失: ${missingHeadings.length}\n`;
    summary += `完整率: ${successRate}%\n`;
    summary += `${'='.repeat(60)}\n`;
    
    if (missingHeadings.length > 0) {
      summary += `\n⚠️  缺失的标题:\n`;
      summary += `${'='.repeat(60)}\n`;
      
      // 按章节分组显示
      const byChapter = new Map<string, HeadingInfo[]>();
      for (const heading of missingHeadings) {
        if (!byChapter.has(heading.chapterPath)) {
          byChapter.set(heading.chapterPath, []);
        }
        byChapter.get(heading.chapterPath)!.push(heading);
      }
      
      for (const [chapterPath, headings] of byChapter) {
        summary += `\n📄 ${chapterPath}\n`;
        for (const heading of headings) {
          const indent = '  '.repeat(heading.level - 1);
          summary += `${indent}${'#'.repeat(heading.level)} ${heading.text}`;
          if (heading.lineNumber) {
            summary += ` (行 ${heading.lineNumber})`;
          }
          summary += `\n`;
        }
      }
      summary += `\n`;
    } else {
      summary += `\n✅ 所有标题都已包含在 EPUB 中！\n\n`;
    }
    
    console.log(summary);
    
    return {
      success: missingHeadings.length === 0,
      missingHeadings,
      summary
    };
    
  } catch (error) {
    console.error('验证过程中出错:', error);
    return {
      success: false,
      missingHeadings: expectedHeadings,
      summary: `验证失败: ${error}`
    };
  }
}

/**
 * 检查标题是否在 HTML 中
 */
function checkHeadingInHtml(html: string, heading: HeadingInfo): boolean {
  // 移除 HTML 标签和实体，只保留文本
  const cleanHtml = html
    .replace(/<script[^>]*>[\s\S]*?<\/script>/gi, '') // 移除脚本
    .replace(/<style[^>]*>[\s\S]*?<\/style>/gi, '') // 移除样式
    .replace(/<[^>]+>/g, ' ') // 移除所有 HTML 标签
    .replace(/&nbsp;/g, ' ')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    // 解码数字实体
    .replace(/&#x([0-9A-Fa-f]+);/g, (match, hex) => {
      return String.fromCharCode(parseInt(hex, 16));
    })
    .replace(/&#(\d+);/g, (match, dec) => {
      return String.fromCharCode(parseInt(dec, 10));
    });
  
  // 标准化文本：移除多余空格
  const normalizedHtml = cleanHtml.replace(/\s+/g, ' ').toLowerCase();
  const normalizedHeading = heading.text.replace(/\s+/g, ' ').toLowerCase();
  
  // 检查是否包含标题文本
  return normalizedHtml.includes(normalizedHeading);
}



