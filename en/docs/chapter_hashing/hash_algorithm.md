---
comments: true
---

# 6.3 &nbsp; Hash algorithms

The previous two sections explained how hash tables work and how collisions are resolved. Whether we use open addressing or separate chaining, **these techniques keep the table working when collisions occur, but do not reduce how often collisions happen**.

Frequent collisions can severely degrade performance. In the separate-chaining table shown below, the ideal case distributes pairs evenly among buckets for the best lookup efficiency. In the worst case, all pairs occupy the same bucket, degrading the time complexity to $O(n)$.

![Best and worst cases for hash collisions](hash_algorithm.assets/hash_collision_best_worst_condition.png){ class="animation-figure" }

<p align="center"> Figure 6-8 &nbsp; Best and worst cases for hash collisions </p>

**The hash function determines how key-value pairs are distributed**. Recall its two steps: calculate a hash value, then take it modulo the array length:

```shell
index = hash(key) % capacity
```

For a fixed `capacity`, **the hash algorithm `hash()` determines the output**, and therefore the distribution of pairs in the table.

To lower the likelihood of collisions, we should therefore focus on designing `hash()`.

## 6.3.1 &nbsp; Goals of a hash algorithm

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

## 6.3.2 &nbsp; Designing a hash algorithm

Designing a hash algorithm is complex and involves many factors. For less demanding uses, however, we can devise simple algorithms.

- **Additive hashing**: Add the ASCII codes of all input characters and use the sum as the hash.
- **Multiplicative hashing**: Use multiplication to mix values, multiplying by a constant each round and accumulating character ASCII codes into the hash.
- **XOR hashing**: Accumulate each input element into a hash using exclusive OR.
- **Rotational hashing**: Accumulate each character's ASCII code into a hash, rotating the hash before each accumulation.

=== "Python"

    ```python title="simple_hash.py"
    def add_hash(key: str) -> int:
        """Additive hash"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash += ord(c)
        return hash % modulus

    def mul_hash(key: str) -> int:
        """Multiplicative hash"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = 31 * hash + ord(c)
        return hash % modulus

    def xor_hash(key: str) -> int:
        """XOR hash"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash ^= ord(c)
        return hash % modulus

    def rot_hash(key: str) -> int:
        """Rotating hash"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
        return hash % modulus
    ```

=== "C++"

    ```cpp title="simple_hash.cpp"
    /* Additive hash */
    int addHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* Multiplicative hash */
    int mulHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (31 * hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR hash */
    int xorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash ^= (int)c;
        }
        return hash & MODULUS;
    }

    /* Rotating hash */
    int rotHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
        }
        return (int)hash;
    }
    ```

=== "Java"

    ```java title="simple_hash.java"
    /* Additive hash */
    int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* Multiplicative hash */
    int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* XOR hash */
    int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* Rotating hash */
    int rotHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = ((hash << 4) ^ (hash >> 28) ^ (int) c) % MODULUS;
        }
        return (int) hash;
    }
    ```

=== "C#"

    ```csharp title="simple_hash.cs"
    /* Additive hash */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* Multiplicative hash */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR hash */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* Rotating hash */
    int RotHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ c) % MODULUS;
        }
        return (int)hash;
    }
    ```

=== "Go"

    ```go title="simple_hash.go"
    /* Additive hash */
    func addHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* Multiplicative hash */
    func mulHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (31*hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* XOR hash */
    func xorHash(key string) int {
        hash := 0
        modulus := 1000000007
        for _, b := range []byte(key) {
            fmt.Println(int(b))
            hash ^= int(b)
            hash = (31*hash + int(b)) % modulus
        }
        return hash & modulus
    }

    /* Rotating hash */
    func rotHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ int64(b)) % modulus
        }
        return int(hash)
    }
    ```

=== "Swift"

    ```swift title="simple_hash.swift"
    /* Additive hash */
    func addHash(key: String) -> Int {
        var hash = 0
        let MODULUS = 1_000_000_007
        for c in key {
            for scalar in c.unicodeScalars {
                hash = (hash + Int(scalar.value)) % MODULUS
            }
        }
        return hash
    }

    /* Multiplicative hash */
    func mulHash(key: String) -> Int {
        var hash = 0
        let MODULUS = 1_000_000_007
        for c in key {
            for scalar in c.unicodeScalars {
                hash = (31 * hash + Int(scalar.value)) % MODULUS
            }
        }
        return hash
    }

    /* XOR hash */
    func xorHash(key: String) -> Int {
        var hash = 0
        let MODULUS = 1_000_000_007
        for c in key {
            for scalar in c.unicodeScalars {
                hash ^= Int(scalar.value)
            }
        }
        return hash & MODULUS
    }

    /* Rotating hash */
    func rotHash(key: String) -> Int {
        var hash = 0
        let MODULUS = 1_000_000_007
        for c in key {
            for scalar in c.unicodeScalars {
                hash = ((hash << 4) ^ (hash >> 28) ^ Int(scalar.value)) % MODULUS
            }
        }
        return hash
    }
    ```

