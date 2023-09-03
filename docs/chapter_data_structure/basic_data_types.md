# 基本数据类型

谈及计算机中的数据，我们会想到文本、图片、视频、语音、3D 模型等各种形式。尽管这些数据的组织形式各异，但它们都由各种基本数据类型构成。

**基本数据类型是 CPU 可以直接进行运算的类型**，在算法中直接被使用，主要包括以下几种类型。

- 整数类型 `byte`、`short`、`int`、`long` 。
- 浮点数类型 `float`、`double` ，用于表示小数。
- 字符类型 `char` ，用于表示各种语言的字母、标点符号、甚至表情符号等。
- 布尔类型 `bool` ，用于表示“是”与“否”判断。

**基本数据类型以二进制的形式存储在计算机中**。一个二进制位即为 $1$ 比特。在绝大多数现代系统中，$1$ 字节（byte）由 $8$ 比特（bits）组成。

基本数据类型的取值范围取决于其占用的空间大小。下面以 Java 为例。

- 整数类型 `byte` 占用 $1$ byte = $8$ bits ，可以表示 $2^{8}$ 个数字。
- 整数类型 `int` 占用 $4$ bytes = $32$ bits ，可以表示 $2^{32}$ 个数字。

下表列举了各种基本数据类型的占用空间、取值范围和默认值。此表格无须硬背，大致理解即可，需要时可以通过查表来回忆。

<p align="center"> 表 <id> &nbsp; 基本数据类型的占用空间和取值范围 </p>

| 类型   | 符号     | 占用空间         | 最小值                   | 最大值                  | 默认值         |
| ------ | -------- | ---------------- | ------------------------ | ----------------------- | -------------- |
| 整数   | `byte`   | 1 byte           | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 bytes          | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 bytes          | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 bytes          | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 浮点数 | `float`  | 4 bytes          | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0 f$        |
|        | `double` | 8 bytes          | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 字符   | `char`   | 2 bytes / 1 byte | $0$                      | $2^{16} - 1$            | $0$            |
| 布尔   | `bool`   | 1 byte           | $\text{false}$           | $\text{true}$           | $\text{false}$ |

对于上表，需要注意以下几点。

- C 和 C++ 未明确规定基本数据类型大小，而因实现和平台各异。上表遵循 LP64 [数据模型](https://en.cppreference.com/w/cpp/language/types#Properties)，其用于包括 Linux 和 macOS 在内的 Unix 64 位操作系统。
- 字符 `char` 的大小在 C 和 C++ 中为 1 字节，在大多数编程语言中取决于特定的字符编码方法，详见“字符编码”章节。
- 即使表示布尔量仅需 1 位（$0$ 或 $1$），它在内存中通常被存储为 1 字节。这是因为现代计算机 CPU 通常将 1 字节作为最小寻址内存单元。

那么，基本数据类型与数据结构之间有什么联系呢？我们知道，数据结构是在计算机中组织与存储数据的方式。它的主语是“结构”而非“数据”。

如果想要表示“一排数字”，我们自然会想到使用数组。这是因为数组的线性结构可以表示数字的相邻关系和顺序关系，但至于存储的内容是整数 `int`、小数 `float` 或是字符 `char` ，则与“数据结构”无关。

换句话说，**基本数据类型提供了数据的“内容类型”，而数据结构提供了数据的“组织方式”**。例如以下代码，我们用相同的数据结构（数组）来存储与表示不同的基本数据类型，包括 `int`、`float`、`char`、`bool` 等。

=== "Python"

    ```python title=""
    # 使用多种基本数据类型来初始化数组
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python 的字符应被看作长度为一的字符串
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python 的列表可以自由存储各种基本数据类型和对象引用
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // 使用多种基本数据类型来初始化数组
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // 使用多种基本数据类型来初始化数组
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // 使用多种基本数据类型来初始化数组
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // 使用多种基本数据类型来初始化数组
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // 使用多种基本数据类型来初始化数组
    let numbers = Array(repeating: Int(), count: 5)
    let decimals = Array(repeating: Double(), count: 5)
    let characters = Array(repeating: Character("a"), count: 5)
    let bools = Array(repeating: Bool(), count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript 的数组可以自由存储各种基本数据类型和对象
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // 使用多种基本数据类型来初始化数组
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // 使用多种基本数据类型来初始化数组
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""

    ```

=== "C"

    ```c title=""
    // 使用多种基本数据类型来初始化数组
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Zig"

    ```zig title=""
    
    ```
