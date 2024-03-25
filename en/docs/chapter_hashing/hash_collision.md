---
comments: true
---

# 6.2 &nbsp; Hash Collision

As mentioned in the previous section, **usually the input space of a hash function is much larger than its output space**, making hash collisions theoretically inevitable. For example, if the input space consists of all integers and the output space is the size of the array capacity, multiple integers will inevitably map to the same bucket index.

Hash collisions can lead to incorrect query results, severely affecting the usability of hash tables. To solve this problem, we expand the hash table whenever a hash collision occurs, until the collision is resolved. This method is simple and effective but inefficient due to the extensive data transfer and hash value computation involved in resizing the hash table. To improve efficiency, we can adopt the following strategies:

1. Improve the data structure of the hash table, **allowing it to function normally in the event of a hash collision**.
2. Only perform resizing when necessary, i.e., when hash collisions are severe.

There are mainly two methods for improving the structure of hash tables: "Separate Chaining" and "Open Addressing".

## 6.2.1 &nbsp; Separate Chaining

In the original hash table, each bucket can store only one key-value pair. "Separate chaining" transforms individual elements into a linked list, with key-value pairs as list nodes, storing all colliding key-value pairs in the same list. The Figure 6-5  shows an example of a hash table with separate chaining.

![Separate Chaining Hash Table](hash_collision.assets/hash_table_chaining.png){ class="animation-figure" }

<p align="center"> Figure 6-5 &nbsp; Separate Chaining Hash Table </p>

The operations of a hash table implemented with separate chaining have changed as follows:

- **Querying Elements**: Input `key`, pass through the hash function to obtain the bucket index, access the head node of the list, then traverse the list and compare `key` to find the target key-value pair.
- **Adding Elements**: First access the list head node via the hash function, then add the node (key-value pair) to the list.
- **Deleting Elements**: Access the list head based on the hash function's result, then traverse the list to find and remove the target node.

Separate chaining has the following limitations:

- **Increased Space Usage**: The linked list contains node pointers, which consume more memory space than arrays.
- **Reduced Query Efficiency**: Due to the need for linear traversal of the list to find the corresponding element.

The code below provides a simple implementation of a separate chaining hash table, with two things to note:

- Lists (dynamic arrays) are used instead of linked lists for simplicity. In this setup, the hash table (array) contains multiple buckets, each of which is a list.
- This implementation includes a method for resizing the hash table. When the load factor exceeds $\frac{2}{3}$, we resize the hash table to twice its original size.

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
            # 遍历桶，若找到 key ，则返回对应 val
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # 若未找到 key ，则返回 None
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
            // 遍历桶，若找到 key ，则返回对应 val
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    return pair->val;
                }
            }
            // 若未找到 key ，则返回空字符串
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
            // 遍历桶，若找到 key ，则返回对应 val
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // 若未找到 key ，则返回 null
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
            // 遍历桶，若找到 key ，则返回对应 val
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // 若未找到 key ，则返回 null
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
        return float64(m.size) / float64(m.capacity)
    }

    /* 查询操作 */
    func (m *hashMapChaining) get(key int) string {
        idx := m.hashFunc(key)
        bucket := m.buckets[idx]
        // 遍历桶，若找到 key ，则返回对应 val
        for _, p := range bucket {
            if p.key == key {
                return p.val
            }
        }
        // 若未找到 key ，则返回空字符串
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
        for i := range m.buckets[idx] {
            if m.buckets[idx][i].key == key {
                m.buckets[idx][i].val = val
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
            Double(size) / Double(capacity)
        }

        /* 查询操作 */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // 遍历桶，若找到 key ，则返回对应 val
            for pair in bucket {
                if pair.key == key {
                    return pair.val
                }
            }
            // 若未找到 key ，则返回 nil
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
                    size -= 1
                    break
                }
            }
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
            // 遍历桶，若找到 key ，则返回对应 val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // 若未找到 key ，则返回 null
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
            // 遍历桶，若找到 key ，则返回对应 val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // 若未找到 key ，则返回 null
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
        // 遍历桶，若找到 key ，则返回对应 val
        for (Pair pair in bucket) {
          if (pair.key == key) {
            return pair.val;
          }
        }
        // 若未找到 key ，则返回 null
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

            // 若未找到 key ，则返回 None
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

            // 遍历桶，若找到 key ，则返回对应 val
            for pair in bucket {
                if pair.key == key {
                    return Some(&pair.val);
                }
            }

            // 若未找到 key ，则返回 None
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
        // 遍历桶，若找到 key ，则返回对应 val
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                return cur->pair->val;
            }
            cur = cur->next;
        }
        return ""; // 若未找到 key ，则返回空字符串
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

