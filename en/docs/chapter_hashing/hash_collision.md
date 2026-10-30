# Hash collisions

As discussed in the previous section, **a hash function's input space is usually much larger than its output space**, so collisions are theoretically unavoidable. For example, if the input space is all integers and the output space is limited to the array's capacity, multiple integers must map to the same bucket index.

Hash collisions can produce incorrect lookup results and make a hash table unusable. One solution is to expand the table whenever a collision occurs until the collision disappears. This simple, brute-force approach works, but is inefficient because expansion requires substantial data movement and hash computation. We can improve efficiency with the following strategies.

1. Improve the data structure **so that it works correctly even when collisions occur**.
2. Expand only when necessary, when collisions become sufficiently frequent.

The main structural approaches are “separate chaining” and “open addressing.”

## Separate chaining

In the original hash table, each bucket holds only one key-value pair. <u>Separate chaining</u> replaces this single element with a linked list. Each pair becomes a node, and all colliding pairs are stored in the same list. An example is shown below.

![A hash table using separate chaining](hash_collision.assets/hash_table_chaining.png)

The operations change as follows.

- **Lookup**: Hash the input `key` to obtain a bucket index, access the list's head, and traverse the list comparing keys to find the target pair.
- **Insertion**: Use the hash function to access the list's head, then add the node containing the key-value pair to the list.
- **Deletion**: Use the hash function to locate the list, traverse it to find the target node, and remove that node.

Separate chaining has the following limitations.

- **More space**: Linked lists store node pointers and consume more memory than arrays.
- **Slower lookup**: Finding an element requires a linear scan of the list.

The code below gives a simple implementation. Keep two points in mind.

- Lists, implemented as dynamic arrays, replace linked lists to simplify the code. The hash table is an array of buckets, each of which is a list.
- The implementation includes expansion: when the load factor exceeds $\frac{2}{3}$, the table's capacity is doubled to $2$ times its original size.

```src
[file]{hash_map_chaining}-[class]{hash_map_chaining}-[func]{}
```

When a list becomes long, its $O(n)$ lookup time is poor. **Replacing it with an AVL tree or red-black tree** improves lookup time to $O(\log n)$.

## Open addressing

<u>Open addressing</u> handles collisions by probing multiple locations without introducing another data structure. Common strategies include linear probing, quadratic probing, and multiple hashing.

We use linear probing to explain how an open-addressing hash table works.

### Linear probing

Linear probing searches with a fixed step size. Its operations differ from those of a basic hash table.

- **Insertion**: Calculate the bucket index using the hash function. If the bucket is occupied, scan forward from that position with a fixed step size, usually $1$, until an empty bucket is found, then insert the element.
- **Lookup**: If a collision is encountered, scan forward with the same step size until the target is found, then return its `value`. An empty bucket means the target is absent, so return `None`.

The figure below shows key-value pairs in an open-addressing table using linear probing. With this hash function, keys sharing the same last two digits map to the same bucket. Linear probing stores them successively in that bucket and the following buckets.

![Distribution of key-value pairs with linear probing](hash_collision.assets/hash_table_linear_probing.png)

However, **linear probing is prone to clustering**. The longer a run of occupied positions becomes, the more likely a collision is to occur within it, causing the cluster to grow further. This feedback loop eventually degrades insertion, deletion, lookup, and update performance.

**We cannot simply delete an element from an open-addressing table**. Deletion would leave an empty bucket, `None`. A lookup stops when linear probing reaches such a bucket, making later elements in the probe sequence inaccessible and potentially reporting them as absent, as shown below.

![Lookup problems caused by deletion in open addressing](hash_collision.assets/hash_table_open_addressing_deletion.png)

To solve this, use <u>lazy deletion</u>: rather than simply removing the entry, **mark its bucket with the constant `TOMBSTONE`**. Both `None` and `TOMBSTONE` represent available buckets that can hold a new pair. Unlike `None`, however, a `TOMBSTONE` does not stop a search, because further pairs may lie beyond it.

However, **lazy deletion can accelerate performance degradation**. Each deletion leaves a marker. As `TOMBSTONE` entries accumulate, searches may need to skip many of them before reaching the target, increasing search time.

To address this, record the first `TOMBSTONE` encountered during probing and swap the target entry with it when found. On each lookup or insertion, this moves the entry closer to its ideal location—the start of the probe sequence—and improves lookup efficiency.

The code below implements linear probing with lazy deletion. To use the table's space more fully, treat the array as circular: after reaching the end, wrap around to the beginning.

```src
[file]{hash_map_open_addressing}-[class]{hash_map_open_addressing}-[func]{}
```

### Quadratic probing

Like linear probing, quadratic probing is a common open-addressing strategy. On a collision, it probes at distances determined by the square of the probe number—$1, 4, 9, \dots$—rather than a fixed step size.

Its main advantages are as follows.

- Squared probe distances aim to reduce the clustering caused by linear probing.
- Larger jumps help distribute entries more evenly while searching for empty positions.

However, quadratic probing is not perfect.

- Clustering still occurs: some positions are more likely to be occupied than others.
- The growing squared distances may prevent probing the entire table, so an empty bucket may remain unreachable.

### Multiple hashing

As its name suggests, multiple hashing probes using several hash functions, $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$.

- **Insertion**: If $f_1(x)$ produces a collision, try $f_2(x)$, and so on, inserting the element when an empty position is found.
- **Lookup**: Try the hash functions in the same order and return when the target is found. If an empty position is reached or all functions have been tried, the target is absent; return `None`.

Multiple hashing is less prone to clustering than linear probing, but computing several hash functions adds overhead.

!!! tip

    All open-addressing strategies—linear probing, quadratic probing, and multiple hashing—share the restriction that elements cannot simply be deleted.

## Choices made by programming languages

Programming languages use different hash-table implementations. Here are a few examples.

- Python uses open addressing. Its `dict` probes using pseudorandom values.
- Java uses separate chaining. Since JDK 1.8, when a `HashMap`'s underlying array has length at least 64 and a chain reaches length 8, the chain is converted to a red-black tree to improve lookup performance.
- Since Go 1.24, the built-in `map` uses open addressing based on Swiss Tables by default. Go 1.23 and earlier use separate chaining, with up to 8 key-value pairs per bucket and linked overflow buckets when that capacity is exceeded.
