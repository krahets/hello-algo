import * as fs from 'fs-extra';
import * as path from 'path';
import * as yaml from 'js-yaml';
import { NavItem, Chapter, MkDocsNavItem } from './types';

/**
 * Parse mkdocs.yml file to extract version number
 */
export function parseVersion(configPath: string): string {
  const content = fs.readFileSync(configPath, 'utf-8');
  const config = yaml.load(content) as any;
  return config.version || '1.0.0';
}

/**
 * Parse mkdocs.yml file to extract navigation structure
 */
export function parseMkdocsConfig(configPath: string): MkDocsNavItem[] {
  const content = fs.readFileSync(configPath, 'utf-8');
  const config = yaml.load(content) as any;
  return config.nav || [];
}

/**
 * Flatten navigation structure, extract all chapter paths while preserving hierarchy
 * Based on mkdocs.yml structure:
 * - Parent titles (e.g., "Chapter 0 Preface") contain arrays of child items
 * - Child items can be string paths (index.md) or objects (sub-chapters)
 */
export function flattenNav(nav: MkDocsNavItem[], basePath: string = ''): Chapter[] {
  const chapters: Chapter[] = [];
  let order = 0;

  function traverse(items: MkDocsNavItem[], parentTitle: string = '', parentNumber: string = '', level: number = 0) {
    for (const item of items) {
      if (typeof item === 'string') {
        // Simple path string (usually index.md, as chapter homepage)
        const filePath = path.join(basePath, item);
        if (fs.existsSync(filePath)) {
          // Try to extract title from file content
          const content = fs.readFileSync(filePath, 'utf-8');
          const titleMatch = content.match(/^#\s+(.+)$/m);
          const title = titleMatch ? titleMatch[1].trim() : path.basename(item, '.md');
          
          // index.md uses parent chapter's title and number
          chapters.push({
            title: parentTitle || title, // If parent title exists, use it; otherwise use file title
            path: filePath,
            content: '',
            order: order++,
            level: level,
            number: parentNumber || undefined,
            parentTitle: undefined // index.md is top-level chapter
          });
        }
      } else if (typeof item === 'object' && item !== null) {
        // Handle object format: { "title": "path" } or { "title": [...] }
        if (Array.isArray(item)) {
          traverse(item, parentTitle, parentNumber, level);
        } else {
          const keys = Object.keys(item);
          if (keys.length === 1) {
            const key = keys[0];
            const value = item[key];
            
            if (typeof value === 'string') {
              // { "title": "path" } format - this is a sub-chapter (e.g., "0.1 &nbsp; About this book": "path")
              const filePath = path.join(basePath, value);
              if (fs.existsSync(filePath)) {
                const fullTitle = key.replace(/&nbsp;/g, ' ').trim();
                
                // Extract chapter number, e.g., "0.1 &nbsp; About this book" -> "0.1"
                const numberMatch = fullTitle.match(/^(\d+(?:\.\d+)?)\s+/);
                let chapterNumber = numberMatch ? numberMatch[1] : undefined;
                
                // Extract title (remove number part)
                const title = fullTitle.replace(/^\d+(?:\.\d+)?\s+/, '').trim();
                
                chapters.push({
                  title: title,
                  path: filePath,
                  content: '',
                  order: order++,
                  level: level + 1, // Sub-chapter level +1
                  number: chapterNumber,
                  parentTitle: parentTitle || undefined
                });
              }
            } else if (Array.isArray(value)) {
              // { "title": [...] } format - this is parent chapter title and child items (e.g., "Chapter 0 Preface": [...])
              const chapterTitle = key.replace(/&nbsp;/g, ' ').trim();
              
              // Extract chapter number from title, e.g., "Chapter 0 &nbsp; Preface" -> "0"
              let chapterNumber = '';
              const numberMatch = chapterTitle.match(/第\s*(\d+)\s*章/);
              if (numberMatch) {
                chapterNumber = numberMatch[1];
              } else {
                // If no number found, try to infer from first sub-chapter (e.g., infer "0" from "0.1")
                for (const subItem of value) {
                  if (typeof subItem === 'string') {
                    continue;
                  } else if (typeof subItem === 'object' && subItem !== null && !Array.isArray(subItem)) {
                    const subObj = subItem as { [key: string]: string | MkDocsNavItem[] };
                    const subKeys = Object.keys(subObj);
                    if (subKeys.length === 1) {
                      const subKey = subKeys[0];
                      const subValue = subObj[subKey];
                      if (typeof subValue === 'string') {
                        const subTitle = subKey.replace(/&nbsp;/g, ' ').trim();
                        const subNumberMatch = subTitle.match(/^(\d+)\.\d+/);
                        if (subNumberMatch) {
                          chapterNumber = subNumberMatch[1];
                          break;
                        }
                      }
                    }
                  }
                }
              }
              
              // Recursively process child items, maintain hierarchy
              traverse(value, chapterTitle, chapterNumber, level);
            }
          } else if ('path' in item && typeof item.path === 'string') {
            // Object with path property
            const filePath = path.join(basePath, item.path);
            if (fs.existsSync(filePath)) {
              chapters.push({
                title: (typeof item.title === 'string' ? item.title : undefined) || path.basename(item.path, '.md'),
                path: filePath,
                content: '',
                order: order++,
                level: level,
                number: parentNumber || undefined,
                parentTitle: parentTitle || undefined
              });
            }
          } else if ('title' in item && 'children' in item && Array.isArray(item.children) && typeof item.title === 'string') {
            // Object with title and children properties
            traverse(item.children, item.title, parentNumber, level);
          }
        }
      }
    }
  }

  traverse(nav);
  
  // Filter out chapters related to chapter_paperbook
  return chapters.filter(chapter => {
    // Check if path contains chapter_paperbook
    return !chapter.path.includes('chapter_paperbook');
  });
}

/**
 * Read chapter content
 */
export function readChapterContent(chapter: Chapter): string {
  try {
    return fs.readFileSync(chapter.path, 'utf-8');
  } catch (error) {
    console.warn(`Unable to read file: ${chapter.path}`, error);
    return '';
  }
}

