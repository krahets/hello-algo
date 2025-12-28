# Hash Algorithms

The previous two sections introduced the working principles of hash tables and methods for handling hash collisions. However, both open addressing or separate chaining **can only ensure that the hash table functions correctly when collisions occur; they cannot reduce the occurrence of hash collisions.**

If hash collisions occur too frequently, the performance of the hash table will deteriorate drastically. As shown in the figure below, for a separate chaining hash table, the ideal scenario is when key-value pairs are evenly distributed across all buckets, achieving optimal query efficiency. In the worst-case, all key-value pairs are stored in a single bucket, causing the time complexity to degrade to $O(n)$.
<!-- “separate chaining” is the standard terminology in English for this hash collision resolution method -->
![Ideal and worst cases of hash collisions](hash_algorithm.assets/hash_collision_best_worst_condition.png)

**The distribution of key-value pairs is determined by the hash function.** Recall the calculation steps of the hash function: first, compute the hash value, then modulo it by the array length.
```shell
index = hash(key) % capacity
```

Observing the above formula, when the hash table `capacity` is fixed, **the hash algorithm `hash()` determines the output value**, thereby determining the distribution of key-value pairs in the hash table.

This means that, to reduce the occurence of hash collisions, we should focus on the design of the hash algorithm: `hash()`.

## Objectives of a Hash Algorithm

To achieve a fast and stable hash table data structure, a hash algorithm should have the following characteristics:

- **Deterministic**: For the same input, the hash algorithm should always produce the same output. This ensures the reliability of the hash table.
- **High Efficiency**: The process of computing the hash value should be fast. Lower computational cost improves the practicality of the hash table.
- **Uniform Distribution**: The hash algorithm should ensure that key-value pairs are evenly distributed in the hash table. The more uniform the distribution, the lower the probability of hash collisions.

In pracical, hash algorithms are not only used to implement hash tables but are also widely applied in other fields.

- **Password Storage**: To protect user passwords, systems typically store their hash values instead of plaintext passwords. When a user enters a password, the system hashes it and compares the result with the stored hash. If they match, the password is considered correct.

- **Data Integrity Checks**: The sender computes a hash of the data and sends it along with the data itself. The receiver then recalculates the hash from the received data and compares it with the transmitted hash. If they match, the data is considered intact.

To prevent reverse engineering, such as deriving the original password from its hash value, hash algorithms used in cryptographic applications must have stronger security properties.

- **One-Way Property**: It should be infeasible to derive any information about the input data from its hash value.
- **Collision Resistance**: It should be extremely difficult to find two different inputs that produce the same hash value.
- **Avalanche Effect**: A small change in the input should cause a significant and unpredictable change in the output.


Note that **Uniform Distribution** and **Collision Resistance** are distinct concepts —- a hash function that ensures uniform distribution does not necessarily guarantee collision resistance. For example, given a random input `key`, the hash function `key % 100` may produce a uniformly distributed output. However, this function is overly simplistic; all `key` with the same last two digits will generate the same hash value. As a result, an attacker could easily infer possible `key` from the hash values, making it unsuitable for password security.

## Design of Hash Algorithms

The design of a hash algorithm is a complex problem that requires consideration of multiple factors. However, for less demanding scenarios, we can also create simple hash algorithms.

- **Additive Hash**: Computes the hash value by summing the ASCII codes of all characters in the input.
- **Multiplicative Hash**: Utilizes the independence of multiplication by multiplying a constant in each iteration while accumulating the ASCII codes of the characters into the hash value.
- **XOR Hash**: Accumulates each element of the input using the XOR operation to compute the hash value.
- **Rotational Hash**: Accumulates the ASCII codes of characters into a hash value, performing a rotation operation on the hash value before each accumulation.

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

By examining different hash algorithms, we notice that their final step is always taking the modulo of a large prime number, such as $1000000007$, to ensure the hash value remains within a suitable range. An interesting question to consider is: **Why emphasize using a prime number for modulo? Or, what are the drawbacks of using a composite number?**


The key takeaway is that **using a large prime number as the modulus ensures a more uniform distribution of hash values**. Since a prime number has no common factors with other numbers, it reduces periodic patterns caused by the modulo operation, thereby lowering the risk of hash collisions.

