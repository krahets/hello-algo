
export interface NavItem {
  title?: string;
  path?: string;
  children?: NavItem[];
}

// Navigation item type in MkDocs config file
export type MkDocsNavItem = string | { [key: string]: string | MkDocsNavItem[] } | MkDocsNavItem[];

export interface Chapter {
  title: string;
  path: string;
  content: string;
  order: number;
  level: number; // Hierarchy level: 0=top-level chapter, 1=sub-chapter
  number?: string; // Chapter number, e.g., "0", "0.1", "1", "1.1"
  parentTitle?: string; // Parent chapter title
}

export interface ImageInfo {
  src: string;
  data: Buffer;
  mimeType: string;
}

// Heading information
export interface HeadingInfo {
  level: number;        // Heading level (1-6)
  text: string;         // Heading text
  chapterPath: string;  // Path to the chapter
  lineNumber?: number;  // Line number (if available)
}

// Option types for epub-gen library
export interface EpubGenOptions {
  title: string;
  author: string;
  publisher?: string;
  description?: string;
  language?: string;
  content: Chapter[];
  verbose?: boolean;
  appendChapterTitles?: boolean;
  customNcxTocTemplatePath?: string;
  customHtmlTocTemplatePath?: string;
  css?: string;
  cover?: string;
  output?: string;
  fonts?: string[];
  tocTitle?: string;  // Table of contents title
}
