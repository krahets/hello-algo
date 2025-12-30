# Summary

### Key Review

- Data structures can be classified from two perspectives: logical structure and physical structure. Logical structure describes the logical relationships between data elements, while physical structure describes how data is stored in computer memory.
- Common logical structures include linear, tree, and network structures. We typically classify data structures as linear (arrays, linked lists, stacks, queues) and non-linear (trees, graphs, heaps) based on their logical structure. The implementation of hash tables may involve both linear and non-linear data structures.
- When a program runs, data is stored in computer memory. Each memory space has a corresponding memory address, and the program accesses data through these memory addresses.
- Physical structures are primarily divided into contiguous space storage (arrays) and dispersed space storage (linked lists). All data structures are implemented using arrays, linked lists, or a combination of both.
- Basic data types in computers include integers `byte`, `short`, `int`, `long`, floating-point numbers `float`, `double`, characters `char`, and booleans `bool`. Their value ranges depend on the size of space they occupy and their representation method.
- Sign-magnitude, 1's complement, and 2's complement are three methods for encoding numbers in computers, and they can be converted into each other. The most significant bit of sign-magnitude is the sign bit, and the remaining bits represent the value of the number.
- Integers are stored in computers in 2's complement form. Under 2's complement representation, computers can treat the addition of positive and negative numbers uniformly, without needing to design special hardware circuits for subtraction, and there is no ambiguity of positive and negative zero.
- The encoding of floating-point numbers consists of 1 sign bit, 8 exponent bits, and 23 fraction bits. Due to the exponent bits, the range of floating-point numbers is much larger than that of integers, at the cost of sacrificing precision.
- ASCII is the earliest English character set, with a length of 1 byte, containing a total of 127 characters. GBK is a commonly used Chinese character set, containing over 20,000 Chinese characters. Unicode is committed to providing a complete character set standard, collecting characters from various languages around the world, thereby solving the garbled text problem caused by inconsistent character encoding methods.
- UTF-8 is the most popular Unicode encoding method, with excellent universality. It is a variable-length encoding method with good scalability, effectively improving storage space efficiency. UTF-16 and UTF-32 are fixed-length encoding methods. When encoding Chinese characters, UTF-16 occupies less space than UTF-8. Programming languages such as Java and C# use UTF-16 encoding by default.

### Q & A

**Q**: Why do hash tables contain both linear and non-linear data structures?

The underlying structure of a hash table is an array. To resolve hash collisions, we may use "chaining" (discussed in the subsequent "Hash Collision" section): each bucket in the array points to a linked list, which may be converted to a tree (usually a red-black tree) when the list length exceeds a certain threshold.

From a storage perspective, the underlying structure of a hash table is an array, where each bucket slot may contain a value, a linked list, or a tree. Therefore, hash tables may contain both linear data structures (arrays, linked lists) and non-linear data structures (trees).

**Q**: Is the length of the `char` type 1 byte?

The length of the `char` type is determined by the encoding method used by the programming language. For example, Java, JavaScript, TypeScript, and C# all use UTF-16 encoding (to store Unicode code points), so the `char` type has a length of 2 bytes.

**Q**: Is there ambiguity in referring to array-based data structures as "static data structures"? Stacks can also perform "dynamic" operations such as push and pop.

Stacks can indeed implement dynamic data operations, but the data structure is still "static" (fixed length). Although array-based data structures can dynamically add or remove elements, their capacity is fixed. If the data volume exceeds the pre-allocated size, a new larger array needs to be created, and the contents of the old array must be copied to the new array.

**Q**: When constructing a stack (queue), its size is not specified. Why are they "static data structures"?

In high-level programming languages, we do not need to manually specify the initial capacity of a stack (queue); this work is automatically completed within the class. For example, the initial capacity of Java's `ArrayList` is typically 10. Additionally, the expansion operation is also automatically implemented. See the subsequent "List" section for details.

**Q**: The method of converting sign-magnitude to 2's complement is "first negate then add 1". So converting 2's complement to sign-magnitude should be the inverse operation "first subtract 1 then negate". However, 2's complement can also be converted to sign-magnitude through "first negate then add 1". Why is this?

This is because the mutual conversion between sign-magnitude and 2's complement is actually the process of computing the "complement". Let us first define the complement: assuming $a + b = c$, then we say that $a$ is the complement of $b$ to $c$, and conversely, $b$ is the complement of $a$ to $c$.

Given an $n = 4$ bit binary number $0010$, if we treat this number as sign-magnitude (ignoring the sign bit), then its 2's complement can be obtained through "first negate then add 1":

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

We find that the sum of sign-magnitude and 2's complement is $0010 + 1110 = 10000$, which means the 2's complement $1110$ is the "complement" of sign-magnitude $0010$ to $10000$. **This means the above "first negate then add 1" is actually the process of computing the complement to $10000$**.

So, what is the "complement" of 2's complement $1110$ to $10000$? We can still use "first negate then add 1" to obtain it:

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

In other words, sign-magnitude and 2's complement are each other's "complement" to $10000$, so "sign-magnitude to 2's complement" and "2's complement to sign-magnitude" can be implemented using the same operation (first negate then add 1).

Of course, we can also use the inverse operation to find the sign-magnitude of 2's complement $1110$, that is, "first subtract 1 then negate":

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

In summary, both "first negate then add 1" and "first subtract 1 then negate" are computing the complement to $10000$, and they are equivalent.

Essentially, the "negate" operation is actually finding the complement to $1111$ (because `sign-magnitude + 1's complement = 1111` always holds); and adding 1 to the 1's complement yields the 2's complement, which is the complement to $10000$.

The above uses $n = 4$ as an example, and it can be generalized to binary numbers of any number of bits.
