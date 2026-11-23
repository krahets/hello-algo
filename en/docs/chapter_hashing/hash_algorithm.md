# Hash algorithms

The previous two sections explained how hash tables work and how collisions are resolved. Whether we use open addressing or separate chaining, **these techniques keep the table working when collisions occur, but do not reduce how often collisions happen**.

Frequent collisions can severely degrade performance. In the separate-chaining table shown below, the ideal case distributes pairs evenly among buckets for the best lookup efficiency. In the worst case, all pairs occupy the same bucket, degrading the time complexity to $O(n)$.

![Best and worst cases for hash collisions](hash_algorithm.assets/hash_collision_best_worst_condition.svg)

**The hash function determines how key-value pairs are distributed**. Recall its two steps: calculate a hash value, then take it modulo the array length:

```shell
index = hash(key) % capacity
```

For a fixed `capacity`, **the hash algorithm `hash()` determines the output**, and therefore the distribution of pairs in the table.

To lower the likelihood of collisions, we should therefore focus on designing `hash()`.

## Goals of a hash algorithm

To build a hash table that is both fast and reliable, its hash algorithm should have these properties.

- **Determinism**: The same input must always produce the same output, ensuring reliable lookup.
- **Efficiency**: Calculating a hash should be fast. Lower computational overhead makes the table more practical.
- **Uniform distribution**: The algorithm should distribute pairs evenly across the table. More uniform distribution means fewer collisions.

Hash algorithms also have many applications beyond hash tables.

- **Password storage**: To protect passwords, systems usually store password hashes rather than plaintext passwords. When a user enters a password, the system hashes it and compares the result with the stored hash. A match means the password is accepted.
- **Data-integrity checking**: A sender can calculate a hash of the data and send it alongside the data. The receiver recomputes the hash and compares it with the received hash. A match indicates that the data is intact.

Cryptographic applications require stronger security properties to prevent reverse engineering, such as recovering an original password from its hash.

- **One-wayness**: The hash should not reveal any information about the input data.
- **Collision resistance**: Finding two different inputs with the same hash should be extremely difficult.
- **Avalanche effect**: A small input change should produce a large, unpredictable output change.

**Uniform distribution and collision resistance are independent concepts**. Uniform output does not guarantee collision resistance. For example, with random keys, `key % 100` can produce uniform outputs. But this algorithm is too simple: all keys with the same last two digits give the same output. It is therefore easy to infer a usable key from a hash and crack a password.

## Designing a hash algorithm

Designing a hash algorithm is complex and involves many factors. For less demanding uses, however, we can devise simple algorithms.

- **Additive hashing**: Add the ASCII codes of all input characters and use the sum as the hash.
- **Multiplicative hashing**: Use multiplication to mix values, multiplying by a constant each round and accumulating character ASCII codes into the hash.
- **XOR hashing**: Accumulate each input element into a hash using exclusive OR.
- **Rotational hashing**: Accumulate each character's ASCII code into a hash, rotating the hash before each accumulation.

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

Each algorithm ends by taking the result modulo the large prime $1000000007$ to keep it within a suitable range. Why emphasize a prime modulus? What goes wrong with a composite modulus? This is an interesting question.

The conclusion is that **using a large prime modulus helps make hash values as uniformly distributed as possible**. Because a prime shares no nontrivial factors with other numbers, it reduces periodic patterns introduced by the modulo operation and thus avoids collisions.

For example, choose the composite modulus $9$, which is divisible by $3$. Every key divisible by $3$ then maps to one of just three hash values: $0$, $3$, or $6$.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

If the input keys follow this arithmetic progression, the hash values cluster, increasing collisions. Now replace the modulus with the prime $13$. With no common factor between the key pattern and the modulus, the output becomes noticeably more uniform.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

If the keys are already uniformly random, either a prime or a composite modulus can produce uniformly distributed hashes. When the keys have a periodic pattern, however, a composite modulus is more likely to cause clustering.

We therefore usually choose a prime modulus, preferably a large one, to suppress periodic patterns as much as possible and make the algorithm more robust.

## Common hash algorithms

The simple algorithms above are fragile and fall well short of our design goals. Addition and XOR are commutative, for example, so additive and XOR hashing cannot distinguish strings containing the same characters in different orders. This can increase collisions and create security problems.

In practice, standard algorithms such as MD5, SHA-1, SHA-2, and SHA-3 are commonly used. They map inputs of arbitrary length to fixed-length hash values.

Over nearly a century, hash algorithms have continually evolved. Some researchers work to improve their performance, while others, along with hackers, search for security weaknesses. The table below lists commonly used algorithms.

- MD5 and SHA-1 have been successfully attacked repeatedly and have been retired from security applications.
- SHA-256, part of the SHA-2 family, is among the most secure hash algorithms. No successful attack has been reported, so it is widely used in security applications and protocols.
- SHA-3 has lower implementation overhead and higher computational efficiency than SHA-2, but is not yet as widely used.

<p align="center"> Table <id> &nbsp; Common hash algorithms </p>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| Introduced | 1992                           | 1995             | 2002                         | 2008                |
| Output length | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| Hash collisions | More frequent                           | More frequent             | Rare                         | Rare                |
| Security | Low; successfully attacked               | Low; successfully attacked | High                           | High                  |
| Applications     | Deprecated; still used for integrity checks | Deprecated         | Cryptocurrency transaction verification, digital signatures, and more | Can replace SHA-2    |

## Hash values of data structures

Hash-table keys can be integers, floating-point numbers, strings, and other types. Programming languages usually provide built-in hashing for these types to calculate bucket indices. In Python, for example, `hash()` calculates hash values for various types.

- Integers and Booleans have hash values equal to their own values.
- Hashing floating-point numbers and strings is more complex; interested readers can explore the details.
- A tuple's hash combines the hashes of its individual elements into one value.
- An object's hash is based on its memory address. Overriding its hash method allows hashing by content instead.

!!! tip

    Built-in hash functions differ in their definitions and implementations across programming languages.

```snippet
builtin_hash
```

??? pythontutor "Visualize execution"

    @tutor builtin_hash_tutor

In many programming languages, **only immutable objects can serve as hash-table keys**. If a list, a dynamic array, were used as a key, changing its contents would change its hash, making the original value impossible to retrieve from the table.

Custom objects, such as linked-list nodes, can be hashable even though their member variables are mutable. **Their hash is usually based on their memory address**, which stays the same even when their contents change.

You may notice different hash values when running the program in different consoles. **Each time the Python interpreter starts, it adds a random salt to its string hash function**. This helps prevent HashDoS attacks and improves security.
