---
comments: true
---

# 6.1 &nbsp; 哈希表

「哈希表 hash table」，又称「散列表」，其通过建立键 `key` 与值 `value` 之间的映射，实现高效的元素查询。具体而言，我们向哈希表输入一个键 `key` ，则可以在 $O(1)$ 时间内获取对应的值 `value` 。

如图 6-1 所示，给定 $n$ 个学生，每个学生都有“姓名”和“学号”两项数据。假如我们希望实现“输入一个学号，返回对应的姓名”的查询功能，则可以采用图 6-1 所示的哈希表来实现。

![哈希表的抽象表示](hash_map.assets/hash_table_lookup.png){ class="animation-figure" }

<p align="center"> 图 6-1 &nbsp; 哈希表的抽象表示 </p>

除哈希表外，数组和链表也可以实现查询功能，它们的效率对比如表 6-1 所示。

- **添加元素**：仅需将元素添加至数组（链表）的尾部即可，使用 $O(1)$ 时间。
- **查询元素**：由于数组（链表）是乱序的，因此需要遍历其中的所有元素，使用 $O(n)$ 时间。
- **删除元素**：需要先查询到元素，再从数组（链表）中删除，使用 $O(n)$ 时间。

<p align="center"> 表 6-1 &nbsp; 元素查询效率对比 </p>

<div class="center-table" markdown>

|          | 数组   | 链表   | 哈希表 |
| -------- | ------ | ------ | ------ |
| 查找元素 | $O(n)$ | $O(n)$ | $O(1)$ |
| 添加元素 | $O(1)$ | $O(1)$ | $O(1)$ |
| 删除元素 | $O(n)$ | $O(n)$ | $O(1)$ |

</div>

观察发现，**在哈希表中进行增删查改的时间复杂度都是 $O(1)$** ，非常高效。

## 6.1.1 &nbsp; 哈希表常用操作

哈希表的常见操作包括：初始化、查询操作、添加键值对和删除键值对等，示例代码如下：

=== "Python"

    ```python title="hash_map.py"
    # 初始化哈希表
    hmap: dict = {}
    
    # 添加操作
    # 在哈希表中添加键值对 (key, value)
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    
    # 查询操作
    # 向哈希表输入键 key ，得到值 value
    name: str = hmap[15937]
    
    # 删除操作
    # 在哈希表中删除键值对 (key, value)
    hmap.pop(10583)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* 初始化哈希表 */
    unordered_map<int, string> map;
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    string name = map[15937];
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.erase(10583);
    ```

=== "Java"

    ```java title="hash_map.java"
    /* 初始化哈希表 */
    Map<Integer, String> map = new HashMap<>();
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈");   
    map.put(15937, "小啰");   
    map.put(16750, "小算");   
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    String name = map.get(15937);
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* 初始化哈希表 */
    Dictionary<int, string> map = new() {
        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        { 12836, "小哈" },
        { 15937, "小啰" },
        { 16750, "小算" },
        { 13276, "小法" },
        { 10583, "小鸭" }
    };
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    string name = map[15937];
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.Remove(10583);
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* 初始化哈希表 */
    hmap := make(map[int]string)
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    name := hmap[15937]
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    delete(hmap, 10583)
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* 初始化哈希表 */
    var map: [Int: String] = [:]
    
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map[15937]!
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.removeValue(forKey: 10583)
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* 初始化哈希表 */
    const map = new Map();
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map.get(15937);
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.delete(10583);
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* 初始化哈希表 */
    const map = new Map<number, string>();
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');
    console.info('\n添加完成后，哈希表为\nKey -> Value');
    console.info(map);
    
    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map.get(15937);
    console.info('\n输入学号 15937 ，查询到姓名 ' + name);
    
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.delete(10583);
    console.info('\n删除 10583 后，哈希表为\nKey -> Value');
    console.info(map);
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* 初始化哈希表 */
    Map<int, String> map = {};

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    String name = map[15937];

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    use std::collections::HashMap;
    
    /* 初始化哈希表 */
    let mut map: HashMap<i32, String> = HashMap::new();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.insert(12836, "小哈".to_string());
    map.insert(15937, "小啰".to_string());
    map.insert(16750, "小算".to_string());
    map.insert(13279, "小法".to_string());
    map.insert(10583, "小鸭".to_string());

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    let _name: Option<&String> = map.get(&15937);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    let _removed_value: Option<String> = map.remove(&10583);
    ```

=== "C"

    ```c title="hash_map.c"
    // C 未提供内置哈希表
    ```

=== "Zig"

    ```zig title="hash_map.zig"

    ```

哈希表有三种常用的遍历方式：遍历键值对、遍历键和遍历值。示例代码如下：

