---
comments: true
---

# 6.2 &nbsp; Hash collisions

As discussed in the previous section, **a hash function's input space is usually much larger than its output space**, so collisions are theoretically unavoidable. For example, if the input space is all integers and the output space is limited to the array's capacity, multiple integers must map to the same bucket index.

Hash collisions can produce incorrect lookup results and make a hash table unusable. One solution is to expand the table whenever a collision occurs until the collision disappears. This simple, brute-force approach works, but is inefficient because expansion requires substantial data movement and hash computation. We can improve efficiency with the following strategies.

1. Improve the data structure **so that it works correctly even when collisions occur**.
2. Expand only when necessary, when collisions become sufficiently frequent.

The main structural approaches are “separate chaining” and “open addressing.”

## 6.2.1 &nbsp; Separate chaining

In the original hash table, each bucket holds only one key-value pair. <u>Separate chaining</u> replaces this single element with a linked list. Each pair becomes a node, and all colliding pairs are stored in the same list. An example is shown below.

![A hash table using separate chaining](hash_collision.assets/hash_table_chaining.png){ class="animation-figure" }

<p align="center"> Figure 6-5 &nbsp; A hash table using separate chaining </p>

The operations change as follows.

- **Lookup**: Hash the input `key` to obtain a bucket index, access the list's head, and traverse the list comparing keys to find the target pair.
- **Insertion**: Use the hash function to access the list's head, then add the node containing the key-value pair to the list.
- **Deletion**: Use the hash function to locate the list, traverse it to find the target node, and remove that node.

Separate chaining has the following limitations.

- **More space**: Linked lists store node pointers and consume more memory than arrays.
- **Slower lookup**: Finding an element requires a linear scan of the list.

The code below gives a simple implementation. Keep two points in mind.

- Lists, implemented as dynamic arrays, replace linked lists to simplify the code. The hash table is an array of buckets, each of which is a list.
- The implementation includes expansion: when the load factor exceeds $\frac{2}{3}$, the table's capacity is doubled to $2$ times its original size.

=== "Python"

    ```python title="hash_map_chaining.py"
    class HashMapChaining:
        """Hash table with separate chaining"""

        def __init__(self):
            """Constructor"""
            self.size = 0  # Number of key-value pairs
            self.capacity = 4  # Hash table capacity
            self.load_thres = 2.0 / 3.0  # Load factor threshold that triggers capacity growth
            self.extend_ratio = 2  # Capacity growth factor
            self.buckets = [[] for _ in range(self.capacity)]  # Bucket array

        def hash_func(self, key: int) -> int:
            """Hash function"""
            return key % self.capacity

        def load_factor(self) -> float:
            """Load factor"""
            return self.size / self.capacity

        def get(self, key: int) -> str | None:
            """Lookup operation"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Traverse the bucket; if key is found, return its corresponding val
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # Return None if key is not found
            return None

        def put(self, key: int, val: str):
            """Insert operation"""
            # Grow the capacity when the load factor exceeds the threshold
            if self.load_factor() > self.load_thres:
                self.extend()
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Traverse the bucket; if the specified key is found, update its val and return
            for pair in bucket:
                if pair.key == key:
                    pair.val = val
                    return
            # If key is absent, append the key-value pair at the end
            pair = Pair(key, val)
            bucket.append(pair)
            self.size += 1

        def remove(self, key: int):
            """Remove operation"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Traverse the bucket and remove the key-value pair
            for pair in bucket:
                if pair.key == key:
                    bucket.remove(pair)
                    self.size -= 1
                    break

        def extend(self):
            """Grow the hash table capacity"""
            # Keep a reference to the original hash table
            buckets = self.buckets
            # Initialize a new hash table with the expanded capacity
            self.capacity *= self.extend_ratio
            self.buckets = [[] for _ in range(self.capacity)]
            self.size = 0
            # Move the key-value pairs from the original hash table to the new one
            for bucket in buckets:
                for pair in bucket:
                    self.put(pair.key, pair.val)

        def print(self):
            """Print the hash table"""
            for bucket in self.buckets:
                res = []
                for pair in bucket:
                    res.append(str(pair.key) + " -> " + pair.val)
                print(res)
    ```

