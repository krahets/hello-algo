---
comments: true
---

# 6.2 &nbsp; Хеш-коллизии

Как уже говорилось в предыдущем разделе, **в обычных условиях входное пространство хеш-функции намного больше выходного пространства** , поэтому теоретически хеш-коллизии неизбежны. Например, если входное пространство состоит из всех целых чисел, а выходное пространство ограничено размером массива, то неизбежно несколько целых чисел будут отображаться в один и тот же индекс бакета.

Хеш-коллизии приводят к ошибочным результатам поиска и серьезно влияют на пригодность хеш-таблицы к использованию. Чтобы решить эту проблему, можно при каждом конфликте выполнять расширение хеш-таблицы, пока конфликт не исчезнет. Этот метод прост и груб, но слишком неэффективен, потому что расширение хеш-таблицы требует большого объема переноса данных и вычислений хеш-значений. Чтобы повысить эффективность, можно использовать следующие стратегии.

1. Улучшить структуру данных хеш-таблицы, **чтобы она могла корректно работать даже при возникновении хеш-коллизий**.
2. Выполнять расширение только тогда, когда это действительно необходимо, то есть когда хеш-коллизии становятся достаточно серьезными.

Основные способы улучшения структуры хеш-таблицы включают "метод цепочек" и "открытую адресацию".

## 6.2.1 &nbsp; Метод цепочек

В исходной хеш-таблице каждый бакет может хранить только одну пару ключ-значение. <u>Метод цепочек (separate chaining)</u> превращает отдельный элемент в связный список: пары ключ-значение становятся узлами списка, и все конфликтующие пары ключ-значение хранятся в одном и том же списке. На рисунке 6-5 показан пример хеш-таблицы, реализованной методом цепочек.

![Хеш-таблица с методом цепочек](hash_collision.assets/hash_table_chaining.png){ class="animation-figure" }

<p align="center"> Рисунок 6-5 &nbsp; Хеш-таблица с методом цепочек </p>

Методы работы с хеш-таблицей, построенной на основе метода цепочек, меняются следующим образом.

- **Поиск элемента**: передаем `key` , по хеш-функции получаем индекс бакета, после чего обращаемся к голове списка и обходим список, сравнивая `key` , пока не найдем целевую пару ключ-значение.
- **Добавление элемента**: сначала через хеш-функцию получаем голову списка, затем добавляем узел (пару ключ-значение) в этот список.
- **Удаление элемента**: по результату хеш-функции обращаемся к голове списка, затем обходим список, находим целевой узел и удаляем его.

Метод цепочек имеет следующие ограничения.

- **Рост потребления памяти**: связный список содержит указатели на узлы, поэтому по сравнению с массивом он требует больше памяти.
- **Снижение эффективности поиска**: для нахождения нужного элемента нужно линейно обходить связный список.

Ниже приведена простая реализация хеш-таблицы методом цепочек. Следует обратить внимание на два момента.

- Для упрощения кода вместо связного списка используется список (динамический массив). В этой реализации хеш-таблица (массив) содержит несколько бакетов, и каждый бакет представляет собой список.
- Ниже включен метод расширения хеш-таблицы. Когда коэффициент загрузки превышает $\frac{2}{3}$ , мы расширяем хеш-таблицу до $2$ раз от прежней емкости.

=== "Python"

    ```python title="hash_map_chaining.py"
    class HashMapChaining:
        """Хеш-таблица с цепочками"""

        def __init__(self):
            """Конструктор"""
            self.size = 0  # Число пар ключ-значение
            self.capacity = 4  # Вместимость хеш-таблицы
            self.load_thres = 2.0 / 3.0  # Порог коэффициента загрузки для запуска расширения
            self.extend_ratio = 2  # Коэффициент расширения
            self.buckets = [[] for _ in range(self.capacity)]  # Массив корзин

        def hash_func(self, key: int) -> int:
            """Хеш-функция"""
            return key % self.capacity

        def load_factor(self) -> float:
            """Коэффициент загрузки"""
            return self.size / self.capacity

        def get(self, key: int) -> str | None:
            """Операция поиска"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Обойти корзину; если найден key, вернуть соответствующее val
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # Если key не найден, вернуть None
            return None

        def put(self, key: int, val: str):
            """Операция добавления"""
            # Когда коэффициент загрузки превышает порог, выполнить расширение
            if self.load_factor() > self.load_thres:
                self.extend()
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for pair in bucket:
                if pair.key == key:
                    pair.val = val
                    return
            # Если такого key нет, добавить пару ключ-значение в конец
            pair = Pair(key, val)
            bucket.append(pair)
            self.size += 1

        def remove(self, key: int):
            """Операция удаления"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Обойти корзину и удалить из нее пару ключ-значение
            for pair in bucket:
                if pair.key == key:
                    bucket.remove(pair)
                    self.size -= 1
                    break

        def extend(self):
            """Расширить хеш-таблицу"""
            # Временно сохранить исходную хеш-таблицу
            buckets = self.buckets
            # Инициализация новой хеш-таблицы после расширения
            self.capacity *= self.extend_ratio
            self.buckets = [[] for _ in range(self.capacity)]
            self.size = 0
            # Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for bucket in buckets:
                for pair in bucket:
                    self.put(pair.key, pair.val)

        def print(self):
            """Вывести хеш-таблицу"""
            for bucket in self.buckets:
                res = []
                for pair in bucket:
                    res.append(str(pair.key) + " -> " + pair.val)
                print(res)
    ```

=== "C++"

    ```cpp title="hash_map_chaining.cpp"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
      private:
        int size;                       // Число пар ключ-значение
        int capacity;                   // Вместимость хеш-таблицы
        double loadThres;               // Порог коэффициента загрузки для запуска расширения
        int extendRatio;                // Коэффициент расширения
        vector<vector<Pair *>> buckets; // Массив корзин

      public:
        /* Конструктор */
        HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
            buckets.resize(capacity);
        }

        /* Метод-деструктор */
        ~HashMapChaining() {
            for (auto &bucket : buckets) {
                for (Pair *pair : bucket) {
                    // Освободить память
                    delete pair;
                }
            }
        }

        /* Хеш-функция */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* Коэффициент загрузки */
        double loadFactor() {
            return (double)size / (double)capacity;
        }

        /* Операция поиска */
        string get(int key) {
            int index = hashFunc(key);
            // Обойти корзину; если найден key, вернуть соответствующее val
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    return pair->val;
                }
            }
            // Если key не найден, вернуть пустую строку
            return "";
        }

        /* Операция добавления */
        void put(int key, string val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    pair->val = val;
                    return;
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            buckets[index].push_back(new Pair(key, val));
            size++;
        }

        /* Операция удаления */
        void remove(int key) {
            int index = hashFunc(key);
            auto &bucket = buckets[index];
            // Обойти корзину и удалить из нее пару ключ-значение
            for (int i = 0; i < bucket.size(); i++) {
                if (bucket[i]->key == key) {
                    Pair *tmp = bucket[i];
                    bucket.erase(bucket.begin() + i); // Удалить из него пару ключ-значение
                    delete tmp;                       // Освободить память
                    size--;
                    return;
                }
            }
        }

        /* Расширить хеш-таблицу */
        void extend() {
            // Временно сохранить исходную хеш-таблицу
            vector<vector<Pair *>> bucketsTmp = buckets;
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio;
            buckets.clear();
            buckets.resize(capacity);
            size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (auto &bucket : bucketsTmp) {
                for (Pair *pair : bucket) {
                    put(pair->key, pair->val);
                    // Освободить память
                    delete pair;
                }
            }
        }

        /* Вывести хеш-таблицу */
        void print() {
            for (auto &bucket : buckets) {
                cout << "[";
                for (Pair *pair : bucket) {
                    cout << pair->key << " -> " << pair->val << ", ";
                }
                cout << "]\n";
            }
        }
    };
    ```

=== "Java"

    ```java title="hash_map_chaining.java"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
        int size; // Число пар ключ-значение
        int capacity; // Вместимость хеш-таблицы
        double loadThres; // Порог коэффициента загрузки для запуска расширения
        int extendRatio; // Коэффициент расширения
        List<List<Pair>> buckets; // Массив корзин

        /* Конструктор */
        public HashMapChaining() {
            size = 0;
            capacity = 4;
            loadThres = 2.0 / 3.0;
            extendRatio = 2;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
        }

        /* Хеш-функция */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* Коэффициент загрузки */
        double loadFactor() {
            return (double) size / capacity;
        }

        /* Операция поиска */
        String get(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Обойти корзину; если найден key, вернуть соответствующее val
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // Если key не найден, вернуть null
            return null;
        }

        /* Операция добавления */
        void put(int key, String val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            Pair pair = new Pair(key, val);
            bucket.add(pair);
            size++;
        }

        /* Операция удаления */
        void remove(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Обойти корзину и удалить из нее пару ключ-значение
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    bucket.remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* Расширить хеш-таблицу */
        void extend() {
            // Временно сохранить исходную хеш-таблицу
            List<List<Pair>> bucketsTmp = buckets;
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
            size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (List<Pair> bucket : bucketsTmp) {
                for (Pair pair : bucket) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        void print() {
            for (List<Pair> bucket : buckets) {
                List<String> res = new ArrayList<>();
                for (Pair pair : bucket) {
                    res.add(pair.key + " -> " + pair.val);
                }
                System.out.println(res);
            }
        }
    }
    ```