=== "JS"

    ```javascript title="simple_hash.js"
    /* Additive hash */
    function addHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Multiplicative hash */
    function mulHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR hash */
    function xorHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* Rotating hash */
    function rotHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }
    ```

=== "TS"

    ```typescript title="simple_hash.ts"
    /* Additive hash */
    function addHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Multiplicative hash */
    function mulHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR hash */
    function xorHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* Rotating hash */
    function rotHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }
    ```

=== "Dart"

    ```dart title="simple_hash.dart"
    /* Additive hash */
    int addHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* Multiplicative hash */
    int mulHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* XOR hash */
    int xorHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash ^= key.codeUnitAt(i);
      }
      return hash & MODULUS;
    }

    /* Rotating hash */
    int rotHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = ((hash << 4) ^ (hash >> 28) ^ key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }
    ```

=== "Rust"

    ```rust title="simple_hash.rs"
    /* Additive hash */
    fn add_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* Multiplicative hash */
    fn mul_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (31 * hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* XOR hash */
    fn xor_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash ^= c as i64;
        }

        (hash & MODULUS) as i32
    }

    /* Rotating hash */
    fn rot_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = ((hash << 4) ^ (hash >> 28) ^ c as i64) % MODULUS;
        }

        hash as i32
    }
    ```

=== "C"

    ```c title="simple_hash.c"
    /* Additive hash */
    int addHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* Multiplicative hash */
    int mulHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR hash */
    int xorHash(char *key) {
        int hash = 0;
        const int MODULUS = 1000000007;

        for (int i = 0; i < strlen(key); i++) {
            hash ^= (unsigned char)key[i];
        }
        return hash & MODULUS;
    }

    /* Rotating hash */
    int rotHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = ((hash << 4) ^ (hash >> 28) ^ (unsigned char)key[i]) % MODULUS;
        }

        return (int)hash;
    }
    ```

=== "Kotlin"

    ```kotlin title="simple_hash.kt"
    /* Additive hash */
    fun addHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* Multiplicative hash */
    fun mulHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (31 * hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* XOR hash */
    fun xorHash(key: String): Int {
        var hash = 0
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = hash xor c.code
        }
        return hash and MODULUS
    }

    /* Rotating hash */
    fun rotHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = ((hash shl 4) xor (hash shr 28) xor c.code.toLong()) % MODULUS
        }
        return hash.toInt()
    }
    ```