=== "Kotlin"

    ```kotlin title="hash_map_chaining.kt"
    /* 链式地址哈希表 */
    class HashMapChaining() {
        var size: Int // 键值对数量
        var capacity: Int // 哈希表容量
        val loadThres: Double // 触发扩容的负载因子阈值
        val extendRatio: Int // 扩容倍数
        var buckets: MutableList<MutableList<Pair>> // 桶数组

        /* 构造方法 */
        init {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = ArrayList(capacity)
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
        }

        /* 哈希函数 */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* 负载因子 */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* 查询操作 */
        fun get(key: Int): String? {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // 遍历桶，若找到 key ，则返回对应 val
            for (pair in bucket) {
                if (pair.key == key) return pair.value
            }
            // 若未找到 key ，则返回 null
            return null
        }

        /* 添加操作 */
        fun put(key: Int, value: String) {
            // 当负载因子超过阈值时，执行扩容
            if (loadFactor() > loadThres) {
                extend()
            }
            val index = hashFunc(key)
            val bucket = buckets[index]
            // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
            for (pair in bucket) {
                if (pair.key == key) {
                    pair.value = value
                    return
                }
            }
            // 若无该 key ，则将键值对添加至尾部
            val pair = Pair(key, value)
            bucket.add(pair)
            size++
        }

        /* 删除操作 */
        fun remove(key: Int) {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // 遍历桶，从中删除键值对
            for (pair in bucket) {
                if (pair.key == key) {
                    bucket.remove(pair)
                    size--
                    break
                }
            }
        }

        /* 扩容哈希表 */
        fun extend() {
            // 暂存原哈希表
            val bucketsTmp = buckets
            // 初始化扩容后的新哈希表
            capacity *= extendRatio
            // mutablelist 无固定大小
            buckets = mutableListOf()
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
            size = 0
            // 将键值对从原哈希表搬运至新哈希表
            for (bucket in bucketsTmp) {
                for (pair in bucket) {
                    put(pair.key, pair.value)
                }
            }
        }

        /* 打印哈希表 */
        fun print() {
            for (bucket in buckets) {
                val res = mutableListOf<String>()
                for (pair in bucket) {
                    val k = pair.key
                    val v = pair.value
                    res.add("$k -> $v")
                }
                println(res)
            }
        }
    }
    ```

