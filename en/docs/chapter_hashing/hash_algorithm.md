---
comments: true
---

# 6.3 &nbsp; Hash algorithms

The previous two sections explained how hash tables work and how they handle collisions. Both open addressing and chaining **keep a hash table working correctly when collisions occur, but neither reduces the number of collisions**.

Frequent collisions can sharply degrade hash table performance. Figure 6-8 shows a hash table with chaining. Ideally, the pairs are evenly distributed across buckets, giving the fastest lookups. In the worst case, all pairs land in a single bucket, and lookup time degrades to $O(n)$.

![Best and worst cases for hash collisions](hash_algorithm.assets/hash_collision_best_worst_condition.svg){ class="animation-figure" }

<p align="center"> Figure 6-8 &nbsp; Best and worst cases for hash collisions </p>

**The hash function determines how the key-value pairs are distributed**. Recall its two steps: compute the hash value, then take the remainder modulo the array length.

```shell
index = hash(key) % capacity
```

In this formula, when the table capacity `capacity` is fixed, **the hash algorithm `hash()` determines the output** and thus how the key-value pairs are distributed across the table.

To reduce the likelihood of collisions, we therefore need to focus on the design of the hash algorithm `hash()`.

## 6.3.1 &nbsp; Goals of a hash algorithm

A fast, reliable hash table needs a hash algorithm with the following properties.

- **Determinism**. The same input should always produce the same output so that the table works reliably.
- **Efficiency**. Computing a hash value should be fast. The lower the cost, the more practical the table is to use.
- **Uniform distribution**. The algorithm should spread key-value pairs evenly across the table. The more uniform the distribution, the less likely a collision becomes.

Hash algorithms also have many uses beyond implementing hash tables.

- **Password storage**. To protect passwords, systems typically store a hash of each password instead of the plaintext. When a user enters a password, the system hashes it and compares the result with the stored hash. If they match, the system accepts the password.
- **Data integrity checks**. A sender can compute a hash of the data and send it along with the data. The recipient hashes the data received and compares the result with the hash received. If they match, the data is considered intact.

Cryptographic applications need stronger security properties to prevent someone from working backward from a hash, for example to recover the original password.

- **One-way operation**. It should be infeasible to work backward from the hash value to recover information about the input.
- **Collision resistance**. Finding two different inputs with the same hash value should be extremely difficult.
- **Avalanche effect**. A small change to the input should cause a large, unpredictable change in the output.

**Uniform distribution and collision resistance are distinct properties**. A uniform distribution does not guarantee collision resistance. For example, with random inputs `key`, the function `key % 100` can produce uniformly distributed outputs. Yet this algorithm is so simple that every `key` with the same last two digits gives the same output. Given a hash, it is easy to find a `key` that works and thereby defeat the password check.

## 6.3.2 &nbsp; Designing a hash algorithm

Designing a hash algorithm is complex and requires balancing many factors. For less demanding applications, however, we can design simple algorithms.

- **Additive hashing** adds the ASCII codes of all the input characters and uses the sum as the hash value.
- **Multiplicative hashing** mixes the character contributions by multiplying the running hash by a constant each round and accumulating each character’s ASCII code.
- **XOR hashing** combines each input element with the running hash using XOR.
- **Rotation hashing** rotates the running hash before incorporating the ASCII code of each character.

=== "Python"

    ```python title="simple_hash.py"
    def add_hash(key: str) -> int:
        """Additive hashing"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash += ord(c)
        return hash % modulus

    def mul_hash(key: str) -> int:
        """Multiplicative hashing"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = 31 * hash + ord(c)
        return hash % modulus

    def xor_hash(key: str) -> int:
        """XOR hashing"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash ^= ord(c)
        return hash % modulus

    def rot_hash(key: str) -> int:
        """Rotation hashing"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
        return hash % modulus
    ```

