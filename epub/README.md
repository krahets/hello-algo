# Hello Algorithm EPUB 转换工具

这是一个 TypeScript 工具，用于将 [Hello Algorithm](https://github.com/krahets/hello-algo) 仓库的 Markdown 文档转换为 EPUB 电子书。

## ✨ 功能特性

- ✅ **自动解析结构**: 解析 `mkdocs.yml` 配置文件，按照原始章节顺序组织内容
- ✅ **Markdown 转换**: 将 Markdown 转换为 HTML，保留代码块、图片、表格、数学公式等格式
- ✅ **代码块嵌入**: 自动解析 `[file]{filename}-[class]{classname}-[func]{funcname}` 格式，从源码目录提取并嵌入 C++ 代码
- ✅ **MkDocs 语法支持**: 处理 admonition 块（`!!! note`、`!!! warning` 等），支持自定义标题
- ✅ **数学公式渲染**: 支持 LaTeX 数学公式，自动转换为 HTML 格式，在 Android 设备上兼容性良好
- ✅ **图片处理**: 自动提取并嵌入图片资源
- ✅ **自定义封面**: 支持设置自定义封面图片
- ✅ **美观样式**: 生成包含完整样式的 EPUB 电子书，针对不同设备优化
- ✅ **类型安全**: 完整的 TypeScript 类型定义，避免 `any` 类型使用

## 🚀 安装与使用

### 安装依赖

```bash
npm install
```

### 使用方法

#### 方式一：直接运行（推荐）

```bash
npm run dev
```

#### 方式二：编译后运行

```bash
# 编译 TypeScript
npm run build

# 运行转换脚本
npm start
```

### 📋 要求

- Node.js 16+
- 确保项目根目录包含完整的 hello-algo 仓库结构：
  ```
  .
  ├── docs/           # Markdown 文档目录
  ├── codes/          # 源码目录（用于代码块嵌入）
  └── mkdocs.yml      # MkDocs 配置文件
  ```

## 📁 项目结构

```
.
├── src/
│   ├── index.ts          # 主入口文件
│   ├── parser.ts         # 解析 mkdocs.yml 和提取章节
│   ├── markdown.ts       # Markdown 转 HTML 转换和代码嵌入
│   ├── epub.ts           # EPUB 生成逻辑
│   └── types.ts          # TypeScript 类型定义
├── templates/            # EJS 模板文件
│   ├── toc.ncx.ejs       # NCX 目录模板
│   └── toc.xhtml.ejs     # HTML 目录模板
├── fonts/                # 数学字体（可选）
├── dist/                 # 编译后的 JavaScript 文件
├── package.json
├── tsconfig.json
└── README.md
```

## 🛠️ 技术栈

- **TypeScript**: 完整的类型安全支持
- **marked**: 高速 Markdown 解析器
- **epub-gen**: 专业的 EPUB 生成库
- **js-yaml**: YAML 配置文件解析
- **fs-extra**: 增强的文件系统操作

## 🎨 样式特性

- **代码块**: 语法高亮，支持文件名显示，针对移动设备优化
- **数学公式**: 对齐公式自动转换为表格，变量使用 `<i>` 标签保证兼容性
- **Admonition**: 支持多种类型（note、tip、success、warning、danger、info）
- **响应式**: 针对不同屏幕尺寸优化显示效果
- **无衬线字体**: 使用 serif 字体提升阅读体验

## 📊 输出规格

- **文件格式**: EPUB 3.0
- **文件大小**: 约 9-10MB（包含所有图片和样式）
- **兼容性**: 支持 iOS、Android 和桌面 EPUB 阅读器
- **目录结构**: 完整的嵌套目录，支持章节编号

## 🔧 高级配置

### 自定义封面

将封面图片放置在 `docs/assets/hero/cover_render.png`，工具会自动使用它作为 EPUB 封面。

### 代码块嵌入语法

在 Markdown 中使用以下语法嵌入代码：

```
[file]{filename}-[class]{classname}-[func]{funcname}
```

例如：
```
[file]{binary_tree_bfs}-[class]{}-[func]{levelOrder}
```

工具会自动从 `codes/cpp/` 目录中提取对应的 C++ 代码。

## 📝 注意事项

- 源码文件需遵循命名约定（snake_case 自动转换为 camelCase）
- 数学公式在不同设备上的渲染效果可能有差异，已针对 Android 优化
- 生成过程需要网络权限用于图片下载和处理

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

