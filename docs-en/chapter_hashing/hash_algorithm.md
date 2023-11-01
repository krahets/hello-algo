# Hash Algorithms

In the last two sections, we learned how hash tables work and how hash collisions are handled. However both open addressing and chain address method, **they can only ensure that hash table can work properly in case of conflict, but cannot reduce the occurrence of hash conflict**.

If hash collisions are too frequent, the performance of hash tables deteriorates dramatically. As shown in the figure below, for a chained address hash table, ideally key-value pairs are evenly distributed across buckets for optimal query efficiency; in the worst case all key-value pairs are stored in the same bucket, and the time complexity degrades to $O(n)$ .

![Best and worst case scenarios for hash collision](hash_algorithm.assets/hash_collision_best_worst_condition.png)

**The distribution of key-value pairs is determined by the hash function**. Recall that the hash function is computed by first computing the hash value and then modeling the length of the array:

```shell
index = hash(key) % capacity
```

Observe the above formula, when the hash table capacity `capacity` is fixed, **the hash algorithm `hash()` determines the output value** and thus the distribution of key-value pairs in the hash table.

This means that in order to reduce the probability of hash collisions, we should focus our attention on the design of the hash algorithm `hash()`.

## The Goal Of The Hash Algorithm

In order to realize a "fast and stable" hash table data structure, the hash algorithm should contain the following features.

- **Determinism**: for the same input, the hashing algorithm should always produce the same output. This ensures that the hash table is reliable.
- **Efficient**: the process of computing the hash should be fast enough. The smaller the computation overhead, the more useful the hash table is.
- **Uniform Distribution**: the hash algorithm should make the key-value pairs evenly distributed in the hash table. The more even the distribution, the lower the probability of hash collision.

In fact, hash algorithms can be used to implement hash tables in addition to a wide range of other areas.

- **Password storage**: to protect the security of user passwords, the system usually does not directly store the user's plaintext passwords, but stores the hash value of the passwords. When a user enters a password, the system calculates a hash value for the entered password and then compares it to the stored hash value. If the two match, then the password is considered correct.
- **Data Integrity Check**: the sender of the data can calculate the hash of the data and send it along; the receiver can recalculate the hash of the received data and compare it with the received hash. If the two match, then the data is considered complete.

For cryptography related applications, hash algorithms need to have a higher level of security features in order to prevent reverse engineering such as deriving the original password from the hash.

- **Unidirectionality**: it is not possible to invert any information about the input data through the hash value.
- **Collision resistance**: it should be extremely difficult to find two different inputs such that they have the same hash value.
- **Avalanche effect**: small changes in input should lead to significant and unpredictable changes in output.

Note that **"uniform distribution" and "collision resistance" are two separate concepts** satisfying uniform distribution does not necessarily satisfy collision resistance. For example, under random input `key`, hash function `key % 100` can produce uniformly distributed output. However, the hash algorithm is so simple that the output of all `key` with equal last two digits is the same, so we can easily invert the available `key` from the hash value to solve the password.

## Design Of Hash Algorithms

The design of hash algorithms is a complex problem that requires many considerations. However for some less demanding scenarios, we can also design some simple hash algorithms.

- **Additive Hash**: the ASCII codes of each character entered are added and the resulting sum is used as the hash value.
- **Multiplicative hashing**: exploits the irrelevance of multiplication by multiplying each round by a constant that accumulates the ASCII code of each character into a hash.
- **Dissimilar or Hash**: accumulates each element of the input data into a hash value by a dissimilar or operation.
- **Rotate Hash**: accumulates the ASCII code of each character into a hash, and rotates the hash before each accumulation.

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

Observe that the last step of each hashing algorithm is to take a mode of the large prime number $1000000007$ to ensure that the hash value is in the right range. It is worth thinking about why the emphasis is on taking the mode of the prime numbers, or what are the disadvantages of taking the mode of the hash? This is an interesting question.

Let's throw out the conclusion first:**When we use large prime numbers as modulo numbers, we can maximize the even distribution of hash values**. Since primes do not have covenants with other numbers, periodic patterns due to modulo operations can be reduced, thus avoiding hash collisions.