=== "Python"

    ```python title="hash_map.py"
    # 遍历哈希表
    # 遍历键值对 key->value
    for key, value in hmap.items():
        print(key, "->", value)
    # 单独遍历键 key
    for key in hmap.keys():
        print(key)
    # 单独遍历值 value
    for value in hmap.values():
        print(value)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for (auto kv: map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    // 使用迭代器遍历 key->value
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }
    ```

=== "Java"

    ```java title="hash_map.java"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for (Map.Entry <Integer, String> kv: map.entrySet()) {
        System.out.println(kv.getKey() + " -> " + kv.getValue());
    }
    // 单独遍历键 key
    for (int key: map.keySet()) {
        System.out.println(key);
    }
    // 单独遍历值 value
    for (String val: map.values()) {
        System.out.println(val);
    }
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* 遍历哈希表 */
    // 遍历键值对 Key->Value
    foreach (var kv in map) {
        Console.WriteLine(kv.Key + " -> " + kv.Value);
    }
    // 单独遍历键 key
    foreach (int key in map.Keys) {
        Console.WriteLine(key);
    }
    // 单独遍历值 value
    foreach (string val in map.Values) {
        Console.WriteLine(val);
    }
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for key, value := range hmap {
        fmt.Println(key, "->", value)
    }
    // 单独遍历键 key
    for key := range hmap {
        fmt.Println(key)
    }
    // 单独遍历值 value
    for _, value := range hmap {
        fmt.Println(value)
    }
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* 遍历哈希表 */
    // 遍历键值对 Key->Value
    for (key, value) in map {
        print("\(key) -> \(value)")
    }
    // 单独遍历键 Key
    for key in map.keys {
        print(key)
    }
    // 单独遍历值 Value
    for value in map.values {
        print(value)
    }
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* 遍历哈希表 */
    console.info('\n遍历键值对 Key->Value');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\n单独遍历键 Key');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n单独遍历值 Value');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* 遍历哈希表 */
    console.info('\n遍历键值对 Key->Value');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\n单独遍历键 Key');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n单独遍历值 Value');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* 遍历哈希表 */
    // 遍历键值对 Key->Value
    map.forEach((key, value) {
      print('$key -> $value');
    });

    // 单独遍历键 Key
    map.keys.forEach((key) {
      print(key);
    });

    // 单独遍历值 Value
    map.values.forEach((value) {
      print(value);
    });
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    /* 遍历哈希表 */
    // 遍历键值对 Key->Value
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    // 单独遍历键 Key
    for key in map.keys() {
        println!("{key}"); 
    }

    // 单独遍历值 Value
    for value in map.values() {
        println!("{value}");
    }
    ```

=== "C"

    ```c title="hash_map.c"
    // C 未提供内置哈希表
    ```

=== "Zig"

    ```zig title="hash_map.zig"

    ```

## 6.1.2 &nbsp; 哈希表简单实现

我们先考虑最简单的情况，**仅用一个数组来实现哈希表**。在哈希表中，我们将数组中的每个空位称为「桶 bucket」，每个桶可存储一个键值对。因此，查询操作就是找到 `key` 对应的桶，并在桶中获取 `value` 。

那么，如何基于 `key` 定位对应的桶呢？这是通过「哈希函数 hash function」实现的。哈希函数的作用是将一个较大的输入空间映射到一个较小的输出空间。在哈希表中，输入空间是所有 `key` ，输出空间是所有桶（数组索引）。换句话说，输入一个 `key` ，**我们可以通过哈希函数得到该 `key` 对应的键值对在数组中的存储位置**。

输入一个 `key` ，哈希函数的计算过程分为以下两步。

1. 通过某种哈希算法 `hash()` 计算得到哈希值。
2. 将哈希值对桶数量（数组长度）`capacity` 取模，从而获取该 `key` 对应的数组索引 `index` 。

```shell
index = hash(key) % capacity
```

随后，我们就可以利用 `index` 在哈希表中访问对应的桶，从而获取 `value` 。

设数组长度 `capacity = 100`、哈希算法 `hash(key) = key` ，易得哈希函数为 `key % 100` 。图 6-2 以 `key` 学号和 `value` 姓名为例，展示了哈希函数的工作原理。

![哈希函数工作原理](hash_map.assets/hash_function.png){ class="animation-figure" }

<p align="center"> 图 6-2 &nbsp; 哈希函数工作原理 </p>

以下代码实现了一个简单哈希表。其中，我们将 `key` 和 `value` 封装成一个类 `Pair` ，以表示键值对。

