---
comments: true
---

# 6.2 &nbsp; 哈希冲突

上一节提到，**通常情况下哈希函数的输入空间远大于输出空间**，因此理论上哈希冲突是不可避免的。比如，输入空间为全体整数，输出空间为数组容量大小，则必然有多个整数映射至同一桶索引。

哈希冲突会导致查询结果错误，严重影响哈希表的可用性。为解决该问题，我们可以每当遇到哈希冲突就进行哈希表扩容，直至冲突消失为止。此方法简单粗暴且有效，但效率太低，因为哈希表扩容需要进行大量的数据搬运与哈希值计算。为了提升效率，我们可以采用以下策略。

1. 改良哈希表数据结构，**使得哈希表可以在出现哈希冲突时正常工作**。
2. 仅在必要时，即当哈希冲突比较严重时，才执行扩容操作。

哈希表的结构改良方法主要包括“链式地址”和“开放寻址”。

## 6.2.1 &nbsp; 链式地址

在原始哈希表中，每个桶仅能存储一个键值对。「链式地址 separate chaining」将单个元素转换为链表，将键值对作为链表节点，将所有发生冲突的键值对都存储在同一链表中。图 6-5 展示了一个链式地址哈希表的例子。

![链式地址哈希表](hash_collision.assets/hash_table_chaining.png){ class="animation-figure" }

<p align="center"> 图 6-5 &nbsp; 链式地址哈希表 </p>

基于链式地址实现的哈希表的操作方法发生了以下变化。

- **查询元素**：输入 `key` ，经过哈希函数得到桶索引，即可访问链表头节点，然后遍历链表并对比 `key` 以查找目标键值对。
- **添加元素**：首先通过哈希函数访问链表头节点，然后将节点（键值对）添加到链表中。
- **删除元素**：根据哈希函数的结果访问链表头部，接着遍历链表以查找目标节点并将其删除。

链式地址存在以下局限性。

- **占用空间增大**，链表包含节点指针，它相比数组更加耗费内存空间。
- **查询效率降低**，因为需要线性遍历链表来查找对应元素。

以下代码给出了链式地址哈希表的简单实现，需要注意两点。

- 使用列表（动态数组）代替链表，从而简化代码。在这种设定下，哈希表（数组）包含多个桶，每个桶都是一个列表。
- 以下实现包含哈希表扩容方法。当负载因子超过 $\frac{2}{3}$ 时，我们将哈希表扩容至原先的 $2$ 倍。

=== "Python"

    ```python title="hash_map_chaining.py"
    class HashMapChaining:
        """链式地址哈希表"""

        def __init__(self):
            """构造方法"""
            self.size = 0  # 键值对数量
            self.capacity = 4  # 哈希表容量
            self.load_thres = 2.0 / 3.0  # 触发扩容的负载因子阈值
            self.extend_ratio = 2  # 扩容倍数
            self.buckets = [[] for _ in range(self.capacity)]  # 桶数组

        def hash_func(self, key: int) -> int:
            """哈希函数"""
            return key % self.capacity

        def load_factor(self) -> float:
            """负载因子"""
            return self.size / self.capacity

        def get(self, key: int) -> str | None:
            """查询操作"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # 遍历桶，若找到 key 则返回对应 val
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # 若未找到 key 则返回 None
            return None

        def put(self, key: int, val: str):
            """添加操作"""
            # 当负载因子超过阈值时，执行扩容
            if self.load_factor() > self.load_thres:
                self.extend()
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for pair in bucket:
                if pair.key == key:
                    pair.val = val
                    return
            # 若无该 key ，则将键值对添加至尾部
            pair = Pair(key, val)
            bucket.append(pair)
            self.size += 1

        def remove(self, key: int):
            """删除操作"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # 遍历桶，从中删除键值对
            for pair in bucket:
                if pair.key == key:
                    bucket.remove(pair)
                    self.size -= 1
                    break

        def extend(self):
            """扩容哈希表"""
            # 暂存原哈希表
            buckets = self.buckets
            # 初始化扩容后的新哈希表
            self.capacity *= self.extend_ratio
            self.buckets = [[] for _ in range(self.capacity)]
            self.size = 0
            # 将键值对从原哈希表搬运至新哈希表
            for bucket in buckets:
                for pair in bucket:
                    self.put(pair.key, pair.val)

        def print(self):
            """打印哈希表"""
            for bucket in self.buckets:
                res = []
                for pair in bucket:
                    res.append(str(pair.key) + " -> " + pair.val)
                print(res)
    ```

