# Basic Data Types

When we talk about data in computers, we think of various forms such as text, images, videos, audio, 3D models, and more. Although these data are organized in different ways, they are all composed of various basic data types.

**Basic data types are types that the CPU can directly operate on**, and they are directly used in algorithms, mainly including the following.

- Integer types `byte`, `short`, `int`, `long`.
- Floating-point types `float`, `double`, used to represent decimal numbers.
- Character type `char`, used to represent letters, punctuation marks, and even emojis in various languages.
- Boolean type `bool`, used to represent "yes" and "no" judgments.

**Basic data types are stored in binary form in computers**. One binary bit is $1$ bit. In most modern operating systems, $1$ byte consists of $8$ bits.

The range of values for basic data types depends on the size of the space they occupy. Below is an example using Java.

- Integer type `byte` occupies $1$ byte = $8$ bits, and can represent $2^{8}$ numbers.
- Integer type `int` occupies $4$ bytes = $32$ bits, and can represent $2^{32}$ numbers.

The following table lists the space occupied, value ranges, and default values of various basic data types in Java. You don't need to memorize this table; a general understanding is sufficient, and you can refer to it when needed.

<p align="center"> Table <id> &nbsp; Space occupied and value ranges of basic data types </p>

| Type       | Symbol   | Space Occupied | Minimum Value            | Maximum Value           | Default Value  |
| ---------- | -------- | -------------- | ------------------------ | ----------------------- | -------------- |
| Integer    | `byte`   | 1 byte         | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|            | `short`  | 2 bytes        | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|            | `int`    | 4 bytes        | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|            | `long`   | 8 bytes        | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| Float      | `float`  | 4 bytes        | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|            | `double` | 8 bytes        | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| Character  | `char`   | 2 bytes        | $0$                      | $2^{16} - 1$            | $0$            |
| Boolean    | `bool`   | 1 byte         | $\text{false}$           | $\text{true}$           | $\text{false}$ |

Please note that the above table is specific to Java's basic data types. Each programming language has its own data type definitions, and their space occupied, value ranges, and default values may vary.

- In Python, the integer type `int` can be of any size, limited only by available memory; the floating-point type `float` is double-precision 64-bit; there is no `char` type, a single character is actually a string `str` of length 1.
- C and C++ do not explicitly specify the size of basic data types, which varies by implementation and platform. The above table follows the LP64 [data model](https://en.cppreference.com/w/cpp/language/types#Properties), which is used in Unix 64-bit operating systems including Linux and macOS.
- The size of character `char` is 1 byte in C and C++, and in most programming languages it depends on the specific character encoding method, as detailed in the "Character Encoding" section.
- Even though representing a boolean value requires only 1 bit ($0$ or $1$), it is usually stored as 1 byte in memory. This is because modern computer CPUs typically use 1 byte as the minimum addressable memory unit.

So, what is the relationship between basic data types and data structures? We know that data structures are ways of organizing and storing data in computers. The subject of this statement is "structure", not "data".

If we want to represent "a row of numbers", we naturally think of using an array. This is because the linear structure of an array can represent the adjacency and order relationships of numbers, but the content stored—whether integer `int`, floating-point `float`, or character `char`—is unrelated to the "data structure".

In other words, **basic data types provide the "content type" of data, while data structures provide the "organization method" of data**. For example, in the following code, we use the same data structure (array) to store and represent different basic data types, including `int`, `float`, `char`, `bool`, etc.

=== "Python"

    ```python title=""
    # Initialize arrays using various basic data types
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # In Python, characters are actually strings of length 1
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python lists can freely store various basic data types and object references
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // Initialize arrays using various basic data types
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // Initialize arrays using various basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // Initialize arrays using various basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // Initialize arrays using various basic data types
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // Initialize arrays using various basic data types
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript arrays can freely store various basic data types and objects
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // Initialize arrays using various basic data types
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // Initialize arrays using various basic data types
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // Initialize arrays using various basic data types
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // Initialize arrays using various basic data types
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // Initialize arrays using various basic data types
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby lists can freely store various basic data types and object references
    data = [0, 0.0, 'a', false, ListNode(0)]
    ```

??? pythontutor "Visualized Execution"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%A4%9A%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E6%9D%A5%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20*%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E7%AC%A6%E5%AE%9E%E9%99%85%E4%B8%8A%E6%98%AF%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E7%9A%84%E5%AD%97%E7%AC%A6%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B'0'%5D%20*%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%88%97%E8%A1%A8%E5%8F%AF%E4%BB%A5%E8%87%AA%E7%94%B1%E5%AD%98%E5%82%A8%E5%90%84%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E5%92%8C%E5%AF%B9%E8%B1%A1%E5%BC%95%E7%94%A8%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20'a',%20False,%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
