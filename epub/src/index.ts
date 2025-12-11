import * as fs from 'fs-extra';
import * as path from 'path';
import { parseMkdocsConfig, flattenNav, readChapterContent } from './parser';
import { generateEpub } from './epub';
import { Chapter, HeadingInfo } from './types';
import { extractHeadings } from './markdown';
import { validateEpubHeadings, saveValidationReport } from './validator';

async function main() {
  const repoDir = path.join(__dirname, '..', '..');
  const docsDir = path.join(repoDir, 'docs');
  const mkdocsPath = path.join(repoDir, 'mkdocs.yml');
  const outputPath = path.join(__dirname, '..', 'hello-algo.epub');

  console.log('开始处理文档...');
  console.log(`文档目录: ${docsDir}`);
  console.log(`配置文件: ${mkdocsPath}`);

  // 检查目录是否存在
  if (!fs.existsSync(docsDir)) {
    console.error(`错误: 文档目录不存在: ${docsDir}`);
    process.exit(1);
  }

  if (!fs.existsSync(mkdocsPath)) {
    console.error(`错误: 配置文件不存在: ${mkdocsPath}`);
    process.exit(1);
  }

  // 解析配置
  console.log('解析 mkdocs.yml...');
  const nav = parseMkdocsConfig(mkdocsPath);
  
  // 扁平化导航结构
  console.log('提取章节列表...');
  const chapters = flattenNav(nav, docsDir);
  
  console.log(`找到 ${chapters.length} 个章节`);
  
  // 读取章节内容并提取标题
  console.log('读取章节内容...');
  const allHeadings: HeadingInfo[] = [];
  
  for (const chapter of chapters) {
    chapter.content = readChapterContent(chapter);
    
    // 提取该章节的所有标题
    if (chapter.content.trim().length > 0) {
      const headings = extractHeadings(chapter.content, chapter.path);
      allHeadings.push(...headings);
    }
  }
  
  // 过滤掉空内容
  const validChapters = chapters.filter(ch => ch.content.trim().length > 0);
  console.log(`有效章节数: ${validChapters.length}`);
  console.log(`提取的标题总数: ${allHeadings.length}`);
  
  // 封面图片路径
  const coverPath = path.join(docsDir, 'assets', 'hero', 'cover_render.png');
  
  // 生成 EPUB
  await generateEpub(validChapters, docsDir, outputPath, {
    title: 'Hello 算法',
    author: 'krahets',
    publisher: 'Hello Algorithm',
    description: '动画图解、一键运行的数据结构与算法教程',
    language: 'zh-CN',
    cover: coverPath,
  });
  
  // 验证 EPUB 内容完整性
  console.log('\n' + '='.repeat(60));
  console.log('开始验证 EPUB 内容完整性...');
  console.log('='.repeat(60));
  
  const validation = await validateEpubHeadings(outputPath, allHeadings);
  
  // 保存验证报告
  const reportPath = path.join(__dirname, '..', 'validation-report.json');
  await saveValidationReport(reportPath, allHeadings, validation.missingHeadings, validation.summary);
  
  if (!validation.success) {
    console.warn('\n⚠️  警告: EPUB 中缺少部分标题，请检查验证报告');
    console.warn(`详细报告: ${reportPath}\n`);
  } else {
    console.log('\n✅ EPUB 内容验证通过！所有标题都已正确包含。\n');
  }
  
  console.log('完成！');
}

main().catch((error) => {
  console.error('发生错误:', error);
  process.exit(1);
});

