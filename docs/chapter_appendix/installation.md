# 编程环境安装

### VSCode

本书推荐使用开源轻量的 VSCode 作为本地 IDE ，下载并安装 [VSCode](https://code.visualstudio.com/) 。

### Java 环境

1. 下载并安装 [OpenJDK](https://jdk.java.net/18/)（版本需满足 > JDK 9）。
2. 在 VSCode 的插件市场中搜索 `java` ，安装 Extension Pack for Java 。

### C/C++ 环境

1. Windows 系统需要安装 [MinGW](https://sourceforge.net/projects/mingw-w64/files/)（[配置教程](https://blog.csdn.net/qq_33698226/article/details/129031241)），MacOS 自带 Clang 无须安装。
2. 在 VSCode 的插件市场中搜索 `c++` ，安装 C/C++ Extension Pack 。
3. （可选）打开 Settings 页面，搜索 `Clang_format_fallback Style` 代码格式化选项，设置为 `{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }` 。

### Python 环境

1. 下载并安装 [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) 。
2. 在 VSCode 的插件市场中搜索 `python` ，安装 Python Extension Pack 。
3. （可选）在命令行输入 `pip install black` ，安装代码格式化工具。

### Go 环境

1. 下载并安装 [go](https://go.dev/dl/) 。
2. 在 VSCode 的插件市场中搜索 `go` ，安装 Go 。
3. 快捷键 `Ctrl + Shift + P` 呼出命令栏，输入 go ，选择 `Go: Install/Update Tools` ，全部勾选并安装即可。

### JavaScript 环境

1. 下载并安装 [node.js](https://nodejs.org/en/) 。
2. 在 VSCode 的插件市场中搜索 `javascript` ，安装 JavaScript (ES6) code snippets 。
3. （可选）在 VSCode 的插件市场中搜索 `Prettier` ，安装代码格式化工具。

### C# 环境

1. 下载并安装 [.Net 6.0](https://dotnet.microsoft.com/en-us/download) 。
2. 在 VSCode 的插件市场中搜索 `C# Dev Kit` ，安装 C# Dev Kit （[配置教程](https://code.visualstudio.com/docs/csharp/get-started)）。
3. 也可使用 Visual Studio（[安装教程](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)）。

### Swift 环境

1. 下载并安装 [Swift](https://www.swift.org/download/)。
2. 在 VSCode 的插件市场中搜索 `swift` ，安装 [Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang)。

### Dart 环境

1. 下载并安装 [Dart](https://dart.dev/get-dart) 。
2. 在 VSCode 的插件市场中搜索 `dart` ，安装 [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) 。

### Rust 环境

1. 下载并安装 [Rust](https://www.rust-lang.org/tools/install)。
2. 在 VSCode 的插件市场中搜索 `rust` ，安装 [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)。
