---
comments: true
---

# 6.3 &nbsp; 해시 알고리즘

앞의 두 절에서는 해시 테이블의 동작 원리와 해시 충돌을 처리하는 방법을 살펴보았다. 개방 주소법과 체이닝은 모두 **충돌이 발생해도 해시 테이블이 정상적으로 작동하게 해 줄 뿐, 충돌 자체를 줄이지는 못한다**.

해시 충돌이 너무 잦으면 해시 테이블의 성능이 급격히 떨어진다. 아래 그림(6-8)처럼 체이닝 해시 테이블에서는 키-값 쌍이 각 버킷에 고르게 분포할 때 조회 효율이 가장 좋다. 최악의 경우에는 모든 쌍이 한 버킷에 저장되어 시간 복잡도가 $O(n)$까지 떨어진다.

![해시 충돌의 최선과 최악의 경우](hash_algorithm.assets/hash_collision_best_worst_condition.svg){ class="animation-figure" }

<p align="center"> 그림 6-8 &nbsp; 해시 충돌의 최선과 최악의 경우 </p>

**키-값 쌍의 분포는 해시 함수가 결정한다**. 해시 함수가 인덱스를 구하는 과정을 떠올려 보자. 먼저 해시값을 계산한 뒤 배열의 길이로 나눈 나머지를 구한다.

```shell
index = hash(key) % capacity
```

위 식에서 해시 테이블의 용량 `capacity`가 고정되어 있으면 **출력값은 해시 알고리즘 `hash()`로 결정되며**, 그 결과 키-값 쌍이 테이블 안에서 어떻게 분포할지도 결정한다.

따라서 해시 충돌이 일어날 확률을 낮추려면 해시 알고리즘 `hash()`의 설계에 주목해야 한다.

## 6.3.1 &nbsp; 해시 알고리즘의 목표

빠르고 안정적인 해시 테이블을 구현하려면 해시 알고리즘에 다음과 같은 특성이 있어야 한다.

- **결정성**: 같은 입력에는 언제나 같은 출력을 내야 한다. 그래야 해시 테이블의 조회 결과를 신뢰할 수 있다.
- **효율성**: 해시값을 충분히 빠르게 계산할 수 있어야 한다. 계산 비용이 낮을수록 해시 테이블을 실제로 활용하기 좋다.
- **균등 분포**: 해시 알고리즘은 키-값 쌍을 테이블에 고르게 분산시켜야 한다. 분포가 고를수록 해시 충돌이 일어날 확률이 낮다.

해시 알고리즘은 해시 테이블 구현 외에도 여러 분야에서 널리 쓰인다.

- **비밀번호 저장**: 시스템은 사용자의 비밀번호를 보호하기 위해 보통 평문 대신 해시값을 저장한다. 사용자가 비밀번호를 입력하면 그 해시값을 계산해 저장해 둔 해시값과 비교한다. 두 값이 일치하면 올바른 비밀번호로 판단한다.
- **데이터 무결성 검사**: 송신 측은 데이터의 해시값을 계산해서 데이터와 함께 보낼 수 있다. 수신 측은 받은 데이터의 해시값을 다시 계산해 전송받은 해시값과 비교한다. 둘이 일치하면 데이터가 온전하다고 판단한다.

암호학에 응용할 때는 해시값에서 원래 비밀번호를 추론하는 등의 역추적을 막기 위해 더 높은 수준의 보안 특성이 필요하다.

- **일방향성**: 해시값으로부터 입력 데이터에 관한 어떤 정보도 역으로 알아낼 수 없어야 한다.
- **충돌 저항성**: 해시값이 같은 서로 다른 두 입력을 찾기가 극도로 어려워야 한다.
- **눈사태 효과**: 입력이 조금만 바뀌어도 출력은 크게, 예측하기 어려운 방식으로 달라져야 한다.

