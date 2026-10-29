# プログラミング環境のインストール

## IDE のインストール

ローカルの統合開発環境（IDE）には、オープンソースで軽量な VS Code をおすすめします。[VS Code 公式サイト](https://code.visualstudio.com/)にアクセスし、OS に合ったバージョンをダウンロードしてインストールしてください。

![公式サイトから VS Code をダウンロード](installation.assets/vscode_installation.png)

VS Code には豊富な拡張機能があり、多くのプログラミング言語の実行とデバッグに対応しています。たとえば Python では、「Python Extension Pack」をインストールすると、Python コードをデバッグできます。インストール手順を下図に示します。

![VS Code の拡張機能をインストール](installation.assets/vscode_extension_installation.png)

## 言語環境のインストール

### Python 環境

1. [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) をダウンロードしてインストールします。Python 3.10 以降が必要です。
2. VS Code の拡張機能マーケットプレイスで `python` を検索し、Python Extension Pack をインストールします。
3. （任意）コマンドラインで `pip install black` を実行し、コード整形ツールをインストールします。

### C/C++ 環境

1. Windows では [MinGW](https://sourceforge.net/projects/mingw-w64/files/) のインストールが必要です（[設定ガイド](https://blog.csdn.net/qq_33698226/article/details/129031241)）。macOS には Clang が付属しているため、インストールは不要です。
2. VS Code の拡張機能マーケットプレイスで `c++` を検索し、C/C++ Extension Pack をインストールします。
3. （任意）Settings ページを開き、コード整形オプション `Clang_format_fallback Style` を検索して、`{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }` に設定します。

### Java 環境

1. [OpenJDK](https://jdk.java.net/18/) をダウンロードしてインストールします（JDK 9 より新しいバージョンが必要です）。
2. VS Code の拡張機能マーケットプレイスで `java` を検索し、Extension Pack for Java をインストールします。

### C# 環境

1. [.NET 8.0](https://dotnet.microsoft.com/en-us/download) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `C# Dev Kit` を検索し、C# Dev Kit をインストールします（[設定ガイド](https://code.visualstudio.com/docs/csharp/get-started)）。
3. Visual Studio も使用できます（[インストールガイド](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)）。

### Go 環境

1. [go](https://go.dev/dl/) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `go` を検索し、Go をインストールします。
3. ショートカットキー `Ctrl + Shift + P` でコマンドパレットを開き、go と入力して `Go: Install/Update Tools` を選択します。すべての項目を選んでインストールします。

### Swift 環境

1. [Swift](https://www.swift.org/download/) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `swift` を検索し、[Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang) をインストールします。

### JavaScript 環境

1. [Node.js](https://nodejs.org/en/) をダウンロードしてインストールします。
2. （任意）VS Code の拡張機能マーケットプレイスで `Prettier` を検索し、コード整形ツールをインストールします。

### TypeScript 環境

1. JavaScript 環境と同じ手順でインストールします。
2. [TypeScript Execute (tsx)](https://github.com/privatenumber/tsx?tab=readme-ov-file#global-installation) をインストールします。
3. VS Code の拡張機能マーケットプレイスで `typescript` を検索し、[Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors) をインストールします。

### Dart 環境

1. [Dart](https://dart.dev/get-dart) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `dart` を検索し、[Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) をインストールします。

### Rust 環境

1. [Rust](https://www.rust-lang.org/tools/install) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `rust` を検索し、[rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer) をインストールします。
