---
comments: true
---

# 6.2 &nbsp; ハッシュ衝突

前節で見たように、**通常、ハッシュ関数の入力の範囲は出力の範囲よりはるかに広い**ため、理論上、衝突は避けられません。例えば、すべての整数を入力とし、出力を配列の容量に収まるインデックスに限れば、必ず複数の整数が同じバケットに対応します。

衝突によって誤った検索結果が返ると、ハッシュ表の実用性は大きく損なわれます。衝突に出会うたびに、衝突がなくなるまで表を拡張する方法もあります。単純で効果はありますが、拡張のたびに大量のデータを移し、ハッシュ値を計算し直すので非効率です。効率を高めるには、次の方針が考えられます。

1. ハッシュ表のデータ構造を改良し、**衝突しても正しく動作するようにします**。
2. 拡張は必要なとき、つまり衝突が多くなったときだけ行います。

ハッシュ表の構造を改良する代表的な方法は、「チェイン法」と「オープンアドレス法」です。

## 6.2.1 &nbsp; チェイン法

これまでのハッシュ表では、各バケットには 1 組のキーと値しか格納できませんでした。<u>チェイン法（separate chaining）</u>では、単一の要素を置いていたところに連結リストを置きます。キーと値のペアをノードとし、衝突したペアをすべて同じリストに格納します。図 6-5 はチェイン法を使ったハッシュ表の例です。

![チェイン法によるハッシュ表](hash_collision.assets/hash_table_chaining.svg){ class="animation-figure" }

<p align="center"> 図 6-5 &nbsp; チェイン法によるハッシュ表 </p>

チェイン法を使うと、ハッシュ表の操作は次のように変わります。

- **要素の検索**：入力された `key` からハッシュ関数でバケットのインデックスを求め、リストの先頭ノードにアクセスします。そこからリストをたどり、`key` を比較して目的のペアを探します。
- **要素の追加**：ハッシュ関数を使ってリストの先頭ノードにアクセスし、ノード（キーと値のペア）をリストに追加します。
- **要素の削除**：ハッシュ関数の結果を使ってリストの先頭にアクセスし、リストをたどって目的のノードを見つけ、削除します。

チェイン法には次の制約があります。

- **使用するメモリが増える**：連結リストではノードを指すポインタが必要なので、配列よりも多くのメモリを使います。
- **検索効率が下がる**：目的の要素を見つけるためにリストを先頭から順にたどる必要があります。

次のコードはチェイン法によるハッシュ表の簡単な実装です。次の 2 点に注目してください。

- コードを簡潔にするため、連結リストの代わりにリスト（動的配列）を使います。この実装ではハッシュ表（配列）が複数のバケットを持ち、各バケットが 1 つのリストになっています。
- この実装には表を拡張するメソッドがあります。負荷率が $\frac{2}{3}$ を超えると、容量を元の $2$ 倍にします。

=== "Python"

    ```python title="hash_map_chaining.py"
    class HashMapChaining:
        """チェイン法によるハッシュ表"""

        def __init__(self):
            """コンストラクタ"""
            self.size = 0  # キーと値のペアの数
            self.capacity = 4  # ハッシュ表の容量
            self.load_thres = 2.0 / 3.0  # 表を拡張する負荷率のしきい値
            self.extend_ratio = 2  # 容量の拡張倍率
            self.buckets = [[] for _ in range(self.capacity)]  # バケットの配列

        def hash_func(self, key: int) -> int:
            """ハッシュ関数"""
            return key % self.capacity

        def load_factor(self) -> float:
            """負荷率"""
            return self.size / self.capacity

        def get(self, key: int) -> str | None:
            """検索"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # バケットを走査し、key が見つかったら対応する val を返す
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # key が見つからなければ None を返す
            return None

        def put(self, key: int, val: str):
            """追加"""
            # 負荷率がしきい値を超えたら表を拡張する
            if self.load_factor() > self.load_thres:
                self.extend()
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for pair in bucket:
                if pair.key == key:
                    pair.val = val
                    return
            # key がなければ末尾にペアを追加する
            pair = Pair(key, val)
            bucket.append(pair)
            self.size += 1

        def remove(self, key: int):
            """削除"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # バケットを走査し、該当するペアを削除する
            for pair in bucket:
                if pair.key == key:
                    bucket.remove(pair)
                    self.size -= 1
                    break

        def extend(self):
            """ハッシュ表を拡張する"""
            # 元のハッシュ表を一時保存する
            buckets = self.buckets
            # 拡張後の新しいハッシュ表を初期化する
            self.capacity *= self.extend_ratio
            self.buckets = [[] for _ in range(self.capacity)]
            self.size = 0
            # 元のハッシュ表から新しい表にペアを移す
            for bucket in buckets:
                for pair in bucket:
                    self.put(pair.key, pair.val)

        def print(self):
            """ハッシュ表を表示する"""
            for bucket in self.buckets:
                res = []
                for pair in bucket:
                    res.append(str(pair.key) + " -> " + pair.val)
                print(res)
    ```