=== "C++"

    ```cpp title="hash_map_chaining.cpp"
    /* 链式地址哈希表 */
    class HashMapChaining {
      private:
        int size;                       // 键值对数量
        int capacity;                   // 哈希表容量
        double loadThres;               // 触发扩容的负载因子阈值
        int extendRatio;                // 扩容倍数
        vector<vector<Pair *>> buckets; // 桶数组

      public:
        /* 构造方法 */
        HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
            buckets.resize(capacity);
        }

        /* 析构方法 */
        ~HashMapChaining() {
            for (auto &bucket : buckets) {
                for (Pair *pair : bucket) {
                    // 释放内存
                    delete pair;
                }
            }
        }

        /* 哈希函数 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 负载因子 */
        double loadFactor() {
            return (double)size / (double)capacity;
        }

        /* 查询操作 */
        string get(int key) {
            int index = hashFunc(key);
            // 遍历桶，若找到 key 则返回对应 val
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    return pair->val;
                }
            }
            // 若未找到 key 则返回空字符串
            return "";
        }

        /* 添加操作 */
        void put(int key, string val) {
            // 当负载因子超过阈值时，执行扩容
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    pair->val = val;
                    return;
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            buckets[index].push_back(new Pair(key, val));
            size++;
        }

        /* 删除操作 */
        void remove(int key) {
            int index = hashFunc(key);
            auto &bucket = buckets[index];
            // 遍历桶，从中删除键值对
            for (int i = 0; i < bucket.size(); i++) {
                if (bucket[i]->key == key) {
                    Pair *tmp = bucket[i];
                    bucket.erase(bucket.begin() + i); // 从中删除键值对
                    delete tmp;                       // 释放内存
                    size--;
                    return;
                }
            }
        }

        /* 扩容哈希表 */
        void extend() {
            // 暂存原哈希表
            vector<vector<Pair *>> bucketsTmp = buckets;
            // 初始化扩容后的新哈希表
            capacity *= extendRatio;
            buckets.clear();
            buckets.resize(capacity);
            size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (auto &bucket : bucketsTmp) {
                for (Pair *pair : bucket) {
                    put(pair->key, pair->val);
                    // 释放内存
                    delete pair;
                }
            }
        }

        /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    class HashMapChaining {
        int size; // 键值对数量
        int capacity; // 哈希表容量
        double loadThres; // 触发扩容的负载因子阈值
        int extendRatio; // 扩容倍数
        List<List<Pair>> buckets; // 桶数组

        /* 构造方法 */
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

        /* 哈希函数 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 负载因子 */
        double loadFactor() {
            return (double) size / capacity;
        }

        /* 查询操作 */
        String get(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // 遍历桶，若找到 key 则返回对应 val
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // 若未找到 key 则返回 null
            return null;
        }

        /* 添加操作 */
        void put(int key, String val) {
            // 当负载因子超过阈值时，执行扩容
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            Pair pair = new Pair(key, val);
            bucket.add(pair);
            size++;
        }

        /* 删除操作 */
        void remove(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // 遍历桶，从中删除键值对
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    bucket.remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* 扩容哈希表 */
        void extend() {
            // 暂存原哈希表
            List<List<Pair>> bucketsTmp = buckets;
            // 初始化扩容后的新哈希表
            capacity *= extendRatio;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
            size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (List<Pair> bucket : bucketsTmp) {
                for (Pair pair : bucket) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    class HashMapChaining {
        int size; // 键值对数量
        int capacity; // 哈希表容量
        double loadThres; // 触发扩容的负载因子阈值
        int extendRatio; // 扩容倍数
        List<List<Pair>> buckets; // 桶数组

        /* 构造方法 */
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

        /* 哈希函数 */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* 负载因子 */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* 查询操作 */
        public string? Get(int key) {
            int index = HashFunc(key);
            // 遍历桶，若找到 key 则返回对应 val
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // 若未找到 key 则返回 null
            return null;
        }

        /* 添加操作 */
        public void Put(int key, string val) {
            // 当负载因子超过阈值时，执行扩容
            if (LoadFactor() > loadThres) {
                Extend();
            }
            int index = HashFunc(key);
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            buckets[index].Add(new Pair(key, val));
            size++;
        }

        /* 删除操作 */
        public void Remove(int key) {
            int index = HashFunc(key);
            // 遍历桶，从中删除键值对
            foreach (Pair pair in buckets[index].ToList()) {
                if (pair.key == key) {
                    buckets[index].Remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* 扩容哈希表 */
        void Extend() {
            // 暂存原哈希表
            List<List<Pair>> bucketsTmp = buckets;
            // 初始化扩容后的新哈希表
            capacity *= extendRatio;
            buckets = new List<List<Pair>>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.Add([]);
            }
            size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            foreach (List<Pair> bucket in bucketsTmp) {
                foreach (Pair pair in bucket) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    type hashMapChaining struct {
        size        int      // 键值对数量
        capacity    int      // 哈希表容量
        loadThres   float64  // 触发扩容的负载因子阈值
        extendRatio int      // 扩容倍数
        buckets     [][]pair // 桶数组
    }

    /* 构造方法 */
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

    /* 哈希函数 */
    func (m *hashMapChaining) hashFunc(key int) int {
        return key % m.capacity
    }

    /* 负载因子 */
    func (m *hashMapChaining) loadFactor() float64 {
        return float64(m.size / m.capacity)
    }

    /* 查询操作 */
    func (m *hashMapChaining) get(key int) string {
        idx := m.hashFunc(key)
        bucket := m.buckets[idx]
        // 遍历桶，若找到 key 则返回对应 val
        for _, p := range bucket {
            if p.key == key {
                return p.val
            }
        }
        // 若未找到 key 则返回空字符串
        return ""
    }

    /* 添加操作 */
    func (m *hashMapChaining) put(key int, val string) {
        // 当负载因子超过阈值时，执行扩容
        if m.loadFactor() > m.loadThres {
            m.extend()
        }
        idx := m.hashFunc(key)
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for _, p := range m.buckets[idx] {
            if p.key == key {
                p.val = val
                return
            }
        }
        // 若无该 key ，则将键值对添加至尾部
        p := pair{
            key: key,
            val: val,
        }
        m.buckets[idx] = append(m.buckets[idx], p)
        m.size += 1
    }

    /* 删除操作 */
    func (m *hashMapChaining) remove(key int) {
        idx := m.hashFunc(key)
        // 遍历桶，从中删除键值对
        for i, p := range m.buckets[idx] {
            if p.key == key {
                // 切片删除
                m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
                m.size -= 1
                break
            }
        }
    }

    /* 扩容哈希表 */
    func (m *hashMapChaining) extend() {
        // 暂存原哈希表
        tmpBuckets := make([][]pair, len(m.buckets))
        for i := 0; i < len(m.buckets); i++ {
            tmpBuckets[i] = make([]pair, len(m.buckets[i]))
            copy(tmpBuckets[i], m.buckets[i])
        }
        // 初始化扩容后的新哈希表
        m.capacity *= m.extendRatio
        m.buckets = make([][]pair, m.capacity)
        for i := 0; i < m.capacity; i++ {
            m.buckets[i] = make([]pair, 0)
        }
        m.size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for _, bucket := range tmpBuckets {
            for _, p := range bucket {
                m.put(p.key, p.val)
            }
        }
    }

    /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    class HashMapChaining {
        var size: Int // 键值对数量
        var capacity: Int // 哈希表容量
        var loadThres: Double // 触发扩容的负载因子阈值
        var extendRatio: Int // 扩容倍数
        var buckets: [[Pair]] // 桶数组

        /* 构造方法 */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: [], count: capacity)
        }

        /* 哈希函数 */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* 负载因子 */
        func loadFactor() -> Double {
            Double(size / capacity)
        }

        /* 查询操作 */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 遍历桶，若找到 key 则返回对应 val
            for pair in bucket {
                if pair.key == key {
                    return pair.val
                }
            }
            // 若未找到 key 则返回 nil
            return nil
        }

        /* 添加操作 */
        func put(key: Int, val: String) {
            // 当负载因子超过阈值时，执行扩容
            if loadFactor() > loadThres {
                extend()
            }
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for pair in bucket {
                if pair.key == key {
                    pair.val = val
                    return
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            let pair = Pair(key: key, val: val)
            buckets[index].append(pair)
            size += 1
        }

        /* 删除操作 */
        func remove(key: Int) {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 遍历桶，从中删除键值对
            for (pairIndex, pair) in bucket.enumerated() {
                if pair.key == key {
                    buckets[index].remove(at: pairIndex)
                }
            }
            size -= 1
        }

        /* 扩容哈希表 */
        func extend() {
            // 暂存原哈希表
            let bucketsTmp = buckets
            // 初始化扩容后的新哈希表
            capacity *= extendRatio
            buckets = Array(repeating: [], count: capacity)
            size = 0
            // 将键值对从原哈希表搬运至新哈希表
            for bucket in bucketsTmp {
                for pair in bucket {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    class HashMapChaining {
        #size; // 键值对数量
        #capacity; // 哈希表容量
        #loadThres; // 触发扩容的负载因子阈值
        #extendRatio; // 扩容倍数
        #buckets; // 桶数组

        /* 构造方法 */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* 哈希函数 */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* 负载因子 */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* 查询操作 */
        get(key) {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 遍历桶，若找到 key 则返回对应 val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // 若未找到 key 则返回 null
            return null;
        }

        /* 添加操作 */
        put(key, val) {
            // 当负载因子超过阈值时，执行扩容
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* 删除操作 */
        remove(key) {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // 遍历桶，从中删除键值对
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* 扩容哈希表 */
        #extend() {
            // 暂存原哈希表
            const bucketsTmp = this.#buckets;
            // 初始化扩容后的新哈希表
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    class HashMapChaining {
        #size: number; // 键值对数量
        #capacity: number; // 哈希表容量
        #loadThres: number; // 触发扩容的负载因子阈值
        #extendRatio: number; // 扩容倍数
        #buckets: Pair[][]; // 桶数组

        /* 构造方法 */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* 哈希函数 */
        #hashFunc(key: number): number {
            return key % this.#capacity;
        }

        /* 负载因子 */
        #loadFactor(): number {
            return this.#size / this.#capacity;
        }

        /* 查询操作 */
        get(key: number): string | null {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 遍历桶，若找到 key 则返回对应 val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // 若未找到 key 则返回 null
            return null;
        }

        /* 添加操作 */
        put(key: number, val: string): void {
            // 当负载因子超过阈值时，执行扩容
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* 删除操作 */
        remove(key: number): void {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // 遍历桶，从中删除键值对
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* 扩容哈希表 */
        #extend(): void {
            // 暂存原哈希表
            const bucketsTmp = this.#buckets;
            // 初始化扩容后的新哈希表
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    class HashMapChaining {
      late int size; // 键值对数量
      late int capacity; // 哈希表容量
      late double loadThres; // 触发扩容的负载因子阈值
      late int extendRatio; // 扩容倍数
      late List<List<Pair>> buckets; // 桶数组

      /* 构造方法 */
      HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = List.generate(capacity, (_) => []);
      }

      /* 哈希函数 */
      int hashFunc(int key) {
        return key % capacity;
      }

      /* 负载因子 */
      double loadFactor() {
        return size / capacity;
      }

      /* 查询操作 */
      String? get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // 遍历桶，若找到 key 则返回对应 val
        for (Pair pair in bucket) {
          if (pair.key == key) {
            return pair.val;
          }
        }
        // 若未找到 key 则返回 null
        return null;
      }

      /* 添加操作 */
      void put(int key, String val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
          extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for (Pair pair in bucket) {
          if (pair.key == key) {
            pair.val = val;
            return;
          }
        }
        // 若无该 key ，则将键值对添加至尾部
        Pair pair = Pair(key, val);
        bucket.add(pair);
        size++;
      }

      /* 删除操作 */
      void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // 遍历桶，从中删除键值对
        for (Pair pair in bucket) {
          if (pair.key == key) {
            bucket.remove(pair);
            size--;
            break;
          }
        }
      }

      /* 扩容哈希表 */
      void extend() {
        // 暂存原哈希表
        List<List<Pair>> bucketsTmp = buckets;
        // 初始化扩容后的新哈希表
        capacity *= extendRatio;
        buckets = List.generate(capacity, (_) => []);
        size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (List<Pair> bucket in bucketsTmp) {
          for (Pair pair in bucket) {
            put(pair.key, pair.val);
          }
        }
      }

      /* 打印哈希表 */
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
    /* 链式地址哈希表 */
    struct HashMapChaining {
        size: i32,
        capacity: i32,
        load_thres: f32,
        extend_ratio: i32,
        buckets: Vec<Vec<Pair>>,
    }

    impl HashMapChaining {
        /* 构造方法 */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![vec![]; 4],
            }
        }

        /* 哈希函数 */
        fn hash_func(&self, key: i32) -> usize {
            key as usize % self.capacity as usize
        }

        /* 负载因子 */
        fn load_factor(&self) -> f32 {
            self.size as f32 / self.capacity as f32
        }

        /* 删除操作 */
        fn remove(&mut self, key: i32) -> Option<String> {
            let index = self.hash_func(key);
            let bucket = &mut self.buckets[index];

            // 遍历桶，从中删除键值对
            for i in 0..bucket.len() {
                if bucket[i].key == key {
                    let pair = bucket.remove(i);
                    self.size -= 1;
                    return Some(pair.val);
                }
            }

            // 若未找到 key 则返回 None
            None
        }

        /* 扩容哈希表 */
        fn extend(&mut self) {
            // 暂存原哈希表
            let buckets_tmp = std::mem::replace(&mut self.buckets, vec![]);

            // 初始化扩容后的新哈希表
            self.capacity *= self.extend_ratio;
            self.buckets = vec![Vec::new(); self.capacity as usize];
            self.size = 0;

            // 将键值对从原哈希表搬运至新哈希表
            for bucket in buckets_tmp {
                for pair in bucket {
                    self.put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
        fn print(&self) {
            for bucket in &self.buckets {
                let mut res = Vec::new();
                for pair in bucket {
                    res.push(format!("{} -> {}", pair.key, pair.val));
                }
                println!("{:?}", res);
            }
        }

        /* 添加操作 */
        fn put(&mut self, key: i32, val: String) {
            // 当负载因子超过阈值时，执行扩容
            if self.load_factor() > self.load_thres {
                self.extend();
            }

            let index = self.hash_func(key);
            let bucket = &mut self.buckets[index];

            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for pair in bucket {
                if pair.key == key {
                    pair.val = val.clone();
                    return;
                }
            }
            let bucket = &mut self.buckets[index];

            // 若无该 key ，则将键值对添加至尾部
            let pair = Pair {
                key,
                val: val.clone(),
            };
            bucket.push(pair);
            self.size += 1;
        }

        /* 查询操作 */
        fn get(&self, key: i32) -> Option<&str> {
            let index = self.hash_func(key);
            let bucket = &self.buckets[index];

            // 遍历桶，若找到 key 则返回对应 val
            for pair in bucket {
                if pair.key == key {
                    return Some(&pair.val);
                }
            }

            // 若未找到 key 则返回 None
            None
        }
    }
    ```

