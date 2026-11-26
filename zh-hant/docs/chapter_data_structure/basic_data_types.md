---
comments: true
---

# 3.2 &nbsp; 基本資料型別

提到電腦中的資料，我們可能想到文字、圖片、影片、語音或 3D 模型。這些資料的組織方式各不相同，卻都是由各種基本資料型別組成。

**基本資料型別是 CPU 能直接運算的型別**，在演算法中也可直接使用，主要包括以下幾種。

- 整數型別 `byte`、`short`、`int`、`long`。
- 浮點數型別 `float`、`double`，用來表示小數。
- 字元型別 `char`，用來表示各種語言的字母、標點符號，甚至是表情符號。
- 布林型別 `bool`，用來表示「是」或「否」的判斷結果。

**基本資料型別以二進位形式儲存在電腦中**。一個二進位數位就是 $1$ 位元。在絕大多數現代作業系統中，$1$ 位元組（byte）由 $8$ 位元（bit）組成。

基本資料型別可表示的數值範圍取決於它占用的空間。以下以 Java 為例。

- 整數型別 `byte` 占 $1$ 位元組，即 $8$ 位元，可表示 $2^{8}$ 個不同的數。
- 整數型別 `int` 占 $4$ 位元組，即 $32$ 位元，可表示 $2^{32}$ 個不同的數。

表 3-1 列出 Java 各種基本資料型別占用的空間、數值範圍和預設值。只要大致了解即可，不必死背，需要時再查表。

<p align="center"> 表 3-1 &nbsp; 基本資料型別占用的空間與數值範圍 </p>

<div class="center-table" markdown>

| 型別   | 符號     | 占用空間 | 最小值                   | 最大值                  | 預設值         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 整數   | `byte`   | 1 位元組   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 位元組   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 位元組   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 位元組   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 浮點數 | `float`  | 4 位元組   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 位元組   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 字元   | `char`   | 2 位元組   | $0$                      | $2^{16} - 1$            | $0$            |
| 布林   | `bool`   | 1 位元組   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

</div>

請留意，表 3-1 列的是 Java 的基本資料型別。各程式語言對資料型別有自己的定義，占用空間、數值範圍和預設值都可能不同。

- 在 Python 中，整數型別 `int` 的大小只受可用記憶體限制；浮點數 `float` 採用 64 位元雙精度表示法。Python 沒有 `char` 型別，單一字元其實是長度為 1 的字串 `str`。
- C 和 C++ 並未明訂各基本資料型別的大小，實際大小會因實作與平台而異。表 3-1 依循 LP64 [資料模型](https://en.cppreference.com/w/cpp/language/types#Properties)；包括 Linux 和 macOS 在內的 64 位元 Unix 作業系統採用此模型。
- 在 C 和 C++ 中，字元 `char` 占 1 位元組。在多數程式語言中，字元的大小取決於編碼方式，詳見〈字元編碼〉一節。
- 雖然布林值只需一個位元（$0$ 或 $1$）就能表示，但在記憶體中通常占 1 位元組，因為現代電腦的 CPU 通常以 1 位元組為定址的最小單位。

那麼，基本資料型別與資料結構有什麼關係？我們知道，資料結構是在電腦中組織與儲存資料的方式。這個定義強調的是「結構」，而非「資料」。

若要表示「一排數字」，我們自然會想到陣列，因為陣列的線性結構可以表示數字之間的相鄰關係和先後順序。至於儲存的內容是整數 `int`、小數 `float`，或是字元 `char`，則與「資料結構」無關。

換句話說，**基本資料型別決定資料的「內容型別」，資料結構則決定資料的「組織方式」**。例如，以下程式碼用同一種資料結構（陣列）儲存及表示不同基本型別的資料，包括 `int`、`float`、`char`、`bool` 等。

=== "Python"

    ```python title=""
    # 使用多種基本資料型別初始化陣列
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python 的字元其實是長度為 1 的字串
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python 的列表可自由存放各種基本資料型別的值和物件參照
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // 使用多種基本資料型別初始化陣列
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // 使用多種基本資料型別初始化陣列
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // 使用多種基本資料型別初始化陣列
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // 使用多種基本資料型別初始化陣列
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // 使用多種基本資料型別初始化陣列
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript 的陣列可自由存放各種基本資料型別的值和物件
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // 使用多種基本資料型別初始化陣列
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // 使用多種基本資料型別初始化陣列
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // 使用多種基本資料型別初始化陣列
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // 使用多種基本資料型別初始化陣列
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // 使用多種基本資料型別初始化陣列
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby 的列表可自由存放各種基本資料型別的值和物件參照
    data = [0, 0.0, 'a', false, ListNode.new(0)]
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%94%A8%E5%A4%9A%E7%A8%AE%E5%9F%BA%E6%9C%AC%E8%B3%87%E6%96%99%E5%9E%8B%E5%88%A5%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E5%85%83%E5%85%B6%E5%AF%A6%E6%98%AF%E9%95%B7%E5%BA%A6%E7%82%BA%201%20%E7%9A%84%E5%AD%97%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E4%B8%B2%E5%88%97%E5%8F%AF%E4%BB%A5%E6%B7%B7%E5%90%88%E5%AD%98%E6%94%BE%E5%90%84%E7%A8%AE%E5%9F%BA%E6%9C%AC%E5%9E%8B%E5%88%A5%E7%9A%84%E8%B3%87%E6%96%99%E5%92%8C%E7%89%A9%E4%BB%B6%E5%8F%83%E7%85%A7%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%94%A8%E5%A4%9A%E7%A8%AE%E5%9F%BA%E6%9C%AC%E8%B3%87%E6%96%99%E5%9E%8B%E5%88%A5%E5%88%9D%E5%A7%8B%E5%8C%96%E9%99%A3%E5%88%97%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E5%85%83%E5%85%B6%E5%AF%A6%E6%98%AF%E9%95%B7%E5%BA%A6%E7%82%BA%201%20%E7%9A%84%E5%AD%97%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E4%B8%B2%E5%88%97%E5%8F%AF%E4%BB%A5%E6%B7%B7%E5%90%88%E5%AD%98%E6%94%BE%E5%90%84%E7%A8%AE%E5%9F%BA%E6%9C%AC%E5%9E%8B%E5%88%A5%E7%9A%84%E8%B3%87%E6%96%99%E5%92%8C%E7%89%A9%E4%BB%B6%E5%8F%83%E7%85%A7%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>