=== "C++"

    ```cpp title="hash_map_chaining.cpp"
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
      private:
        int size;                       // キーと値のペアの数
        int capacity;                   // ハッシュ表の容量
        double loadThres;               // 表を拡張する負荷率のしきい値
        int extendRatio;                // 容量の拡張倍率
        vector<vector<Pair *>> buckets; // バケットの配列

      public:
        /* コンストラクタ */
        HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
            buckets.resize(capacity);
        }

        /* デストラクタ */
        ~HashMapChaining() {
            for (auto &bucket : buckets) {
                for (Pair *pair : bucket) {
                    // メモリを解放する
                    delete pair;
                }
            }
        }

        /* ハッシュ関数 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 負荷率 */
        double loadFactor() {
            return (double)size / (double)capacity;
        }

        /* 検索 */
        string get(int key) {
            int index = hashFunc(key);
            // バケットを走査し、key が見つかったら対応する val を返す
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    return pair->val;
                }
            }
            // key が見つからなければ空文字列を返す
            return "";
        }

        /* 追加 */
        void put(int key, string val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    pair->val = val;
                    return;
                }
            }
            // key がなければ末尾にペアを追加する
            buckets[index].push_back(new Pair(key, val));
            size++;
        }

        /* 削除 */
        void remove(int key) {
            int index = hashFunc(key);
            auto &bucket = buckets[index];
            // バケットを走査し、該当するペアを削除する
            for (int i = 0; i < bucket.size(); i++) {
                if (bucket[i]->key == key) {
                    Pair *tmp = bucket[i];
                    bucket.erase(bucket.begin() + i); // 該当するペアを削除する
                    delete tmp;                       // メモリを解放する
                    size--;
                    return;
                }
            }
        }

        /* ハッシュ表を拡張する */
        void extend() {
            // 元のハッシュ表を一時保存する
            vector<vector<Pair *>> bucketsTmp = buckets;
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio;
            buckets.clear();
            buckets.resize(capacity);
            size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (auto &bucket : bucketsTmp) {
                for (Pair *pair : bucket) {
                    put(pair->key, pair->val);
                    // メモリを解放する
                    delete pair;
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
        int size; // キーと値のペアの数
        int capacity; // ハッシュ表の容量
        double loadThres; // 表を拡張する負荷率のしきい値
        int extendRatio; // 容量の拡張倍率
        List<List<Pair>> buckets; // バケットの配列

        /* コンストラクタ */
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

        /* ハッシュ関数 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 負荷率 */
        double loadFactor() {
            return (double) size / capacity;
        }

        /* 検索 */
        String get(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // バケットを走査し、key が見つかったら対応する val を返す
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // key が見つからなければ null を返す
            return null;
        }

        /* 追加 */
        void put(int key, String val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // key がなければ末尾にペアを追加する
            Pair pair = new Pair(key, val);
            bucket.add(pair);
            size++;
        }

        /* 削除 */
        void remove(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // バケットを走査し、該当するペアを削除する
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    bucket.remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* ハッシュ表を拡張する */
        void extend() {
            // 元のハッシュ表を一時保存する
            List<List<Pair>> bucketsTmp = buckets;
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
            size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (List<Pair> bucket : bucketsTmp) {
                for (Pair pair : bucket) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
        int size; // キーと値のペアの数
        int capacity; // ハッシュ表の容量
        double loadThres; // 表を拡張する負荷率のしきい値
        int extendRatio; // 容量の拡張倍率
        List<List<Pair>> buckets; // バケットの配列

        /* コンストラクタ */
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

        /* ハッシュ関数 */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* 負荷率 */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* 検索 */
        public string? Get(int key) {
            int index = HashFunc(key);
            // バケットを走査し、key が見つかったら対応する val を返す
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // key が見つからなければ null を返す
            return null;
        }

        /* 追加 */
        public void Put(int key, string val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (LoadFactor() > loadThres) {
                Extend();
            }
            int index = HashFunc(key);
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // key がなければ末尾にペアを追加する
            buckets[index].Add(new Pair(key, val));
            size++;
        }

        /* 削除 */
        public void Remove(int key) {
            int index = HashFunc(key);
            // バケットを走査し、該当するペアを削除する
            foreach (Pair pair in buckets[index].ToList()) {
                if (pair.key == key) {
                    buckets[index].Remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* ハッシュ表を拡張する */
        void Extend() {
            // 元のハッシュ表を一時保存する
            List<List<Pair>> bucketsTmp = buckets;
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio;
            buckets = new List<List<Pair>>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.Add([]);
            }
            size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            foreach (List<Pair> bucket in bucketsTmp) {
                foreach (Pair pair in bucket) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    type hashMapChaining struct {
        size        int      // キーと値のペアの数
        capacity    int      // ハッシュ表の容量
        loadThres   float64  // 表を拡張する負荷率のしきい値
        extendRatio int      // 容量の拡張倍率
        buckets     [][]pair // バケットの配列
    }

    /* コンストラクタ */
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

    /* ハッシュ関数 */
    func (m *hashMapChaining) hashFunc(key int) int {
        return key % m.capacity
    }

    /* 負荷率 */
    func (m *hashMapChaining) loadFactor() float64 {
        return float64(m.size) / float64(m.capacity)
    }

    /* 検索 */
    func (m *hashMapChaining) get(key int) string {
        idx := m.hashFunc(key)
        bucket := m.buckets[idx]
        // バケットを走査し、key が見つかったら対応する val を返す
        for _, p := range bucket {
            if p.key == key {
                return p.val
            }
        }
        // key が見つからなければ空文字列を返す
        return ""
    }

    /* 追加 */
    func (m *hashMapChaining) put(key int, val string) {
        // 負荷率がしきい値を超えたら表を拡張する
        if m.loadFactor() > m.loadThres {
            m.extend()
        }
        idx := m.hashFunc(key)
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for i := range m.buckets[idx] {
            if m.buckets[idx][i].key == key {
                m.buckets[idx][i].val = val
                return
            }
        }
        // key がなければ末尾にペアを追加する
        p := pair{
            key: key,
            val: val,
        }
        m.buckets[idx] = append(m.buckets[idx], p)
        m.size += 1
    }

    /* 削除 */
    func (m *hashMapChaining) remove(key int) {
        idx := m.hashFunc(key)
        // バケットを走査し、該当するペアを削除する
        for i, p := range m.buckets[idx] {
            if p.key == key {
                // スライスから削除する
                m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
                m.size -= 1
                break
            }
        }
    }

    /* ハッシュ表を拡張する */
    func (m *hashMapChaining) extend() {
        // 元のハッシュ表を一時保存する
        tmpBuckets := make([][]pair, len(m.buckets))
        for i := 0; i < len(m.buckets); i++ {
            tmpBuckets[i] = make([]pair, len(m.buckets[i]))
            copy(tmpBuckets[i], m.buckets[i])
        }
        // 拡張後の新しいハッシュ表を初期化する
        m.capacity *= m.extendRatio
        m.buckets = make([][]pair, m.capacity)
        for i := 0; i < m.capacity; i++ {
            m.buckets[i] = make([]pair, 0)
        }
        m.size = 0
        // 元のハッシュ表から新しい表にペアを移す
        for _, bucket := range tmpBuckets {
            for _, p := range bucket {
                m.put(p.key, p.val)
            }
        }
    }

    /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
        var size: Int // キーと値のペアの数
        var capacity: Int // ハッシュ表の容量
        var loadThres: Double // 表を拡張する負荷率のしきい値
        var extendRatio: Int // 容量の拡張倍率
        var buckets: [[Pair]] // バケットの配列

        /* コンストラクタ */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: [], count: capacity)
        }

        /* ハッシュ関数 */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* 負荷率 */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* 検索 */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // バケットを走査し、key が見つかったら対応する val を返す
            for pair in bucket {
                if pair.key == key {
                    return pair.val
                }
            }
            // key が見つからなければ nil を返す
            return nil
        }

        /* 追加 */
        func put(key: Int, val: String) {
            // 負荷率がしきい値を超えたら表を拡張する
            if loadFactor() > loadThres {
                extend()
            }
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for pair in bucket {
                if pair.key == key {
                    pair.val = val
                    return
                }
            }
            // key がなければ末尾にペアを追加する
            let pair = Pair(key: key, val: val)
            buckets[index].append(pair)
            size += 1
        }

        /* 削除 */
        func remove(key: Int) {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // バケットを走査し、該当するペアを削除する
            for (pairIndex, pair) in bucket.enumerated() {
                if pair.key == key {
                    buckets[index].remove(at: pairIndex)
                    size -= 1
                    break
                }
            }
        }

        /* ハッシュ表を拡張する */
        func extend() {
            // 元のハッシュ表を一時保存する
            let bucketsTmp = buckets
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio
            buckets = Array(repeating: [], count: capacity)
            size = 0
            // 元のハッシュ表から新しい表にペアを移す
            for bucket in bucketsTmp {
                for pair in bucket {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
        #size; // キーと値のペアの数
        #capacity; // ハッシュ表の容量
        #loadThres; // 表を拡張する負荷率のしきい値
        #extendRatio; // 容量の拡張倍率
        #buckets; // バケットの配列

        /* コンストラクタ */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* ハッシュ関数 */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* 負荷率 */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* 検索 */
        get(key) {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // バケットを走査し、key が見つかったら対応する val を返す
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // key が見つからなければ null を返す
            return null;
        }

        /* 追加 */
        put(key, val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // key がなければ末尾にペアを追加する
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* 削除 */
        remove(key) {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // バケットを走査し、該当するペアを削除する
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* ハッシュ表を拡張する */
        #extend() {
            // 元のハッシュ表を一時保存する
            const bucketsTmp = this.#buckets;
            // 拡張後の新しいハッシュ表を初期化する
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
        #size: number; // キーと値のペアの数
        #capacity: number; // ハッシュ表の容量
        #loadThres: number; // 表を拡張する負荷率のしきい値
        #extendRatio: number; // 容量の拡張倍率
        #buckets: Pair[][]; // バケットの配列

        /* コンストラクタ */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* ハッシュ関数 */
        #hashFunc(key: number): number {
            return key % this.#capacity;
        }

        /* 負荷率 */
        #loadFactor(): number {
            return this.#size / this.#capacity;
        }

        /* 検索 */
        get(key: number): string | null {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // バケットを走査し、key が見つかったら対応する val を返す
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // key が見つからなければ null を返す
            return null;
        }

        /* 追加 */
        put(key: number, val: string): void {
            // 負荷率がしきい値を超えたら表を拡張する
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // key がなければ末尾にペアを追加する
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* 削除 */
        remove(key: number): void {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // バケットを走査し、該当するペアを削除する
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* ハッシュ表を拡張する */
        #extend(): void {
            // 元のハッシュ表を一時保存する
            const bucketsTmp = this.#buckets;
            // 拡張後の新しいハッシュ表を初期化する
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
      late int size; // キーと値のペアの数
      late int capacity; // ハッシュ表の容量
      late double loadThres; // 表を拡張する負荷率のしきい値
      late int extendRatio; // 容量の拡張倍率
      late List<List<Pair>> buckets; // バケットの配列

      /* コンストラクタ */
      HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = List.generate(capacity, (_) => []);
      }

      /* ハッシュ関数 */
      int hashFunc(int key) {
        return key % capacity;
      }

      /* 負荷率 */
      double loadFactor() {
        return size / capacity;
      }

      /* 検索 */
      String? get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // バケットを走査し、key が見つかったら対応する val を返す
        for (Pair pair in bucket) {
          if (pair.key == key) {
            return pair.val;
          }
        }
        // key が見つからなければ null を返す
        return null;
      }

      /* 追加 */
      void put(int key, String val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
          extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for (Pair pair in bucket) {
          if (pair.key == key) {
            pair.val = val;
            return;
          }
        }
        // key がなければ末尾にペアを追加する
        Pair pair = Pair(key, val);
        bucket.add(pair);
        size++;
      }

      /* 削除 */
      void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // バケットを走査し、該当するペアを削除する
        for (Pair pair in bucket) {
          if (pair.key == key) {
            bucket.remove(pair);
            size--;
            break;
          }
        }
      }

      /* ハッシュ表を拡張する */
      void extend() {
        // 元のハッシュ表を一時保存する
        List<List<Pair>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets = List.generate(capacity, (_) => []);
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (List<Pair> bucket in bucketsTmp) {
          for (Pair pair in bucket) {
            put(pair.key, pair.val);
          }
        }
      }

      /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    struct HashMapChaining {
        size: usize,
        capacity: usize,
        load_thres: f32,
        extend_ratio: usize,
        buckets: Vec<Vec<Pair>>,
    }

    impl HashMapChaining {
        /* コンストラクタ */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![vec![]; 4],
            }
        }

        /* ハッシュ関数 */
        fn hash_func(&self, key: i32) -> usize {
            key as usize % self.capacity
        }

        /* 負荷率 */
        fn load_factor(&self) -> f32 {
            self.size as f32 / self.capacity as f32
        }

        /* 削除 */
        fn remove(&mut self, key: i32) -> Option<String> {
            let index = self.hash_func(key);

            // バケットを走査し、該当するペアを削除する
            for (i, p) in self.buckets[index].iter_mut().enumerate() {
                if p.key == key {
                    let pair = self.buckets[index].remove(i);
                    self.size -= 1;
                    return Some(pair.val);
                }
            }

            // key が見つからなければ None を返す
            None
        }

        /* ハッシュ表を拡張する */
        fn extend(&mut self) {
            // 元のハッシュ表を一時保存する
            let buckets_tmp = std::mem::take(&mut self.buckets);

            // 拡張後の新しいハッシュ表を初期化する
            self.capacity *= self.extend_ratio;
            self.buckets = vec![Vec::new(); self.capacity as usize];
            self.size = 0;

            // 元のハッシュ表から新しい表にペアを移す
            for bucket in buckets_tmp {
                for pair in bucket {
                    self.put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
        fn print(&self) {
            for bucket in &self.buckets {
                let mut res = Vec::new();
                for pair in bucket {
                    res.push(format!("{} -> {}", pair.key, pair.val));
                }
                println!("{:?}", res);
            }
        }

        /* 追加 */
        fn put(&mut self, key: i32, val: String) {
            // 負荷率がしきい値を超えたら表を拡張する
            if self.load_factor() > self.load_thres {
                self.extend();
            }

            let index = self.hash_func(key);

            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for pair in self.buckets[index].iter_mut() {
                if pair.key == key {
                    pair.val = val;
                    return;
                }
            }

            // key がなければ末尾にペアを追加する
            let pair = Pair { key, val };
            self.buckets[index].push(pair);
            self.size += 1;
        }

        /* 検索 */
        fn get(&self, key: i32) -> Option<&str> {
            let index = self.hash_func(key);

            // バケットを走査し、key が見つかったら対応する val を返す
            for pair in self.buckets[index].iter() {
                if pair.key == key {
                    return Some(&pair.val);
                }
            }

            // key が見つからなければ None を返す
            None
        }
    }
    ```

