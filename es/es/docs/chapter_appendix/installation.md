# Instalación

## Instalar IDE

Recomendamos usar el ligero y de código abierto VS Code como su Entorno de Desarrollo Integrado (IDE) local. Visite el [sitio web oficial de VS Code](https://code.visualstudio.com/) y elija la versión de VS Code adecuada para su sistema operativo para descargar e instalar.

![Descargar VS Code desde el sitio web oficial](installation.assets/vscode_installation.png)

VS Code tiene un potente ecosistema de extensiones, que soporta la ejecución y depuración de la mayoría de los lenguajes de programación. Por ejemplo, después de instalar el "Python Extension Pack", puede depurar código Python. Los pasos de instalación se muestran en la figura a continuación.

![Instalar el paquete de extensiones de VS Code](installation.assets/vscode_extension_installation.png)

## Instalar entornos de lenguaje

### Entorno Python

1.  Descargue e instale [Miniconda3](https://docs.conda.io/en/latest/miniconda.html), que requiere Python 3.10 o posterior.
2.  En el marketplace de extensiones de VS Code, busque `python` e instale el Python Extension Pack.
3.  (Opcional) Ingrese `pip install black` en la línea de comandos para instalar la herramienta de formato de código.

### Entorno C/C++

1.  Los sistemas Windows necesitan instalar [MinGW](https://sourceforge.net/projects/mingw-w64/files/) ([Tutorial de configuración](https://blog.csdn.net/qq_33698226/article/details/129031241)); MacOS viene con Clang, por lo que no es necesaria la instalación.
2.  En el marketplace de extensiones de VS Code, busque `c++` e instale el C/C++ Extension Pack.
3.  (Opcional) Abra la página de Configuración, busque la opción de formato de código `Clang_format_fallback Style` y configúrela en `{ BasedOnStyle: Microsoft, BreakBeforeBraces: Attach }`.

### Entorno Java

1.  Descargue e instale [OpenJDK](https://jdk.java.net/18/) (la versión debe ser > JDK 9).
2.  En el marketplace de extensiones de VS Code, busque `java` e instale el Extension Pack for Java.

### Entorno C#

1.  Descargue e instale [.Net 8.0](https://dotnet.microsoft.com/en-us/download).
2.  En el marketplace de extensiones de VS Code, busque `C# Dev Kit` e instale el C# Dev Kit ([Tutorial de configuración](https://code.visualstudio.com/docs/csharp/get-started)).
3.  También puede usar Visual Studio ([Tutorial de instalación](https://learn.microsoft.com/zh-cn/visualstudio/install/install-visual-studio?view=vs-2022)).

### Entorno Go

1.  Descargue e instale [go](https://go.dev/dl/).
2.  En el marketplace de extensiones de VS Code, busque `go` e instale Go.
3.  Presione `Ctrl + Shift + P` para abrir la barra de comandos, ingrese go, elija `Go: Install/Update Tools`, seleccione todo e instale.

### Entorno Swift

1.  Descargue e instale [Swift](https://www.swift.org/download/).
2.  En el marketplace de extensiones de VS Code, busque `swift` e instale [Swift for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sswg.swift-lang).

### Entorno JavaScript

1.  Descargue e instale [Node.js](https://nodejs.org/en/).
2.  (Opcional) En el marketplace de extensiones de VS Code, busque `Prettier` e instale la herramienta de formato de código.

### Entorno TypeScript

1.  Siga los mismos pasos de instalación que el entorno JavaScript.
2.  Instale [TypeScript Execute (tsx)](https://github.com/privatenumber/tsx?tab=readme-ov-file#global-installation).
3.  En el marketplace de extensiones de VS Code, busque `typescript` e instale [Pretty TypeScript Errors](https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors).

### Entorno Dart

1.  Descargue e instale [Dart](https://dart.dev/get-dart).
2.  En el marketplace de extensiones de VS Code, busque `dart` e instale [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code).

### Entorno Rust

1.  Descargue e instale [Rust](https://www.rust-lang.org/tools/install).
2.  En el marketplace de extensiones de VS Code, busque `rust` e instale [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).