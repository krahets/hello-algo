---
comments: true
---

# 6.3 &nbsp; Алгоритмы хеширования

В двух предыдущих разделах мы разобрали устройство хеш-таблицы и способы разрешения коллизий. Открытая адресация и метод цепочек **позволяют таблице корректно работать при коллизиях, но не уменьшают частоту их возникновения**.

Если коллизии возникают слишком часто, производительность хеш-таблицы резко падает. На рисунке 6-8 показана таблица с цепочками. В идеале пары равномерно распределены по корзинам и поиск наиболее эффективен. В худшем случае все пары попадают в одну корзину, и время поиска возрастает до $O(n)$.

![Коллизии: лучший и худший случаи](hash_algorithm.assets/hash_collision_best_worst_condition.svg){ class="animation-figure" }

<p align="center"> Рисунок 6-8 &nbsp; Коллизии: лучший и худший случаи </p>

**Распределение пар по корзинам определяет хеш-функция**. Вспомним, как она работает: сначала вычисляем хеш, затем берём остаток от его деления на длину массива.

```shell
index = hash(key) % capacity
```

Из формулы видно, что при фиксированной ёмкости `capacity` **результат определяется алгоритмом хеширования `hash()`**. От него, в свою очередь, зависит распределение пар в таблице.

Поэтому, чтобы снизить вероятность коллизий, рассмотрим подробнее, как устроен алгоритм хеширования `hash()`.

## 6.3.1 &nbsp; Требования к алгоритму хеширования

Чтобы хеш-таблица работала быстро и надёжно, алгоритм хеширования должен обладать следующими свойствами.

- **Детерминированность**. Одним и тем же входным данным всегда должен соответствовать один и тот же результат. Это необходимо для надёжной работы хеш-таблицы.
- **Скорость**. Вычисление хеша должно занимать мало времени. Чем меньше вычислительные затраты, тем удобнее применять таблицу на практике.
- **Равномерное распределение**. Алгоритм должен равномерно распределять пары по корзинам. Чем равномернее распределение, тем ниже вероятность коллизий.

Хеширование применяют и во многих других областях.

- **Хранение паролей**. Чтобы защитить пароль пользователя, система обычно хранит его хеш, а не сам пароль в открытом виде. Когда пользователь вводит пароль, система вычисляет его хеш и сравнивает с сохранённым. При совпадении пароль считается верным.
- **Проверка целостности данных**. Отправитель может вычислить хеш данных и передать его вместе с ними. Получатель заново вычисляет хеш полученных данных и сравнивает его с присланным. Если хеши совпали, данные считаются целыми.

Для криптографических приложений нужны более строгие свойства безопасности, в частности чтобы по хешу нельзя было восстановить исходный пароль.

- **Односторонность**. По хешу нельзя восстановить никакой информации об исходных данных.
- **Стойкость к коллизиям**. Должно быть чрезвычайно трудно найти два разных входа с одинаковым хешем.
- **Лавинный эффект**. Небольшое изменение входных данных должно приводить к значительному и непредсказуемому изменению результата.

Обратите внимание: **равномерность распределения и стойкость к коллизиям — независимые свойства**. Первое не гарантирует второго. Например, при случайных входных значениях `key` функция `key % 100` может давать равномерно распределённый результат. Но алгоритм слишком прост: все `key` с одинаковыми последними двумя цифрами дают один результат. Поэтому по хешу легко подобрать подходящий `key` и тем самым взломать пароль.

## 6.3.2 &nbsp; Как устроены алгоритмы хеширования

При разработке алгоритмов хеширования приходится учитывать множество факторов. Однако для несложных задач можно придумать простые алгоритмы.

- **Аддитивное хеширование**. Складываем ASCII-коды всех символов и берём полученную сумму в качестве хеша.
- **Мультипликативное хеширование**. На каждом шаге умножаем накопленный хеш на константу и прибавляем ASCII-код очередного символа. Умножение помогает уменьшить корреляцию между вкладами символов.
- **Хеширование с помощью XOR**. Последовательно объединяем элементы входных данных операцией исключающего ИЛИ, накапливая результат в одном хеше.
- **Хеширование с циклическим сдвигом**. Накапливаем ASCII-коды символов в хеше, выполняя циклический сдвиг хеша перед добавлением очередного кода.