=== "C#"

    ```csharp title="hash_map_chaining.cs"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
        int size; // Число пар ключ-значение
        int capacity; // Вместимость хеш-таблицы
        double loadThres; // Порог коэффициента загрузки для запуска расширения
        int extendRatio; // Коэффициент расширения
        List<List<Pair>> buckets; // Массив корзин

        /* Конструктор */
        public HashMapChaining() {
            size = 0;
            capacity = 4;
            loadThres = 2.0 / 3.0;
            extendRatio = 2;
            buckets = new List<List<Pair>>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.Add([]);
            }
        }

        /* Хеш-функция */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* Коэффициент загрузки */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* Операция поиска */
        public string? Get(int key) {
            int index = HashFunc(key);
            // Обойти корзину; если найден key, вернуть соответствующее val
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // Если key не найден, вернуть null
            return null;
        }

        /* Операция добавления */
        public void Put(int key, string val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (LoadFactor() > loadThres) {
                Extend();
            }
            int index = HashFunc(key);
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            buckets[index].Add(new Pair(key, val));
            size++;
        }

        /* Операция удаления */
        public void Remove(int key) {
            int index = HashFunc(key);
            // Обойти корзину и удалить из нее пару ключ-значение
            foreach (Pair pair in buckets[index].ToList()) {
                if (pair.key == key) {
                    buckets[index].Remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* Расширить хеш-таблицу */
        void Extend() {
            // Временно сохранить исходную хеш-таблицу
            List<List<Pair>> bucketsTmp = buckets;
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio;
            buckets = new List<List<Pair>>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.Add([]);
            }
            size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            foreach (List<Pair> bucket in bucketsTmp) {
                foreach (Pair pair in bucket) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        public void Print() {
            foreach (List<Pair> bucket in buckets) {
                List<string> res = [];
                foreach (Pair pair in bucket) {
                    res.Add(pair.key + " -> " + pair.val);
                }
                foreach (string kv in res) {
                    Console.WriteLine(kv);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="hash_map_chaining.go"
    /* Хеш-таблица с цепочками */
    type hashMapChaining struct {
        size        int      // Число пар ключ-значение
        capacity    int      // Вместимость хеш-таблицы
        loadThres   float64  // Порог коэффициента загрузки для запуска расширения
        extendRatio int      // Коэффициент расширения
        buckets     [][]pair // Массив корзин
    }

    /* Конструктор */
    func newHashMapChaining() *hashMapChaining {
        buckets := make([][]pair, 4)
        for i := 0; i < 4; i++ {
            buckets[i] = make([]pair, 0)
        }
        return &hashMapChaining{
            size:        0,
            capacity:    4,
            loadThres:   2.0 / 3.0,
            extendRatio: 2,
            buckets:     buckets,
        }
    }

    /* Хеш-функция */
    func (m *hashMapChaining) hashFunc(key int) int {
        return key % m.capacity
    }

    /* Коэффициент загрузки */
    func (m *hashMapChaining) loadFactor() float64 {
        return float64(m.size) / float64(m.capacity)
    }

    /* Операция поиска */
    func (m *hashMapChaining) get(key int) string {
        idx := m.hashFunc(key)
        bucket := m.buckets[idx]
        // Обойти корзину; если найден key, вернуть соответствующее val
        for _, p := range bucket {
            if p.key == key {
                return p.val
            }
        }
        // Если key не найден, вернуть пустую строку
        return ""
    }

    /* Операция добавления */
    func (m *hashMapChaining) put(key int, val string) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if m.loadFactor() > m.loadThres {
            m.extend()
        }
        idx := m.hashFunc(key)
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        for i := range m.buckets[idx] {
            if m.buckets[idx][i].key == key {
                m.buckets[idx][i].val = val
                return
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        p := pair{
            key: key,
            val: val,
        }
        m.buckets[idx] = append(m.buckets[idx], p)
        m.size += 1
    }

    /* Операция удаления */
    func (m *hashMapChaining) remove(key int) {
        idx := m.hashFunc(key)
        // Обойти корзину и удалить из нее пару ключ-значение
        for i, p := range m.buckets[idx] {
            if p.key == key {
                // Удаление из среза
                m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
                m.size -= 1
                break
            }
        }
    }

    /* Расширить хеш-таблицу */
    func (m *hashMapChaining) extend() {
        // Временно сохранить исходную хеш-таблицу
        tmpBuckets := make([][]pair, len(m.buckets))
        for i := 0; i < len(m.buckets); i++ {
            tmpBuckets[i] = make([]pair, len(m.buckets[i]))
            copy(tmpBuckets[i], m.buckets[i])
        }
        // Инициализация новой хеш-таблицы после расширения
        m.capacity *= m.extendRatio
        m.buckets = make([][]pair, m.capacity)
        for i := 0; i < m.capacity; i++ {
            m.buckets[i] = make([]pair, 0)
        }
        m.size = 0
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for _, bucket := range tmpBuckets {
            for _, p := range bucket {
                m.put(p.key, p.val)
            }
        }
    }

    /* Вывести хеш-таблицу */
    func (m *hashMapChaining) print() {
        var builder strings.Builder

        for _, bucket := range m.buckets {
            builder.WriteString("[")
            for _, p := range bucket {
                builder.WriteString(strconv.Itoa(p.key) + " -> " + p.val + " ")
            }
            builder.WriteString("]")
            fmt.Println(builder.String())
            builder.Reset()
        }
    }
    ```

=== "Swift"

    ```swift title="hash_map_chaining.swift"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
        var size: Int // Число пар ключ-значение
        var capacity: Int // Вместимость хеш-таблицы
        var loadThres: Double // Порог коэффициента загрузки для запуска расширения
        var extendRatio: Int // Коэффициент расширения
        var buckets: [[Pair]] // Массив корзин

        /* Конструктор */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: [], count: capacity)
        }

        /* Хеш-функция */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* Коэффициент загрузки */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* Операция поиска */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // Обойти корзину; если найден key, вернуть соответствующее val
            for pair in bucket {
                if pair.key == key {
                    return pair.val
                }
            }
            // Если key не найден, вернуть nil
            return nil
        }

        /* Операция добавления */
        func put(key: Int, val: String) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if loadFactor() > loadThres {
                extend()
            }
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for pair in bucket {
                if pair.key == key {
                    pair.val = val
                    return
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            let pair = Pair(key: key, val: val)
            buckets[index].append(pair)
            size += 1
        }

        /* Операция удаления */
        func remove(key: Int) {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // Обойти корзину и удалить из нее пару ключ-значение
            for (pairIndex, pair) in bucket.enumerated() {
                if pair.key == key {
                    buckets[index].remove(at: pairIndex)
                    size -= 1
                    break
                }
            }
        }

        /* Расширить хеш-таблицу */
        func extend() {
            // Временно сохранить исходную хеш-таблицу
            let bucketsTmp = buckets
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio
            buckets = Array(repeating: [], count: capacity)
            size = 0
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for bucket in bucketsTmp {
                for pair in bucket {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* Вывести хеш-таблицу */
        func print() {
            for bucket in buckets {
                let res = bucket.map { "\($0.key) -> \($0.val)" }
                Swift.print(res)
            }
        }
    }
    ```

=== "JS"

    ```javascript title="hash_map_chaining.js"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
        #size; // Число пар ключ-значение
        #capacity; // Вместимость хеш-таблицы
        #loadThres; // Порог коэффициента загрузки для запуска расширения
        #extendRatio; // Коэффициент расширения
        #buckets; // Массив корзин

        /* Конструктор */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* Хеш-функция */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* Коэффициент загрузки */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* Операция поиска */
        get(key) {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Обойти корзину; если найден key, вернуть соответствующее val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // Если key не найден, вернуть null
            return null;
        }

        /* Операция добавления */
        put(key, val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* Операция удаления */
        remove(key) {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // Обойти корзину и удалить из нее пару ключ-значение
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* Расширить хеш-таблицу */
        #extend() {
            // Временно сохранить исходную хеш-таблицу
            const bucketsTmp = this.#buckets;
            // Инициализация новой хеш-таблицы после расширения
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        print() {
            for (const bucket of this.#buckets) {
                let res = [];
                for (const pair of bucket) {
                    res.push(pair.key + ' -> ' + pair.val);
                }
                console.log(res);
            }
        }
    }
    ```

=== "TS"

    ```typescript title="hash_map_chaining.ts"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
        #size: number; // Число пар ключ-значение
        #capacity: number; // Вместимость хеш-таблицы
        #loadThres: number; // Порог коэффициента загрузки для запуска расширения
        #extendRatio: number; // Коэффициент расширения
        #buckets: Pair[][]; // Массив корзин

        /* Конструктор */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* Хеш-функция */
        #hashFunc(key: number): number {
            return key % this.#capacity;
        }

        /* Коэффициент загрузки */
        #loadFactor(): number {
            return this.#size / this.#capacity;
        }

        /* Операция поиска */
        get(key: number): string | null {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Обойти корзину; если найден key, вернуть соответствующее val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // Если key не найден, вернуть null
            return null;
        }

        /* Операция добавления */
        put(key: number, val: string): void {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* Операция удаления */
        remove(key: number): void {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // Обойти корзину и удалить из нее пару ключ-значение
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* Расширить хеш-таблицу */
        #extend(): void {
            // Временно сохранить исходную хеш-таблицу
            const bucketsTmp = this.#buckets;
            // Инициализация новой хеш-таблицы после расширения
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        print(): void {
            for (const bucket of this.#buckets) {
                let res = [];
                for (const pair of bucket) {
                    res.push(pair.key + ' -> ' + pair.val);
                }
                console.log(res);
            }
        }
    }
    ```

=== "Dart"

    ```dart title="hash_map_chaining.dart"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
      late int size; // Число пар ключ-значение
      late int capacity; // Вместимость хеш-таблицы
      late double loadThres; // Порог коэффициента загрузки для запуска расширения
      late int extendRatio; // Коэффициент расширения
      late List<List<Pair>> buckets; // Массив корзин

      /* Конструктор */
      HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = List.generate(capacity, (_) => []);
      }

      /* Хеш-функция */
      int hashFunc(int key) {
        return key % capacity;
      }

      /* Коэффициент загрузки */
      double loadFactor() {
        return size / capacity;
      }

      /* Операция поиска */
      String? get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // Обойти корзину; если найден key, вернуть соответствующее val
        for (Pair pair in bucket) {
          if (pair.key == key) {
            return pair.val;
          }
        }
        // Если key не найден, вернуть null
        return null;
      }

      /* Операция добавления */
      void put(int key, String val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
          extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        for (Pair pair in bucket) {
          if (pair.key == key) {
            pair.val = val;
            return;
          }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        Pair pair = Pair(key, val);
        bucket.add(pair);
        size++;
      }

      /* Операция удаления */
      void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // Обойти корзину и удалить из нее пару ключ-значение
        for (Pair pair in bucket) {
          if (pair.key == key) {
            bucket.remove(pair);
            size--;
            break;
          }
        }
      }

      /* Расширить хеш-таблицу */
      void extend() {
        // Временно сохранить исходную хеш-таблицу
        List<List<Pair>> bucketsTmp = buckets;
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio;
        buckets = List.generate(capacity, (_) => []);
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (List<Pair> bucket in bucketsTmp) {
          for (Pair pair in bucket) {
            put(pair.key, pair.val);
          }
        }
      }

      /* Вывести хеш-таблицу */
      void printHashMap() {
        for (List<Pair> bucket in buckets) {
          List<String> res = [];
          for (Pair pair in bucket) {
            res.add("${pair.key} -> ${pair.val}");
          }
          print(res);
        }
      }
    }
    ```

