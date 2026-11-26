---
comments: true
---

# 3.2 &nbsp; 基本データ型

コンピュータが扱うデータと聞いて思い浮かぶのは、文章、画像、動画、音声、3D モデルなどでしょう。構成の仕方はさまざまですが、いずれも基本データ型を組み合わせてできています。

**基本データ型とは、CPU が直接演算できる型です**。アルゴリズムでも直接使われ、主に次の種類があります。

- 整数型の `byte`、`short`、`int`、`long`。
- 小数を表す浮動小数点型の `float`、`double`。
- 各言語の文字や句読点、さらには絵文字などを表す文字型の `char`。
- 「はい」か「いいえ」かの判定を表すブール型の `bool`。

**基本データ型の値はコンピュータ内に二進数として格納されます**。二進数の 1 桁が $1$ ビットです。現在のほとんどの OS では、$1$ バイト（byte）は $8$ ビット（bit）で構成されます。

基本データ型が表せる値の範囲は、使用する領域の大きさで決まります。Java を例に見てみましょう。

- 整数型 `byte` は $1$ バイト、つまり $8$ ビットを使い、$2^{8}$ 通りの数を表せます。
- 整数型 `int` は $4$ バイト、つまり $32$ ビットを使い、$2^{32}$ 通りの数を表せます。

表 3-1 に、Java の基本データ型が使う領域、値の範囲、デフォルト値を示します。暗記する必要はありません。おおまかに理解し、必要に応じて表で確認してください。

<p align="center"> 表 3-1 &nbsp; 基本データ型のサイズと値の範囲 </p>

<div class="center-table" markdown>

| 種類   | 型名     | 使用領域 | 最小値                   | 最大値                  | デフォルト値         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 整数   | `byte`   | 1 バイト   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 バイト   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 バイト   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 バイト   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 浮動小数点数 | `float`  | 4 バイト   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 バイト   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 文字   | `char`   | 2 バイト   | $0$                      | $2^{16} - 1$            | $0$            |
| ブール値   | `bool`   | 1 バイト   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

</div>

表 3-1 が対象とするのは Java の基本データ型です。型の定義は言語ごとに異なり、サイズ、値の範囲、デフォルト値も異なることがあります。

- Python の整数型 `int` は、利用可能なメモリが許す限り任意の大きさの値を扱えます。浮動小数点型 `float` は 64 ビットの倍精度です。`char` 型はなく、単独の文字は実際には長さ 1 の文字列 `str` です。
- C と C++ では基本データ型の大きさは一律に定められておらず、実装やプラットフォームによって異なります。表 3-1 は、Linux や macOS などの 64 ビット Unix 系 OS で使われる LP64 [データモデル](https://en.cppreference.com/w/cpp/language/types#Properties)に従っています。
- C と C++ では `char` の大きさは 1 バイトです。多くの言語では、文字の大きさは使用する文字エンコーディングによって決まります。詳しくは「文字エンコーディング」の節を参照してください。
- ブール値を表すのに必要なのは 1 ビット（$0$ または $1$）だけですが、メモリ上では通常 1 バイトを使います。現代のコンピュータの CPU では、一般にアドレスを指定できる最小のメモリ単位が 1 バイトだからです。

それでは、基本データ型とデータ構造はどのような関係にあるのでしょうか。データ構造とは、コンピュータ内でデータを整理し格納する方法でした。ここで着目しているのは「データ」ではなく「構造」です。

「数の並び」を表したいとき、自然に思いつくのは配列です。配列の線形構造によって、どの数が隣り合うか、どの順に並ぶかを表せるからです。一方、格納するのが整数 `int`、小数 `float`、文字 `char` のどれかということは、「データ構造」とは別の問題です。

言い換えれば、**基本データ型はデータの「内容の型」を、データ構造はデータの「整理の仕方」を定めます**。たとえば次のコードでは、同じデータ構造（配列）を使って `int`、`float`、`char`、`bool` など異なる基本データ型の値を格納し、表現しています。

=== "Python"

    ```python title=""
    # 複数の基本データ型を使って配列を初期化する
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python の文字は、実際には長さ 1 の文字列
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python のリストには、さまざまな基本データ型の値やオブジェクトへの参照を自由に格納できる
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // 複数の基本データ型を使って配列を初期化する
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // 複数の基本データ型を使って配列を初期化する
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // 複数の基本データ型を使って配列を初期化する
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // 複数の基本データ型を使って配列を初期化する
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // 複数の基本データ型を使って配列を初期化する
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript の配列には、さまざまな基本データ型の値やオブジェクトを自由に格納できる
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // 複数の基本データ型を使って配列を初期化する
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // 複数の基本データ型を使って配列を初期化する
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // 複数の基本データ型を使って配列を初期化する
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // 複数の基本データ型を使って配列を初期化する
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // 複数の基本データ型を使って配列を初期化する
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby のリストには、さまざまな基本データ型の値やオブジェクトへの参照を自由に格納できる
    data = [0, 0.0, 'a', false, ListNode.new(0)]
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%A1%A8%E3%81%99%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%AE%E5%80%A4%E3%81%A7%E9%85%8D%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E3%81%A7%E3%81%AF%E3%80%81%E6%96%87%E5%AD%97%E3%81%AF%E9%95%B7%E3%81%95%201%20%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%A8%E3%81%97%E3%81%A6%E8%A1%A8%E3%81%99%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E3%81%AF%E3%80%81%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%AE%E5%80%A4%E3%82%84%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E6%B7%B7%E5%9C%A8%E3%81%95%E3%81%9B%E3%82%89%E3%82%8C%E3%82%8B%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%A1%A8%E3%81%99%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%AE%E5%80%A4%E3%81%A7%E9%85%8D%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E3%81%A7%E3%81%AF%E3%80%81%E6%96%87%E5%AD%97%E3%81%AF%E9%95%B7%E3%81%95%201%20%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%A8%E3%81%97%E3%81%A6%E8%A1%A8%E3%81%99%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E3%81%AF%E3%80%81%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%AE%E5%80%A4%E3%82%84%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E6%B7%B7%E5%9C%A8%E3%81%95%E3%81%9B%E3%82%89%E3%82%8C%E3%82%8B%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
