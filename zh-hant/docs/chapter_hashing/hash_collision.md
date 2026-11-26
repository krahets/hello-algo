---
comments: true
---

# 6.2 &nbsp; 雜湊碰撞

上一節提到，**雜湊函式的輸入空間通常遠大於輸出空間**，因此理論上無法避免雜湊碰撞。例如，若輸入可以是任意整數，輸出的索引數量卻受限於陣列容量，就一定有多個整數對應到同一個桶索引。

雜湊碰撞會導致查詢結果錯誤，嚴重影響雜湊表的可用性。一個解決方法是，每當發生碰撞，就擴充雜湊表的容量，直到碰撞消失。這個方法簡單直接，雖然有效，效率卻太低，因為擴充容量需要搬移大量資料並重新計算雜湊值。為了提高效率，可以採用以下策略。

1. 改良雜湊表的資料結構，**讓雜湊表在發生碰撞時仍能正常運作**。
2. 只在必要時，也就是雜湊碰撞較為嚴重時，才擴充容量。

改良雜湊表結構的方法主要有「鏈結法」與「開放定址法」兩種。

## 6.2.1 &nbsp; 鏈結法

原本的雜湊表每個桶只能存放一個鍵值對。<u>鏈結法（separate chaining）</u>將桶中的單一元素改為鏈結串列，每個節點存放一個鍵值對，讓所有發生碰撞的鍵值對都存在同一條串列中。圖 6-5 是一個採用鏈結法的雜湊表。

![鏈結法雜湊表](hash_collision.assets/hash_table_chaining.svg){ class="animation-figure" }

<p align="center"> 圖 6-5 &nbsp; 鏈結法雜湊表 </p>

採用鏈結法後，雜湊表的各項操作會有以下變化。

- **查詢元素**：輸入 `key`，由雜湊函式算出桶索引，便可存取鏈結串列的首節點。接著走訪串列，逐一比對 `key`，找出目標鍵值對。
- **新增元素**：先透過雜湊函式找到鏈結串列的首節點，再將新節點（鍵值對）加入串列。
- **刪除元素**：根據雜湊函式的結果找到鏈結串列的開頭，再走訪串列，找出目標節點並將它刪除。

鏈結法有以下限制。

- **占用更多空間**：鏈結串列需要指向節點的指標，比陣列耗用更多記憶體。
- **查詢效率降低**：為了找到對應的元素，必須依序走訪鏈結串列。

以下程式碼示範如何用鏈結法實作簡單的雜湊表。有兩點值得留意。

- 為了簡化程式碼，我們用串列（動態陣列）取代鏈結串列。在這個實作中，雜湊表（陣列）包含多個桶，每個桶都是一個串列。
- 以下實作提供擴充雜湊表容量的方法。當負載因子超過 $\frac{2}{3}$ 時，我們就將雜湊表的容量擴充為原來的 $2$ 倍。

=== "Python"

    ```python title="hash_map_chaining.py"
    class HashMapChaining:
        """鏈結法雜湊表"""

        def __init__(self):
            """建構方法"""
            self.size = 0  # 鍵值對數量
            self.capacity = 4  # 雜湊表容量
            self.load_thres = 2.0 / 3.0  # 觸發容量擴充的負載因子門檻
            self.extend_ratio = 2  # 容量擴充倍數
            self.buckets = [[] for _ in range(self.capacity)]  # 桶陣列

        def hash_func(self, key: int) -> int:
            """雜湊函式"""
            return key % self.capacity

        def load_factor(self) -> float:
            """負載因子"""
            return self.size / self.capacity

        def get(self, key: int) -> str | None:
            """查詢操作"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # 走訪桶中的元素，若找到 key，就回傳對應的 val
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # 若找不到 key，回傳 None
            return None

        def put(self, key: int, val: str):
            """新增操作"""
            # 當負載因子超過門檻時，擴充容量
            if self.load_factor() > self.load_thres:
                self.extend()
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for pair in bucket:
                if pair.key == key:
                    pair.val = val
                    return
            # 若沒有這個 key，就將鍵值對加到尾端
            pair = Pair(key, val)
            bucket.append(pair)
            self.size += 1

        def remove(self, key: int):
            """刪除操作"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # 走訪桶中的元素，從中刪除鍵值對
            for pair in bucket:
                if pair.key == key:
                    bucket.remove(pair)
                    self.size -= 1
                    break

        def extend(self):
            """擴充雜湊表容量"""
            # 暫存原本的雜湊表
            buckets = self.buckets
            # 初始化擴充後的新雜湊表
            self.capacity *= self.extend_ratio
            self.buckets = [[] for _ in range(self.capacity)]
            self.size = 0
            # 將鍵值對從原本的雜湊表移到新表
            for bucket in buckets:
                for pair in bucket:
                    self.put(pair.key, pair.val)

        def print(self):
            """印出雜湊表"""
            for bucket in self.buckets:
                res = []
                for pair in bucket:
                    res.append(str(pair.key) + " -> " + pair.val)
                print(res)
    ```

