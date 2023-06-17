# 基本数据类型

谈及计算机中的数据，我们会想到文本、图片、视频、语音、3D 模型等各种形式。尽管这些数据的组织形式各异，但它们都由各种基本数据类型构成。

**基本数据类型是 CPU 可以直接进行运算的类型，在算法中直接被使用**。它包括：

- 整数类型 `byte` , `short` , `int` , `long` ；
- 浮点数类型 `float` , `double` ，用于表示小数；
- 字符类型 `char` ，用于表示各种语言的字母、标点符号、甚至表情符号等；
- 布尔类型 `bool` ，用于表示“是”与“否”判断；

**所有基本数据类型都以二进制的形式存储在计算机中**。在计算机中，我们将 $1$ 个二进制位称为 $1$ 比特，并规定 $1$ 字节（byte）由 $8$ 比特（bits）组成。基本数据类型的取值范围取决于其占用的空间大小，例如：

- 整数类型 `byte` 占用 $1$ byte = $8$ bits ，可以表示 $2^{8}$ 个不同的数字；
- 整数类型 `int` 占用 $4$ bytes = $32$ bits ，可以表示 $2^{32}$ 个数字；

下表列举了各种基本数据类型的占用空间、取值范围和默认值。此表格无需硬背，大致理解即可，需要时可以通过查表来回忆。

<div class="center-table" markdown>

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

</div>

!!! tip

    字符的占用空间大小取决于编程语言采用的字符编码方法，详见「字符编码」章节。
    
    现代计算机 CPU 通常将 1 字节作为最小寻址内存单元。因此，即使表示布尔量仅需 1 位（$0$ 或 $1$），它在内存中通常被存储为 1 字节。

那么，基本数据类型与数据结构之间有什么联系与区别呢？我们知道，数据结构是在计算机中组织与存储数据的方式。它的主语是“结构”，而非“数据”。如果想要表示“一排数字”，我们自然会想到使用数组。这是因为数组的线性结构可以表示数字的相邻关系和顺序关系，但至于存储的内容是整数 `int` 、小数 `float` 、还是字符 `char` ，则与“数据结构”无关。

换句话说，**基本数据类型提供了数据的“内容类型”，而数据结构提供了数据的“组织方式”**。如以下代码所示，我们可以使用不同基本数据类型来初始化数组。

=== "Java"

    ```java title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] booleans = new boolean[5];
    ```

=== "C++"

    ```cpp title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool booleans[5];
    ```

=== "Python"

    ```python title=""
    # Python 的 list 可以自由存储各种基本数据类型和对象
    list = [0, 0.0, 'a', False]
    ```

=== "Go"

    ```go title=""
    // 使用多种「基本数据类型」来初始化「数组」
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var booleans = [5]bool{}
    ```

=== "JavaScript"

    ```javascript title=""
    /* JavaScript 的数组可以自由存储各种基本数据类型和对象 */
    const array = [0, 0.0, 'a', false];
    ```

=== "TypeScript"

    ```typescript title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    const numbers: number[] = [];
    const characters: string[] = [];
    const booleans: boolean[] = [];
    ```

=== "C"

    ```c title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool booleans[10];
    ```

=== "C#"

    ```csharp title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] booleans = new bool[5];
    ```

=== "Swift"

    ```swift title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    let numbers = Array(repeating: Int(), count: 5)
    let decimals = Array(repeating: Double(), count: 5)
    let characters = Array(repeating: Character("a"), count: 5)
    let booleans = Array(repeating: Bool(), count: 5)
    ```

=== "Zig"

    ```zig title=""
    
    ```

=== "Dart"

    ```dart title=""
    /* 使用多种「基本数据类型」来初始化「数组」 */
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> booleans = List.filled(5, false);
    ```