Suppose we choose a composite number like $9$ as the modulus. Since 9 is divisible by 3, all keys that are multiples of 3 will be mapped to only three hash values: $0$, $3$, and $6$.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

If the input `key` follow an arithmetic sequence, the hash values will cluster, increasing the likelihood of hash collisions. Now, if we replace the modulus with the prime number $13$, the lack of common factors between the `key` and the `modulus` significantly improves the uniformity of the hash values.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

It is important to note that if the key is truly random and uniformly distributed, then using either a prime or a composite number as the modulus will yield uniformly distributed hash values. However, when the `key` distribution exhibits periodicity, taking the modulus of a composite number is more likely to cause clustering.

In summary, a prime number is typically chosen as the modulus, and it should be sufficiently large to minimize periodic patterns and enhance the robustness of the hash algorithm.

## Standard Hash Algorithms

It is evident that the simple hash algorithms discussed above are relatively weak and fall far short of meeting the design objectives of robust hash algorithms. For instance, since both `addition` and `XOR` are commutative, additive hashing and XOR hashing cannot distinguish between strings with identical content but different orders. This can significantly increase the likelihood of hash collisions and introduce security vulnerabilities.


In practice, standard hash algorithms such as **MD5, SHA-1, SHA-2, and SHA-3** are commonly used. These algorithms map input data of arbitrary length to a fixed-length hash value.

Over the past century, hash algorithms have undergone continuous advancements and optimizations. While some researchers focus on improving their efficiency and performance, others — including security analysts and hackers — work to identify vulnerabilities. The table below presents some of the most commonly used hash algorithms in real-world applications.

- MD5 and SHA-1 have been successfully broken multiple times and are therefore deprecated in security-critical applications.
- The SHA-2 family, particularly SHA-256, is one of the most secure hash algorithms available today, with no known successful attacks. As a result, it remains widely used in security applications and cryptographic protocols.
- SHA-3, compared to SHA-2, offers lower implementation costs and higher computational efficiency. However, its adoption is currently less widespread than that of the SHA-2 family.

<p align="center"> Table <id> &nbsp; Standard Hash Algorithms </p>

|                 | MD5                                             | SHA-1                               | SHA-2                                                             | SHA-3                        |
| --------------- | ----------------------------------------------- | ----------------------------------- | ----------------------------------------------------------------- | ---------------------------- |
| Release Year    | 1992                                            | 1995                                | 2002                                                              | 2008                         |
| Output Length   | 128 bit                                         | 160 bit                             | 256/512 bit                                                       | 224/256/384/512 bit          |
| Hash Collisions | Many                                        | Many                            | Very few                                                              | Very few                         |
| Security Level  | Low, successfully attacked             | Low, successfully attacked | High                                                              | High                         |
| Applications    | Deprecated, still used for data integrity verification | Deprecated                           | Used for cryptocurrency transaction verification, digital signatures, etc. | Can serve as a replacement for SHA-2 |

# Hash Values in Data Structures

We know that the keys in a hash table can be data types such as integers, floating-point numbers, or strings. Most programming languages provide built-in hash functions for these data types to compute the bucket index in a hash table. Take Python as an example:  we can use the `hash()` function to compute the hash value of various data types.

- The hash value of integers and Boolean values is simply the number itself.
- The hash computation for floating-point numbers and strings is more complex; interested readers can explore further.
- The hash value of a tuple is generated by hashing each element individually and then combining these hash values into a single hash value.
- The hash value of an object is based on its memory address. However, by overriding an object’s hash method, we can generate a hash value based on its content instead.

**!!! tip**

