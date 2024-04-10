# 基本資料型別

當談及計算機中的資料時，我們會想到文字、圖片、影片、語音、3D 模型等各種形式。儘管這些資料的組織形式各異，但它們都由各種基本資料型別構成。

**基本資料型別是 CPU 可以直接進行運算的型別**，在演算法中直接被使用，主要包括以下幾種。

- 整數型別 `byte`、`short`、`int`、`long` 。
- 浮點數型別 `float`、`double` ，用於表示小數。
- 字元型別 `char` ，用於表示各種語言的字母、標點符號甚至表情符號等。
- 布林型別 `bool` ，用於表示“是”與“否”判斷。

**基本資料型別以二進位制的形式儲存在計算機中**。一個二進位制位即為 $1$ 位元。在絕大多數現代作業系統中，$1$ 位元組（byte）由 $8$ 位元（bit）組成。

基本資料型別的取值範圍取決於其佔用的空間大小。下面以 Java 為例。

- 整數型別 `byte` 佔用 $1$ 位元組 = $8$ 位元 ，可以表示 $2^{8}$ 個數字。
- 整數型別 `int` 佔用 $4$ 位元組 = $32$ 位元 ，可以表示 $2^{32}$ 個數字。

下表列舉了 Java 中各種基本資料型別的佔用空間、取值範圍和預設值。此表格無須死記硬背，大致理解即可，需要時可以透過查表來回憶。

<p align="center"> 表 <id> &nbsp; 基本資料型別的佔用空間和取值範圍 </p>

| 型別   | 符號     | 佔用空間 | 最小值                   | 最大值                  | 預設值         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 整數   | `byte`   | 1 位元組   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 位元組   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 位元組   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 位元組   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 浮點數 | `float`  | 4 位元組   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 位元組   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 字元   | `char`   | 2 位元組   | $0$                      | $2^{16} - 1$            | $0$            |
| 布林   | `bool`   | 1 位元組   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

請注意，上表針對的是 Java 的基本資料型別的情況。每種程式語言都有各自的資料型別定義，它們的佔用空間、取值範圍和預設值可能會有所不同。

- 在 Python 中，整數型別 `int` 可以是任意大小，只受限於可用記憶體；浮點數 `float` 是雙精度 64 位；沒有 `char` 型別，單個字元實際上是長度為 1 的字串 `str` 。
- C 和 C++ 未明確規定基本資料型別的大小，而因實現和平臺各異。上表遵循 LP64 [資料模型](https://en.cppreference.com/w/cpp/language/types#Properties)，其用於包括 Linux 和 macOS 在內的 Unix 64 位作業系統。
- 字元 `char` 的大小在 C 和 C++ 中為 1 位元組，在大多數程式語言中取決於特定的字元編碼方法，詳見“字元編碼”章節。
- 即使表示布林量僅需 1 位（$0$ 或 $1$），它在記憶體中通常也儲存為 1 位元組。這是因為現代計算機 CPU 通常將 1 位元組作為最小定址記憶體單元。

那麼，基本資料型別與資料結構之間有什麼關聯呢？我們知道，資料結構是在計算機中組織與儲存資料的方式。這句話的主語是“結構”而非“資料”。

如果想表示“一排數字”，我們自然會想到使用陣列。這是因為陣列的線性結構可以表示數字的相鄰關係和順序關係，但至於儲存的內容是整數 `int`、小數 `float` 還是字元 `char` ，則與“資料結構”無關。

換句話說，**基本資料型別提供了資料的“內容型別”，而資料結構提供了資料的“組織方式”**。例如以下程式碼，我們用相同的資料結構（陣列）來儲存與表示不同的基本資料型別，包括 `int`、`float`、`char`、`bool` 等。

=== "Python"

    ```python title=""
    # 使用多種基本資料型別來初始化陣列
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python 的字元實際上是長度為 1 的字串
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python 的串列可以自由儲存各種基本資料型別和物件引用
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // 使用多種基本資料型別來初始化陣列
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // 使用多種基本資料型別來初始化陣列
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // 使用多種基本資料型別來初始化陣列
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // 使用多種基本資料型別來初始化陣列
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // 使用多種基本資料型別來初始化陣列
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript 的陣列可以自由儲存各種基本資料型別和物件
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // 使用多種基本資料型別來初始化陣列
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // 使用多種基本資料型別來初始化陣列
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // 使用多種基本資料型別來初始化陣列
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // 使用多種基本資料型別來初始化陣列
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // 使用多種基本資料型別來初始化陣列
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby 的串列可以自由儲存各種基本資料型別和物件引用
    data = [0, 0.0, 'a', false, ListNode(0)]
    ```

=== "Zig"

    ```zig title=""

    ```

??? pythontutor "視覺化執行"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B9%BC%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%A4%9A%E7%A8%AE%E5%9F%BA%E6%9C%AC%E8%B3%87%E6%96%99%E5%9E%8B%E5%88%A5%E4%BE%86%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E5%85%83%E5%AF%A6%E9%9A%9B%E4%B8%8A%E6%98%AF%E9%95%B7%E5%BA%A6%E7%82%BA%201%20%E7%9A%84%E5%AD%97%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E4%B8%B2%E5%88%97%E5%8F%AF%E4%BB%A5%E8%87%AA%E7%94%B1%E5%84%B2%E5%AD%98%E5%90%84%E7%A8%AE%E5%9F%BA%E6%9C%AC%E8%B3%87%E6%96%99%E5%9E%8B%E5%88%A5%E5%92%8C%E7%89%A9%E4%BB%B6%E5%BC%95%E7%94%A8%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20%27a%27%2C%20False%2C%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
