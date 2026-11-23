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

```snippet
basic_type_arrays
```

??? pythontutor "Visualize execution"

    @tutor basic_type_arrays_tutor
