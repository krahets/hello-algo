# Basic data types

When discussing data in computers, various forms like text, images, videos, voice and 3D models comes to mind. Despite their different organizational forms, they are all composed of various basic data types.

**Basic data types are those that the CPU can directly operate on** and are directly used in algorithms, mainly including the following.

- Integer types: `byte`, `short`, `int`, `long`.
- Floating-point types: `float`, `double`, used to represent decimals.
- Character type: `char`, used to represent letters, punctuation, and even emojis in various languages.
- Boolean type: `bool`, used to represent "yes" or "no" decisions.

**Basic data types are stored in computers in binary form**. One binary digit is 1 bit. In most modern operating systems, 1 byte consists of 8 bits.

The range of values for basic data types depends on the size of the space they occupy. Below, we take Java as an example.

- The integer type `byte` occupies 1 byte = 8 bits and can represent $2^8$ numbers.
- The integer type `int` occupies 4 bytes = 32 bits and can represent $2^{32}$ numbers.

The following table lists the space occupied, value range, and default values of various basic data types in Java. While memorizing this table isn't necessary, having a general understanding of it and referencing it when required is recommended.

<p align="center"> Table <id> &nbsp; Space occupied and value range of basic data types </p>

| Type    | Symbol   | Space Occupied | Minimum Value            | Maximum Value           | Default Value  |
| ------- | -------- | -------------- | ------------------------ | ----------------------- | -------------- |
| Integer | `byte`   | 1 byte         | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | 0              |
|         | `short`  | 2 bytes        | $-2^{15}$                | $2^{15} - 1$            | 0              |
|         | `int`    | 4 bytes        | $-2^{31}$                | $2^{31} - 1$            | 0              |
|         | `long`   | 8 bytes        | $-2^{63}$                | $2^{63} - 1$            | 0              |
| Float   | `float`  | 4 bytes        | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|         | `double` | 8 bytes        | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | 0.0            |
| Char    | `char`   | 2 bytes        | 0                        | $2^{16} - 1$            | 0              |
| Boolean | `bool`   | 1 byte         | $\text{false}$           | $\text{true}$           | $\text{false}$ |

Please note that the above table is specific to Java's basic data types. Every programming language has its own data type definitions, which might differ in space occupied, value ranges, and default values.

- In Python, the integer type `int` can be of any size, limited only by available memory; the floating-point `float` is double precision 64-bit; there is no `char` type, as a single character is actually a string `str` of length 1.
- C and C++ do not specify the size of basic data types, it varies with implementation and platform. The above table follows the LP64 [data model](https://en.cppreference.com/w/cpp/language/types#Properties), used for Unix 64-bit operating systems including Linux and macOS.
- The size of `char` in C and C++ is 1 byte, while in most programming languages, it depends on the specific character encoding method, as detailed in the "Character Encoding" chapter.
- Even though representing a boolean only requires 1 bit (0 or 1), it is usually stored in memory as 1 byte. This is because modern computer CPUs typically use 1 byte as the smallest addressable memory unit.

So, what is the connection between basic data types and data structures? We know that data structures are ways to organize and store data in computers. The focus here is on "structure" rather than "data".

If we want to represent "a row of numbers", we naturally think of using an array. This is because the linear structure of an array can represent the adjacency and the ordering of the numbers, but whether the stored content is an integer `int`, a decimal `float`, or a character `char`, is irrelevant to the "data structure".

In other words, **basic data types provide the "content type" of data, while data structures provide the "way of organizing" data**. For example, in the following code, we use the same data structure (array) to store and represent different basic data types, including `int`, `float`, `char`, `bool`, etc.

=== "Python"

    ```python title=""
    # Using various basic data types to initialize arrays
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python's characters are actually strings of length 1
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python's lists can freely store various basic data types and object references
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // Using various basic data types to initialize arrays
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // Using various basic data types to initialize arrays
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // Using various basic data types to initialize arrays
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // Using various basic data types to initialize arrays
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // Using various basic data types to initialize arrays
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript's arrays can freely store various basic data types and objects
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // Using various basic data types to initialize arrays
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // Using various basic data types to initialize arrays
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // Using various basic data types to initialize arrays
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0, 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // Using various basic data types to initialize arrays
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
    // Using various basic data types to initialize arrays
    var numbers: [5]i32 = undefined;
    var decimals: [5]f32 = undefined;
    var characters: [5]u8 = undefined;
    var bools: [5]bool = undefined;
    ```