=== "Python"

    ```python title="array_hash_map.py"
    class Pair:
        """键值对"""

        def __init__(self, key: int, val: str):
            self.key = key
            self.val = val

    class ArrayHashMap:
        """基于数组实现的哈希表"""

        def __init__(self):
            """构造方法"""
            # 初始化数组，包含 100 个桶
            self.buckets: list[Pair | None] = [None] * 100

        def hash_func(self, key: int) -> int:
            """哈希函数"""
            index = key % 100
            return index

        def get(self, key: int) -> str:
            """查询操作"""
            index: int = self.hash_func(key)
            pair: Pair = self.buckets[index]
            if pair is None:
                return None
            return pair.val

        def put(self, key: int, val: str):
            """添加操作"""
            pair = Pair(key, val)
            index: int = self.hash_func(key)
            self.buckets[index] = pair

        def remove(self, key: int):
            """删除操作"""
            index: int = self.hash_func(key)
            # 置为 None ，代表删除
            self.buckets[index] = None

        def entry_set(self) -> list[Pair]:
            """获取所有键值对"""
            result: list[Pair] = []
            for pair in self.buckets:
                if pair is not None:
                    result.append(pair)
            return result

        def key_set(self) -> list[int]:
            """获取所有键"""
            result = []
            for pair in self.buckets:
                if pair is not None:
                    result.append(pair.key)
            return result

        def value_set(self) -> list[str]:
            """获取所有值"""
            result = []
            for pair in self.buckets:
                if pair is not None:
                    result.append(pair.val)
            return result

        def print(self):
            """打印哈希表"""
            for pair in self.buckets:
                if pair is not None:
                    print(pair.key, "->", pair.val)
    ```

=== "C++"

    ```cpp title="array_hash_map.cpp"
    /* 键值对 */
    struct Pair {
      public:
        int key;
        string val;
        Pair(int key, string val) {
            this->key = key;
            this->val = val;
        }
    };

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
      private:
        vector<Pair *> buckets;

      public:
        ArrayHashMap() {
            // 初始化数组，包含 100 个桶
            buckets = vector<Pair *>(100);
        }

        ~ArrayHashMap() {
            // 释放内存
            for (const auto &bucket : buckets) {
                delete bucket;
            }
            buckets.clear();
        }

        /* 哈希函数 */
        int hashFunc(int key) {
            int index = key % 100;
            return index;
        }

        /* 查询操作 */
        string get(int key) {
            int index = hashFunc(key);
            Pair *pair = buckets[index];
            if (pair == nullptr)
                return "";
            return pair->val;
        }

        /* 添加操作 */
        void put(int key, string val) {
            Pair *pair = new Pair(key, val);
            int index = hashFunc(key);
            buckets[index] = pair;
        }

        /* 删除操作 */
        void remove(int key) {
            int index = hashFunc(key);
            // 释放内存并置为 nullptr
            delete buckets[index];
            buckets[index] = nullptr;
        }

        /* 获取所有键值对 */
        vector<Pair *> pairSet() {
            vector<Pair *> pairSet;
            for (Pair *pair : buckets) {
                if (pair != nullptr) {
                    pairSet.push_back(pair);
                }
            }
            return pairSet;
        }

        /* 获取所有键 */
        vector<int> keySet() {
            vector<int> keySet;
            for (Pair *pair : buckets) {
                if (pair != nullptr) {
                    keySet.push_back(pair->key);
                }
            }
            return keySet;
        }

        /* 获取所有值 */
        vector<string> valueSet() {
            vector<string> valueSet;
            for (Pair *pair : buckets) {
                if (pair != nullptr) {
                    valueSet.push_back(pair->val);
                }
            }
            return valueSet;
        }

        /* 打印哈希表 */
        void print() {
            for (Pair *kv : pairSet()) {
                cout << kv->key << " -> " << kv->val << endl;
            }
        }
    };
    ```

