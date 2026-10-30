# Summary

### Key takeaways

- Data structures can be classified by logical and physical structure. Logical structure describes relationships between data elements, while physical structure describes how data is stored in memory.
- Common logical structures are linear, tree, and network structures. We usually classify data structures as linear (arrays, linked lists, stacks, queues) or nonlinear (trees, graphs, heaps). A hash table implementation may contain both linear and nonlinear structures.
- During execution, data resides in computer memory. Each location has a memory address, which programs use to access its data.
- The two main physical structures are contiguous storage (arrays) and scattered storage (linked lists). All data structures are implemented using arrays, linked lists, or both.
- Basic data types include integers (`byte`, `short`, `int`, `long`), floating-point numbers (`float`, `double`), characters (`char`), and Booleans (`bool`). Their value ranges depend on storage size and representation.
- Sign-magnitude, one's complement, and two's complement are three ways to encode numbers, and can be converted into one another. In sign-magnitude representation, the highest bit is the sign and the remaining bits give the magnitude.
- Integers are stored in two's complement. This lets the computer handle positive and negative addition uniformly, avoids separate hardware circuitry for subtraction, and eliminates the ambiguity of positive and negative zero.
- A floating-point encoding consists of 1 sign bit, 8 exponent bits, and 23 fraction bits. The exponent provides a much wider range than integers, at the cost of precision.
- ASCII was the earliest English character set. It uses 1 byte and contains 128 characters. GBK is a common Chinese character set with over 20,000 Chinese characters. Unicode aims to provide a comprehensive character standard for the world's languages, avoiding garbled text caused by incompatible encodings.
- UTF-8 is the most popular Unicode encoding and is widely compatible. Its variable length makes it extensible and space-efficient. UTF-16 and UTF-32 use fixed lengths. For Chinese text, UTF-16 uses less space than UTF-8. Languages such as Java and C# use UTF-16 by default.

### Q & A

**Q**: Why can a hash table contain both linear and nonlinear data structures?

A hash table is built on an array. To handle hash collisions, it may use separate chaining, discussed later in the Hash collisions section: each array bucket points to a linked list, which may be converted to a tree (usually a red-black tree) if it grows beyond a threshold.

From a storage perspective, each bucket in the underlying array may contain a value, a linked list, or a tree. A hash table may therefore contain both linear structures (arrays and linked lists) and nonlinear structures (trees).

**Q**: Does `char` occupy 1 byte?

The size of `char` depends on the programming language's encoding. For example, Java, JavaScript, TypeScript, and C# use UTF-16 to store Unicode code points, so their `char` type occupies 2 bytes.

**Q**: Is calling array-based structures static misleading? A stack supports dynamic operations such as pushing and popping.

A stack does support dynamic data operations, but its underlying structure remains static in length. Although array-based structures can add and remove elements dynamically, their capacity is fixed. When the data exceeds the allocated capacity, a larger array must be created and the old contents copied into it.

**Q**: When we create a stack or queue without specifying its size, why is it still called a static data structure?

In high-level languages, the class automatically chooses an initial capacity for a stack or queue. For example, Java's `ArrayList` typically starts with a capacity of 10. Resizing is also automatic; see the later section on lists.

**Q**: Converting sign-magnitude to two's complement uses "invert, then add 1". Its inverse should be "subtract 1, then invert", so why does "invert, then add 1" also work in the reverse direction?

These conversions are really computations of a complement. If $a + b = c$, we call $a$ the complement of $b$ with respect to $c$, and conversely $b$ the complement of $a$ with respect to $c$.

Consider the $n = 4$-bit binary number $0010$. Treating it as sign-magnitude and disregarding the sign bit, we obtain its two's complement by inverting and adding 1:

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

The two representations sum to $0010 + 1110 = 10000$. Thus, $1110$ is the complement of $0010$ with respect to $10000$. **The "invert, then add 1" operation computes the complement with respect to $10000$**.

What is the complement of $1110$ with respect to $10000$? We can again invert and add 1:

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

The two representations are complements of each other with respect to $10000$, so conversion in either direction can use the same operation: invert, then add 1.

Of course, we can also recover the sign-magnitude form of $1110$ by the inverse operation: subtract 1, then invert.

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

Both "invert, then add 1" and "subtract 1, then invert" compute the complement with respect to $10000$, so they are equivalent.

In essence, inverting computes the complement with respect to $1111$, since `sign-magnitude + one's complement = 1111`. Adding 1 to the one's complement then gives the complement with respect to $10000$.

The example uses $n = 4$, but the reasoning extends to binary numbers of any bit width.