=== "C++"

    ```cpp title="hash_map_chaining.cpp"
    /* 鏈結法雜湊表 */
    class HashMapChaining {
      private:
        int size;                       // 鍵值對數量
        int capacity;                   // 雜湊表容量
        double loadThres;               // 觸發容量擴充的負載因子門檻
        int extendRatio;                // 容量擴充倍數
        vector<vector<Pair *>> buckets; // 桶陣列

      public:
        /* 建構方法 */
        HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
            buckets.resize(capacity);
        }

        /* 解構方法 */
        ~HashMapChaining() {
            for (auto &bucket : buckets) {
                for (Pair *pair : bucket) {
                    // 釋放記憶體
                    delete pair;
                }
            }
        }

        /* 雜湊函式 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 負載因子 */
        double loadFactor() {
            return (double)size / (double)capacity;
        }

        /* 查詢操作 */
        string get(int key) {
            int index = hashFunc(key);
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    return pair->val;
                }
            }
            // 若找不到 key，則回傳空字串
            return "";
        }

        /* 新增操作 */
        void put(int key, string val) {
            // 當負載因子超過門檻時，擴充容量
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    pair->val = val;
                    return;
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            buckets[index].push_back(new Pair(key, val));
            size++;
        }

        /* 刪除操作 */
        void remove(int key) {
            int index = hashFunc(key);
            auto &bucket = buckets[index];
            // 走訪桶中的元素，從中刪除鍵值對
            for (int i = 0; i < bucket.size(); i++) {
                if (bucket[i]->key == key) {
                    Pair *tmp = bucket[i];
                    bucket.erase(bucket.begin() + i); // 從中刪除鍵值對
                    delete tmp;                       // 釋放記憶體
                    size--;
                    return;
                }
            }
        }

        /* 擴充雜湊表容量 */
        void extend() {
            // 暫存原本的雜湊表
            vector<vector<Pair *>> bucketsTmp = buckets;
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio;
            buckets.clear();
            buckets.resize(capacity);
            size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (auto &bucket : bucketsTmp) {
                for (Pair *pair : bucket) {
                    put(pair->key, pair->val);
                    // 釋放記憶體
                    delete pair;
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
        int size; // 鍵值對數量
        int capacity; // 雜湊表容量
        double loadThres; // 觸發容量擴充的負載因子門檻
        int extendRatio; // 容量擴充倍數
        List<List<Pair>> buckets; // 桶陣列

        /* 建構方法 */
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

        /* 雜湊函式 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 負載因子 */
        double loadFactor() {
            return (double) size / capacity;
        }

        /* 查詢操作 */
        String get(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // 若找不到 key，回傳 null
            return null;
        }

        /* 新增操作 */
        void put(int key, String val) {
            // 當負載因子超過門檻時，擴充容量
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            Pair pair = new Pair(key, val);
            bucket.add(pair);
            size++;
        }

        /* 刪除操作 */
        void remove(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // 走訪桶中的元素，從中刪除鍵值對
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    bucket.remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* 擴充雜湊表容量 */
        void extend() {
            // 暫存原本的雜湊表
            List<List<Pair>> bucketsTmp = buckets;
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
            size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (List<Pair> bucket : bucketsTmp) {
                for (Pair pair : bucket) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
        int size; // 鍵值對數量
        int capacity; // 雜湊表容量
        double loadThres; // 觸發容量擴充的負載因子門檻
        int extendRatio; // 容量擴充倍數
        List<List<Pair>> buckets; // 桶陣列

        /* 建構方法 */
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

        /* 雜湊函式 */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* 負載因子 */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* 查詢操作 */
        public string? Get(int key) {
            int index = HashFunc(key);
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // 若找不到 key，回傳 null
            return null;
        }

        /* 新增操作 */
        public void Put(int key, string val) {
            // 當負載因子超過門檻時，擴充容量
            if (LoadFactor() > loadThres) {
                Extend();
            }
            int index = HashFunc(key);
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            buckets[index].Add(new Pair(key, val));
            size++;
        }

        /* 刪除操作 */
        public void Remove(int key) {
            int index = HashFunc(key);
            // 走訪桶中的元素，從中刪除鍵值對
            foreach (Pair pair in buckets[index].ToList()) {
                if (pair.key == key) {
                    buckets[index].Remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* 擴充雜湊表容量 */
        void Extend() {
            // 暫存原本的雜湊表
            List<List<Pair>> bucketsTmp = buckets;
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio;
            buckets = new List<List<Pair>>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.Add([]);
            }
            size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            foreach (List<Pair> bucket in bucketsTmp) {
                foreach (Pair pair in bucket) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    type hashMapChaining struct {
        size        int      // 鍵值對數量
        capacity    int      // 雜湊表容量
        loadThres   float64  // 觸發容量擴充的負載因子門檻
        extendRatio int      // 容量擴充倍數
        buckets     [][]pair // 桶陣列
    }

    /* 建構方法 */
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

    /* 雜湊函式 */
    func (m *hashMapChaining) hashFunc(key int) int {
        return key % m.capacity
    }

    /* 負載因子 */
    func (m *hashMapChaining) loadFactor() float64 {
        return float64(m.size) / float64(m.capacity)
    }

    /* 查詢操作 */
    func (m *hashMapChaining) get(key int) string {
        idx := m.hashFunc(key)
        bucket := m.buckets[idx]
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for _, p := range bucket {
            if p.key == key {
                return p.val
            }
        }
        // 若找不到 key，則回傳空字串
        return ""
    }

    /* 新增操作 */
    func (m *hashMapChaining) put(key int, val string) {
        // 當負載因子超過門檻時，擴充容量
        if m.loadFactor() > m.loadThres {
            m.extend()
        }
        idx := m.hashFunc(key)
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for i := range m.buckets[idx] {
            if m.buckets[idx][i].key == key {
                m.buckets[idx][i].val = val
                return
            }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        p := pair{
            key: key,
            val: val,
        }
        m.buckets[idx] = append(m.buckets[idx], p)
        m.size += 1
    }

    /* 刪除操作 */
    func (m *hashMapChaining) remove(key int) {
        idx := m.hashFunc(key)
        // 走訪桶中的元素，從中刪除鍵值對
        for i, p := range m.buckets[idx] {
            if p.key == key {
                // 從切片刪除元素
                m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
                m.size -= 1
                break
            }
        }
    }

    /* 擴充雜湊表容量 */
    func (m *hashMapChaining) extend() {
        // 暫存原本的雜湊表
        tmpBuckets := make([][]pair, len(m.buckets))
        for i := 0; i < len(m.buckets); i++ {
            tmpBuckets[i] = make([]pair, len(m.buckets[i]))
            copy(tmpBuckets[i], m.buckets[i])
        }
        // 初始化擴充後的新雜湊表
        m.capacity *= m.extendRatio
        m.buckets = make([][]pair, m.capacity)
        for i := 0; i < m.capacity; i++ {
            m.buckets[i] = make([]pair, 0)
        }
        m.size = 0
        // 將鍵值對從原本的雜湊表移到新表
        for _, bucket := range tmpBuckets {
            for _, p := range bucket {
                m.put(p.key, p.val)
            }
        }
    }

    /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
        var size: Int // 鍵值對數量
        var capacity: Int // 雜湊表容量
        var loadThres: Double // 觸發容量擴充的負載因子門檻
        var extendRatio: Int // 容量擴充倍數
        var buckets: [[Pair]] // 桶陣列

        /* 建構方法 */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: [], count: capacity)
        }

        /* 雜湊函式 */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* 負載因子 */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* 查詢操作 */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for pair in bucket {
                if pair.key == key {
                    return pair.val
                }
            }
            // 若找不到 key，回傳 nil
            return nil
        }

        /* 新增操作 */
        func put(key: Int, val: String) {
            // 當負載因子超過門檻時，擴充容量
            if loadFactor() > loadThres {
                extend()
            }
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for pair in bucket {
                if pair.key == key {
                    pair.val = val
                    return
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            let pair = Pair(key: key, val: val)
            buckets[index].append(pair)
            size += 1
        }

        /* 刪除操作 */
        func remove(key: Int) {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 走訪桶中的元素，從中刪除鍵值對
            for (pairIndex, pair) in bucket.enumerated() {
                if pair.key == key {
                    buckets[index].remove(at: pairIndex)
                    size -= 1
                    break
                }
            }
        }

        /* 擴充雜湊表容量 */
        func extend() {
            // 暫存原本的雜湊表
            let bucketsTmp = buckets
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio
            buckets = Array(repeating: [], count: capacity)
            size = 0
            // 將鍵值對從原本的雜湊表移到新表
            for bucket in bucketsTmp {
                for pair in bucket {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
        #size; // 鍵值對數量
        #capacity; // 雜湊表容量
        #loadThres; // 觸發容量擴充的負載因子門檻
        #extendRatio; // 容量擴充倍數
        #buckets; // 桶陣列

        /* 建構方法 */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* 雜湊函式 */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* 負載因子 */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* 查詢操作 */
        get(key) {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // 若找不到 key，回傳 null
            return null;
        }

        /* 新增操作 */
        put(key, val) {
            // 當負載因子超過門檻時，擴充容量
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* 刪除操作 */
        remove(key) {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // 走訪桶中的元素，從中刪除鍵值對
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* 擴充雜湊表容量 */
        #extend() {
            // 暫存原本的雜湊表
            const bucketsTmp = this.#buckets;
            // 初始化擴充後的新雜湊表
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
        #size: number; // 鍵值對數量
        #capacity: number; // 雜湊表容量
        #loadThres: number; // 觸發容量擴充的負載因子門檻
        #extendRatio: number; // 容量擴充倍數
        #buckets: Pair[][]; // 桶陣列

        /* 建構方法 */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* 雜湊函式 */
        #hashFunc(key: number): number {
            return key % this.#capacity;
        }

        /* 負載因子 */
        #loadFactor(): number {
            return this.#size / this.#capacity;
        }

        /* 查詢操作 */
        get(key: number): string | null {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // 若找不到 key，回傳 null
            return null;
        }

        /* 新增操作 */
        put(key: number, val: string): void {
            // 當負載因子超過門檻時，擴充容量
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* 刪除操作 */
        remove(key: number): void {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // 走訪桶中的元素，從中刪除鍵值對
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* 擴充雜湊表容量 */
        #extend(): void {
            // 暫存原本的雜湊表
            const bucketsTmp = this.#buckets;
            // 初始化擴充後的新雜湊表
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
      late int size; // 鍵值對數量
      late int capacity; // 雜湊表容量
      late double loadThres; // 觸發容量擴充的負載因子門檻
      late int extendRatio; // 容量擴充倍數
      late List<List<Pair>> buckets; // 桶陣列

      /* 建構方法 */
      HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = List.generate(capacity, (_) => []);
      }

      /* 雜湊函式 */
      int hashFunc(int key) {
        return key % capacity;
      }

      /* 負載因子 */
      double loadFactor() {
        return size / capacity;
      }

      /* 查詢操作 */
      String? get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for (Pair pair in bucket) {
          if (pair.key == key) {
            return pair.val;
          }
        }
        // 若找不到 key，回傳 null
        return null;
      }

      /* 新增操作 */
      void put(int key, String val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > loadThres) {
          extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for (Pair pair in bucket) {
          if (pair.key == key) {
            pair.val = val;
            return;
          }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        Pair pair = Pair(key, val);
        bucket.add(pair);
        size++;
      }

      /* 刪除操作 */
      void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // 走訪桶中的元素，從中刪除鍵值對
        for (Pair pair in bucket) {
          if (pair.key == key) {
            bucket.remove(pair);
            size--;
            break;
          }
        }
      }

      /* 擴充雜湊表容量 */
      void extend() {
        // 暫存原本的雜湊表
        List<List<Pair>> bucketsTmp = buckets;
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio;
        buckets = List.generate(capacity, (_) => []);
        size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (List<Pair> bucket in bucketsTmp) {
          for (Pair pair in bucket) {
            put(pair.key, pair.val);
          }
        }
      }

      /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    struct HashMapChaining {
        size: usize,
        capacity: usize,
        load_thres: f32,
        extend_ratio: usize,
        buckets: Vec<Vec<Pair>>,
    }

    impl HashMapChaining {
        /* 建構方法 */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![vec![]; 4],
            }
        }

        /* 雜湊函式 */
        fn hash_func(&self, key: i32) -> usize {
            key as usize % self.capacity
        }

        /* 負載因子 */
        fn load_factor(&self) -> f32 {
            self.size as f32 / self.capacity as f32
        }

        /* 刪除操作 */
        fn remove(&mut self, key: i32) -> Option<String> {
            let index = self.hash_func(key);

            // 走訪桶中的元素，從中刪除鍵值對
            for (i, p) in self.buckets[index].iter_mut().enumerate() {
                if p.key == key {
                    let pair = self.buckets[index].remove(i);
                    self.size -= 1;
                    return Some(pair.val);
                }
            }

            // 若找不到 key，回傳 None
            None
        }

        /* 擴充雜湊表容量 */
        fn extend(&mut self) {
            // 暫存原本的雜湊表
            let buckets_tmp = std::mem::take(&mut self.buckets);

            // 初始化擴充後的新雜湊表
            self.capacity *= self.extend_ratio;
            self.buckets = vec![Vec::new(); self.capacity as usize];
            self.size = 0;

            // 將鍵值對從原本的雜湊表移到新表
            for bucket in buckets_tmp {
                for pair in bucket {
                    self.put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
        fn print(&self) {
            for bucket in &self.buckets {
                let mut res = Vec::new();
                for pair in bucket {
                    res.push(format!("{} -> {}", pair.key, pair.val));
                }
                println!("{:?}", res);
            }
        }

        /* 新增操作 */
        fn put(&mut self, key: i32, val: String) {
            // 當負載因子超過門檻時，擴充容量
            if self.load_factor() > self.load_thres {
                self.extend();
            }

            let index = self.hash_func(key);

            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for pair in self.buckets[index].iter_mut() {
                if pair.key == key {
                    pair.val = val;
                    return;
                }
            }

            // 若沒有這個 key，就將鍵值對加到尾端
            let pair = Pair { key, val };
            self.buckets[index].push(pair);
            self.size += 1;
        }

        /* 查詢操作 */
        fn get(&self, key: i32) -> Option<&str> {
            let index = self.hash_func(key);

            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for pair in self.buckets[index].iter() {
                if pair.key == key {
                    return Some(&pair.val);
                }
            }

            // 若找不到 key，回傳 None
            None
        }
    }
    ```

