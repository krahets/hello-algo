import * as fs from 'fs-extra';
import * as path from 'path';
import * as yaml from 'js-yaml';
import { NavItem, Chapter, MkDocsNavItem } from './types';

/**
 * 解析 mkdocs.yml 文件，提取导航结构
 */
export function parseMkdocsConfig(configPath: string): MkDocsNavItem[] {
  const content = fs.readFileSync(configPath, 'utf-8');
  const config = yaml.load(content) as any;
  return config.nav || [];
}

/**
 * 扁平化导航结构，提取所有章节路径，保留层级关系
 * 根据 mkdocs.yml 的结构：
 * - 父级标题（如"第 0 章 前言"）包含子项数组
 * - 子项可以是字符串路径（index.md）或对象（子章节）
 */
export function flattenNav(nav: MkDocsNavItem[], basePath: string = ''): Chapter[] {
  const chapters: Chapter[] = [];
  let order = 0;

  function traverse(items: MkDocsNavItem[], parentTitle: string = '', parentNumber: string = '', level: number = 0) {
    for (const item of items) {
      if (typeof item === 'string') {
        // 简单路径字符串（通常是 index.md，作为章节首页）
        const filePath = path.join(basePath, item);
        if (fs.existsSync(filePath)) {
          // 尝试从文件内容中提取标题
          const content = fs.readFileSync(filePath, 'utf-8');
          const titleMatch = content.match(/^#\s+(.+)$/m);
          const title = titleMatch ? titleMatch[1].trim() : path.basename(item, '.md');
          
          // index.md 使用父章节的标题和编号
          chapters.push({
            title: parentTitle || title, // 如果有父标题，使用父标题；否则使用文件标题
            path: filePath,
            content: '',
            order: order++,
            level: level,
            number: parentNumber || undefined,
            parentTitle: undefined // index.md 是顶级章节
          });
        }
      } else if (typeof item === 'object' && item !== null) {
        // 处理对象形式：{ "标题": "路径" } 或 { "标题": [...] }
        if (Array.isArray(item)) {
          traverse(item, parentTitle, parentNumber, level);
        } else {
          const keys = Object.keys(item);
          if (keys.length === 1) {
            const key = keys[0];
            const value = item[key];
            
            if (typeof value === 'string') {
              // { "标题": "路径" } 形式 - 这是子章节（如 "0.1 &nbsp; 关于本书": "path"）
              const filePath = path.join(basePath, value);
              if (fs.existsSync(filePath)) {
                const fullTitle = key.replace(/&nbsp;/g, ' ').trim();
                
                // 提取章节编号，如 "0.1 &nbsp; 关于本书" -> "0.1"
                const numberMatch = fullTitle.match(/^(\d+(?:\.\d+)?)\s+/);
                let chapterNumber = numberMatch ? numberMatch[1] : undefined;
                
                // 提取标题（去掉编号部分）
                const title = fullTitle.replace(/^\d+(?:\.\d+)?\s+/, '').trim();
                
                chapters.push({
                  title: title,
                  path: filePath,
                  content: '',
                  order: order++,
                  level: level + 1, // 子章节层级 +1
                  number: chapterNumber,
                  parentTitle: parentTitle || undefined
                });
              }
            } else if (Array.isArray(value)) {
              // { "标题": [...] } 形式 - 这是父章节标题和子项（如 "第 0 章 前言": [...]）
              const chapterTitle = key.replace(/&nbsp;/g, ' ').trim();
              
              // 从标题中提取章节编号，如 "第 0 章 &nbsp; 前言" -> "0"
              let chapterNumber = '';
              const numberMatch = chapterTitle.match(/第\s*(\d+)\s*章/);
              if (numberMatch) {
                chapterNumber = numberMatch[1];
              } else {
                // 如果没有编号，尝试从第一个子章节推断（如从 "0.1" 推断 "0"）
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
              
              // 递归处理子项，保持层级关系
              traverse(value, chapterTitle, chapterNumber, level);
            }
          } else if ('path' in item && typeof item.path === 'string') {
            // 有路径的对象
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
            // 有标题和子项的对象
            traverse(item.children, item.title, parentNumber, level);
          }
        }
      }
    }
  }

  traverse(nav);
  
  // 过滤掉 chapter_paperbook 相关的章节
  return chapters.filter(chapter => {
    // 检查路径中是否包含 chapter_paperbook
    return !chapter.path.includes('chapter_paperbook');
  });
}

/**
 * 读取章节内容
 */
export function readChapterContent(chapter: Chapter): string {
  try {
    return fs.readFileSync(chapter.path, 'utf-8');
  } catch (error) {
    console.warn(`无法读取文件: ${chapter.path}`, error);
    return '';
  }
}