=== "C++"

    ```cpp title="hash_map_chaining.cpp"
    /* Hash table with separate chaining */
    class HashMapChaining {
      private:
        int size;                       // Number of key-value pairs
        int capacity;                   // Hash table capacity
        double loadThres;               // Load factor threshold that triggers capacity growth
        int extendRatio;                // Capacity growth factor
        vector<vector<Pair *>> buckets; // Bucket array

      public:
        /* Constructor */
        HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
            buckets.resize(capacity);
        }

        /* Destructor */
        ~HashMapChaining() {
            for (auto &bucket : buckets) {
                for (Pair *pair : bucket) {
                    // Free memory
                    delete pair;
                }
            }
        }

        /* Hash function */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* Load factor */
        double loadFactor() {
            return (double)size / (double)capacity;
        }

        /* Lookup operation */
        string get(int key) {
            int index = hashFunc(key);
            // Traverse the bucket; if key is found, return its corresponding val
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    return pair->val;
                }
            }
            // Return an empty string if key is not found
            return "";
        }

        /* Insert operation */
        void put(int key, string val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            // Traverse the bucket; if the specified key is found, update its val and return
            for (Pair *pair : buckets[index]) {
                if (pair->key == key) {
                    pair->val = val;
                    return;
                }
            }
            // If key is absent, append the key-value pair at the end
            buckets[index].push_back(new Pair(key, val));
            size++;
        }

        /* Remove operation */
        void remove(int key) {
            int index = hashFunc(key);
            auto &bucket = buckets[index];
            // Traverse the bucket and remove the key-value pair
            for (int i = 0; i < bucket.size(); i++) {
                if (bucket[i]->key == key) {
                    Pair *tmp = bucket[i];
                    bucket.erase(bucket.begin() + i); // Remove the key-value pair from the list
                    delete tmp;                       // Free memory
                    size--;
                    return;
                }
            }
        }

        /* Grow the hash table capacity */
        void extend() {
            // Keep a copy of the original bucket array
            vector<vector<Pair *>> bucketsTmp = buckets;
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio;
            buckets.clear();
            buckets.resize(capacity);
            size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (auto &bucket : bucketsTmp) {
                for (Pair *pair : bucket) {
                    put(pair->key, pair->val);
                    // Free memory
                    delete pair;
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
        int size; // Number of key-value pairs
        int capacity; // Hash table capacity
        double loadThres; // Load factor threshold that triggers capacity growth
        int extendRatio; // Capacity growth factor
        List<List<Pair>> buckets; // Bucket array

        /* Constructor */
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

        /* Hash function */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* Load factor */
        double loadFactor() {
            return (double) size / capacity;
        }

        /* Lookup operation */
        String get(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Traverse the bucket; if key is found, return its corresponding val
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // Return null if key is not found
            return null;
        }

        /* Insert operation */
        void put(int key, String val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Traverse the bucket; if the specified key is found, update its val and return
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // If key is absent, append the key-value pair at the end
            Pair pair = new Pair(key, val);
            bucket.add(pair);
            size++;
        }

        /* Remove operation */
        void remove(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Traverse the bucket and remove the key-value pair
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    bucket.remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* Grow the hash table capacity */
        void extend() {
            // Keep a reference to the original hash table
            List<List<Pair>> bucketsTmp = buckets;
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
            size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (List<Pair> bucket : bucketsTmp) {
                for (Pair pair : bucket) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
        int size; // Number of key-value pairs
        int capacity; // Hash table capacity
        double loadThres; // Load factor threshold that triggers capacity growth
        int extendRatio; // Capacity growth factor
        List<List<Pair>> buckets; // Bucket array

        /* Constructor */
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

        /* Hash function */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* Load factor */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* Lookup operation */
        public string? Get(int key) {
            int index = HashFunc(key);
            // Traverse the bucket; if key is found, return its corresponding val
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // Return null if key is not found
            return null;
        }

        /* Insert operation */
        public void Put(int key, string val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (LoadFactor() > loadThres) {
                Extend();
            }
            int index = HashFunc(key);
            // Traverse the bucket; if the specified key is found, update its val and return
            foreach (Pair pair in buckets[index]) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // If key is absent, append the key-value pair at the end
            buckets[index].Add(new Pair(key, val));
            size++;
        }

        /* Remove operation */
        public void Remove(int key) {
            int index = HashFunc(key);
            // Traverse the bucket and remove the key-value pair
            foreach (Pair pair in buckets[index].ToList()) {
                if (pair.key == key) {
                    buckets[index].Remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* Grow the hash table capacity */
        void Extend() {
            // Keep a reference to the original hash table
            List<List<Pair>> bucketsTmp = buckets;
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio;
            buckets = new List<List<Pair>>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.Add([]);
            }
            size = 0;
            // Move the key-value pairs from the original hash table to the new one
            foreach (List<Pair> bucket in bucketsTmp) {
                foreach (Pair pair in bucket) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with separate chaining */
    type hashMapChaining struct {
        size        int      // Number of key-value pairs
        capacity    int      // Hash table capacity
        loadThres   float64  // Load factor threshold that triggers capacity growth
        extendRatio int      // Capacity growth factor
        buckets     [][]pair // Bucket array
    }

    /* Constructor */
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

    /* Hash function */
    func (m *hashMapChaining) hashFunc(key int) int {
        return key % m.capacity
    }

    /* Load factor */
    func (m *hashMapChaining) loadFactor() float64 {
        return float64(m.size) / float64(m.capacity)
    }

    /* Lookup operation */
    func (m *hashMapChaining) get(key int) string {
        idx := m.hashFunc(key)
        bucket := m.buckets[idx]
        // Traverse the bucket; if key is found, return its corresponding val
        for _, p := range bucket {
            if p.key == key {
                return p.val
            }
        }
        // If key is not found, return an empty string
        return ""
    }

    /* Insert operation */
    func (m *hashMapChaining) put(key int, val string) {
        // Grow the capacity when the load factor exceeds the threshold
        if m.loadFactor() > m.loadThres {
            m.extend()
        }
        idx := m.hashFunc(key)
        // Traverse the bucket; if the specified key is found, update its val and return
        for i := range m.buckets[idx] {
            if m.buckets[idx][i].key == key {
                m.buckets[idx][i].val = val
                return
            }
        }
        // If key is absent, append the key-value pair at the end
        p := pair{
            key: key,
            val: val,
        }
        m.buckets[idx] = append(m.buckets[idx], p)
        m.size += 1
    }

    /* Remove operation */
    func (m *hashMapChaining) remove(key int) {
        idx := m.hashFunc(key)
        // Traverse the bucket and remove the key-value pair
        for i, p := range m.buckets[idx] {
            if p.key == key {
                // Remove the element from the slice
                m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
                m.size -= 1
                break
            }
        }
    }

    /* Grow the hash table capacity */
    func (m *hashMapChaining) extend() {
        // Save a copy of the original hash table
        tmpBuckets := make([][]pair, len(m.buckets))
        for i := 0; i < len(m.buckets); i++ {
            tmpBuckets[i] = make([]pair, len(m.buckets[i]))
            copy(tmpBuckets[i], m.buckets[i])
        }
        // Initialize a new hash table with the expanded capacity
        m.capacity *= m.extendRatio
        m.buckets = make([][]pair, m.capacity)
        for i := 0; i < m.capacity; i++ {
            m.buckets[i] = make([]pair, 0)
        }
        m.size = 0
        // Move the key-value pairs from the original hash table to the new one
        for _, bucket := range tmpBuckets {
            for _, p := range bucket {
                m.put(p.key, p.val)
            }
        }
    }

    /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
        var size: Int // Number of key-value pairs
        var capacity: Int // Hash table capacity
        var loadThres: Double // Load factor threshold that triggers capacity growth
        var extendRatio: Int // Capacity growth factor
        var buckets: [[Pair]] // Bucket array

        /* Constructor */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: [], count: capacity)
        }

        /* Hash function */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* Load factor */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* Lookup operation */
        func get(key: Int) -> String? {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // Traverse the bucket; if key is found, return its corresponding val
            for pair in bucket {
                if pair.key == key {
                    return pair.val
                }
            }
            // Return nil if key is not found
            return nil
        }

        /* Insert operation */
        func put(key: Int, val: String) {
            // Grow the capacity when the load factor exceeds the threshold
            if loadFactor() > loadThres {
                extend()
            }
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // Traverse the bucket; if the specified key is found, update its val and return
            for pair in bucket {
                if pair.key == key {
                    pair.val = val
                    return
                }
            }
            // If key is absent, append the key-value pair at the end
            let pair = Pair(key: key, val: val)
            buckets[index].append(pair)
            size += 1
        }

        /* Remove operation */
        func remove(key: Int) {
            let index = hashFunc(key: key)
            let bucket = buckets[index]
            // Traverse the bucket and remove the key-value pair
            for (pairIndex, pair) in bucket.enumerated() {
                if pair.key == key {
                    buckets[index].remove(at: pairIndex)
                    size -= 1
                    break
                }
            }
        }

        /* Grow the hash table capacity */
        func extend() {
            // Save the original bucket array
            let bucketsTmp = buckets
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio
            buckets = Array(repeating: [], count: capacity)
            size = 0
            // Move the key-value pairs from the original hash table to the new one
            for bucket in bucketsTmp {
                for pair in bucket {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
        #size; // Number of key-value pairs
        #capacity; // Hash table capacity
        #loadThres; // Load factor threshold that triggers capacity growth
        #extendRatio; // Capacity growth factor
        #buckets; // Bucket array

        /* Constructor */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* Hash function */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* Load factor */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* Lookup operation */
        get(key) {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Traverse the bucket; if key is found, return its corresponding val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // Return null if key was not found
            return null;
        }

        /* Insert operation */
        put(key, val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Traverse the bucket; if the specified key is found, update its val and return
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // If key is absent, append the key-value pair at the end
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* Remove operation */
        remove(key) {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // Traverse the bucket and remove the key-value pair
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* Grow the hash table capacity */
        #extend() {
            // Keep a reference to the original hash table
            const bucketsTmp = this.#buckets;
            // Initialize a new hash table with the expanded capacity
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
        #size: number; // Number of key-value pairs
        #capacity: number; // Hash table capacity
        #loadThres: number; // Load factor threshold that triggers capacity growth
        #extendRatio: number; // Capacity growth factor
        #buckets: Pair[][]; // Bucket array

        /* Constructor */
        constructor() {
            this.#size = 0;
            this.#capacity = 4;
            this.#loadThres = 2.0 / 3.0;
            this.#extendRatio = 2;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        }

        /* Hash function */
        #hashFunc(key: number): number {
            return key % this.#capacity;
        }

        /* Load factor */
        #loadFactor(): number {
            return this.#size / this.#capacity;
        }

        /* Lookup operation */
        get(key: number): string | null {
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Traverse the bucket; if key is found, return its corresponding val
            for (const pair of bucket) {
                if (pair.key === key) {
                    return pair.val;
                }
            }
            // Return null if key was not found
            return null;
        }

        /* Insert operation */
        put(key: number, val: string): void {
            // Grow the capacity when the load factor exceeds the threshold
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            const index = this.#hashFunc(key);
            const bucket = this.#buckets[index];
            // Traverse the bucket; if the specified key is found, update its val and return
            for (const pair of bucket) {
                if (pair.key === key) {
                    pair.val = val;
                    return;
                }
            }
            // If key is absent, append the key-value pair at the end
            const pair = new Pair(key, val);
            bucket.push(pair);
            this.#size++;
        }

        /* Remove operation */
        remove(key: number): void {
            const index = this.#hashFunc(key);
            let bucket = this.#buckets[index];
            // Traverse the bucket and remove the key-value pair
            for (let i = 0; i < bucket.length; i++) {
                if (bucket[i].key === key) {
                    bucket.splice(i, 1);
                    this.#size--;
                    break;
                }
            }
        }

        /* Grow the hash table capacity */
        #extend(): void {
            // Keep a reference to the original hash table
            const bucketsTmp = this.#buckets;
            // Initialize a new hash table with the expanded capacity
            this.#capacity *= this.#extendRatio;
            this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
            this.#size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (const bucket of bucketsTmp) {
                for (const pair of bucket) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
      late int size; // Number of key-value pairs
      late int capacity; // Hash table capacity
      late double loadThres; // Load factor threshold that triggers capacity growth
      late int extendRatio; // Capacity growth factor
      late List<List<Pair>> buckets; // Bucket array

      /* Constructor */
      HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = List.generate(capacity, (_) => []);
      }

      /* Hash function */
      int hashFunc(int key) {
        return key % capacity;
      }

      /* Load factor */
      double loadFactor() {
        return size / capacity;
      }

      /* Lookup operation */
      String? get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // Traverse the bucket; if key is found, return its corresponding val
        for (Pair pair in bucket) {
          if (pair.key == key) {
            return pair.val;
          }
        }
        // Return null if key was not found
        return null;
      }

      /* Insert operation */
      void put(int key, String val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
          extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // Traverse the bucket; if the specified key is found, update its val and return
        for (Pair pair in bucket) {
          if (pair.key == key) {
            pair.val = val;
            return;
          }
        }
        // If key is absent, append the key-value pair at the end
        Pair pair = Pair(key, val);
        bucket.add(pair);
        size++;
      }

      /* Remove operation */
      void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets[index];
        // Traverse the bucket and remove the key-value pair
        for (Pair pair in bucket) {
          if (pair.key == key) {
            bucket.remove(pair);
            size--;
            break;
          }
        }
      }

      /* Grow the hash table capacity */
      void extend() {
        // Keep a reference to the original hash table
        List<List<Pair>> bucketsTmp = buckets;
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio;
        buckets = List.generate(capacity, (_) => []);
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (List<Pair> bucket in bucketsTmp) {
          for (Pair pair in bucket) {
            put(pair.key, pair.val);
          }
        }
      }

      /* Print the hash table */
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
    /* Hash table with separate chaining */
    struct HashMapChaining {
        size: usize,
        capacity: usize,
        load_thres: f32,
        extend_ratio: usize,
        buckets: Vec<Vec<Pair>>,
    }

    impl HashMapChaining {
        /* Constructor */
        fn new() -> Self {
            Self {
                size: 0,
                capacity: 4,
                load_thres: 2.0 / 3.0,
                extend_ratio: 2,
                buckets: vec![vec![]; 4],
            }
        }

        /* Hash function */
        fn hash_func(&self, key: i32) -> usize {
            key as usize % self.capacity
        }

        /* Load factor */
        fn load_factor(&self) -> f32 {
            self.size as f32 / self.capacity as f32
        }

        /* Remove operation */
        fn remove(&mut self, key: i32) -> Option<String> {
            let index = self.hash_func(key);

            // Traverse the bucket and remove the key-value pair
            for (i, p) in self.buckets[index].iter_mut().enumerate() {
                if p.key == key {
                    let pair = self.buckets[index].remove(i);
                    self.size -= 1;
                    return Some(pair.val);
                }
            }

            // Return None if key is not found
            None
        }

        /* Grow the hash table capacity */
        fn extend(&mut self) {
            // Temporarily take ownership of the original buckets
            let buckets_tmp = std::mem::take(&mut self.buckets);

            // Initialize a new hash table with the expanded capacity
            self.capacity *= self.extend_ratio;
            self.buckets = vec![Vec::new(); self.capacity as usize];
            self.size = 0;

            // Move the key-value pairs from the original hash table to the new one
            for bucket in buckets_tmp {
                for pair in bucket {
                    self.put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
        fn print(&self) {
            for bucket in &self.buckets {
                let mut res = Vec::new();
                for pair in bucket {
                    res.push(format!("{} -> {}", pair.key, pair.val));
                }
                println!("{:?}", res);
            }
        }

        /* Insert operation */
        fn put(&mut self, key: i32, val: String) {
            // Grow the capacity when the load factor exceeds the threshold
            if self.load_factor() > self.load_thres {
                self.extend();
            }

            let index = self.hash_func(key);

            // Traverse the bucket; if the specified key is found, update its val and return
            for pair in self.buckets[index].iter_mut() {
                if pair.key == key {
                    pair.val = val;
                    return;
                }
            }

            // If key is absent, append the key-value pair at the end
            let pair = Pair { key, val };
            self.buckets[index].push(pair);
            self.size += 1;
        }

        /* Lookup operation */
        fn get(&self, key: i32) -> Option<&str> {
            let index = self.hash_func(key);

            // Traverse the bucket; if key is found, return its corresponding val
            for pair in self.buckets[index].iter() {
                if pair.key == key {
                    return Some(&pair.val);
                }
            }

            // Return None if key is not found
            None
        }
    }
    ```

