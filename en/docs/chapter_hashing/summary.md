---
comments: true
---

# 6.4 &nbsp; Summary

### 1. &nbsp; Key takeaways

- Given a `key`, a hash table can retrieve its `value` in $O(1)$ time, making lookup highly efficient.
- Common operations include lookup, adding and deleting key-value pairs, and traversing the table.
- A hash function maps a `key` to an array index, allowing access to the corresponding bucket and its `value`.
- Two different keys may map to the same array index and cause incorrect lookup results. This is called a hash collision.
- A larger capacity lowers the likelihood of collisions, so expanding a hash table can alleviate them. Like array expansion, hash-table expansion is expensive.
- The load factor is the number of elements divided by the number of buckets. It indicates how crowded the table is and is commonly used to trigger expansion.
- Separate chaining replaces a single entry with a linked list and stores all colliding entries in that list. Long lists slow lookup; converting them to red-black trees can improve efficiency.
- Open addressing resolves collisions through repeated probing. Linear probing uses a fixed step size, is prone to clustering, and does not allow straightforward deletion. Multiple hashing uses several hash functions, reducing clustering but adding computational cost.
- Programming languages use different implementations: Java's `HashMap` uses separate chaining, while Python's `dict` uses open addressing.
- For hash tables, we want deterministic, efficient hashing with uniformly distributed outputs. Cryptographic hashing also requires collision resistance and an avalanche effect.
- Hash algorithms often use a large prime modulus to promote uniform hash values and reduce collisions.
- Common hash algorithms include MD5, SHA-1, SHA-2, and SHA-3. MD5 is often used for file-integrity checks, while SHA-2 is widely used in security applications and protocols.
- Programming languages usually provide built-in hashing for data types to calculate bucket indices. In general, only immutable objects are hashable.

### 2. &nbsp; Q & A

**Q**: When does a hash table have $O(n)$ time complexity?

When collisions are severe, its time complexity degrades to $O(n)$. With a well-designed hash function, suitable capacity, and evenly distributed collisions, it is $O(1)$. We usually assume $O(1)$ time when using a language's built-in hash table.

**Q**: Why not use the hash function $f(x) = x$? Wouldn't that avoid collisions?

With $f(x) = x$, each element has a unique bucket index, making the structure equivalent to an array. But the input space is usually far larger than the output space, the array's length, so the final hashing step usually takes a remainder modulo that length. A hash table maps a larger state space into a smaller one while providing $O(1)$ lookup.

**Q**: Hash tables are implemented with arrays, linked lists, and binary trees. How can they be faster than those structures?

First, greater time efficiency comes at the cost of space efficiency: a significant portion of a hash table's memory is unused.

Second, the improvement applies only to particular operations. If an array or linked list can perform an operation with the same time complexity, it is usually faster because computing a hash adds overhead and increases the constant factor.

Finally, hash-table performance can degrade. For example, separate chaining searches within linked lists or red-black trees, and there is still a risk of degeneration to $O(n)$ time.

**Q**: Does multiple hashing also prevent direct deletion? Can a deleted slot be reused?

Multiple hashing is a form of open addressing, and all open-addressing methods require deletion markers rather than simply emptying a slot. A marked slot can be reused. When inserting a new element, if the hash functions locate such a slot, the new element can occupy it. This preserves the probe sequence while making effective use of space.

**Q**: Why can a collision occur during a lookup with linear probing?

The hash function leads to a bucket and a key-value pair, but the stored `key` may not match the requested one. That indicates a collision. Linear probing then continues with its predefined step size until it finds the correct pair or determines that none exists.

**Q**: Why does expanding a hash table reduce collisions?

The final hashing step often takes the remainder modulo the array length $n$ to produce a valid index. After expansion, $n$ changes, so the index of a given `key` may change too. Keys that previously shared a bucket may be redistributed among several buckets, reducing collisions.

**Q**: If fast access is the goal, why not just use an array?

When keys are consecutive integers in a small range, an array is simple and efficient. But for other key types, such as strings, we need a hash function to map keys to array indices and a bucket array to store entries. That structure is a hash table.
