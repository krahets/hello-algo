---
comments: true
---

# 6.3 &nbsp; ハッシュアルゴリズム

前の 2 節では、ハッシュ表の仕組みと衝突の処理方法を学びました。オープンアドレス法とチェイン法はどちらも、**衝突が起きても表が正しく動作するようにできますが、衝突そのものを減らすことはできません**。

衝突が頻繁に起きると、ハッシュ表の性能は急激に低下します。図 6-8 のように、チェイン法では、各バケットにペアが均等に分布するのが理想で、このとき検索効率は最も高くなります。最悪の場合はすべてのペアが同じバケットに入り、時間計算量は $O(n)$ まで悪化します。

![ハッシュ衝突の最良の場合と最悪の場合](hash_algorithm.assets/hash_collision_best_worst_condition.svg){ class="animation-figure" }

<p align="center"> 図 6-8 &nbsp; ハッシュ衝突の最良の場合と最悪の場合 </p>

**キーと値のペアがどう分布するかは、ハッシュ関数によって決まります**。ハッシュ関数の計算手順を思い出しましょう。まずハッシュ値を求め、それを配列の長さで割った余りを取ります。

```shell
index = hash(key) % capacity
```

上の式を見ると、ハッシュ表の容量 `capacity` が一定なら、**出力値はハッシュアルゴリズム `hash()` によって決まる**ことがわかります。その出力値が、表内でのペアの分布を決めます。

したがって、衝突の確率を下げるには、ハッシュアルゴリズム `hash()` の設計に着目する必要があります。

## 6.3.1 &nbsp; ハッシュアルゴリズムの目標

高速で安定したハッシュ表を実現するには、ハッシュアルゴリズムに次の性質が必要です。

- **決定性**：同じ入力からは常に同じ出力が得られる必要があります。これによってハッシュ表は信頼できるものになります。
- **計算効率**：ハッシュ値は十分に速く計算できる必要があります。計算にかかるコストが小さいほど、ハッシュ表は実用的になります。
- **均一な分布**：キーと値のペアが表内に均等に分布するようにします。分布が均一なほど、衝突の確率は低くなります。

ハッシュアルゴリズムは、ハッシュ表の実装のほかにも多くの分野で使われています。

- **パスワードの保存**：利用者のパスワードを保護するため、システムは通常、平文のパスワードを直接保存せず、そのハッシュ値を保存します。利用者がパスワードを入力すると、システムは入力のハッシュ値を計算し、保存してある値と比較します。一致すれば、正しいパスワードとして扱います。
- **データの完全性の確認**：送信者はデータのハッシュ値を計算し、データと一緒に送ります。受信者は受け取ったデータからハッシュ値を計算し直し、受け取ったハッシュ値と比較できます。両者が一致すれば、データは完全なものとみなされます。

暗号にかかわる用途では、ハッシュ値から元のパスワードを割り出すといった逆算を防ぐため、ハッシュアルゴリズムにさらに高度な安全性が求められます。

- **一方向性**：ハッシュ値から入力データに関する情報を逆算できないことです。
- **衝突耐性**：同じハッシュ値を持つ異なる 2 つの入力を見つけることが、極めて困難でなければなりません。
- **雪崩効果**：入力がわずかに変わるだけで、出力が予測できない形で大きく変わる性質です。

**「均一な分布」と「衝突耐性」は別々の概念です**。均一に分布していても、衝突耐性があるとは限りません。例えば、入力 `key` がランダムなら、ハッシュ関数 `key % 100` の出力は均一に分布し得ます。しかし、このアルゴリズムは単純すぎて、下 2 桁が同じ `key` はすべて同じ値になります。そのため、ハッシュ値から認証を通る `key` を簡単に割り出せてしまい、パスワードが破られます。

## 6.3.2 &nbsp; ハッシュアルゴリズムの設計

ハッシュアルゴリズムの設計は、さまざまな要因を考慮する必要がある複雑な問題です。ただし、要求の厳しくない用途向けには、自分でも簡単なアルゴリズムを設計できます。

