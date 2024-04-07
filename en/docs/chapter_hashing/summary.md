# Summary

### Key review

- Given an input `key`, a hash table can retrieve the corresponding `value` in $O(1)$ time, which is highly efficient.
- Common hash table operations include querying, adding key-value pairs, deleting key-value pairs, and traversing the hash table.
- The hash function maps a `key` to an array index, allowing access to the corresponding bucket and retrieval of the `value`.
- Two different keys may end up with the same array index after hashing, leading to erroneous query results. This phenomenon is known as hash collision.
- The larger the capacity of the hash table, the lower the probability of hash collisions. Therefore, hash table resizing can mitigate hash collisions. Similar to array resizing, hash table resizing is costly.
- The load factor, defined as the number of elements divided by the number of buckets, reflects the severity of hash collisions and is often used as a condition to trigger hash table resizing.
- Chaining addresses hash collisions by converting each element into a linked list, storing all colliding elements in the same list. However, excessively long lists can reduce query efficiency, which can be improved by converting the lists into red-black trees.
- Open addressing handles hash collisions through multiple probes. Linear probing uses a fixed step size but it cannot delete elements and is prone to clustering. Multiple hashing uses several hash functions for probing which reduces clustering compared to linear probing but increases computational overhead.
- Different programming languages adopt various hash table implementations. For example, Java's `HashMap` uses chaining, while Python's `dict` employs open addressing.
- In hash tables, we desire hash algorithms with determinism, high efficiency, and uniform distribution. In cryptography, hash algorithms should also possess collision resistance and the avalanche effect.
- Hash algorithms typically use large prime numbers as moduli to ensure uniform distribution of hash values and reduce hash collisions.
- Common hash algorithms include MD5, SHA-1, SHA-2, and SHA-3. MD5 is often used for file integrity checks, while SHA-2 is commonly used in secure applications and protocols.
- Programming languages usually provide built-in hash algorithms for data types to calculate bucket indices in hash tables. Generally, only immutable objects are hashable.

### Q & A

**Q**: When does the time complexity of a hash table degrade to $O(n)$?

The time complexity of a hash table can degrade to $O(n)$ when hash collisions are severe. When the hash function is well-designed, the capacity is set appropriately, and collisions are evenly distributed, the time complexity is $O(1)$. We usually consider the time complexity to be $O(1)$ when using built-in hash tables in programming languages.

**Q**: Why not use the hash function $f(x) = x$? This would eliminate collisions.

Under the hash function $f(x) = x$, each element corresponds to a unique bucket index, which is equivalent to an array. However, the input space is usually much larger than the output space (array length), so the last step of a hash function is often to take the modulo of the array length. In other words, the goal of a hash table is to map a larger state space to a smaller one while providing $O(1)$ query efficiency.

**Q**: Why can hash tables be more efficient than arrays, linked lists, or binary trees, even though hash tables are implemented using these structures?

Firstly, hash tables have higher time efficiency but lower space efficiency. A significant portion of memory in hash tables remains unused.

Secondly, hash tables are only more time-efficient in specific use cases. If a feature can be implemented with the same time complexity using an array or a linked list, it's usually faster than using a hash table. This is because the computation of the hash function incurs overhead, making the constant factor in the time complexity larger.

Lastly, the time complexity of hash tables can degrade. For example, in chaining, we perform search operations in a linked list or red-black tree, which still risks degrading to $O(n)$ time.

**Q**: Does multiple hashing also have the flaw of not being able to delete elements directly? Can space marked as deleted be reused?

Multiple hashing is a form of open addressing, and all open addressing methods have the drawback of not being able to delete elements directly; they require marking elements as deleted. Marked spaces can be reused. When inserting new elements into the hash table, and the hash function points to a position marked as deleted, that position can be used by the new element. This maintains the probing sequence of the hash table while ensuring efficient use of space.

**Q**: Why do hash collisions occur during the search process in linear probing?

During the search process, the hash function points to the corresponding bucket and key-value pair. If the `key` doesn't match, it indicates a hash collision. Therefore, linear probing will search downwards at a predetermined step size until the correct key-value pair is found or the search fails.

**Q**: Why can resizing a hash table alleviate hash collisions?

The last step of a hash function often involves taking the modulo of the array length $n$, to keep the output within the array index range. When resizing, the array length $n$ changes, and the indices corresponding to the keys may also change. Keys that were previously mapped to the same bucket might be distributed across multiple buckets after resizing, thereby mitigating hash collisions.
