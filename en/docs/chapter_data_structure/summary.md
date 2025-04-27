# Summary

### Key review

- Data structures can be categorized from two perspectives: logical structure and physical structure. Logical structure describes the logical relationships between data, while physical structure describes how data is stored in memory.
- Frequently used logical structures include linear structures, trees, and networks. We usually divide data structures into linear (arrays, linked lists, stacks, queues) and non-linear (trees, graphs, heaps) based on their logical structure. The implementation of hash tables may involve both linear and non-linear data structures.
- When a program is running, data is stored in memory. Each memory space has a corresponding address, and the program accesses data through these addresses.
- Physical structures can be divided into continuous space storage (arrays) and discrete space storage (linked lists). All data structures are implemented using arrays, linked lists, or a combination of both.
- The basic data types in computers include integers (`byte`, `short`, `int`, `long`), floating-point numbers (`float`, `double`), characters (`char`), and booleans (`bool`). The value range of a data type depends on its size and representation.
- Sign-magnitude, 1's complement, 2's complement are three methods of encoding integers in computers, and they can be converted into each other. The most significant bit of the sign-magnitude is the sign bit, and the remaining bits represent the value of the number.
- Integers are encoded by 2's complement in computers. The benefits of this representation include (i) the computer can unify the addition of positive and negative integers, (ii) no need to design special hardware circuits for subtraction, and (iii) no ambiguity of positive and negative zero.
- The encoding of floating-point numbers consists of 1 sign bit, 8 exponent bits, and 23 fraction bits. Due to the exponent bit, the range of floating-point numbers is much greater than that of integers, but at the cost of precision.
- ASCII is the earliest English character set, with 1 byte in length and a total of 127 characters. GBK is a popular Chinese character set, which includes more than 20,000 Chinese characters. Unicode aims to provide a complete character set standard that includes characters from various languages in the world, thus solving the garbled character problem caused by inconsistent character encoding methods.
- UTF-8 is the most popular and general Unicode encoding method. It is a variable-length encoding method with good scalability and space efficiency. UTF-16 and UTF-32 are fixed-length encoding methods. When encoding Chinese characters, UTF-16 takes up less space than UTF-8. Programming languages like Java and C# use UTF-16 encoding by default.

### Q & A

**Q**: Why does a hash table contain both linear and non-linear data structures?

The underlying structure of a hash table is an array. To resolve hash collisions, we may use "chaining" (discussed in a later section, "Hash collision"): each bucket in the array points to a linked list, which may transform into a tree (usually a red-black tree) when its length is larger than a certain threshold.
From a storage perspective, the underlying structure of a hash table is an array, where each bucket might contain a value, a linked list, or a tree. Therefore, hash tables may contain both linear data structures (arrays, linked lists) and non-linear data structures (trees).

**Q**: Is the length of the `char` type 1 byte?

The length of the `char` type is determined by the encoding method of the programming language. For example, Java, JavaScript, TypeScript, and C# all use UTF-16 encoding (to save Unicode code points), so the length of the `char` type is 2 bytes.

**Q**: Is there any ambiguity when we refer to array-based data structures as "static data structures"? The stack can also perform "dynamic" operations such as popping and pushing.

The stack can implement dynamic data operations, but the data structure is still "static" (the length is fixed). Although array-based data structures can dynamically add or remove elements, their capacity is fixed. If the stack size exceeds the pre-allocated size, then the old array will be copied into a newly created and larger array.

**Q**: When building a stack (queue), its size is not specified, so why are they "static data structures"?

In high-level programming languages, we do not need to manually specify the initial capacity of stacks (queues); this task is automatically completed within the class. For example, the initial capacity of Java's `ArrayList` is usually 10. Furthermore, the expansion operation is also completed automatically. See the subsequent "List" chapter for details.

**Q**：The method of converting the sign-magnitude to the 2's complement is "first negate and then add 1", so converting the 2's complement to the sign-magnitude should be its inverse operation "first subtract 1 and then negate".
However, the 2's complement can also be converted to the sign-magnitude through "first negate and then add 1", why is this?

**A**：This is because the mutual conversion between the sign-magnitude and the 2's complement is equivalent to computing the "complement". We first define the complement: assuming $a + b = c$, then we say that $a$ is the complement of $b$ to $c$, and vice versa, $b$ is the complement of $a$ to $c$.

Given a binary number $0010$ with length $n = 4$, if this number is the sign-magnitude (ignoring the sign bit), then its 2's complement can be obtained by "first negating and then adding 1":

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

Observe that the sum of the sign-magnitude and the 2's complement is $0010 + 1110 = 10000$, i.e., the 2's complement $1110$ is the "complement" of the sign-magnitude $0010$ to $10000$. **This means that the above "first negate and then add 1" is equivalent to computing the complement to $10000$**.

So, what is the "complement" of $1110$ to $10000$? We can still compute it by "negating first and then adding 1":

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

In other words, the sign-magnitude and the 2's complement are each other's "complement" to $10000$, so "sign-magnitude to 2's complement" and "2's complement to sign-magnitude" can be implemented with the same operation (first negate and then add 1).

Of course, we can also use the inverse operation of "first negate and then add 1" to find the sign-magnitude of the 2's complement $1110$, that is, "first subtract 1 and then negate":

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

To sum up, "first negate and then add 1" and "first subtract 1 and then negate" are both computing the complement to $10000$, and they are equivalent.

Essentially, the "negate" operation is actually to find the complement to $1111$ (because `sign-magnitude + 1's complement = 1111` always holds); and the 1's complement plus 1 is equal to the 2's complement to $10000$.

We take $n = 4$ as an example in the above, and it can be generalized to any binary number with any number of digits.