=== "C"

    ```c title="hash_map_chaining.c"
    /* 連結リストのノード */
    typedef struct Node {
        Pair *pair;
        struct Node *next;
    } Node;

    /* チェイン法によるハッシュ表 */
    typedef struct {
        int size;         // キーと値のペアの数
        int capacity;     // ハッシュ表の容量
        double loadThres; // 表を拡張する負荷率のしきい値
        int extendRatio;  // 容量の拡張倍率
        Node **buckets;   // バケットの配列
    } HashMapChaining;

    /* コンストラクタ */
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

    /* デストラクタ */
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

    /* ハッシュ関数 */
    int hashFunc(HashMapChaining *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* 負荷率 */
    double loadFactor(HashMapChaining *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* 検索 */
    char *get(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        // バケットを走査し、key が見つかったら対応する val を返す
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                return cur->pair->val;
            }
            cur = cur->next;
        }
        return ""; // key が見つからなければ空文字列を返す
    }

    /* 追加 */
    void put(HashMapChaining *hashMap, int key, const char *val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        int index = hashFunc(hashMap, key);
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                strcpy(cur->pair->val, val); // 指定の key が見つかったら対応する val を更新して処理を終える
                return;
            }
            cur = cur->next;
        }
        // key がなければ連結リストの先頭にペアを追加する
        Pair *newPair = (Pair *)malloc(sizeof(Pair));
        newPair->key = key;
        strcpy(newPair->val, val);
        Node *newNode = (Node *)malloc(sizeof(Node));
        newNode->pair = newPair;
        newNode->next = hashMap->buckets[index];
        hashMap->buckets[index] = newNode;
        hashMap->size++;
    }

    /* ハッシュ表を拡張する */
    void extend(HashMapChaining *hashMap) {
        // 元のハッシュ表を一時保存する
        int oldCapacity = hashMap->capacity;
        Node **oldBuckets = hashMap->buckets;
        // 拡張後の新しいハッシュ表を初期化する
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
        for (int i = 0; i < hashMap->capacity; i++) {
            hashMap->buckets[i] = NULL;
        }
        hashMap->size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (int i = 0; i < oldCapacity; i++) {
            Node *cur = oldBuckets[i];
            while (cur) {
                put(hashMap, cur->pair->key, cur->pair->val);
                Node *temp = cur;
                cur = cur->next;
                // メモリを解放する
                free(temp->pair);
                free(temp);
            }
        }

        free(oldBuckets);
    }

    /* 削除 */
    void removeItem(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        Node *cur = hashMap->buckets[index];
        Node *pre = NULL;
        while (cur) {
            if (cur->pair->key == key) {
                // 該当するペアを削除する
                if (pre) {
                    pre->next = cur->next;
                } else {
                    hashMap->buckets[index] = cur->next;
                }
                // メモリを解放する
                free(cur->pair);
                free(cur);
                hashMap->size--;
                return;
            }
            pre = cur;
            cur = cur->next;
        }
    }

    /* ハッシュ表を表示する */
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
    /* チェイン法によるハッシュ表 */
    class HashMapChaining {
        var size: Int // キーと値のペアの数
        var capacity: Int // ハッシュ表の容量
        val loadThres: Double // 表を拡張する負荷率のしきい値
        val extendRatio: Int // 容量の拡張倍率
        var buckets: MutableList<MutableList<Pair>> // バケットの配列

        /* コンストラクタ */
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

        /* ハッシュ関数 */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* 負荷率 */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* 検索 */
        fun get(key: Int): String? {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // バケットを走査し、key が見つかったら対応する val を返す
            for (pair in bucket) {
                if (pair.key == key) return pair._val
            }
            // key が見つからなければ null を返す
            return null
        }

        /* 追加 */
        fun put(key: Int, _val: String) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (loadFactor() > loadThres) {
                extend()
            }
            val index = hashFunc(key)
            val bucket = buckets[index]
            // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
            for (pair in bucket) {
                if (pair.key == key) {
                    pair._val = _val
                    return
                }
            }
            // key がなければ末尾にペアを追加する
            val pair = Pair(key, _val)
            bucket.add(pair)
            size++
        }

        /* 削除 */
        fun remove(key: Int) {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // バケットを走査し、該当するペアを削除する
            for (pair in bucket) {
                if (pair.key == key) {
                    bucket.remove(pair)
                    size--
                    break
                }
            }
        }

        /* ハッシュ表を拡張する */
        fun extend() {
            // 元のハッシュ表を一時保存する
            val bucketsTmp = buckets
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio
            // MutableList のサイズは可変
            buckets = mutableListOf()
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
            size = 0
            // 元のハッシュ表から新しい表にペアを移す
            for (bucket in bucketsTmp) {
                for (pair in bucket) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* ハッシュ表を表示する */
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
    ### チェイン法によるハッシュ表 ###
    class HashMapChaining
      ### コンストラクタ ###
      def initialize
        @size = 0 # キーと値のペアの数
        @capacity = 4 # ハッシュ表の容量
        @load_thres = 2.0 / 3.0 # 表を拡張する負荷率のしきい値
        @extend_ratio = 2 # 容量の拡張倍率
        @buckets = Array.new(@capacity) { [] } # バケットの配列
      end

      ### ハッシュ関数 ###
      def hash_func(key)
        key % @capacity
      end

      ### 負荷率 ###
      def load_factor
        @size / @capacity.to_f
      end

      ### 検索 ###
      def get(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # バケットを走査し、key が見つかったら対応する val を返す
        for pair in bucket
          return pair.val if pair.key == key
        end
        # key が見つからなければ nil を返す
        nil
      end

      ### 追加 ###
      def put(key, val)
        # 負荷率がしきい値を超えたら表を拡張する
        extend if load_factor > @load_thres
        index = hash_func(key)
        bucket = @buckets[index]
        # バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for pair in bucket
          if pair.key == key
            pair.val = val
            return
          end
        end
        # key がなければ末尾にペアを追加する
        pair = Pair.new(key, val)
        bucket << pair
        @size += 1
      end

      ### 削除 ###
      def remove(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # バケットを走査し、該当するペアを削除する
        for pair in bucket
          if pair.key == key
            bucket.delete(pair)
            @size -= 1
            break
          end
        end
      end

      ### ハッシュ表を拡張する ###
      def extend
        # 元のハッシュ表を一時保存する
        buckets = @buckets
        # 拡張後の新しいハッシュ表を初期化する
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity) { [] }
        @size = 0
        # 元のハッシュ表から新しい表にペアを移す
        for bucket in buckets
          for pair in bucket
            put(pair.key, pair.val)
          end
        end
      end

      ### ハッシュ表を表示する ###
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

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E7%B5%84%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22%E3%83%81%E3%82%A7%E3%82%A4%E3%83%B3%E6%B3%95%E3%81%AE%E8%A1%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%9D%E6%9C%9F%E5%8C%96%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%B2%A0%E8%8D%B7%E7%8E%87%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%A4%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%89%8A%E9%99%A4%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E3%82%92%E6%8B%A1%E5%BC%B5%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E3%82%92%E8%A1%A8%E7%A4%BA%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%A1%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%95%B0%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B8%AD%22%29%0A%0A%20%20%20%20%23%20%E6%A4%9C%E7%B4%A2%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20%E5%89%8A%E9%99%A4%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E7%B5%84%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22%E3%83%81%E3%82%A7%E3%82%A4%E3%83%B3%E6%B3%95%E3%81%AE%E8%A1%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%9D%E6%9C%9F%E5%8C%96%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%B2%A0%E8%8D%B7%E7%8E%87%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%A4%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%89%8A%E9%99%A4%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E3%82%92%E6%8B%A1%E5%BC%B5%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E3%82%92%E8%A1%A8%E7%A4%BA%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%A1%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%95%B0%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B8%AD%22%29%0A%0A%20%20%20%20%23%20%E6%A4%9C%E7%B4%A2%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20%E5%89%8A%E9%99%A4%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

リストが長くなると、検索に $O(n)$ かかり、効率が悪くなります。**この場合は、連結リストを「AVL 木」や「赤黒木」に変換する**ことで、検索の時間計算量を $O(\log n)$ に改善できます。

## 6.2.2 &nbsp; オープンアドレス法

<u>オープンアドレス法（open addressing）</u>では、データ構造を追加せず、複数の格納先候補を順に調べて衝突を処理します。代表的な探索方法には、線形探索法、二次探索法、複数のハッシュ関数を使う方法があります。

ここでは線形探索法を例に、オープンアドレス法によるハッシュ表の仕組みを見ていきます。

### 1. &nbsp; 線形探索法

線形探索法では、一定のステップ幅で順に格納先を調べます。通常のハッシュ表とは操作が少し異なります。

- **要素の挿入**：ハッシュ関数でバケットのインデックスを計算します。すでに要素が入っていれば、衝突した位置から一定のステップ幅（通常は $1$）で順に先を調べ、最初に見つけた空のバケットに要素を挿入します。
- **要素の検索**：衝突したら、挿入時と同じ幅で順に先を調べます。目的の要素を見つけたら `value` を返します。空のバケットに出会った場合は、その要素は表にないので `None` を返します。

図 6-6 は、オープンアドレス法（線形探索法）を使った表にペアがどう分布するかを示しています。このハッシュ関数では、下 2 桁が同じ `key` はすべて同じバケットに対応します。線形探索の結果、それらのペアはそのバケットと、それに続く下のバケットに順に格納されます。

![オープンアドレス法（線形探索法）によるハッシュ表でのペアの分布](hash_collision.assets/hash_table_linear_probing.svg){ class="animation-figure" }

<p align="center"> 図 6-6 &nbsp; オープンアドレス法（線形探索法）によるハッシュ表でのペアの分布 </p>

ただし、**線形探索法では「クラスタリング」が起きやすい**という問題があります。配列内で使用中の位置が長く連続するほど、その区間で衝突が起きやすくなります。すると使用中の区間がさらに伸びるという悪循環が生じ、最終的には追加、削除、検索、更新の効率が下がります。

ここで注意したいのは、**オープンアドレス法の表では要素をそのまま削除できない**ことです。削除によって配列内に空のバケット `None` ができると、検索時の線形探索はそこで終了します。図 6-7 のように、その先にある要素に到達できなくなり、存在しないと誤って判断するおそれがあります。

![オープンアドレス法で要素を削除すると起きる検索の問題](hash_collision.assets/hash_table_open_addressing_deletion.svg){ class="animation-figure" }

<p align="center"> 図 6-7 &nbsp; オープンアドレス法で要素を削除すると起きる検索の問題 </p>

この問題には<u>遅延削除（lazy deletion）</u>を使えます。要素を表から直接取り除かず、**定数 `TOMBSTONE` を置いてバケットに印を付けます**。`None` と `TOMBSTONE` はどちらも空のバケットを表し、新しいペアを格納できます。ただし、線形探索中に `TOMBSTONE` に出会った場合は、その先にもペアがあるかもしれないので探索を続けます。

一方で、**遅延削除はハッシュ表の性能低下を早めることがあります**。削除のたびにマーカーが 1 つ生じます。`TOMBSTONE` が増えると、線形探索で目的の要素にたどり着くまでに複数の `TOMBSTONE` を通り過ぎることがあり、探索時間も長くなります。

そこで、線形探索中に最初に出会った `TOMBSTONE` のインデックスを記録し、見つけた目的の要素とその `TOMBSTONE` の位置を入れ替える方法が考えられます。こうすれば、要素を検索または追加するたびに、その要素を本来の位置（探索の開始位置）に近いバケットに移せるため、検索効率が上がります。

次のコードは、遅延削除を取り入れたオープンアドレス法（線形探索法）のハッシュ表です。容量を十分に生かすため、表を「循環配列」とみなし、配列の末尾を越えたら先頭に戻って探索を続けます。

=== "Python"

    ```python title="hash_map_open_addressing.py"
    class HashMapOpenAddressing:
        """オープンアドレス法によるハッシュ表"""

        def __init__(self):
            """コンストラクタ"""
            self.size = 0  # キーと値のペアの数
            self.capacity = 4  # ハッシュ表の容量
            self.load_thres = 2.0 / 3.0  # 表を拡張する負荷率のしきい値
            self.extend_ratio = 2  # 容量の拡張倍率
            self.buckets: list[Pair | None] = [None] * self.capacity  # バケットの配列
            self.TOMBSTONE = Pair(-1, "-1")  # 削除済みマーカー

        def hash_func(self, key: int) -> int:
            """ハッシュ関数"""
            return key % self.capacity

        def load_factor(self) -> float:
            """負荷率"""
            return self.size / self.capacity

        def find_bucket(self, key: int) -> int:
            """key に対応するバケットのインデックスを探す"""
            index = self.hash_func(key)
            first_tombstone = -1
            for _ in range(self.capacity):
                bucket = self.buckets[index]
                if bucket is None:
                    break
                # 最初に見つかった削除済みマーカーの位置を記録する
                if bucket is self.TOMBSTONE:
                    if first_tombstone == -1:
                        first_tombstone = index
                # key が見つかったら、そのバケットのインデックスを返す
                elif bucket.key == key:
                    # それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = bucket
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # 移動先のバケットのインデックスを返す
                    return index  # バケットのインデックスを返す
                # 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % self.capacity
            # key がなければ挿入位置のインデックスを返す
            return index if first_tombstone == -1 else first_tombstone

        def get(self, key: int) -> str:
            """検索"""
            # key に対応するバケットのインデックスを探す
            index = self.find_bucket(key)
            # ペアが見つかったら対応する val を返す
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                return self.buckets[index].val
            # ペアがなければ None を返す
            return None

        def put(self, key: int, val: str):
            """追加"""
            # 負荷率がしきい値を超えたら表を拡張する
            if self.load_factor() > self.load_thres:
                self.extend()
            # key に対応するバケットのインデックスを探す
            index = self.find_bucket(key)
            # ペアが見つかったら val を上書きして処理を終える
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index].val = val
                return
            # ペアがなければ新しく追加する
            self.buckets[index] = Pair(key, val)
            self.size += 1

        def remove(self, key: int):
            """削除"""
            # key に対応するバケットのインデックスを探す
            index = self.find_bucket(key)
            # ペアが見つかったら削除済みマーカーで置き換える
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index] = self.TOMBSTONE
                self.size -= 1

        def extend(self):
            """ハッシュ表を拡張する"""
            # 元のハッシュ表を一時保存する
            buckets_tmp = self.buckets
            # 拡張後の新しいハッシュ表を初期化する
            self.capacity *= self.extend_ratio
            self.buckets = [None] * self.capacity
            self.size = 0
            # 元のハッシュ表から新しい表にペアを移す
            for pair in buckets_tmp:
                if pair not in [None, self.TOMBSTONE]:
                    self.put(pair.key, pair.val)

        def print(self):
            """ハッシュ表を表示する"""
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
      private:
        int size;                             // キーと値のペアの数
        int capacity = 4;                     // ハッシュ表の容量
        const double loadThres = 2.0 / 3.0;     // 表を拡張する負荷率のしきい値
        const int extendRatio = 2;            // 容量の拡張倍率
        vector<Pair *> buckets;               // バケットの配列
        Pair *TOMBSTONE = new Pair(-1, "-1"); // 削除済みマーカー

      public:
        /* コンストラクタ */
        HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
        }

        /* デストラクタ */
        ~HashMapOpenAddressing() {
            for (Pair *pair : buckets) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    delete pair;
                }
            }
            delete TOMBSTONE;
        }

        /* ハッシュ関数 */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* 負荷率 */
        double loadFactor() {
            return (double)size / capacity;
        }

        /* key に対応するバケットのインデックスを探す */
        int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while (buckets[index] != nullptr) {
                // key が見つかったら、そのバケットのインデックスを返す
                if (buckets[index]->key == key) {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 移動先のバケットのインデックスを返す
                    }
                    return index; // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % capacity;
            }
            // key がなければ挿入位置のインデックスを返す
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 検索 */
        string get(int key) {
            // key に対応するバケットのインデックスを探す
            int index = findBucket(key);
            // ペアが見つかったら対応する val を返す
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                return buckets[index]->val;
            }
            // ペアがなければ空文字列を返す
            return "";
        }

        /* 追加 */
        void put(int key, string val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (loadFactor() > loadThres) {
                extend();
            }
            // key に対応するバケットのインデックスを探す
            int index = findBucket(key);
            // ペアが見つかったら val を上書きして処理を終える
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                buckets[index]->val = val;
                return;
            }
            // ペアがなければ新しく追加する
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 削除 */
        void remove(int key) {
            // key に対応するバケットのインデックスを探す
            int index = findBucket(key);
            // ペアが見つかったら削除済みマーカーで置き換える
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                delete buckets[index];
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* ハッシュ表を拡張する */
        void extend() {
            // 元のハッシュ表を一時保存する
            vector<Pair *> bucketsTmp = buckets;
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio;
            buckets = vector<Pair *>(capacity, nullptr);
            size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (Pair *pair : bucketsTmp) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    put(pair->key, pair->val);
                    delete pair;
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
        private int size; // キーと値のペアの数
        private int capacity = 4; // ハッシュ表の容量
        private final double loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
        private final int extendRatio = 2; // 容量の拡張倍率
        private Pair[] buckets; // バケットの配列
        private final Pair TOMBSTONE = new Pair(-1, "-1"); // 削除済みマーカー

        /* コンストラクタ */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* ハッシュ関数 */
        private int hashFunc(int key) {
            return key % capacity;
        }

        /* 負荷率 */
        private double loadFactor() {
            return (double) size / capacity;
        }

        /* key に対応するバケットのインデックスを探す */
        private int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while (buckets[index] != null) {
                // key が見つかったら、そのバケットのインデックスを返す
                if (buckets[index].key == key) {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 移動先のバケットのインデックスを返す
                    }
                    return index; // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % capacity;
            }
            // key がなければ挿入位置のインデックスを返す
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 検索 */
        public String get(int key) {
            // key に対応するバケットのインデックスを探す
            int index = findBucket(key);
            // ペアが見つかったら対応する val を返す
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // ペアがなければ null を返す
            return null;
        }

        /* 追加 */
        public void put(int key, String val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (loadFactor() > loadThres) {
                extend();
            }
            // key に対応するバケットのインデックスを探す
            int index = findBucket(key);
            // ペアが見つかったら val を上書きして処理を終える
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // ペアがなければ新しく追加する
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 削除 */
        public void remove(int key) {
            // key に対応するバケットのインデックスを探す
            int index = findBucket(key);
            // ペアが見つかったら削除済みマーカーで置き換える
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* ハッシュ表を拡張する */
        private void extend() {
            // 元のハッシュ表を一時保存する
            Pair[] bucketsTmp = buckets;
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (Pair pair : bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
        int size; // キーと値のペアの数
        int capacity = 4; // ハッシュ表の容量
        double loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
        int extendRatio = 2; // 容量の拡張倍率
        Pair[] buckets; // バケットの配列
        Pair TOMBSTONE = new(-1, "-1"); // 削除済みマーカー

        /* コンストラクタ */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* ハッシュ関数 */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* 負荷率 */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* key に対応するバケットのインデックスを探す */
        int FindBucket(int key) {
            int index = HashFunc(key);
            int firstTombstone = -1;
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while (buckets[index] != null) {
                // key が見つかったら、そのバケットのインデックスを返す
                if (buckets[index].key == key) {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // 移動先のバケットのインデックスを返す
                    }
                    return index; // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % capacity;
            }
            // key がなければ挿入位置のインデックスを返す
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* 検索 */
        public string? Get(int key) {
            // key に対応するバケットのインデックスを探す
            int index = FindBucket(key);
            // ペアが見つかったら対応する val を返す
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // ペアがなければ null を返す
            return null;
        }

        /* 追加 */
        public void Put(int key, string val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (LoadFactor() > loadThres) {
                Extend();
            }
            // key に対応するバケットのインデックスを探す
            int index = FindBucket(key);
            // ペアが見つかったら val を上書きして処理を終える
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // ペアがなければ新しく追加する
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* 削除 */
        public void Remove(int key) {
            // key に対応するバケットのインデックスを探す
            int index = FindBucket(key);
            // ペアが見つかったら削除済みマーカーで置き換える
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* ハッシュ表を拡張する */
        void Extend() {
            // 元のハッシュ表を一時保存する
            Pair[] bucketsTmp = buckets;
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            foreach (Pair pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    type hashMapOpenAddressing struct {
        size        int     // キーと値のペアの数
        capacity    int     // ハッシュ表の容量
        loadThres   float64 // 表を拡張する負荷率のしきい値
        extendRatio int     // 容量の拡張倍率
        buckets     []*pair // バケットの配列
        TOMBSTONE   *pair   // 削除済みマーカー
    }

    /* コンストラクタ */
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

    /* ハッシュ関数 */
    func (h *hashMapOpenAddressing) hashFunc(key int) int {
        return key % h.capacity // キーからハッシュ値を計算する
    }

    /* 負荷率 */
    func (h *hashMapOpenAddressing) loadFactor() float64 {
        return float64(h.size) / float64(h.capacity) // 現在の負荷率を計算する
    }

    /* key に対応するバケットのインデックスを探す */
    func (h *hashMapOpenAddressing) findBucket(key int) int {
        index := h.hashFunc(key) // 最初のインデックスを取得する
        firstTombstone := -1     // 最初に見つかった TOMBSTONE の位置を記録する
        for h.buckets[index] != nil {
            if h.buckets[index].key == key {
                if firstTombstone != -1 {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    h.buckets[firstTombstone] = h.buckets[index]
                    h.buckets[index] = h.TOMBSTONE
                    return firstTombstone // 移動先のバケットのインデックスを返す
                }
                return index // 見つかったインデックスを返す
            }
            if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
                firstTombstone = index // 最初に見つかった削除済みマーカーの位置を記録する
            }
            index = (index + 1) % h.capacity // 線形探索を行い、末尾を越えたら先頭に戻る
        }
        // key がなければ挿入位置のインデックスを返す
        if firstTombstone != -1 {
            return firstTombstone
        }
        return index
    }

    /* 検索 */
    func (h *hashMapOpenAddressing) get(key int) string {
        index := h.findBucket(key) // key に対応するバケットのインデックスを探す
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            return h.buckets[index].val // ペアが見つかったら対応する val を返す
        }
        return "" // ペアがなければ "" を返す
    }

    /* 追加 */
    func (h *hashMapOpenAddressing) put(key int, val string) {
        if h.loadFactor() > h.loadThres {
            h.extend() // 負荷率がしきい値を超えたら表を拡張する
        }
        index := h.findBucket(key) // key に対応するバケットのインデックスを探す
        if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
            h.buckets[index] = &pair{key, val} // ペアがなければ新しく追加する
            h.size++
        } else {
            h.buckets[index].val = val // ペアが見つかったら val を上書きする
        }
    }

    /* 削除 */
    func (h *hashMapOpenAddressing) remove(key int) {
        index := h.findBucket(key) // key に対応するバケットのインデックスを探す
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            h.buckets[index] = h.TOMBSTONE // ペアが見つかったら削除済みマーカーで置き換える
            h.size--
        }
    }

    /* ハッシュ表を拡張する */
    func (h *hashMapOpenAddressing) extend() {
        oldBuckets := h.buckets               // 元のハッシュ表を一時保存する
        h.capacity *= h.extendRatio           // 容量を更新する
        h.buckets = make([]*pair, h.capacity) // 拡張後の新しいハッシュ表を初期化する
        h.size = 0                            // 要素数をリセットする
        // 元のハッシュ表から新しい表にペアを移す
        for _, pair := range oldBuckets {
            if pair != nil && pair != h.TOMBSTONE {
                h.put(pair.key, pair.val)
            }
        }
    }

    /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
        var size: Int // キーと値のペアの数
        var capacity: Int // ハッシュ表の容量
        var loadThres: Double // 表を拡張する負荷率のしきい値
        var extendRatio: Int // 容量の拡張倍率
        var buckets: [Pair?] // バケットの配列
        var TOMBSTONE: Pair // 削除済みマーカー

        /* コンストラクタ */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: nil, count: capacity)
            TOMBSTONE = Pair(key: -1, val: "-1")
        }

        /* ハッシュ関数 */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* 負荷率 */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* key に対応するバケットのインデックスを探す */
        func findBucket(key: Int) -> Int {
            var index = hashFunc(key: key)
            var firstTombstone = -1
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while buckets[index] != nil {
                // key が見つかったら、そのバケットのインデックスを返す
                if buckets[index]!.key == key {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if firstTombstone != -1 {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // 移動先のバケットのインデックスを返す
                    }
                    return index // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                    firstTombstone = index
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % capacity
            }
            // key がなければ挿入位置のインデックスを返す
            return firstTombstone == -1 ? index : firstTombstone
        }

        /* 検索 */
        func get(key: Int) -> String? {
            // key に対応するバケットのインデックスを探す
            let index = findBucket(key: key)
            // ペアが見つかったら対応する val を返す
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                return buckets[index]!.val
            }
            // ペアがなければ null を返す
            return nil
        }

        /* 追加 */
        func put(key: Int, val: String) {
            // 負荷率がしきい値を超えたら表を拡張する
            if loadFactor() > loadThres {
                extend()
            }
            // key に対応するバケットのインデックスを探す
            let index = findBucket(key: key)
            // ペアが見つかったら val を上書きして処理を終える
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index]!.val = val
                return
            }
            // ペアがなければ新しく追加する
            buckets[index] = Pair(key: key, val: val)
            size += 1
        }

        /* 削除 */
        func remove(key: Int) {
            // key に対応するバケットのインデックスを探す
            let index = findBucket(key: key)
            // ペアが見つかったら削除済みマーカーで置き換える
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index] = TOMBSTONE
                size -= 1
            }
        }

        /* ハッシュ表を拡張する */
        func extend() {
            // 元のハッシュ表を一時保存する
            let bucketsTmp = buckets
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio
            buckets = Array(repeating: nil, count: capacity)
            size = 0
            // 元のハッシュ表から新しい表にペアを移す
            for pair in bucketsTmp {
                if let pair, pair != TOMBSTONE {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
        #size; // キーと値のペアの数
        #capacity; // ハッシュ表の容量
        #loadThres; // 表を拡張する負荷率のしきい値
        #extendRatio; // 容量の拡張倍率
        #buckets; // バケットの配列
        #TOMBSTONE; // 削除済みマーカー

        /* コンストラクタ */
        constructor() {
            this.#size = 0; // キーと値のペアの数
            this.#capacity = 4; // ハッシュ表の容量
            this.#loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
            this.#extendRatio = 2; // 容量の拡張倍率
            this.#buckets = Array(this.#capacity).fill(null); // バケットの配列
            this.#TOMBSTONE = new Pair(-1, '-1'); // 削除済みマーカー
        }

        /* ハッシュ関数 */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* 負荷率 */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* key に対応するバケットのインデックスを探す */
        #findBucket(key) {
            let index = this.#hashFunc(key);
            let firstTombstone = -1;
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while (this.#buckets[index] !== null) {
                // key が見つかったら、そのバケットのインデックスを返す
                if (this.#buckets[index].key === key) {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if (firstTombstone !== -1) {
                        this.#buckets[firstTombstone] = this.#buckets[index];
                        this.#buckets[index] = this.#TOMBSTONE;
                        return firstTombstone; // 移動先のバケットのインデックスを返す
                    }
                    return index; // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if (
                    firstTombstone === -1 &&
                    this.#buckets[index] === this.#TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % this.#capacity;
            }
            // key がなければ挿入位置のインデックスを返す
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* 検索 */
        get(key) {
            // key に対応するバケットのインデックスを探す
            const index = this.#findBucket(key);
            // ペアが見つかったら対応する val を返す
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                return this.#buckets[index].val;
            }
            // ペアがなければ null を返す
            return null;
        }

        /* 追加 */
        put(key, val) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            // key に対応するバケットのインデックスを探す
            const index = this.#findBucket(key);
            // ペアが見つかったら val を上書きして処理を終える
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index].val = val;
                return;
            }
            // ペアがなければ新しく追加する
            this.#buckets[index] = new Pair(key, val);
            this.#size++;
        }

        /* 削除 */
        remove(key) {
            // key に対応するバケットのインデックスを探す
            const index = this.#findBucket(key);
            // ペアが見つかったら削除済みマーカーで置き換える
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index] = this.#TOMBSTONE;
                this.#size--;
            }
        }

        /* ハッシュ表を拡張する */
        #extend() {
            // 元のハッシュ表を一時保存する
            const bucketsTmp = this.#buckets;
            // 拡張後の新しいハッシュ表を初期化する
            this.#capacity *= this.#extendRatio;
            this.#buckets = Array(this.#capacity).fill(null);
            this.#size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.#TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
        private size: number; // キーと値のペアの数
        private capacity: number; // ハッシュ表の容量
        private loadThres: number; // 表を拡張する負荷率のしきい値
        private extendRatio: number; // 容量の拡張倍率
        private buckets: Array<Pair | null>; // バケットの配列
        private TOMBSTONE: Pair; // 削除済みマーカー

        /* コンストラクタ */
        constructor() {
            this.size = 0; // キーと値のペアの数
            this.capacity = 4; // ハッシュ表の容量
            this.loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
            this.extendRatio = 2; // 容量の拡張倍率
            this.buckets = Array(this.capacity).fill(null); // バケットの配列
            this.TOMBSTONE = new Pair(-1, '-1'); // 削除済みマーカー
        }

        /* ハッシュ関数 */
        private hashFunc(key: number): number {
            return key % this.capacity;
        }

        /* 負荷率 */
        private loadFactor(): number {
            return this.size / this.capacity;
        }

        /* key に対応するバケットのインデックスを探す */
        private findBucket(key: number): number {
            let index = this.hashFunc(key);
            let firstTombstone = -1;
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while (this.buckets[index] !== null) {
                // key が見つかったら、そのバケットのインデックスを返す
                if (this.buckets[index]!.key === key) {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if (firstTombstone !== -1) {
                        this.buckets[firstTombstone] = this.buckets[index];
                        this.buckets[index] = this.TOMBSTONE;
                        return firstTombstone; // 移動先のバケットのインデックスを返す
                    }
                    return index; // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if (
                    firstTombstone === -1 &&
                    this.buckets[index] === this.TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % this.capacity;
            }
            // key がなければ挿入位置のインデックスを返す
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* 検索 */
        get(key: number): string | null {
            // key に対応するバケットのインデックスを探す
            const index = this.findBucket(key);
            // ペアが見つかったら対応する val を返す
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                return this.buckets[index]!.val;
            }
            // ペアがなければ null を返す
            return null;
        }

        /* 追加 */
        put(key: number, val: string): void {
            // 負荷率がしきい値を超えたら表を拡張する
            if (this.loadFactor() > this.loadThres) {
                this.extend();
            }
            // key に対応するバケットのインデックスを探す
            const index = this.findBucket(key);
            // ペアが見つかったら val を上書きして処理を終える
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index]!.val = val;
                return;
            }
            // ペアがなければ新しく追加する
            this.buckets[index] = new Pair(key, val);
            this.size++;
        }

        /* 削除 */
        remove(key: number): void {
            // key に対応するバケットのインデックスを探す
            const index = this.findBucket(key);
            // ペアが見つかったら削除済みマーカーで置き換える
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index] = this.TOMBSTONE;
                this.size--;
            }
        }

        /* ハッシュ表を拡張する */
        private extend(): void {
            // 元のハッシュ表を一時保存する
            const bucketsTmp = this.buckets;
            // 拡張後の新しいハッシュ表を初期化する
            this.capacity *= this.extendRatio;
            this.buckets = Array(this.capacity).fill(null);
            this.size = 0;
            // 元のハッシュ表から新しい表にペアを移す
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
      late int _size; // キーと値のペアの数
      int _capacity = 4; // ハッシュ表の容量
      double _loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
      int _extendRatio = 2; // 容量の拡張倍率
      late List<Pair?> _buckets; // バケットの配列
      Pair _TOMBSTONE = Pair(-1, "-1"); // 削除済みマーカー

      /* コンストラクタ */
      HashMapOpenAddressing() {
        _size = 0;
        _buckets = List.generate(_capacity, (index) => null);
      }

      /* ハッシュ関数 */
      int hashFunc(int key) {
        return key % _capacity;
      }

      /* 負荷率 */
      double loadFactor() {
        return _size / _capacity;
      }

      /* key に対応するバケットのインデックスを探す */
      int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        for (int i = 0; i < _capacity; i++) {
          final bucket = _buckets[index];
          if (bucket == null) break;
          // 最初に見つかった削除済みマーカーの位置を記録する
          if (identical(bucket, _TOMBSTONE)) {
            if (firstTombstone == -1) firstTombstone = index;
          } else if (bucket.key == key) {
            // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
            if (firstTombstone != -1) {
              _buckets[firstTombstone] = bucket;
              _buckets[index] = _TOMBSTONE;
              return firstTombstone; // 移動先のバケットのインデックスを返す
            }
            return index; // バケットのインデックスを返す
          }
          // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
          index = (index + 1) % _capacity;
        }
        // key がなければ挿入位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
      }

      /* 検索 */
      String? get(int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら対応する val を返す
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          return _buckets[index]!.val;
        }
        // ペアがなければ null を返す
        return null;
      }

      /* 追加 */
      void put(int key, String val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > _loadThres) {
          extend();
        }
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら val を上書きして処理を終える
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index]!.val = val;
          return;
        }
        // ペアがなければ新しく追加する
        _buckets[index] = new Pair(key, val);
        _size++;
      }

      /* 削除 */
      void remove(int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index] = _TOMBSTONE;
          _size--;
        }
      }

      /* ハッシュ表を拡張する */
      void extend() {
        // 元のハッシュ表を一時保存する
        List<Pair?> bucketsTmp = _buckets;
        // 拡張後の新しいハッシュ表を初期化する
        _capacity *= _extendRatio;
        _buckets = List.generate(_capacity, (index) => null);
        _size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (Pair? pair in bucketsTmp) {
          if (pair != null && pair != _TOMBSTONE) {
            put(pair.key, pair.val);
          }
        }
      }

      /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    struct HashMapOpenAddressing {
        size: usize,                // キーと値のペアの数
        capacity: usize,            // ハッシュ表の容量
        load_thres: f64,            // 表を拡張する負荷率のしきい値
        extend_ratio: usize,        // 容量の拡張倍率
        buckets: Vec<Option<Pair>>, // バケットの配列
        TOMBSTONE: Option<Pair>,    // 削除済みマーカー
    }

    impl HashMapOpenAddressing {
        /* コンストラクタ */
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

        /* ハッシュ関数 */
        fn hash_func(&self, key: i32) -> usize {
            (key % self.capacity as i32) as usize
        }

        /* 負荷率 */
        fn load_factor(&self) -> f64 {
            self.size as f64 / self.capacity as f64
        }

        /* key に対応するバケットのインデックスを探す */
        fn find_bucket(&mut self, key: i32) -> usize {
            let mut index = self.hash_func(key);
            let mut first_tombstone = -1;
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while self.buckets[index].is_some() {
                // key が見つかったら、そのバケットのインデックスを返す
                if self.buckets[index].as_ref().unwrap().key == key {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if first_tombstone != -1 {
                        self.buckets[first_tombstone as usize] = self.buckets[index].take();
                        self.buckets[index] = self.TOMBSTONE.clone();
                        return first_tombstone as usize; // 移動先のバケットのインデックスを返す
                    }
                    return index; // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                    first_tombstone = index as i32;
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % self.capacity;
            }
            // key がなければ挿入位置のインデックスを返す
            if first_tombstone == -1 {
                index
            } else {
                first_tombstone as usize
            }
        }

        /* 検索 */
        fn get(&mut self, key: i32) -> Option<&str> {
            // key に対応するバケットのインデックスを探す
            let index = self.find_bucket(key);
            // ペアが見つかったら対応する val を返す
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
            }
            // ペアがなければ null を返す
            None
        }

        /* 追加 */
        fn put(&mut self, key: i32, val: String) {
            // 負荷率がしきい値を超えたら表を拡張する
            if self.load_factor() > self.load_thres {
                self.extend();
            }
            // key に対応するバケットのインデックスを探す
            let index = self.find_bucket(key);
            // ペアが見つかったら val を上書きして処理を終える
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index].as_mut().unwrap().val = val;
                return;
            }
            // ペアがなければ新しく追加する
            self.buckets[index] = Some(Pair { key, val });
            self.size += 1;
        }

        /* 削除 */
        fn remove(&mut self, key: i32) {
            // key に対応するバケットのインデックスを探す
            let index = self.find_bucket(key);
            // ペアが見つかったら削除済みマーカーで置き換える
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index] = self.TOMBSTONE.clone();
                self.size -= 1;
            }
        }

        /* ハッシュ表を拡張する */
        fn extend(&mut self) {
            // 元のハッシュ表を一時保存する
            let buckets_tmp = self.buckets.clone();
            // 拡張後の新しいハッシュ表を初期化する
            self.capacity *= self.extend_ratio;
            self.buckets = vec![None; self.capacity];
            self.size = 0;

            // 元のハッシュ表から新しい表にペアを移す
            for pair in buckets_tmp {
                if pair.is_none() || pair == self.TOMBSTONE {
                    continue;
                }
                let pair = pair.unwrap();

                self.put(pair.key, pair.val);
            }
        }
        /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    typedef struct {
        int size;         // キーと値のペアの数
        int capacity;     // ハッシュ表の容量
        double loadThres; // 表を拡張する負荷率のしきい値
        int extendRatio;  // 容量の拡張倍率
        Pair **buckets;   // バケットの配列
        Pair *TOMBSTONE;  // 削除済みマーカー
    } HashMapOpenAddressing;

    /* コンストラクタ */
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

    /* デストラクタ */
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

    /* ハッシュ関数 */
    int hashFunc(HashMapOpenAddressing *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* 負荷率 */
    double loadFactor(HashMapOpenAddressing *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* key に対応するバケットのインデックスを探す */
    int findBucket(HashMapOpenAddressing *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        int firstTombstone = -1;
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while (hashMap->buckets[index] != NULL) {
            // key が見つかったら、そのバケットのインデックスを返す
            if (hashMap->buckets[index]->key == key) {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if (firstTombstone != -1) {
                    hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                    hashMap->buckets[index] = hashMap->TOMBSTONE;
                    return firstTombstone; // 移動先のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
                firstTombstone = index;
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % hashMap->capacity;
        }
        // key がなければ挿入位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 検索 */
    char *get(HashMapOpenAddressing *hashMap, int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(hashMap, key);
        // ペアが見つかったら対応する val を返す
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            return hashMap->buckets[index]->val;
        }
        // ペアがなければ空文字列を返す
        return "";
    }

    /* 追加 */
    void put(HashMapOpenAddressing *hashMap, int key, char *val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        // key に対応するバケットのインデックスを探す
        int index = findBucket(hashMap, key);
        // ペアが見つかったら val を上書きして処理を終える
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            free(hashMap->buckets[index]->val);
            hashMap->buckets[index]->val = (char *)malloc(strlen(val) + 1);
            strcpy(hashMap->buckets[index]->val, val);
            hashMap->buckets[index]->val[strlen(val)] = '\0';
            return;
        }
        // ペアがなければ新しく追加する
        Pair *pair = (Pair *)malloc(sizeof(Pair));
        pair->key = key;
        pair->val = (char *)malloc(strlen(val) + 1);
        strcpy(pair->val, val);
        pair->val[strlen(val)] = '\0';

        hashMap->buckets[index] = pair;
        hashMap->size++;
    }

    /* 削除 */
    void removeItem(HashMapOpenAddressing *hashMap, int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(hashMap, key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            Pair *pair = hashMap->buckets[index];
            free(pair->val);
            free(pair);
            hashMap->buckets[index] = hashMap->TOMBSTONE;
            hashMap->size--;
        }
    }

    /* ハッシュ表を拡張する */
    void extend(HashMapOpenAddressing *hashMap) {
        // 元のハッシュ表を一時保存する
        Pair **bucketsTmp = hashMap->buckets;
        int oldCapacity = hashMap->capacity;
        // 拡張後の新しいハッシュ表を初期化する
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
        hashMap->size = 0;
        // 元のハッシュ表から新しい表にペアを移す
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

    /* ハッシュ表を表示する */
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
    /* オープンアドレス法によるハッシュ表 */
    class HashMapOpenAddressing {
        private var size: Int               // キーと値のペアの数
        private var capacity: Int           // ハッシュ表の容量
        private val loadThres: Double       // 表を拡張する負荷率のしきい値
        private val extendRatio: Int        // 容量の拡張倍率
        private var buckets: Array<Pair?>   // バケットの配列
        private val TOMBSTONE: Pair         // 削除済みマーカー

        /* コンストラクタ */
        init {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = arrayOfNulls(capacity)
            TOMBSTONE = Pair(-1, "-1")
        }

        /* ハッシュ関数 */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* 負荷率 */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* key に対応するバケットのインデックスを探す */
        fun findBucket(key: Int): Int {
            var index = hashFunc(key)
            var firstTombstone = -1
            // 線形探索を行い、空のバケットに出会ったらループを抜ける
            while (buckets[index] != null) {
                // key が見つかったら、そのバケットのインデックスを返す
                if (buckets[index]?.key == key) {
                    // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // 移動先のバケットのインデックスを返す
                    }
                    return index // バケットのインデックスを返す
                }
                // 最初に見つかった削除済みマーカーの位置を記録する
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index
                }
                // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
                index = (index + 1) % capacity
            }
            // key がなければ挿入位置のインデックスを返す
            return if (firstTombstone == -1) index else firstTombstone
        }

        /* 検索 */
        fun get(key: Int): String? {
            // key に対応するバケットのインデックスを探す
            val index = findBucket(key)
            // ペアが見つかったら対応する val を返す
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index]?._val
            }
            // ペアがなければ null を返す
            return null
        }

        /* 追加 */
        fun put(key: Int, _val: String) {
            // 負荷率がしきい値を超えたら表を拡張する
            if (loadFactor() > loadThres) {
                extend()
            }
            // key に対応するバケットのインデックスを探す
            val index = findBucket(key)
            // ペアが見つかったら val を上書きして処理を終える
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index]!!._val = _val
                return
            }
            // ペアがなければ新しく追加する
            buckets[index] = Pair(key, _val)
            size++
        }

        /* 削除 */
        fun remove(key: Int) {
            // key に対応するバケットのインデックスを探す
            val index = findBucket(key)
            // ペアが見つかったら削除済みマーカーで置き換える
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE
                size--
            }
        }

        /* ハッシュ表を拡張する */
        fun extend() {
            // 元のハッシュ表を一時保存する
            val bucketsTmp = buckets
            // 拡張後の新しいハッシュ表を初期化する
            capacity *= extendRatio
            buckets = arrayOfNulls(capacity)
            size = 0
            // 元のハッシュ表から新しい表にペアを移す
            for (pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* ハッシュ表を表示する */
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
    ### オープンアドレス法によるハッシュ表 ###
    class HashMapOpenAddressing
      TOMBSTONE = Pair.new(-1, '-1') # 削除済みマーカー

      ### コンストラクタ ###
      def initialize
        @size = 0 # キーと値のペアの数
        @capacity = 4 # ハッシュ表の容量
        @load_thres = 2.0 / 3.0 # 表を拡張する負荷率のしきい値
        @extend_ratio = 2 # 容量の拡張倍率
        @buckets = Array.new(@capacity) # バケットの配列
      end

      ### ハッシュ関数 ###
      def hash_func(key)
        key % @capacity
      end

      ### 負荷率 ###
      def load_factor
        @size / @capacity.to_f
      end

      ### key に対応するバケットのインデックスを探す ###
      def find_bucket(key)
        index = hash_func(key)
        first_tombstone = -1
        # 線形探索を行い、空のバケットに出会ったらループを抜ける
        while !@buckets[index].nil?
          # key が見つかったら、そのバケットのインデックスを返す
          if @buckets[index].key == key
            # それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
            if first_tombstone != -1
              @buckets[first_tombstone] = @buckets[index]
              @buckets[index] = TOMBSTONE
              return first_tombstone # 移動先のバケットのインデックスを返す
            end
            return index # バケットのインデックスを返す
          end
          # 最初に見つかった削除済みマーカーの位置を記録する
          first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
          # 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
          index = (index + 1) % @capacity
        end
        # key がなければ挿入位置のインデックスを返す
        first_tombstone == -1 ? index : first_tombstone
      end

      ### 検索 ###
      def get(key)
        # key に対応するバケットのインデックスを探す
        index = find_bucket(key)
        # ペアが見つかったら対応する val を返す
        return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
        # ペアがなければ nil を返す
        nil
      end

      ### 追加 ###
      def put(key, val)
        # 負荷率がしきい値を超えたら表を拡張する
        extend if load_factor > @load_thres
        # key に対応するバケットのインデックスを探す
        index = find_bucket(key)
        # ペアが見つかったら val を上書きして処理を終える
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index].val = val
          return
        end
        # ペアがなければ新しく追加する
        @buckets[index] = Pair.new(key, val)
        @size += 1
      end

      ### 削除 ###
      def remove(key)
        # key に対応するバケットのインデックスを探す
        index = find_bucket(key)
        # ペアが見つかったら削除済みマーカーで置き換える
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index] = TOMBSTONE
          @size -= 1
        end
      end

      ### ハッシュ表を拡張する ###
      def extend
        # 元のハッシュ表を一時保存する
        buckets_tmp = @buckets
        # 拡張後の新しいハッシュ表を初期化する
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity)
        @size = 0
        # 元のハッシュ表から新しい表にペアを移す
        for pair in buckets_tmp
          put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
        end
      end

      ### ハッシュ表を表示する ###
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

