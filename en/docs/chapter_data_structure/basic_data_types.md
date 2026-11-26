---
comments: true
---

# 3.2 &nbsp; Basic data types

Computer data takes many forms, including text, images, video, speech, and 3D models. Although these forms organize data differently, they are all built from basic data types.

**Basic data types are types the CPU can operate on directly**. Algorithms use them directly as well. The main kinds are:

- Integer types: `byte`, `short`, `int`, and `long`.
- Floating-point types: `float` and `double`, used to represent numbers with fractional parts.
- Character type: `char`, used to represent letters in various languages, punctuation, and even emoji.
- Boolean type: `bool`, used to represent yes-or-no decisions.

**Computers store values of basic data types in binary**. A binary digit is $1$ bit. On the vast majority of modern operating systems, $1$ byte consists of $8$ bits.

The range of a basic data type depends on how much space it occupies. Consider Java as an example.

- The integer type `byte` occupies $1$ byte = $8$ bits and can represent $2^{8}$ distinct values.
- The integer type `int` occupies $4$ bytes = $32$ bits and can represent $2^{32}$ distinct values.

The table lists the storage requirements, ranges, and default values of Java's basic data types. There is no need to memorize it. Get a general sense of the types and consult the table when you need a detail.

<p align="center">Table <id> &nbsp; Storage requirements and ranges of basic data types</p>

<div class="center-table" markdown>

| Type   | Type name     | Storage | Minimum                   | Maximum                  | Default         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| Integer   | `byte`   | 1 byte   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2 bytes   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4 bytes   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8 bytes   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| Floating-point | `float`  | 4 bytes   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8 bytes   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| Character   | `char`   | 2 bytes   | $0$                      | $2^{16} - 1$            | $0$            |
| Boolean   | `bool`   | 1 byte   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

</div>

The table describes Java's basic data types. Each programming language defines its own types, which may differ in size, range, and default value.

- In Python, an `int` can grow as large as available memory allows, and a `float` is a 64-bit double-precision number. Python has no `char` type: a single character is a `str` of length 1.
- C and C++ leave the exact sizes of basic types to the implementation and platform. The table follows the LP64 [data model](https://en.cppreference.com/w/cpp/language/types#Properties) used by 64-bit Unix platforms, including Linux and macOS.
- In C and C++, a `char` occupies 1 byte. In most programming languages, character size depends on the encoding, as discussed in “Character encoding.”
- Although a Boolean value needs only 1 bit ($0$ or $1$), it is usually stored in 1 byte of memory. Modern CPUs typically use 1 byte as the smallest addressable unit of memory.

How do basic data types relate to data structures? A data structure is a way of organizing and storing data in a computer. The focus of this definition is the structure of the data.

To represent a row of numbers, we naturally think of an array. Its linear structure captures which numbers are adjacent and in what order. Whether the contents are integers (`int`), floating-point numbers (`float`), or characters (`char`) is a separate matter.

In other words, **a basic data type describes what is stored, while a data structure describes how it is organized**. In the following code, the same structure, an array, stores and represents different basic types including `int`, `float`, `char`, and `bool`.

=== "Python"

    ```python title=""
    # Initialize a separate list for each basic type shown
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # A Python character is a string of length 1
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # A Python list can hold a mix of basic data types and object references
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // Declare a separate array for each basic type shown
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // Initialize a separate array for each basic type shown
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // Initialize a separate array for each basic type shown
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // Initialize a separate array for each basic type shown
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // Initialize a separate array for each basic type shown
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // A JavaScript array can hold a mix of basic data types and objects
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // Initialize a separate array for each basic type shown
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // Initialize a separate list for each basic type shown
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // Initialize a separate vector for each basic type shown
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // Declare a separate array for each basic type shown
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // Initialize a separate array for each basic type shown
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # A Ruby list can hold a mix of basic data types and object references
    data = [0, 0.0, 'a', false, ListNode.new(0)]
    ```

??? pythontutor "Visualize execution"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20arrays%20using%20several%20basic%20data%20types%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20In%20Python,%20a%20character%20is%20a%20string%20of%20length%201%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20A%20Python%20list%20can%20hold%20a%20mix%20of%20basic%20data%20types%20and%20object%20references%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20arrays%20using%20several%20basic%20data%20types%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20In%20Python,%20a%20character%20is%20a%20string%20of%20length%201%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20A%20Python%20list%20can%20hold%20a%20mix%20of%20basic%20data%20types%20and%20object%20references%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>
