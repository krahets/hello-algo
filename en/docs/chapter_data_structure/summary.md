# Summary

### Key review

- Data structures can be categorized from two perspectives: logical structure and physical structure. Logical structure describes the logical relationships between data elements, while physical structure describes how data is stored in computer memory.
- Common logical structures include linear, tree-like, and network structures. We generally classify data structures into linear (arrays, linked lists, stacks, queues) and non-linear (trees, graphs, heaps) based on their logical structure. The implementation of hash tables may involve both linear and non-linear data structures.
- When a program runs, data is stored in computer memory. Each memory space has a corresponding memory address, and the program accesses data through these addresses.
- Physical structures are primarily divided into contiguous space storage (arrays) and dispersed space storage (linked lists). All data structures are implemented using arrays, linked lists, or a combination of both.
- Basic data types in computers include integers (`byte`, `short`, `int`, `long`), floating-point numbers (`float`, `double`), characters (`char`), and booleans (`boolean`). Their range depends on the size of the space occupied and the representation method.
- Original code, complement code, and two's complement code are three methods of encoding numbers in computers, and they can be converted into each other. The highest bit of the original code of an integer is the sign bit, and the remaining bits represent the value of the number.
- Integers are stored in computers in the form of two's complement. In this representation, the computer can treat the addition of positive and negative numbers uniformly, without the need for special hardware circuits for subtraction, and there is no ambiguity of positive and negative zero.
- The encoding of floating-point numbers consists of 1 sign bit, 8 exponent bits, and 23 fraction bits. Due to the presence of the exponent bit, the range of floating-point numbers is much greater than that of integers, but at the cost of sacrificing precision.
- ASCII is the earliest English character set, 1 byte in length, and includes 127 characters. The GBK character set is a commonly used Chinese character set, including more than 20,000 Chinese characters. Unicode strives to provide a complete character set standard, including characters from various languages worldwide, thus solving the problem of garbled characters caused by inconsistent character encoding methods.
- UTF-8 is the most popular Unicode encoding method, with excellent universality. It is a variable-length encoding method with good scalability and effectively improves the efficiency of space usage. UTF-16 and UTF-32 are fixed-length encoding methods. When encoding Chinese characters, UTF-16 occupies less space than UTF-8. Programming languages like Java and C# use UTF-16 encoding by default.

### Q & A

**Q**: Why does a hash table contain both linear and non-linear data structures?

The underlying structure of a hash table is an array. To resolve hash collisions, we may use "chaining": each bucket in the array points to a linked list, which, when exceeding a certain threshold, might be transformed into a tree (usually a red-black tree).
From a storage perspective, the foundation of a hash table is an array, where each bucket slot might contain a value, a linked list, or a tree. Therefore, hash tables may contain both linear data structures (arrays, linked lists) and non-linear data structures (trees).

**Q**: Is the length of the `char` type 1 byte?

The length of the `char` type is determined by the encoding method used by the programming language. For example, Java, JavaScript, TypeScript, and C# all use UTF-16 encoding (to save Unicode code points), so the length of the char type is 2 bytes.

**Q**: Is there ambiguity in calling data structures based on arrays "static data structures"? Because operations like push and pop on stacks are "dynamic".

While stacks indeed allow for dynamic data operations, the data structure itself remains "static" (with unchangeable length). Even though data structures based on arrays can dynamically add or remove elements, their capacity is fixed. If the data volume exceeds the pre-allocated size, a new, larger array needs to be created, and the contents of the old array copied into it.

**Q**: When building stacks (queues) without specifying their size, why are they considered "static data structures"?

In high-level programming languages, we don't need to manually specify the initial capacity of stacks (queues); this task is automatically handled internally by the class. For example, the initial capacity of Java's ArrayList is usually 10. Furthermore, the expansion operation is also implemented automatically. See the subsequent "List" chapter for details.
