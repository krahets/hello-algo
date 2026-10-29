---
comments: true
---

# 3.2 &nbsp; 基本データ型

コンピュータのデータというと、文章、画像、動画、音声、3D モデルなどが思い浮かびます。形はさまざまですが、いずれも基本データ型を組み合わせて作られています。

**基本データ型は、CPU が直接演算できる型**で、アルゴリズムでもそのまま使います。主に次のものがあります。

- 整数型：`byte`、`short`、`int`、`long`。
- 浮動小数点型：`float`、`double`。小数を表します。
- 文字型：`char`。各言語の文字、句読点、さらには絵文字などを表します。
- ブール型：`bool`。「はい」「いいえ」の判断を表します。

**基本データ型は、コンピュータ内では二進数として保存されます**。二進数の 1 桁が $1$ ビットです。現代のほとんどの OS では、$1$ バイト（byte）は $8$ ビット（bit）で構成されます。

基本データ型が取り得る値の範囲は、使う空間の大きさによって決まります。Java を例に見てみましょう。

- 整数型 `byte` は $1$ バイト = $8$ ビットを使い、$2^{8}$ 個の数を表せます。
- 整数型 `int` は $4$ バイト = $32$ ビットを使い、$2^{32}$ 個の数を表せます。

表 3-1 に、Java の基本データ型の使用量、値の範囲、デフォルト値を示します。暗記する必要はなく、大まかに理解し、必要なときに表を確認すれば十分です。

<p align="center"> 表 3-1 &nbsp; 基本データ型の使用量と値の範囲 </p>

<div class="center-table" markdown>

| 型   | 記号     | 使用量 | 最小値                   | 最大値                  | デフォルト値         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 整数   | `byte`   | 1 バイト   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 バイト   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 バイト   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 バイト   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 浮動小数点数 | `float`  | 4 バイト   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 バイト   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 文字   | `char`   | 2 バイト   | $0$                      | $2^{16} - 1$            | $0$            |
| ブール   | `bool`   | 1 バイト   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

</div>

この表は Java の基本データ型を対象にしています。言語ごとに型の定義があり、使用量、値の範囲、デフォルト値が異なる場合があります。

- Python の整数型 `int` は、利用可能なメモリの範囲内で任意の大きさを扱えます。`float` は 64 ビットの倍精度で、`char` 型はなく、1 文字は長さ 1 の文字列 `str` です。
- C と C++ は基本データ型の大きさを厳密には定めておらず、実装や環境によって異なります。表 3-1 は、Linux や macOS を含む 64 ビット Unix 系 OS で使われる LP64 [データモデル](https://en.cppreference.com/w/cpp/language/types#Properties)に従っています。
- C と C++ の `char` は 1 バイトです。多くの言語では、文字の大きさは文字コード方式に依存します。詳しくは「文字エンコーディング」の節で説明します。
- ブール値は 1 ビット（$0$ または $1$）で表せますが、メモリでは通常、1 バイトとして保存されます。現代の CPU が通常、1 バイトを最小のアドレス指定単位とするためです。

では、基本データ型とデータ構造はどう関係するのでしょうか。データ構造は、コンピュータ内でデータを整理・格納する方法です。この言葉の中心は「データ」ではなく「構造」にあります。

「数が一列に並んだもの」を表すなら、自然に配列が思い浮かびます。配列の線形構造が、隣接関係や順序を表せるためです。格納するのが整数 `int`、小数 `float`、文字 `char` のどれかは、「データ構造」とは別のことです。

つまり、**基本データ型はデータの「内容の型」を、データ構造は「整理の仕方」を提供します**。次のコードでは、同じデータ構造（配列）を使い、`int`、`float`、`char`、`bool` など、異なる基本データ型を格納・表現します。

=== "Python"

    ```python title=""
    # さまざまな基本データ型で配列を初期化
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python の文字は、実際には長さ 1 の文字列
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python のリストには、さまざまな基本データ型やオブジェクトへの参照を自由に格納できる
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // さまざまな基本データ型で配列を初期化
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // さまざまな基本データ型で配列を初期化
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // さまざまな基本データ型で配列を初期化
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // さまざまな基本データ型で配列を初期化
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // さまざまな基本データ型で配列を初期化
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript の配列には、さまざまな基本データ型やオブジェクトを自由に格納できる
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // さまざまな基本データ型で配列を初期化
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // さまざまな基本データ型で配列を初期化
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // さまざまな基本データ型で配列を初期化
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // さまざまな基本データ型で配列を初期化
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // さまざまな基本データ型で配列を初期化
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby のリストには、さまざまな基本データ型やオブジェクトへの参照を自由に格納できる
    data = [0, 0.0, 'a', false, ListNode(0)]
    ```

??? pythontutor "実行の可視化"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%A7%E9%85%8D%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20*%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20*%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E6%96%87%E5%AD%97%E3%81%AF%E3%80%81%E5%AE%9F%E9%9A%9B%E3%81%AB%E3%81%AF%E9%95%B7%E3%81%95%201%20%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%0A%20%20%20%20characters%20%3D%20%5B'0'%5D%20*%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20*%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E3%81%AF%E3%80%81%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%82%84%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E8%87%AA%E7%94%B1%E3%81%AB%E6%A0%BC%E7%B4%8D%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20'a'%2C%20False%2C%20ListNode(0)%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%A7%E9%85%8D%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20*%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20*%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E6%96%87%E5%AD%97%E3%81%AF%E3%80%81%E5%AE%9F%E9%9A%9B%E3%81%AB%E3%81%AF%E9%95%B7%E3%81%95%201%20%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%0A%20%20%20%20characters%20%3D%20%5B'0'%5D%20*%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20*%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E3%81%AF%E3%80%81%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%82%84%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E8%87%AA%E7%94%B1%E3%81%AB%E6%A0%BC%E7%B4%8D%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20'a'%2C%20False%2C%20ListNode(0)%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
