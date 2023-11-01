# Basic Data Types

When we talk about data in computers, we think of various forms such as text, pictures, videos, speech, 3D models, and so on. Although these data are organized in different ways, they all consist of various basic data types.

**Basic data types are types that the CPU can directly perform arithmetic on and are used directly in algorithms**, and include the following main types.

- Integer types `byte`, `short`, `int`, `long`.
- Floating point types `float`, `double`, used to represent decimals.
- Character type `char` , used to represent letters, punctuation marks, and even emoticons in various languages.
- Boolean type `bool`, used to represent the "yes" and "no" judgment.

**Basic data types are stored in the computer in binary form**. One binary bit is $1$ bit. In most modern systems, $1$ bytes are made up of $8$ bits.

The range of values for a basic data type depends on the amount of space it takes up. The following is an example from Java.

- The integer type `byte` occupies $1$ byte = $8$ bits and can represent $2^{8}$ numbers.
- The integer type `int` occupies $4$ bytes = $32$ bits and can represent $2^{32}$ numbers.

The table below lists the space occupation, value ranges and default values of various basic data types. This table does not need to be memorized, a general solution is sufficient, and can be recalled by checking the table when needed.

<p align="center"> Table <id> &nbsp; Space Occupancy and Range of Values for Basic Datatypes </p>

| Type           | Symbol   | Occupancy        | Minimum                  | Maximum                 | Default                       |
| -------------- | -------- | ---------------- | ------------------------ | ----------------------- | ----------------------------- |
| integer        | `byte`   | 1 byte           | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$                           |
|                | `short`  | 2 bytes          | $-2^{15}$                | $2^{15} - 1$            | $0$                           |
|                | `int`    | 4 bytes          | $-2^{31}$                | $2^{31} - 1$            | $0$                           |
|                | `long`   | 8 bytes          | $-2^{63}$                | $2^{63} - 1$            | $0$                           |
| Floating Point | `float`  | 4 bytes          | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0 f$                       |
|                | `double` | 8 bytes          | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$                         |
| Characters     | `char`   | 2 bytes / 1 byte | $0$                      | $2^{16} - 1$            | $0$                           |
| Boolean        | `bool`   | 1 byte           | $\text{false}$           | $\text{true}$           | $\text{false}$ $\text{false}$ |

For the above table, the following points need to be noted.

- C and C++ do not explicitly specify the size of the base datatype, which varies by implementation and platform. The table above follows the LP64 [Data Model](https://en.cppreference.com/w/cpp/language/types#Properties), which is used on Unix 64-bit operating systems including Linux and macOS.
- The size of the character `char` is 1 byte in C and C++, and depends on a specific character encoding method in most programming languages, see the "Character Encoding" section for details.
- Even though it only takes 1 bit ($0$ or $1$) to represent a Boolean quantity, it is usually stored as 1 byte in memory. This is because modern computer CPUs usually use 1 byte as the smallest addressable memory unit.

So what is the connection between basic data types and data structures? As we know, data structure is the way data is organized and stored in a computer. Its subject is "structure" rather than "data".

If we want to represent "an array of numbers", we naturally think of using an array. This is because the linear structure of arrays allows us to represent the adjacency and order of numbers, but whether the contents are stored as integers `int`, decimals `float`, or characters `char` has nothing to do with the "data structure".

In other words, **basic data types provide the "content type" of the data, while data structures provide the "organization" of the data**. For example, in the following code, we use the same data structure (array) to store and represent different basic data types, including `int`, `float`, `char`, `bool`, and so on.

=== "Python"

    ```python title=""
    # Initialize arrays with a variety of basic data types
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python's characters should be treated as strings of length one
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python's lists are free to store all kinds of basic data types and object references.
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // Initialize arrays with multiple basic data types
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // Initialize arrays with multiple basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // Initialize arrays with multiple basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // Initialize arrays with multiple basic data types
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // Initialize arrays with multiple basic data types
    let numbers = Array(repeating: Int(), count: 5)
    let decimals = Array(repeating: Double(), count: 5)
    let characters = Array(repeating: Character("a"), count: 5)
    let bools = Array(repeating: Bool(), count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript arrays are free to store a variety of basic data types and objects.
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // Initialize arrays with multiple basic data types
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // Initialize arrays with multiple basic data types
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // Initialize arrays with multiple basic data types
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<float> = vec![0.0, 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // Initialize arrays with multiple basic data types
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Zig"

    ```zig title=""
   
    ```
