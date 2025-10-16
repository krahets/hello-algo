# 基本データ型

コンピュータ内のデータについて考える際、テキスト、画像、動画、音声、3Dモデルなど、様々な形式が思い浮かびます。これらの組織的な形式は異なりますが、すべて様々な基本データ型から構成されています。

**基本データ型とは、CPUが直接操作できるもの**であり、アルゴリズムで直接使用されます。主に以下が含まれます。

- 整数型：`byte`、`short`、`int`、`long`
- 浮動小数点型：`float`、`double`、小数を表現するために使用
- 文字型：`char`、様々な言語の文字、句読点、さらには絵文字を表現するために使用
- ブール型：`bool`、「はい」または「いいえ」の判断を表現するために使用

**基本データ型は、コンピュータ内で二進形式で格納されます**。1つの二進桁は1ビットです。ほとんどの現代的なオペレーティングシステムでは、1バイトは8ビットで構成されています。

基本データ型の値の範囲は、それらが占める空間のサイズに依存します。以下では、Javaを例に説明します。

- 整数型`byte`は1バイト = 8ビットを占め、$2^8$個の数値を表現できます。
- 整数型`int`は4バイト = 32ビットを占め、$2^{32}$個の数値を表現できます。

以下の表は、Javaにおける様々な基本データ型が占める空間、値の範囲、デフォルト値を示しています。この表を暗記する必要はありませんが、一般的な理解を持ち、必要時に参照することをお勧めします。

<p align="center"> 表 <id> &nbsp; 基本データ型が占める空間と値の範囲 </p>

| 型      | シンボル  | 占有空間 | 最小値                   | 最大値                  | デフォルト値    |
| ------- | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 整数    | `byte`   | 1バイト  | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | 0              |
|         | `short`  | 2バイト  | $-2^{15}$                | $2^{15} - 1$            | 0              |
|         | `int`    | 4バイト  | $-2^{31}$                | $2^{31} - 1$            | 0              |
|         | `long`   | 8バイト  | $-2^{63}$                | $2^{63} - 1$            | 0              |
| 浮動小数点 | `float`  | 4バイト  | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|         | `double` | 8バイト  | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | 0.0            |
| 文字    | `char`   | 2バイト  | 0                        | $2^{16} - 1$            | 0              |
| ブール  | `bool`   | 1バイト  | $\text{false}$           | $\text{true}$           | $\text{false}$ |

上記の表はJavaの基本データ型に特有であることにご注意ください。すべてのプログラミング言語には独自のデータ型定義があり、占有空間、値の範囲、デフォルト値が異なる場合があります。

- Pythonでは、整数型`int`は任意のサイズになることができ、利用可能なメモリによってのみ制限されます。浮動小数点`float`は倍精度64ビットです。`char`型は存在せず、単一文字は実際には長さ1の文字列`str`です。
- CおよびC++では基本データ型のサイズが指定されておらず、実装とプラットフォームによって異なります。上記の表はLP64[データモデル](https://en.cppreference.com/w/cpp/language/types#Properties)に従っており、LinuxやmacOSを含むUnix 64ビットオペレーティングシステムで使用されています。
- CおよびC++における`char`のサイズは1バイトですが、ほとんどのプログラミング言語では、特定の文字エンコーディング方法に依存し、詳細は「文字エンコーディング」の章で説明されています。
- ブール値の表現には1ビット（0または1）のみが必要ですが、通常はメモリ内に1バイトとして格納されます。これは、現代のコンピュータCPUが通常1バイトを最小のアドレス可能なメモリ単位として使用するためです。

では、基本データ型とデータ構造の関係は何でしょうか？データ構造とは、コンピュータ内でデータを組織化し格納する方法であることを知っています。ここでの焦点は「データ」ではなく「構造」です。

「数値の列」を表現したい場合、自然に配列の使用を考えます。これは、配列の線形構造が数値の隣接性と順序性を表現できるためですが、格納される内容が整数`int`、小数`float`、文字`char`のいずれであっても、「データ構造」とは無関係です。

言い換えると、**基本データ型はデータの「内容型」を提供し、データ構造はデータの「組織化方法」を提供します**。例えば、以下のコードでは、同じデータ構造（配列）を使用して、`int`、`float`、`char`、`bool`などの異なる基本データ型を格納し表現しています。

=== "Python"

    ```python title=""
    # 様々な基本データ型を使用して配列を初期化
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Pythonの文字は実際には長さ1の文字列
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Pythonのリストは様々な基本データ型とオブジェクト参照を自由に格納可能
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // 様々な基本データ型を使用して配列を初期化
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // 様々な基本データ型を使用して配列を初期化
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // 様々な基本データ型を使用して配列を初期化
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // 様々な基本データ型を使用して配列を初期化
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // 様々な基本データ型を使用して配列を初期化
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScriptの配列は様々な基本データ型とオブジェクトを自由に格納可能
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // 様々な基本データ型を使用して配列を初期化
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // 様々な基本データ型を使用して配列を初期化
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // 様々な基本データ型を使用して配列を初期化
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0, 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // 様々な基本データ型を使用して配列を初期化
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""

    ```

=== "Zig"

    ```zig title=""
    // 様々な基本データ型を使用して配列を初期化
    var numbers: [5]i32 = undefined;
    var decimals: [5]f32 = undefined;
    var characters: [5]u8 = undefined;
    var bools: [5]bool = undefined;
    ```
