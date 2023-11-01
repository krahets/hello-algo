# Programming Environment Installation

### VSCode

This book recommends using the open source lightweight VSCode as a local IDE, download and install [VSCode](https://code.visualstudio.com/).

### The Java Environment

1. Download and install [OpenJDK](https://jdk.java.net/18/) (version > JDK 9).
2. Search for `java` in VSCode's plugin marketplace and install Extension Pack for Java.

### C/C++ Environment

1. Windows systems need to install [MinGW](https://sourceforge.net/projects/mingw-w64/files/) ([Configuration Tutorial](https://blog.csdn.net/qq_33698226/article/details /129031241)), MacOS comes with Clang without installation.
2. Search for `c++` in VSCode's plugin marketplace and install the C/C++ Extension Pack.
3. (Optional) Open the Settings page and search for the `Clang_format_fallback Style` code formatting option set to `{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }`.

### Python Environment

1. Download and install [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) .
2. Search for `python` in VSCode's plugin marketplace and install the Python Extension Pack.
3. (Optional) Type `pip install black` at the command line to install the code formatting tool.

### Go Environment

1. Download and install [go](https://go.dev/dl/).
2. Search for `go` in VSCode's plugin marketplace and install Go.
3. The shortcut key `Ctrl + Shift + P` calls out the command bar, type go, select `Go: Install/Update Tools`, check all the boxes and install it.

### JavaScript Environment

1. Download and install [node.js](https://nodejs.org/en/) .
2. Install JavaScript (ES6) code snippets by searching for `javascript` in VSCode's plugin marketplace.
3. (Optional) Install the code formatting tool by searching for `Prettier` in VSCode's plugin marketplace.

### C## Environment

1. Download and install [.Net 6.0](https://dotnet.microsoft.com/en-us/download) .
2. Install the C# Dev Kit by searching for `C# Dev Kit` in VSCode's plugin marketplace ([Configuration Tutorial](https://code.visualstudio.com/docs/csharp/get-started)).
3. Visual Studio is also available ([Installation Tutorial](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)).

### Swift Environment

1. Download and install [Swift](https://www.swift.org/download/).
2. Search for `swift` in VSCode's plugin marketplace and install [Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang).

### Dart Environment

1. Download and install [Dart](https://dart.dev/get-dart) .
2. Search for `dart` in VSCode's plugin marketplace and install [Dart](https:/marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code).

### Rust Environment

1. Download and install [Rust](https://www.rust-lang.org/tools/install).
2. Search for `rust` in VSCode's plugin marketplace and install [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).