**‘균등 분포’와 ‘충돌 저항성’은 서로 독립적인 개념이다**. 분포가 균등하다고 해서 충돌 저항성까지 갖추는 것은 아니다. 예를 들어 입력 `key`가 무작위라면 해시 함수 `key % 100`의 출력은 고르게 분포할 수 있다. 하지만 이 알고리즘은 너무 단순해 끝 두 자리가 같은 `key`는 모두 같은 출력을 낸다. 따라서 해시값으로부터 통과할 수 있는 `key`를 쉽게 알아내 비밀번호를 깰 수 있다.

## 6.3.2 &nbsp; 해시 알고리즘 설계

해시 알고리즘을 설계하려면 여러 요인을 고려해야 하므로 문제 자체는 복잡하다. 다만 요구 수준이 높지 않은 상황에서는 간단한 알고리즘을 직접 설계할 수도 있다.

- **덧셈 해시**: 입력의 각 문자를 ASCII 코드로 바꾸어 모두 더하고 그 합을 해시값으로 삼는다.
- **곱셈 해시**: 매번 같은 상수를 곱해 이전까지의 값에 다른 가중치를 주면서 각 문자의 ASCII 코드를 해시값에 누적한다.
- **XOR 해시**: 입력 데이터의 각 원소를 XOR 연산으로 하나의 해시값에 누적한다.
- **회전 해시**: 각 문자의 ASCII 코드를 해시값에 누적하되, 매번 누적하기 전에 해시값의 비트를 회전시킨다.

=== "Python"

    ```python title="simple_hash.py"
    def add_hash(key: str) -> int:
        """덧셈 해시"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash += ord(c)
        return hash % modulus

    def mul_hash(key: str) -> int:
        """곱셈 해시"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = 31 * hash + ord(c)
        return hash % modulus

    def xor_hash(key: str) -> int:
        """XOR 해시"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash ^= ord(c)
        return hash % modulus

    def rot_hash(key: str) -> int:
        """회전 해시"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
        return hash % modulus
    ```

