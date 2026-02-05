# Установка программной среды

## Установка IDE

Рекомендуется использовать открытую и быструю интегрированную среду разработки (IDE) VS Code. Откройте [официальный сайт VS Code](https://code.visualstudio.com/) и выберите подходящую вашей операционной системе версию для загрузки и установки.

![Загрузка VS Code с официального сайта](../assets/media/image1083.jpeg)
【comments from yuyan】 图片加载失败，后面不再赘述
VS Code обладает мощной экосистемой расширений и поддерживает выполнение и отладку большинства языков программирования. Например, после установки расширения Python Extension Pack можно выполнять отладку кода на Python. Этапы установки показаны на рисунке ниже.

![Установка расширений в VS Code](../assets/media/image1085.jpeg)

## Установка языковой среды

### Среда Python

1. Загрузите и установите инструмент [Miniconda3](https://docs.conda.io/en/latest/miniconda.html), требуется Python 3.10 или более поздняя версия.
2. В магазине расширений VS Code выполните поиск по слову `python` и установите расширение Python Extension Pack.
3. (Не обязательно) Введите в командной строке `pip install black` для установки инструмента форматирования кода.

### Среда C/C++

1. В системе Windows необходимо установить набор инструментов [MinGW](https://sourceforge.net/projects/mingw-w64/files/) ([руководство по настройке](https://blog.csdn.net/qq_33698226/article/details/129031241)). В MacOS имеется встроенный компилятор Clang, дополнительная установка не требуется.
2. В магазине расширений VS Code выполните поиск по слову `c++` и установите расширение C/C++ Extension Pack.
3. (Не обязательно) Откройте страницу настроек, найдите параметр форматирования кода `Clang_format_fallback Style` и установите его в значение `{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }`.

### Среда Java

1. Загрузите и установите [OpenJDK](https://jdk.java.net/18/) (версия > JDK 9).
2. В магазине расширений VS Code выполните поиск по слову `java` и установите расширение Extension Pack for Java.

### Среда C#

1. Загрузите и установите [.Net 8.0](https://dotnet.microsoft.com/en-us/download).
2. В магазине расширений VS Code выполните поиск по фразе `C# Dev Kit` и установите расширение C# Dev Kit ([руководство по настройке](https://code.visualstudio.com/docs/csharp/get-started)).
3. Также можно использовать интегрированную среду разработки Visual Studio ([руководство по установке](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)).

### Среда Go

1. Загрузите и установите [Go](https://go.dev/dl/).
2. В магазине расширений VS Code выполните поиск по слову `go` и установите Go.
3. Нажмите сочетание клавиш `Ctrl + Shift + P`, чтобы открыть командную строку. Введите команду go, выберите `Go: Install/Update Tools`, отметьте все и установите.

### Среда Swift

1. Загрузите и установите [Swift](https://www.swift.org/download/).
2. В магазине расширений VS Code выполните поиск по слову `swift` и установите расширение [Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang).

### Среда JavaScript

1. Загрузите и установите [Node.js](https://nodejs.org/en/).
2. (Не обязательно) В магазине расширений VS Code выполните поиск по слову `Prettier` и установите инструмент форматирования кода.

### Среда TypeScript

1. Выполните шаги установки для среды JavaScript.
2. Установите [TypeScript Execute (tsx)](https://github.com/privatenumber/tsx?tab=readme-ov-file#global-installation).
3. В магазине расширений VS Code выполните поиск по слову `typescript` и установите расширение [Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors).

### Среда Dart

1. Загрузите и установите [Dart](https://dart.dev/get-dart).
2. В магазине расширений VS Code выполните поиск по слову `dart` и установите расширение [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code).

### Среда Rust

1. Загрузите и установите [Rust](https://www.rust-lang.org/tools/install).
2. В магазине расширений VS Code выполните поиск по слову `rust` и установите расширение [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).