=== "C"

    ```c title="hash_map_chaining.c"
    /* 鏈結串列節點 */
    typedef struct Node {
        Pair *pair;
        struct Node *next;
    } Node;

    /* 鏈結法雜湊表 */
    typedef struct {
        int size;         // 鍵值對數量
        int capacity;     // 雜湊表容量
        double loadThres; // 觸發容量擴充的負載因子門檻
        int extendRatio;  // 容量擴充倍數
        Node **buckets;   // 桶陣列
    } HashMapChaining;

    /* 建構函式 */
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

    /* 解構函式 */
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

    /* 雜湊函式 */
    int hashFunc(HashMapChaining *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* 負載因子 */
    double loadFactor(HashMapChaining *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* 查詢操作 */
    char *get(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                return cur->pair->val;
            }
            cur = cur->next;
        }
        return ""; // 若找不到 key，則回傳空字串
    }

    /* 新增操作 */
    void put(HashMapChaining *hashMap, int key, const char *val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        int index = hashFunc(hashMap, key);
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                strcpy(cur->pair->val, val); // 若遇到指定的 key，就更新對應的 val 並結束操作
                return;
            }
            cur = cur->next;
        }
        // 若沒有這個 key，就將鍵值對加到鏈結串列的開頭
        Pair *newPair = (Pair *)malloc(sizeof(Pair));
        newPair->key = key;
        strcpy(newPair->val, val);
        Node *newNode = (Node *)malloc(sizeof(Node));
        newNode->pair = newPair;
        newNode->next = hashMap->buckets[index];
        hashMap->buckets[index] = newNode;
        hashMap->size++;
    }

    /* 擴充雜湊表容量 */
    void extend(HashMapChaining *hashMap) {
        // 暫存原本的雜湊表
        int oldCapacity = hashMap->capacity;
        Node **oldBuckets = hashMap->buckets;
        // 初始化擴充後的新雜湊表
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
        for (int i = 0; i < hashMap->capacity; i++) {
            hashMap->buckets[i] = NULL;
        }
        hashMap->size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (int i = 0; i < oldCapacity; i++) {
            Node *cur = oldBuckets[i];
            while (cur) {
                put(hashMap, cur->pair->key, cur->pair->val);
                Node *temp = cur;
                cur = cur->next;
                // 釋放記憶體
                free(temp->pair);
                free(temp);
            }
        }

        free(oldBuckets);
    }

    /* 刪除操作 */
    void removeItem(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        Node *cur = hashMap->buckets[index];
        Node *pre = NULL;
        while (cur) {
            if (cur->pair->key == key) {
                // 從中刪除鍵值對
                if (pre) {
                    pre->next = cur->next;
                } else {
                    hashMap->buckets[index] = cur->next;
                }
                // 釋放記憶體
                free(cur->pair);
                free(cur);
                hashMap->size--;
                return;
            }
            pre = cur;
            cur = cur->next;
        }
    }

    /* 印出雜湊表 */
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
    /* 鏈結法雜湊表 */
    class HashMapChaining {
        var size: Int // 鍵值對數量
        var capacity: Int // 雜湊表容量
        val loadThres: Double // 觸發容量擴充的負載因子門檻
        val extendRatio: Int // 容量擴充倍數
        var buckets: MutableList<MutableList<Pair>> // 桶陣列

        /* 建構方法 */
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

        /* 雜湊函式 */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* 負載因子 */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* 查詢操作 */
        fun get(key: Int): String? {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // 走訪桶中的元素，若找到 key，就回傳對應的 val
            for (pair in bucket) {
                if (pair.key == key) return pair._val
            }
            // 若找不到 key，回傳 null
            return null
        }

        /* 新增操作 */
        fun put(key: Int, _val: String) {
            // 當負載因子超過門檻時，擴充容量
            if (loadFactor() > loadThres) {
                extend()
            }
            val index = hashFunc(key)
            val bucket = buckets[index]
            // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
            for (pair in bucket) {
                if (pair.key == key) {
                    pair._val = _val
                    return
                }
            }
            // 若沒有這個 key，就將鍵值對加到尾端
            val pair = Pair(key, _val)
            bucket.add(pair)
            size++
        }

        /* 刪除操作 */
        fun remove(key: Int) {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // 走訪桶中的元素，從中刪除鍵值對
            for (pair in bucket) {
                if (pair.key == key) {
                    bucket.remove(pair)
                    size--
                    break
                }
            }
        }

        /* 擴充雜湊表容量 */
        fun extend() {
            // 暫存原本的雜湊表
            val bucketsTmp = buckets
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio
            // MutableList 的大小不固定
            buckets = mutableListOf()
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
            size = 0
            // 將鍵值對從原本的雜湊表移到新表
            for (bucket in bucketsTmp) {
                for (pair in bucket) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* 印出雜湊表 */
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
    ### 採用鏈結法的雜湊表 ###
    class HashMapChaining
      ### 建構方法 ###
      def initialize
        @size = 0 # 鍵值對數量
        @capacity = 4 # 雜湊表容量
        @load_thres = 2.0 / 3.0 # 觸發容量擴充的負載因子門檻
        @extend_ratio = 2 # 容量擴充倍數
        @buckets = Array.new(@capacity) { [] } # 桶陣列
      end

      ### 雜湊函式 ###
      def hash_func(key)
        key % @capacity
      end

      ### 負載因子 ###
      def load_factor
        @size / @capacity.to_f
      end

      ### 查詢操作 ###
      def get(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # 走訪桶中的元素，若找到 key，就回傳對應的 val
        for pair in bucket
          return pair.val if pair.key == key
        end
        # 若找不到 key，回傳 nil
        nil
      end

      ### 新增操作 ###
      def put(key, val)
        # 當負載因子超過門檻時，擴充容量
        extend if load_factor > @load_thres
        index = hash_func(key)
        bucket = @buckets[index]
        # 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for pair in bucket
          if pair.key == key
            pair.val = val
            return
          end
        end
        # 若沒有這個 key，就將鍵值對加到尾端
        pair = Pair.new(key, val)
        bucket << pair
        @size += 1
      end

      ### 刪除操作 ###
      def remove(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # 走訪桶中的元素，從中刪除鍵值對
        for pair in bucket
          if pair.key == key
            bucket.delete(pair)
            @size -= 1
            break
          end
        end
      end

      ### 擴充雜湊表容量 ###
      def extend
        # 暫存原本的雜湊表
        buckets = @buckets
        # 初始化擴充後的新雜湊表
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity) { [] }
        @size = 0
        # 將鍵值對從原本的雜湊表移到新表
        for bucket in buckets
          for pair in bucket
            put(pair.key, pair.val)
          end
        end
      end

      ### 印出雜湊表 ###
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

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22%E9%8D%B5%E5%80%BC%E5%B0%8D%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E6%B3%95%E9%9B%9C%E6%B9%8A%E8%A1%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E9%9B%9C%E6%B9%8A%E5%87%BD%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%B2%A0%E8%BC%89%E5%9B%A0%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E8%A9%A2%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%93%B4%E5%85%85%E9%9B%9C%E6%B9%8A%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8D%B0%E5%87%BA%E9%9B%9C%E6%B9%8A%E8%A1%A8%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%9C%E6%B9%8A%E8%A1%A8%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%9B%89%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B4%A8%22%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E8%A9%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22%E9%8D%B5%E5%80%BC%E5%B0%8D%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E6%B3%95%E9%9B%9C%E6%B9%8A%E8%A1%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E9%9B%9C%E6%B9%8A%E5%87%BD%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%B2%A0%E8%BC%89%E5%9B%A0%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E8%A9%A2%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%93%B4%E5%85%85%E9%9B%9C%E6%B9%8A%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8D%B0%E5%87%BA%E9%9B%9C%E6%B9%8A%E8%A1%A8%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%9C%E6%B9%8A%E8%A1%A8%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%9B%89%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B4%A8%22%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E8%A9%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

當鏈結串列很長時，查詢的效率 $O(n)$ 很差。**此時可以將鏈結串列改為「AVL 樹」或「紅黑樹」**，將查詢的時間複雜度改善為 $O(\log n)$。

## 6.2.2 &nbsp; 開放定址法

<u>開放定址法（open addressing）</u>無須額外的資料結構，而是透過多次探測來處理雜湊碰撞。常見的探測方式有線性探測、平方探測和多重雜湊等。

以下以線性探測為例，說明採用開放定址法的雜湊表如何運作。

### 1. &nbsp; 線性探測

線性探測每次向後移動固定步數，以線性搜尋的方式探測。它的操作與一般雜湊表略有不同。

- **插入元素**：先用雜湊函式算出桶索引。如果桶裡已有元素，就從碰撞位置開始，以固定步長（通常為 $1$）向後依序探測，找到空桶後將元素放入。
- **查找元素**：若發生雜湊碰撞，就以相同的步長向後依序探測，找到對應的元素後回傳 `value`。如果遇到空桶，表示目標元素不在雜湊表中，便回傳 `None`。

圖 6-6 顯示採用開放定址法（線性探測）的雜湊表如何存放鍵值對。依照圖中的雜湊函式，末兩位相同的 `key` 都會對應到同一個桶。經過線性探測，這些鍵值對會依序放在該桶及其下方的桶中。

![開放定址法（線性探測）雜湊表的鍵值對分布](hash_collision.assets/hash_table_linear_probing.svg){ class="animation-figure" }

<p align="center"> 圖 6-6 &nbsp; 開放定址法（線性探測）雜湊表的鍵值對分布 </p>

不過，**線性探測容易產生「群聚現象」**。陣列中連續被占用的區段越長，新元素在這段區間發生碰撞的機率就越高，使這個群集進一步擴大。如此形成惡性循環，最後會降低新增、刪除、查詢與更新的效率。

請留意，**在採用開放定址法的雜湊表中，不能直接刪除元素**。直接刪除會在陣列中留下一個空桶 `None`。查詢時，線性探測遇到這個空桶就會結束，無法再繼續查找空桶後方的元素，程式便可能誤判這些元素不存在，如圖 6-7 所示。

![開放定址法中直接刪除元素造成的查詢問題](hash_collision.assets/hash_table_open_addressing_deletion.svg){ class="animation-figure" }

<p align="center"> 圖 6-7 &nbsp; 開放定址法中直接刪除元素造成的查詢問題 </p>

為了解決這個問題，可以採用<u>延遲刪除（lazy deletion）</u>：刪除時不直接從雜湊表移除元素，**而是用常數 `TOMBSTONE` 標記這個桶**。此時 `None` 和 `TOMBSTONE` 都表示空桶，都能放入鍵值對。差別在於線性探測遇到 `TOMBSTONE` 時要繼續往後找，因為後面可能還有鍵值對。

然而，**延遲刪除可能會讓雜湊表的效能下降得更快**。每次刪除都會留下一個刪除標記。隨著 `TOMBSTONE` 增多，線性探測可能要跳過好幾個 `TOMBSTONE` 才能找到目標元素，搜尋所需的時間也會增加。

為此，可以在線性探測時記下遇到的第一個 `TOMBSTONE` 的索引，找到目標元素後，再讓它和這個 `TOMBSTONE` 交換位置。如此一來，每次查詢或新增元素時，都有機會將元素移到更接近理想位置（探測起點）的桶，提升查詢效率。

以下程式碼以開放定址法（線性探測）實作雜湊表，並支援延遲刪除。為了充分運用雜湊表的空間，我們把它視為「環狀陣列」：探測超過陣列尾端時，就回到開頭繼續走訪。

=== "Python"

    ```python title="hash_map_open_addressing.py"
    class HashMapOpenAddressing:
        """採用開放定址法的雜湊表"""

        def __init__(self):
            """建構方法"""
            self.size = 0  # 鍵值對數量
            self.capacity = 4  # 雜湊表容量
            self.load_thres = 2.0 / 3.0  # 觸發容量擴充的負載因子門檻
            self.extend_ratio = 2  # 容量擴充倍數
            self.buckets: list[Pair | None] = [None] * self.capacity  # 桶陣列
            self.TOMBSTONE = Pair(-1, "-1")  # 刪除標記

        def hash_func(self, key: int) -> int:
            """雜湊函式"""
            return key % self.capacity

        def load_factor(self) -> float:
            """負載因子"""
            return self.size / self.capacity

        def find_bucket(self, key: int) -> int:
            """尋找 key 對應的桶索引"""
            index = self.hash_func(key)
            first_tombstone = -1
            for _ in range(self.capacity):
                bucket = self.buckets[index]
                if bucket is None:
                    break
                # 記錄遇到的第一個刪除標記
                if bucket is self.TOMBSTONE:
                    if first_tombstone == -1:
                        first_tombstone = index
                # 若遇到 key，回傳對應的桶索引
                elif bucket.key == key:
                    # 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = bucket
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # 回傳移動後的桶索引
                    return index  # 回傳桶索引
                # 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % self.capacity
            # 若 key 不存在，回傳可插入位置的索引
            return index if first_tombstone == -1 else first_tombstone

        def get(self, key: int) -> str:
            """查詢操作"""
            # 尋找 key 對應的桶索引
            index = self.find_bucket(key)
            # 若找到鍵值對，回傳對應的 val
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                return self.buckets[index].val
            # 若鍵值對不存在，回傳 None
            return None

        def put(self, key: int, val: str):
            """新增操作"""
            # 當負載因子超過門檻時，擴充容量
            if self.load_factor() > self.load_thres:
                self.extend()
            # 尋找 key 對應的桶索引
            index = self.find_bucket(key)
            # 若找到鍵值對，覆寫 val 並結束操作
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index].val = val
                return
            # 若鍵值對不存在，新增該鍵值對
            self.buckets[index] = Pair(key, val)
            self.size += 1

        def remove(self, key: int):
            """刪除操作"""
            # 尋找 key 對應的桶索引
            index = self.find_bucket(key)
            # 若找到鍵值對，以刪除標記取代它
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index] = self.TOMBSTONE
                self.size -= 1

        def extend(self):
            """擴充雜湊表容量"""
            # 暫存原本的雜湊表
            buckets_tmp = self.buckets
            # 初始化擴充後的新雜湊表
            self.capacity *= self.extend_ratio
            self.buckets = [None] * self.capacity
            self.size = 0
            # 將鍵值對從原本的雜湊表移到新表
            for pair in buckets_tmp:
                if pair not in [None, self.TOMBSTONE]:
                    self.put(pair.key, pair.val)

        def print(self):
            """印出雜湊表"""
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
      private:
        int size;                             // 鍵值對數量
        int capacity = 4;                     // 雜湊表容量
        const double loadThres = 2.0 / 3.0;     // 觸發容量擴充的負載因子門檻
        const int extendRatio = 2;            // 容量擴充倍數
        vector<Pair *> buckets;               // 桶陣列
        Pair *TOMBSTONE = new Pair(-1, "-1"); // 刪除標記

      public:
        /* 建構方法 */
        HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
        }

        /* 解構方法 */
        ~HashMapOpenAddressing() {
            for (Pair *pair : buckets) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    delete pair;
                }
            }
            delete TOMBSTONE;
        }

        /* 雜湊函式 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 負載因子 */
        double loadFactor() {
            return (double)size / capacity;
        }

        /* 尋找 key 對應的桶索引 */
        int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // 進行線性探測，遇到空桶就跳出迴圈
            while (buckets[index] != nullptr) {
                // 若遇到 key，回傳對應的桶索引
                if (buckets[index]->key == key) {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 回傳移動後的桶索引
                    }
                    return index; // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % capacity;
            }
            // 若 key 不存在，回傳可插入位置的索引
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 查詢操作 */
        string get(int key) {
            // 尋找 key 對應的桶索引
            int index = findBucket(key);
            // 若找到鍵值對，回傳對應的 val
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                return buckets[index]->val;
            }
            // 若鍵值對不存在，回傳空字串
            return "";
        }

        /* 新增操作 */
        void put(int key, string val) {
            // 當負載因子超過門檻時，擴充容量
            if (loadFactor() > loadThres) {
                extend();
            }
            // 尋找 key 對應的桶索引
            int index = findBucket(key);
            // 若找到鍵值對，覆寫 val 並結束操作
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                buckets[index]->val = val;
                return;
            }
            // 若鍵值對不存在，新增該鍵值對
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 刪除操作 */
        void remove(int key) {
            // 尋找 key 對應的桶索引
            int index = findBucket(key);
            // 若找到鍵值對，以刪除標記取代它
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                delete buckets[index];
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* 擴充雜湊表容量 */
        void extend() {
            // 暫存原本的雜湊表
            vector<Pair *> bucketsTmp = buckets;
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio;
            buckets = vector<Pair *>(capacity, nullptr);
            size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (Pair *pair : bucketsTmp) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    put(pair->key, pair->val);
                    delete pair;
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
        private int size; // 鍵值對數量
        private int capacity = 4; // 雜湊表容量
        private final double loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
        private final int extendRatio = 2; // 容量擴充倍數
        private Pair[] buckets; // 桶陣列
        private final Pair TOMBSTONE = new Pair(-1, "-1"); // 刪除標記

        /* 建構方法 */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* 雜湊函式 */
        private int hashFunc(int key) {
            return key % capacity;
        }

        /* 負載因子 */
        private double loadFactor() {
            return (double) size / capacity;
        }

        /* 尋找 key 對應的桶索引 */
        private int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // 進行線性探測，遇到空桶就跳出迴圈
            while (buckets[index] != null) {
                // 若遇到 key，回傳對應的桶索引
                if (buckets[index].key == key) {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 回傳移動後的桶索引
                    }
                    return index; // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % capacity;
            }
            // 若 key 不存在，回傳可插入位置的索引
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 查詢操作 */
        public String get(int key) {
            // 尋找 key 對應的桶索引
            int index = findBucket(key);
            // 若找到鍵值對，回傳對應的 val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // 若鍵值對不存在，回傳 null
            return null;
        }

        /* 新增操作 */
        public void put(int key, String val) {
            // 當負載因子超過門檻時，擴充容量
            if (loadFactor() > loadThres) {
                extend();
            }
            // 尋找 key 對應的桶索引
            int index = findBucket(key);
            // 若找到鍵值對，覆寫 val 並結束操作
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // 若鍵值對不存在，新增該鍵值對
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 刪除操作 */
        public void remove(int key) {
            // 尋找 key 對應的桶索引
            int index = findBucket(key);
            // 若找到鍵值對，以刪除標記取代它
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* 擴充雜湊表容量 */
        private void extend() {
            // 暫存原本的雜湊表
            Pair[] bucketsTmp = buckets;
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (Pair pair : bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
        int size; // 鍵值對數量
        int capacity = 4; // 雜湊表容量
        double loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
        int extendRatio = 2; // 容量擴充倍數
        Pair[] buckets; // 桶陣列
        Pair TOMBSTONE = new(-1, "-1"); // 刪除標記

        /* 建構方法 */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* 雜湊函式 */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* 負載因子 */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* 尋找 key 對應的桶索引 */
        int FindBucket(int key) {
            int index = HashFunc(key);
            int firstTombstone = -1;
            // 進行線性探測，遇到空桶就跳出迴圈
            while (buckets[index] != null) {
                // 若遇到 key，回傳對應的桶索引
                if (buckets[index].key == key) {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 回傳移動後的桶索引
                    }
                    return index; // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % capacity;
            }
            // 若 key 不存在，回傳可插入位置的索引
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 查詢操作 */
        public string? Get(int key) {
            // 尋找 key 對應的桶索引
            int index = FindBucket(key);
            // 若找到鍵值對，回傳對應的 val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // 若鍵值對不存在，回傳 null
            return null;
        }

        /* 新增操作 */
        public void Put(int key, string val) {
            // 當負載因子超過門檻時，擴充容量
            if (LoadFactor() > loadThres) {
                Extend();
            }
            // 尋找 key 對應的桶索引
            int index = FindBucket(key);
            // 若找到鍵值對，覆寫 val 並結束操作
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // 若鍵值對不存在，新增該鍵值對
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 刪除操作 */
        public void Remove(int key) {
            // 尋找 key 對應的桶索引
            int index = FindBucket(key);
            // 若找到鍵值對，以刪除標記取代它
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* 擴充雜湊表容量 */
        void Extend() {
            // 暫存原本的雜湊表
            Pair[] bucketsTmp = buckets;
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            foreach (Pair pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    type hashMapOpenAddressing struct {
        size        int     // 鍵值對數量
        capacity    int     // 雜湊表容量
        loadThres   float64 // 觸發容量擴充的負載因子門檻
        extendRatio int     // 容量擴充倍數
        buckets     []*pair // 桶陣列
        TOMBSTONE   *pair   // 刪除標記
    }

    /* 建構方法 */
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

    /* 雜湊函式 */
    func (h *hashMapOpenAddressing) hashFunc(key int) int {
        return key % h.capacity // 根據鍵計算雜湊值
    }

    /* 負載因子 */
    func (h *hashMapOpenAddressing) loadFactor() float64 {
        return float64(h.size) / float64(h.capacity) // 計算目前的負載因子
    }

    /* 尋找 key 對應的桶索引 */
    func (h *hashMapOpenAddressing) findBucket(key int) int {
        index := h.hashFunc(key) // 取得起始索引
        firstTombstone := -1     // 記錄遇到的第一個 TOMBSTONE 的位置
        for h.buckets[index] != nil {
            if h.buckets[index].key == key {
                if firstTombstone != -1 {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    h.buckets[firstTombstone] = h.buckets[index]
                    h.buckets[index] = h.TOMBSTONE
                    return firstTombstone // 回傳移動後的桶索引
                }
                return index // 回傳找到的索引
            }
            if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
                firstTombstone = index // 記錄遇到的第一個刪除標記的位置
            }
            index = (index + 1) % h.capacity // 進行線性探測，超過尾端就回到開頭
        }
        // 若 key 不存在，回傳可插入位置的索引
        if firstTombstone != -1 {
            return firstTombstone
        }
        return index
    }

    /* 查詢操作 */
    func (h *hashMapOpenAddressing) get(key int) string {
        index := h.findBucket(key) // 尋找 key 對應的桶索引
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            return h.buckets[index].val // 若找到鍵值對，回傳對應的 val
        }
        return "" // 若鍵值對不存在，回傳 ""
    }

    /* 新增操作 */
    func (h *hashMapOpenAddressing) put(key int, val string) {
        if h.loadFactor() > h.loadThres {
            h.extend() // 當負載因子超過門檻時，擴充容量
        }
        index := h.findBucket(key) // 尋找 key 對應的桶索引
        if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
            h.buckets[index] = &pair{key, val} // 若鍵值對不存在，新增該鍵值對
            h.size++
        } else {
            h.buckets[index].val = val // 若找到鍵值對，覆寫 val
        }
    }

    /* 刪除操作 */
    func (h *hashMapOpenAddressing) remove(key int) {
        index := h.findBucket(key) // 尋找 key 對應的桶索引
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            h.buckets[index] = h.TOMBSTONE // 若找到鍵值對，以刪除標記取代它
            h.size--
        }
    }

    /* 擴充雜湊表容量 */
    func (h *hashMapOpenAddressing) extend() {
        oldBuckets := h.buckets               // 暫存原本的雜湊表
        h.capacity *= h.extendRatio           // 更新容量
        h.buckets = make([]*pair, h.capacity) // 初始化擴充後的新雜湊表
        h.size = 0                            // 重設大小
        // 將鍵值對從原本的雜湊表移到新表
        for _, pair := range oldBuckets {
            if pair != nil && pair != h.TOMBSTONE {
                h.put(pair.key, pair.val)
            }
        }
    }

    /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
        var size: Int // 鍵值對數量
        var capacity: Int // 雜湊表容量
        var loadThres: Double // 觸發容量擴充的負載因子門檻
        var extendRatio: Int // 容量擴充倍數
        var buckets: [Pair?] // 桶陣列
        var TOMBSTONE: Pair // 刪除標記

        /* 建構方法 */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: nil, count: capacity)
            TOMBSTONE = Pair(key: -1, val: "-1")
        }

        /* 雜湊函式 */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* 負載因子 */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* 尋找 key 對應的桶索引 */
        func findBucket(key: Int) -> Int {
            var index = hashFunc(key: key)
            var firstTombstone = -1
            // 進行線性探測，遇到空桶就跳出迴圈
            while buckets[index] != nil {
                // 若遇到 key，回傳對應的桶索引
                if buckets[index]!.key == key {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if firstTombstone != -1 {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // 回傳移動後的桶索引
                    }
                    return index // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                    firstTombstone = index
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % capacity
            }
            // 若 key 不存在，回傳可插入位置的索引
            return firstTombstone == -1 ? index : firstTombstone
        }

        /* 查詢操作 */
        func get(key: Int) -> String? {
            // 尋找 key 對應的桶索引
            let index = findBucket(key: key)
            // 若找到鍵值對，回傳對應的 val
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                return buckets[index]!.val
            }
            // 若鍵值對不存在，回傳 null
            return nil
        }

        /* 新增操作 */
        func put(key: Int, val: String) {
            // 當負載因子超過門檻時，擴充容量
            if loadFactor() > loadThres {
                extend()
            }
            // 尋找 key 對應的桶索引
            let index = findBucket(key: key)
            // 若找到鍵值對，覆寫 val 並結束操作
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index]!.val = val
                return
            }
            // 若鍵值對不存在，新增該鍵值對
            buckets[index] = Pair(key: key, val: val)
            size += 1
        }

        /* 刪除操作 */
        func remove(key: Int) {
            // 尋找 key 對應的桶索引
            let index = findBucket(key: key)
            // 若找到鍵值對，以刪除標記取代它
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index] = TOMBSTONE
                size -= 1
            }
        }

        /* 擴充雜湊表容量 */
        func extend() {
            // 暫存原本的雜湊表
            let bucketsTmp = buckets
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio
            buckets = Array(repeating: nil, count: capacity)
            size = 0
            // 將鍵值對從原本的雜湊表移到新表
            for pair in bucketsTmp {
                if let pair, pair != TOMBSTONE {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
        #size; // 鍵值對數量
        #capacity; // 雜湊表容量
        #loadThres; // 觸發容量擴充的負載因子門檻
        #extendRatio; // 容量擴充倍數
        #buckets; // 桶陣列
        #TOMBSTONE; // 刪除標記

        /* 建構方法 */
        constructor() {
            this.#size = 0; // 鍵值對數量
            this.#capacity = 4; // 雜湊表容量
            this.#loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
            this.#extendRatio = 2; // 容量擴充倍數
            this.#buckets = Array(this.#capacity).fill(null); // 桶陣列
            this.#TOMBSTONE = new Pair(-1, '-1'); // 刪除標記
        }

        /* 雜湊函式 */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* 負載因子 */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* 尋找 key 對應的桶索引 */
        #findBucket(key) {
            let index = this.#hashFunc(key);
            let firstTombstone = -1;
            // 進行線性探測，遇到空桶就跳出迴圈
            while (this.#buckets[index] !== null) {
                // 若遇到 key，回傳對應的桶索引
                if (this.#buckets[index].key === key) {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if (firstTombstone !== -1) {
                        this.#buckets[firstTombstone] = this.#buckets[index];
                        this.#buckets[index] = this.#TOMBSTONE;
                        return firstTombstone; // 回傳移動後的桶索引
                    }
                    return index; // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if (
                    firstTombstone === -1 &&
                    this.#buckets[index] === this.#TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % this.#capacity;
            }
            // 若 key 不存在，回傳可插入位置的索引
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* 查詢操作 */
        get(key) {
            // 尋找 key 對應的桶索引
            const index = this.#findBucket(key);
            // 若找到鍵值對，回傳對應的 val
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                return this.#buckets[index].val;
            }
            // 若鍵值對不存在，回傳 null
            return null;
        }

        /* 新增操作 */
        put(key, val) {
            // 當負載因子超過門檻時，擴充容量
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            // 尋找 key 對應的桶索引
            const index = this.#findBucket(key);
            // 若找到鍵值對，覆寫 val 並結束操作
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index].val = val;
                return;
            }
            // 若鍵值對不存在，新增該鍵值對
            this.#buckets[index] = new Pair(key, val);
            this.#size++;
        }

        /* 刪除操作 */
        remove(key) {
            // 尋找 key 對應的桶索引
            const index = this.#findBucket(key);
            // 若找到鍵值對，以刪除標記取代它
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index] = this.#TOMBSTONE;
                this.#size--;
            }
        }

        /* 擴充雜湊表容量 */
        #extend() {
            // 暫存原本的雜湊表
            const bucketsTmp = this.#buckets;
            // 初始化擴充後的新雜湊表
            this.#capacity *= this.#extendRatio;
            this.#buckets = Array(this.#capacity).fill(null);
            this.#size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.#TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
        private size: number; // 鍵值對數量
        private capacity: number; // 雜湊表容量
        private loadThres: number; // 觸發容量擴充的負載因子門檻
        private extendRatio: number; // 容量擴充倍數
        private buckets: Array<Pair | null>; // 桶陣列
        private TOMBSTONE: Pair; // 刪除標記

        /* 建構方法 */
        constructor() {
            this.size = 0; // 鍵值對數量
            this.capacity = 4; // 雜湊表容量
            this.loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
            this.extendRatio = 2; // 容量擴充倍數
            this.buckets = Array(this.capacity).fill(null); // 桶陣列
            this.TOMBSTONE = new Pair(-1, '-1'); // 刪除標記
        }

        /* 雜湊函式 */
        private hashFunc(key: number): number {
            return key % this.capacity;
        }

        /* 負載因子 */
        private loadFactor(): number {
            return this.size / this.capacity;
        }

        /* 尋找 key 對應的桶索引 */
        private findBucket(key: number): number {
            let index = this.hashFunc(key);
            let firstTombstone = -1;
            // 進行線性探測，遇到空桶就跳出迴圈
            while (this.buckets[index] !== null) {
                // 若遇到 key，回傳對應的桶索引
                if (this.buckets[index]!.key === key) {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if (firstTombstone !== -1) {
                        this.buckets[firstTombstone] = this.buckets[index];
                        this.buckets[index] = this.TOMBSTONE;
                        return firstTombstone; // 回傳移動後的桶索引
                    }
                    return index; // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if (
                    firstTombstone === -1 &&
                    this.buckets[index] === this.TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % this.capacity;
            }
            // 若 key 不存在，回傳可插入位置的索引
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* 查詢操作 */
        get(key: number): string | null {
            // 尋找 key 對應的桶索引
            const index = this.findBucket(key);
            // 若找到鍵值對，回傳對應的 val
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                return this.buckets[index]!.val;
            }
            // 若鍵值對不存在，回傳 null
            return null;
        }

        /* 新增操作 */
        put(key: number, val: string): void {
            // 當負載因子超過門檻時，擴充容量
            if (this.loadFactor() > this.loadThres) {
                this.extend();
            }
            // 尋找 key 對應的桶索引
            const index = this.findBucket(key);
            // 若找到鍵值對，覆寫 val 並結束操作
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index]!.val = val;
                return;
            }
            // 若鍵值對不存在，新增該鍵值對
            this.buckets[index] = new Pair(key, val);
            this.size++;
        }

        /* 刪除操作 */
        remove(key: number): void {
            // 尋找 key 對應的桶索引
            const index = this.findBucket(key);
            // 若找到鍵值對，以刪除標記取代它
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index] = this.TOMBSTONE;
                this.size--;
            }
        }

        /* 擴充雜湊表容量 */
        private extend(): void {
            // 暫存原本的雜湊表
            const bucketsTmp = this.buckets;
            // 初始化擴充後的新雜湊表
            this.capacity *= this.extendRatio;
            this.buckets = Array(this.capacity).fill(null);
            this.size = 0;
            // 將鍵值對從原本的雜湊表移到新表
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
      late int _size; // 鍵值對數量
      int _capacity = 4; // 雜湊表容量
      double _loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
      int _extendRatio = 2; // 容量擴充倍數
      late List<Pair?> _buckets; // 桶陣列
      Pair _TOMBSTONE = Pair(-1, "-1"); // 刪除標記

      /* 建構方法 */
      HashMapOpenAddressing() {
        _size = 0;
        _buckets = List.generate(_capacity, (index) => null);
      }

      /* 雜湊函式 */
      int hashFunc(int key) {
        return key % _capacity;
      }

      /* 負載因子 */
      double loadFactor() {
        return _size / _capacity;
      }

      /* 尋找 key 對應的桶索引 */
      int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        for (int i = 0; i < _capacity; i++) {
          final bucket = _buckets[index];
          if (bucket == null) break;
          // 記錄遇到的第一個刪除標記
          if (identical(bucket, _TOMBSTONE)) {
            if (firstTombstone == -1) firstTombstone = index;
          } else if (bucket.key == key) {
            // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
            if (firstTombstone != -1) {
              _buckets[firstTombstone] = bucket;
              _buckets[index] = _TOMBSTONE;
              return firstTombstone; // 回傳移動後的桶索引
            }
            return index; // 回傳桶索引
          }
          // 計算桶索引，超過陣列尾端就回到開頭
          index = (index + 1) % _capacity;
        }
        // 若 key 不存在，回傳可插入位置的索引
        return firstTombstone == -1 ? index : firstTombstone;
      }

      /* 查詢操作 */
      String? get(int key) {
        // 尋找 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，回傳對應的 val
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          return _buckets[index]!.val;
        }
        // 若鍵值對不存在，回傳 null
        return null;
      }

      /* 新增操作 */
      void put(int key, String val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > _loadThres) {
          extend();
        }
        // 尋找 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，覆寫 val 並結束操作
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index]!.val = val;
          return;
        }
        // 若鍵值對不存在，新增該鍵值對
        _buckets[index] = new Pair(key, val);
        _size++;
      }

      /* 刪除操作 */
      void remove(int key) {
        // 尋找 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，以刪除標記取代它
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index] = _TOMBSTONE;
          _size--;
        }
      }

      /* 擴充雜湊表容量 */
      void extend() {
        // 暫存原本的雜湊表
        List<Pair?> bucketsTmp = _buckets;
        // 初始化擴充後的新雜湊表
        _capacity *= _extendRatio;
        _buckets = List.generate(_capacity, (index) => null);
        _size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (Pair? pair in bucketsTmp) {
          if (pair != null && pair != _TOMBSTONE) {
            put(pair.key, pair.val);
          }
        }
      }

      /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    struct HashMapOpenAddressing {
        size: usize,                // 鍵值對數量
        capacity: usize,            // 雜湊表容量
        load_thres: f64,            // 觸發容量擴充的負載因子門檻
        extend_ratio: usize,        // 容量擴充倍數
        buckets: Vec<Option<Pair>>, // 桶陣列
        TOMBSTONE: Option<Pair>,    // 刪除標記
    }

    impl HashMapOpenAddressing {
        /* 建構方法 */
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

        /* 雜湊函式 */
        fn hash_func(&self, key: i32) -> usize {
            (key % self.capacity as i32) as usize
        }

        /* 負載因子 */
        fn load_factor(&self) -> f64 {
            self.size as f64 / self.capacity as f64
        }

        /* 尋找 key 對應的桶索引 */
        fn find_bucket(&mut self, key: i32) -> usize {
            let mut index = self.hash_func(key);
            let mut first_tombstone = -1;
            // 進行線性探測，遇到空桶就跳出迴圈
            while self.buckets[index].is_some() {
                // 若遇到 key，回傳對應的桶索引
                if self.buckets[index].as_ref().unwrap().key == key {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if first_tombstone != -1 {
                        self.buckets[first_tombstone as usize] = self.buckets[index].take();
                        self.buckets[index] = self.TOMBSTONE.clone();
                        return first_tombstone as usize; // 回傳移動後的桶索引
                    }
                    return index; // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                    first_tombstone = index as i32;
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % self.capacity;
            }
            // 若 key 不存在，回傳可插入位置的索引
            if first_tombstone == -1 {
                index
            } else {
                first_tombstone as usize
            }
        }

        /* 查詢操作 */
        fn get(&mut self, key: i32) -> Option<&str> {
            // 尋找 key 對應的桶索引
            let index = self.find_bucket(key);
            // 若找到鍵值對，回傳對應的 val
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
            }
            // 若鍵值對不存在，回傳 null
            None
        }

        /* 新增操作 */
        fn put(&mut self, key: i32, val: String) {
            // 當負載因子超過門檻時，擴充容量
            if self.load_factor() > self.load_thres {
                self.extend();
            }
            // 尋找 key 對應的桶索引
            let index = self.find_bucket(key);
            // 若找到鍵值對，覆寫 val 並結束操作
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index].as_mut().unwrap().val = val;
                return;
            }
            // 若鍵值對不存在，新增該鍵值對
            self.buckets[index] = Some(Pair { key, val });
            self.size += 1;
        }

        /* 刪除操作 */
        fn remove(&mut self, key: i32) {
            // 尋找 key 對應的桶索引
            let index = self.find_bucket(key);
            // 若找到鍵值對，以刪除標記取代它
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index] = self.TOMBSTONE.clone();
                self.size -= 1;
            }
        }

        /* 擴充雜湊表容量 */
        fn extend(&mut self) {
            // 暫存原本的雜湊表
            let buckets_tmp = self.buckets.clone();
            // 初始化擴充後的新雜湊表
            self.capacity *= self.extend_ratio;
            self.buckets = vec![None; self.capacity];
            self.size = 0;

            // 將鍵值對從原本的雜湊表移到新表
            for pair in buckets_tmp {
                if pair.is_none() || pair == self.TOMBSTONE {
                    continue;
                }
                let pair = pair.unwrap();

                self.put(pair.key, pair.val);
            }
        }
        /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    typedef struct {
        int size;         // 鍵值對數量
        int capacity;     // 雜湊表容量
        double loadThres; // 觸發容量擴充的負載因子門檻
        int extendRatio;  // 容量擴充倍數
        Pair **buckets;   // 桶陣列
        Pair *TOMBSTONE;  // 刪除標記
    } HashMapOpenAddressing;

    /* 建構函式 */
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

    /* 解構函式 */
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

    /* 雜湊函式 */
    int hashFunc(HashMapOpenAddressing *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* 負載因子 */
    double loadFactor(HashMapOpenAddressing *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* 尋找 key 對應的桶索引 */
    int findBucket(HashMapOpenAddressing *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        int firstTombstone = -1;
        // 進行線性探測，遇到空桶就跳出迴圈
        while (hashMap->buckets[index] != NULL) {
            // 若遇到 key，回傳對應的桶索引
            if (hashMap->buckets[index]->key == key) {
                // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if (firstTombstone != -1) {
                    hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                    hashMap->buckets[index] = hashMap->TOMBSTONE;
                    return firstTombstone; // 回傳移動後的桶索引
                }
                return index; // 回傳桶索引
            }
            // 記錄遇到的第一個刪除標記
            if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
                firstTombstone = index;
            }
            // 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % hashMap->capacity;
        }
        // 若 key 不存在，回傳可插入位置的索引
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 查詢操作 */
    char *get(HashMapOpenAddressing *hashMap, int key) {
        // 尋找 key 對應的桶索引
        int index = findBucket(hashMap, key);
        // 若找到鍵值對，回傳對應的 val
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            return hashMap->buckets[index]->val;
        }
        // 若鍵值對不存在，回傳空字串
        return "";
    }

    /* 新增操作 */
    void put(HashMapOpenAddressing *hashMap, int key, char *val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        // 尋找 key 對應的桶索引
        int index = findBucket(hashMap, key);
        // 若找到鍵值對，覆寫 val 並結束操作
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            free(hashMap->buckets[index]->val);
            hashMap->buckets[index]->val = (char *)malloc(strlen(val) + 1);
            strcpy(hashMap->buckets[index]->val, val);
            hashMap->buckets[index]->val[strlen(val)] = '\0';
            return;
        }
        // 若鍵值對不存在，新增該鍵值對
        Pair *pair = (Pair *)malloc(sizeof(Pair));
        pair->key = key;
        pair->val = (char *)malloc(strlen(val) + 1);
        strcpy(pair->val, val);
        pair->val[strlen(val)] = '\0';

        hashMap->buckets[index] = pair;
        hashMap->size++;
    }

    /* 刪除操作 */
    void removeItem(HashMapOpenAddressing *hashMap, int key) {
        // 尋找 key 對應的桶索引
        int index = findBucket(hashMap, key);
        // 若找到鍵值對，以刪除標記取代它
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            Pair *pair = hashMap->buckets[index];
            free(pair->val);
            free(pair);
            hashMap->buckets[index] = hashMap->TOMBSTONE;
            hashMap->size--;
        }
    }

    /* 擴充雜湊表容量 */
    void extend(HashMapOpenAddressing *hashMap) {
        // 暫存原本的雜湊表
        Pair **bucketsTmp = hashMap->buckets;
        int oldCapacity = hashMap->capacity;
        // 初始化擴充後的新雜湊表
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
        hashMap->size = 0;
        // 將鍵值對從原本的雜湊表移到新表
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

    /* 印出雜湊表 */
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
    /* 採用開放定址法的雜湊表 */
    class HashMapOpenAddressing {
        private var size: Int               // 鍵值對數量
        private var capacity: Int           // 雜湊表容量
        private val loadThres: Double       // 觸發容量擴充的負載因子門檻
        private val extendRatio: Int        // 容量擴充倍數
        private var buckets: Array<Pair?>   // 桶陣列
        private val TOMBSTONE: Pair         // 刪除標記

        /* 建構方法 */
        init {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = arrayOfNulls(capacity)
            TOMBSTONE = Pair(-1, "-1")
        }

        /* 雜湊函式 */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* 負載因子 */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* 尋找 key 對應的桶索引 */
        fun findBucket(key: Int): Int {
            var index = hashFunc(key)
            var firstTombstone = -1
            // 進行線性探測，遇到空桶就跳出迴圈
            while (buckets[index] != null) {
                // 若遇到 key，回傳對應的桶索引
                if (buckets[index]?.key == key) {
                    // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // 回傳移動後的桶索引
                    }
                    return index // 回傳桶索引
                }
                // 記錄遇到的第一個刪除標記
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index
                }
                // 計算桶索引，超過陣列尾端就回到開頭
                index = (index + 1) % capacity
            }
            // 若 key 不存在，回傳可插入位置的索引
            return if (firstTombstone == -1) index else firstTombstone
        }

        /* 查詢操作 */
        fun get(key: Int): String? {
            // 尋找 key 對應的桶索引
            val index = findBucket(key)
            // 若找到鍵值對，回傳對應的 val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index]?._val
            }
            // 若鍵值對不存在，回傳 null
            return null
        }

        /* 新增操作 */
        fun put(key: Int, _val: String) {
            // 當負載因子超過門檻時，擴充容量
            if (loadFactor() > loadThres) {
                extend()
            }
            // 尋找 key 對應的桶索引
            val index = findBucket(key)
            // 若找到鍵值對，覆寫 val 並結束操作
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index]!!._val = _val
                return
            }
            // 若鍵值對不存在，新增該鍵值對
            buckets[index] = Pair(key, _val)
            size++
        }

        /* 刪除操作 */
        fun remove(key: Int) {
            // 尋找 key 對應的桶索引
            val index = findBucket(key)
            // 若找到鍵值對，以刪除標記取代它
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE
                size--
            }
        }

        /* 擴充雜湊表容量 */
        fun extend() {
            // 暫存原本的雜湊表
            val bucketsTmp = buckets
            // 初始化擴充後的新雜湊表
            capacity *= extendRatio
            buckets = arrayOfNulls(capacity)
            size = 0
            // 將鍵值對從原本的雜湊表移到新表
            for (pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* 印出雜湊表 */
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
    ### 採用開放定址法的雜湊表 ###
    class HashMapOpenAddressing
      TOMBSTONE = Pair.new(-1, '-1') # 刪除標記

      ### 建構方法 ###
      def initialize
        @size = 0 # 鍵值對數量
        @capacity = 4 # 雜湊表容量
        @load_thres = 2.0 / 3.0 # 觸發容量擴充的負載因子門檻
        @extend_ratio = 2 # 容量擴充倍數
        @buckets = Array.new(@capacity) # 桶陣列
      end

      ### 雜湊函式 ###
      def hash_func(key)
        key % @capacity
      end

      ### 負載因子 ###
      def load_factor
        @size / @capacity.to_f
      end

      ### 尋找 key 對應的桶索引 ###
      def find_bucket(key)
        index = hash_func(key)
        first_tombstone = -1
        # 進行線性探測，遇到空桶就跳出迴圈
        while !@buckets[index].nil?
          # 若遇到 key，回傳對應的桶索引
          if @buckets[index].key == key
            # 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
            if first_tombstone != -1
              @buckets[first_tombstone] = @buckets[index]
              @buckets[index] = TOMBSTONE
              return first_tombstone # 回傳移動後的桶索引
            end
            return index # 回傳桶索引
          end
          # 記錄遇到的第一個刪除標記
          first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
          # 計算桶索引，超過陣列尾端就回到開頭
          index = (index + 1) % @capacity
        end
        # 若 key 不存在，回傳可插入位置的索引
        first_tombstone == -1 ? index : first_tombstone
      end

      ### 查詢操作 ###
      def get(key)
        # 尋找 key 對應的桶索引
        index = find_bucket(key)
        # 若找到鍵值對，回傳對應的 val
        return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
        # 若鍵值對不存在，回傳 nil
        nil
      end

      ### 新增操作 ###
      def put(key, val)
        # 當負載因子超過門檻時，擴充容量
        extend if load_factor > @load_thres
        # 尋找 key 對應的桶索引
        index = find_bucket(key)
        # 若找到鍵值對，覆寫 val 並結束操作
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index].val = val
          return
        end
        # 若鍵值對不存在，新增該鍵值對
        @buckets[index] = Pair.new(key, val)
        @size += 1
      end

      ### 刪除操作 ###
      def remove(key)
        # 尋找 key 對應的桶索引
        index = find_bucket(key)
        # 若找到鍵值對，以刪除標記取代它
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index] = TOMBSTONE
          @size -= 1
        end
      end

      ### 擴充雜湊表容量 ###
      def extend
        # 暫存原本的雜湊表
        buckets_tmp = @buckets
        # 初始化擴充後的新雜湊表
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity)
        @size = 0
        # 將鍵值對從原本的雜湊表移到新表
        for pair in buckets_tmp
          put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
        end
      end

      ### 印出雜湊表 ###
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

