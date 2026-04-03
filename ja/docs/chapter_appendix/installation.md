---
comments: true
---

# 16.1 &nbsp; プログラミング環境のインストール

## 16.1.1 &nbsp; IDE のインストール

オープンソースで軽量な VS Code をローカルの統合開発環境（IDE）として使用することを推奨します。[VS Code 公式サイト](https://code.visualstudio.com/) にアクセスし、使用している OS に応じたバージョンの VS Code をダウンロードしてインストールしてください。

![公式サイトから VS Code をダウンロード](installation.assets/vscode_installation.png){ class="animation-figure" }

<p align="center"> 図 16-1 &nbsp; 公式サイトから VS Code をダウンロード </p>

VS Code には強力な拡張機能のエコシステムがあり、ほとんどのプログラミング言語の実行とデバッグをサポートしています。Python を例にすると、「Python Extension Pack」拡張機能をインストールした後、Python コードをデバッグできるようになります。インストール手順を以下に示します。

![VS Code 拡張機能のインストール](installation.assets/vscode_extension_installation.png){ class="animation-figure" }

<p align="center"> 図 16-2 &nbsp; VS Code 拡張機能のインストール </p>

## 16.1.2 &nbsp; 言語環境のインストール

### 1. &nbsp; Python 環境

1. [Miniconda3](https://docs.conda.io/en/latest/miniconda.html) をダウンロードしてインストールします。Python 3.10 以降が必要です。
2. VS Code の拡張機能マーケットプレイスで `python` を検索し、Python Extension Pack をインストールします。
3. （任意）コマンドラインで `pip install black` を入力し、コード整形ツールをインストールします。

### 2. &nbsp; C/C++ 環境

1. Windows システムでは [MinGW](https://sourceforge.net/projects/mingw-w64/files/) をインストールする必要があります（[設定チュートリアル](https://blog.csdn.net/qq_33698226/article/details/129031241)）。MacOS には Clang が標準搭載されているため、追加インストールは不要です。
2. VS Code の拡張機能マーケットプレイスで `c++` を検索し、C/C++ Extension Pack をインストールします。
3. （任意）Settings ページを開き、コード整形オプション `Clang_format_fallback Style` を検索して、`{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }` に設定します。

### 3. &nbsp; Java 環境

1. [OpenJDK](https://jdk.java.net/18/) をダウンロードしてインストールします（バージョンは JDK 9 より新しい必要があります）。
2. VS Code の拡張機能マーケットプレイスで `java` を検索し、Extension Pack for Java をインストールします。

### 4. &nbsp; C# 環境

1. [.Net 8.0](https://dotnet.microsoft.com/en-us/download) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `C# Dev Kit` を検索し、C# Dev Kit をインストールします（[設定チュートリアル](https://code.visualstudio.com/docs/csharp/get-started)）。
3. Visual Studio を使用することもできます（[インストール手順](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)）。

### 5. &nbsp; Go 環境

1. [go](https://go.dev/dl/) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `go` を検索し、Go をインストールします。
3. ショートカットキー `Ctrl + Shift + P` を押してコマンドパレットを開き、go と入力して `Go: Install/Update Tools` を選択し、すべてにチェックを入れてインストールします。

### 6. &nbsp; Swift 環境

1. [Swift](https://www.swift.org/download/) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `swift` を検索し、[Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang) をインストールします。

### 7. &nbsp; JavaScript 環境

1. [Node.js](https://nodejs.org/en/) をダウンロードしてインストールします。
2. （任意）VS Code の拡張機能マーケットプレイスで `Prettier` を検索し、コード整形ツールをインストールします。

### 8. &nbsp; TypeScript 環境

1. JavaScript 環境と同じ手順でインストールします。
2. [TypeScript Execute (tsx)](https://github.com/privatenumber/tsx?tab=readme-ov-file#global-installation) をインストールします。
3. VS Code の拡張機能マーケットプレイスで `typescript` を検索し、[Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors) をインストールします。

### 9. &nbsp; Dart 環境

1. [Dart](https://dart.dev/get-dart) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `dart` を検索し、[Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) をインストールします。

### 10. &nbsp; Rust 環境

1. [Rust](https://www.rust-lang.org/tools/install) をダウンロードしてインストールします。
2. VS Code の拡張機能マーケットプレイスで `rust` を検索し、[rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer) をインストールします。