**Note that the definition and implementation of built-in hash value computation functions vary across different programming languages.**

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # Hash value of integer 3 is 3

    bol = True
    hash_bol = hash(bol)
    # Hash value of boolean True is 1

    dec = 3.14159
    hash_dec = hash(dec)
    # Hash value of floating-point number 3.14159 is 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    # Hash value of string "Hello 算法" is 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    # Hash value of tuple (12836, '小哈') is 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # Hash value of ListNode object at 0x1058fd810 is 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    // Hash value of integer 3 is 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    // Hash value of boolean 1 is 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    // Hash value of floating-point number 3.14159 is 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    // Hash value of string "Hello 算法" is 15466937326284535026

    // In C++, the built-in std::hash() only provides hash value computation for basic data types.
    // For arrays and objects, hash value computation must be implemented manually.
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    // Hash value of integer 3 is 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    // Hash value of boolean True is 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    // Hash value of floating-point number 3.14159 is -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    // Hash value of string "Hello 算法" is -727081396

    Object[] arr = { 12836, "小哈" };
    int hashTup = Arrays.hashCode(arr);
    // Hash value of array [12836, 小哈] is 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    // Hash value of ListNode object utils.ListNode@7dc5e7b4 is 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    // Hash value of integer 3 is 3;

    bool bol = true;
    int hashBol = bol.GetHashCode();
    // Hash value of boolean True is 1;

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    // Hash value of floating-point number 3.14159 is -1340954729;

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    // Hash value of string "Hello 算法" is -586107568;

    object[] arr = [12836, "小哈"];
    int hashTup = arr.GetHashCode();
    // Hash value of array [12836, 小哈] is 42931033;

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    // Hash value of ListNode object 0 is 39053774;
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go does not provide built-in hash code functions
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    // Hash value of integer 3 is 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    // Hash value of boolean True is -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    // Hash value of floating-point number 3.14159 is -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    // Hash value of string "Hello 算法" is -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashTup = arr.hashValue
    // Hash value of array [AnyHashable(12836), AnyHashable("小哈")] is -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    // Hash value of ListNode object utils.ListNode is -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript does not provide built-in hash code functions
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript does not provide built-in hash code functions
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    // Hash value of integer 3 is 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    // Hash value of boolean True is 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    // Hash value of floating-point number 3.14159 is 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    // Hash value of string "Hello 算法" is 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    // Hash value of array [12836, 小哈] is 976512528

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode;
    // Hash value of ListNode object Instance of 'ListNode' is 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    // Hash value of integer 3 is 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    // Hash value of boolean True is 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    // Hash value of floating-point number 3.14159 is 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    // Hash value of string "Hello 算法" is 16092673739211250988

    let arr = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    // Hash value of tuple (12836, "小哈") is 1885128010422702749

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    // Hash value of ListNode object RefCell { value: ListNode { val: 42, next: None } } is 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C does not provide built-in hash code functions
    ```

=== "Kotlin"
    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    // Hash value of integer 3 is 3

    val bol = true
    val hashBol = bol.hashCode()
    // Hash value of boolean True is 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    // Hash value of floating-point number 3.14159 is -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    // Hash value of string “Hello 算法” is -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.hashCode()
    // Hash value of array [12836, 小哈] is 189568618

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    // Hash value of Listnode object utils.ListNode@1d81eb93 is 495053715
    ```

==="Ruby"
    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    # Hash value of integer 3 is -4385856518450339636

    bol = true
    hash_bol = bol.hash
    # Hash value of boolean True is -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    # Hash value of floating-point number is -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    # Hash value of string “Hello 算法” is -4075943250025831763

    tup = [12836, '小哈']
    hash_tup = tup.hash
    # Hash value of tuple (12836, '小哈') is 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    # Hash value of Listnode object #<ListNode:0x000078133140ab70> is 4302940560806366381
    ```

=== "Zig"

    ```zig title="built_in_hash.zig"

    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20%E5%B8%83%E5%B0%94%E9%87%8F%20True%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20%E5%85%83%E7%BB%84%20%2812836,%20'%E5%B0%8F%E5%93%88'%29%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%3CListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

In many programming languages, **only immutable objects can be used as the `key` in a hash table**. If we use a list (dynamic array) as a key, any modification to its contents would change its hash value, making it impossible to retrieve the original `value` from the hash table.

Although the member variables of a custom object (such as a linked list node) are mutable, the object itself remains hashable. **This is because an object’s hash value is typically derived from its memory address.** Even if the object’s contents change, its memory address remains unchanged, ensuring that the hash value stays the same.

You may have noticed that hash values can differ across different console sessions. **This occurs because the Python interpreter introduces a random salt into the string hash function at each startup.** This technique effectively mitigates HashDoS attacks, enhancing the security of the hashing mechanism.