=== "Rust"

    ```rust title="hash_map_chaining.rs"
    /* Хеш-таблица с цепочками */
    struct HashMapChaining {
        size: usize,
        capacity: usize,
        load_thres: f32,
        extend_ratio: usize,
        buckets: Vec<Vec<Pair>>,
    }

    impl HashMapChaining {
        /* Конструктор */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![vec![]; 4],
            }
        }

        /* Хеш-функция */
        fn hash_func(&self, key: i32) -> usize {
            key as usize % self.capacity
        }

        /* Коэффициент загрузки */
        fn load_factor(&self) -> f32 {
            self.size as f32 / self.capacity as f32
        }

        /* Операция удаления */
        fn remove(&mut self, key: i32) -> Option<String> {
            let index = self.hash_func(key);

            // Обойти корзину и удалить из нее пару ключ-значение
            for (i, p) in self.buckets[index].iter_mut().enumerate() {
                if p.key == key {
                    let pair = self.buckets[index].remove(i);
                    self.size -= 1;
                    return Some(pair.val);
                }
            }

            // Если key не найден, вернуть None
            None
        }

        /* Расширить хеш-таблицу */
        fn extend(&mut self) {
            // Временно сохранить исходную хеш-таблицу
            let buckets_tmp = std::mem::take(&mut self.buckets);

            // Инициализация новой хеш-таблицы после расширения
            self.capacity *= self.extend_ratio;
            self.buckets = vec![Vec::new(); self.capacity as usize];
            self.size = 0;

            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for bucket in buckets_tmp {
                for pair in bucket {
                    self.put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        fn print(&self) {
            for bucket in &self.buckets {
                let mut res = Vec::new();
                for pair in bucket {
                    res.push(format!("{} -> {}", pair.key, pair.val));
                }
                println!("{:?}", res);
            }
        }

        /* Операция добавления */
        fn put(&mut self, key: i32, val: String) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if self.load_factor() > self.load_thres {
                self.extend();
            }

            let index = self.hash_func(key);

            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for pair in self.buckets[index].iter_mut() {
                if pair.key == key {
                    pair.val = val;
                    return;
                }
            }

            // Если такого key нет, добавить пару ключ-значение в конец
            let pair = Pair { key, val };
            self.buckets[index].push(pair);
            self.size += 1;
        }

        /* Операция поиска */
        fn get(&self, key: i32) -> Option<&str> {
            let index = self.hash_func(key);

            // Обойти корзину; если найден key, вернуть соответствующее val
            for pair in self.buckets[index].iter() {
                if pair.key == key {
                    return Some(&pair.val);
                }
            }

            // Если key не найден, вернуть None
            None
        }
    }
    ```