=== "C"

    ```c title="hash_map_chaining.c"
    /* 链表节点 */
    typedef struct Node {
        Pair *pair;
        struct Node *next;
    } Node;

    /* 链式地址哈希表 */
    typedef struct {
        int size;         // 键值对数量
        int capacity;     // 哈希表容量
        double loadThres; // 触发扩容的负载因子阈值
        int extendRatio;  // 扩容倍数
        Node **buckets;   // 桶数组
    } HashMapChaining;

    /* 构造函数 */
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

    /* 析构函数 */
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

    /* 哈希函数 */
    int hashFunc(HashMapChaining *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* 负载因子 */
    double loadFactor(HashMapChaining *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* 查询操作 */
    char *get(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        // 遍历桶，若找到 key 则返回对应 val
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                return cur->pair->val;
            }
            cur = cur->next;
        }
        return ""; // 若未找到 key 则返回空字符串
    }

    /* 添加操作 */
    void put(HashMapChaining *hashMap, int key, const char *val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        int index = hashFunc(hashMap, key);
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                strcpy(cur->pair->val, val); // 若遇到指定 key ，则更新对应 val 并返回
                return;
            }
            cur = cur->next;
        }
        // 若无该 key ，则将键值对添加至链表头部
        Pair *newPair = (Pair *)malloc(sizeof(Pair));
        newPair->key = key;
        strcpy(newPair->val, val);
        Node *newNode = (Node *)malloc(sizeof(Node));
        newNode->pair = newPair;
        newNode->next = hashMap->buckets[index];
        hashMap->buckets[index] = newNode;
        hashMap->size++;
    }

    /* 扩容哈希表 */
    void extend(HashMapChaining *hashMap) {
        // 暂存原哈希表
        int oldCapacity = hashMap->capacity;
        Node **oldBuckets = hashMap->buckets;
        // 初始化扩容后的新哈希表
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
        for (int i = 0; i < hashMap->capacity; i++) {
            hashMap->buckets[i] = NULL;
        }
        hashMap->size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (int i = 0; i < oldCapacity; i++) {
            Node *cur = oldBuckets[i];
            while (cur) {
                put(hashMap, cur->pair->key, cur->pair->val);
                Node *temp = cur;
                cur = cur->next;
                // 释放内存
                free(temp->pair);
                free(temp);
            }
        }

        free(oldBuckets);
    }

    /* 删除操作 */
    void removeItem(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        Node *cur = hashMap->buckets[index];
        Node *pre = NULL;
        while (cur) {
            if (cur->pair->key == key) {
                // 从中删除键值对
                if (pre) {
                    pre->next = cur->next;
                } else {
                    hashMap->buckets[index] = cur->next;
                }
                // 释放内存
                free(cur->pair);
                free(cur);
                hashMap->size--;
                return;
            }
            pre = cur;
            cur = cur->next;
        }
    }

    /* 打印哈希表 */
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

=== "Zig"

    ```zig title="hash_map_chaining.zig"
    [class]{HashMapChaining}-[func]{}
    ```

值得注意的是，当链表很长时，查询效率 $O(n)$ 很差。**此时可以将链表转换为“AVL 树”或“红黑树”**，从而将查询操作的时间复杂度优化至 $O(\log n)$ 。

## 6.2.2 &nbsp; 开放寻址

「开放寻址 open addressing」不引入额外的数据结构，而是通过“多次探测”来处理哈希冲突，探测方式主要包括线性探测、平方探测、多次哈希等。

下面以线性探测为例，介绍开放寻址哈希表的工作机制。

### 1. &nbsp; 线性探测

线性探测采用固定步长的线性搜索来进行探测，其操作方法与普通哈希表有所不同。

- **插入元素**：通过哈希函数计算桶索引，若发现桶内已有元素，则从冲突位置向后线性遍历（步长通常为 $1$ ），直至找到空桶，将元素插入其中。
- **查找元素**：若发现哈希冲突，则使用相同步长向后线性遍历，直到找到对应元素，返回 `value` 即可；如果遇到空桶，说明目标元素不在哈希表中，返回 $\text{None}$ 。

图 6-6 展示了开放寻址（线性探测）哈希表的键值对分布。根据此哈希函数，最后两位相同的 `key` 都会被映射到相同的桶。而通过线性探测，它们被依次存储在该桶以及之下的桶中。

![开放寻址和线性探测](hash_collision.assets/hash_table_linear_probing.png){ class="animation-figure" }

<p align="center"> 图 6-6 &nbsp; 开放寻址和线性探测 </p>

然而，**线性探测容易产生“聚集现象”**。具体来说，数组中连续被占用的位置越长，这些连续位置发生哈希冲突的可能性越大，从而进一步促使该位置的聚堆生长，形成恶性循环，最终导致增删查改操作效率劣化。

值得注意的是，**我们不能在开放寻址哈希表中直接删除元素**。这是因为删除元素会在数组内产生一个空桶 $\text{None}$ ，而当查询元素时，线性探测到该空桶就会返回，因此在该空桶之下的元素都无法再被访问到，程序可能误判这些元素不存在。

![在开放寻址中删除元素导致的查询问题](hash_collision.assets/hash_table_open_addressing_deletion.png){ class="animation-figure" }

<p align="center"> 图 6-7 &nbsp; 在开放寻址中删除元素导致的查询问题 </p>

为了解决该问题，我们可以采用「懒删除 lazy deletion」机制：它不直接从哈希表中移除元素，**而是利用一个常量 `TOMBSTONE` 来标记这个桶**。在该机制下，$\text{None}$ 和 `TOMBSTONE` 都代表空桶，都可以放置键值对。但不同的是，线性探测到 `TOMBSTONE` 时应该继续遍历，因为其之下可能还存在键值对。

然而，**懒删除可能会加速哈希表的性能退化**。这是因为每次删除操作都会产生一个删除标记，随着 `TOMBSTONE` 的增加，搜索时间也会增加，因为线性探测可能需要跳过多个 `TOMBSTONE` 才能找到目标元素。

为此，考虑在线性探测中记录遇到的首个 `TOMBSTONE` 的索引，并将搜索到的目标元素与该 `TOMBSTONE` 交换位置。这样做的好处是当每次查询或添加元素时，元素会被移动至距离理想位置（探测起始点）更近的桶，从而优化查询效率。

以下代码实现了一个包含懒删除的开放寻址（线性探测）哈希表。为了更加充分地使用哈希表的空间，我们将哈希表看作一个“环形数组”，当越过数组尾部时，回到头部继续遍历。

=== "Python"

    ```python title="hash_map_open_addressing.py"
    class HashMapOpenAddressing:
        """开放寻址哈希表"""

        def __init__(self):
            """构造方法"""
            self.size = 0  # 键值对数量
            self.capacity = 4  # 哈希表容量
            self.load_thres = 2.0 / 3.0  # 触发扩容的负载因子阈值
            self.extend_ratio = 2  # 扩容倍数
            self.buckets: list[Pair | None] = [None] * self.capacity  # 桶数组
            self.TOMBSTONE = Pair(-1, "-1")  # 删除标记

        def hash_func(self, key: int) -> int:
            """哈希函数"""
            return key % self.capacity

        def load_factor(self) -> float:
            """负载因子"""
            return self.size / self.capacity

        def find_bucket(self, key: int) -> int:
            """搜索 key 对应的桶索引"""
            index = self.hash_func(key)
            first_tombstone = -1
            # 线性探测，当遇到空桶时跳出
            while self.buckets[index] is not None:
                # 若遇到 key ，返回对应桶索引
                if self.buckets[index].key == key:
                    # 若之前遇到了删除标记，则将键值对移动至该索引
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = self.buckets[index]
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # 返回移动后的桶索引
                    return index  # 返回桶索引
                # 记录遇到的首个删除标记
                if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                    first_tombstone = index
                # 计算桶索引，越过尾部返回头部
                index = (index + 1) % self.capacity
            # 若 key 不存在，则返回添加点的索引
            return index if first_tombstone == -1 else first_tombstone

        def get(self, key: int) -> str:
            """查询操作"""
            # 搜索 key 对应的桶索引
            index = self.find_bucket(key)
            # 若找到键值对，则返回对应 val
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                return self.buckets[index].val
            # 若键值对不存在，则返回 None
            return None

        def put(self, key: int, val: str):
            """添加操作"""
            # 当负载因子超过阈值时，执行扩容
            if self.load_factor() > self.load_thres:
                self.extend()
            # 搜索 key 对应的桶索引
            index = self.find_bucket(key)
            # 若找到键值对，则覆盖 val 并返回
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index].val = val
                return
            # 若键值对不存在，则添加该键值对
            self.buckets[index] = Pair(key, val)
            self.size += 1

        def remove(self, key: int):
            """删除操作"""
            # 搜索 key 对应的桶索引
            index = self.find_bucket(key)
            # 若找到键值对，则用删除标记覆盖它
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index] = self.TOMBSTONE
                self.size -= 1

        def extend(self):
            """扩容哈希表"""
            # 暂存原哈希表
            buckets_tmp = self.buckets
            # 初始化扩容后的新哈希表
            self.capacity *= self.extend_ratio
            self.buckets = [None] * self.capacity
            self.size = 0
            # 将键值对从原哈希表搬运至新哈希表
            for pair in buckets_tmp:
                if pair not in [None, self.TOMBSTONE]:
                    self.put(pair.key, pair.val)

        def print(self):
            """打印哈希表"""
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
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
      private:
        int size;                             // 键值对数量
        int capacity = 4;                     // 哈希表容量
        const double loadThres = 2.0 / 3.0;     // 触发扩容的负载因子阈值
        const int extendRatio = 2;            // 扩容倍数
        vector<Pair *> buckets;               // 桶数组
        Pair *TOMBSTONE = new Pair(-1, "-1"); // 删除标记

      public:
        /* 构造方法 */
        HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
        }

        /* 析构方法 */
        ~HashMapOpenAddressing() {
            for (Pair *pair : buckets) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    delete pair;
                }
            }
            delete TOMBSTONE;
        }

        /* 哈希函数 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 负载因子 */
        double loadFactor() {
            return (double)size / capacity;
        }

        /* 搜索 key 对应的桶索引 */
        int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // 线性探测，当遇到空桶时跳出
            while (buckets[index] != nullptr) {
                // 若遇到 key ，返回对应桶索引
                if (buckets[index]->key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 返回移动后的桶索引
                    }
                    return index; // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 查询操作 */
        string get(int key) {
            // 搜索 key 对应的桶索引
            int index = findBucket(key);
            // 若找到键值对，则返回对应 val
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                return buckets[index]->val;
            }
            // 若键值对不存在，则返回空字符串
            return "";
        }

        /* 添加操作 */
        void put(int key, string val) {
            // 当负载因子超过阈值时，执行扩容
            if (loadFactor() > loadThres) {
                extend();
            }
            // 搜索 key 对应的桶索引
            int index = findBucket(key);
            // 若找到键值对，则覆盖 val 并返回
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                buckets[index]->val = val;
                return;
            }
            // 若键值对不存在，则添加该键值对
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 删除操作 */
        void remove(int key) {
            // 搜索 key 对应的桶索引
            int index = findBucket(key);
            // 若找到键值对，则用删除标记覆盖它
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                delete buckets[index];
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* 扩容哈希表 */
        void extend() {
            // 暂存原哈希表
            vector<Pair *> bucketsTmp = buckets;
            // 初始化扩容后的新哈希表
            capacity *= extendRatio;
            buckets = vector<Pair *>(capacity, nullptr);
            size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (Pair *pair : bucketsTmp) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    put(pair->key, pair->val);
                    delete pair;
                }
            }
        }

        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
        private int size; // 键值对数量
        private int capacity = 4; // 哈希表容量
        private final double loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
        private final int extendRatio = 2; // 扩容倍数
        private Pair[] buckets; // 桶数组
        private final Pair TOMBSTONE = new Pair(-1, "-1"); // 删除标记

        /* 构造方法 */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* 哈希函数 */
        private int hashFunc(int key) {
            return key % capacity;
        }

        /* 负载因子 */
        private double loadFactor() {
            return (double) size / capacity;
        }

        /* 搜索 key 对应的桶索引 */
        private int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // 线性探测，当遇到空桶时跳出
            while (buckets[index] != null) {
                // 若遇到 key ，返回对应桶索引
                if (buckets[index].key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 返回移动后的桶索引
                    }
                    return index; // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 查询操作 */
        public String get(int key) {
            // 搜索 key 对应的桶索引
            int index = findBucket(key);
            // 若找到键值对，则返回对应 val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // 若键值对不存在，则返回 null
            return null;
        }

        /* 添加操作 */
        public void put(int key, String val) {
            // 当负载因子超过阈值时，执行扩容
            if (loadFactor() > loadThres) {
                extend();
            }
            // 搜索 key 对应的桶索引
            int index = findBucket(key);
            // 若找到键值对，则覆盖 val 并返回
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // 若键值对不存在，则添加该键值对
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 删除操作 */
        public void remove(int key) {
            // 搜索 key 对应的桶索引
            int index = findBucket(key);
            // 若找到键值对，则用删除标记覆盖它
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* 扩容哈希表 */
        private void extend() {
            // 暂存原哈希表
            Pair[] bucketsTmp = buckets;
            // 初始化扩容后的新哈希表
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (Pair pair : bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
        int size; // 键值对数量
        int capacity = 4; // 哈希表容量
        double loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
        int extendRatio = 2; // 扩容倍数
        Pair[] buckets; // 桶数组
        Pair TOMBSTONE = new(-1, "-1"); // 删除标记

        /* 构造方法 */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* 哈希函数 */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* 负载因子 */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* 搜索 key 对应的桶索引 */
        int FindBucket(int key) {
            int index = HashFunc(key);
            int firstTombstone = -1;
            // 线性探测，当遇到空桶时跳出
            while (buckets[index] != null) {
                // 若遇到 key ，返回对应桶索引
                if (buckets[index].key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 返回移动后的桶索引
                    }
                    return index; // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 查询操作 */
        public string? Get(int key) {
            // 搜索 key 对应的桶索引
            int index = FindBucket(key);
            // 若找到键值对，则返回对应 val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // 若键值对不存在，则返回 null
            return null;
        }

        /* 添加操作 */
        public void Put(int key, string val) {
            // 当负载因子超过阈值时，执行扩容
            if (LoadFactor() > loadThres) {
                Extend();
            }
            // 搜索 key 对应的桶索引
            int index = FindBucket(key);
            // 若找到键值对，则覆盖 val 并返回
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // 若键值对不存在，则添加该键值对
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 删除操作 */
        public void Remove(int key) {
            // 搜索 key 对应的桶索引
            int index = FindBucket(key);
            // 若找到键值对，则用删除标记覆盖它
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* 扩容哈希表 */
        void Extend() {
            // 暂存原哈希表
            Pair[] bucketsTmp = buckets;
            // 初始化扩容后的新哈希表
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            foreach (Pair pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    type hashMapOpenAddressing struct {
        size        int     // 键值对数量
        capacity    int     // 哈希表容量
        loadThres   float64 // 触发扩容的负载因子阈值
        extendRatio int     // 扩容倍数
        buckets     []pair  // 桶数组
        removed     pair    // 删除标记
    }

    /* 构造方法 */
    func newHashMapOpenAddressing() *hashMapOpenAddressing {
        buckets := make([]pair, 4)
        return &hashMapOpenAddressing{
            size:        0,
            capacity:    4,
            loadThres:   2.0 / 3.0,
            extendRatio: 2,
            buckets:     buckets,
            removed: pair{
                key: -1,
                val: "-1",
            },
        }
    }

    /* 哈希函数 */
    func (m *hashMapOpenAddressing) hashFunc(key int) int {
        return key % m.capacity
    }

    /* 负载因子 */
    func (m *hashMapOpenAddressing) loadFactor() float64 {
        return float64(m.size) / float64(m.capacity)
    }

    /* 查询操作 */
    func (m *hashMapOpenAddressing) get(key int) string {
        idx := m.hashFunc(key)
        // 线性探测，从 index 开始向后遍历
        for i := 0; i < m.capacity; i++ {
            // 计算桶索引，越过尾部返回头部
            j := (idx + i) % m.capacity
            // 若遇到空桶，说明无此 key ，则返回 null
            if m.buckets[j] == (pair{}) {
                return ""
            }
            // 若遇到指定 key ，则返回对应 val
            if m.buckets[j].key == key && m.buckets[j] != m.removed {
                return m.buckets[j].val
            }
        }
        // 若未找到 key 则返回空字符串
        return ""
    }

    /* 添加操作 */
    func (m *hashMapOpenAddressing) put(key int, val string) {
        // 当负载因子超过阈值时，执行扩容
        if m.loadFactor() > m.loadThres {
            m.extend()
        }
        idx := m.hashFunc(key)
        // 线性探测，从 index 开始向后遍历
        for i := 0; i < m.capacity; i++ {
            // 计算桶索引，越过尾部返回头部
            j := (idx + i) % m.capacity
            // 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
            if m.buckets[j] == (pair{}) || m.buckets[j] == m.removed {
                m.buckets[j] = pair{
                    key: key,
                    val: val,
                }
                m.size += 1
                return
            }
            // 若遇到指定 key ，则更新对应 val
            if m.buckets[j].key == key {
                m.buckets[j].val = val
            }
        }
    }

    /* 删除操作 */
    func (m *hashMapOpenAddressing) remove(key int) {
        idx := m.hashFunc(key)
        // 遍历桶，从中删除键值对
        // 线性探测，从 index 开始向后遍历
        for i := 0; i < m.capacity; i++ {
            // 计算桶索引，越过尾部返回头部
            j := (idx + i) % m.capacity
            // 若遇到空桶，说明无此 key ，则直接返回
            if m.buckets[j] == (pair{}) {
                return
            }
            // 若遇到指定 key ，则标记删除并返回
            if m.buckets[j].key == key {
                m.buckets[j] = m.removed
                m.size -= 1
            }
        }
    }

    /* 扩容哈希表 */
    func (m *hashMapOpenAddressing) extend() {
        // 暂存原哈希表
        tmpBuckets := make([]pair, len(m.buckets))
        copy(tmpBuckets, m.buckets)

        // 初始化扩容后的新哈希表
        m.capacity *= m.extendRatio
        m.buckets = make([]pair, m.capacity)
        m.size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for _, p := range tmpBuckets {
            if p != (pair{}) && p != m.removed {
                m.put(p.key, p.val)
            }
        }
    }

    /* 打印哈希表 */
    func (m *hashMapOpenAddressing) print() {
        for _, p := range m.buckets {
            if p != (pair{}) {
                fmt.Println(strconv.Itoa(p.key) + " -> " + p.val)
            } else {
                fmt.Println("nil")
            }
        }
    }
    ```

=== "Swift"

    ```swift title="hash_map_open_addressing.swift"
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
        var size: Int // 键值对数量
        var capacity: Int // 哈希表容量
        var loadThres: Double // 触发扩容的负载因子阈值
        var extendRatio: Int // 扩容倍数
        var buckets: [Pair?] // 桶数组
        var TOMBSTONE: Pair // 删除标记

        /* 构造方法 */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: nil, count: capacity)
            TOMBSTONE = Pair(key: -1, val: "-1")
        }

        /* 哈希函数 */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* 负载因子 */
        func loadFactor() -> Double {
            Double(size / capacity)
        }

        /* 搜索 key 对应的桶索引 */
        func findBucket(key: Int) -> Int {
            var index = hashFunc(key: key)
            var firstTombstone = -1
            // 线性探测，当遇到空桶时跳出
            while buckets[index] != nil {
                // 若遇到 key ，返回对应桶索引
                if buckets[index]!.key == key {
                    // 若之前遇到了删除标记，则将键值对移动至该索引
                    if firstTombstone != -1 {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // 返回移动后的桶索引
                    }
                    return index // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                    firstTombstone = index
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % capacity
            }
            // 若 key 不存在，则返回添加点的索引
            return firstTombstone == -1 ? index : firstTombstone
        }

        /* 查询操作 */
        func get(key: Int) -> String? {
            // 搜索 key 对应的桶索引
            let index = findBucket(key: key)
            // 若找到键值对，则返回对应 val
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                return buckets[index]!.val
            }
            // 若键值对不存在，则返回 null
            return nil
        }

        /* 添加操作 */
        func put(key: Int, val: String) {
            // 当负载因子超过阈值时，执行扩容
            if loadFactor() > loadThres {
                extend()
            }
            // 搜索 key 对应的桶索引
            let index = findBucket(key: key)
            // 若找到键值对，则覆盖 val 并返回
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index]!.val = val
                return
            }
            // 若键值对不存在，则添加该键值对
            buckets[index] = Pair(key: key, val: val)
            size += 1
        }

        /* 删除操作 */
        func remove(key: Int) {
            // 搜索 key 对应的桶索引
            let index = findBucket(key: key)
            // 若找到键值对，则用删除标记覆盖它
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index] = TOMBSTONE
                size -= 1
            }
        }

        /* 扩容哈希表 */
        func extend() {
            // 暂存原哈希表
            let bucketsTmp = buckets
            // 初始化扩容后的新哈希表
            capacity *= extendRatio
            buckets = Array(repeating: nil, count: capacity)
            size = 0
            // 将键值对从原哈希表搬运至新哈希表
            for pair in bucketsTmp {
                if let pair, pair != TOMBSTONE {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
        #size; // 键值对数量
        #capacity; // 哈希表容量
        #loadThres; // 触发扩容的负载因子阈值
        #extendRatio; // 扩容倍数
        #buckets; // 桶数组
        #TOMBSTONE; // 删除标记

        /* 构造方法 */
        constructor() {
            this.#size = 0; // 键值对数量
            this.#capacity = 4; // 哈希表容量
            this.#loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
            this.#extendRatio = 2; // 扩容倍数
            this.#buckets = Array(this.#capacity).fill(null); // 桶数组
            this.#TOMBSTONE = new Pair(-1, '-1'); // 删除标记
        }

        /* 哈希函数 */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* 负载因子 */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* 搜索 key 对应的桶索引 */
        #findBucket(key) {
            let index = this.#hashFunc(key);
            let firstTombstone = -1;
            // 线性探测，当遇到空桶时跳出
            while (this.#buckets[index] !== null) {
                // 若遇到 key ，返回对应桶索引
                if (this.#buckets[index].key === key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引
                    if (firstTombstone !== -1) {
                        this.#buckets[firstTombstone] = this.#buckets[index];
                        this.#buckets[index] = this.#TOMBSTONE;
                        return firstTombstone; // 返回移动后的桶索引
                    }
                    return index; // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if (
                    firstTombstone === -1 &&
                    this.#buckets[index] === this.#TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % this.#capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* 查询操作 */
        get(key) {
            // 搜索 key 对应的桶索引
            const index = this.#findBucket(key);
            // 若找到键值对，则返回对应 val
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                return this.#buckets[index].val;
            }
            // 若键值对不存在，则返回 null
            return null;
        }

        /* 添加操作 */
        put(key, val) {
            // 当负载因子超过阈值时，执行扩容
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            // 搜索 key 对应的桶索引
            const index = this.#findBucket(key);
            // 若找到键值对，则覆盖 val 并返回
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index].val = val;
                return;
            }
            // 若键值对不存在，则添加该键值对
            this.#buckets[index] = new Pair(key, val);
            this.#size++;
        }

        /* 删除操作 */
        remove(key) {
            // 搜索 key 对应的桶索引
            const index = this.#findBucket(key);
            // 若找到键值对，则用删除标记覆盖它
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index] = this.#TOMBSTONE;
                this.#size--;
            }
        }

        /* 扩容哈希表 */
        #extend() {
            // 暂存原哈希表
            const bucketsTmp = this.#buckets;
            // 初始化扩容后的新哈希表
            this.#capacity *= this.#extendRatio;
            this.#buckets = Array(this.#capacity).fill(null);
            this.#size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.#TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
        private size: number; // 键值对数量
        private capacity: number; // 哈希表容量
        private loadThres: number; // 触发扩容的负载因子阈值
        private extendRatio: number; // 扩容倍数
        private buckets: Array<Pair | null>; // 桶数组
        private TOMBSTONE: Pair; // 删除标记

        /* 构造方法 */
        constructor() {
            this.size = 0; // 键值对数量
            this.capacity = 4; // 哈希表容量
            this.loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
            this.extendRatio = 2; // 扩容倍数
            this.buckets = Array(this.capacity).fill(null); // 桶数组
            this.TOMBSTONE = new Pair(-1, '-1'); // 删除标记
        }

        /* 哈希函数 */
        private hashFunc(key: number): number {
            return key % this.capacity;
        }

        /* 负载因子 */
        private loadFactor(): number {
            return this.size / this.capacity;
        }

        /* 搜索 key 对应的桶索引 */
        private findBucket(key: number): number {
            let index = this.hashFunc(key);
            let firstTombstone = -1;
            // 线性探测，当遇到空桶时跳出
            while (this.buckets[index] !== null) {
                // 若遇到 key ，返回对应桶索引
                if (this.buckets[index]!.key === key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引
                    if (firstTombstone !== -1) {
                        this.buckets[firstTombstone] = this.buckets[index];
                        this.buckets[index] = this.TOMBSTONE;
                        return firstTombstone; // 返回移动后的桶索引
                    }
                    return index; // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if (
                    firstTombstone === -1 &&
                    this.buckets[index] === this.TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % this.capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* 查询操作 */
        get(key: number): string | null {
            // 搜索 key 对应的桶索引
            const index = this.findBucket(key);
            // 若找到键值对，则返回对应 val
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                return this.buckets[index]!.val;
            }
            // 若键值对不存在，则返回 null
            return null;
        }

        /* 添加操作 */
        put(key: number, val: string): void {
            // 当负载因子超过阈值时，执行扩容
            if (this.loadFactor() > this.loadThres) {
                this.extend();
            }
            // 搜索 key 对应的桶索引
            const index = this.findBucket(key);
            // 若找到键值对，则覆盖 val 并返回
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index]!.val = val;
                return;
            }
            // 若键值对不存在，则添加该键值对
            this.buckets[index] = new Pair(key, val);
            this.size++;
        }

        /* 删除操作 */
        remove(key: number): void {
            // 搜索 key 对应的桶索引
            const index = this.findBucket(key);
            // 若找到键值对，则用删除标记覆盖它
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index] = this.TOMBSTONE;
                this.size--;
            }
        }

        /* 扩容哈希表 */
        private extend(): void {
            // 暂存原哈希表
            const bucketsTmp = this.buckets;
            // 初始化扩容后的新哈希表
            this.capacity *= this.extendRatio;
            this.buckets = Array(this.capacity).fill(null);
            this.size = 0;
            // 将键值对从原哈希表搬运至新哈希表
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
      late int _size; // 键值对数量
      int _capacity = 4; // 哈希表容量
      double _loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
      int _extendRatio = 2; // 扩容倍数
      late List<Pair?> _buckets; // 桶数组
      Pair _TOMBSTONE = Pair(-1, "-1"); // 删除标记

      /* 构造方法 */
      HashMapOpenAddressing() {
        _size = 0;
        _buckets = List.generate(_capacity, (index) => null);
      }

      /* 哈希函数 */
      int hashFunc(int key) {
        return key % _capacity;
      }

      /* 负载因子 */
      double loadFactor() {
        return _size / _capacity;
      }

      /* 搜索 key 对应的桶索引 */
      int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 线性探测，当遇到空桶时跳出
        while (_buckets[index] != null) {
          // 若遇到 key ，返回对应桶索引
          if (_buckets[index]!.key == key) {
            // 若之前遇到了删除标记，则将键值对移动至该索引
            if (firstTombstone != -1) {
              _buckets[firstTombstone] = _buckets[index];
              _buckets[index] = _TOMBSTONE;
              return firstTombstone; // 返回移动后的桶索引
            }
            return index; // 返回桶索引
          }
          // 记录遇到的首个删除标记
          if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
            firstTombstone = index;
          }
          // 计算桶索引，越过尾部返回头部
          index = (index + 1) % _capacity;
        }
        // 若 key 不存在，则返回添加点的索引
        return firstTombstone == -1 ? index : firstTombstone;
      }

      /* 查询操作 */
      String? get(int key) {
        // 搜索 key 对应的桶索引
        int index = findBucket(key);
        // 若找到键值对，则返回对应 val
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          return _buckets[index]!.val;
        }
        // 若键值对不存在，则返回 null
        return null;
      }

      /* 添加操作 */
      void put(int key, String val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > _loadThres) {
          extend();
        }
        // 搜索 key 对应的桶索引
        int index = findBucket(key);
        // 若找到键值对，则覆盖 val 并返回
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index]!.val = val;
          return;
        }
        // 若键值对不存在，则添加该键值对
        _buckets[index] = new Pair(key, val);
        _size++;
      }

      /* 删除操作 */
      void remove(int key) {
        // 搜索 key 对应的桶索引
        int index = findBucket(key);
        // 若找到键值对，则用删除标记覆盖它
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index] = _TOMBSTONE;
          _size--;
        }
      }

      /* 扩容哈希表 */
      void extend() {
        // 暂存原哈希表
        List<Pair?> bucketsTmp = _buckets;
        // 初始化扩容后的新哈希表
        _capacity *= _extendRatio;
        _buckets = List.generate(_capacity, (index) => null);
        _size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (Pair? pair in bucketsTmp) {
          if (pair != null && pair != _TOMBSTONE) {
            put(pair.key, pair.val);
          }
        }
      }

      /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    struct HashMapOpenAddressing {
        size: usize,                    // 键值对数量
        capacity: usize,                // 哈希表容量
        load_thres: f64,                // 触发扩容的负载因子阈值
        extend_ratio: usize,            // 扩容倍数
        buckets: Vec<Option<Pair>>,     // 桶数组
        TOMBSTONE: Option<Pair>,        // 删除标记
    }


    impl HashMapOpenAddressing {
        /* 构造方法 */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![None; 4],
                TOMBSTONE: Some(Pair {key: -1, val: "-1".to_string()}),
            }
        }

        /* 哈希函数 */
        fn hash_func(&self, key: i32) -> usize {
            (key % self.capacity as i32) as usize
        }

        /* 负载因子 */
        fn load_factor(&self) -> f64 {
            self.size as f64 / self.capacity as f64
        }

        /* 搜索 key 对应的桶索引 */
        fn find_bucket(&mut self, key: i32) -> usize {
            let mut index = self.hash_func(key);
            let mut first_tombstone = -1;
            // 线性探测，当遇到空桶时跳出
            while self.buckets[index].is_some() {
                // 若遇到 key，返回对应的桶索引
                if self.buckets[index].as_ref().unwrap().key == key {
                    // 若之前遇到了删除标记，则将建值对移动至该索引
                    if first_tombstone != -1 {
                        self.buckets[first_tombstone as usize] = self.buckets[index].take();
                        self.buckets[index] = self.TOMBSTONE.clone();
                        return first_tombstone as usize;    // 返回移动后的桶索引
                    }
                    return index;   // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                    first_tombstone = index as i32;
                }
                // 计算桶索引，越过尾部返回头部
                index = (index + 1) % self.capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            if first_tombstone == -1 { index } else { first_tombstone as usize }
        }

        /* 查询操作 */
        fn get(&mut self, key: i32) -> Option<&str> {
            // 搜索 key 对应的桶索引
            let index = self.find_bucket(key);
            // 若找到键值对，则返回对应 val
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
            }
            // 若键值对不存在，则返回 null
            None
        }

        /* 添加操作 */
        fn put(&mut self, key: i32, val: String) {
            // 当负载因子超过阈值时，执行扩容
            if self.load_factor() > self.load_thres {
                self.extend();
            }
            // 搜索 key 对应的桶索引
            let index = self.find_bucket(key);
            // 若找到键值对，则覆盖 val 并返回
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index].as_mut().unwrap().val = val;
                return;
            }
            // 若键值对不存在，则添加该键值对
            self.buckets[index] = Some(Pair { key, val });
            self.size += 1;
        }

        /* 删除操作 */
        fn remove(&mut self, key: i32) {
            // 搜索 key 对应的桶索引
            let index = self.find_bucket(key);
            // 若找到键值对，则用删除标记覆盖它
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index] = self.TOMBSTONE.clone();
                self.size -= 1;
            }
        }

        /* 扩容哈希表 */
        fn extend(&mut self) {
            // 暂存原哈希表
            let buckets_tmp = self.buckets.clone();
            // 初始化扩容后的新哈希表
            self.capacity *= self.extend_ratio;
            self.buckets = vec![None; self.capacity];
            self.size = 0;

            // 将键值对从原哈希表搬运至新哈希表
            for pair in buckets_tmp {
                if pair.is_none() || pair == self.TOMBSTONE {
                    continue;
                }
                let pair = pair.unwrap();

                self.put(pair.key, pair.val);
            }
        }
        /* 打印哈希表 */
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
    /* 开放寻址哈希表 */
    typedef struct {
        int size;         // 键值对数量
        int capacity;     // 哈希表容量
        double loadThres; // 触发扩容的负载因子阈值
        int extendRatio;  // 扩容倍数
        Pair **buckets;   // 桶数组
        Pair *TOMBSTONE;  // 删除标记
    } HashMapOpenAddressing;

    /* 构造函数 */
    HashMapOpenAddressing *newHashMapOpenAddressing() {
        HashMapOpenAddressing *hashMap = (HashMapOpenAddressing *)malloc(sizeof(HashMapOpenAddressing));
        hashMap->size = 0;
        hashMap->capacity = 4;
        hashMap->loadThres = 2.0 / 3.0;
        hashMap->extendRatio = 2;
        hashMap->buckets = (Pair **)malloc(sizeof(Pair *) * hashMap->capacity);
        hashMap->TOMBSTONE = (Pair *)malloc(sizeof(Pair));
        hashMap->TOMBSTONE->key = -1;
        hashMap->TOMBSTONE->val = "-1";

        return hashMap;
    }

    /* 析构函数 */
    void delHashMapOpenAddressing(HashMapOpenAddressing *hashMap) {
        for (int i = 0; i < hashMap->capacity; i++) {
            Pair *pair = hashMap->buckets[i];
            if (pair != NULL && pair != hashMap->TOMBSTONE) {
                free(pair->val);
                free(pair);
            }
        }
    }

    /* 哈希函数 */
    int hashFunc(HashMapOpenAddressing *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* 负载因子 */
    double loadFactor(HashMapOpenAddressing *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* 搜索 key 对应的桶索引 */
    int findBucket(HashMapOpenAddressing *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        int firstTombstone = -1;
        // 线性探测，当遇到空桶时跳出
        while (hashMap->buckets[index] != NULL) {
            // 若遇到 key ，返回对应桶索引
            if (hashMap->buckets[index]->key == key) {
                // 若之前遇到了删除标记，则将键值对移动至该索引
                if (firstTombstone != -1) {
                    hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                    hashMap->buckets[index] = hashMap->TOMBSTONE;
                    return firstTombstone; // 返回移动后的桶索引
                }
                return index; // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
                firstTombstone = index;
            }
            // 计算桶索引，越过尾部返回头部
            index = (index + 1) % hashMap->capacity;
        }
        // 若 key 不存在，则返回添加点的索引
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 查询操作 */
    char *get(HashMapOpenAddressing *hashMap, int key) {
        // 搜索 key 对应的桶索引
        int index = findBucket(hashMap, key);
        // 若找到键值对，则返回对应 val
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            return hashMap->buckets[index]->val;
        }
        // 若键值对不存在，则返回空字符串
        return "";
    }

    /* 添加操作 */
    void put(HashMapOpenAddressing *hashMap, int key, char *val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        // 搜索 key 对应的桶索引
        int index = findBucket(hashMap, key);
        // 若找到键值对，则覆盖 val 并返回
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            free(hashMap->buckets[index]->val);
            hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val + 1)));
            strcpy(hashMap->buckets[index]->val, val);
            hashMap->buckets[index]->val[strlen(val)] = '\0';
            return;
        }
        // 若键值对不存在，则添加该键值对
        Pair *pair = (Pair *)malloc(sizeof(Pair));
        pair->key = key;
        pair->val = (char *)malloc(sizeof(strlen(val + 1)));
        strcpy(pair->val, val);
        pair->val[strlen(val)] = '\0';

        hashMap->buckets[index] = pair;
        hashMap->size++;
    }

    /* 删除操作 */
    void removeItem(HashMapOpenAddressing *hashMap, int key) {
        // 搜索 key 对应的桶索引
        int index = findBucket(hashMap, key);
        // 若找到键值对，则用删除标记覆盖它
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            Pair *pair = hashMap->buckets[index];
            free(pair->val);
            free(pair);
            hashMap->buckets[index] = hashMap->TOMBSTONE;
            hashMap->size--;
        }
    }

    /* 扩容哈希表 */
    void extend(HashMapOpenAddressing *hashMap) {
        // 暂存原哈希表
        Pair **bucketsTmp = hashMap->buckets;
        int oldCapacity = hashMap->capacity;
        // 初始化扩容后的新哈希表
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Pair **)malloc(sizeof(Pair *) * hashMap->capacity);
        hashMap->size = 0;
        // 将键值对从原哈希表搬运至新哈希表
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

    /* 打印哈希表 */
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

