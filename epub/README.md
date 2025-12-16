# Hello Algorithm EPUB 转换工具

这是一个 TypeScript 工具，用于将 [Hello Algorithm](https://github.com/krahets/hello-algo) 仓库的 Markdown 文档转换为 EPUB 电子书。

## ✨ 功能特性

- ✅ **多文档语言支持**: 支持中文、英文、日文三种文档语言
- ✅ **多编程语言支持**: 支持 14 种编程语言（C++、Python、Java、C#、Go、Swift、JavaScript、TypeScript、Dart、Rust、C、Kotlin、Ruby、Zig）
- ✅ **命令行工具**: 灵活的命令行参数，支持选择文档语言、编程语言和输出路径
- ✅ **自动解析结构**: 解析 `mkdocs.yml` 配置文件，按照原始章节顺序组织内容
- ✅ **Markdown 转换**: 将 Markdown 转换为 HTML，保留代码块、图片、表格、数学公式等格式
- ✅ **代码块嵌入**: 自动解析 `[file]{filename}-[class]{classname}-[func]{funcname}` 格式，从源码目录提取并嵌入代码
- ✅ **多语言代码块**: 自动选择指定语言的代码块版本
- ✅ **MkDocs 语法支持**: 处理 admonition 块（`!!! note`、`!!! warning` 等），支持自定义标题
- ✅ **数学公式渲染**: 支持 LaTeX 数学公式，自动转换为 HTML 格式，在 Android 设备上兼容性良好
- ✅ **图片处理**: 自动提取并嵌入图片资源
- ✅ **自定义封面**: 支持设置自定义封面图片
- ✅ **美观样式**: 生成包含完整样式的 EPUB 电子书，针对不同设备优化
- ✅ **类型安全**: 完整的 TypeScript 类型定义，避免 `any` 类型使用
- ✅ **内容验证**: 自动验证 EPUB 完整性，检查所有标题是否正确包含

## 🚀 安装与使用

### 安装依赖

```bash
npm install
```

### 使用方法

#### 基本使用

```bash
# 使用默认配置构建中文版 C++ 代码
npm run build

# 构建中文版指定编程语言
npm run build -- -l python
npm run build -- -l java -o hello-algo-zh-java.epub

# 构建繁体中文版（支持所有编程语言）
npm run build -- -d zh-hant -l python -o hello-algo-zh-hant-python.epub

# 构建英文版（支持 cpp/java/python）
npm run build -- -d en -l python -o hello-algo-en-python.epub

# 构建日文版（支持 cpp/java/python）
npm run build -- -d ja -l cpp -o hello-algo-ja-cpp.epub

# 批量构建所有支持的组合
for doc_lang in zh zh-hant en ja; do
  for code_lang in cpp python java; do
    npm run build -- -d $doc_lang -l $code_lang -o hello-algo-$doc_lang-$code_lang.epub
  done
done
```

#### 命令行参数

| 参数 | 简写 | 说明 | 默认值 |
|------|------|------|--------|
| `--doc-language` | `-d` | 文档语言 (zh, zh-hant, en, ja) | `zh` |
| `--output` | `-o` | 输出 EPUB 文件路径 | `./hello-algo.epub` |
| `--language` | `-l` | 编程语言（见下表） | `cpp` |
| `--help` | `-h` | 显示帮助信息 | - |
| `--version` | `-V` | 显示版本号 | - |

#### 支持的文档语言

| 语言 | 参数值 | 说明 |
|------|--------|------|
| 简体中文 | `zh` | 支持所有编程语言 |
| 繁體中文 | `zh-hant` | 支持所有编程语言 |
| English | `en` | 仅支持 cpp, java, python |
| 日本語 | `ja` | 仅支持 cpp, java, python |

#### 支持的编程语言

| 语言 | 参数值 | 简体中文 | 繁體中文 | 英文 | 日文 |
|------|--------|---------|---------|------|------|
| C++ | `cpp` | ✅ | ✅ | ✅ | ✅ |
| Python | `python` | ✅ | ✅ | ✅ | ✅ |
| Java | `java` | ✅ | ✅ | ✅ | ✅ |
| C# | `csharp` | ✅ | ✅ | ❌ | ❌ |
| Go | `go` | ✅ | ✅ | ❌ | ❌ |
| Swift | `swift` | ✅ | ✅ | ❌ | ❌ |
| JavaScript | `javascript` | ✅ | ✅ | ❌ | ❌ |
| TypeScript | `typescript` | ✅ | ✅ | ❌ | ❌ |
| Dart | `dart` | ✅ | ✅ | ❌ | ❌ |
| Rust | `rust` | ✅ | ✅ | ❌ | ❌ |
| C | `c` | ✅ | ✅ | ❌ | ❌ |
| Kotlin | `kotlin` | ✅ | ✅ | ❌ | ❌ |
| Ruby | `ruby` | ✅ | ✅ | ❌ | ❌ |
| Zig | `zig` | ✅ | ✅ | ❌ | ❌ |

**注意**: 如果尝试使用不支持的组合（如 `-d en -l rust`），程序会报错并退出。

#### 查看帮助

```bash
npm run build -- --help
```

### 📋 要求

- Node.js 16+
- 确保项目根目录包含完整的 hello-algo 仓库结构：
  ```
  .
  ├── docs/           # 中文 Markdown 文档目录
  ├── zh-hant/
  │   ├── docs/       # 繁體中文 Markdown 文档目录
  │   ├── codes/      # 繁體中文代码示例（所有语言）
  │   └── mkdocs.yml  # 繁體中文配置文件
  ├── en/
  │   ├── docs/       # 英文 Markdown 文档目录
  │   ├── codes/      # 英文代码示例（仅 cpp/java/python）
  │   └── mkdocs.yml  # 英文配置文件
  ├── ja/
  │   ├── docs/       # 日文 Markdown 文档目录
  │   ├── codes/      # 日文代码示例（仅 cpp/java/python）
  │   └── mkdocs.yml  # 日文配置文件
  ├── codes/          # 简体中文代码示例（所有语言）
  └── mkdocs.yml      # 简体中文配置文件
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
- **Commander**: 强大的命令行参数解析
- **marked**: 高速 Markdown 解析器
- **highlight.js**: 代码语法高亮
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

````
```src
[file]{filename}-[class]{classname}-[func]{funcname}
```
````

例如：
````
```src
[file]{binary_tree_bfs}-[class]{}-[func]{levelOrder}
```
````

工具会根据指定的语言参数（`-l`）自动从对应的 `codes/{language}/` 目录中提取代码：
- C++: `codes/cpp/`
- Python: `codes/python/`
- Java: `codes/java/`
- 等等...

### 多语言代码块

文档中使用 `=== "语言名"` 格式的多语言代码块会自动选择对应语言版本：

```markdown
=== "Python"
    ```python
    def hello():
        print("Hello")
    ```

=== "C++"
    ```cpp
    void hello() {
        cout << "Hello";
    }
    ```
```

使用 `-l python` 参数时会只保留 Python 版本，使用 `-l cpp` 时会只保留 C++ 版本。

## 🔍 内容验证功能

工具会自动验证生成的 EPUB 是否包含所有标题：

1. **自动提取标题**: 在解析 Markdown 时自动提取所有 h1-h6 标题
2. **EPUB 内容检查**: 解析生成的 EPUB，检查每个标题是否存在
3. **终端报告**: 在构建过程中实时显示验证结果

**验证报告示例**：

```
============================================================
开始验证 EPUB 内容完整性...
============================================================
开始验证 EPUB 内容...
期望标题数量: 445

============================================================
EPUB 内容验证报告
============================================================
总标题数: 445
已找到: 445
缺失: 0
完整率: 100.00%
============================================================

✅ 所有标题都已包含在 EPUB 中！

✅ EPUB 内容验证通过！所有标题都已正确包含。
```

如果发现缺失标题，会显示警告信息：

```
⚠️ 警告: EPUB 中缺少部分标题
缺失标题数: 3
```

## 📝 注意事项

- 命令行参数的路径是相对于**当前工作目录**，不是脚本所在目录
- 源码文件需遵循命名约定（某些语言会自动进行命名转换，如 C++ 的 snake_case → camelCase）
- 不同语言的代码文件扩展名会自动匹配（如 `.cpp`、`.py`、`.java` 等）
- 数学公式在不同设备上的渲染效果可能有差异，已针对 Android 优化
- 生成过程需要网络权限用于图片下载和处理

## 💡 使用示例

### 场景 1: 在 epub 目录下构建

```bash
cd epub

# 中文版（默认）
npm run build                                          # 中文 C++
npm run build -- -l python -o hello-algo-zh-python.epub  # 中文 Python

# 英文版
npm run build -- -d en -l java -o hello-algo-en-java.epub

# 日文版
npm run build -- -d ja -l cpp -o hello-algo-ja-cpp.epub
```

### 场景 2: 批量构建所有支持的组合

```bash
cd epub

# 构建所有文档语言和编程语言的组合
for doc_lang in zh zh-hant en ja; do
  for code_lang in cpp python java; do
    npm run build -- -d $doc_lang -l $code_lang -o hello-algo-$doc_lang-$code_lang.epub
  done
done
```

### 场景 3: 批量构建中文版所有编程语言

```bash
cd epub

# 中文版支持所有 14 种编程语言
for lang in cpp python java csharp go swift javascript typescript dart rust c kotlin ruby zig; do
  npm run build -- -d zh -l $lang -o hello-algo-zh-$lang.epub
done
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

