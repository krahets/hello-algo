# Summary

### Highlights

- Data structures can be categorized in terms of both logical and physical structures. Logical structure describes the logical relationships between data elements, while physical structure describes how data is stored in computer memory.
- Common logical structures include linear, tree and net. Usually we categorize data structures into linear (arrays, linked lists, stacks, queues) and non-linear (trees, graphs, heaps) based on their logical structure. Implementations of hash tables may contain both linear and nonlinear structures.
- When a program runs, data is stored in computer memory. Each memory space has a corresponding memory address through which the program accesses the data.
- Physical structures are mainly categorized into continuous space storage (arrays) and distributed space storage (linked lists). All data structures are implemented as arrays, linked lists, or a combination of both.
- The basic data types in computers include integers `byte`, `short`, `int`, `long`, floats `float`, `double`, characters `char`, and booleans `boolean`. The range of their values depends on the amount of space occupied and the representation.
- True form, 1's complement code and 2's complement code are the three methods of coding numbers in a computer and they are interconvertible. The highest bit of the true form of an integer is the sign bit and the remaining bits are the value of the number.
- Integers are stored in computers as 2's complement code. Under the 2's complement code representation, computers can treat addition of positive and negative numbers equally, do not need to design separate special hardware circuits for subtraction operations, and do not have the problem of positive and negative zero ambiguity.
- Floating point numbers are encoded with 1 sign bit, 8 exponent bits, and 23 fractional bits. Because of the exponent bits, floating-point numbers have a much wider range of values than integers, at the expense of precision.
- ASCII is the earliest English character set, with a length of 1 byte and a total of 127 characters; GBK is the most commonly used Chinese character set, with a total of more than 20,000 Chinese characters; Unicode is committed to providing a complete character set standard, including characters of various languages in the world, so as to solve the problem of garbled characters caused by inconsistent character encoding methods.
- UTF-8 is the most popular Unicode encoding method, which is very versatile. It is a variable-length encoding method with good scalability, which effectively improves the efficiency of storage space usage.UTF-16 and UTF-32 are equal-length encoding methods, and UTF-16 occupies less space than UTF-8 when encoding Chinese. When encoding Chinese, UTF-16 takes less space than UTF-8. Programming languages like Java and C# use UTF-16 encoding by default.

### Q & A

!!! question "Why does a hash table contain both a linear data structure and a nonlinear data structure?"

    Hash table underlying the array, and in order to solve hash collision, we may use the "chained address" (subsequent hash table chapter will talk about): each bucket in the array to point to a chained list, when the length of the chained list exceeds a certain threshold, and may be transformed into a tree (usually a red-black tree).
    From a storage point of view, the underlying level of a hash table is an array, where each bucket slot bit may contain a value, a linked list or a tree. Thus, hash tables may contain both linear (arrays, linked lists) and nonlinear (trees) data structures.

!!! question "Is the length of the `char` type 1 byte?"

    The length of the `char` type is determined by the encoding method used by the programming language. For example, Java, JS, TS, C# all use UTF-16 encoding (save Unicode code point), so the length of char type is 2 bytes.

!!! Question "Is it ambiguous that data structures implemented based on arrays are also called "static data structures"? Because the stack can also perform operations such as stack out and stack in, which are "dynamic"."

    Stacks do allow dynamic data manipulation, but the data structure is still "static" (immutable in length). Although data structures based on arrays can dynamically add or remove elements, their capacity is fixed. If the amount of data exceeds the pre-allocated size, a new, larger array needs to be created and the contents of the old array copied into the new one.

!!! question "Why are stacks (queues) "static data structures" when their size is not specified at the time of construction?"

    In high-level programming languages, we do not have to manually specify the initial size of the stack (queue), this is done automatically from within the class. For example, Java's ArrayList usually has an initial capacity of 10. In addition, the expansion operation is also automatic. See the "Lists" section of this book for more details.