=== "Python"

    ```python title="simple_hash.py"
    def add_hash(key: str) -> int:
        """Аддитивное хеширование"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash += ord(c)
        return hash % modulus

    def mul_hash(key: str) -> int:
        """Мультипликативное хеширование"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = 31 * hash + ord(c)
        return hash % modulus

    def xor_hash(key: str) -> int:
        """Хеширование с помощью XOR"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash ^= ord(c)
        return hash % modulus

    def rot_hash(key: str) -> int:
        """Хеширование с циклическим сдвигом"""
        hash = 0
        modulus = 1000000007
        for c in key:
            hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
        return hash % modulus
    ```

=== "C++"

    ```cpp title="simple_hash.cpp"
    /* Аддитивное хеширование */
    int addHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* Мультипликативное хеширование */
    int mulHash(string key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash = (31 * hash + (int)c) % MODULUS;
        }
        return (int)hash;
    }

    /* Хеширование с помощью XOR */
    int xorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        for (unsigned char c : key) {
            hash ^= (int)c;
        }
        return hash & MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* Мультипликативное хеширование */
    int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* Хеширование с помощью XOR */
    int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* Мультипликативное хеширование */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* Хеширование с помощью XOR */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    func addHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* Мультипликативное хеширование */
    func mulHash(key string) int {
        var hash int64
        var modulus int64

        modulus = 1000000007
        for _, b := range []byte(key) {
            hash = (31*hash + int64(b)) % modulus
        }
        return int(hash)
    }

    /* Хеширование с помощью XOR */
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

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
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

    /* Мультипликативное хеширование */
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

    /* Хеширование с помощью XOR */
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

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    function addHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Мультипликативное хеширование */
    function mulHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Хеширование с помощью XOR */
    function xorHash(key) {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    function addHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Мультипликативное хеширование */
    function mulHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
        }
        return hash;
    }

    /* Хеширование с помощью XOR */
    function xorHash(key: string): number {
        let hash = 0;
        const MODULUS = 1000000007;
        for (const c of key) {
            hash ^= c.charCodeAt(0);
        }
        return hash % MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    int addHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* Мультипликативное хеширование */
    int mulHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
      }
      return hash;
    }

    /* Хеширование с помощью XOR */
    int xorHash(String key) {
      int hash = 0;
      final int MODULUS = 1000000007;
      for (int i = 0; i < key.length; i++) {
        hash ^= key.codeUnitAt(i);
      }
      return hash & MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    fn add_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* Мультипликативное хеширование */
    fn mul_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash = (31 * hash + c as i64) % MODULUS;
        }

        hash as i32
    }

    /* Хеширование с помощью XOR */
    fn xor_hash(key: &str) -> i32 {
        let mut hash = 0_i64;
        const MODULUS: i64 = 1000000007;

        for c in key.chars() {
            hash ^= c as i64;
        }

        (hash & MODULUS) as i32
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    int addHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* Мультипликативное хеширование */
    int mulHash(char *key) {
        long long hash = 0;
        const int MODULUS = 1000000007;
        for (int i = 0; i < strlen(key); i++) {
            hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
        }
        return (int)hash;
    }

    /* Хеширование с помощью XOR */
    int xorHash(char *key) {
        int hash = 0;
        const int MODULUS = 1000000007;

        for (int i = 0; i < strlen(key); i++) {
            hash ^= (unsigned char)key[i];
        }
        return hash & MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
    /* Аддитивное хеширование */
    fun addHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* Мультипликативное хеширование */
    fun mulHash(key: String): Int {
        var hash = 0L
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = (31 * hash + c.code) % MODULUS
        }
        return hash.toInt()
    }

    /* Хеширование с помощью XOR */
    fun xorHash(key: String): Int {
        var hash = 0
        val MODULUS = 1000000007
        for (c in key.toCharArray()) {
            hash = hash xor c.code
        }
        return hash and MODULUS
    }

    /* Хеширование с циклическим сдвигом */
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
    ### Аддитивное хеширование ###
    def add_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash += c.ord }

      hash % modulus
    end

    ### Мультипликативное хеширование ###
    def mul_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = 31 * hash + c.ord }

      hash % modulus
    end

    ### Хеширование с помощью XOR ###
    def xor_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash ^= c.ord }

      hash % modulus
    end

    ### Хеширование с циклическим сдвигом ###
    def rot_hash(key)
      hash = 0
      modulus = 1_000_000_007

      key.each_char { |c| hash = (hash << 4) ^ (hash >> 28) ^ c.ord }

      hash % modulus
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%90%D0%B4%D0%B4%D0%B8%D1%82%D0%B8%D0%B2%D0%BD%D0%BE%D0%B5%20%D1%85%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9C%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%BE%D0%B5%20%D1%85%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A5%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20XOR%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A5%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%BC%20%D1%81%D0%B4%D0%B2%D0%B8%D0%B3%D0%BE%D0%BC%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22%D0%90%D0%B4%D0%B4%D0%B8%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D1%85%D0%B5%D1%88%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22%D0%9C%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D1%85%D0%B5%D1%88%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BD%D0%B0%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B5%20XOR%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%81%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%BC%20%D1%81%D0%B4%D0%B2%D0%B8%D0%B3%D0%BE%D0%BC%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20add_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%90%D0%B4%D0%B4%D0%B8%D1%82%D0%B8%D0%B2%D0%BD%D0%BE%D0%B5%20%D1%85%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%2B%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20mul_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9C%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%BE%D0%B5%20%D1%85%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%2031%20%2A%20hash%20%2B%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20xor_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A5%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20XOR%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%5E%3D%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0Adef%20rot_hash%28key%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A5%D0%B5%D1%88%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%BC%20%D1%81%D0%B4%D0%B2%D0%B8%D0%B3%D0%BE%D0%BC%22%22%22%0A%20%20%20%20hash%20%3D%200%0A%20%20%20%20modulus%20%3D%201000000007%0A%20%20%20%20for%20c%20in%20key%3A%0A%20%20%20%20%20%20%20%20hash%20%3D%20%28hash%20%3C%3C%204%29%20%5E%20%28hash%20%3E%3E%2028%29%20%5E%20ord%28c%29%0A%20%20%20%20return%20hash%20%25%20modulus%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20key%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%0A%20%20%20%20hash%20%3D%20add_hash%28key%29%0A%20%20%20%20print%28f%22%D0%90%D0%B4%D0%B4%D0%B8%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D1%85%D0%B5%D1%88%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20mul_hash%28key%29%0A%20%20%20%20print%28f%22%D0%9C%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D1%85%D0%B5%D1%88%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20xor_hash%28key%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BD%D0%B0%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B5%20XOR%3A%20%7Bhash%7D%22%29%0A%0A%20%20%20%20hash%20%3D%20rot_hash%28key%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%81%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%BC%20%D1%81%D0%B4%D0%B2%D0%B8%D0%B3%D0%BE%D0%BC%3A%20%7Bhash%7D%22%29%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Во всех этих алгоритмах на последнем шаге берут остаток от деления на большое простое число $1000000007$. Так хеш попадает в нужный диапазон. Почему важно выбрать именно простое число? Чем хуже составной модуль?

Сначала сформулируем вывод: **большой простой модуль помогает добиться наиболее равномерного распределения хешей**. Поскольку у простого числа нет нетривиальных общих делителей с числами, не кратными ему, при взятии остатка реже возникают периодические закономерности, ведущие к коллизиям.

Предположим, модуль — составное число $9$. Оно делится на $3$, поэтому все кратные $3$ ключи `key` получат один из трёх хешей: $0$, $3$ или $6$.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

Если входные значения `key` образуют такую арифметическую прогрессию, хеши скапливаются в нескольких корзинах и коллизии учащаются. Теперь заменим `modulus` простым числом $13$. В этом примере отсутствие общего делителя больше единицы у `key` и `modulus` даёт заметно более равномерное распределение хешей.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

Если известно, что `key` распределены случайно и равномерно, модуль может быть как простым, так и составным: в обоих случаях хеши будут распределены равномерно. Но если в распределении `key` есть периодичность, при составном модуле скопления возникают легче.

Поэтому модулем обычно выбирают простое число, желательно достаточно большое. Так можно по возможности устранить периодические закономерности и сделать алгоритм надёжнее.

## 6.3.3 &nbsp; Распространённые алгоритмы хеширования

Описанные простые алгоритмы уязвимы и далеки от поставленных целей. Например, сложение и XOR коммутативны, поэтому ни аддитивное хеширование, ни хеширование с помощью XOR не различают строки, отличающиеся лишь порядком символов. Это может увеличить число коллизий и создать проблемы безопасности.

На практике часто используют стандартные алгоритмы, например MD5, SHA-1, SHA-2 и SHA-3. Они преобразуют входные данные произвольной длины в хеш фиксированной длины.

Уже почти столетие алгоритмы хеширования развиваются и совершенствуются. Одни исследователи стремятся повысить их производительность, другие исследователи и хакеры ищут уязвимости. В таблице приведены алгоритмы, часто встречающиеся на практике.

- Для MD5 и SHA-1 неоднократно демонстрировались успешные атаки, поэтому от этих алгоритмов отказались в приложениях, требующих криптографической защиты.
- SHA-256 из семейства SHA-2 считается одним из наиболее безопасных алгоритмов хеширования. Успешных атак на него пока не известно, поэтому он широко применяется в приложениях и протоколах защиты информации.
- По сравнению с SHA-2 у SHA-3 ниже затраты на реализацию и выше вычислительная эффективность, однако пока он распространён меньше, чем алгоритмы семейства SHA-2.

<p align="center"> Таблица 6-2 &nbsp; Распространённые алгоритмы хеширования </p>

<div class="center-table" markdown>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| Год появления | 1992                           | 1995             | 2002                         | 2008                |
| Длина хеша | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| Коллизии | Сравнительно много                           | Сравнительно много             | Очень мало                         | Очень мало                |
| Уровень безопасности | Низкий, известны успешные атаки               | Низкий, известны успешные атаки | Высокий                           | Высокий                  |
| Применение     | Больше не используется для защиты, но ещё применяется для проверки целостности данных | Выведен из употребления         | Проверка криптовалютных транзакций, цифровые подписи и др. | Может служить заменой SHA-2    |

</div>

## 6.3.4 &nbsp; Хеши структур данных

Мы уже знаем, что ключом `key` в хеш-таблице может служить целое или вещественное число, строка и данные других типов. Языки программирования обычно предоставляют для них встроенные алгоритмы хеширования, с помощью которых вычисляются индексы корзин. Например, в Python хеш значения того или иного типа можно получить функцией `hash()`.

- У целых чисел и логических значений хеш равен самому значению.
- Вычисление хеша чисел с плавающей точкой и строк устроено сложнее. Заинтересованный читатель может изучить его самостоятельно.
- Чтобы получить хеш кортежа, вычисляют хеш каждого элемента, а затем объединяют их в один хеш.
- Хеш объекта формируется на основе его адреса в памяти. Если переопределить метод хеширования, можно вычислять хеш по содержимому объекта.

!!! tip

    Встроенные функции хеширования в разных языках программирования определены и реализованы по-разному.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    print(f"Целое число {num} имеет хеш {hash_num}")
    # Целое число 3 имеет хеш 3

    bol = True
    hash_bol = hash(bol)
    print(f"Логическое значение {bol} имеет хеш {hash_bol}")
    # Логическое значение True имеет хеш 1

    dec = 3.14159
    hash_dec = hash(dec)
    print(f"Вещественное число {dec} имеет хеш {hash_dec}")
    # Вещественное число 3.14159 имеет хеш 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    print(f"Строка «{str}» имеет хеш {hash_str}")
    # Строка «Hello 算法» имеет хеш 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    print(f"Кортеж {tup} имеет хеш {hash_tup}")
    # Кортеж (12836, '小哈') имеет хеш 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    print(f"Объект узла {obj} имеет хеш {hash_obj}")
    # Объект узла <modules.list_node.ListNode object at 0x1058fd810> имеет хеш 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "Целое число " << num << " имеет хеш " << hashNum << "\n";
    // Целое число 3 имеет хеш 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Логическое значение " << bol << " имеет хеш " << hashBol << "\n";
    // Логическое значение 1 имеет хеш 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Вещественное число " << dec << " имеет хеш " << hashDec << "\n";
    // Вещественное число 3.14159 имеет хеш 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "Строка «" << str << "» имеет хеш " << hashStr << "\n";
    // Строка «Hello 算法» имеет хеш 15466937326284535026

    // В C++ встроенный шаблон std::hash() вычисляет хеши только для базовых типов и некоторых типов стандартной библиотеки (например, std::string)
    // Для массивов и объектов вычисление хеша нужно реализовать самостоятельно
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    System.out.println("Целое число " + num + " имеет хеш " + hashNum);
    // Целое число 3 имеет хеш 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    System.out.println("Логическое значение " + bol + " имеет хеш " + hashBol);
    // Логическое значение true имеет хеш 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    System.out.println("Вещественное число " + dec + " имеет хеш " + hashDec);
    // Вещественное число 3.14159 имеет хеш -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    System.out.println("Строка «" + str + "» имеет хеш " + hashStr);
    // Строка «Hello 算法» имеет хеш -727081396

    Object[] arr = { 12836, "小哈" };
    int hashArr = Arrays.hashCode(arr);
    System.out.println("Массив " + Arrays.toString(arr) + " имеет хеш " + hashArr);
    // Массив [12836, 小哈] имеет хеш 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    System.out.println("Объект узла " + obj + " имеет хеш " + hashObj);
    // Объект узла utils.ListNode@7dc5e7b4 имеет хеш 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    Console.WriteLine("Целое число " + num + " имеет хеш " + hashNum);
    // Целое число 3 имеет хеш 3

    bool bol = true;
    int hashBol = bol.GetHashCode();
    Console.WriteLine("Логическое значение " + bol + " имеет хеш " + hashBol);
    // Логическое значение True имеет хеш 1

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    Console.WriteLine("Вещественное число " + dec + " имеет хеш " + hashDec);
    // Вещественное число 3.14159 имеет хеш -1340954729

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    Console.WriteLine("Строка «" + str + "» имеет хеш " + hashStr);
    // Строка «Hello 算法» имеет хеш -586107568

    object[] arr = [12836, "小哈"];
    int hashArr = arr.GetHashCode();
    Console.WriteLine("Массив [" + string.Join(", ", arr) + "] имеет хеш " + hashArr);
    // Массив [12836, 小哈] имеет хеш 42931033

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    Console.WriteLine("Объект узла " + obj + " имеет хеш " + hashObj);
    // Объект узла 0 имеет хеш 39053774
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // В Go нет встроенной функции вычисления хеша
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    print("Целое число \(num) имеет хеш \(hashNum)")
    // Целое число 3 имеет хеш 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    print("Логическое значение \(bol) имеет хеш \(hashBol)")
    // Логическое значение true имеет хеш -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    print("Вещественное число \(dec) имеет хеш \(hashDec)")
    // Вещественное число 3.14159 имеет хеш -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    print("Строка «\(str)» имеет хеш \(hashStr)")
    // Строка «Hello 算法» имеет хеш -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashArr = arr.hashValue
    print("Массив \(arr) имеет хеш \(hashArr)")
    // Массив [AnyHashable(12836), AnyHashable("小哈")] имеет хеш -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    print("Объект узла \(obj) имеет хеш \(hashObj)")
    // Объект узла utils.ListNode имеет хеш -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // В JavaScript нет встроенной функции вычисления хеша
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // В TypeScript нет встроенной функции вычисления хеша
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    print("Целое число $num имеет хеш $hashNum");
    // Целое число 3 имеет хеш 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    print("Логическое значение $bol имеет хеш $hashBol");
    // Логическое значение true имеет хеш 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    print("Вещественное число $dec имеет хеш $hashDec");
    // Вещественное число 3.14159 имеет хеш 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    print("Строка «$str» имеет хеш $hashStr");
    // Строка «Hello 算法» имеет хеш 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    print("Массив $arr имеет хеш $hashArr");
    // Массив [12836, 小哈] имеет хеш 976512528

    ListNode obj = ListNode(0);
    int hashObj = obj.hashCode;
    print("Объект узла $obj имеет хеш $hashObj");
    // Объект узла Instance of 'ListNode' имеет хеш 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("Целое число {} имеет хеш {}", num, hash_num);
    // Целое число 3 имеет хеш 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("Логическое значение {} имеет хеш {}", bol, hash_bol);
    // Логическое значение true имеет хеш 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("Вещественное число {} имеет хеш {}", dec, hash_dec);
    // Вещественное число 3.14159 имеет хеш 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("Строка «{}» имеет хеш {}", str, hash_str);
    // Строка «Hello 算法» имеет хеш 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("Кортеж {:?} имеет хеш {}", tup, hash_tup);
    // Кортеж (12836, "小哈") имеет хеш 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("Значение узла {:?} имеет хеш {}", node, hash_node);
    // Значение узла RefCell { value: ListNode { val: 42, next: None } } имеет хеш 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // В C нет встроенной функции вычисления хеша
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    println("Целое число $num имеет хеш $hashNum")
    // Целое число 3 имеет хеш 3

    val bol = true
    val hashBol = bol.hashCode()
    println("Логическое значение $bol имеет хеш $hashBol")
    // Логическое значение true имеет хеш 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    println("Вещественное число $dec имеет хеш $hashDec")
    // Вещественное число 3.14159 имеет хеш -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    println("Строка «$str» имеет хеш $hashStr")
    // Строка «Hello 算法» имеет хеш -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashArr = arr.contentHashCode()
    println("Массив ${arr.contentToString()} имеет хеш $hashArr")
    // Массив [12836, 小哈] имеет хеш 1151158

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    println("Объект узла $obj имеет хеш $hashObj")
    // Объект узла utils.ListNode@1d81eb93 имеет хеш 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    puts "Целое число #{num} имеет хеш #{hash_num}"
    # Целое число 3 имеет хеш -4385856518450339636

    bol = true
    hash_bol = bol.hash
    puts "Логическое значение #{bol} имеет хеш #{hash_bol}"
    # Логическое значение true имеет хеш -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    puts "Вещественное число #{dec} имеет хеш #{hash_dec}"
    # Вещественное число 3.14159 имеет хеш -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    puts "Строка «#{str}» имеет хеш #{hash_str}"
    # Строка «Hello 算法» имеет хеш -4075943250025831763

    arr = [12836, '小哈']
    hash_arr = arr.hash
    puts "Массив #{arr} имеет хеш #{hash_arr}"
    # Массив [12836, "小哈"] имеет хеш 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    puts "Объект узла #{obj} имеет хеш #{hash_obj}"
    # Объект узла #<ListNode:0x000078133140ab70> имеет хеш 4302940560806366381
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bnum%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%7Bbol%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20True%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bdec%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203.14159%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%AB%7Bstr%7D%C2%BB%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%ABHello%20%E7%AE%97%E6%B3%95%C2%BB%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%7Btup%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%7Bobj%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20274267521%0A&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bnum%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%7Bbol%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20True%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bdec%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203.14159%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%AB%7Bstr%7D%C2%BB%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%ABHello%20%E7%AE%97%E6%B3%95%C2%BB%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%7Btup%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%7Bobj%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20274267521%0A&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=19&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Во многих языках программирования **ключом `key` хеш-таблицы может служить только неизменяемый объект**. Представим, что в качестве `key` взяли список (динамический массив). Изменение его содержимого повлечёт изменение хеша, и найти прежнее значение `value` в таблице уже не удастся.

Поля пользовательского объекта, например узла связного списка, могут меняться, но сам объект при этом может быть хешируемым. **Дело в том, что хеш объекта обычно строится на основе адреса в памяти**. Содержимое меняется, а адрес остаётся прежним, поэтому сохраняется и хеш.

Вы могли заметить, что при запуске программы в разных сеансах консоли хеши различаются. **При каждом запуске интерпретатор Python добавляет в вычисление хеша строк случайное значение — соль (salt)**. Это помогает предотвращать атаки HashDoS и повышает безопасность хеширования.
