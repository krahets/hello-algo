# Basic data types

Computer data comes in many forms: text, images, video, audio, 3D models, and more. Although organized differently, all these forms are built from basic data types.

**Basic data types are types on which the CPU can operate directly** and which algorithms use directly. The main types include the following.

- Integer types: `byte`, `short`, `int`, and `long`.
- Floating-point types: `float` and `double`, used to represent fractional numbers.
- The character type `char`, used for letters in different languages, punctuation, and even emoji.
- The Boolean type `bool`, used for yes-or-no values.

**Basic data types are stored in binary form**. One binary digit is $1$ bit. In the vast majority of modern operating systems, $1$ byte consists of $8$ bits.

A basic data type's value range depends on the space it occupies. Taking Java as an example:

- An integer `byte` occupies $1$ byte = $8$ bits and can represent $2^{8}$ distinct values.
- An integer `int` occupies $4$ bytes = $32$ bits and can represent $2^{32}$ distinct values.

The table below lists storage sizes, value ranges, and default values for Java's basic data types. There is no need to memorize it; understand the general picture and refer back when needed.

<p align="center"> Table <id> &nbsp; Storage sizes and value ranges of basic data types </p>

| Type   | Name     | Storage size | Minimum value                   | Maximum value                  | Default value         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| Integer   | `byte`   | 1 byte   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 bytes   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 bytes   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 bytes   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| Floating-point | `float`  | 4 bytes   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 bytes   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| Character   | `char`   | 2 bytes   | $0$                      | $2^{16} - 1$            | $0$            |
| Boolean   | `bool`   | 1 byte   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

The table above describes Java's basic data types. Each programming language defines its own types, whose sizes, value ranges, and default values may differ.

- In Python, an `int` can be arbitrarily large, limited only by available memory. A `float` is a 64-bit double-precision number. There is no `char` type: a single character is a `str` of length 1.
- C and C++ do not fix the sizes of basic data types; they vary by implementation and platform. The table above follows the LP64 [data model](https://en.cppreference.com/w/cpp/language/types#Properties), used by 64-bit Unix operating systems including Linux and macOS.
- A `char` occupies 1 byte in C and C++. In most programming languages, character size depends on the encoding used; see the character encoding section.
- Although a Boolean needs only 1 bit ($0$ or $1$), it usually occupies 1 byte in memory because modern CPUs typically use a byte as the smallest addressable memory unit.

How do basic data types relate to data structures? A data structure is a way to organize and store data in a computer. The emphasis is on structure, rather than the data itself.

To represent a row of numbers, an array comes naturally to mind. Its linear structure captures adjacency and ordering, regardless of whether the stored values are integers (`int`), fractional numbers (`float`), or characters (`char`).

In other words, **basic data types specify what kind of data is stored, while data structures specify how it is organized**. The following code uses the same data structure, an array, for different basic types, including `int`, `float`, `char`, and `bool`.

=== "Python"

    ```python title=""
    # Initialize arrays with different basic data types
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # A Python character is a string of length 1
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python lists can hold different basic data types and object references
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // Initialize arrays with different basic data types
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // Initialize arrays with different basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // Initialize arrays with different basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // Initialize arrays with different basic data types
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // Initialize arrays with different basic data types
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript arrays can hold different basic data types and objects
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // Initialize arrays with different basic data types
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // Initialize arrays with different basic data types
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // Initialize arrays with different basic data types
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // Initialize arrays with different basic data types
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // Initialize arrays with different basic data types
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby arrays can hold different basic data types and object references
    data = [0, 0.0, 'a', false, ListNode(0)]
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20successor%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20arrays%20with%20different%20basic%20data%20types%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20A%20Python%20character%20is%20a%20string%20of%20length%201%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20lists%20can%20hold%20different%20basic%20data%20types%20and%20object%20references%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20%27a%27%2C%20False%2C%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