=== "Java"

    ```java title="array_hash_map.java"
    /* 键值对 */
    class Pair {
        public int key;
        public String val;

        public Pair(int key, String val) {
            this.key = key;
            this.val = val;
        }
    }

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
        private List<Pair> buckets;

        public ArrayHashMap() {
            // 初始化数组，包含 100 个桶
            buckets = new ArrayList<>();
            for (int i = 0; i < 100; i++) {
                buckets.add(null);
            }
        }

        /* 哈希函数 */
        private int hashFunc(int key) {
            int index = key % 100;
            return index;
        }

        /* 查询操作 */
        public String get(int key) {
            int index = hashFunc(key);
            Pair pair = buckets.get(index);
            if (pair == null)
                return null;
            return pair.val;
        }

        /* 添加操作 */
        public void put(int key, String val) {
            Pair pair = new Pair(key, val);
            int index = hashFunc(key);
            buckets.set(index, pair);
        }

        /* 删除操作 */
        public void remove(int key) {
            int index = hashFunc(key);
            // 置为 null ，代表删除
            buckets.set(index, null);
        }

        /* 获取所有键值对 */
        public List<Pair> pairSet() {
            List<Pair> pairSet = new ArrayList<>();
            for (Pair pair : buckets) {
                if (pair != null)
                    pairSet.add(pair);
            }
            return pairSet;
        }

        /* 获取所有键 */
        public List<Integer> keySet() {
            List<Integer> keySet = new ArrayList<>();
            for (Pair pair : buckets) {
                if (pair != null)
                    keySet.add(pair.key);
            }
            return keySet;
        }

        /* 获取所有值 */
        public List<String> valueSet() {
            List<String> valueSet = new ArrayList<>();
            for (Pair pair : buckets) {
                if (pair != null)
                    valueSet.add(pair.val);
            }
            return valueSet;
        }

        /* 打印哈希表 */
        public void print() {
            for (Pair kv : pairSet()) {
                System.out.println(kv.key + " -> " + kv.val);
            }
        }
    }
    ```

=== "C#"

    ```csharp title="array_hash_map.cs"
    /* 键值对 int->string */
    class Pair(int key, string val) {
        public int key = key;
        public string val = val;
    }

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
        List<Pair?> buckets;
        public ArrayHashMap() {
            // 初始化数组，包含 100 个桶
            buckets = [];
            for (int i = 0; i < 100; i++) {
                buckets.Add(null);
            }
        }

        /* 哈希函数 */
        int HashFunc(int key) {
            int index = key % 100;
            return index;
        }

        /* 查询操作 */
        public string? Get(int key) {
            int index = HashFunc(key);
            Pair? pair = buckets[index];
            if (pair == null) return null;
            return pair.val;
        }

        /* 添加操作 */
        public void Put(int key, string val) {
            Pair pair = new(key, val);
            int index = HashFunc(key);
            buckets[index] = pair;
        }

        /* 删除操作 */
        public void Remove(int key) {
            int index = HashFunc(key);
            // 置为 null ，代表删除
            buckets[index] = null;
        }

        /* 获取所有键值对 */
        public List<Pair> PairSet() {
            List<Pair> pairSet = [];
            foreach (Pair? pair in buckets) {
                if (pair != null)
                    pairSet.Add(pair);
            }
            return pairSet;
        }

        /* 获取所有键 */
        public List<int> KeySet() {
            List<int> keySet = [];
            foreach (Pair? pair in buckets) {
                if (pair != null)
                    keySet.Add(pair.key);
            }
            return keySet;
        }

        /* 获取所有值 */
        public List<string> ValueSet() {
            List<string> valueSet = [];
            foreach (Pair? pair in buckets) {
                if (pair != null)
                    valueSet.Add(pair.val);
            }
            return valueSet;
        }

        /* 打印哈希表 */
        public void Print() {
            foreach (Pair kv in PairSet()) {
                Console.WriteLine(kv.key + " -> " + kv.val);
            }
        }
    }
    ```

=== "Go"

    ```go title="array_hash_map.go"
    /* 键值对 */
    type pair struct {
        key int
        val string
    }

    /* 基于数组实现的哈希表 */
    type arrayHashMap struct {
        buckets []*pair
    }

    /* 初始化哈希表 */
    func newArrayHashMap() *arrayHashMap {
        // 初始化数组，包含 100 个桶
        buckets := make([]*pair, 100)
        return &arrayHashMap{buckets: buckets}
    }

    /* 哈希函数 */
    func (a *arrayHashMap) hashFunc(key int) int {
        index := key % 100
        return index
    }

    /* 查询操作 */
    func (a *arrayHashMap) get(key int) string {
        index := a.hashFunc(key)
        pair := a.buckets[index]
        if pair == nil {
            return "Not Found"
        }
        return pair.val
    }

    /* 添加操作 */
    func (a *arrayHashMap) put(key int, val string) {
        pair := &pair{key: key, val: val}
        index := a.hashFunc(key)
        a.buckets[index] = pair
    }

    /* 删除操作 */
    func (a *arrayHashMap) remove(key int) {
        index := a.hashFunc(key)
        // 置为 nil ，代表删除
        a.buckets[index] = nil
    }

    /* 获取所有键对 */
    func (a *arrayHashMap) pairSet() []*pair {
        var pairs []*pair
        for _, pair := range a.buckets {
            if pair != nil {
                pairs = append(pairs, pair)
            }
        }
        return pairs
    }

    /* 获取所有键 */
    func (a *arrayHashMap) keySet() []int {
        var keys []int
        for _, pair := range a.buckets {
            if pair != nil {
                keys = append(keys, pair.key)
            }
        }
        return keys
    }

    /* 获取所有值 */
    func (a *arrayHashMap) valueSet() []string {
        var values []string
        for _, pair := range a.buckets {
            if pair != nil {
                values = append(values, pair.val)
            }
        }
        return values
    }

    /* 打印哈希表 */
    func (a *arrayHashMap) print() {
        for _, pair := range a.buckets {
            if pair != nil {
                fmt.Println(pair.key, "->", pair.val)
            }
        }
    }
    ```