- **加算ハッシュ**：入力の各文字の ASCII コードを足し合わせ、その合計をハッシュ値にします。
- **乗算ハッシュ**：乗算によって各文字の寄与の相関を弱めます。各回でそれまでの値に定数を掛け、文字の ASCII コードを加えていきます。
- **XOR ハッシュ**：排他的論理和（XOR）を使って入力の各要素を順に 1 つのハッシュ値にまとめます。
- **回転ハッシュ**：文字ごとに、それまでのハッシュ値を回転させてから、その文字の ASCII コードを取り込みます。

=== "Python"

    ```python title="simple_hash.py"
    def add_hash(key: str) -> int:
        """加算ハッシュ"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash += ord(c)
        return hash % modulus

    def mul_hash(key: str) -> int:
        """乗算ハッシュ"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = 31 * hash + ord(c)
        return hash % modulus

    def xor_hash(key: str) -> int:
        """XOR ハッシュ"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash ^= ord(c)
        return hash % modulus

    def rot_hash(key: str) -> int:
        """回転ハッシュ"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
        return hash % modulus
    ```

=== "C++"

    ```cpp title="simple_hash.cpp"
    /* 加算ハッシュ */
    int addHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* 乗算ハッシュ */
    int mulHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (31 * hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR ハッシュ */
    int xorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash ^= (int)c;
        }
        return hash & MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* 乗算ハッシュ */
    int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* XOR ハッシュ */
    int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* 乗算ハッシュ */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR ハッシュ */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    func addHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* 乗算ハッシュ */
    func mulHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (31*hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* XOR ハッシュ */
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

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
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

    /* 乗算ハッシュ */
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

    /* XOR ハッシュ */
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

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    function addHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* 乗算ハッシュ */
    function mulHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR ハッシュ */
    function xorHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    function addHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* 乗算ハッシュ */
    function mulHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR ハッシュ */
    function xorHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    int addHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* 乗算ハッシュ */
    int mulHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* XOR ハッシュ */
    int xorHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash ^= key.codeUnitAt(i);
      }
      return hash & MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    fn add_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* 乗算ハッシュ */
    fn mul_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (31 * hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* XOR ハッシュ */
    fn xor_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash ^= c as i64;
        }

        (hash & MODULUS) as i32
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    int addHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* 乗算ハッシュ */
    int mulHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR ハッシュ */
    int xorHash(char *key) {
        int hash = 0;
        const int MODULUS = 1000000007;

        for (int i = 0; i < strlen(key); i++) {
            hash ^= (unsigned char)key[i];
        }
        return hash & MODULUS;
    }

    /* 回転ハッシュ */
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
    /* 加算ハッシュ */
    fun addHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* 乗算ハッシュ */
    fun mulHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (31 * hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* XOR ハッシュ */
    fun xorHash(key: String): Int {
        var hash = 0
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = hash xor c.code
        }
        return hash and MODULUS
    }

    /* 回転ハッシュ */
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
    ### 加算ハッシュ ###
    def add_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash += c.ord }

      hash % modulus
    end

    ### 乗算ハッシュ ###
    def mul_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = 31 * hash + c.ord }

      hash % modulus
    end

    ### XOR ハッシュ ###
    def xor_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash ^= c.ord }

      hash % modulus
    end

    ### 回転ハッシュ ###
    def rot_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

      hash % modulus
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8A%A0%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%B9%97%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E8%BB%A2%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22%E5%8A%A0%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22%E4%B9%97%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22%E5%9B%9E%E8%BB%A2%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8A%A0%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%B9%97%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E8%BB%A2%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22%E5%8A%A0%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22%E4%B9%97%E7%AE%97%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22%E5%9B%9E%E8%BB%A2%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%80%A4%E3%81%AF%20%7Bhash%7D%22%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

どのアルゴリズムも、最後に大きな素数 $1000000007$ で割った余りを取り、ハッシュ値が適切な範囲に収まるようにしています。なぜ素数を使うのでしょうか。逆に、合成数で余りを取るとどんな不都合があるのか、考えてみましょう。

先に結論を述べると、**法に大きな素数を使うと、ハッシュ値の分布をできるだけ均一に保てます**。素数はほかの数と 1 より大きい公約数を持たないため、剰余演算で生じる周期的なパターンを減らし、衝突を避けやすくなります。

例えば、法として合成数 $9$ を選んだとします。この数は $3$ で割り切れるので、$3$ で割り切れる `key` のハッシュ値は $0$、$3$、$6$ の 3 通りに限られます。

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

入力 `key` がちょうどこのような等差数列をなすと、ハッシュ値が特定の値に偏り、衝突が増えます。ここで `modulus` を素数 $13$ に置き換えてみましょう。`key` と `modulus` に1 より大きい公約数がないため、出力されるハッシュ値の分布はずっと均一になります。

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

`key` がランダムかつ均一に分布するとわかっていれば、法は素数でも合成数でもかまいません。どちらでも均一に分布するハッシュ値が得られます。一方、`key` の分布に周期性がある場合は、合成数で余りを取るほうが値が偏りやすくなります。

そこで通常は、法に素数を使います。周期的なパターンをできるだけ取り除いてアルゴリズムの頑健性を高めるには、十分に大きな素数が望ましいのです。

## 6.3.3 &nbsp; 代表的なハッシュアルゴリズム

ここまでの簡単なアルゴリズムには弱点があり、ハッシュアルゴリズムの設計目標には遠く及びません。例えば、加算と XOR は順序を入れ替えても結果が同じなので、加算ハッシュと XOR ハッシュでは、同じ文字を違う順番に並べた文字列を区別できません。そのため衝突が増えたり、セキュリティ上の問題が起きたりするおそれがあります。

実際には、MD5、SHA-1、SHA-2、SHA-3 など、標準的なハッシュアルゴリズムを使うのが一般的です。いずれも任意の長さの入力データを、一定の長さのハッシュ値に変換します。

この 1 世紀近く、ハッシュアルゴリズムは改良と最適化を重ねてきました。性能の向上に取り組む研究者がいる一方で、その安全性の問題を探る研究者やハッカーもいます。表 6-2 に、実際によく使われるアルゴリズムを示します。

- MD5 と SHA-1 に対する攻撃はすでに何度も成功しており、セキュリティを目的とするさまざまな用途で使われなくなっています。
- SHA-2 系列の SHA-256 は特に安全性の高いハッシュアルゴリズムの 1 つで、攻撃が成功した例はまだありません。そのため、多くのセキュリティ用途やプロトコルで使われています。
- SHA-3 は SHA-2 よりも実装の負担が小さく、計算効率も高いものの、現時点での普及率は SHA-2 系列に及びません。

<p align="center"> 表 6-2 &nbsp; 代表的なハッシュアルゴリズム </p>

<div class="center-table" markdown>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| 発表年 | 1992                           | 1995             | 2002                         | 2008                |
| 出力長 | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| ハッシュ衝突 | 比較的多い                           | 比較的多い             | ごく少ない                         | ごく少ない                |
| 安全性 | 低い（攻撃の成功例あり）               | 低い（攻撃の成功例あり） | 高い                           | 高い                  |
| 用途     | 非推奨だが、データの完全性の確認には今も使われる | 非推奨         | 暗号資産の取引の検証、デジタル署名など | SHA-2 の代替として使用可能    |

</div>

## 6.3.4 &nbsp; データ構造のハッシュ値

ハッシュ表の `key` には整数、浮動小数点数、文字列などが使えます。プログラミング言語には通常、これらの型に対応するハッシュアルゴリズムが組み込まれており、バケットのインデックスを求めるのに使われます。例えば Python では、`hash()` 関数を呼び出せば、さまざまな型のハッシュ値が得られます。

- 整数と真偽値のハッシュ値には、その値自体が使われます。
- 浮動小数点数や文字列では、ハッシュ値の計算がやや複雑です。興味のある方は調べてみてください。
- タプルでは、各要素のハッシュ値を求め、それらを組み合わせて 1 つのハッシュ値にします。
- オブジェクトのハッシュ値は、そのメモリアドレスに基づいて生成されます。ハッシュを求めるメソッドをオーバーライドすれば、オブジェクトの内容に基づいて計算することもできます。

!!! tip "ヒント"

    組み込みのハッシュ関数の定義や計算方法は、プログラミング言語によって異なることに注意してください。

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    print(f"整数 {num} のハッシュ値は {hash_num}")
    # 整数 3 のハッシュ値は 3

    bol = True
    hash_bol = hash(bol)
    print(f"真偽値 {bol} のハッシュ値は {hash_bol}")
    # 真偽値 True のハッシュ値は 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"浮動小数点数 {dec} のハッシュ値は {hash_dec}")
    # 浮動小数点数 3.14159 のハッシュ値は 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"文字列「{str}」のハッシュ値は {hash_str}")
    # 文字列「Hello 算法」のハッシュ値は 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"タプル {tup} のハッシュ値は {hash_tup}")
    # タプル (12836, '小哈') のハッシュ値は 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"ノードオブジェクト {obj} のハッシュ値は {hash_obj}")
    # ノードオブジェクト <modules.list_node.ListNode object at 0x1058fd810> のハッシュ値は 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "整数 " << num << " のハッシュ値は " << hashNum << "\n";
    // 整数 3 のハッシュ値は 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "真偽値 " << bol << " のハッシュ値は " << hashBol << "\n";
    // 真偽値 1 のハッシュ値は 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "浮動小数点数 " << dec << " のハッシュ値は " << hashDec << "\n";
    // 浮動小数点数 3.14159 のハッシュ値は 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "文字列「" << str << "」のハッシュ値は " << hashStr << "\n";
    // 文字列「Hello 算法」のハッシュ値は 15466937326284535026

    // C++ の標準の std::hash() でハッシュ値を計算できるのは、基本型と一部の標準ライブラリの型（std::string など）に限られる
    // 配列やオブジェクトのハッシュ値の計算は自分で実装する必要がある
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    System.out.println("整数 " + num + " のハッシュ値は " + hashNum);
    // 整数 3 のハッシュ値は 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    System.out.println("真偽値 " + bol + " のハッシュ値は " + hashBol);
    // 真偽値 true のハッシュ値は 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    System.out.println("浮動小数点数 " + dec + " のハッシュ値は " + hashDec);
    // 浮動小数点数 3.14159 のハッシュ値は -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    System.out.println("文字列「" + str + "」のハッシュ値は " + hashStr);
    // 文字列「Hello 算法」のハッシュ値は -727081396

    Object[] arr = { 12836, "小哈" };
    int hashArr = Arrays.hashCode(arr);
    System.out.println("配列 " + Arrays.toString(arr) + " のハッシュ値は " + hashArr);
    // 配列 [12836, 小哈] のハッシュ値は 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    System.out.println("ノードオブジェクト " + obj + " のハッシュ値は " + hashObj);
    // ノードオブジェクト utils.ListNode@7dc5e7b4 のハッシュ値は 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    Console.WriteLine("整数 " + num + " のハッシュ値は " + hashNum);
    // 整数 3 のハッシュ値は 3

    bool bol = true;
    int hashBol = bol.GetHashCode();
    Console.WriteLine("真偽値 " + bol + " のハッシュ値は " + hashBol);
    // 真偽値 True のハッシュ値は 1

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    Console.WriteLine("浮動小数点数 " + dec + " のハッシュ値は " + hashDec);
    // 浮動小数点数 3.14159 のハッシュ値は -1340954729

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    Console.WriteLine("文字列「" + str + "」のハッシュ値は " + hashStr);
    // 文字列「Hello 算法」のハッシュ値は -586107568

    object[] arr = [12836, "小哈"];
    int hashArr = arr.GetHashCode();
    Console.WriteLine("配列 [" + string.Join(", ", arr) + "] のハッシュ値は " + hashArr);
    // 配列 [12836, 小哈] のハッシュ値は 42931033

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    Console.WriteLine("ノードオブジェクト " + obj + " のハッシュ値は " + hashObj);
    // ノードオブジェクト 0 のハッシュ値は 39053774
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go にはハッシュコードを求める組み込み関数がない
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    print("整数 \(num) のハッシュ値は \(hashNum)")
    // 整数 3 のハッシュ値は 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    print("真偽値 \(bol) のハッシュ値は \(hashBol)")
    // 真偽値 true のハッシュ値は -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    print("浮動小数点数 \(dec) のハッシュ値は \(hashDec)")
    // 浮動小数点数 3.14159 のハッシュ値は -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    print("文字列「\(str)」のハッシュ値は \(hashStr)")
    // 文字列「Hello 算法」のハッシュ値は -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashArr = arr.hashValue
    print("配列 \(arr) のハッシュ値は \(hashArr)")
    // 配列 [AnyHashable(12836), AnyHashable("小哈")] のハッシュ値は -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    print("ノードオブジェクト \(obj) のハッシュ値は \(hashObj)")
    // ノードオブジェクト utils.ListNode のハッシュ値は -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript にはハッシュコードを求める組み込み関数がない
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript にはハッシュコードを求める組み込み関数がない
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    print("整数 $num のハッシュ値は $hashNum");
    // 整数 3 のハッシュ値は 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    print("真偽値 $bol のハッシュ値は $hashBol");
    // 真偽値 true のハッシュ値は 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    print("浮動小数点数 $dec のハッシュ値は $hashDec");
    // 浮動小数点数 3.14159 のハッシュ値は 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    print("文字列「$str」のハッシュ値は $hashStr");
    // 文字列「Hello 算法」のハッシュ値は 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    print("配列 $arr のハッシュ値は $hashArr");
    // 配列 [12836, 小哈] のハッシュ値は 976512528

    ListNode obj = ListNode(0);
    int hashObj = obj.hashCode;
    print("ノードオブジェクト $obj のハッシュ値は $hashObj");
    // ノードオブジェクト Instance of 'ListNode' のハッシュ値は 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("整数 {} のハッシュ値は {}", num, hash_num);
    // 整数 3 のハッシュ値は 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("真偽値 {} のハッシュ値は {}", bol, hash_bol);
    // 真偽値 true のハッシュ値は 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("浮動小数点数 {} のハッシュ値は {}", dec, hash_dec);
    // 浮動小数点数 3.14159 のハッシュ値は 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("文字列「{}」のハッシュ値は {}", str, hash_str);
    // 文字列「Hello 算法」のハッシュ値は 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("タプル {:?} のハッシュ値は {}", tup, hash_tup);
    // タプル (12836, "小哈") のハッシュ値は 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("ノード {:?} に格納された値のハッシュ値は {}", node, hash_node);
    // ノード RefCell { value: ListNode { val: 42, next: None } } に格納された値のハッシュ値は 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C にはハッシュコードを求める組み込み関数がない
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    println("整数 $num のハッシュ値は $hashNum")
    // 整数 3 のハッシュ値は 3

    val bol = true
    val hashBol = bol.hashCode()
    println("真偽値 $bol のハッシュ値は $hashBol")
    // 真偽値 true のハッシュ値は 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("浮動小数点数 $dec のハッシュ値は $hashDec")
    // 浮動小数点数 3.14159 のハッシュ値は -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("文字列「$str」のハッシュ値は $hashStr")
    // 文字列「Hello 算法」のハッシュ値は -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("配列 ${arr.contentToString()} のハッシュ値は $hashArr")
    // 配列 [12836, 小哈] のハッシュ値は 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("ノードオブジェクト $obj のハッシュ値は $hashObj")
    // ノードオブジェクト utils.ListNode@1d81eb93 のハッシュ値は 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    puts "整数 #{num} のハッシュ値は #{hash_num}"
    # 整数 3 のハッシュ値は -4385856518450339636

    bol = true
    hash_bol = bol.hash
    puts "真偽値 #{bol} のハッシュ値は #{hash_bol}"
    # 真偽値 true のハッシュ値は -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    puts "浮動小数点数 #{dec} のハッシュ値は #{hash_dec}"
    # 浮動小数点数 3.14159 のハッシュ値は -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    puts "文字列「#{str}」のハッシュ値は #{hash_str}"
    # 文字列「Hello 算法」のハッシュ値は -4075943250025831763

    arr = [12836, '小哈']
    hash_arr = arr.hash
    puts "配列 #{arr} のハッシュ値は #{hash_arr}"
    # 配列 [12836, "小哈"] のハッシュ値は 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    puts "ノードオブジェクト #{obj} のハッシュ値は #{hash_obj}"
    # ノードオブジェクト #<ListNode:0x000078133140ab70> のハッシュ値は 4302940560806366381
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%A1%A8%E3%81%99%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%E6%95%B4%E6%95%B0%20%7Bnum%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%E7%9C%9F%E5%81%BD%E5%80%A4%20%7Bbol%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%E7%9C%9F%E5%81%BD%E5%80%A4%20True%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%E6%B5%AE%E5%8B%95%E5%B0%8F%E6%95%B0%E7%82%B9%E6%95%B0%20%7Bdec%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%E6%B5%AE%E5%8B%95%E5%B0%8F%E6%95%B0%E7%82%B9%E6%95%B0%203.14159%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%E6%96%87%E5%AD%97%E5%88%97%E3%80%8C%7Bstr%7D%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%E6%96%87%E5%AD%97%E5%88%97%E3%80%8CHello%20%E7%AE%97%E6%B3%95%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%E3%82%BF%E3%83%97%E3%83%AB%20%7Btup%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%E3%82%BF%E3%83%97%E3%83%AB%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%7Bobj%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20274267521%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%A1%A8%E3%81%99%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%E6%95%B4%E6%95%B0%20%7Bnum%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%E7%9C%9F%E5%81%BD%E5%80%A4%20%7Bbol%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%E7%9C%9F%E5%81%BD%E5%80%A4%20True%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%E6%B5%AE%E5%8B%95%E5%B0%8F%E6%95%B0%E7%82%B9%E6%95%B0%20%7Bdec%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%E6%B5%AE%E5%8B%95%E5%B0%8F%E6%95%B0%E7%82%B9%E6%95%B0%203.14159%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%E6%96%87%E5%AD%97%E5%88%97%E3%80%8C%7Bstr%7D%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%E6%96%87%E5%AD%97%E5%88%97%E3%80%8CHello%20%E7%AE%97%E6%B3%95%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%E3%82%BF%E3%83%97%E3%83%AB%20%7Btup%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%E3%82%BF%E3%83%97%E3%83%AB%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%7Bobj%7D%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20274267521%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

多くのプログラミング言語では、**ハッシュ表の `key` に使えるのは不変なオブジェクトだけです**。仮にリスト（動的配列）を `key` に使うと、リストの内容が変わったときにハッシュ値も変わり、元の `value` を表から取得できなくなります。

自分で定義したオブジェクト（連結リストのノードなど）は、メンバー変数が変更可能でもハッシュ値を計算できます。**通常、オブジェクトのハッシュ値はメモリアドレスに基づくからです**。内容が変わってもアドレスは変わらず、ハッシュ値もそのままです。

別のコンソールでプログラムを実行すると、出力されるハッシュ値が違うことに気づくかもしれません。**Python インタプリタは起動するたびに、文字列のハッシュ関数にランダムなソルト（salt）を加えるためです**。この仕組みは HashDoS 攻撃を防ぐのに有効で、ハッシュアルゴリズムの安全性を高めます。