=== "C"

    ```c title="hash_map_chaining.c"
    /* Linked list node */
    typedef struct Node {
        Pair *pair;
        struct Node *next;
    } Node;

    /* Hash table with separate chaining */
    typedef struct {
        int size;         // Number of key-value pairs
        int capacity;     // Hash table capacity
        double loadThres; // Load factor threshold that triggers capacity growth
        int extendRatio;  // Capacity growth factor
        Node **buckets;   // Bucket array
    } HashMapChaining;

    /* Constructor */
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

    /* Destructor */
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

    /* Hash function */
    int hashFunc(HashMapChaining *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* Load factor */
    double loadFactor(HashMapChaining *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* Lookup operation */
    char *get(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        // Traverse the bucket; if key is found, return its corresponding val
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                return cur->pair->val;
            }
            cur = cur->next;
        }
        return ""; // Return an empty string if key is not found
    }

    /* Insert operation */
    void put(HashMapChaining *hashMap, int key, const char *val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        int index = hashFunc(hashMap, key);
        // Traverse the bucket; if the specified key is found, update its val and return
        Node *cur = hashMap->buckets[index];
        while (cur) {
            if (cur->pair->key == key) {
                strcpy(cur->pair->val, val); // If the specified key is found, update its val and return
                return;
            }
            cur = cur->next;
        }
        // If key is absent, add the key-value pair at the head of the linked list
        Pair *newPair = (Pair *)malloc(sizeof(Pair));
        newPair->key = key;
        strcpy(newPair->val, val);
        Node *newNode = (Node *)malloc(sizeof(Node));
        newNode->pair = newPair;
        newNode->next = hashMap->buckets[index];
        hashMap->buckets[index] = newNode;
        hashMap->size++;
    }

    /* Grow the hash table capacity */
    void extend(HashMapChaining *hashMap) {
        // Keep a reference to the original hash table
        int oldCapacity = hashMap->capacity;
        Node **oldBuckets = hashMap->buckets;
        // Initialize a new hash table with the expanded capacity
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
        for (int i = 0; i < hashMap->capacity; i++) {
            hashMap->buckets[i] = NULL;
        }
        hashMap->size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (int i = 0; i < oldCapacity; i++) {
            Node *cur = oldBuckets[i];
            while (cur) {
                put(hashMap, cur->pair->key, cur->pair->val);
                Node *temp = cur;
                cur = cur->next;
                // Free memory
                free(temp->pair);
                free(temp);
            }
        }

        free(oldBuckets);
    }

    /* Remove operation */
    void removeItem(HashMapChaining *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        Node *cur = hashMap->buckets[index];
        Node *pre = NULL;
        while (cur) {
            if (cur->pair->key == key) {
                // Remove the key-value pair from the list
                if (pre) {
                    pre->next = cur->next;
                } else {
                    hashMap->buckets[index] = cur->next;
                }
                // Free memory
                free(cur->pair);
                free(cur);
                hashMap->size--;
                return;
            }
            pre = cur;
            cur = cur->next;
        }
    }

    /* Print the hash table */
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
    /* Hash table with separate chaining */
    class HashMapChaining {
        var size: Int // Number of key-value pairs
        var capacity: Int // Hash table capacity
        val loadThres: Double // Load factor threshold that triggers capacity growth
        val extendRatio: Int // Capacity growth factor
        var buckets: MutableList<MutableList<Pair>> // Bucket array

        /* Constructor */
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

        /* Hash function */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* Load factor */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* Lookup operation */
        fun get(key: Int): String? {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // Traverse the bucket; if key is found, return its corresponding val
            for (pair in bucket) {
                if (pair.key == key) return pair._val
            }
            // Return null if key is not found
            return null
        }

        /* Insert operation */
        fun put(key: Int, _val: String) {
            // Grow the capacity when the load factor exceeds the threshold
            if (loadFactor() > loadThres) {
                extend()
            }
            val index = hashFunc(key)
            val bucket = buckets[index]
            // Traverse the bucket; if the specified key is found, update its val and return
            for (pair in bucket) {
                if (pair.key == key) {
                    pair._val = _val
                    return
                }
            }
            // If key is absent, append the key-value pair at the end
            val pair = Pair(key, _val)
            bucket.add(pair)
            size++
        }

        /* Remove operation */
        fun remove(key: Int) {
            val index = hashFunc(key)
            val bucket = buckets[index]
            // Traverse the bucket and remove the key-value pair
            for (pair in bucket) {
                if (pair.key == key) {
                    bucket.remove(pair)
                    size--
                    break
                }
            }
        }

        /* Grow the hash table capacity */
        fun extend() {
            // Keep a reference to the original hash table
            val bucketsTmp = buckets
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio
            // A mutable list has no fixed size
            buckets = mutableListOf()
            for (i in 0..<capacity) {
                buckets.add(mutableListOf())
            }
            size = 0
            // Move the key-value pairs from the original hash table to the new one
            for (bucket in bucketsTmp) {
                for (pair in bucket) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* Print the hash table */
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
    ### Hash table using chaining ###
    class HashMapChaining
      ### Constructor ###
      def initialize
        @size = 0 # Number of key-value pairs
        @capacity = 4 # Hash table capacity
        @load_thres = 2.0 / 3.0 # Load factor threshold that triggers capacity growth
        @extend_ratio = 2 # Capacity growth factor
        @buckets = Array.new(@capacity) { [] } # Bucket array
      end

      ### Hash function ###
      def hash_func(key)
        key % @capacity
      end

      ### Load factor ###
      def load_factor
        @size / @capacity
      end

      ### Lookup operation ###
      def get(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # Traverse the bucket; if key is found, return its corresponding val
        for pair in bucket
          return pair.val if pair.key == key
        end
        # Return nil if key is not found
        nil
      end

      ### Insert operation ###
      def put(key, val)
        # Grow the capacity when the load factor exceeds the threshold
        extend if load_factor > @load_thres
        index = hash_func(key)
        bucket = @buckets[index]
        # Traverse the bucket; if the specified key is found, update its val and return
        for pair in bucket
          if pair.key == key
            pair.val = val
            return
          end
        end
        # If key is absent, append the key-value pair at the end
        pair = Pair.new(key, val)
        bucket << pair
        @size += 1
      end

      ### Remove operation ###
      def remove(key)
        index = hash_func(key)
        bucket = @buckets[index]
        # Traverse the bucket and remove the key-value pair
        for pair in bucket
          if pair.key == key
            bucket.delete(pair)
            @size -= 1
            break
          end
        end
      end

      ### Grow the hash table capacity ###
      def extend
        # Temporarily store the original hash table
        buckets = @buckets
        # Initialize a new hash table with the expanded capacity
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity) { [] }
        @size = 0
        # Move the key-value pairs from the original hash table to the new one
        for bucket in buckets
          for pair in bucket
            put(pair.key, pair.val)
          end
        end
      end

      ### Print the hash table ###
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

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22Key-value%20pair%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22Hash%20table%20with%20separate%20chaining%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Hash%20function%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22Load%20factor%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Lookup%20operation%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20operation%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20operation%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Grow%20the%20hash%20table%20capacity%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Print%20the%20hash%20table%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20hash%20table%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20Insert%20operation%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%95%B0%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B8%AD%22%29%0A%0A%20%20%20%20%23%20Lookup%20operation%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20Remove%20operation%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Pair%3A%0A%20%20%20%20%22%22%22Key-value%20pair%22%22%22%0A%20%20%20%20def%20__init__%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20self.key%20%3D%20key%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Aclass%20HashMapChaining%3A%0A%20%20%20%20%22%22%22Hash%20table%20with%20separate%20chaining%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20self.capacity%20%3D%204%0A%20%20%20%20%20%20%20%20self.load_thres%20%3D%202.0%20/%203.0%0A%20%20%20%20%20%20%20%20self.extend_ratio%20%3D%202%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%0A%20%20%20%20def%20hash_func%28self,%20key%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Hash%20function%22%22%22%0A%20%20%20%20%20%20%20%20return%20key%20%25%20self.capacity%0A%0A%20%20%20%20def%20load_factor%28self%29%20-%3E%20float%3A%0A%20%20%20%20%20%20%20%20%22%22%22Load%20factor%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%20/%20self.capacity%0A%0A%20%20%20%20def%20get%28self,%20key%3A%20int%29%20-%3E%20str%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Lookup%20operation%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20pair.val%0A%20%20%20%20%20%20%20%20return%20None%0A%0A%20%20%20%20def%20put%28self,%20key%3A%20int,%20val%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20operation%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.load_factor%28%29%20%3E%20self.load_thres%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend%28%29%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pair.val%20%3D%20val%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20pair%20%3D%20Pair%28key,%20val%29%0A%20%20%20%20%20%20%20%20bucket.append%28pair%29%0A%20%20%20%20%20%20%20%20self.size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self,%20key%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20operation%22%22%22%0A%20%20%20%20%20%20%20%20index%20%3D%20self.hash_func%28key%29%0A%20%20%20%20%20%20%20%20bucket%20%3D%20self.buckets%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20pair.key%20%3D%3D%20key%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20bucket.remove%28pair%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.size%20-%3D%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%20%20%20%20def%20extend%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Grow%20the%20hash%20table%20capacity%22%22%22%0A%20%20%20%20%20%20%20%20buckets%20%3D%20self.buckets%0A%20%20%20%20%20%20%20%20self.capacity%20%2A%3D%20self.extend_ratio%0A%20%20%20%20%20%20%20%20self.buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28self.capacity%29%5D%0A%20%20%20%20%20%20%20%20self.size%20%3D%200%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.put%28pair.key,%20pair.val%29%0A%0A%20%20%20%20def%20print%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Print%20the%20hash%20table%22%22%22%0A%20%20%20%20%20%20%20%20for%20bucket%20in%20self.buckets%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20pair%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20res.append%28str%28pair.key%29%20%2B%20%22%20-%3E%20%22%20%2B%20pair.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28res%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20hash%20table%0A%20%20%20%20hashmap%20%3D%20HashMapChaining%28%29%0A%0A%20%20%20%20%23%20Insert%20operation%0A%20%20%20%20hashmap.put%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hashmap.put%2815937,%20%22%E5%B0%8F%E5%95%B0%22%29%0A%20%20%20%20hashmap.put%2816750,%20%22%E5%B0%8F%E7%AE%97%22%29%0A%20%20%20%20hashmap.put%2813276,%20%22%E5%B0%8F%E6%B3%95%22%29%0A%20%20%20%20hashmap.put%2810583,%20%22%E5%B0%8F%E9%B8%AD%22%29%0A%0A%20%20%20%20%23%20Lookup%20operation%0A%20%20%20%20name%20%3D%20hashmap.get%2813276%29%0A%0A%20%20%20%20%23%20Remove%20operation%0A%20%20%20%20hashmap.remove%2812836%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

When a list becomes long, its $O(n)$ lookup time is poor. **Replacing it with an AVL tree or red-black tree** improves lookup time to $O(\log n)$.

## 6.2.2 &nbsp; Open addressing

<u>Open addressing</u> handles collisions by probing multiple locations without introducing another data structure. Common strategies include linear probing, quadratic probing, and multiple hashing.

We use linear probing to explain how an open-addressing hash table works.

### 1. &nbsp; Linear probing

Linear probing searches with a fixed step size. Its operations differ from those of a basic hash table.

- **Insertion**: Calculate the bucket index using the hash function. If the bucket is occupied, scan forward from that position with a fixed step size, usually $1$, until an empty bucket is found, then insert the element.
- **Lookup**: If a collision is encountered, scan forward with the same step size until the target is found, then return its `value`. An empty bucket means the target is absent, so return `None`.

Figure 6-6 shows key-value pairs in an open-addressing table using linear probing. With this hash function, keys sharing the same last two digits map to the same bucket. Linear probing stores them successively in that bucket and the following buckets.

![Distribution of key-value pairs with linear probing](hash_collision.assets/hash_table_linear_probing.png){ class="animation-figure" }

<p align="center"> Figure 6-6 &nbsp; Distribution of key-value pairs with linear probing </p>

However, **linear probing is prone to clustering**. The longer a run of occupied positions becomes, the more likely a collision is to occur within it, causing the cluster to grow further. This feedback loop eventually degrades insertion, deletion, lookup, and update performance.

**We cannot simply delete an element from an open-addressing table**. Deletion would leave an empty bucket, `None`. A lookup stops when linear probing reaches such a bucket, making later elements in the probe sequence inaccessible and potentially reporting them as absent, as shown below.

![Lookup problems caused by deletion in open addressing](hash_collision.assets/hash_table_open_addressing_deletion.png){ class="animation-figure" }

<p align="center"> Figure 6-7 &nbsp; Lookup problems caused by deletion in open addressing </p>

To solve this, use <u>lazy deletion</u>: rather than simply removing the entry, **mark its bucket with the constant `TOMBSTONE`**. Both `None` and `TOMBSTONE` represent available buckets that can hold a new pair. Unlike `None`, however, a `TOMBSTONE` does not stop a search, because further pairs may lie beyond it.

However, **lazy deletion can accelerate performance degradation**. Each deletion leaves a marker. As `TOMBSTONE` entries accumulate, searches may need to skip many of them before reaching the target, increasing search time.

To address this, record the first `TOMBSTONE` encountered during probing and swap the target entry with it when found. On each lookup or insertion, this moves the entry closer to its ideal location—the start of the probe sequence—and improves lookup efficiency.

The code below implements linear probing with lazy deletion. To use the table's space more fully, treat the array as circular: after reaching the end, wrap around to the beginning.

=== "Python"

    ```python title="hash_map_open_addressing.py"
    class HashMapOpenAddressing:
        """Hash table with open addressing"""

        def __init__(self):
            """Constructor"""
            self.size = 0  # Number of key-value pairs
            self.capacity = 4  # Hash table capacity
            self.load_thres = 2.0 / 3.0  # Load factor threshold that triggers capacity growth
            self.extend_ratio = 2  # Capacity growth factor
            self.buckets: list[Pair | None] = [None] * self.capacity  # Bucket array
            self.TOMBSTONE = Pair(-1, "-1")  # Tombstone marker

        def hash_func(self, key: int) -> int:
            """Hash function"""
            return key % self.capacity

        def load_factor(self) -> float:
            """Load factor"""
            return self.size / self.capacity

        def find_bucket(self, key: int) -> int:
            """Find the bucket index for key"""
            index = self.hash_func(key)
            first_tombstone = -1
            # Probe linearly until an empty bucket is reached
            while self.buckets[index] is not None:
                # If key is found, return its bucket index
                if self.buckets[index].key == key:
                    # If a tombstone was encountered earlier, move the key-value pair to that index
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = self.buckets[index]
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # Return the bucket index after the move
                    return index  # Return the bucket index
                # Record the first tombstone encountered
                if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                    first_tombstone = index
                # Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % self.capacity
            # If key is absent, return the index for insertion
            return index if first_tombstone == -1 else first_tombstone

        def get(self, key: int) -> str:
            """Lookup operation"""
            # Find the bucket index for key
            index = self.find_bucket(key)
            # If the key-value pair is found, return its val
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                return self.buckets[index].val
            # Return None if the key-value pair is absent
            return None

        def put(self, key: int, val: str):
            """Insert operation"""
            # Grow the capacity when the load factor exceeds the threshold
            if self.load_factor() > self.load_thres:
                self.extend()
            # Find the bucket index for key
            index = self.find_bucket(key)
            # If the key-value pair is found, overwrite val and return
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index].val = val
                return
            # If the key-value pair is absent, insert it
            self.buckets[index] = Pair(key, val)
            self.size += 1

        def remove(self, key: int):
            """Remove operation"""
            # Find the bucket index for key
            index = self.find_bucket(key)
            # If the key-value pair is found, replace it with a tombstone
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index] = self.TOMBSTONE
                self.size -= 1

        def extend(self):
            """Grow the hash table capacity"""
            # Keep a reference to the original hash table
            buckets_tmp = self.buckets
            # Initialize a new hash table with the expanded capacity
            self.capacity *= self.extend_ratio
            self.buckets = [None] * self.capacity
            self.size = 0
            # Move the key-value pairs from the original hash table to the new one
            for pair in buckets_tmp:
                if pair not in [None, self.TOMBSTONE]:
                    self.put(pair.key, pair.val)

        def print(self):
            """Print the hash table"""
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
      private:
        int size;                             // Number of key-value pairs
        int capacity = 4;                     // Hash table capacity
        const double loadThres = 2.0 / 3.0;     // Load factor threshold that triggers capacity growth
        const int extendRatio = 2;            // Capacity growth factor
        vector<Pair *> buckets;               // Bucket array
        Pair *TOMBSTONE = new Pair(-1, "-1"); // Tombstone marker

      public:
        /* Constructor */
        HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
        }

        /* Destructor */
        ~HashMapOpenAddressing() {
            for (Pair *pair : buckets) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    delete pair;
                }
            }
            delete TOMBSTONE;
        }

        /* Hash function */
        int hashFunc(int key) {
            return key % capacity;
        }

        /* Load factor */
        double loadFactor() {
            return (double)size / capacity;
        }

        /* Find the bucket index for key */
        int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // Probe linearly until an empty bucket is reached
            while (buckets[index] != nullptr) {
                // If key is found, return its bucket index
                if (buckets[index]->key == key) {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Return the bucket index after the move
                    }
                    return index; // Return the bucket index
                }
                // Record the first tombstone encountered
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % capacity;
            }
            // If key is absent, return the index for insertion
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Lookup operation */
        string get(int key) {
            // Find the bucket index for key
            int index = findBucket(key);
            // If the key-value pair is found, return its val
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                return buckets[index]->val;
            }
            // Return an empty string if the key-value pair does not exist
            return "";
        }

        /* Insert operation */
        void put(int key, string val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (loadFactor() > loadThres) {
                extend();
            }
            // Find the bucket index for key
            int index = findBucket(key);
            // If the key-value pair is found, overwrite val and return
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                buckets[index]->val = val;
                return;
            }
            // If the key-value pair is absent, insert it
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Remove operation */
        void remove(int key) {
            // Find the bucket index for key
            int index = findBucket(key);
            // If the key-value pair is found, replace it with a tombstone
            if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
                delete buckets[index];
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Grow the hash table capacity */
        void extend() {
            // Keep a copy of the original bucket array
            vector<Pair *> bucketsTmp = buckets;
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio;
            buckets = vector<Pair *>(capacity, nullptr);
            size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (Pair *pair : bucketsTmp) {
                if (pair != nullptr && pair != TOMBSTONE) {
                    put(pair->key, pair->val);
                    delete pair;
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
        private int size; // Number of key-value pairs
        private int capacity = 4; // Hash table capacity
        private final double loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
        private final int extendRatio = 2; // Capacity growth factor
        private Pair[] buckets; // Bucket array
        private final Pair TOMBSTONE = new Pair(-1, "-1"); // Tombstone marker

        /* Constructor */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* Hash function */
        private int hashFunc(int key) {
            return key % capacity;
        }

        /* Load factor */
        private double loadFactor() {
            return (double) size / capacity;
        }

        /* Find the bucket index for key */
        private int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // Probe linearly until an empty bucket is reached
            while (buckets[index] != null) {
                // If key is found, return its bucket index
                if (buckets[index].key == key) {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Return the bucket index after the move
                    }
                    return index; // Return the bucket index
                }
                // Record the first tombstone encountered
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % capacity;
            }
            // If key is absent, return the index for insertion
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Lookup operation */
        public String get(int key) {
            // Find the bucket index for key
            int index = findBucket(key);
            // If the key-value pair is found, return its val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // Return null if the key-value pair is absent
            return null;
        }

        /* Insert operation */
        public void put(int key, String val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (loadFactor() > loadThres) {
                extend();
            }
            // Find the bucket index for key
            int index = findBucket(key);
            // If the key-value pair is found, overwrite val and return
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // If the key-value pair is absent, insert it
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Remove operation */
        public void remove(int key) {
            // Find the bucket index for key
            int index = findBucket(key);
            // If the key-value pair is found, replace it with a tombstone
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Grow the hash table capacity */
        private void extend() {
            // Keep a reference to the original hash table
            Pair[] bucketsTmp = buckets;
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (Pair pair : bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
        int size; // Number of key-value pairs
        int capacity = 4; // Hash table capacity
        double loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
        int extendRatio = 2; // Capacity growth factor
        Pair[] buckets; // Bucket array
        Pair TOMBSTONE = new(-1, "-1"); // Tombstone marker

        /* Constructor */
        public HashMapOpenAddressing() {
            size = 0;
            buckets = new Pair[capacity];
        }

        /* Hash function */
        int HashFunc(int key) {
            return key % capacity;
        }

        /* Load factor */
        double LoadFactor() {
            return (double)size / capacity;
        }

        /* Find the bucket index for key */
        int FindBucket(int key) {
            int index = HashFunc(key);
            int firstTombstone = -1;
            // Probe linearly until an empty bucket is reached
            while (buckets[index] != null) {
                // If key is found, return its bucket index
                if (buckets[index].key == key) {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Return the bucket index after the move
                    }
                    return index; // Return the bucket index
                }
                // Record the first tombstone encountered
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % capacity;
            }
            // If key is absent, return the index for insertion
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Lookup operation */
        public string? Get(int key) {
            // Find the bucket index for key
            int index = FindBucket(key);
            // If the key-value pair is found, return its val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // Return null if the key-value pair is absent
            return null;
        }

        /* Insert operation */
        public void Put(int key, string val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (LoadFactor() > loadThres) {
                Extend();
            }
            // Find the bucket index for key
            int index = FindBucket(key);
            // If the key-value pair is found, overwrite val and return
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // If the key-value pair is absent, insert it
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Remove operation */
        public void Remove(int key) {
            // Find the bucket index for key
            int index = FindBucket(key);
            // If the key-value pair is found, replace it with a tombstone
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Grow the hash table capacity */
        void Extend() {
            // Keep a reference to the original hash table
            Pair[] bucketsTmp = buckets;
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // Move the key-value pairs from the original hash table to the new one
            foreach (Pair pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    Put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with open addressing */
    type hashMapOpenAddressing struct {
        size        int     // Number of key-value pairs
        capacity    int     // Hash table capacity
        loadThres   float64 // Load factor threshold that triggers capacity growth
        extendRatio int     // Capacity growth factor
        buckets     []*pair // Bucket array
        TOMBSTONE   *pair   // Tombstone marker
    }

    /* Constructor */
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

    /* Hash function */
    func (h *hashMapOpenAddressing) hashFunc(key int) int {
        return key % h.capacity // Calculate the hash value from the key
    }

    /* Load factor */
    func (h *hashMapOpenAddressing) loadFactor() float64 {
        return float64(h.size) / float64(h.capacity) // Calculate the current load factor
    }

    /* Find the bucket index for key */
    func (h *hashMapOpenAddressing) findBucket(key int) int {
        index := h.hashFunc(key) // Get the initial index
        firstTombstone := -1     // Record the position of the first TOMBSTONE encountered
        for h.buckets[index] != nil {
            if h.buckets[index].key == key {
                if firstTombstone != -1 {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    h.buckets[firstTombstone] = h.buckets[index]
                    h.buckets[index] = h.TOMBSTONE
                    return firstTombstone // Return the bucket index after the move
                }
                return index // Return the index found
            }
            if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
                firstTombstone = index // Record the position of the first tombstone encountered
            }
            index = (index + 1) % h.capacity // Probe linearly, wrapping to the beginning after the end
        }
        // If key is absent, return the index for insertion
        if firstTombstone != -1 {
            return firstTombstone
        }
        return index
    }

    /* Lookup operation */
    func (h *hashMapOpenAddressing) get(key int) string {
        index := h.findBucket(key) // Find the bucket index for key
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            return h.buckets[index].val // If the key-value pair is found, return its val
        }
        return "" // If the key-value pair is absent, return ""
    }

    /* Insert operation */
    func (h *hashMapOpenAddressing) put(key int, val string) {
        if h.loadFactor() > h.loadThres {
            h.extend() // Grow the capacity when the load factor exceeds the threshold
        }
        index := h.findBucket(key) // Find the bucket index for key
        if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
            h.buckets[index] = &pair{key, val} // If the key-value pair is absent, insert it
            h.size++
        } else {
            h.buckets[index].val = val // If the key-value pair is found, overwrite val
        }
    }

    /* Remove operation */
    func (h *hashMapOpenAddressing) remove(key int) {
        index := h.findBucket(key) // Find the bucket index for key
        if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
            h.buckets[index] = h.TOMBSTONE // If the key-value pair is found, replace it with a tombstone
            h.size--
        }
    }

    /* Grow the hash table capacity */
    func (h *hashMapOpenAddressing) extend() {
        oldBuckets := h.buckets               // Keep a reference to the original hash table
        h.capacity *= h.extendRatio           // Update the capacity
        h.buckets = make([]*pair, h.capacity) // Initialize a new hash table with the expanded capacity
        h.size = 0                            // Reset the size
        // Move the key-value pairs from the original hash table to the new one
        for _, pair := range oldBuckets {
            if pair != nil && pair != h.TOMBSTONE {
                h.put(pair.key, pair.val)
            }
        }
    }

    /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
        var size: Int // Number of key-value pairs
        var capacity: Int // Hash table capacity
        var loadThres: Double // Load factor threshold that triggers capacity growth
        var extendRatio: Int // Capacity growth factor
        var buckets: [Pair?] // Bucket array
        var TOMBSTONE: Pair // Tombstone marker

        /* Constructor */
        init() {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = Array(repeating: nil, count: capacity)
            TOMBSTONE = Pair(key: -1, val: "-1")
        }

        /* Hash function */
        func hashFunc(key: Int) -> Int {
            key % capacity
        }

        /* Load factor */
        func loadFactor() -> Double {
            Double(size) / Double(capacity)
        }

        /* Find the bucket index for key */
        func findBucket(key: Int) -> Int {
            var index = hashFunc(key: key)
            var firstTombstone = -1
            // Probe linearly until an empty bucket is reached
            while buckets[index] != nil {
                // If key is found, return its bucket index
                if buckets[index]!.key == key {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if firstTombstone != -1 {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // Return the bucket index after the move
                    }
                    return index // Return the bucket index
                }
                // Record the first tombstone encountered
                if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                    firstTombstone = index
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % capacity
            }
            // If key is absent, return the index for insertion
            return firstTombstone == -1 ? index : firstTombstone
        }

        /* Lookup operation */
        func get(key: Int) -> String? {
            // Find the bucket index for key
            let index = findBucket(key: key)
            // If the key-value pair is found, return its val
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                return buckets[index]!.val
            }
            // Return nil if the key-value pair is absent
            return nil
        }

        /* Insert operation */
        func put(key: Int, val: String) {
            // Grow the capacity when the load factor exceeds the threshold
            if loadFactor() > loadThres {
                extend()
            }
            // Find the bucket index for key
            let index = findBucket(key: key)
            // If the key-value pair is found, overwrite val and return
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index]!.val = val
                return
            }
            // If the key-value pair is absent, insert it
            buckets[index] = Pair(key: key, val: val)
            size += 1
        }

        /* Remove operation */
        func remove(key: Int) {
            // Find the bucket index for key
            let index = findBucket(key: key)
            // If the key-value pair is found, replace it with a tombstone
            if buckets[index] != nil, buckets[index] != TOMBSTONE {
                buckets[index] = TOMBSTONE
                size -= 1
            }
        }

        /* Grow the hash table capacity */
        func extend() {
            // Save the original bucket array
            let bucketsTmp = buckets
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio
            buckets = Array(repeating: nil, count: capacity)
            size = 0
            // Move the key-value pairs from the original hash table to the new one
            for pair in bucketsTmp {
                if let pair, pair != TOMBSTONE {
                    put(key: pair.key, val: pair.val)
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
        #size; // Number of key-value pairs
        #capacity; // Hash table capacity
        #loadThres; // Load factor threshold that triggers capacity growth
        #extendRatio; // Capacity growth factor
        #buckets; // Bucket array
        #TOMBSTONE; // Tombstone marker

        /* Constructor */
        constructor() {
            this.#size = 0; // Number of key-value pairs
            this.#capacity = 4; // Hash table capacity
            this.#loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
            this.#extendRatio = 2; // Capacity growth factor
            this.#buckets = Array(this.#capacity).fill(null); // Bucket array
            this.#TOMBSTONE = new Pair(-1, '-1'); // Tombstone marker
        }

        /* Hash function */
        #hashFunc(key) {
            return key % this.#capacity;
        }

        /* Load factor */
        #loadFactor() {
            return this.#size / this.#capacity;
        }

        /* Find the bucket index for key */
        #findBucket(key) {
            let index = this.#hashFunc(key);
            let firstTombstone = -1;
            // Probe linearly until an empty bucket is reached
            while (this.#buckets[index] !== null) {
                // If key is found, return its bucket index
                if (this.#buckets[index].key === key) {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if (firstTombstone !== -1) {
                        this.#buckets[firstTombstone] = this.#buckets[index];
                        this.#buckets[index] = this.#TOMBSTONE;
                        return firstTombstone; // Return the bucket index after the move
                    }
                    return index; // Return the bucket index
                }
                // Record the first tombstone encountered
                if (
                    firstTombstone === -1 &&
                    this.#buckets[index] === this.#TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % this.#capacity;
            }
            // If key is absent, return the index for insertion
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* Lookup operation */
        get(key) {
            // Find the bucket index for key
            const index = this.#findBucket(key);
            // If the key-value pair is found, return its val
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                return this.#buckets[index].val;
            }
            // Return null if the key-value pair does not exist
            return null;
        }

        /* Insert operation */
        put(key, val) {
            // Grow the capacity when the load factor exceeds the threshold
            if (this.#loadFactor() > this.#loadThres) {
                this.#extend();
            }
            // Find the bucket index for key
            const index = this.#findBucket(key);
            // If the key-value pair is found, overwrite val and return
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index].val = val;
                return;
            }
            // If the key-value pair is absent, insert it
            this.#buckets[index] = new Pair(key, val);
            this.#size++;
        }

        /* Remove operation */
        remove(key) {
            // Find the bucket index for key
            const index = this.#findBucket(key);
            // If the key-value pair is found, replace it with a tombstone
            if (
                this.#buckets[index] !== null &&
                this.#buckets[index] !== this.#TOMBSTONE
            ) {
                this.#buckets[index] = this.#TOMBSTONE;
                this.#size--;
            }
        }

        /* Grow the hash table capacity */
        #extend() {
            // Keep a reference to the original hash table
            const bucketsTmp = this.#buckets;
            // Initialize a new hash table with the expanded capacity
            this.#capacity *= this.#extendRatio;
            this.#buckets = Array(this.#capacity).fill(null);
            this.#size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.#TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
        private size: number; // Number of key-value pairs
        private capacity: number; // Hash table capacity
        private loadThres: number; // Load factor threshold that triggers capacity growth
        private extendRatio: number; // Capacity growth factor
        private buckets: Array<Pair | null>; // Bucket array
        private TOMBSTONE: Pair; // Tombstone marker

        /* Constructor */
        constructor() {
            this.size = 0; // Number of key-value pairs
            this.capacity = 4; // Hash table capacity
            this.loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
            this.extendRatio = 2; // Capacity growth factor
            this.buckets = Array(this.capacity).fill(null); // Bucket array
            this.TOMBSTONE = new Pair(-1, '-1'); // Tombstone marker
        }

        /* Hash function */
        private hashFunc(key: number): number {
            return key % this.capacity;
        }

        /* Load factor */
        private loadFactor(): number {
            return this.size / this.capacity;
        }

        /* Find the bucket index for key */
        private findBucket(key: number): number {
            let index = this.hashFunc(key);
            let firstTombstone = -1;
            // Probe linearly until an empty bucket is reached
            while (this.buckets[index] !== null) {
                // If key is found, return its bucket index
                if (this.buckets[index]!.key === key) {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if (firstTombstone !== -1) {
                        this.buckets[firstTombstone] = this.buckets[index];
                        this.buckets[index] = this.TOMBSTONE;
                        return firstTombstone; // Return the bucket index after the move
                    }
                    return index; // Return the bucket index
                }
                // Record the first tombstone encountered
                if (
                    firstTombstone === -1 &&
                    this.buckets[index] === this.TOMBSTONE
                ) {
                    firstTombstone = index;
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % this.capacity;
            }
            // If key is absent, return the index for insertion
            return firstTombstone === -1 ? index : firstTombstone;
        }

        /* Lookup operation */
        get(key: number): string | null {
            // Find the bucket index for key
            const index = this.findBucket(key);
            // If the key-value pair is found, return its val
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                return this.buckets[index]!.val;
            }
            // Return null if the key-value pair does not exist
            return null;
        }

        /* Insert operation */
        put(key: number, val: string): void {
            // Grow the capacity when the load factor exceeds the threshold
            if (this.loadFactor() > this.loadThres) {
                this.extend();
            }
            // Find the bucket index for key
            const index = this.findBucket(key);
            // If the key-value pair is found, overwrite val and return
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index]!.val = val;
                return;
            }
            // If the key-value pair is absent, insert it
            this.buckets[index] = new Pair(key, val);
            this.size++;
        }

        /* Remove operation */
        remove(key: number): void {
            // Find the bucket index for key
            const index = this.findBucket(key);
            // If the key-value pair is found, replace it with a tombstone
            if (
                this.buckets[index] !== null &&
                this.buckets[index] !== this.TOMBSTONE
            ) {
                this.buckets[index] = this.TOMBSTONE;
                this.size--;
            }
        }

        /* Grow the hash table capacity */
        private extend(): void {
            // Keep a reference to the original hash table
            const bucketsTmp = this.buckets;
            // Initialize a new hash table with the expanded capacity
            this.capacity *= this.extendRatio;
            this.buckets = Array(this.capacity).fill(null);
            this.size = 0;
            // Move the key-value pairs from the original hash table to the new one
            for (const pair of bucketsTmp) {
                if (pair !== null && pair !== this.TOMBSTONE) {
                    this.put(pair.key, pair.val);
                }
            }
        }

        /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
      late int _size; // Number of key-value pairs
      int _capacity = 4; // Hash table capacity
      double _loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
      int _extendRatio = 2; // Capacity growth factor
      late List<Pair?> _buckets; // Bucket array
      Pair _TOMBSTONE = Pair(-1, "-1"); // Tombstone marker

      /* Constructor */
      HashMapOpenAddressing() {
        _size = 0;
        _buckets = List.generate(_capacity, (index) => null);
      }

      /* Hash function */
      int hashFunc(int key) {
        return key % _capacity;
      }

      /* Load factor */
      double loadFactor() {
        return _size / _capacity;
      }

      /* Find the bucket index for key */
      int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Probe linearly until an empty bucket is reached
        while (_buckets[index] != null) {
          // If key is found, return its bucket index
          if (_buckets[index]!.key == key) {
            // If a tombstone was encountered earlier, move the key-value pair to that index
            if (firstTombstone != -1) {
              _buckets[firstTombstone] = _buckets[index];
              _buckets[index] = _TOMBSTONE;
              return firstTombstone; // Return the bucket index after the move
            }
            return index; // Return the bucket index
          }
          // Record the first tombstone encountered
          if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
            firstTombstone = index;
          }
          // Calculate the bucket index, wrapping to the beginning after the end
          index = (index + 1) % _capacity;
        }
        // If key is absent, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone;
      }

      /* Lookup operation */
      String? get(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, return its val
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          return _buckets[index]!.val;
        }
        // Return null if the key-value pair does not exist
        return null;
      }

      /* Insert operation */
      void put(int key, String val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > _loadThres) {
          extend();
        }
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index]!.val = val;
          return;
        }
        // If the key-value pair is absent, insert it
        _buckets[index] = new Pair(key, val);
        _size++;
      }

      /* Remove operation */
      void remove(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, replace it with a tombstone
        if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
          _buckets[index] = _TOMBSTONE;
          _size--;
        }
      }

      /* Grow the hash table capacity */
      void extend() {
        // Keep a reference to the original hash table
        List<Pair?> bucketsTmp = _buckets;
        // Initialize a new hash table with the expanded capacity
        _capacity *= _extendRatio;
        _buckets = List.generate(_capacity, (index) => null);
        _size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (Pair? pair in bucketsTmp) {
          if (pair != null && pair != _TOMBSTONE) {
            put(pair.key, pair.val);
          }
        }
      }

      /* Print the hash table */
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
    /* Hash table with open addressing */
    struct HashMapOpenAddressing {
        size: usize,                // Number of key-value pairs
        capacity: usize,            // Hash table capacity
        load_thres: f64,            // Load factor threshold that triggers capacity growth
        extend_ratio: usize,        // Capacity growth factor
        buckets: Vec<Option<Pair>>, // Bucket array
        TOMBSTONE: Option<Pair>,    // Tombstone marker
    }

    impl HashMapOpenAddressing {
        /* Constructor */
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

        /* Hash function */
        fn hash_func(&self, key: i32) -> usize {
            (key % self.capacity as i32) as usize
        }

        /* Load factor */
        fn load_factor(&self) -> f64 {
            self.size as f64 / self.capacity as f64
        }

        /* Find the bucket index for key */
        fn find_bucket(&mut self, key: i32) -> usize {
            let mut index = self.hash_func(key);
            let mut first_tombstone = -1;
            // Probe linearly until an empty bucket is reached
            while self.buckets[index].is_some() {
                // If key is found, return the corresponding bucket index
                if self.buckets[index].as_ref().unwrap().key == key {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if first_tombstone != -1 {
                        self.buckets[first_tombstone as usize] = self.buckets[index].take();
                        self.buckets[index] = self.TOMBSTONE.clone();
                        return first_tombstone as usize; // Return the bucket index after the move
                    }
                    return index; // Return the bucket index
                }
                // Record the first tombstone encountered
                if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                    first_tombstone = index as i32;
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % self.capacity;
            }
            // If key is absent, return the index for insertion
            if first_tombstone == -1 {
                index
            } else {
                first_tombstone as usize
            }
        }

        /* Lookup operation */
        fn get(&mut self, key: i32) -> Option<&str> {
            // Find the bucket index for key
            let index = self.find_bucket(key);
            // If the key-value pair is found, return its val
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
            }
            // If the key-value pair does not exist, return None
            None
        }

        /* Insert operation */
        fn put(&mut self, key: i32, val: String) {
            // Grow the capacity when the load factor exceeds the threshold
            if self.load_factor() > self.load_thres {
                self.extend();
            }
            // Find the bucket index for key
            let index = self.find_bucket(key);
            // If the key-value pair is found, overwrite val and return
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index].as_mut().unwrap().val = val;
                return;
            }
            // If the key-value pair is absent, insert it
            self.buckets[index] = Some(Pair { key, val });
            self.size += 1;
        }

        /* Remove operation */
        fn remove(&mut self, key: i32) {
            // Find the bucket index for key
            let index = self.find_bucket(key);
            // If the key-value pair is found, replace it with a tombstone
            if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
                self.buckets[index] = self.TOMBSTONE.clone();
                self.size -= 1;
            }
        }

        /* Grow the hash table capacity */
        fn extend(&mut self) {
            // Temporarily save a copy of the original buckets
            let buckets_tmp = self.buckets.clone();
            // Initialize a new hash table with the expanded capacity
            self.capacity *= self.extend_ratio;
            self.buckets = vec![None; self.capacity];
            self.size = 0;

            // Move the key-value pairs from the original hash table to the new one
            for pair in buckets_tmp {
                if pair.is_none() || pair == self.TOMBSTONE {
                    continue;
                }
                let pair = pair.unwrap();

                self.put(pair.key, pair.val);
            }
        }
        /* Print the hash table */
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
    /* Hash table with open addressing */
    typedef struct {
        int size;         // Number of key-value pairs
        int capacity;     // Hash table capacity
        double loadThres; // Load factor threshold that triggers capacity growth
        int extendRatio;  // Capacity growth factor
        Pair **buckets;   // Bucket array
        Pair *TOMBSTONE;  // Tombstone marker
    } HashMapOpenAddressing;

    /* Constructor */
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

    /* Destructor */
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

    /* Hash function */
    int hashFunc(HashMapOpenAddressing *hashMap, int key) {
        return key % hashMap->capacity;
    }

    /* Load factor */
    double loadFactor(HashMapOpenAddressing *hashMap) {
        return (double)hashMap->size / (double)hashMap->capacity;
    }

    /* Find the bucket index for key */
    int findBucket(HashMapOpenAddressing *hashMap, int key) {
        int index = hashFunc(hashMap, key);
        int firstTombstone = -1;
        // Probe linearly until an empty bucket is reached
        while (hashMap->buckets[index] != NULL) {
            // If key is found, return its bucket index
            if (hashMap->buckets[index]->key == key) {
                // If a tombstone was encountered earlier, move the key-value pair to that index
                if (firstTombstone != -1) {
                    hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                    hashMap->buckets[index] = hashMap->TOMBSTONE;
                    return firstTombstone; // Return the bucket index after the move
                }
                return index; // Return the bucket index
            }
            // Record the first tombstone encountered
            if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
                firstTombstone = index;
            }
            // Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % hashMap->capacity;
        }
        // If key is absent, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Lookup operation */
    char *get(HashMapOpenAddressing *hashMap, int key) {
        // Find the bucket index for key
        int index = findBucket(hashMap, key);
        // If the key-value pair is found, return its val
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            return hashMap->buckets[index]->val;
        }
        // Return an empty string if the key-value pair does not exist
        return "";
    }

    /* Insert operation */
    void put(HashMapOpenAddressing *hashMap, int key, char *val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor(hashMap) > hashMap->loadThres) {
            extend(hashMap);
        }
        // Find the bucket index for key
        int index = findBucket(hashMap, key);
        // If the key-value pair is found, overwrite val and return
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            free(hashMap->buckets[index]->val);
            hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
            strcpy(hashMap->buckets[index]->val, val);
            hashMap->buckets[index]->val[strlen(val)] = '\0';
            return;
        }
        // If the key-value pair is absent, insert it
        Pair *pair = (Pair *)malloc(sizeof(Pair));
        pair->key = key;
        pair->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(pair->val, val);
        pair->val[strlen(val)] = '\0';

        hashMap->buckets[index] = pair;
        hashMap->size++;
    }

    /* Remove operation */
    void removeItem(HashMapOpenAddressing *hashMap, int key) {
        // Find the bucket index for key
        int index = findBucket(hashMap, key);
        // If the key-value pair is found, replace it with a tombstone
        if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
            Pair *pair = hashMap->buckets[index];
            free(pair->val);
            free(pair);
            hashMap->buckets[index] = hashMap->TOMBSTONE;
            hashMap->size--;
        }
    }

    /* Grow the hash table capacity */
    void extend(HashMapOpenAddressing *hashMap) {
        // Keep a reference to the original hash table
        Pair **bucketsTmp = hashMap->buckets;
        int oldCapacity = hashMap->capacity;
        // Initialize a new hash table with the expanded capacity
        hashMap->capacity *= hashMap->extendRatio;
        hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
        hashMap->size = 0;
        // Move the key-value pairs from the original hash table to the new one
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

    /* Print the hash table */
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
    /* Hash table with open addressing */
    class HashMapOpenAddressing {
        private var size: Int               // Number of key-value pairs
        private var capacity: Int           // Hash table capacity
        private val loadThres: Double       // Load factor threshold that triggers capacity growth
        private val extendRatio: Int        // Capacity growth factor
        private var buckets: Array<Pair?>   // Bucket array
        private val TOMBSTONE: Pair         // Tombstone marker

        /* Constructor */
        init {
            size = 0
            capacity = 4
            loadThres = 2.0 / 3.0
            extendRatio = 2
            buckets = arrayOfNulls(capacity)
            TOMBSTONE = Pair(-1, "-1")
        }

        /* Hash function */
        fun hashFunc(key: Int): Int {
            return key % capacity
        }

        /* Load factor */
        fun loadFactor(): Double {
            return (size / capacity).toDouble()
        }

        /* Find the bucket index for key */
        fun findBucket(key: Int): Int {
            var index = hashFunc(key)
            var firstTombstone = -1
            // Probe linearly until an empty bucket is reached
            while (buckets[index] != null) {
                // If key is found, return its bucket index
                if (buckets[index]?.key == key) {
                    // If a tombstone was encountered earlier, move the key-value pair to that index
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index]
                        buckets[index] = TOMBSTONE
                        return firstTombstone // Return the bucket index after the move
                    }
                    return index // Return the bucket index
                }
                // Record the first tombstone encountered
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index
                }
                // Calculate the bucket index, wrapping to the beginning after the end
                index = (index + 1) % capacity
            }
            // If key is absent, return the index for insertion
            return if (firstTombstone == -1) index else firstTombstone
        }

        /* Lookup operation */
        fun get(key: Int): String? {
            // Find the bucket index for key
            val index = findBucket(key)
            // If the key-value pair is found, return its val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index]?._val
            }
            // Return null if the key-value pair is absent
            return null
        }

        /* Insert operation */
        fun put(key: Int, _val: String) {
            // Grow the capacity when the load factor exceeds the threshold
            if (loadFactor() > loadThres) {
                extend()
            }
            // Find the bucket index for key
            val index = findBucket(key)
            // If the key-value pair is found, overwrite val and return
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index]!!._val = _val
                return
            }
            // If the key-value pair is absent, insert it
            buckets[index] = Pair(key, _val)
            size++
        }

        /* Remove operation */
        fun remove(key: Int) {
            // Find the bucket index for key
            val index = findBucket(key)
            // If the key-value pair is found, replace it with a tombstone
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE
                size--
            }
        }

        /* Grow the hash table capacity */
        fun extend() {
            // Keep a reference to the original hash table
            val bucketsTmp = buckets
            // Initialize a new hash table with the expanded capacity
            capacity *= extendRatio
            buckets = arrayOfNulls(capacity)
            size = 0
            // Move the key-value pairs from the original hash table to the new one
            for (pair in bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair._val)
                }
            }
        }

        /* Print the hash table */
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
    ### Hash table with open addressing ###
    class HashMapOpenAddressing
      TOMBSTONE = Pair.new(-1, '-1') # Tombstone marker

      ### Constructor ###
      def initialize
        @size = 0 # Number of key-value pairs
        @capacity = 4 # Hash table capacity
        @load_thres = 2.0 / 3.0 # Load factor threshold that triggers capacity growth
        @extend_ratio = 2 # Capacity growth factor
        @buckets = Array.new(@capacity) # Bucket array
      end

      ### Hash function ###
      def hash_func(key)
        key % @capacity
      end

      ### Load factor ###
      def load_factor
        @size / @capacity
      end

      ### Find the bucket index for key ###
      def find_bucket(key)
        index = hash_func(key)
        first_tombstone = -1
        # Probe linearly until an empty bucket is reached
        while !@buckets[index].nil?
          # If key is found, return its bucket index
          if @buckets[index].key == key
            # If a tombstone was encountered earlier, move the key-value pair to that index
            if first_tombstone != -1
              @buckets[first_tombstone] = @buckets[index]
              @buckets[index] = TOMBSTONE
              return first_tombstone # Return the bucket index after the move
            end
            return index # Return the bucket index
          end
          # Record the first tombstone encountered
          first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
          # Calculate the bucket index, wrapping to the beginning after the end
          index = (index + 1) % @capacity
        end
        # If key is absent, return the index for insertion
        first_tombstone == -1 ? index : first_tombstone
      end

      ### Lookup operation ###
      def get(key)
        # Find the bucket index for key
        index = find_bucket(key)
        # If the key-value pair is found, return its val
        return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
        # Return nil if the key-value pair does not exist
        nil
      end

      ### Insert operation ###
      def put(key, val)
        # Grow the capacity when the load factor exceeds the threshold
        extend if load_factor > @load_thres
        # Find the bucket index for key
        index = find_bucket(key)
        # If the key-value pair is found, overwrite val and return
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index].val = val
          return
        end
        # If the key-value pair is absent, insert it
        @buckets[index] = Pair.new(key, val)
        @size += 1
      end

      ### Remove operation ###
      def remove(key)
        # Find the bucket index for key
        index = find_bucket(key)
        # If the key-value pair is found, replace it with a tombstone
        unless [nil, TOMBSTONE].include?(@buckets[index])
          @buckets[index] = TOMBSTONE
          @size -= 1
        end
      end

      ### Grow the hash table capacity ###
      def extend
        # Keep a reference to the original hash table
        buckets_tmp = @buckets
        # Initialize a new hash table with the expanded capacity
        @capacity *= @extend_ratio
        @buckets = Array.new(@capacity)
        @size = 0
        # Move the key-value pairs from the original hash table to the new one
        for pair in buckets_tmp
          put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
        end
      end

      ### Print the hash table ###
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