=== "Swift"

    ```swift title="array_hash_map.swift"
    /* 键值对 */
    class Pair: Equatable {
        public var key: Int
        public var val: String

        public init(key: Int, val: String) {
            self.key = key
            self.val = val
        }

        public static func == (lhs: Pair, rhs: Pair) -> Bool {
            lhs.key == rhs.key && lhs.val == rhs.val
        }
    }

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
        private var buckets: [Pair?] = []

        init() {
            // 初始化数组，包含 100 个桶
            for _ in 0 ..< 100 {
                buckets.append(nil)
            }
        }

        /* 哈希函数 */
        private func hashFunc(key: Int) -> Int {
            let index = key % 100
            return index
        }

        /* 查询操作 */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let pair = buckets[index]
            return pair?.val
        }

        /* 添加操作 */
        func put(key: Int, val: String) {
            let pair = Pair(key: key, val: val)
            let index = hashFunc(key: key)
            buckets[index] = pair
        }

        /* 删除操作 */
        func remove(key: Int) {
            let index = hashFunc(key: key)
            // 置为 nil ，代表删除
            buckets[index] = nil
        }

        /* 获取所有键值对 */
        func pairSet() -> [Pair] {
            var pairSet: [Pair] = []
            for pair in buckets {
                if let pair = pair {
                    pairSet.append(pair)
                }
            }
            return pairSet
        }

        /* 获取所有键 */
        func keySet() -> [Int] {
            var keySet: [Int] = []
            for pair in buckets {
                if let pair = pair {
                    keySet.append(pair.key)
                }
            }
            return keySet
        }

        /* 获取所有值 */
        func valueSet() -> [String] {
            var valueSet: [String] = []
            for pair in buckets {
                if let pair = pair {
                    valueSet.append(pair.val)
                }
            }
            return valueSet
        }

        /* 打印哈希表 */
        func print() {
            for pair in pairSet() {
                Swift.print("\(pair.key) -> \(pair.val)")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="array_hash_map.js"
    /* 键值对 Number -> String */
    class Pair {
        constructor(key, val) {
            this.key = key;
            this.val = val;
        }
    }

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
        #buckets;
        constructor() {
            // 初始化数组，包含 100 个桶
            this.#buckets = new Array(100).fill(null);
        }

        /* 哈希函数 */
        #hashFunc(key) {
            return key % 100;
        }

        /* 查询操作 */
        get(key) {
            let index = this.#hashFunc(key);
            let pair = this.#buckets[index];
            if (pair === null) return null;
            return pair.val;
        }

        /* 添加操作 */
        set(key, val) {
            let index = this.#hashFunc(key);
            this.#buckets[index] = new Pair(key, val);
        }

        /* 删除操作 */
        delete(key) {
            let index = this.#hashFunc(key);
            // 置为 null ，代表删除
            this.#buckets[index] = null;
        }

        /* 获取所有键值对 */
        entries() {
            let arr = [];
            for (let i = 0; i < this.#buckets.length; i++) {
                if (this.#buckets[i]) {
                    arr.push(this.#buckets[i]);
                }
            }
            return arr;
        }

        /* 获取所有键 */
        keys() {
            let arr = [];
            for (let i = 0; i < this.#buckets.length; i++) {
                if (this.#buckets[i]) {
                    arr.push(this.#buckets[i].key);
                }
            }
            return arr;
        }

        /* 获取所有值 */
        values() {
            let arr = [];
            for (let i = 0; i < this.#buckets.length; i++) {
                if (this.#buckets[i]) {
                    arr.push(this.#buckets[i].val);
                }
            }
            return arr;
        }

        /* 打印哈希表 */
        print() {
            let pairSet = this.entries();
            for (const pair of pairSet) {
                console.info(`${pair.key} -> ${pair.val}`);
            }
        }
    }
    ```

