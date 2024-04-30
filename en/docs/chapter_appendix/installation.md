---
comments: true
---

# 16.1 &nbsp; Installation

## 16.1.1 &nbsp; Install IDE

We recommend using the open-source, lightweight VS Code as your local Integrated Development Environment (IDE). Visit the [VS Code official website](https://code.visualstudio.com/) and choose the version of VS Code appropriate for your operating system to download and install.

![Download VS Code from the official website](installation.assets/vscode_installation.png){ class="animation-figure" }

<p align="center"> Figure 16-1 &nbsp; Download VS Code from the official website </p>

VS Code has a powerful extension ecosystem, supporting the execution and debugging of most programming languages. For example, after installing the "Python Extension Pack," you can debug Python code. The installation steps are shown in the following figure.

![Install VS Code Extension Pack](installation.assets/vscode_extension_installation.png){ class="animation-figure" }

<p align="center"> Figure 16-2 &nbsp; Install VS Code Extension Pack </p>

## 16.1.2 &nbsp; Install language environments

### 1. &nbsp; Python environment

1. Download and install [Miniconda3](https://docs.conda.io/en/latest/miniconda.html), requiring Python 3.10 or newer.
2. In the VS Code extension marketplace, search for `python` and install the Python Extension Pack.
3. (Optional) Enter `pip install black` in the command line to install the code formatting tool.

### 2. &nbsp; C/C++ environment

1. Windows systems need to install [MinGW](https://sourceforge.net/projects/mingw-w64/files/) ([Configuration tutorial](https://blog.csdn.net/qq_33698226/article/details/129031241)); MacOS comes with Clang, so no installation is necessary.
2. In the VS Code extension marketplace, search for `c++` and install the C/C++ Extension Pack.
3. (Optional) Open the Settings page, search for the `Clang_format_fallback Style` code formatting option, and set it to `{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }`.

### 3. &nbsp; Java environment

1. Download and install [OpenJDK](https://jdk.java.net/18/) (version must be > JDK 9).
2. In the VS Code extension marketplace, search for `java` and install the Extension Pack for Java.

### 4. &nbsp; C# environment

1. Download and install [.Net 8.0](https://dotnet.microsoft.com/en-us/download).
2. In the VS Code extension marketplace, search for `C# Dev Kit` and install the C# Dev Kit ([Configuration tutorial](https://code.visualstudio.com/docs/csharp/get-started)).
3. You can also use Visual Studio ([Installation tutorial](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)).

### 5. &nbsp; Go environment

1. Download and install [go](https://go.dev/dl/).
2. In the VS Code extension marketplace, search for `go` and install Go.
3. Press `Ctrl + Shift + P` to call up the command bar, enter go, choose `Go: Install/Update Tools`, select all and install.

### 6. &nbsp; Swift environment

1. Download and install [Swift](https://www.swift.org/download/).
2. In the VS Code extension marketplace, search for `swift` and install [Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang).

### 7. &nbsp; JavaScript environment

1. Download and install [Node.js](https://nodejs.org/en/).
2. (Optional) In the VS Code extension marketplace, search for `Prettier` and install the code formatting tool.

### 8. &nbsp; TypeScript environment

1. Follow the same installation steps as the JavaScript environment.
2. Install [TypeScript Execute (tsx)](https://github.com/privatenumber/tsx?tab=readme-ov-file#global-installation).
3. In the VS Code extension marketplace, search for `typescript` and install [Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors).

### 9. &nbsp; Dart environment

1. Download and install [Dart](https://dart.dev/get-dart).
2. In the VS Code extension marketplace, search for `dart` and install [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code).

### 10. &nbsp; Rust environment

1. Download and install [Rust](https://www.rust-lang.org/tools/install).
2. In the VS Code extension marketplace, search for `rust` and install [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).