### 2. &nbsp; Quadratic probing

Like linear probing, quadratic probing is a common open-addressing strategy. On a collision, it probes at distances determined by the square of the probe number—$1, 4, 9, \dots$—rather than a fixed step size.

Its main advantages are as follows.

- Squared probe distances aim to reduce the clustering caused by linear probing.
- Larger jumps help distribute entries more evenly while searching for empty positions.

However, quadratic probing is not perfect.

- Clustering still occurs: some positions are more likely to be occupied than others.
- The growing squared distances may prevent probing the entire table, so an empty bucket may remain unreachable.

### 3. &nbsp; Multiple hashing

As its name suggests, multiple hashing probes using several hash functions, $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$.

- **Insertion**: If $f_1(x)$ produces a collision, try $f_2(x)$, and so on, inserting the element when an empty position is found.
- **Lookup**: Try the hash functions in the same order and return when the target is found. If an empty position is reached or all functions have been tried, the target is absent; return `None`.

Multiple hashing is less prone to clustering than linear probing, but computing several hash functions adds overhead.

!!! tip

    All open-addressing strategies—linear probing, quadratic probing, and multiple hashing—share the restriction that elements cannot simply be deleted.

## 6.2.3 &nbsp; Choices made by programming languages

Programming languages use different hash-table implementations. Here are a few examples.

- Python uses open addressing. Its `dict` probes using pseudorandom values.
- Java uses separate chaining. Since JDK 1.8, when a `HashMap`'s underlying array has length at least 64 and a chain reaches length 8, the chain is converted to a red-black tree to improve lookup performance.
- Since Go 1.24, the built-in `map` uses open addressing based on Swiss Tables by default. Go 1.23 and earlier use separate chaining, with up to 8 key-value pairs per bucket and linked overflow buckets when that capacity is exceeded.