=== "Zig"

    ```zig title="hash_map_chaining.zig"
    [class]{HashMapChaining}-[func]{}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22%E9%94%AE%E5%80%BC%E5%AF%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E5%BC%8F%E5%9C%B0%E5%9D%80%E5%93%88%E5%B8%8C%E8%A1%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%93%88%E5%B8%8C%E5%87%BD%E6%95%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%B4%9F%E8%BD%BD%E5%9B%A0%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%89%A9%E5%AE%B9%E5%93%88%E5%B8%8C%E8%A1%A8%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20*%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%89%93%E5%8D%B0%E5%93%88%E5%B8%8C%E8%A1%A8%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%95%B0%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B8%AD%22%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22%E9%94%AE%E5%80%BC%E5%AF%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E5%BC%8F%E5%9C%B0%E5%9D%80%E5%93%88%E5%B8%8C%E8%A1%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%93%88%E5%B8%8C%E5%87%BD%E6%95%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%B4%9F%E8%BD%BD%E5%9B%A0%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%89%A9%E5%AE%B9%E5%93%88%E5%B8%8C%E8%A1%A8%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20*%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%89%93%E5%8D%B0%E5%93%88%E5%B8%8C%E8%A1%A8%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%95%B0%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B8%AD%22%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

It's worth noting that when the list is very long, the query efficiency $O(n)$ is poor. **At this point, the list can be converted to an "AVL tree" or "Red-Black tree"** to optimize the time complexity of the query operation to $O(\log n)$.

## 6.2.2 &nbsp; Open Addressing

"Open addressing" does not introduce additional data structures but uses "multiple probes" to handle hash collisions. The probing methods mainly include linear probing, quadratic probing, and double hashing.

Let's use linear probing as an example to introduce the mechanism of open addressing hash tables.

### 1. &nbsp; Linear Probing

Linear probing uses a fixed-step linear search for probing, differing from ordinary hash tables.

- **Inserting Elements**: Calculate the bucket index using the hash function. If the bucket already contains an element, linearly traverse forward from the conflict position (usually with a step size of $1$) until an empty bucket is found, then insert the element.
- **Searching for Elements**: If a hash collision is found, use the same step size to linearly traverse forward until the corresponding element is found and return `value`; if an empty bucket is encountered, it means the target element is not in the hash table, so return `None`.

The Figure 6-6  shows the distribution of key-value pairs in an open addressing (linear probing) hash table. According to this hash function, keys with the same last two digits will be mapped to the same bucket. Through linear probing, they are stored consecutively in that bucket and the buckets below it.

![Distribution of Key-Value Pairs in Open Addressing (Linear Probing) Hash Table](hash_collision.assets/hash_table_linear_probing.png){ class="animation-figure" }

<p align="center"> Figure 6-6 &nbsp; Distribution of Key-Value Pairs in Open Addressing (Linear Probing) Hash Table </p>

However, **linear probing tends to create "clustering"**. Specifically, the longer a continuous position in the array is occupied, the more likely these positions are to encounter hash collisions, further promoting the growth of these clusters and eventually leading to deterioration in the efficiency of operations.

It's important to note that **we cannot directly delete elements in an open addressing hash table**. Deleting an element creates an empty bucket `None` in the array. When searching for elements, if linear probing encounters this empty bucket, it will return, making the elements below this bucket inaccessible. The program may incorrectly assume these elements do not exist, as shown in the Figure 6-7 .

![Query Issues Caused by Deletion in Open Addressing](hash_collision.assets/hash_table_open_addressing_deletion.png){ class="animation-figure" }

<p align="center"> Figure 6-7 &nbsp; Query Issues Caused by Deletion in Open Addressing </p>

To solve this problem, we can use a "lazy deletion" mechanism: instead of directly removing elements from the hash table, **use a constant `TOMBSTONE` to mark the bucket**. In this mechanism, both `None` and `TOMBSTONE` represent empty buckets and can hold key-value pairs. However, when linear probing encounters `TOMBSTONE`, it should continue traversing since there may still be key-value pairs below it.

However, **lazy deletion may accelerate the degradation of hash table performance**. Every deletion operation produces a delete mark, and as `TOMBSTONE` increases, so does the search time, as linear probing may have to skip multiple `TOMBSTONE` to find the target element.

Therefore, consider recording the index of the first `TOMBSTONE` encountered during linear probing and swapping the target element found with this `TOMBSTONE`. The advantage of this is that each time a query or addition is performed, the element is moved to a bucket closer to the ideal position (starting point of probing), thereby optimizing the query efficiency.

The code below implements an open addressing (linear probing) hash table with lazy deletion. To make fuller use of the hash table space, we treat the hash table as a "circular array," continuing to traverse from the beginning when the end of the array is passed.

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
                # 若遇到 key ，返回对应的桶索引
                if self.buckets[index].key == key:
                    # 若之前遇到了删除标记，则将键值对移动至该索引处
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = self.buckets[index]
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # 返回移动后的桶索引
                    return index  # 返回桶索引
                # 记录遇到的首个删除标记
                if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                    first_tombstone = index
                # 计算桶索引，越过尾部则返回头部
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
                // 若遇到 key ，返回对应的桶索引
                if (buckets[index]->key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
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
                // 计算桶索引，越过尾部则返回头部
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
                // 若遇到 key ，返回对应的桶索引
                if (buckets[index].key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
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
                // 计算桶索引，越过尾部则返回头部
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
                // 若遇到 key ，返回对应的桶索引
                if (buckets[index].key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
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
                // 计算桶索引，越过尾部则返回头部
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
        buckets     []*pair // 桶数组
        TOMBSTONE   *pair   // 删除标记
    }

    /* 构造方法 */
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

    /* 哈希函数 */
    func (h *hashMapOpenAddressing) hashFunc(key int) int {
        return key % h.capacity // 根据键计算哈希值
    }

    /* 负载因子 */
    func (h *hashMapOpenAddressing) loadFactor() float64 {
        return float64(h.size) / float64(h.capacity) // 计算当前负载因子
    }

    /* 搜索 key 对应的桶索引 */
    func (h *hashMapOpenAddressing) findBucket(key int) int {
        index := h.hashFunc(key) // 获取初始索引
        firstTombstone := -1     // 记录遇到的第一个TOMBSTONE的位置
        for h.buckets[index] != nil {
            if h.buckets[index].key == key {
                if firstTombstone != -1 {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
                    h.buckets[firstTombstone] = h.buckets[index]
                    h.buckets[index] = h.TOMBSTONE
                    return firstTombstone // 返回移动后的桶索引
                }
                return index // 返回找到的索引
            }
            if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
                firstTombstone = index // 记录遇到的首个删除标记的位置
            }
            index = (index + 1) % h.capacity // 线性探测，越过尾部则返回头部
        }
        // 若 key 不存在，则返回添加点的索引
        if firstTombstone != -1 {
            return firstTombstone
        }
        return index
    }

    /* 查询操作 */
    func (h *hashMapOpenAddressing) get(key int) string {
        index := h.findBucket(key) // 搜索 key 对应的桶索引
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            return h.buckets[index].val // 若找到键值对，则返回对应 val
        }
        return "" // 若键值对不存在，则返回 ""
    }

    /* 添加操作 */
    func (h *hashMapOpenAddressing) put(key int, val string) {
        if h.loadFactor() > h.loadThres {
            h.extend() // 当负载因子超过阈值时，执行扩容
        }
        index := h.findBucket(key) // 搜索 key 对应的桶索引
        if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
            h.buckets[index] = &pair{key, val} // 若键值对不存在，则添加该键值对
            h.size++
        } else {
            h.buckets[index].val = val // 若找到键值对，则覆盖 val
        }
    }

    /* 删除操作 */
    func (h *hashMapOpenAddressing) remove(key int) {
        index := h.findBucket(key) // 搜索 key 对应的桶索引
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            h.buckets[index] = h.TOMBSTONE // 若找到键值对，则用删除标记覆盖它
            h.size--
        }
    }

    /* 扩容哈希表 */
    func (h *hashMapOpenAddressing) extend() {
        oldBuckets := h.buckets               // 暂存原哈希表
        h.capacity *= h.extendRatio           // 更新容量
        h.buckets = make([]*pair, h.capacity) // 初始化扩容后的新哈希表
        h.size = 0                            // 重置大小
        // 将键值对从原哈希表搬运至新哈希表
        for _, pair := range oldBuckets {
            if pair != nil && pair != h.TOMBSTONE {
                h.put(pair.key, pair.val)
            }
        }
    }

    /* 打印哈希表 */
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
            Double(size) / Double(capacity)
        }

        /* 搜索 key 对应的桶索引 */
        func findBucket(key: Int) -> Int {
            var index = hashFunc(key: key)
            var firstTombstone = -1
            // 线性探测，当遇到空桶时跳出
            while buckets[index] != nil {
                // 若遇到 key ，返回对应的桶索引
                if buckets[index]!.key == key {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
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
                // 计算桶索引，越过尾部则返回头部
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
                // 若遇到 key ，返回对应的桶索引
                if (this.#buckets[index].key === key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
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
                // 计算桶索引，越过尾部则返回头部
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
                // 若遇到 key ，返回对应的桶索引
                if (this.buckets[index]!.key === key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
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
                // 计算桶索引，越过尾部则返回头部
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
          // 若遇到 key ，返回对应的桶索引
          if (_buckets[index]!.key == key) {
            // 若之前遇到了删除标记，则将键值对移动至该索引处
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
          // 计算桶索引，越过尾部则返回头部
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
        size: usize,                // 键值对数量
        capacity: usize,            // 哈希表容量
        load_thres: f64,            // 触发扩容的负载因子阈值
        extend_ratio: usize,        // 扩容倍数
        buckets: Vec<Option<Pair>>, // 桶数组
        TOMBSTONE: Option<Pair>,    // 删除标记
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
                TOMBSTONE: Some(Pair {
                    key: -1,
                    val: "-1".to_string(),
                }),
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
                        return first_tombstone as usize; // 返回移动后的桶索引
                    }
                    return index; // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                    first_tombstone = index as i32;
                }
                // 计算桶索引，越过尾部则返回头部
                index = (index + 1) % self.capacity;
            }
            // 若 key 不存在，则返回添加点的索引
            if first_tombstone == -1 {
                index
            } else {
                first_tombstone as usize
            }
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
            // 若遇到 key ，返回对应的桶索引
            if (hashMap->buckets[index]->key == key) {
                // 若之前遇到了删除标记，则将键值对移动至该索引处
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
            // 计算桶索引，越过尾部则返回头部
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
            hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
            strcpy(hashMap->buckets[index]->val, val);
            hashMap->buckets[index]->val[strlen(val)] = '\0';
            return;
        }
        // 若键值对不存在，则添加该键值对
        Pair *pair = (Pair *)malloc(sizeof(Pair));
        pair->key = key;
        pair->val = (char *)malloc(sizeof(strlen(val) + 1));
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

=== "Kotlin"

    ```kotlin title="hash_map_open_addressing.kt"
    /* 开放寻址哈希表 */
    class HashMapOpenAddressing {
        private var size: Int = 0 // 键值对数量
        private var capacity = 4 // 哈希表容量
        private val loadThres: Double = 2.0 / 3.0 // 触发扩容的负载因子阈值
        private val extendRatio = 2 // 扩容倍数
        private var buckets: Array<Pair?> // 桶数组
        private val TOMBSTONE = Pair(-1, "-1") // 删除标记

        /* 构造方法 */
        init {
            buckets = arrayOfNulls(capacity)
        }

        /* 哈希函数 */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* 负载因子 */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* 搜索 key 对应的桶索引 */
        fun findBucket(key: Int): Int {
            var index = hashFunc(key)
            var firstTombstone = -1
            // 线性探测，当遇到空桶时跳出
            while (buckets[index] != null) {
                // 若遇到 key ，返回对应的桶索引
                if (buckets[index]?.key == key) {
                    // 若之前遇到了删除标记，则将键值对移动至该索引处
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // 返回移动后的桶索引
                    }
                    return index // 返回桶索引
                }
                // 记录遇到的首个删除标记
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index
                }
                // 计算桶索引，越过尾部则返回头部
                index = (index + 1) % capacity
            }
            // 若 key 不存在，则返回添加点的索引
            return if (firstTombstone == -1) index else firstTombstone
        }

        /* 查询操作 */
        fun get(key: Int): String? {
            // 搜索 key 对应的桶索引
            val index = findBucket(key)
            // 若找到键值对，则返回对应 val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index]?.value
            }
            // 若键值对不存在，则返回 null
            return null
        }

        /* 添加操作 */
        fun put(key: Int, value: String) {
            // 当负载因子超过阈值时，执行扩容
            if (loadFactor() > loadThres) {
                extend()
            }
            // 搜索 key 对应的桶索引
            val index = findBucket(key)
            // 若找到键值对，则覆盖 val 并返回
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index]!!.value = value
                return
            }
            // 若键值对不存在，则添加该键值对
            buckets[index] = Pair(key, value)
            size++
        }

        /* 删除操作 */
        fun remove(key: Int) {
            // 搜索 key 对应的桶索引
            val index = findBucket(key)
            // 若找到键值对，则用删除标记覆盖它
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE
                size--
            }
        }

        /* 扩容哈希表 */
        fun extend() {
            // 暂存原哈希表
            val bucketsTmp = buckets
            // 初始化扩容后的新哈希表
            capacity *= extendRatio
            buckets = arrayOfNulls(capacity)
            size = 0
            // 将键值对从原哈希表搬运至新哈希表
            for (pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.value)
                }
            }
        }

        /* 打印哈希表 */
        fun print() {
            for (pair in buckets) {
                if (pair == null) {
                    println("null")
                } else if (pair == TOMBSTONE) {
                    println("TOMESTOME")
                } else {
                    println("${pair.key} -> ${pair.value}")
                }
            }
        }
    }
    ```

=== "Zig"

    ```zig title="hash_map_open_addressing.zig"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