### 2. &nbsp; 二次探索法

二次探索法も、線形探索法と同じく代表的なオープンアドレス法です。衝突したときは、一定の幅で進む代わりに、探索回数の 2 乗、つまり $1, 4, 9, \dots$ マス分ずらした位置を調べます。

二次探索法の主な利点は次のとおりです。

- 探索回数の 2 乗だけ位置をずらすことで、線形探索法で起きるクラスタリングを和らげます。
- より遠くの空き位置も探すため、データが均等に分布しやすくなります。

ただし、二次探索法にも弱点があります。

- 特定の位置がほかよりも埋まりやすく、クラスタリングが依然として起こります。
- 探索位置のずれが 2 乗で増えるため、表のすべての位置を調べられるとは限りません。空のバケットがあっても、そこに到達できない場合があります。

### 3. &nbsp; 複数のハッシュ関数による探索

この方法は名前のとおり、複数のハッシュ関数 $f_1(x)$、$f_2(x)$、$f_3(x)$、$\dots$ を使って格納先を探します。

- **要素の挿入**：ハッシュ関数 $f_1(x)$ で衝突したら $f_2(x)$ を試します。同様に次の関数を順に試し、空き位置を見つけたら要素を挿入します。
- **要素の検索**：挿入時と同じ順序でハッシュ関数を試し、目的の要素が見つかったら返します。空き位置に出会った場合や、すべての関数を試しても見つからなかった場合は、その要素は表にないので `None` を返します。

線形探索法に比べてクラスタリングが起きにくい一方、複数のハッシュ関数を使う分だけ計算量が増えます。

!!! tip "ヒント"

    オープンアドレス法では、線形探索法、二次探索法、複数のハッシュ関数による探索のいずれにも、要素をそのまま削除できないという共通の問題があります。

## 6.2.3 &nbsp; プログラミング言語ごとの実装

ハッシュ表の実装方法は言語によって異なります。いくつか例を見てみましょう。

- Python はオープンアドレス法を採用しています。辞書 `dict` は疑似乱数を使って探索します。
- Java はチェイン法を採用しています。JDK 1.8 以降の `HashMap` では、内部配列の長さが 64 以上で連結リストの長さが 8 に達すると、リストを赤黒木に変換して検索性能を高めます。
- Go 1.24 以降では、組み込みの `map` は既定で Swiss Table に基づくオープンアドレス法を使います。Go 1.23 以前ではチェイン法を使い、各バケットに最大 8 組のペアを格納し、収まりきらない場合はオーバーフローバケットをつなぎます。
