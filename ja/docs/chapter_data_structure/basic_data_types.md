# 基本データ型

コンピュータ内のデータについて考えるとき、テキスト、画像、動画、音声、3D モデルなど、さまざまな形態を思い浮かべます。これらのデータの構成形式はそれぞれ異なりますが、いずれも各種の基本データ型によって成り立っています。

**基本データ型は CPU が直接演算できる型**であり、アルゴリズムの中で直接使われます。主なものは次のとおりです。

- 整数型 `byte`、`short`、`int`、`long` 。
- 浮動小数点数型 `float`、`double` ，小数を表すために使います。
- 文字型 `char` ，各言語の文字、句読点、さらには絵文字などを表すために使います。
- 真偽値型 `bool` ，真か偽かの判定を表すために使います。

**基本データ型はコンピュータ内で 2 進数の形で格納されます**。1 つの二進桁は $1$ ビットです。現代のほとんどのオペレーティングシステムでは、$1$ バイト（byte）は $8$ ビット（bit）で構成されます。

基本データ型の値域は、その型が占める領域の大きさによって決まります。以下では Java を例に取ります。

- 整数型 `byte` は $1$ バイト = $8$ ビットを占め、$2^{8}$ 個の数を表せます。
- 整数型 `int` は $4$ バイト = $32$ ビットを占め、$2^{32}$ 個の数を表せます。

下表は、Java における各種基本データ型の使用領域、値域、デフォルト値を示したものです。この表を丸暗記する必要はなく、大まかに理解しておけば十分であり、必要になったときに参照すればかまいません。

<p align="center"> 表 <id> &nbsp; 基本データ型の使用領域と値域 </p>

| 型     | 記号     | 使用領域 | 最小値                   | 最大値                  | デフォルト値   |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 整数   | `byte`   | 1 バイト | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 バイト | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 バイト | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 バイト | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 浮動小数点数 | `float`  | 4 バイト | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 バイト | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 文字   | `char`   | 2 バイト | $0$                      | $2^{16} - 1$            | $0$            |
| 真偽値 | `bool`   | 1 バイト | $\text{false}$           | $\text{true}$           | $\text{false}$ |

注意してください。上表は Java の基本データ型に対するものです。各プログラミング言語にはそれぞれ独自のデータ型定義があり、使用領域、値域、デフォルト値は異なる場合があります。

- Python では、整数型 `int` は利用可能なメモリに制限されるだけで任意の大きさを取れます。浮動小数点数 `float` は倍精度 64 ビットです。`char` 型はなく、1 文字は実際には長さ 1 の文字列 `str` です。
- C と C++ では基本データ型の大きさは明確に規定されておらず、実装やプラットフォームによって異なります。上表は LP64 [データモデル](https://en.cppreference.com/w/cpp/language/types#Properties) に従っており、Linux や macOS を含む Unix 系 64 ビット OS で用いられています。
- `char` の大きさは C と C++ では 1 バイトですが、多くのプログラミング言語では採用する文字エンコーディング方式によって決まります。詳しくは「文字エンコーディング」の章を参照してください。
- 真偽値を表すのに必要なのは 1 ビット（$0$ または $1$）だけですが、メモリ上では通常 1 バイトとして格納されます。これは、現代のコンピュータ CPU が通常 1 バイトを最小のアドレス指定可能なメモリ単位としているためです。

では、基本データ型とデータ構造の間にはどのような関係があるのでしょうか。データ構造とは、コンピュータ内でデータを組織し格納する方法のことです。この言葉で主役なのは「データ」ではなく「構造」です。

「数字の並び」を表したいなら、自然に配列の使用を思い浮かべるでしょう。これは、配列の線形構造が数字どうしの隣接関係や順序関係を表せるからです。しかし、格納する内容が整数 `int` なのか、小数 `float` なのか、文字 `char` なのかは、「データ構造」とは関係ありません。

言い換えると、**基本データ型はデータの「内容の型」を提供し、データ構造はデータの「組織方法」を提供します**。たとえば次のコードでは、同じデータ構造（配列）を使って `int`、`float`、`char`、`bool` など異なる基本データ型を格納・表現しています。

=== "Python"

    ```python title=""
    # さまざまな基本データ型で配列を初期化する
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python の文字は実際には長さ 1 の文字列
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python のリストはさまざまな基本データ型とオブジェクト参照を自由に格納できる
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // さまざまな基本データ型で配列を初期化する
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // さまざまな基本データ型で配列を初期化する
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // さまざまな基本データ型で配列を初期化する
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // さまざまな基本データ型で配列を初期化する
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // さまざまな基本データ型で配列を初期化する
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript の配列はさまざまな基本データ型とオブジェクトを自由に格納できる
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // さまざまな基本データ型で配列を初期化する
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // さまざまな基本データ型で配列を初期化する
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // さまざまな基本データ型で配列を初期化する
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // さまざまな基本データ型で配列を初期化する
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // さまざまな基本データ型で配列を初期化する
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby のリストはさまざまな基本データ型とオブジェクト参照を自由に格納できる
    data = [0, 0.0, 'a', false, ListNode(0)]
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%A4%9A%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E6%9D%A5%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20*%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E7%AC%A6%E5%AE%9E%E9%99%85%E4%B8%8A%E6%98%AF%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E7%9A%84%E5%AD%97%E7%AC%A6%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B'0'%5D%20*%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%88%97%E8%A1%A8%E5%8F%AF%E4%BB%A5%E8%87%AA%E7%94%B1%E5%AD%98%E5%82%A8%E5%90%84%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E5%92%8C%E5%AF%B9%E8%B1%A1%E5%BC%95%E7%94%A8%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20'a',%20False,%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