=== "Zig"

    ```zig title="hash_map_open_addressing.zig"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

### 2. &nbsp; 平方探测

平方探测与线性探测类似，都是开放寻址的常见策略之一。当发生冲突时，平方探测不是简单地跳过一个固定的步数，而是跳过“探测次数的平方”的步数，即 $1, 4, 9, \dots$ 步。

平方探测主要具有以下优势。

- 平方探测通过跳过探测次数平方的距离，试图缓解线性探测的聚集效应。
- 平方探测会跳过更大的距离来寻找空位置，有助于数据分布得更加均匀。

然而，平方探测并不是完美的。

- 仍然存在聚集现象，即某些位置比其他位置更容易被占用。
- 由于平方的增长，平方探测可能不会探测整个哈希表，这意味着即使哈希表中有空桶，平方探测也可能无法访问到它。

### 3. &nbsp; 多次哈希

顾名思义，多次哈希方法使用多个哈希函数 $f_1(x)$、$f_2(x)$、$f_3(x)$、$\dots$ 进行探测。

- **插入元素**：若哈希函数 $f_1(x)$ 出现冲突，则尝试 $f_2(x)$ ，以此类推，直到找到空桶后插入元素。
- **查找元素**：在相同的哈希函数顺序下进行查找，直到找到目标元素时返回；若遇到空桶或已尝试所有哈希函数，说明哈希表中不存在该元素，则返回 $\text{None}$ 。

与线性探测相比，多次哈希方法不易产生聚集，但多个哈希函数会带来额外的计算量。

!!! tip

    请注意，开放寻址（线性探测、平方探测和多次哈希）哈希表都存在“不能直接删除元素”的问题。

## 6.2.3 &nbsp; 编程语言的选择

各种编程语言采取了不同的哈希表实现策略，下面举几个例子。

- Python 采用开放寻址。字典 dict 使用伪随机数进行探测。
- Java 采用链式地址。自 JDK 1.8 以来，当 HashMap 内数组长度达到 64 且链表长度达到 8 时，链表会转换为红黑树以提升查找性能。
- Go 采用链式地址。Go 规定每个桶最多存储 8 个键值对，超出容量则连接一个溢出桶。当溢出桶过多时，会执行一次特殊的等量扩容操作，以确保性能。