=== "C++"

    ```cpp title="simple_hash.cpp"
    /* Additive hashing */
    int addHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* Multiplicative hashing */
    int mulHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (31 * hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR hashing */
    int xorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash ^= (int)c;
        }
        return hash & MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* Multiplicative hashing */
    int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* XOR hashing */
    int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* Multiplicative hashing */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR hashing */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    func addHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* Multiplicative hashing */
    func mulHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (31*hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* XOR hashing */
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

    /* Rotation hashing */
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
    /* Additive hashing */
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

    /* Multiplicative hashing */
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

    /* XOR hashing */
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

    /* Rotation hashing */
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
    /* Additive hashing */
    function addHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Multiplicative hashing */
    function mulHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR hashing */
    function xorHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    function addHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Multiplicative hashing */
    function mulHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR hashing */
    function xorHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    int addHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* Multiplicative hashing */
    int mulHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* XOR hashing */
    int xorHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash ^= key.codeUnitAt(i);
      }
      return hash & MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    fn add_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* Multiplicative hashing */
    fn mul_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (31 * hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* XOR hashing */
    fn xor_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash ^= c as i64;
        }

        (hash & MODULUS) as i32
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    int addHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* Multiplicative hashing */
    int mulHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR hashing */
    int xorHash(char *key) {
        int hash = 0;
        const int MODULUS = 1000000007;

        for (int i = 0; i < strlen(key); i++) {
            hash ^= (unsigned char)key[i];
        }
        return hash & MODULUS;
    }

    /* Rotation hashing */
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
    /* Additive hashing */
    fun addHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* Multiplicative hashing */
    fun mulHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (31 * hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* XOR hashing */
    fun xorHash(key: String): Int {
        var hash = 0
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = hash xor c.code
        }
        return hash and MODULUS
    }

    /* Rotation hashing */
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
    ### Additive hashing ###
    def add_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash += c.ord }

      hash % modulus
    end

    ### Multiplicative hashing ###
    def mul_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = 31 * hash + c.ord }

      hash % modulus
    end

    ### XOR hashing ###
    def xor_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash ^= c.ord }

      hash % modulus
    end

    ### Rotation hashing ###
    def rot_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

      hash % modulus
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Additive%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Multiplicative%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Rotation%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22Additive%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22Multiplicative%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22Rotation%20hash%20value%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Additive%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Multiplicative%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Rotation%20hashing%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22Additive%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22Multiplicative%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20hash%20value%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22Rotation%20hash%20value%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Each algorithm takes the result modulo the large prime $1000000007$ as its final step to keep the hash in a suitable range. Why use a prime modulus? What can go wrong with a composite modulus?

**A large prime modulus gives the best chance of distributing hash values evenly**. Because a prime shares no nontrivial factor with numbers that are not its multiples, it can reduce periodic patterns introduced by the remainder operation and help avoid collisions.

For example, suppose we choose the composite modulus $9$. It is divisible by $3$, so every `key` divisible by $3$ maps to one of just three hash values: $0$, $3$, or $6$.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

If the input values of `key` follow this arithmetic progression, the hashes cluster, leading to more collisions. Now set `modulus` to the prime $13$. The step between successive `key` values has no common factor greater than one with `modulus`, so the hash values are much more evenly distributed.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

If `key` is uniformly random, either a prime or a composite modulus can produce evenly distributed hash values. When `key` follows a periodic pattern, however, a composite modulus is more likely to produce clusters.

We therefore usually choose a prime modulus, preferably a large one, to suppress periodic patterns as much as possible and make the algorithm more robust.

## 6.3.3 &nbsp; Common hash algorithms

The simple algorithms above are fragile and fall well short of the design goals. For example, addition and XOR are commutative, so additive and XOR hashing cannot distinguish strings that contain the same characters in different orders. This can increase collisions and cause security problems.

In practice, standard hash algorithms include MD5, SHA-1, SHA-2, and SHA-3. They map inputs of any length to fixed-length hash values.

Over nearly a century, hash algorithms have undergone continual refinement. Some researchers work to improve their performance, while other researchers and hackers look for security weaknesses. Table 6-2 lists common hash algorithms used in practice.

- Successful attacks against MD5 and SHA-1 have led security applications to phase them out.
- SHA-256, a member of the SHA-2 family, is among the most secure hash algorithms. It has withstood attacks to date and is widely used in security applications and protocols.
- SHA-3 has lower implementation overhead and higher computational efficiency than SHA-2, but the SHA-2 family is still more widely used.

<p align="center"> Table 6-2 &nbsp; Common hash algorithms </p>

<div class="center-table" markdown>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| Year introduced | 1992                           | 1995             | 2002                         | 2008                |
| Output length | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| Hash collisions | Relatively frequent                           | Relatively frequent             | Rare                         | Rare                |
| Security level | Low; successful attacks exist               | Low; successful attacks exist | High                           | High                  |
| Applications     | Deprecated, still used for data integrity checks | Deprecated         | Cryptocurrency transaction verification, digital signatures, and more | Can serve as an alternative to SHA-2    |

</div>

## 6.3.4 &nbsp; Hash values of data structures

A hash table’s `key` can be an integer, a floating-point number, a string, or another data type. Programming languages typically provide built-in hashing for these types so a table can compute a bucket index. In Python, for example, we can call `hash()` to compute hash values for several data types.

- Integers and Booleans hash to their own numeric values.
- Hashing floating-point numbers and strings is more involved. Interested readers can explore these calculations further.
- To hash a tuple, hash each element and combine the results into a single hash value.
- An object’s hash value is based on its memory address. You can override its hash method to generate a hash based on its contents.

!!! tip

    Programming languages differ in how they define and implement their built-in hash functions.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    print(f"Integer {num} has hash value {hash_num}")
    # Integer 3 has hash value 3

    bol = True
    hash_bol = hash(bol)
    print(f"Boolean {bol} has hash value {hash_bol}")
    # Boolean True has hash value 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Floating-point number {dec} has hash value {hash_dec}")
    # Floating-point number 3.14159 has hash value 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"String “{str}” has hash value {hash_str}")
    # String “Hello 算法” has hash value 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"Tuple {tup} has hash value {hash_tup}")
    # Tuple (12836, '小哈') has hash value 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Node object {obj} has hash value {hash_obj}")
    # Node object <modules.list_node.ListNode object at 0x1058fd810> has hash value 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "Integer " << num << " has hash value " << hashNum << "\n";
    // Integer 3 has hash value 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Boolean " << bol << " has hash value " << hashBol << "\n";
    // Boolean 1 has hash value 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Floating-point number " << dec << " has hash value " << hashDec << "\n";
    // Floating-point number 3.14159 has hash value 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "String “" << str << "” has hash value " << hashStr << "\n";
    // String “Hello 算法” has hash value 15466937326284535026

    // In C++, the built-in std::hash() only computes hashes for fundamental types and certain standard library types, such as std::string
    // For arrays and other objects, implement hashing yourself
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    System.out.println("Integer " + num + " has hash value " + hashNum);
    // Integer 3 has hash value 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    System.out.println("Boolean " + bol + " has hash value " + hashBol);
    // Boolean true has hash value 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    System.out.println("Floating-point number " + dec + " has hash value " + hashDec);
    // Floating-point number 3.14159 has hash value -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    System.out.println("String “" + str + "” has hash value " + hashStr);
    // String “Hello 算法” has hash value -727081396

    Object[] arr = { 12836, "小哈" };
    int hashArr = Arrays.hashCode(arr);
    System.out.println("Array " + Arrays.toString(arr) + " has hash value " + hashArr);
    // Array [12836, 小哈] has hash value 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    System.out.println("Node object " + obj + " has hash value " + hashObj);
    // Node object utils.ListNode@7dc5e7b4 has hash value 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    Console.WriteLine("Integer " + num + " has hash value " + hashNum);
    // Integer 3 has hash value 3

    bool bol = true;
    int hashBol = bol.GetHashCode();
    Console.WriteLine("Boolean " + bol + " has hash value " + hashBol);
    // Boolean True has hash value 1

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    Console.WriteLine("Floating-point number " + dec + " has hash value " + hashDec);
    // Floating-point number 3.14159 has hash value -1340954729

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    Console.WriteLine("String “" + str + "” has hash value " + hashStr);
    // String “Hello 算法” has hash value -586107568

    object[] arr = [12836, "小哈"];
    int hashArr = arr.GetHashCode();
    Console.WriteLine("Array [" + string.Join(", ", arr) + "] has hash value " + hashArr);
    // Array [12836, 小哈] has hash value 42931033

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    Console.WriteLine("Node object " + obj + " has hash value " + hashObj);
    // Node object 0 has hash value 39053774
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go does not provide a built-in hash code function
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    print("Integer \(num) has hash value \(hashNum)")
    // Integer 3 has hash value 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    print("Boolean \(bol) has hash value \(hashBol)")
    // Boolean true has hash value -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    print("Floating-point number \(dec) has hash value \(hashDec)")
    // Floating-point number 3.14159 has hash value -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    print("String “\(str)” has hash value \(hashStr)")
    // String “Hello 算法” has hash value -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashArr = arr.hashValue
    print("Array \(arr) has hash value \(hashArr)")
    // Array [AnyHashable(12836), AnyHashable("小哈")] has hash value -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    print("Node object \(obj) has hash value \(hashObj)")
    // Node object utils.ListNode has hash value -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript does not provide a built-in hash code function
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript does not provide a built-in hash code function
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    print("Integer $num has hash value $hashNum");
    // Integer 3 has hash value 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    print("Boolean $bol has hash value $hashBol");
    // Boolean true has hash value 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    print("Floating-point number $dec has hash value $hashDec");
    // Floating-point number 3.14159 has hash value 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    print("String “$str” has hash value $hashStr");
    // String “Hello 算法” has hash value 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    print("Array $arr has hash value $hashArr");
    // Array [12836, 小哈] has hash value 976512528

    ListNode obj = ListNode(0);
    int hashObj = obj.hashCode;
    print("Node object $obj has hash value $hashObj");
    // Node object Instance of 'ListNode' has hash value 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("Integer {} has hash value {}", num, hash_num);
    // Integer 3 has hash value 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("Boolean {} has hash value {}", bol, hash_bol);
    // Boolean true has hash value 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("Floating-point number {} has hash value {}", dec, hash_dec);
    // Floating-point number 3.14159 has hash value 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("String “{}” has hash value {}", str, hash_str);
    // String “Hello 算法” has hash value 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("Tuple {:?} has hash value {}", tup, hash_tup);
    // Tuple (12836, "小哈") has hash value 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("The value stored in node {:?} has hash value {}", node, hash_node);
    // The value stored in node RefCell { value: ListNode { val: 42, next: None } } has hash value 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C does not provide a built-in hash code function
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    println("Integer $num has hash value $hashNum")
    // Integer 3 has hash value 3

    val bol = true
    val hashBol = bol.hashCode()
    println("Boolean $bol has hash value $hashBol")
    // Boolean true has hash value 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Floating-point number $dec has hash value $hashDec")
    // Floating-point number 3.14159 has hash value -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("String “$str” has hash value $hashStr")
    // String “Hello 算法” has hash value -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("Array ${arr.contentToString()} has hash value $hashArr")
    // Array [12836, 小哈] has hash value 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Node object $obj has hash value $hashObj")
    // Node object utils.ListNode@1d81eb93 has hash value 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    puts "Integer #{num} has hash value #{hash_num}"
    # Integer 3 has hash value -4385856518450339636

    bol = true
    hash_bol = bol.hash
    puts "Boolean #{bol} has hash value #{hash_bol}"
    # Boolean true has hash value -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    puts "Floating-point number #{dec} has hash value #{hash_dec}"
    # Floating-point number 3.14159 has hash value -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    puts "String “#{str}” has hash value #{hash_str}"
    # String “Hello 算法” has hash value -4075943250025831763

    arr = [12836, '小哈']
    hash_arr = arr.hash
    puts "Array #{arr} has hash value #{hash_arr}"
    # Array [12836, "小哈"] has hash value 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    puts "Node object #{obj} has hash value #{hash_obj}"
    # Node object #<ListNode:0x000078133140ab70> has hash value 4302940560806366381
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22Integer%20%7Bnum%7D%20hashes%20to%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20Integer%203%20hashes%20to%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22Boolean%20%7Bbol%7D%20hashes%20to%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20Boolean%20True%20hashes%20to%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22Float%20%7Bdec%7D%20hashes%20to%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20Float%203.14159%20hashes%20to%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22String%20%27%7Bstr%7D%27%20hashes%20to%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20String%20%27Hello%20%E7%AE%97%E6%B3%95%27%20hashes%20to%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22Tuple%20%7Btup%7D%20hashes%20to%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20Tuple%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20hashes%20to%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22Node%20object%20%7Bobj%7D%20hashes%20to%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20Node%20object%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20hashes%20to%20274267521%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22Integer%20%7Bnum%7D%20hashes%20to%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20Integer%203%20hashes%20to%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22Boolean%20%7Bbol%7D%20hashes%20to%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20Boolean%20True%20hashes%20to%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22Float%20%7Bdec%7D%20hashes%20to%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20Float%203.14159%20hashes%20to%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22String%20%27%7Bstr%7D%27%20hashes%20to%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20String%20%27Hello%20%E7%AE%97%E6%B3%95%27%20hashes%20to%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22Tuple%20%7Btup%7D%20hashes%20to%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20Tuple%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20hashes%20to%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22Node%20object%20%7Bobj%7D%20hashes%20to%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20Node%20object%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20hashes%20to%20274267521%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

In many programming languages, **only immutable objects can serve as a hash table’s `key`**. Suppose we used a list (a dynamic array) as a `key`. Changing the contents of the list would change its hash value, and we would no longer be able to look up the original `value` in the table.

A user-defined object, such as a linked list node, can be hashable even though its fields can change. **An object’s hash is typically based on its memory address**. Changes to its contents leave its address, and therefore its hash, unchanged.

You may notice different hash values when you run the program in different consoles. **Each time the Python interpreter starts, it supplies a random salt to the string hash function**. This helps prevent HashDoS attacks and makes hashing more secure.