=== "TS"

    ```typescript title="array_hash_map.ts"
    /* 键值对 Number -> String */
    class Pair {
        public key: number;
        public val: string;

        constructor(key: number, val: string) {
            this.key = key;
            this.val = val;
        }
    }

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
        private readonly buckets: (Pair | null)[];

        constructor() {
            // 初始化数组，包含 100 个桶
            this.buckets = new Array(100).fill(null);
        }

        /* 哈希函数 */
        private hashFunc(key: number): number {
            return key % 100;
        }

        /* 查询操作 */
        public get(key: number): string | null {
            let index = this.hashFunc(key);
            let pair = this.buckets[index];
            if (pair === null) return null;
            return pair.val;
        }

        /* 添加操作 */
        public set(key: number, val: string) {
            let index = this.hashFunc(key);
            this.buckets[index] = new Pair(key, val);
        }

        /* 删除操作 */
        public delete(key: number) {
            let index = this.hashFunc(key);
            // 置为 null ，代表删除
            this.buckets[index] = null;
        }

        /* 获取所有键值对 */
        public entries(): (Pair | null)[] {
            let arr: (Pair | null)[] = [];
            for (let i = 0; i < this.buckets.length; i++) {
                if (this.buckets[i]) {
                    arr.push(this.buckets[i]);
                }
            }
            return arr;
        }

        /* 获取所有键 */
        public keys(): (number | undefined)[] {
            let arr: (number | undefined)[] = [];
            for (let i = 0; i < this.buckets.length; i++) {
                if (this.buckets[i]) {
                    arr.push(this.buckets[i].key);
                }
            }
            return arr;
        }

        /* 获取所有值 */
        public values(): (string | undefined)[] {
            let arr: (string | undefined)[] = [];
            for (let i = 0; i < this.buckets.length; i++) {
                if (this.buckets[i]) {
                    arr.push(this.buckets[i].val);
                }
            }
            return arr;
        }

        /* 打印哈希表 */
        public print() {
            let pairSet = this.entries();
            for (const pair of pairSet) {
                console.info(`${pair.key} -> ${pair.val}`);
            }
        }
    }
    ```

=== "Dart"

    ```dart title="array_hash_map.dart"
    /* 键值对 */
    class Pair {
      int key;
      String val;
      Pair(this.key, this.val);
    }

    /* 基于数组实现的哈希表 */
    class ArrayHashMap {
      late List<Pair?> _buckets;

      ArrayHashMap() {
        // 初始化数组，包含 100 个桶
        _buckets = List.filled(100, null);
      }

      /* 哈希函数 */
      int _hashFunc(int key) {
        final int index = key % 100;
        return index;
      }

      /* 查询操作 */
      String? get(int key) {
        final int index = _hashFunc(key);
        final Pair? pair = _buckets[index];
        if (pair == null) {
          return null;
        }
        return pair.val;
      }

      /* 添加操作 */
      void put(int key, String val) {
        final Pair pair = Pair(key, val);
        final int index = _hashFunc(key);
        _buckets[index] = pair;
      }

      /* 删除操作 */
      void remove(int key) {
        final int index = _hashFunc(key);
        _buckets[index] = null;
      }

      /* 获取所有键值对 */
      List<Pair> pairSet() {
        List<Pair> pairSet = [];
        for (final Pair? pair in _buckets) {
          if (pair != null) {
            pairSet.add(pair);
          }
        }
        return pairSet;
      }

      /* 获取所有键 */
      List<int> keySet() {
        List<int> keySet = [];
        for (final Pair? pair in _buckets) {
          if (pair != null) {
            keySet.add(pair.key);
          }
        }
        return keySet;
      }

      /* 获取所有值 */
      List<String> values() {
        List<String> valueSet = [];
        for (final Pair? pair in _buckets) {
          if (pair != null) {
            valueSet.add(pair.val);
          }
        }
        return valueSet;
      }

      /* 打印哈希表 */
      void printHashMap() {
        for (final Pair kv in pairSet()) {
          print("${kv.key} -> ${kv.val}");
        }
      }
    }
    ```

=== "Rust"

    ```rust title="array_hash_map.rs"
    /* 键值对 */
    #[derive(Debug, Clone, PartialEq)]
    pub struct Pair {
        pub key: i32,
        pub val: String,
    }

    /* 基于数组实现的哈希表 */
    pub struct ArrayHashMap {
        buckets: Vec<Option<Pair>>
    }

    impl ArrayHashMap {
        pub fn new() -> ArrayHashMap {
            // 初始化数组，包含 100 个桶
            Self { buckets: vec![None; 100] }
        }

        /* 哈希函数 */
        fn hash_func(&self, key: i32) -> usize {
            key as usize % 100
        }

        /* 查询操作 */
        pub fn get(&self, key: i32) -> Option<&String> {
            let index = self.hash_func(key);
            self.buckets[index].as_ref().map(|pair| &pair.val)
        }

        /* 添加操作 */
        pub fn put(&mut self, key: i32, val: &str) {
            let index = self.hash_func(key);
            self.buckets[index] = Some(Pair {
                key,
                val: val.to_string(),
            });
        }

        /* 删除操作 */
        pub fn remove(&mut self, key: i32) {
            let index = self.hash_func(key);
            // 置为 None ，代表删除
            self.buckets[index] = None;
        }

        /* 获取所有键值对 */
        pub fn entry_set(&self) -> Vec<&Pair> {
            self.buckets.iter().filter_map(|pair| pair.as_ref()).collect()
        }

        /* 获取所有键 */
        pub fn key_set(&self) -> Vec<&i32> {
            self.buckets.iter().filter_map(|pair| pair.as_ref().map(|pair| &pair.key)).collect()
        }

        /* 获取所有值 */
        pub fn value_set(&self) -> Vec<&String> {
            self.buckets.iter().filter_map(|pair| pair.as_ref().map(|pair| &pair.val)).collect()
        }

        /* 打印哈希表 */
        pub fn print(&self) {
            for pair in self.entry_set() {
                println!("{} -> {}", pair.key, pair.val);
            }
        }
    }
    ```

