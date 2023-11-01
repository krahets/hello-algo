# Summary

### Highlights

- Input `key` , hash table can look up `value` in $O(1)$ time, which is very efficient.
- Common hash table operations include querying, adding key-value pairs, deleting key-value pairs, and traversing the hash table.
- The hash function maps `key` to an array index to access the corresponding bucket and get `value`.
- Two different `key` may be after the hash function to get the same array index, resulting in query results, this phenomenon is known as hash collision.
- The larger the hash table capacity, the lower the probability of hash collision. Therefore, hash collision can be mitigated by expanding the hash table. Similar to array expansion, hash table expansion operation has a high overhead.
- The load factor is defined as the number of elements in the hash table divided by the number of buckets, reflecting the severity of hash collision, and is often used as a condition to trigger the expansion of the hash table.
- Separate chaining addresses store all conflicting elements in the same chained list by converting individual elements into a linked list. However, a linked list that is too long reduces query efficiency, which can be further improved by converting the linked list into a red-black tree.
- Open addressing handles hash collisions by probing multiple times. Linear probing uses a fixed step size, the disadvantage is that it can not delete elements, and is prone to aggregation. Multiple hashing uses multiple hash functions for probing, compared to linear probing is less likely to produce aggregation, but multiple hash functions increase the amount of computation.
- Different programming languages take different implementations of hash tables. For example, Java's `HashMap` uses separate chaining of addresses, while Python's `Dict` uses open addressing.
- In hash table, we want the hash algorithm to be deterministic, efficient and uniformly distributed. In cryptography, the hashing algorithm should also be collision resistant and avalanche effect.
- Hashing algorithms usually use large prime numbers as moduli to maximize the even distribution of hash values and reduce hash collisions.
- Common hash algorithms include MD5, SHA-1, SHA-2, and SHA3, etc. MD5 is commonly used to verify file integrity, and SHA-2 is commonly used in security applications and protocols.
- Programming languages usually provide built-in hashing algorithms for data types to compute bucket indexes in hash tables. Typically, only immutable objects are hashable.

### Q & A

!!! question "Why is the time complexity of hash tables not $O(n)$ ?"

    When hash collision is more severe, the time complexity of the hash table degrades to $O(n)$ . When the hash function is well designed, the capacity is set reasonably, and hash collision is more even, the time complexity is $O(1)$ . When we use a programming language's built-in hash table, we usually consider the time complexity to be $O(1)$ .

!!! question "Why not use the hash function $f(x) = x$? That way there is no conflict"

    Under the $f(x) = x$ hash function, each element corresponds to a unique bucket index, which is equivalent to an array. However, the input space is usually much larger than the output space (the length of the array), so the final step of a hash function is often to model the length of the array. In other words, the goal of hash tables is to map a larger state space to a smaller one and provide $O(1)$ query efficiency.

!!! Question "The underlying implementations of hash tables are arrays, linked lists, and binary trees, but why can they be more efficient than them?"

    First, hash tables become more time efficient, but less space efficient. A significant portion of the hash table's memory is unused, the
   
    Second, it just becomes more time efficient in specific usage scenarios. If a function can be implemented using arrays or linked lists with the same time complexity, it is usually faster than a hash table. This is because hash functions require overhead to compute and have a larger constant term for time complexity.
   
    Finally, the time complexity of hash tables may deteriorate. For example, in separate chaining, we take to perform a lookup operation in a linked list or a red-black tree and still run the risk of degrading to $O(n)$ time.

!!! Question "Does multiple hashing have the flaw of not being able to delete elements directly? For marking a deleted space, can this space be used again?"

    Multiple hashes are a type of open addressing, and all open addressing methods have the drawback of not being able to delete elements directly; they need to be deleted by marking them. Marked as deleted space can be used again. When a new element is inserted into the hash table, and the location marked as deleted is found through the hash function, the location can be used by the new element. This keeps the probe sequence of the hash table unchanged and ensures the space utilization of the hash table.

!!! question "Why does hash collision occur when looking up elements in linear probing?"

    Find the corresponding bucket and key-value pairs through the hash function, found that the `key` does not match, which means that there is a hash collision. Therefore, the linear probing method will be based on a pre-set step down the search, until the correct key-value pairs found or can not be found to jump out until.

!!! question "Why does hash table expansion mitigate hash collisions?"

    The last step of the hash function is often the length of the array $n$ to take the remainder, so that the output value falls into the array index range; after the expansion, the length of the array $n$ changed, and the index corresponding to the `key` may also change. Multiple `key` that originally fell into the same bucket may be assigned to multiple buckets after expansion, thus realizing hash collision mitigation.