### 2. &nbsp; Quadratic Probing

Quadratic probing is similar to linear probing and is one of the common strategies of open addressing. When a collision occurs, quadratic probing does not simply skip a fixed number of steps but skips "the square of the number of probes," i.e., $1, 4, 9, \dots$ steps.

Quadratic probing has the following advantages:

- Quadratic probing attempts to alleviate the clustering effect of linear probing by skipping the distance of the square of the number of probes.
- Quadratic probing skips larger distances to find empty positions, helping to distribute data more evenly.

However, quadratic probing is not perfect:

- Clustering still exists, i.e., some positions are more likely to be occupied than others.
- Due to the growth of squares, quadratic probing may not probe the entire hash table, meaning it might not access empty buckets even if they exist in the hash table.

### 3. &nbsp; Double Hashing

As the name suggests, the double hashing method uses multiple hash functions $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$ for probing.

- **Inserting Elements**: If hash function $f_1(x)$ encounters a conflict, try $f_2(x)$, and so on, until an empty position is found and the element is inserted.
- **Searching for Elements**: Search in the same order of hash functions until the target element is found and returned; if an empty position is encountered or all hash functions have been tried, it indicates the element is not in the hash table, then return `None`.

Compared to linear probing, double hashing is less prone to clustering but involves additional computation for multiple hash functions.

!!! tip

    Please note that open addressing (linear probing, quadratic probing, and double hashing) hash tables all have the issue of "not being able to directly delete elements."

## 6.2.3 &nbsp; Choice of Programming Languages

Various programming languages have adopted different hash table implementation strategies, here are a few examples:

- Python uses open addressing. The `dict` dictionary uses pseudo-random numbers for probing.
- Java uses separate chaining. Since JDK 1.8, when the array length in `HashMap` reaches 64 and the length of a linked list reaches 8, the linked list is converted to a red-black tree to improve search performance.
- Go uses separate chaining. Go stipulates that each bucket can store up to 8 key-value pairs, and if the capacity is exceeded, an overflow bucket is connected; when there are too many overflow buckets, a special equal-size expansion operation is performed to ensure performance.