### 2. &nbsp; 平方探測

和線性探測一樣，平方探測也是開放定址法的常見策略。發生碰撞時，平方探測跳過的步數並不固定，而是取「探測次數的平方」，也就是 $1, 4, 9, \dots$ 步。

平方探測有以下優點。

- 每次探測都跳過相當於探測次數平方的距離，有助於緩解線性探測造成的群聚現象。
- 平方探測會跨越較大的距離來尋找空位，有助於讓資料分布得更均勻。

不過，平方探測也有侷限。

- 群聚現象仍可能發生，某些位置比其他位置更容易被占用。
- 由於平方值的成長方式，探測可能無法涵蓋整個雜湊表。也就是說，即使表中有空桶，平方探測也可能無法到達那裡。

### 3. &nbsp; 多重雜湊

顧名思義，多重雜湊使用多個雜湊函式 $f_1(x)$、$f_2(x)$、$f_3(x)$、$\dots$ 來探測。

- **插入元素**：若使用雜湊函式 $f_1(x)$ 時發生碰撞，就改試 $f_2(x)$，依此類推，直到找到空位再插入元素。
- **查找元素**：以相同順序使用各個雜湊函式查找，找到目標元素後就回傳。如果遇到空位，或已試過所有雜湊函式仍未找到，便表示該元素不在雜湊表中，回傳 `None`。

與線性探測相比，多重雜湊較不容易產生群聚，但使用多個雜湊函式也會增加計算量。

!!! tip

    請留意，採用開放定址法的雜湊表，無論使用線性探測、平方探測或多重雜湊，都有「不能直接刪除元素」的問題。

## 6.2.3 &nbsp; 各種程式語言的選擇

不同程式語言採用的雜湊表實作策略各有不同，以下是幾個例子。

- Python 採用開放定址法，字典 `dict` 使用虛擬亂數進行探測。
- Java 採用鏈結法。從 JDK 1.8 開始，當 `HashMap` 內部的陣列長度達到 64，且鏈結串列的長度達到 8 時，就會將串列轉為紅黑樹，以提升查找效能。
- 從 Go 1.24 開始，內建的 `map` 預設採用以 Swiss Table 為基礎的開放定址實作。Go 1.23 及更早的版本採用鏈結法，每個桶最多可存放 8 個鍵值對，超過容量時便連接溢位桶。