=== "C"

    ```c title="array_hash_map.c"
    /* 键值对 int->string */
    typedef struct {
        int key;
        char *val;
    } Pair;

    /* 基于数组实现的哈希表 */
    typedef struct {
        Pair *buckets[HASHTABLE_CAPACITY];
    } ArrayHashMap;

    /* 构造函数 */
    ArrayHashMap *newArrayHashMap() {
        ArrayHashMap *hmap = malloc(sizeof(ArrayHashMap));
        return hmap;
    }

    /* 析构函数 */
    void delArrayHashMap(ArrayHashMap *hmap) {
        for (int i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                free(hmap->buckets[i]->val);
                free(hmap->buckets[i]);
            }
        }
        free(hmap);
    }

    /* 添加操作 */
    void put(ArrayHashMap *hmap, const int key, const char *val) {
        Pair *Pair = malloc(sizeof(Pair));
        Pair->key = key;
        Pair->val = malloc(strlen(val) + 1);
        strcpy(Pair->val, val);

        int index = hashFunc(key);
        hmap->buckets[index] = Pair;
    }

    /* 删除操作 */
    void removeItem(ArrayHashMap *hmap, const int key) {
        int index = hashFunc(key);
        free(hmap->buckets[index]->val);
        free(hmap->buckets[index]);
        hmap->buckets[index] = NULL;
    }

    /* 获取所有键值对 */
    void pairSet(ArrayHashMap *hmap, MapSet *set) {
        Pair *entries;
        int i = 0, index = 0;
        int total = 0;
        /* 统计有效键值对数量 */
        for (i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                total++;
            }
        }
        entries = malloc(sizeof(Pair) * total);
        for (i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                entries[index].key = hmap->buckets[i]->key;
                entries[index].val = malloc(strlen(hmap->buckets[i]->val) + 1);
                strcpy(entries[index].val, hmap->buckets[i]->val);
                index++;
            }
        }
        set->set = entries;
        set->len = total;
    }

    /* 获取所有键 */
    void keySet(ArrayHashMap *hmap, MapSet *set) {
        int *keys;
        int i = 0, index = 0;
        int total = 0;
        /* 统计有效键值对数量 */
        for (i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                total++;
            }
        }
        keys = malloc(total * sizeof(int));
        for (i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                keys[index] = hmap->buckets[i]->key;
                index++;
            }
        }
        set->set = keys;
        set->len = total;
    }

    /* 获取所有值 */
    void valueSet(ArrayHashMap *hmap, MapSet *set) {
        char **vals;
        int i = 0, index = 0;
        int total = 0;
        /* 统计有效键值对数量 */
        for (i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                total++;
            }
        }
        vals = malloc(total * sizeof(char *));
        for (i = 0; i < HASHTABLE_CAPACITY; i++) {
            if (hmap->buckets[i] != NULL) {
                vals[index] = hmap->buckets[i]->val;
                index++;
            }
        }
        set->set = vals;
        set->len = total;
    }

    /* 打印哈希表 */
    void print(ArrayHashMap *hmap) {
        int i;
        MapSet set;
        pairSet(hmap, &set);
        Pair *entries = (Pair *)set.set;
        for (i = 0; i < set.len; i++) {
            printf("%d -> %s\n", entries[i].key, entries[i].val);
        }
        free(set.set);
    }
    ```

