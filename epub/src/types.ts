
export interface NavItem {
  title?: string;
  path?: string;
  children?: NavItem[];
}

// MkDocs 配置文件中的导航项类型
export type MkDocsNavItem = string | { [key: string]: string | MkDocsNavItem[] } | MkDocsNavItem[];

export interface Chapter {
  title: string;
  path: string;
  content: string;
  order: number;
  level: number; // 层级：0=顶级章节，1=子章节
  number?: string; // 章节编号，如 "0", "0.1", "1", "1.1"
  parentTitle?: string; // 父章节标题
}

export interface ImageInfo {
  src: string;
  data: Buffer;
  mimeType: string;
}

// EPUB-gen 库的选项类型
export interface EpubGenOptions {
  title: string;
  author: string;
  publisher?: string;
  description?: string;
  language?: string;
  content: Chapter[];
  verbose?: boolean;
  customNcxTocTemplatePath?: string;
  customHtmlTocTemplatePath?: string;
  css?: string;
  cover?: string;
  output?: string;
}