=== "C"

    ```c title="hash_map_chaining.c"
    /* Узел связного списка */
    typedef struct Node {
        Pair *pair;
        struct Node *next;
    } Node;

    /* Хеш-таблица с цепочками */
    typedef struct {
        int size;         // Число пар ключ-значение
        int capacity;     // Вместимость хеш-таблицы
        double loadThres; // Порог коэффициента загрузки для запуска расширения
        int extendRatio;  // Коэффициент расширения
        Node **buckets;   // Массив корзин
    } HashMapChaining;

    /* Конструктор */
    HashMapChaining *newHashMapChaining() {
        HashMapChaining *hashMap = (HashMapChaining *)malloc(sizeof(HashMapChaining));
        hashMap->size = 0;
        hashMap->capacity = 4;
        hashMap->loadThres = 2.0 / 3.0;
        hashMap->extendRatio = 2;
        hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
        for (int i = 0; i < hashMap->capacity; i++) {
            hashMap->buckets[i] = NULL;
        }
        return hashMap;
    }

    /* Деструктор */
    void delHashMapChaining(HashMapChaining *hashMap) {
        for (int i = 0; i < hashMap->capacity; i++) {
            Node *cur = hashMap->buckets[i];
            while (cur) {
                Node *tmp = cur;
                cur = cur->next;
                free(tmp->pair);
                free(tmp);
            }
        }
        free(hashMap->buckets);
        free(hashMap);
    }

    /* Хеш-функция */
    int hashFunc(HashMapChaining *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* Коэффициент загрузки */
    double loadFactor(HashMapChaining *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* Операция поиска */
    char *get(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        // Обойти корзину; если найден key, вернуть соответствующее val
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                return cur->pair->val;
            }
            cur = cur->next;
        }
        return ""; // Если key не найден, вернуть пустую строку
    }

    /* Операция добавления */
    void put(HashMapChaining *hashMap, int key, const char *val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        int index = hashFunc(hashMap, key);
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                strcpy(cur->pair->val, val); // Если встретился указанный key, обновить соответствующий val и вернуть
                return;
            }
            cur = cur->next;
        }
        // Если такого key нет, добавить пару ключ-значение в голову связного списка
        Pair *newPair = (Pair *)malloc(sizeof(Pair));
        newPair->key = key;
        strcpy(newPair->val, val);
        Node *newNode = (Node *)malloc(sizeof(Node));
        newNode->pair = newPair;
        newNode->next = hashMap->buckets[index];
        hashMap->buckets[index] = newNode;
        hashMap->size++;
    }

    /* Расширить хеш-таблицу */
    void extend(HashMapChaining *hashMap) {
        // Временно сохранить исходную хеш-таблицу
        int oldCapacity = hashMap->capacity;
        Node **oldBuckets = hashMap->buckets;
        // Инициализация новой хеш-таблицы после расширения
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
        for (int i = 0; i < hashMap->capacity; i++) {
            hashMap->buckets[i] = NULL;
        }
        hashMap->size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (int i = 0; i < oldCapacity; i++) {
            Node *cur = oldBuckets[i];
            while (cur) {
                put(hashMap, cur->pair->key, cur->pair->val);
                Node *temp = cur;
                cur = cur->next;
                // Освободить память
                free(temp->pair);
                free(temp);
            }
        }

        free(oldBuckets);
    }

    /* Операция удаления */
    void removeItem(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        Node *cur = hashMap->buckets[index];
        Node *pre = NULL;
        while (cur) {
            if (cur->pair->key == key) {
                // Удалить из него пару ключ-значение
                if (pre) {
                    pre->next = cur->next;
                } else {
                    hashMap->buckets[index] = cur->next;
                }
                // Освободить память
                free(cur->pair);
                free(cur);
                hashMap->size--;
                return;
            }
            pre = cur;
            cur = cur->next;
        }
    }

    /* Вывести хеш-таблицу */
    void print(HashMapChaining *hashMap) {
        for (int i = 0; i < hashMap->capacity; i++) {
            Node *cur = hashMap->buckets[i];
            printf("[");
            while (cur) {
                printf("%d -> %s, ", cur->pair->key, cur->pair->val);
                cur = cur->next;
            }
            printf("]\n");
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="hash_map_chaining.kt"
    /* Хеш-таблица с цепочками */
    class HashMapChaining {
        var size: Int // Число пар ключ-значение
        var capacity: Int // Вместимость хеш-таблицы
        val loadThres: Double // Порог коэффициента загрузки для запуска расширения
        val extendRatio: Int // Коэффициент расширения
        var buckets: MutableList<MutableList<Pair>> // Массив корзин

        /* Конструктор */
        init {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = mutableListOf()
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
        }

        /* Хеш-функция */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* Коэффициент загрузки */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* Операция поиска */
        fun get(key: Int): String? {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // Обойти корзину; если найден key, вернуть соответствующее val
            for (pair in bucket) {
                if (pair.key == key) return pair._val
            }
            // Если key не найден, вернуть null
            return null
        }

        /* Операция добавления */
        fun put(key: Int, _val: String) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (loadFactor() > loadThres) {
                extend()
            }
            val index = hashFunc(key)
            val bucket = buckets[index]
            // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
            for (pair in bucket) {
                if (pair.key == key) {
                    pair._val = _val
                    return
                }
            }
            // Если такого key нет, добавить пару ключ-значение в конец
            val pair = Pair(key, _val)
            bucket.add(pair)
            size++
        }

        /* Операция удаления */
        fun remove(key: Int) {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // Обойти корзину и удалить из нее пару ключ-значение
            for (pair in bucket) {
                if (pair.key == key) {
                    bucket.remove(pair)
                    size--
                    break
                }
            }
        }

        /* Расширить хеш-таблицу */
        fun extend() {
            // Временно сохранить исходную хеш-таблицу
            val bucketsTmp = buckets
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio
            // mutablelist не имеет фиксированного размера
            buckets = mutableListOf()
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
            size = 0
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (bucket in bucketsTmp) {
                for (pair in bucket) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* Вывести хеш-таблицу */
        fun print() {
            for (bucket in buckets) {
                val res = mutableListOf<String>()
                for (pair in bucket) {
                    val k = pair.key
                    val v = pair._val
                    res.add("$k -> $v")
                }
                println(res)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="hash_map_chaining.rb"
    =begin
    File: hash_map_chaining.rb
    Created Time: 2024-04-13
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative './array_hash_map'

    # ## Хеш-таблица с цепочками ###
    class HashMapChaining
      # ## Конструктор ###
      def initialize
        @size = 0 # Число пар ключ-значение
        @capacity = 4 # Вместимость хеш-таблицы
        @load_thres = 2.0 / 3.0 # Порог коэффициента загрузки для запуска расширения
        @extend_ratio = 2 # Коэффициент расширения
        @buckets = Array.new(@capacity) { [] } # Массив корзин
      end

      # ## Хеш-функция ###
      def hash_func(key)
        key % @capacity
      end

      # ## Коэффициент загрузки ###
      def load_factor
        @size / @capacity
      end

      # ## Операция поиска ###
      def get(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # Обойти корзину; если найден key, вернуть соответствующее val
        for pair in bucket
          return pair.val if pair.key == key
        end
        # Если key не найден, вернуть nil
        nil
      end

      # ## Операция добавления ###
      def put(key, val)
        # Когда коэффициент загрузки превышает порог, выполнить расширение
        extend if load_factor > @load_thres
        index = hash_func(key)
        bucket = @buckets[index]
        # Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        for pair in bucket
          if pair.key == key
            pair.val = val
            return
          end
        end
        # Если такого key нет, добавить пару ключ-значение в конец
        pair = Pair.new(key, val)
        bucket << pair
        @size += 1
      end

      # ## Операция удаления ###
      def remove(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # Обойти корзину и удалить из нее пару ключ-значение
        for pair in bucket
          if pair.key == key
            bucket.delete(pair)
            @size -= 1
            break
          end
        end
      end

      # ## Расширение хеш-таблицы ###
      def extend
        # Временно сохранить исходную хеш-таблицу
        buckets = @buckets
        # Инициализация новой хеш-таблицы после расширения
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity) { [] }
        @size = 0
        # Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for bucket in buckets
          for pair in bucket
            put(pair.key, pair.val)
          end
        end
      end

      # ## Вывести хеш-таблицу ###
      def print
        for bucket in @buckets
          res = []
          for pair in bucket
            res << "#{pair.key} -> #{pair.val}"
          end
          pp res
        end
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20key%3A%20int%2C%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20%2F%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self%2C%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20return%20self.size%20%2F%20self.capacity%0A%0A%20%20%20%20def%20get%28self%2C%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self%2C%20key%3A%20int%2C%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key%2C%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key%2C%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%27%20-%3E%20%27%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%20%20%20%20hashmap.put%2812836%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%27%29%0A%20%20%20%20hashmap.put%2815937%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%9B%D0%BE%27%29%0A%20%20%20%20hashmap.put%2816750%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A1%D1%83%D0%B0%D0%BD%D1%8C%27%29%0A%20%20%20%20hashmap.put%2813276%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A4%D0%B0%27%29%0A%20%20%20%20hashmap.put%2810583%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%AF%27%29%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20key%3A%20int%2C%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20%2F%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self%2C%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20return%20self.size%20%2F%20self.capacity%0A%0A%20%20%20%20def%20get%28self%2C%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self%2C%20key%3A%20int%2C%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key%2C%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key%2C%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%27%20-%3E%20%27%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%20%20%20%20hashmap.put%2812836%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A5%D0%B0%27%29%0A%20%20%20%20hashmap.put%2815937%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%9B%D0%BE%27%29%0A%20%20%20%20hashmap.put%2816750%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A1%D1%83%D0%B0%D0%BD%D1%8C%27%29%0A%20%20%20%20hashmap.put%2813276%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%A4%D0%B0%27%29%0A%20%20%20%20hashmap.put%2810583%2C%20%27%D0%A1%D1%8F%D0%BE%20%D0%AF%27%29%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Следует отметить, что когда связный список становится очень длинным, эффективность поиска $O(n)$ оказывается низкой. **В этом случае список можно преобразовать в "AVL-дерево" или "красно-черное дерево"** , чтобы оптимизировать временную сложность поиска до $O(\log n)$ .

## 6.2.2 &nbsp; Открытая адресация

<u>Открытая адресация (open addressing)</u> не вводит дополнительных структур данных, а обрабатывает хеш-коллизии с помощью "многократного пробирования"; основные варианты пробирования включают линейное пробирование, квадратичное пробирование и повторное хеширование.

Ниже на примере линейного пробирования рассмотрим механизм работы хеш-таблицы с открытой адресацией.

### 1. &nbsp; Линейное пробирование

Линейное пробирование использует линейный поиск с фиксированным шагом. Его методы работы отличаются от обычной хеш-таблицы.

- **Вставка элемента**: по хеш-функции вычисляется индекс бакета; если бакет уже занят, то от места конфликта выполняется линейный обход вперед (шаг обычно равен $1$ ), пока не будет найден пустой бакет, после чего элемент вставляется туда.
- **Поиск элемента**: если возник конфликт, то с тем же шагом продолжается линейный обход вперед, пока не будет найден целевой элемент и возвращено `value` ; если встречается пустой бакет, это означает, что искомого элемента в хеш-таблице нет, и возвращается `None` .

На рисунке 6-6 показано распределение пар ключ-значение в хеш-таблице с открытой адресацией (линейное пробирование). Для этой хеш-функции все `key` с одинаковыми двумя последними цифрами отображаются в один и тот же бакет. Благодаря линейному пробированию они по очереди сохраняются в этом бакете и в следующих за ним бакетах.

![Распределение пар ключ-значение в хеш-таблице с открытой адресацией (линейное пробирование)](hash_collision.assets/hash_table_linear_probing.png){ class="animation-figure" }

<p align="center"> Рисунок 6-6 &nbsp; Распределение пар ключ-значение в хеш-таблице с открытой адресацией (линейное пробирование) </p>

Однако **линейное пробирование легко приводит к "кластеризации"**. Иначе говоря, чем длиннее непрерывная занятая область в массиве, тем выше вероятность новых коллизий в этой области, что еще сильнее способствует росту этой группы и в итоге ухудшает эффективность операций добавления, удаления, поиска и обновления.

Стоит заметить, что **мы не можем напрямую удалять элементы из хеш-таблицы с открытой адресацией**. Причина в том, что удаление создаст внутри массива пустой бакет `None` , а при поиске элемента линейное пробирование остановится на этом пустом бакете и вернет результат, из-за чего элементы ниже этого бакета уже не смогут быть найдены, и программа может ошибочно посчитать, что их не существует, как показано на рисунке 6-7.

![Проблема поиска после удаления элемента в открытой адресации](hash_collision.assets/hash_table_open_addressing_deletion.png){ class="animation-figure" }

<p align="center"> Рисунок 6-7 &nbsp; Проблема поиска после удаления элемента в открытой адресации </p>

Чтобы решить эту проблему, можно использовать механизм <u>ленивого удаления (lazy deletion)</u>: он не удаляет элемент из хеш-таблицы напрямую, **а помечает этот бакет специальной константой `TOMBSTONE` **. В этом механизме и `None` , и `TOMBSTONE` означают пустой бакет, и оба могут быть использованы для размещения пары ключ-значение. Но есть важное различие: при линейном пробировании, встретив `TOMBSTONE` , нужно продолжать обход, потому что ниже него все еще могут существовать пары ключ-значение.

Однако **ленивое удаление может ускорять деградацию производительности хеш-таблицы**. Это связано с тем, что каждая операция удаления создает новую метку удаления; по мере роста числа `TOMBSTONE` время поиска тоже увеличивается, потому что линейное пробирование может быть вынуждено перескакивать через множество `TOMBSTONE` , прежде чем найдет целевой элемент.

Поэтому имеет смысл при линейном пробировании запоминать индекс первого встреченного `TOMBSTONE` и затем менять найденный целевой элемент местами с этим `TOMBSTONE` . Преимущество такого подхода в том, что при каждом поиске или добавлении элемент будет перемещаться в бакет, расположенный ближе к его идеальной позиции (начальной точке пробирования), а значит, эффективность поиска улучшится.

Ниже приведена реализация хеш-таблицы с открытой адресацией (линейное пробирование), включающая ленивое удаление. Чтобы пространство хеш-таблицы использовалось более полно, мы рассматриваем ее как "кольцевой массив": когда обход выходит за конец массива, он возвращается к началу и продолжается.

=== "Python"

    ```python title="hash_map_open_addressing.py"
    class HashMapOpenAddressing:
        """Хеш-таблица с открытой адресацией"""

        def __init__(self):
            """Конструктор"""
            self.size = 0  # Число пар ключ-значение
            self.capacity = 4  # Вместимость хеш-таблицы
            self.load_thres = 2.0 / 3.0  # Порог коэффициента загрузки для запуска расширения
            self.extend_ratio = 2  # Коэффициент расширения
            self.buckets: list[Pair | None] = [None] * self.capacity  # Массив корзин
            self.TOMBSTONE = Pair(-1, "-1")  # Удалить метку

        def hash_func(self, key: int) -> int:
            """Хеш-функция"""
            return key % self.capacity

        def load_factor(self) -> float:
            """Коэффициент загрузки"""
            return self.size / self.capacity

        def find_bucket(self, key: int) -> int:
            """Найти индекс корзины, соответствующий key"""
            index = self.hash_func(key)
            first_tombstone = -1
            # Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while self.buckets[index] is not None:
                # Если встретился key, вернуть соответствующий индекс корзины
                if self.buckets[index].key == key:
                    # Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = self.buckets[index]
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # Вернуть индекс корзины после перемещения
                    return index  # Вернуть индекс корзины
                # Записать первую встретившуюся метку удаления
                if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                    first_tombstone = index
                # Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % self.capacity
            # Если key не существует, вернуть индекс точки добавления
            return index if first_tombstone == -1 else first_tombstone

        def get(self, key: int) -> str:
            """Операция поиска"""
            # Найти индекс корзины, соответствующий key
            index = self.find_bucket(key)
            # Если пара ключ-значение найдена, вернуть соответствующее val
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                return self.buckets[index].val
            # Если пара ключ-значение не существует, вернуть None
            return None

        def put(self, key: int, val: str):
            """Операция добавления"""
            # Когда коэффициент загрузки превышает порог, выполнить расширение
            if self.load_factor() > self.load_thres:
                self.extend()
            # Найти индекс корзины, соответствующий key
            index = self.find_bucket(key)
            # Если пара ключ-значение найдена, перезаписать val и вернуть
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index].val = val
                return
            # Если пары ключ-значение нет, добавить ее
            self.buckets[index] = Pair(key, val)
            self.size += 1

        def remove(self, key: int):
            """Операция удаления"""
            # Найти индекс корзины, соответствующий key
            index = self.find_bucket(key)
            # Если пара ключ-значение найдена, заменить ее меткой удаления
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index] = self.TOMBSTONE
                self.size -= 1

        def extend(self):
            """Расширить хеш-таблицу"""
            # Временно сохранить исходную хеш-таблицу
            buckets_tmp = self.buckets
            # Инициализация новой хеш-таблицы после расширения
            self.capacity *= self.extend_ratio
            self.buckets = [None] * self.capacity
            self.size = 0
            # Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for pair in buckets_tmp:
                if pair not in [None, self.TOMBSTONE]:
                    self.put(pair.key, pair.val)

        def print(self):
            """Вывести хеш-таблицу"""
            for pair in self.buckets:
                if pair is None:
                    print("None")
                elif pair is self.TOMBSTONE:
                    print("TOMBSTONE")
                else:
                    print(pair.key, "->", pair.val)
    ```

=== "C++"

    ```cpp title="hash_map_open_addressing.cpp"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
      private:
        int size;                             // Число пар ключ-значение
        int capacity = 4;                     // Вместимость хеш-таблицы
        const double loadThres = 2.0 / 3.0;     // Порог коэффициента загрузки для запуска расширения
        const int extendRatio = 2;            // Коэффициент расширения
        vector<Pair *> buckets;               // Массив корзин
        Pair *TOMBSTONE = new Pair(-1, "-1"); // Удалить метку

      public:
        /* Конструктор */
        HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
        }

        /* Метод-деструктор */
        ~HashMapOpenAddressing() {
            for (Pair *pair : buckets) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    delete pair;
                }
            }
            delete TOMBSTONE;
        }

        /* Хеш-функция */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* Коэффициент загрузки */
        double loadFactor() {
            return (double)size / capacity;
        }

        /* Найти индекс корзины, соответствующий key */
        int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while (buckets[index] != nullptr) {
                // Если встретился key, вернуть соответствующий индекс корзины
                if (buckets[index]->key == key) {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Вернуть индекс корзины после перемещения
                    }
                    return index; // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % capacity;
            }
            // Если key не существует, вернуть индекс точки добавления
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Операция поиска */
        string get(int key) {
            // Найти индекс корзины, соответствующий key
            int index = findBucket(key);
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                return buckets[index]->val;
            }
            // Если пары ключ-значение не существует, вернуть пустую строку
            return "";
        }

        /* Операция добавления */
        void put(int key, string val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (loadFactor() > loadThres) {
                extend();
            }
            // Найти индекс корзины, соответствующий key
            int index = findBucket(key);
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                buckets[index]->val = val;
                return;
            }
            // Если пары ключ-значение нет, добавить ее
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Операция удаления */
        void remove(int key) {
            // Найти индекс корзины, соответствующий key
            int index = findBucket(key);
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                delete buckets[index];
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Расширить хеш-таблицу */
        void extend() {
            // Временно сохранить исходную хеш-таблицу
            vector<Pair *> bucketsTmp = buckets;
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio;
            buckets = vector<Pair *>(capacity, nullptr);
            size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (Pair *pair : bucketsTmp) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    put(pair->key, pair->val);
                    delete pair;
                }
            }
        }

        /* Вывести хеш-таблицу */
        void print() {
            for (Pair *pair : buckets) {
                if (pair == nullptr) {
                    cout << "nullptr" << endl;
                } else if (pair == TOMBSTONE) {
                    cout << "TOMBSTONE" << endl;
                } else {
                    cout << pair->key << " -> " << pair->val << endl;
                }
            }
        }
    };
    ```

=== "Java"

    ```java title="hash_map_open_addressing.java"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
        private int size; // Число пар ключ-значение
        private int capacity = 4; // Вместимость хеш-таблицы
        private final double loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
        private final int extendRatio = 2; // Коэффициент расширения
        private Pair[] buckets; // Массив корзин
        private final Pair TOMBSTONE = new Pair(-1, "-1"); // Удалить метку

        /* Конструктор */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* Хеш-функция */
        private int hashFunc(int key) {
            return key % capacity;
        }

        /* Коэффициент загрузки */
        private double loadFactor() {
            return (double) size / capacity;
        }

        /* Найти индекс корзины, соответствующий key */
        private int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while (buckets[index] != null) {
                // Если встретился key, вернуть соответствующий индекс корзины
                if (buckets[index].key == key) {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Вернуть индекс корзины после перемещения
                    }
                    return index; // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % capacity;
            }
            // Если key не существует, вернуть индекс точки добавления
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Операция поиска */
        public String get(int key) {
            // Найти индекс корзины, соответствующий key
            int index = findBucket(key);
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // Если пары ключ-значение не существует, вернуть null
            return null;
        }

        /* Операция добавления */
        public void put(int key, String val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (loadFactor() > loadThres) {
                extend();
            }
            // Найти индекс корзины, соответствующий key
            int index = findBucket(key);
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // Если пары ключ-значение нет, добавить ее
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Операция удаления */
        public void remove(int key) {
            // Найти индекс корзины, соответствующий key
            int index = findBucket(key);
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Расширить хеш-таблицу */
        private void extend() {
            // Временно сохранить исходную хеш-таблицу
            Pair[] bucketsTmp = buckets;
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (Pair pair : bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        public void print() {
            for (Pair pair : buckets) {
                if (pair == null) {
                    System.out.println("null");
                } else if (pair == TOMBSTONE) {
                    System.out.println("TOMBSTONE");
                } else {
                    System.out.println(pair.key + " -> " + pair.val);
                }
            }
        }
    }
    ```

=== "C#"

    ```csharp title="hash_map_open_addressing.cs"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
        int size; // Число пар ключ-значение
        int capacity = 4; // Вместимость хеш-таблицы
        double loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
        int extendRatio = 2; // Коэффициент расширения
        Pair[] buckets; // Массив корзин
        Pair TOMBSTONE = new(-1, "-1"); // Удалить метку

        /* Конструктор */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* Хеш-функция */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* Коэффициент загрузки */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* Найти индекс корзины, соответствующий key */
        int FindBucket(int key) {
            int index = HashFunc(key);
            int firstTombstone = -1;
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while (buckets[index] != null) {
                // Если встретился key, вернуть соответствующий индекс корзины
                if (buckets[index].key == key) {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Вернуть индекс корзины после перемещения
                    }
                    return index; // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % capacity;
            }
            // Если key не существует, вернуть индекс точки добавления
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Операция поиска */
        public string? Get(int key) {
            // Найти индекс корзины, соответствующий key
            int index = FindBucket(key);
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // Если пары ключ-значение не существует, вернуть null
            return null;
        }

        /* Операция добавления */
        public void Put(int key, string val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (LoadFactor() > loadThres) {
                Extend();
            }
            // Найти индекс корзины, соответствующий key
            int index = FindBucket(key);
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // Если пары ключ-значение нет, добавить ее
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Операция удаления */
        public void Remove(int key) {
            // Найти индекс корзины, соответствующий key
            int index = FindBucket(key);
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Расширить хеш-таблицу */
        void Extend() {
            // Временно сохранить исходную хеш-таблицу
            Pair[] bucketsTmp = buckets;
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            foreach (Pair pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        public void Print() {
            foreach (Pair pair in buckets) {
                if (pair == null) {
                    Console.WriteLine("null");
                } else if (pair == TOMBSTONE) {
                    Console.WriteLine("TOMBSTONE");
                } else {
                    Console.WriteLine(pair.key + " -> " + pair.val);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="hash_map_open_addressing.go"
    /* Хеш-таблица с открытой адресацией */
    type hashMapOpenAddressing struct {
        size        int     // Число пар ключ-значение
        capacity    int     // Вместимость хеш-таблицы
        loadThres   float64 // Порог коэффициента загрузки для запуска расширения
        extendRatio int     // Коэффициент расширения
        buckets     []*pair // Массив корзин
        TOMBSTONE   *pair   // Удалить метку
    }

    /* Конструктор */
    func newHashMapOpenAddressing() *hashMapOpenAddressing {
        return &hashMapOpenAddressing{
            size:        0,
            capacity:    4,
            loadThres:   2.0 / 3.0,
            extendRatio: 2,
            buckets:     make([]*pair, 4),
            TOMBSTONE:   &pair{-1, "-1"},
        }
    }

    /* Хеш-функция */
    func (h *hashMapOpenAddressing) hashFunc(key int) int {
        return key % h.capacity // Вычислить хеш-значение по ключу
    }

    /* Коэффициент загрузки */
    func (h *hashMapOpenAddressing) loadFactor() float64 {
        return float64(h.size) / float64(h.capacity) // Вычислить текущий коэффициент загрузки
    }

    /* Найти индекс корзины, соответствующий key */
    func (h *hashMapOpenAddressing) findBucket(key int) int {
        index := h.hashFunc(key) // Получить начальный индекс
        firstTombstone := -1     // Запомнить положение первого TOMBSTONE
        for h.buckets[index] != nil {
            if h.buckets[index].key == key {
                if firstTombstone != -1 {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    h.buckets[firstTombstone] = h.buckets[index]
                    h.buckets[index] = h.TOMBSTONE
                    return firstTombstone // Вернуть индекс корзины после перемещения
                }
                return index // Вернуть найденный индекс
            }
            if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
                firstTombstone = index // Запомнить положение первой метки удаления
            }
            index = (index + 1) % h.capacity // Линейное пробирование: при выходе за хвост вернуться к началу
        }
        // Если key не существует, вернуть индекс точки добавления
        if firstTombstone != -1 {
            return firstTombstone
        }
        return index
    }

    /* Операция поиска */
    func (h *hashMapOpenAddressing) get(key int) string {
        index := h.findBucket(key) // Найти индекс корзины, соответствующий key
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            return h.buckets[index].val // Если пара ключ-значение найдена, вернуть соответствующее val
        }
        return "" // Если пара ключ-значение не существует, вернуть ""
    }

    /* Операция добавления */
    func (h *hashMapOpenAddressing) put(key int, val string) {
        if h.loadFactor() > h.loadThres {
            h.extend() // Когда коэффициент загрузки превышает порог, выполнить расширение
        }
        index := h.findBucket(key) // Найти индекс корзины, соответствующий key
        if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
            h.buckets[index] = &pair{key, val} // Если пары ключ-значение нет, добавить ее
            h.size++
        } else {
            h.buckets[index].val = val // Если пара ключ-значение найдена, перезаписать val
        }
    }

    /* Операция удаления */
    func (h *hashMapOpenAddressing) remove(key int) {
        index := h.findBucket(key) // Найти индекс корзины, соответствующий key
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            h.buckets[index] = h.TOMBSTONE // Если пара ключ-значение найдена, заменить ее меткой удаления
            h.size--
        }
    }

    /* Расширить хеш-таблицу */
    func (h *hashMapOpenAddressing) extend() {
        oldBuckets := h.buckets               // Временно сохранить исходную хеш-таблицу
        h.capacity *= h.extendRatio           // Обновить емкость
        h.buckets = make([]*pair, h.capacity) // Инициализация новой хеш-таблицы после расширения
        h.size = 0                            // Сбросить размер
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for _, pair := range oldBuckets {
            if pair != nil && pair != h.TOMBSTONE {
                h.put(pair.key, pair.val)
            }
        }
    }

    /* Вывести хеш-таблицу */
    func (h *hashMapOpenAddressing) print() {
        for _, pair := range h.buckets {
            if pair == nil {
                fmt.Println("nil")
            } else if pair == h.TOMBSTONE {
                fmt.Println("TOMBSTONE")
            } else {
                fmt.Printf("%d -> %s\n", pair.key, pair.val)
            }
        }
    }
    ```

=== "Swift"

    ```swift title="hash_map_open_addressing.swift"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
        var size: Int // Число пар ключ-значение
        var capacity: Int // Вместимость хеш-таблицы
        var loadThres: Double // Порог коэффициента загрузки для запуска расширения
        var extendRatio: Int // Коэффициент расширения
        var buckets: [Pair?] // Массив корзин
        var TOMBSTONE: Pair // Удалить метку

        /* Конструктор */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: nil, count: capacity)
            TOMBSTONE = Pair(key: -1, val: "-1")
        }

        /* Хеш-функция */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* Коэффициент загрузки */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* Найти индекс корзины, соответствующий key */
        func findBucket(key: Int) -> Int {
            var index = hashFunc(key: key)
            var firstTombstone = -1
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while buckets[index] != nil {
                // Если встретился key, вернуть соответствующий индекс корзины
                if buckets[index]!.key == key {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if firstTombstone != -1 {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // Вернуть индекс корзины после перемещения
                    }
                    return index // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                    firstTombstone = index
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % capacity
            }
            // Если key не существует, вернуть индекс точки добавления
            return firstTombstone == -1 ? index : firstTombstone
        }

        /* Операция поиска */
        func get(key: Int) -> String? {
            // Найти индекс корзины, соответствующий key
            let index = findBucket(key: key)
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                return buckets[index]!.val
            }
            // Если пары ключ-значение не существует, вернуть null
            return nil
        }

        /* Операция добавления */
        func put(key: Int, val: String) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if loadFactor() > loadThres {
                extend()
            }
            // Найти индекс корзины, соответствующий key
            let index = findBucket(key: key)
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index]!.val = val
                return
            }
            // Если пары ключ-значение нет, добавить ее
            buckets[index] = Pair(key: key, val: val)
            size += 1
        }

        /* Операция удаления */
        func remove(key: Int) {
            // Найти индекс корзины, соответствующий key
            let index = findBucket(key: key)
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index] = TOMBSTONE
                size -= 1
            }
        }

        /* Расширить хеш-таблицу */
        func extend() {
            // Временно сохранить исходную хеш-таблицу
            let bucketsTmp = buckets
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio
            buckets = Array(repeating: nil, count: capacity)
            size = 0
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for pair in bucketsTmp {
                if let pair, pair != TOMBSTONE {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* Вывести хеш-таблицу */
        func print() {
            for pair in buckets {
                if pair == nil {
                    Swift.print("null")
                } else if pair == TOMBSTONE {
                    Swift.print("TOMBSTONE")
                } else {
                    Swift.print("\(pair!.key) -> \(pair!.val)")
                }
            }
        }
    }
    ```

=== "JS"

    ```javascript title="hash_map_open_addressing.js"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
        #size; // Число пар ключ-значение
        #capacity; // Вместимость хеш-таблицы
        #loadThres; // Порог коэффициента загрузки для запуска расширения
        #extendRatio; // Коэффициент расширения
        #buckets; // Массив корзин
        #TOMBSTONE; // Удалить метку

        /* Конструктор */
        constructor() {
            this.#size = 0; // Число пар ключ-значение
            this.#capacity = 4; // Вместимость хеш-таблицы
            this.#loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
            this.#extendRatio = 2; // Коэффициент расширения
            this.#buckets = Array(this.#capacity).fill(null); // Массив корзин
            this.#TOMBSTONE = new Pair(-1, '-1'); // Удалить метку
        }

        /* Хеш-функция */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* Коэффициент загрузки */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* Найти индекс корзины, соответствующий key */
        #findBucket(key) {
            let index = this.#hashFunc(key);
            let firstTombstone = -1;
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while (this.#buckets[index] !== null) {
                // Если встретился key, вернуть соответствующий индекс корзины
                if (this.#buckets[index].key === key) {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if (firstTombstone !== -1) {
                        this.#buckets[firstTombstone] = this.#buckets[index];
                        this.#buckets[index] = this.#TOMBSTONE;
                        return firstTombstone; // Вернуть индекс корзины после перемещения
                    }
                    return index; // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if (
                    firstTombstone === -1 &&
                    this.#buckets[index] === this.#TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % this.#capacity;
            }
            // Если key не существует, вернуть индекс точки добавления
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* Операция поиска */
        get(key) {
            // Найти индекс корзины, соответствующий key
            const index = this.#findBucket(key);
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                return this.#buckets[index].val;
            }
            // Если пары ключ-значение не существует, вернуть null
            return null;
        }

        /* Операция добавления */
        put(key, val) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            // Найти индекс корзины, соответствующий key
            const index = this.#findBucket(key);
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index].val = val;
                return;
            }
            // Если пары ключ-значение нет, добавить ее
            this.#buckets[index] = new Pair(key, val);
            this.#size++;
        }

        /* Операция удаления */
        remove(key) {
            // Найти индекс корзины, соответствующий key
            const index = this.#findBucket(key);
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index] = this.#TOMBSTONE;
                this.#size--;
            }
        }

        /* Расширить хеш-таблицу */
        #extend() {
            // Временно сохранить исходную хеш-таблицу
            const bucketsTmp = this.#buckets;
            // Инициализация новой хеш-таблицы после расширения
            this.#capacity *= this.#extendRatio;
            this.#buckets = Array(this.#capacity).fill(null);
            this.#size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.#TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        print() {
            for (const pair of this.#buckets) {
                if (pair === null) {
                    console.log('null');
                } else if (pair === this.#TOMBSTONE) {
                    console.log('TOMBSTONE');
                } else {
                    console.log(pair.key + ' -> ' + pair.val);
                }
            }
        }
    }
    ```

=== "TS"

    ```typescript title="hash_map_open_addressing.ts"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
        private size: number; // Число пар ключ-значение
        private capacity: number; // Вместимость хеш-таблицы
        private loadThres: number; // Порог коэффициента загрузки для запуска расширения
        private extendRatio: number; // Коэффициент расширения
        private buckets: Array<Pair | null>; // Массив корзин
        private TOMBSTONE: Pair; // Удалить метку

        /* Конструктор */
        constructor() {
            this.size = 0; // Число пар ключ-значение
            this.capacity = 4; // Вместимость хеш-таблицы
            this.loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
            this.extendRatio = 2; // Коэффициент расширения
            this.buckets = Array(this.capacity).fill(null); // Массив корзин
            this.TOMBSTONE = new Pair(-1, '-1'); // Удалить метку
        }

        /* Хеш-функция */
        private hashFunc(key: number): number {
            return key % this.capacity;
        }

        /* Коэффициент загрузки */
        private loadFactor(): number {
            return this.size / this.capacity;
        }

        /* Найти индекс корзины, соответствующий key */
        private findBucket(key: number): number {
            let index = this.hashFunc(key);
            let firstTombstone = -1;
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while (this.buckets[index] !== null) {
                // Если встретился key, вернуть соответствующий индекс корзины
                if (this.buckets[index]!.key === key) {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if (firstTombstone !== -1) {
                        this.buckets[firstTombstone] = this.buckets[index];
                        this.buckets[index] = this.TOMBSTONE;
                        return firstTombstone; // Вернуть индекс корзины после перемещения
                    }
                    return index; // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if (
                    firstTombstone === -1 &&
                    this.buckets[index] === this.TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % this.capacity;
            }
            // Если key не существует, вернуть индекс точки добавления
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* Операция поиска */
        get(key: number): string | null {
            // Найти индекс корзины, соответствующий key
            const index = this.findBucket(key);
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                return this.buckets[index]!.val;
            }
            // Если пары ключ-значение не существует, вернуть null
            return null;
        }

        /* Операция добавления */
        put(key: number, val: string): void {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (this.loadFactor() > this.loadThres) {
                this.extend();
            }
            // Найти индекс корзины, соответствующий key
            const index = this.findBucket(key);
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index]!.val = val;
                return;
            }
            // Если пары ключ-значение нет, добавить ее
            this.buckets[index] = new Pair(key, val);
            this.size++;
        }

        /* Операция удаления */
        remove(key: number): void {
            // Найти индекс корзины, соответствующий key
            const index = this.findBucket(key);
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index] = this.TOMBSTONE;
                this.size--;
            }
        }

        /* Расширить хеш-таблицу */
        private extend(): void {
            // Временно сохранить исходную хеш-таблицу
            const bucketsTmp = this.buckets;
            // Инициализация новой хеш-таблицы после расширения
            this.capacity *= this.extendRatio;
            this.buckets = Array(this.capacity).fill(null);
            this.size = 0;
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Вывести хеш-таблицу */
        print(): void {
            for (const pair of this.buckets) {
                if (pair === null) {
                    console.log('null');
                } else if (pair === this.TOMBSTONE) {
                    console.log('TOMBSTONE');
                } else {
                    console.log(pair.key + ' -> ' + pair.val);
                }
            }
        }
    }
    ```

=== "Dart"

    ```dart title="hash_map_open_addressing.dart"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
      late int _size; // Число пар ключ-значение
      int _capacity = 4; // Вместимость хеш-таблицы
      double _loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
      int _extendRatio = 2; // Коэффициент расширения
      late List<Pair?> _buckets; // Массив корзин
      Pair _TOMBSTONE = Pair(-1, "-1"); // Удалить метку

      /* Конструктор */
      HashMapOpenAddressing() {
        _size = 0;
        _buckets = List.generate(_capacity, (index) => null);
      }

      /* Хеш-функция */
      int hashFunc(int key) {
        return key % _capacity;
      }

      /* Коэффициент загрузки */
      double loadFactor() {
        return _size / _capacity;
      }

      /* Найти индекс корзины, соответствующий key */
      int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while (_buckets[index] != null) {
          // Если встретился key, вернуть соответствующий индекс корзины
          if (_buckets[index]!.key == key) {
            // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
            if (firstTombstone != -1) {
              _buckets[firstTombstone] = _buckets[index];
              _buckets[index] = _TOMBSTONE;
              return firstTombstone; // Вернуть индекс корзины после перемещения
            }
            return index; // Вернуть индекс корзины
          }
          // Записать первую встретившуюся метку удаления
          if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
            firstTombstone = index;
          }
          // Вычислить индекс корзины; при выходе за конец вернуться к началу
          index = (index + 1) % _capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone == -1 ? index : firstTombstone;
      }

      /* Операция поиска */
      String? get(int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          return _buckets[index]!.val;
        }
        // Если пары ключ-значение не существует, вернуть null
        return null;
      }

      /* Операция добавления */
      void put(int key, String val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > _loadThres) {
          extend();
        }
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index]!.val = val;
          return;
        }
        // Если пары ключ-значение нет, добавить ее
        _buckets[index] = new Pair(key, val);
        _size++;
      }

      /* Операция удаления */
      void remove(int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, заменить ее меткой удаления
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index] = _TOMBSTONE;
          _size--;
        }
      }

      /* Расширить хеш-таблицу */
      void extend() {
        // Временно сохранить исходную хеш-таблицу
        List<Pair?> bucketsTmp = _buckets;
        // Инициализация новой хеш-таблицы после расширения
        _capacity *= _extendRatio;
        _buckets = List.generate(_capacity, (index) => null);
        _size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (Pair? pair in bucketsTmp) {
          if (pair != null && pair != _TOMBSTONE) {
            put(pair.key, pair.val);
          }
        }
      }

      /* Вывести хеш-таблицу */
      void printHashMap() {
        for (Pair? pair in _buckets) {
          if (pair == null) {
            print("null");
          } else if (pair == _TOMBSTONE) {
            print("TOMBSTONE");
          } else {
            print("${pair.key} -> ${pair.val}");
          }
        }
      }
    }
    ```

=== "Rust"

    ```rust title="hash_map_open_addressing.rs"
    /* Хеш-таблица с открытой адресацией */
    struct HashMapOpenAddressing {
        size: usize,                // Число пар ключ-значение
        capacity: usize,            // Вместимость хеш-таблицы
        load_thres: f64,            // Порог коэффициента загрузки для запуска расширения
        extend_ratio: usize,        // Коэффициент расширения
        buckets: Vec<Option<Pair>>, // Массив корзин
        TOMBSTONE: Option<Pair>,    // Удалить метку
    }

    impl HashMapOpenAddressing {
        /* Конструктор */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![None; 4],
                TOMBSTONE: Some(Pair {
                    key: -1,
                    val: "-1".to_string(),
                }),
            }
        }

        /* Хеш-функция */
        fn hash_func(&self, key: i32) -> usize {
            (key % self.capacity as i32) as usize
        }

        /* Коэффициент загрузки */
        fn load_factor(&self) -> f64 {
            self.size as f64 / self.capacity as f64
        }

        /* Найти индекс корзины, соответствующий key */
        fn find_bucket(&mut self, key: i32) -> usize {
            let mut index = self.hash_func(key);
            let mut first_tombstone = -1;
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while self.buckets[index].is_some() {
                // Если встретился key, вернуть соответствующий индекс корзины
                if self.buckets[index].as_ref().unwrap().key == key {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
                    if first_tombstone != -1 {
                        self.buckets[first_tombstone as usize] = self.buckets[index].take();
                        self.buckets[index] = self.TOMBSTONE.clone();
                        return first_tombstone as usize; // Вернуть индекс корзины после перемещения
                    }
                    return index; // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                    first_tombstone = index as i32;
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % self.capacity;
            }
            // Если key не существует, вернуть индекс точки добавления
            if first_tombstone == -1 {
                index
            } else {
                first_tombstone as usize
            }
        }

        /* Операция поиска */
        fn get(&mut self, key: i32) -> Option<&str> {
            // Найти индекс корзины, соответствующий key
            let index = self.find_bucket(key);
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
            }
            // Если пары ключ-значение не существует, вернуть null
            None
        }

        /* Операция добавления */
        fn put(&mut self, key: i32, val: String) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if self.load_factor() > self.load_thres {
                self.extend();
            }
            // Найти индекс корзины, соответствующий key
            let index = self.find_bucket(key);
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index].as_mut().unwrap().val = val;
                return;
            }
            // Если пары ключ-значение нет, добавить ее
            self.buckets[index] = Some(Pair { key, val });
            self.size += 1;
        }

        /* Операция удаления */
        fn remove(&mut self, key: i32) {
            // Найти индекс корзины, соответствующий key
            let index = self.find_bucket(key);
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index] = self.TOMBSTONE.clone();
                self.size -= 1;
            }
        }

        /* Расширить хеш-таблицу */
        fn extend(&mut self) {
            // Временно сохранить исходную хеш-таблицу
            let buckets_tmp = self.buckets.clone();
            // Инициализация новой хеш-таблицы после расширения
            self.capacity *= self.extend_ratio;
            self.buckets = vec![None; self.capacity];
            self.size = 0;

            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for pair in buckets_tmp {
                if pair.is_none() || pair == self.TOMBSTONE {
                    continue;
                }
                let pair = pair.unwrap();

                self.put(pair.key, pair.val);
            }
        }
        /* Вывести хеш-таблицу */
        fn print(&self) {
            for pair in &self.buckets {
                if pair.is_none() {
                    println!("null");
                } else if pair == &self.TOMBSTONE {
                    println!("TOMBSTONE");
                } else {
                    let pair = pair.as_ref().unwrap();
                    println!("{} -> {}", pair.key, pair.val);
                }
            }
        }
    }
    ```

=== "C"

    ```c title="hash_map_open_addressing.c"
    /* Хеш-таблица с открытой адресацией */
    typedef struct {
        int size;         // Число пар ключ-значение
        int capacity;     // Вместимость хеш-таблицы
        double loadThres; // Порог коэффициента загрузки для запуска расширения
        int extendRatio;  // Коэффициент расширения
        Pair **buckets;   // Массив корзин
        Pair *TOMBSTONE;  // Удалить метку
    } HashMapOpenAddressing;

    /* Конструктор */
    HashMapOpenAddressing *newHashMapOpenAddressing() {
        HashMapOpenAddressing *hashMap = (HashMapOpenAddressing *)malloc(sizeof(HashMapOpenAddressing));
        hashMap->size = 0;
        hashMap->capacity = 4;
        hashMap->loadThres = 2.0 / 3.0;
        hashMap->extendRatio = 2;
        hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
        hashMap->TOMBSTONE = (Pair *)malloc(sizeof(Pair));
        hashMap->TOMBSTONE->key = -1;
        hashMap->TOMBSTONE->val = "-1";

        return hashMap;
    }

    /* Деструктор */
    void delHashMapOpenAddressing(HashMapOpenAddressing *hashMap) {
        for (int i = 0; i < hashMap->capacity; i++) {
            Pair *pair = hashMap->buckets[i];
            if (pair != NULL && pair != hashMap->TOMBSTONE) {
                free(pair->val);
                free(pair);
            }
        }
        free(hashMap->buckets);
        free(hashMap->TOMBSTONE);
        free(hashMap);
    }

    /* Хеш-функция */
    int hashFunc(HashMapOpenAddressing *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* Коэффициент загрузки */
    double loadFactor(HashMapOpenAddressing *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* Найти индекс корзины, соответствующий key */
    int findBucket(HashMapOpenAddressing *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        int firstTombstone = -1;
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while (hashMap->buckets[index] != NULL) {
            // Если встретился key, вернуть соответствующий индекс корзины
            if (hashMap->buckets[index]->key == key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                if (firstTombstone != -1) {
                    hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                    hashMap->buckets[index] = hashMap->TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Записать первую встретившуюся метку удаления
            if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % hashMap->capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Операция поиска */
    char *get(HashMapOpenAddressing *hashMap, int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(hashMap, key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            return hashMap->buckets[index]->val;
        }
        // Если пары ключ-значение не существует, вернуть пустую строку
        return "";
    }

    /* Операция добавления */
    void put(HashMapOpenAddressing *hashMap, int key, char *val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        // Найти индекс корзины, соответствующий key
        int index = findBucket(hashMap, key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            free(hashMap->buckets[index]->val);
            hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
            strcpy(hashMap->buckets[index]->val, val);
            hashMap->buckets[index]->val[strlen(val)] = '\0';
            return;
        }
        // Если пары ключ-значение нет, добавить ее
        Pair *pair = (Pair *)malloc(sizeof(Pair));
        pair->key = key;
        pair->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(pair->val, val);
        pair->val[strlen(val)] = '\0';

        hashMap->buckets[index] = pair;
        hashMap->size++;
    }

    /* Операция удаления */
    void removeItem(HashMapOpenAddressing *hashMap, int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(hashMap, key);
        // Если пара ключ-значение найдена, заменить ее меткой удаления
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            Pair *pair = hashMap->buckets[index];
            free(pair->val);
            free(pair);
            hashMap->buckets[index] = hashMap->TOMBSTONE;
            hashMap->size--;
        }
    }

    /* Расширить хеш-таблицу */
    void extend(HashMapOpenAddressing *hashMap) {
        // Временно сохранить исходную хеш-таблицу
        Pair **bucketsTmp = hashMap->buckets;
        int oldCapacity = hashMap->capacity;
        // Инициализация новой хеш-таблицы после расширения
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
        hashMap->size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (int i = 0; i < oldCapacity; i++) {
            Pair *pair = bucketsTmp[i];
            if (pair != NULL && pair != hashMap->TOMBSTONE) {
                put(hashMap, pair->key, pair->val);
                free(pair->val);
                free(pair);
            }
        }
        free(bucketsTmp);
    }

    /* Вывести хеш-таблицу */
    void print(HashMapOpenAddressing *hashMap) {
        for (int i = 0; i < hashMap->capacity; i++) {
            Pair *pair = hashMap->buckets[i];
            if (pair == NULL) {
                printf("NULL\n");
            } else if (pair == hashMap->TOMBSTONE) {
                printf("TOMBSTONE\n");
            } else {
                printf("%d -> %s\n", pair->key, pair->val);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="hash_map_open_addressing.kt"
    /* Хеш-таблица с открытой адресацией */
    class HashMapOpenAddressing {
        private var size: Int               // Число пар ключ-значение
        private var capacity: Int           // Вместимость хеш-таблицы
        private val loadThres: Double       // Порог коэффициента загрузки для запуска расширения
        private val extendRatio: Int        // Коэффициент расширения
        private var buckets: Array<Pair?>   // Массив корзин
        private val TOMBSTONE: Pair         // Удалить метку

        /* Конструктор */
        init {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = arrayOfNulls(capacity)
            TOMBSTONE = Pair(-1, "-1")
        }

        /* Хеш-функция */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* Коэффициент загрузки */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* Найти индекс корзины, соответствующий key */
        fun findBucket(key: Int): Int {
            var index = hashFunc(key)
            var firstTombstone = -1
            // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
            while (buckets[index] != null) {
                // Если встретился key, вернуть соответствующий индекс корзины
                if (buckets[index]?.key == key) {
                    // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // Вернуть индекс корзины после перемещения
                    }
                    return index // Вернуть индекс корзины
                }
                // Записать первую встретившуюся метку удаления
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index
                }
                // Вычислить индекс корзины; при выходе за конец вернуться к началу
                index = (index + 1) % capacity
            }
            // Если key не существует, вернуть индекс точки добавления
            return if (firstTombstone == -1) index else firstTombstone
        }

        /* Операция поиска */
        fun get(key: Int): String? {
            // Найти индекс корзины, соответствующий key
            val index = findBucket(key)
            // Если пара ключ-значение найдена, вернуть соответствующее val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index]?._val
            }
            // Если пары ключ-значение не существует, вернуть null
            return null
        }

        /* Операция добавления */
        fun put(key: Int, _val: String) {
            // Когда коэффициент загрузки превышает порог, выполнить расширение
            if (loadFactor() > loadThres) {
                extend()
            }
            // Найти индекс корзины, соответствующий key
            val index = findBucket(key)
            // Если пара ключ-значение найдена, перезаписать val и вернуть
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index]!!._val = _val
                return
            }
            // Если пары ключ-значение нет, добавить ее
            buckets[index] = Pair(key, _val)
            size++
        }

        /* Операция удаления */
        fun remove(key: Int) {
            // Найти индекс корзины, соответствующий key
            val index = findBucket(key)
            // Если пара ключ-значение найдена, заменить ее меткой удаления
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE
                size--
            }
        }

        /* Расширить хеш-таблицу */
        fun extend() {
            // Временно сохранить исходную хеш-таблицу
            val bucketsTmp = buckets
            // Инициализация новой хеш-таблицы после расширения
            capacity *= extendRatio
            buckets = arrayOfNulls(capacity)
            size = 0
            // Перенести пары ключ-значение из исходной хеш-таблицы в новую
            for (pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* Вывести хеш-таблицу */
        fun print() {
            for (pair in buckets) {
                if (pair == null) {
                    println("null")
                } else if (pair == TOMBSTONE) {
                    println("TOMESTOME")
                } else {
                    println("${pair.key} -> ${pair._val}")
                }
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="hash_map_open_addressing.rb"
    =begin
    File: hash_map_open_addressing.rb
    Created Time: 2024-04-13
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative './array_hash_map'

    # ## Хеш-таблица с открытой адресацией ###
    class HashMapOpenAddressing
      TOMBSTONE = Pair.new(-1, '-1') # Удалить метку

      # ## Конструктор ###
      def initialize
        @size = 0 # Число пар ключ-значение
        @capacity = 4 # Вместимость хеш-таблицы
        @load_thres = 2.0 / 3.0 # Порог коэффициента загрузки для запуска расширения
        @extend_ratio = 2 # Коэффициент расширения
        @buckets = Array.new(@capacity) # Массив корзин
      end

      # ## Хеш-функция ###
      def hash_func(key)
        key % @capacity
      end

      # ## Коэффициент загрузки ###
      def load_factor
        @size / @capacity
      end

      # ## Найти индекс корзины, соответствующий key ###
      def find_bucket(key)
        index = hash_func(key)
        first_tombstone = -1
        # Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while !@buckets[index].nil?
          # Если встретился key, вернуть соответствующий индекс корзины
          if @buckets[index].key == key
            # Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
            if first_tombstone != -1
              @buckets[first_tombstone] = @buckets[index]
              @buckets[index] = TOMBSTONE
              return first_tombstone # Вернуть индекс корзины после перемещения
            end
            return index # Вернуть индекс корзины
          end
          # Записать первую встретившуюся метку удаления
          first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
          # Вычислить индекс корзины; при выходе за конец вернуться к началу
          index = (index + 1) % @capacity
        end
        # Если key не существует, вернуть индекс точки добавления
        first_tombstone == -1 ? index : first_tombstone
      end

      # ## Операция поиска ###
      def get(key)
        # Найти индекс корзины, соответствующий key
        index = find_bucket(key)
        # Если пара ключ-значение найдена, вернуть соответствующее val
        return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
        # Если пара ключ-значение не существует, вернуть nil
        nil
      end

      # ## Операция добавления ###
      def put(key, val)
        # Когда коэффициент загрузки превышает порог, выполнить расширение
        extend if load_factor > @load_thres
        # Найти индекс корзины, соответствующий key
        index = find_bucket(key)
        # Если пара ключ-значение найдена, перезаписать val и вернуть
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index].val = val
          return
        end
        # Если пары ключ-значение нет, добавить ее
        @buckets[index] = Pair.new(key, val)
        @size += 1
      end

      # ## Операция удаления ###
      def remove(key)
        # Найти индекс корзины, соответствующий key
        index = find_bucket(key)
        # Если пара ключ-значение найдена, заменить ее меткой удаления
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index] = TOMBSTONE
          @size -= 1
        end
      end

      # ## Расширение хеш-таблицы ###
      def extend
        # Временно сохранить исходную хеш-таблицу
        buckets_tmp = @buckets
        # Инициализация новой хеш-таблицы после расширения
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity)
        @size = 0
        # Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for pair in buckets_tmp
          put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
        end
      end

      # ## Вывести хеш-таблицу ###
      def print
        for pair in @buckets
          if pair.nil?
            puts "Nil"
          elsif pair == TOMBSTONE
            puts "TOMBSTONE"
          else
            puts "#{pair.key} -> #{pair.val}"
          end
        end
      end
    end
    ```

### 2. &nbsp; Квадратичное пробирование

Квадратичное пробирование похоже на линейное пробирование и тоже является одной из распространенных стратегий открытой адресации. При возникновении конфликта оно не пропускает фиксированное число шагов, а переходит на расстояние, равное "квадрату числа попыток", то есть на $1, 4, 9, \dots$ шагов.

Квадратичное пробирование имеет следующие основные преимущества.

- Квадратичное пробирование пытается смягчить эффект кластеризации линейного пробирования, так как пропускает расстояния, равные квадрату номера попытки.
- Квадратичное пробирование перепрыгивает на более дальние позиции в поисках свободного места, что помогает распределять данные более равномерно.

Однако квадратичное пробирование не является идеальным.

- Кластеризация все равно существует: некоторые позиции по-прежнему занимают чаще других.
- Из-за быстрого роста квадрата квадратичное пробирование может не охватить всю хеш-таблицу, а это означает, что даже при наличии пустых бакетов оно может так до них и не добраться.

### 3. &nbsp; Повторное хеширование

Как видно из названия, метод повторного хеширования использует для пробирования несколько хеш-функций $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$ .

- **Вставка элемента**: если хеш-функция $f_1(x)$ вызывает конфликт, то пробуем $f_2(x)$ , и так далее, пока не будет найдено пустое место для вставки элемента.
- **Поиск элемента**: поиск идет в том же порядке хеш-функций, пока не будет найден целевой элемент; если встречается пустая позиция или уже были опробованы все хеш-функции, это означает, что элемента в хеш-таблице нет, и возвращается `None` .

По сравнению с линейным пробированием метод повторного хеширования меньше подвержен кластеризации, но несколько хеш-функций приносят дополнительные вычислительные затраты.

!!! tip

    Обрати внимание: у хеш-таблиц с открытой адресацией (линейное пробирование, квадратичное пробирование и повторное хеширование) есть общая проблема: в них нельзя напрямую удалять элементы.

## 6.2.3 &nbsp; Выбор в языках программирования

Разные языки программирования используют разные стратегии реализации хеш-таблиц. Ниже приведено несколько примеров.

- Python использует открытую адресацию. В словаре `dict` для пробирования применяются псевдослучайные числа.
- Java использует метод цепочек. Начиная с JDK 1.8, когда длина массива внутри `HashMap` достигает 64, а длина списка достигает 8, этот список преобразуется в красно-черное дерево для повышения производительности поиска.
- Go использует метод цепочек. В Go установлено, что каждый бакет может хранить не более 8 пар ключ-значение; при переполнении подключается overflow-bucket, а когда таких bucket становится слишком много, выполняется специальное расширение того же масштаба, чтобы сохранить производительность.
