---
comments: true
---

# 6.4 &nbsp; Summary

### 1. &nbsp; Key takeaways

- Given a `key`, a hash table can look up its `value` in $O(1)$ time, making lookups highly efficient.
- Common hash table operations include looking up values, inserting and removing key-value pairs, and iterating over the table.
- The hash function maps `key` to an array index so we can access the corresponding bucket and retrieve `value`.
- Two different inputs for `key` may hash to the same array index, which can give an incorrect lookup result. This is called a hash collision.
- A larger hash table makes collisions less likely, so expanding a table can help reduce collisions. As with growing an array, expanding a hash table is expensive.
- The load factor is the number of elements divided by the number of buckets. It indicates how severe collisions are likely to be and often determines when the table grows.
- With chaining, a linked list replaces a single entry and holds all the elements that collide in its bucket. Long lists slow down lookups. Replacing a long list with a red-black tree can improve performance.
- Open addressing handles collisions by probing multiple positions. Linear probing uses a fixed step size, makes it unsafe to simply clear a deleted entry, and is prone to clustering. Probing with multiple hash functions is less prone to clustering, but computing the extra hashes takes more work.
- Hash table implementations vary across programming languages. For example, Java’s `HashMap` uses chaining, while Python’s `dict` uses open addressing.
- For hash tables, we want deterministic, efficient hash algorithms that distribute values evenly. In cryptography, a hash algorithm should also provide collision resistance and exhibit the avalanche effect.
- Hash algorithms often use a large prime modulus to distribute hash values as evenly as possible and reduce collisions.
- Common hash algorithms include MD5, SHA-1, SHA-2, and SHA-3. MD5 is often used to check file integrity, and SHA-2 is widely used in security applications and protocols.
- Programming languages typically provide built-in hash algorithms for data types so hash tables can compute bucket indices. As a general rule, only immutable objects are hashable.

### 2. &nbsp; Q & A

**Q**: When do hash table operations take $O(n)$ time?

When collisions become severe, operations can degrade to $O(n)$ time. With a well-designed hash function, suitable capacity, and collisions spread evenly across buckets, operations take $O(1)$ time. We generally assume $O(1)$ time when using a language’s built-in hash table.

**Q**: Why not use $f(x) = x$ as the hash function? Wouldn’t that eliminate collisions?

With $f(x) = x$, each element corresponds to a unique bucket index, which is equivalent to using an array. However, the input space is typically much larger than the output space (the array length), so the final step of a hash function often takes the remainder modulo the array length. A hash table aims to map a large space of possible inputs into a smaller space while providing $O(1)$ lookup.

**Q**: If hash tables are built from arrays, linked lists, and binary trees, how can they be faster than those structures?

First, a hash table trades space for speed. A considerable part of its allocated memory goes unused.

Second, the speed advantage depends on the task. If an array or linked list can perform the same operation with the same time complexity, it is usually faster. Computing the hash adds overhead, giving the hash table a larger constant factor.

Finally, hash table performance can degrade. For example, chaining requires searching a linked list or a red-black tree, and there is still a risk of lookup taking $O(n)$ time.

**Q**: Does probing with multiple hash functions also prevent us from simply clearing a deleted slot? Can a slot marked as deleted be reused?

Probing with multiple hash functions is a form of open addressing. In all such methods, clearing a slot directly can break lookups, so deletions need markers. A marked slot can be reused. When inserting an element, if a hash function leads to a slot marked as deleted, the new element can occupy it. This preserves the probe sequence and makes effective use of the available space.

**Q**: Why can a lookup encounter a collision during linear probing?

The hash function leads to a bucket and its key-value pair. If the stored `key` does not match the key we are looking for, we have encountered a collision. Linear probing then moves forward by the preset step size until it finds the correct pair or reaches a stopping point without finding it.

**Q**: Why does expanding a hash table help reduce collisions?

The final step of a hash function often takes the remainder modulo the array length $n$ to keep the result within the range of array indices. Expanding the table changes the length $n$, so the index for a given `key` may change as well. Several `key` inputs that shared a bucket can now land in different buckets, reducing collisions.

**Q**: If we want efficient access, why not just use an array?

When `key` ranges over a small set of consecutive integers, using an array directly is simple and efficient. When `key` has another type, such as a string, a hash function must map `key` to an array index so the bucket array can store the elements. This structure is a hash table.
