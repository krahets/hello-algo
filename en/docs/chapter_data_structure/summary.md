# Summary

### Chapter review

- Data structures can be classified by logical or physical structure. Logical structure describes the relationships among data elements. Physical structure describes how the data is stored in computer memory.
- Common logical structures include sequences, trees, and networks. We usually group them into linear structures (arrays, linked lists, stacks, and queues) and nonlinear structures (trees, graphs, and heaps). A hash table implementation can combine linear and nonlinear structures.
- While a program runs, its data is stored in memory. Each memory location has an address, which the program uses to access the data there.
- The two main physical layouts are contiguous storage (arrays) and noncontiguous storage (linked lists). All data structures are implemented with arrays, linked lists, or both.
- Basic data types include the integer types `byte`, `short`, `int`, and `long`, the floating-point types `float` and `double`, the character type `char`, and the Boolean type `bool`. Their ranges depend on their sizes and representations.
- Sign and magnitude, ones' complement, and two's complement are three ways of encoding numbers, with rules for converting between them. In the sign-and-magnitude representation of an integer, the highest bit is the sign and the remaining bits give the magnitude.
- Computers store signed integers in two's complement form. This lets the same circuitry add positive and negative numbers without dedicated subtraction hardware or ambiguity between positive and negative zero.
- A single-precision floating-point encoding has a 1-bit sign, an 8-bit exponent, and a 23-bit fraction. The exponent gives it a far wider range than an integer of the same size, at the cost of precision.
- ASCII, the earliest English character set, contains 128 characters stored in 1 byte each. GBK is a common Chinese character set containing over 20,000 Chinese characters. Unicode aims to provide a comprehensive standard covering characters from languages around the world and to resolve garbled text caused by incompatible character encodings.
- UTF-8 is the most popular Unicode encoding and enjoys broad support. Its variable width makes it flexible and space-efficient. UTF-16 and UTF-32 use fixed-width code units. For Chinese text, UTF-16 can take less space than UTF-8. Languages such as Java and C# use UTF-16 by default.

### Q & A

**Q**: Why might a hash table use both linear and nonlinear data structures?

An array underlies a hash table. To resolve collisions, we can use separate chaining, described later in “Hash collisions.” Each array bucket points to a linked list. If the list grows beyond a threshold, it may be converted to a tree, usually a red-black tree.

In terms of storage, each bucket in the underlying array might hold a single value, a linked list, or a tree. Thus a hash table can combine linear data structures (arrays and linked lists) and nonlinear ones (trees).

**Q**: Is a `char` always 1 byte long?

The size of `char` depends on the encoding used by the language. Java, JavaScript, TypeScript, and C#, for example, use UTF-16 to represent Unicode code points, with a 2-byte unit for a `char` value.

**Q**: Isn't it ambiguous to call an array-backed structure “static”? A stack supports dynamic operations such as push and pop.

A stack does support dynamic operations on its data, but the underlying array is static in the sense that its length is fixed. An array-backed structure can add and remove elements dynamically within a fixed capacity. If the data outgrows the allocation, a larger array must be created and the original contents copied into it.

**Q**: If I don't specify a size when creating a stack or queue, why is it called a static data structure?

In high-level languages, you need not manually specify the initial capacity of a stack or queue. The class handles that internally. For example, Java's `ArrayList` typically starts with capacity 10. Growth is automatic as well, as discussed later in “Lists.”

**Q**: To convert sign and magnitude to two's complement, we invert bits and add 1. The inverse should be to subtract 1 and then invert. Why can we also convert back by inverting and adding 1 again?

The conversion works in both directions because it calculates a complement. Suppose $a + b = c$. Then $a$ is the complement of $b$ with respect to $c$. Conversely, $b$ is the complement of $a$ with respect to $c$.

Take the $n = 4$-bit binary number $0010$. Treat it as the original magnitude, disregarding the sign bit. To find its two's complement, invert the bits and add 1:

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

The original number and its two's complement add up as follows: $0010 + 1110 = 10000$. Thus $1110$ is the complement of $0010$ with respect to $10000$. **Inverting and adding 1 therefore computes the complement with respect to $10000$**.

What, then, is the complement of $1110$ with respect to $10000$? Again, inverting and adding 1 gives the answer:

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

In other words, the original number and its two's complement are each other's complements with respect to $10000$. This is why both conversions can use the same operation: invert the bits and add 1.

Of course, the inverse operation also recovers the original number from its two's complement $1110$: first subtract 1, then invert the bits.

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

Both procedures, “invert and add 1” and “subtract 1 and invert,” compute the complement with respect to $10000$ and are therefore equivalent.

Inverting the bits by itself gives the complement with respect to $1111$, because `original + ones' complement = 1111` always holds. Adding 1 to this bitwise complement then gives the complement with respect to $10000$.

The example uses $n = 4$, but the same reasoning applies to binary numbers of any width.
