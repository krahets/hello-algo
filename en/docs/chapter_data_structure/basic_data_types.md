# Basic data types

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

The table describes Java's basic data types. Each programming language defines its own types, which may differ in size, range, and default value.

- In Python, an `int` can grow as large as available memory allows, and a `float` is a 64-bit double-precision number. Python has no `char` type: a single character is a `str` of length 1.
- C and C++ leave the exact sizes of basic types to the implementation and platform. The table follows the LP64 [data model](https://en.cppreference.com/w/cpp/language/types#Properties) used by 64-bit Unix platforms, including Linux and macOS.
- In C and C++, a `char` occupies 1 byte. In most programming languages, character size depends on the encoding, as discussed in “Character encoding.”
- Although a Boolean value needs only 1 bit ($0$ or $1$), it is usually stored in 1 byte of memory. Modern CPUs typically use 1 byte as the smallest addressable unit of memory.

How do basic data types relate to data structures? A data structure is a way of organizing and storing data in a computer. The focus of this definition is the structure of the data.

To represent a row of numbers, we naturally think of an array. Its linear structure captures which numbers are adjacent and in what order. Whether the contents are integers (`int`), floating-point numbers (`float`), or characters (`char`) is a separate matter.

In other words, **a basic data type describes what is stored, while a data structure describes how it is organized**. In the following code, the same structure, an array, stores and represents different basic types including `int`, `float`, `char`, and `bool`.

```snippet
basic_type_arrays
```

??? pythontutor "Visualize execution"

    @tutor basic_type_arrays_tutor
