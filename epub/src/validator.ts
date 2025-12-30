import * as fs from 'fs-extra';
import * as path from 'path';
import { HeadingInfo } from './types';
const AdmZip = require('adm-zip');

/**
 * Validate if EPUB contains all headings
 * @param epubPath EPUB file path
 * @param expectedHeadings Expected heading list
 * @returns Validation result
 */
export async function validateEpubHeadings(
  epubPath: string,
  expectedHeadings: HeadingInfo[]
): Promise<{ success: boolean; missingHeadings: HeadingInfo[]; summary: string }> {
  
  console.log(`\nStarting EPUB content validation...`);
  console.log(`Expected heading count: ${expectedHeadings.length}`);
  
  try {
    // Extract EPUB
    const zip = new AdmZip(epubPath);
    const zipEntries = zip.getEntries();
    
    // Extract all XHTML content
    let allHtmlContent = '';
    for (const entry of zipEntries) {
      if (entry.entryName.endsWith('.xhtml') || entry.entryName.endsWith('.html')) {
        const content = entry.getData().toString('utf8');
        allHtmlContent += content + '\n';
      }
    }
    
    // Check if each heading exists
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
    
    // Generate report
    const successRate = ((foundHeadings.length / expectedHeadings.length) * 100).toFixed(2);
    
    let summary = `\n${'='.repeat(60)}\n`;
    summary += `EPUB Content Validation Report\n`;
    summary += `${'='.repeat(60)}\n`;
    summary += `Total headings: ${expectedHeadings.length}\n`;
    summary += `Found: ${foundHeadings.length}\n`;
    summary += `Missing: ${missingHeadings.length}\n`;
    summary += `Completeness rate: ${successRate}%\n`;
    summary += `${'='.repeat(60)}\n`;
    
    if (missingHeadings.length > 0) {
      summary += `\n⚠️  Missing headings:\n`;
      summary += `${'='.repeat(60)}\n`;
      
      // Group by chapter
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
            summary += ` (line ${heading.lineNumber})`;
          }
          summary += `\n`;
        }
      }
      summary += `\n`;
    } else {
      summary += `\n✅ All headings are included in the EPUB!\n\n`;
    }
    
    console.log(summary);
    
    return {
      success: missingHeadings.length === 0,
      missingHeadings,
      summary
    };
    
  } catch (error) {
    console.error('Error during validation:', error);
    return {
      success: false,
      missingHeadings: expectedHeadings,
      summary: `Validation failed: ${error}`
    };
  }
}

/**
 * Check if heading exists in HTML
 */
function checkHeadingInHtml(html: string, heading: HeadingInfo): boolean {
  // Remove HTML tags and entities, keep only text
  const cleanHtml = html
    .replace(/<script[^>]*>[\s\S]*?<\/script>/gi, '') // Remove scripts
    .replace(/<style[^>]*>[\s\S]*?<\/style>/gi, '') // Remove styles
    .replace(/<[^>]+>/g, ' ') // Remove all HTML tags
    .replace(/&nbsp;/g, ' ')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    // Decode numeric entities
    .replace(/&#x([0-9A-Fa-f]+);/g, (match, hex) => {
      return String.fromCharCode(parseInt(hex, 16));
    })
    .replace(/&#(\d+);/g, (match, dec) => {
      return String.fromCharCode(parseInt(dec, 10));
    });
  
  // Normalize text: remove extra spaces
  const normalizedHtml = cleanHtml.replace(/\s+/g, ' ').toLowerCase();
  const normalizedHeading = heading.text.replace(/\s+/g, ' ').toLowerCase();
  
  // Check if heading text is included
  return normalizedHtml.includes(normalizedHeading);
}