For example, let's say we choose the composite number $9$ as the modulus, which is divisible by $3$. Then all `key` that are divisible by $3$ will be mapped to the hashes $0$, $3$, and $6$.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

If the input `key` happens to satisfy this isomorphic data distribution, the hashes will be clustered, which will exacerbate hash collisions. Now, assuming that `modulus` is replaced by a prime number $13$, the uniformity of the output hash will be significantly improved since there is no convention between `key` and `modulus`.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

It is worth noting that if `key` is guaranteed to be randomly and uniformly distributed, then it is possible to choose either prime or composite numbers as the modulus, both of which can output uniformly distributed hash values. When there is some periodicity in the distribution of `key`, the aggregation phenomenon is more likely to occur by taking the modulus of the composite numbers.

To summarize, we usually pick a prime number as the modulus, and this prime number should preferably be large enough to eliminate periodic patterns as much as possible and improve the robustness of the hashing algorithm.

## Common Hash Algorithms

It is not difficult to find that the simple hash algorithms introduced above are relatively "fragile", far from achieving the design goals of the hash algorithm. For example, because the addition and dissimilarity to meet the law of exchange, so the addition hash and dissimilarity to the hash can not distinguish between the same content but different order of the string, which may exacerbate the hash collision, and give rise to a number of security issues.

In practice, we usually use some standard hashing algorithms such as MD5, SHA-1, SHA-2, SHA3, etc. They can map input data of arbitrary length to a constant length hash value.

For nearly a century, the hash algorithm is in the process of constant upgrading and optimization. One part of the researchers strive to improve the performance of the hash algorithm, and the other part of the researchers and hackers are committed to find the security problems of the hash algorithm. The table below shows the common hash algorithms in practical applications.

- MD5 and SHA-1 have been successfully attacked so many times that they have been deprecated by various security applications.
- SHA-256 in the SHA-2 family is one of the most secure hash algorithms, and has not yet been successfully attacked, so it is often used in various security applications and protocols.
- SHA-3 has a lower implementation overhead and higher computational efficiency than SHA-2, but is currently not used with the same degree of coverage as the SHA-2 family.

<p align="center"> Table <id> &nbsp; Common hash algorithms </p>

|                | MD5                                                | SHA-1                      | SHA-2                                                           | SHA-3                                  |
| -------------- | -------------------------------------------------- | -------------------------- | --------------------------------------------------------------- | -------------------------------------- |
| Launched       | 1992                                               | 1995                       | 2002                                                            | 2008                                   |
| output length  | 128 bits                                           | 160 bits                   | 256 / 512 bits                                                  | 224/256/384/512 bits                   |
| hash collision | more                                               | more                       | less                                                            | less                                   | less | less |
| Security Level | Low, Successfully Attacked                         | Low, Successfully Attacked | High                                                            | High                                   |
| Applications   | Deprecated, still used for data integrity checking | Deprecated                 | Cryptocurrency transaction validation, digital signatures, etc. | Can be used as a replacement for SHA-2 |

## Hash Values For Data Structures

As we know, the `key` of a hash table can be a data type such as integer, decimal, or string. Programming languages usually provide built-in hash algorithms for these data types, which are used to compute bucket indexes in hash tables. In Python, for example, we can call the `hash()` function to compute hash values for various data types.

- The hash values of integers and boolean quantities are themselves.
- The calculation of hash values for floating point numbers and strings is more complex, so if you are interested, please learn on your own.
- A hash of a tuple is hashed for each of its elements, and then those hashes are combined to get a single hash.
- An object's hash is generated based on its memory address. Generating hashes based on content can be achieved by overriding the object's hash method.