=== "Ruby"

    ```ruby title="simple_hash.rb"
    ### Additive hash ###
    def add_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash += c.ord }

      hash % modulus
    end

    ### Multiplicative hash ###
    def mul_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = 31 * hash + c.ord }

      hash % modulus
    end

    ### XOR hash ###
    def xor_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash ^= c.ord }

      hash % modulus
    end

    ### Rotating hash ###
    def rot_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

      hash % modulus
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Additive%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Multiplicative%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Rotating%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22Additive%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22Multiplicative%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22Rotating%20hash%20value%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Additive%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Multiplicative%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Rotating%20hash%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22Additive%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22Multiplicative%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22Rotating%20hash%20value%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

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

## 6.3.3 &nbsp; Common hash algorithms

The simple algorithms above are fragile and fall well short of our design goals. Addition and XOR are commutative, for example, so additive and XOR hashing cannot distinguish strings containing the same characters in different orders. This can increase collisions and create security problems.

In practice, standard algorithms such as MD5, SHA-1, SHA-2, and SHA-3 are commonly used. They map inputs of arbitrary length to fixed-length hash values.

Over nearly a century, hash algorithms have continually evolved. Some researchers work to improve their performance, while others, along with hackers, search for security weaknesses. Table 6-2 lists commonly used algorithms.

- MD5 and SHA-1 have been successfully attacked repeatedly and have been retired from security applications.
- SHA-256, part of the SHA-2 family, is among the most secure hash algorithms. No successful attack has been reported, so it is widely used in security applications and protocols.
- SHA-3 has lower implementation overhead and higher computational efficiency than SHA-2, but is not yet as widely used.

<p align="center"> Table 6-2 &nbsp; Common hash algorithms </p>

<div class="center-table" markdown>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| Introduced | 1992                           | 1995             | 2002                         | 2008                |
| Output length | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| Hash collisions | More frequent                           | More frequent             | Rare                         | Rare                |
| Security | Low; successfully attacked               | Low; successfully attacked | High                           | High                  |
| Applications     | Deprecated; still used for integrity checks | Deprecated         | Cryptocurrency transaction verification, digital signatures, and more | Can replace SHA-2    |

</div>

## 6.3.4 &nbsp; Hash values of data structures

Hash-table keys can be integers, floating-point numbers, strings, and other types. Programming languages usually provide built-in hashing for these types to calculate bucket indices. In Python, for example, `hash()` calculates hash values for various types.

- Integers and Booleans have hash values equal to their own values.
- Hashing floating-point numbers and strings is more complex; interested readers can explore the details.
- A tuple's hash combines the hashes of its individual elements into one value.
- An object's hash is based on its memory address. Overriding its hash method allows hashing by content instead.

!!! tip

    Built-in hash functions differ in their definitions and implementations across programming languages.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # The hash of the integer 3 is 3

    bol = True
    hash_bol = hash(bol)
    # The hash of the Boolean True is 1

    dec = 3.14159
    hash_dec = hash(dec)
    # The hash of the floating-point number 3.14159 is 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    # The hash of the string “Hello 算法” is 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    # The hash of the tuple (12836, '小哈') is 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # The hash of the node object <ListNode object at 0x1058fd810> is 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    // The hash of the integer 3 is 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    // The hash of the Boolean 1 is 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    // The hash of the floating-point number 3.14159 is 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    // The hash of the string “Hello 算法” is 15466937326284535026

    // In C++, built-in std::hash() provides hashing only for basic data types
    // Hashing for arrays and objects must be implemented separately
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    // The hash of the integer 3 is 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    // The hash of the Boolean true is 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    // The hash of the floating-point number 3.14159 is -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    // The hash of the string “Hello 算法” is -727081396

    Object[] arr = { 12836, "小哈" };
    int hashTup = Arrays.hashCode(arr);
    // The hash of the array [12836, 小哈] is 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    // The hash of the node object utils.ListNode@7dc5e7b4 is 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    // The hash of the integer 3 is 3;

    bool bol = true;
    int hashBol = bol.GetHashCode();
    // The hash of the Boolean true is 1;

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    // The hash of the floating-point number 3.14159 is -1340954729;

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    // The hash of the string “Hello 算法” is -586107568;

    object[] arr = [12836, "小哈"];
    int hashTup = arr.GetHashCode();
    // The hash of the array [12836, 小哈] is 42931033;

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    // The hash of the node object 0 is 39053774;
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go provides no built-in hash-code function
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    // The hash of the integer 3 is 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    // The hash of the Boolean true is -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    // The hash of the floating-point number 3.14159 is -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    // The hash of the string “Hello 算法” is -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashTup = arr.hashValue
    // The hash of the array [AnyHashable(12836), AnyHashable("小哈")] is -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    // The hash of the node object utils.ListNode is -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript provides no built-in hash-code function
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript provides no built-in hash-code function
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    // The hash of the integer 3 is 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    // The hash of the Boolean true is 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    // The hash of the floating-point number 3.14159 is 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    // The hash of the string “Hello 算法” is 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    // The hash of the array [12836, 小哈] is 976512528

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode;
    // The hash of the node object Instance of 'ListNode' is 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    // The hash of the integer 3 is 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    // The hash of the Boolean true is 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    // The hash of the floating-point number 3.14159 is 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    // The hash of the string “Hello 算法” is 16092673739211250988

    let arr = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    // The hash of the tuple (12836, "小哈") is 1885128010422702749

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    // The hash of the node object RefCell { value: ListNode { val: 42, next: None } } is 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C provides no built-in hash-code function
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    // The hash of the integer 3 is 3

    val bol = true
    val hashBol = bol.hashCode()
    // The hash of the Boolean true is 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    // The hash of the floating-point number 3.14159 is -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    // The hash of the string “Hello 算法” is -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.hashCode()
    // The hash of the array [12836, 小哈] is 189568618

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    // The hash of the node object utils.ListNode@1d81eb93 is 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    # The hash of the integer 3 is -4385856518450339636

    bol = true
    hash_bol = bol.hash
    # The hash of the Boolean true is -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    # The hash of the floating-point number 3.14159 is -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    # The hash of the string “Hello 算法” is -4075943250025831763

    tup = [12836, '小哈']
    hash_tup = tup.hash
    # The hash of the tuple (12836, '小哈') is 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    # The hash of the node object #<ListNode:0x000078133140ab70> is 4302940560806366381
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked-list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20integer%203%20is%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20Boolean%20True%20is%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20floating-point%20number%203.14159%20is%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20string%20%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%20is%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20tuple%20%2812836%2C%20%27%E5%B0%8F%E5%93%88%27%29%20is%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20node%20object%20%3CListNode%20object%20at%200x1058fd810%3E%20is%20274267521&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked-list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20integer%203%20is%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20Boolean%20True%20is%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20floating-point%20number%203.14159%20is%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20string%20%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%20is%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20tuple%20%2812836%2C%20%27%E5%B0%8F%E5%93%88%27%29%20is%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20node%20object%20%3CListNode%20object%20at%200x1058fd810%3E%20is%20274267521&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

In many programming languages, **only immutable objects can serve as hash-table keys**. If a list, a dynamic array, were used as a key, changing its contents would change its hash, making the original value impossible to retrieve from the table.

Custom objects, such as linked-list nodes, can be hashable even though their member variables are mutable. **Their hash is usually based on their memory address**, which stays the same even when their contents change.

You may notice different hash values when running the program in different consoles. **Each time the Python interpreter starts, it adds a random salt to its string hash function**. This helps prevent HashDoS attacks and improves security.
