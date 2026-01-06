# Programming Environment Installation

## Installing Ide

We recommend using the open-source and lightweight VS Code as the local integrated development environment (IDE). Visit the [VS Code official website](https://code.visualstudio.com/), and download and install the appropriate version of VS Code according to your operating system.

![Download VS Code from the Official Website](installation.assets/vscode_installation.png)

VS Code has a powerful ecosystem of extensions that supports running and debugging most programming languages. For example, after installing the "Python Extension Pack" extension, you can debug Python code. The installation steps are shown in the following figure.

![Install VS Code Extensions](installation.assets/vscode_extension_installation.png)

## Installing Language Environments

### Python Environment

1. Download and install [Miniconda3](https://docs.conda.io/en/latest/miniconda.html), which requires Python 3.10 or newer.
2. Search for `python` in the VS Code extension marketplace and install the Python Extension Pack.
3. (Optional) Enter `pip install black` on the command line to install the code formatter.

### C/c++ Environment

1. Windows systems need to install [MinGW](https://sourceforge.net/projects/mingw-w64/files/) ([configuration tutorial](https://blog.csdn.net/qq_33698226/article/details/129031241)); macOS comes with Clang built-in and does not require installation.
2. Search for `c++` in the VS Code extension marketplace and install the C/C++ Extension Pack.
3. (Optional) Open the Settings page, search for the `Clang_format_fallback Style` code formatting option, and set it to `{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }`.

### Java Environment

1. Download and install [OpenJDK](https://jdk.java.net/18/) (version must be > JDK 9).
2. Search for `java` in the VS Code extension marketplace and install the Extension Pack for Java.

### C# Environment

1. Download and install [.Net 8.0](https://dotnet.microsoft.com/en-us/download).
2. Search for `C# Dev Kit` in the VS Code extension marketplace and install C# Dev Kit ([configuration tutorial](https://code.visualstudio.com/docs/csharp/get-started)).
3. You can also use Visual Studio ([installation tutorial](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)).

### Go Environment

1. Download and install [Go](https://go.dev/dl/).
2. Search for `go` in the VS Code extension marketplace and install Go.
3. Press `Ctrl + Shift + P` to open the command palette, type `go`, select `Go: Install/Update Tools`, check all options and install.

### Swift Environment

1. Download and install [Swift](https://www.swift.org/download/).
2. Search for `swift` in the VS Code extension marketplace and install [Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang).

### Javascript Environment

1. Download and install [Node.js](https://nodejs.org/en/).
2. (Optional) Search for `Prettier` in the VS Code extension marketplace and install the code formatter.

### Typescript Environment

1. Follow the same installation steps as the JavaScript environment.
2. Install [TypeScript Execute (tsx)](https://github.com/privatenumber/tsx?tab=readme-ov-file#global-installation).
3. Search for `typescript` in the VS Code extension marketplace and install [Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors).

### Dart Environment

1. Download and install [Dart](https://dart.dev/get-dart).
2. Search for `dart` in the VS Code extension marketplace and install [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code).

### Rust Environment

1. Download and install [Rust](https://www.rust-lang.org/tools/install).
2. Search for `rust` in the VS Code extension marketplace and install [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).