!!! tip

    Note that the definitions and methods of the built-in hash function for calculating hash values differ from one programming language to another.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # The hash value of integer 3 is 3

    bol = True
    hash_bol = hash(bol)
    # The hash value of the boolean True is 1

    dec = 3.14159
    hash_dec = hash(dec)
    # The hash value of the decimal 3.14159 is 326484311674566659

    str = "Hello Algo"
    hash_str = hash(str)
    # String Hello The algorithm's hash value is 4617003410720528961

    tup = (12836, "small ha")
    hash_tup = hash(tup)
    # The hash value of the tuple (12836, 'smallha') is 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # Node object <ListNode object at 0x1058fd810> hash value 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    // The integer 3 hash is 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    // Boolean 1 has a hash value of 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    // The hash value of the decimal 3.14159 is 4614256650576692846

    string str = "Hello Algo";
    size_t hashStr = hash<string>()(str);
    // The hash value of the Hello Algo is 15466937326284535026.

    // In C++, the built-in std:hash() provides hash calculations for basic data types only.
    // Hash calculations for arrays and objects are self-implemented.
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    // The integer 3 hash is 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    // The hash value of the boolean true is 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    // The hash value for the decimal 3.14159 is -1340954729

    String str = "Hello Algo";
    int hashStr = str.hashCode();
    // The string Hello Algo has a hash value of -727081396.

    Object[] arr = { 12836, "littleha" };
    int hashTup = Arrays.hashCode(arr);
    // The array [12836, small hash] has a hash value of 1151158.

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    // The hash value of the node object utils.ListNode@7dc5e7b4 is 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    // 整数 3 的哈希值为 3;

    bool bol = true;
    int hashBol = bol.GetHashCode();
    // the hash value of the boolean true is 1.

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    // The hash value of the decimal 3.14159 is -1340954729.

    string str = "Hello Algo";
    int hashStr = str.GetHashCode();
    // The string Hello Algo has a hash value of -586107568.

    object[] arr = { 12836, "littleha" };
    int hashTup = arr.GetHashCode();
    // The array [12836, small hash] has a hash value of 42931033.

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    // The hash value of node object 0 is 39053774; // The hash value of node object 0 is 39053774.
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go does not provide a built-in hash code function
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    // integer 3 hash value 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    // The hash value of the boolean true is -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    // The hash value of the decimal 3.14159 is -2465384235396674631

    let str = "Hello Algo"
    let hashStr = str.hashValue
    // The algorithm for the string Hello has a hash value of -7850626797806988787.

    let arr = [AnyHashable(12836), AnyHashable("small ha")]
    let hashTup = arr.hashValue
    // The array [AnyHashable(12836), AnyHashable("small hash")] has a hash of -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    // The hash of the node object utils.ListNode is -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript does not provide a built-in hash code function
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript does not provide a built-in hash code function.
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    // The hash of integer 3 is 34803.

    bool bol = true;
    int hashBol = bol.hashCode;
    // The hash value of the boolean true is 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    // The hash value of the decimal 3.14159 is 2570631074981783

    String str = "Hello Algo";
    int hashStr = str.hashCode;
    // The algorithm for the string Hello has a hash value of 468167534.

    List arr = [12836, "Little Hah"];;
    int hashArr = arr.hashCode;
    // The array [12836, small hash] has a hash value of 976512528.

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode;
    // The hash value of the node object Instance of 'ListNode' is 1033450432.
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};
   
    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    // integer 3 hash 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    // The hash value of the boolean true is 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("The hash of decimal {} is {}", dec, hash_dec);
    // The hash value of the decimal 3.14159 is 2566941990314602357

    let str = "Hello Algo";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    // The hash value of the Hello Algo is 16092673739211250988.

    let arr = (&12836, &"small-ha");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    // The hash value of the tuple (12836, "smallha") is 1885128010422702749

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    // The node object RefCell { value: ListNode { val: 42, next: None } } has a hash value of 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C does not provide a built-in hash code function
    ```

=== "Zig"

    ```zig title="built_in_hash.zig"

    ```

In many programming languages, **only immutable objects can be used as the `key`** of a hash table. If we use a list (dynamic array) as a `key`, when the contents of the list change, its hash value changes as well, and we can't look up the original `value` in the hash table.

Although the member variables of a custom object (such as a linked list node) are mutable, it is hashable. **This is because the hash value of an object is usually generated based on the memory address**. Even if the content of the object changes, its memory address remains the same and the hash value remains the same.

If you're careful, you may notice that the output hash value is different when you run the program in different consoles. **This is because the Python interpreter adds a random salt value to the string hash function at each startup**. This practice effectively prevents HashDoS attacks and improves the security of the hash algorithm.