=== "Zig"

    ```zig title="array_hash_map.zig"
    // 键值对
    const Pair = struct {
        key: usize = undefined,
        val: []const u8 = undefined,

       pub fn init(key: usize, val: []const u8) Pair {
            return Pair {
                .key = key,
                .val = val,
            };
        }
    };

    // 基于数组实现的哈希表
    fn ArrayHashMap(comptime T: type) type {
        return struct {
            bucket: ?std.ArrayList(?T) = null,
            mem_allocator: std.mem.Allocator = undefined,

            const Self = @This();
            
            // 构造函数
            pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
                self.mem_allocator = allocator;
                // 初始化一个长度为 100 的桶（数组）
                self.bucket = std.ArrayList(?T).init(self.mem_allocator);
                var i: i32 = 0;
                while (i < 100) : (i += 1) {
                    try self.bucket.?.append(null);
                }
            }

            // 析构函数
            pub fn deinit(self: *Self) void {
                if (self.bucket != null) self.bucket.?.deinit();
            }

            // 哈希函数
            fn hashFunc(key: usize) usize {
                var index = key % 100;
                return index;
            }

            // 查询操作
            pub fn get(self: *Self, key: usize) []const u8 {
                var index = hashFunc(key);
                var pair = self.bucket.?.items[index];
                return pair.?.val;
            }

            // 添加操作
            pub fn put(self: *Self, key: usize, val: []const u8) !void {
                var pair = Pair.init(key, val);
                var index = hashFunc(key);
                self.bucket.?.items[index] = pair;
            }

            // 删除操作
            pub fn remove(self: *Self, key: usize) !void {
                var index = hashFunc(key);
                // 置为 null ，代表删除
                self.bucket.?.items[index] = null;
            }       

            // 获取所有键值对
            pub fn pairSet(self: *Self) !std.ArrayList(T) {
                var entry_set = std.ArrayList(T).init(self.mem_allocator);
                for (self.bucket.?.items) |item| {
                    if (item == null) continue;
                    try entry_set.append(item.?);
                }
                return entry_set;
            }  

            // 获取所有键
            pub fn keySet(self: *Self) !std.ArrayList(usize) {
                var key_set = std.ArrayList(usize).init(self.mem_allocator);
                for (self.bucket.?.items) |item| {
                    if (item == null) continue;
                    try key_set.append(item.?.key);
                }
                return key_set;
            }  

            // 获取所有值
            pub fn valueSet(self: *Self) !std.ArrayList([]const u8) {
                var value_set = std.ArrayList([]const u8).init(self.mem_allocator);
                for (self.bucket.?.items) |item| {
                    if (item == null) continue;
                    try value_set.append(item.?.val);
                }
                return value_set;
            }

            // 打印哈希表
            pub fn print(self: *Self) !void {
                var entry_set = try self.pairSet();
                defer entry_set.deinit();
                for (entry_set.items) |item| {
                    std.debug.print("{} -> {s}\n", .{item.key, item.val});
                }
            }
        };
    }
    ```

## 6.1.3 &nbsp; 哈希冲突与扩容

从本质上看，哈希函数的作用是将所有 `key` 构成的输入空间映射到数组所有索引构成的输出空间，而输入空间往往远大于输出空间。因此，**理论上一定存在“多个输入对应相同输出”的情况**。

对于上述示例中的哈希函数，当输入的 `key` 后两位相同时，哈希函数的输出结果也相同。例如，查询学号为 12836 和 20336 的两个学生时，我们得到：

```shell
12836 % 100 = 36
20336 % 100 = 36
```

如图 6-3 所示，两个学号指向了同一个姓名，这显然是不对的。我们将这种多个输入对应同一输出的情况称为「哈希冲突 hash collision」。

![哈希冲突示例](hash_map.assets/hash_collision.png){ class="animation-figure" }

<p align="center"> 图 6-3 &nbsp; 哈希冲突示例 </p>

容易想到，哈希表容量 $n$ 越大，多个 `key` 被分配到同一个桶中的概率就越低，冲突就越少。因此，**我们可以通过扩容哈希表来减少哈希冲突**。

如图 6-4 所示，扩容前键值对 `(136, A)` 和 `(236, D)` 发生冲突，扩容后冲突消失。

![哈希表扩容](hash_map.assets/hash_table_reshash.png){ class="animation-figure" }

<p align="center"> 图 6-4 &nbsp; 哈希表扩容 </p>

类似于数组扩容，哈希表扩容需将所有键值对从原哈希表迁移至新哈希表，非常耗时；并且由于哈希表容量 `capacity` 改变，我们需要通过哈希函数来重新计算所有键值对的存储位置，这进一步提高了扩容过程的计算开销。为此，编程语言通常会预留足够大的哈希表容量，防止频繁扩容。

「负载因子 load factor」是哈希表的一个重要概念，其定义为哈希表的元素数量除以桶数量，用于衡量哈希冲突的严重程度，**也常作为哈希表扩容的触发条件**。例如在 Java 中，当负载因子超过 $0.75$ 时，系统会将哈希表扩容至原先的 $2$ 倍。