=== "C++"

    ```cpp title="simple_hash.cpp"
    /* 덧셈 해시 */
    int addHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* 곱셈 해시 */
    int mulHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (31 * hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR 해시 */
    int xorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash ^= (int)c;
        }
        return hash & MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* 곱셈 해시 */
    int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* XOR 해시 */
    int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* 곱셈 해시 */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR 해시 */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    func addHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* 곱셈 해시 */
    func mulHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (31*hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* XOR 해시 */
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

    /* 회전 해시 */
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
    /* 덧셈 해시 */
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

    /* 곱셈 해시 */
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

    /* XOR 해시 */
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

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    function addHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* 곱셈 해시 */
    function mulHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR 해시 */
    function xorHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    function addHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* 곱셈 해시 */
    function mulHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* XOR 해시 */
    function xorHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    int addHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* 곱셈 해시 */
    int mulHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* XOR 해시 */
    int xorHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash ^= key.codeUnitAt(i);
      }
      return hash & MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    fn add_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* 곱셈 해시 */
    fn mul_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (31 * hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* XOR 해시 */
    fn xor_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash ^= c as i64;
        }

        (hash & MODULUS) as i32
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    int addHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* 곱셈 해시 */
    int mulHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR 해시 */
    int xorHash(char *key) {
        int hash = 0;
        const int MODULUS = 1000000007;

        for (int i = 0; i < strlen(key); i++) {
            hash ^= (unsigned char)key[i];
        }
        return hash & MODULUS;
    }

    /* 회전 해시 */
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
    /* 덧셈 해시 */
    fun addHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* 곱셈 해시 */
    fun mulHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (31 * hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* XOR 해시 */
    fun xorHash(key: String): Int {
        var hash = 0
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = hash xor c.code
        }
        return hash and MODULUS
    }

    /* 회전 해시 */
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
    ### 덧셈 해시 ###
    def add_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash += c.ord }

      hash % modulus
    end

    ### 곱셈 해시 ###
    def mul_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = 31 * hash + c.ord }

      hash % modulus
    end

    ### XOR 해시 ###
    def xor_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash ^= c.ord }

      hash % modulus
    end

    ### 회전 해시 ###
    def rot_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

      hash % modulus
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8D%A7%EC%85%88%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%B1%EC%85%88%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%9A%8C%EC%A0%84%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22%EB%8D%A7%EC%85%88%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22%EA%B3%B1%EC%85%88%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22%ED%9A%8C%EC%A0%84%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8D%A7%EC%85%88%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%B1%EC%85%88%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22XOR%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%9A%8C%EC%A0%84%20%ED%95%B4%EC%8B%9C%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22%EB%8D%A7%EC%85%88%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22%EA%B3%B1%EC%85%88%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22XOR%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22%ED%9A%8C%EC%A0%84%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

각 알고리즘의 마지막 단계에서는 큰 소수 $1000000007$로 나눈 나머지를 구해 해시값이 적절한 범위에 들게 한다. 여기서 왜 소수를 강조할까? 합성수로 나눈 나머지를 쓰면 어떤 단점이 있을지 생각해 보자.

먼저 결론부터 말하면, **큰 소수를 법으로 쓰면 해시값을 최대한 고르게 분포시킬 수 있다**. 소수는 다른 수와 1 이외의 공약수가 없어 나머지 연산에서 나타나는 주기적인 패턴을 줄이고 해시 충돌을 피하는 데 도움이 된다.

예를 들어 합성수 $9$를 법으로 선택했다고 하자. 이 수는 $3$으로 나누어떨어지므로 $3$으로 나누어떨어지는 모든 `key`는 $0$, $3$, $6$이라는 세 해시값 중 하나에 대응한다.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

입력 `key`가 마침 이런 등차수열을 이루면 해시값이 몇 곳에 몰려 충돌이 더 잦아진다. 이제 `modulus`를 소수 $13$으로 바꿔 보자. `key`와 `modulus` 사이에 1 이외의 공약수가 없어 출력 해시값이 훨씬 고르게 분포한다.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

다만 `key`가 무작위로 고르게 분포한다면 소수와 합성수 중 어느 쪽을 법으로 선택해도 고르게 분포한 해시값을 얻을 수 있다. 반면 `key`의 분포에 주기성이 있으면 합성수로 나머지를 구할 때 특정 값에 더 쉽게 몰린다.

그래서 보통은 소수를 법으로 선택하며, 되도록 큰 소수를 쓰는 것이 좋다. 그래야 주기적인 패턴을 최대한 없애고 해시 알고리즘이 더 안정적으로 작동한다.

## 6.3.3 &nbsp; 대표적인 해시 알고리즘

지금까지 살펴본 간단한 해시 알고리즘은 비교적 취약하며 앞에서 세운 설계 목표에 크게 못 미친다. 예를 들어 덧셈과 XOR 연산은 교환 법칙이 성립한다. 그래서 덧셈 해시와 XOR 해시는 같은 문자가 순서만 다르게 나열된 문자열을 구별하지 못한다. 이로 인해 해시 충돌이 늘고 보안 문제가 생길 수 있다.

실제로는 MD5, SHA-1, SHA-2, SHA-3 등의 표준 해시 알고리즘을 흔히 사용한다. 이들은 길이에 상관없이 입력 데이터를 고정 길이의 해시값으로 변환한다.

지난 한 세기 가까이 해시 알고리즘은 꾸준히 개선되어 왔다. 성능을 높이려는 연구자가 있는 한편, 보안상의 문제를 찾는 연구자와 해커도 있다. 아래 표는 실제로 흔히 쓰이는 해시 알고리즘을 보여 준다.

- MD5와 SHA-1에 대한 공격이 여러 차례 성공하면서 각종 보안 응용 분야에서는 이들을 더 이상 사용하지 않는다.
- SHA-2 계열의 SHA-256은 가장 안전한 해시 알고리즘 중 하나이다. 아직 성공한 공격 사례가 없어 다양한 보안 응용 분야와 프로토콜에서 널리 쓰인다.
- SHA-3는 SHA-2보다 구현 비용이 낮고 계산 효율이 높지만, 현재는 SHA-2 계열만큼 널리 쓰이지 않는다.

<p align="center">표 <id> &nbsp; 대표적인 해시 알고리즘</p>

<div class="center-table" markdown>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| 발표 시기 | 1992                           | 1995             | 2002                         | 2008                |
| 출력 길이 | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| 해시 충돌 | 비교적 많음                           | 비교적 많음             | 매우 적음                         | 매우 적음                |
| 보안 수준 | 낮음. 공격에 성공한 사례가 있음               | 낮음. 공격에 성공한 사례가 있음 | 높음                           | 높음                  |
| 용도     | 사용 중단. 데이터 무결성 검사에는 여전히 쓰임 | 사용 중단         | 암호화폐 거래 검증, 디지털 서명 등 | SHA-2를 대체할 수 있음    |

</div>

## 6.3.4 &nbsp; 자료 구조의 해시값

해시 테이블의 `key`에는 정수, 실수, 문자열 등 여러 자료형을 쓸 수 있다. 프로그래밍 언어는 대개 이들 자료형에 내장 해시 알고리즘을 제공해 해시 테이블의 버킷 인덱스를 계산할 수 있게 한다. 예를 들어 Python에서는 `hash()` 함수를 호출해 다양한 자료형의 해시값을 구할 수 있다.

- 정수와 불리언의 해시값은 그 값 자체이다.
- 부동 소수점 수와 문자열의 해시값을 계산하는 과정은 더 복잡하다. 관심 있는 독자는 따로 살펴보기 바란다.
- 튜플에서는 각 원소의 해시값을 계산한 뒤 이 값들을 결합해 하나의 해시값을 만든다.
- 객체의 해시값은 메모리 주소를 바탕으로 생성된다. 객체의 해시 메서드를 재정의하면 내용에 따라 해시값을 생성할 수도 있다.

!!! tip

    내장 해시값 계산 함수의 정의와 계산 방식은 프로그래밍 언어마다 다르다.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    print(f"정수 {num} → 해시값: {hash_num}")
    # 정수 3 → 해시값: 3

    bol = True
    hash_bol = hash(bol)
    print(f"불리언 {bol} → 해시값: {hash_bol}")
    # 불리언 True → 해시값: 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"실수 {dec} → 해시값: {hash_dec}")
    # 실수 3.14159 → 해시값: 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"문자열 ‘{str}’ → 해시값: {hash_str}")
    # 문자열 ‘Hello 算法’ → 해시값: 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"튜플 {tup} → 해시값: {hash_tup}")
    # 튜플 (12836, '小哈') → 해시값: 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"노드 객체 {obj} → 해시값: {hash_obj}")
    # 노드 객체 <modules.list_node.ListNode object at 0x1058fd810> → 해시값: 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "정수 " << num << " → 해시값: " << hashNum << "\n";
    // 정수 3 → 해시값: 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "불리언 " << bol << " → 해시값: " << hashBol << "\n";
    // 불리언 1 → 해시값: 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "실수 " << dec << " → 해시값: " << hashDec << "\n";
    // 실수 3.14159 → 해시값: 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "문자열 ‘" << str << "’ → 해시값: " << hashStr << "\n";
    // 문자열 ‘Hello 算法’ → 해시값: 15466937326284535026

    // C++의 내장 std::hash()는 기본 자료형과 일부 표준 라이브러리 자료형(예: std::string)에 대해서만 해시값을 계산한다
    // 배열과 객체의 해시값을 계산하는 기능은 직접 구현해야 한다
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    System.out.println("정수 " + num + " → 해시값: " + hashNum);
    // 정수 3 → 해시값: 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    System.out.println("불리언 " + bol + " → 해시값: " + hashBol);
    // 불리언 true → 해시값: 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    System.out.println("실수 " + dec + " → 해시값: " + hashDec);
    // 실수 3.14159 → 해시값: -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    System.out.println("문자열 ‘" + str + "’ → 해시값: " + hashStr);
    // 문자열 ‘Hello 算法’ → 해시값: -727081396

    Object[] arr = { 12836, "小哈" };
    int hashArr = Arrays.hashCode(arr);
    System.out.println("배열 " + Arrays.toString(arr) + " → 해시값: " + hashArr);
    // 배열 [12836, 小哈] → 해시값: 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    System.out.println("노드 객체 " + obj + " → 해시값: " + hashObj);
    // 노드 객체 utils.ListNode@7dc5e7b4 → 해시값: 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    Console.WriteLine("정수 " + num + " → 해시값: " + hashNum);
    // 정수 3 → 해시값: 3

    bool bol = true;
    int hashBol = bol.GetHashCode();
    Console.WriteLine("불리언 " + bol + " → 해시값: " + hashBol);
    // 불리언 True → 해시값: 1

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    Console.WriteLine("실수 " + dec + " → 해시값: " + hashDec);
    // 실수 3.14159 → 해시값: -1340954729

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    Console.WriteLine("문자열 ‘" + str + "’ → 해시값: " + hashStr);
    // 문자열 ‘Hello 算法’ → 해시값: -586107568

    object[] arr = [12836, "小哈"];
    int hashArr = arr.GetHashCode();
    Console.WriteLine("배열 [" + string.Join(", ", arr) + "] → 해시값: " + hashArr);
    // 배열 [12836, 小哈] → 해시값: 42931033

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    Console.WriteLine("노드 객체 " + obj + " → 해시값: " + hashObj);
    // 노드 객체 0 → 해시값: 39053774
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go는 해시 코드를 구하는 내장 함수를 제공하지 않는다
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    print("정수 \(num) → 해시값: \(hashNum)")
    // 정수 3 → 해시값: 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    print("불리언 \(bol) → 해시값: \(hashBol)")
    // 불리언 true → 해시값: -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    print("실수 \(dec) → 해시값: \(hashDec)")
    // 실수 3.14159 → 해시값: -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    print("문자열 ‘\(str)’ → 해시값: \(hashStr)")
    // 문자열 ‘Hello 算法’ → 해시값: -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashArr = arr.hashValue
    print("배열 \(arr) → 해시값: \(hashArr)")
    // 배열 [AnyHashable(12836), AnyHashable("小哈")] → 해시값: -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    print("노드 객체 \(obj) → 해시값: \(hashObj)")
    // 노드 객체 utils.ListNode → 해시값: -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript는 해시 코드를 구하는 내장 함수를 제공하지 않는다
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript는 해시 코드를 구하는 내장 함수를 제공하지 않는다
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    print("정수 $num → 해시값: $hashNum");
    // 정수 3 → 해시값: 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    print("불리언 $bol → 해시값: $hashBol");
    // 불리언 true → 해시값: 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    print("실수 $dec → 해시값: $hashDec");
    // 실수 3.14159 → 해시값: 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    print("문자열 ‘$str’ → 해시값: $hashStr");
    // 문자열 ‘Hello 算法’ → 해시값: 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    print("배열 $arr → 해시값: $hashArr");
    // 배열 [12836, 小哈] → 해시값: 976512528

    ListNode obj = ListNode(0);
    int hashObj = obj.hashCode;
    print("노드 객체 $obj → 해시값: $hashObj");
    // 노드 객체 Instance of 'ListNode' → 해시값: 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("정수 {} → 해시값: {}", num, hash_num);
    // 정수 3 → 해시값: 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("불리언 {} → 해시값: {}", bol, hash_bol);
    // 불리언 true → 해시값: 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("실수 {} → 해시값: {}", dec, hash_dec);
    // 실수 3.14159 → 해시값: 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("문자열 ‘{}’ → 해시값: {}", str, hash_str);
    // 문자열 ‘Hello 算法’ → 해시값: 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("튜플 {:?} → 해시값: {}", tup, hash_tup);
    // 튜플 (12836, "小哈") → 해시값: 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("노드 {:?}에 저장된 값의 해시값: {}", node, hash_node);
    // 노드 RefCell { value: ListNode { val: 42, next: None } }에 저장된 값의 해시값: 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C는 해시 코드를 구하는 내장 함수를 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    println("정수 $num → 해시값: $hashNum")
    // 정수 3 → 해시값: 3

    val bol = true
    val hashBol = bol.hashCode()
    println("불리언 $bol → 해시값: $hashBol")
    // 불리언 true → 해시값: 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("실수 $dec → 해시값: $hashDec")
    // 실수 3.14159 → 해시값: -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("문자열 ‘$str’ → 해시값: $hashStr")
    // 문자열 ‘Hello 算法’ → 해시값: -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("배열 ${arr.contentToString()} → 해시값: $hashArr")
    // 배열 [12836, 小哈] → 해시값: 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("노드 객체 $obj → 해시값: $hashObj")
    // 노드 객체 utils.ListNode@1d81eb93 → 해시값: 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    puts "정수 #{num} → 해시값: #{hash_num}"
    # 정수 3 → 해시값: -4385856518450339636

    bol = true
    hash_bol = bol.hash
    puts "불리언 #{bol} → 해시값: #{hash_bol}"
    # 불리언 true → 해시값: -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    puts "실수 #{dec} → 해시값: #{hash_dec}"
    # 실수 3.14159 → 해시값: -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    puts "문자열 ‘#{str}’ → 해시값: #{hash_str}"
    # 문자열 ‘Hello 算法’ → 해시값: -4075943250025831763

    arr = [12836, '小哈']
    hash_arr = arr.hash
    puts "배열 #{arr} → 해시값: #{hash_arr}"
    # 배열 [12836, "小哈"] → 해시값: 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    puts "노드 객체 #{obj} → 해시값: #{hash_obj}"
    # 노드 객체 #<ListNode:0x000078133140ab70> → 해시값: 4302940560806366381
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%EC%A0%95%EC%88%98%20%7Bnum%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%EC%A0%95%EC%88%98%203%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20%7Bbol%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20True%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%EB%B6%80%EB%8F%99%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%20%7Bdec%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%EB%B6%80%EB%8F%99%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%203.14159%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98%7Bstr%7D%E2%80%99%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98Hello%20%E7%AE%97%E6%B3%95%E2%80%99%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%ED%8A%9C%ED%94%8C%20%7Btup%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%ED%8A%9C%ED%94%8C%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%7Bobj%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20274267521%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%EC%A0%95%EC%88%98%20%7Bnum%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%EC%A0%95%EC%88%98%203%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20%7Bbol%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20True%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%EB%B6%80%EB%8F%99%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%20%7Bdec%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%EB%B6%80%EB%8F%99%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%203.14159%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98%7Bstr%7D%E2%80%99%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98Hello%20%E7%AE%97%E6%B3%95%E2%80%99%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%ED%8A%9C%ED%94%8C%20%7Btup%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%ED%8A%9C%ED%94%8C%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%7Bobj%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20274267521%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

많은 프로그래밍 언어에서 **불변 객체만 해시 테이블의 `key`로 사용할 수 있다**. 리스트(동적 배열)를 `key`로 쓴다고 가정해 보자. 리스트의 내용이 바뀔 때 해시값까지 달라지면 해시 테이블에서 원래의 `value`를 찾을 수 없게 된다.

사용자 정의 객체(예: 연결 리스트 노드)는 멤버 변수의 값이 바뀔 수 있지만 해시할 수 있다. **객체의 해시값은 보통 메모리 주소를 바탕으로 생성되기 때문이다**. 내용이 바뀌어도 메모리 주소가 그대로이면 해시값도 변하지 않는다.

다른 콘솔에서 프로그램을 실행하면 출력되는 해시값이 다르다는 것을 알아차렸을지도 모른다. **Python 인터프리터가 시작할 때마다 문자열 해시 함수에 임의의 솔트(salt) 값을 더하기 때문이다**. 이렇게 하면 HashDoS 공격을 효과적으로 방지하고 해시 알고리즘의 보안성을 높일 수 있다.
