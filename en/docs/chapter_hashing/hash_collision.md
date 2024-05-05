---
comments: true
---

# 6.2 &nbsp; Hash collision

The previous section mentioned that, **in most cases, the input space of a hash function is much larger than the output space**, so theoretically, hash collisions are inevitable. For example, if the input space is all integers and the output space is the size of the array capacity, then multiple integers will inevitably be mapped to the same bucket index.

Hash collisions can lead to incorrect query results, severely impacting the usability of the hash table. To address this issue, whenever a hash collision occurs, we perform hash table resizing until the collision disappears. This approach is pretty simple, straightforward, and working well. However, it appears to be pretty inefficient as the table expansion involves a lot of data migration as well as recalculation of hash code, which are expansive. To improve efficiency, we can adopt the following strategies:

1. Improve the hash table data structure in a way that **locating target element is still functioning well in the event of a hash collision**.
2. Expansion is the last resort before it becomes necessary, when severe collisions are observed.

There are mainly two methods for improving the structure of hash tables: "Separate Chaining" and "Open Addressing".

## 6.2.1 &nbsp; Separate chaining

In the original hash table, each bucket can store only one key-value pair. <u>Separate chaining</u> converts a single element into a linked list, treating key-value pairs as list nodes, storing all colliding key-value pairs in the same linked list. Figure 6-5 shows an example of a hash table with separate chaining.

![Separate chaining hash table](hash_collision.assets/hash_table_chaining.png){ class="animation-figure" }

<p align="center"> Figure 6-5 &nbsp; Separate chaining hash table </p>

The operations of a hash table implemented with separate chaining have changed as follows:

- **Querying Elements**: Input `key`, obtain the bucket index through the hash function, then access the head node of the linked list. Traverse the linked list and compare key to find the target key-value pair.
- **Adding Elements**: Access the head node of the linked list via the hash function, then append the node (key-value pair) to the list.
- **Deleting Elements**: Access the head of the linked list based on the result of the hash function, then traverse the linked list to find the target node and delete it.

Separate chaining has the following limitations:

- **Increased Space Usage**: The linked list contains node pointers, which consume more memory space than arrays.
- **Reduced Query Efficiency**: This is because linear traversal of the linked list is required to find the corresponding element.

The code below provides a simple implementation of a separate chaining hash table, with two things to note:

- Lists (dynamic arrays) are used instead of linked lists for simplicity. In this setup, the hash table (array) contains multiple buckets, each of which is a list.
- This implementation includes a hash table resizing method. When the load factor exceeds $\frac{2}{3}$, we expand the hash table to twice its original size.

=== "Python"

    ```python title="hash_map_chaining.py"
    class HashMapChaining:
        """Chained address hash table"""

        def __init__(self):
            """Constructor"""
            self.size = 0  # Number of key-value pairs
            self.capacity = 4  # Hash table capacity
            self.load_thres = 2.0 / 3.0  # Load factor threshold for triggering expansion
            self.extend_ratio = 2  # Expansion multiplier
            self.buckets = [[] for _ in range(self.capacity)]  # Bucket array

        def hash_func(self, key: int) -> int:
            """Hash function"""
            return key % self.capacity

        def load_factor(self) -> float:
            """Load factor"""
            return self.size / self.capacity

        def get(self, key: int) -> str | None:
            """Query operation"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Traverse the bucket, if the key is found, return the corresponding val
            for pair in bucket:
                if pair.key == key:
                    return pair.val
            # If the key is not found, return None
            return None

        def put(self, key: int, val: str):
            """Add operation"""
            # When the load factor exceeds the threshold, perform expansion
            if self.load_factor() > self.load_thres:
                self.extend()
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Traverse the bucket, if the specified key is encountered, update the corresponding val and return
            for pair in bucket:
                if pair.key == key:
                    pair.val = val
                    return
            # If the key is not found, add the key-value pair to the end
            pair = Pair(key, val)
            bucket.append(pair)
            self.size += 1

        def remove(self, key: int):
            """Remove operation"""
            index = self.hash_func(key)
            bucket = self.buckets[index]
            # Traverse the bucket, remove the key-value pair from it
            for pair in bucket:
                if pair.key == key:
                    bucket.remove(pair)
                    self.size -= 1
                    break

        def extend(self):
            """Extend hash table"""
            # Temporarily store the original hash table
            buckets = self.buckets
            # Initialize the extended new hash table
            self.capacity *= self.extend_ratio
            self.buckets = [[] for _ in range(self.capacity)]
            self.size = 0
            # Move key-value pairs from the original hash table to the new hash table
            for bucket in buckets:
                for pair in bucket:
                    self.put(pair.key, pair.val)

        def print(self):
            """Print hash table"""
            for bucket in self.buckets:
                res = []
                for pair in bucket:
                    res.append(str(pair.key) + " -> " + pair.val)
                print(res)
    ```

=== "C++"

    ```cpp title="hash_map_chaining.cpp"
    [class]{HashMapChaining}-[func]{}
    ```

=== "Java"

    ```java title="hash_map_chaining.java"
    /* Chained address hash table */
    class HashMapChaining {
        int size; // Number of key-value pairs
        int capacity; // Hash table capacity
        double loadThres; // Load factor threshold for triggering expansion
        int extendRatio; // Expansion multiplier
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

        /* Query operation */
        String get(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Traverse the bucket, if the key is found, return the corresponding val
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    return pair.val;
                }
            }
            // If key is not found, return null
            return null;
        }

        /* Add operation */
        void put(int key, String val) {
            // When the load factor exceeds the threshold, perform expansion
            if (loadFactor() > loadThres) {
                extend();
            }
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Traverse the bucket, if the specified key is encountered, update the corresponding val and return
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    pair.val = val;
                    return;
                }
            }
            // If the key is not found, add the key-value pair to the end
            Pair pair = new Pair(key, val);
            bucket.add(pair);
            size++;
        }

        /* Remove operation */
        void remove(int key) {
            int index = hashFunc(key);
            List<Pair> bucket = buckets.get(index);
            // Traverse the bucket, remove the key-value pair from it
            for (Pair pair : bucket) {
                if (pair.key == key) {
                    bucket.remove(pair);
                    size--;
                    break;
                }
            }
        }

        /* Extend hash table */
        void extend() {
            // Temporarily store the original hash table
            List<List<Pair>> bucketsTmp = buckets;
            // Initialize the extended new hash table
            capacity *= extendRatio;
            buckets = new ArrayList<>(capacity);
            for (int i = 0; i < capacity; i++) {
                buckets.add(new ArrayList<>());
            }
            size = 0;
            // Move key-value pairs from the original hash table to the new hash table
            for (List<Pair> bucket : bucketsTmp) {
                for (Pair pair : bucket) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* Print hash table */
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
    [class]{HashMapChaining}-[func]{}
    ```

=== "Go"

    ```go title="hash_map_chaining.go"
    [class]{hashMapChaining}-[func]{}
    ```

=== "Swift"

    ```swift title="hash_map_chaining.swift"
    [class]{HashMapChaining}-[func]{}
    ```

=== "JS"

    ```javascript title="hash_map_chaining.js"
    [class]{HashMapChaining}-[func]{}
    ```

=== "TS"

    ```typescript title="hash_map_chaining.ts"
    [class]{HashMapChaining}-[func]{}
    ```

=== "Dart"

    ```dart title="hash_map_chaining.dart"
    [class]{HashMapChaining}-[func]{}
    ```

=== "Rust"

    ```rust title="hash_map_chaining.rs"
    [class]{HashMapChaining}-[func]{}
    ```

=== "C"

    ```c title="hash_map_chaining.c"
    [class]{Node}-[func]{}

    [class]{HashMapChaining}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="hash_map_chaining.kt"
    [class]{HashMapChaining}-[func]{}
    ```

=== "Ruby"

    ```ruby title="hash_map_chaining.rb"
    [class]{HashMapChaining}-[func]{}
    ```

=== "Zig"

    ```zig title="hash_map_chaining.zig"
    [class]{HashMapChaining}-[func]{}
    ```

It's worth noting that when the linked list is very long, the query efficiency $O(n)$ is poor. **In this case, the list can be converted to an "AVL tree" or "Red-Black tree"** to optimize the time complexity of the query operation to $O(\log n)$.

## 6.2.2 &nbsp; Open addressing

<u>Open addressing</u> does not introduce additional data structures but instead handles hash collisions through "multiple probing". The probing methods mainly include linear probing, quadratic probing, and double hashing.

Let's use linear probing as an example to introduce the mechanism of open addressing hash tables.

### 1. &nbsp; Linear probing

Linear probing uses a fixed-step linear search for probing, differing from ordinary hash tables.

- **Inserting Elements**: Calculate the bucket index using the hash function. If the bucket already contains an element, linearly traverse forward from the conflict position (usually with a step size of $1$) until an empty bucket is found, then insert the element.
- **Searching for Elements**: If a hash collision is encountered, use the same step size to linearly traverse forward until the corresponding element is found and return `value`; if an empty bucket is encountered, it means the target element is not in the hash table, so return `None`.

Figure 6-6 shows the distribution of key-value pairs in an open addressing (linear probing) hash table. According to this hash function, keys with the same last two digits will be mapped to the same bucket. Through linear probing, they are stored sequentially in that bucket and the buckets below it.

![Distribution of key-value pairs in open addressing (linear probing) hash table](hash_collision.assets/hash_table_linear_probing.png){ class="animation-figure" }

<p align="center"> Figure 6-6 &nbsp; Distribution of key-value pairs in open addressing (linear probing) hash table </p>

However, **linear probing is prone to create "clustering"**. Specifically, the longer the continuously occupied positions in the array, the greater the probability of hash collisions occurring in these continuous positions, further promoting the growth of clustering at that position, forming a vicious cycle, and ultimately leading to degraded efficiency of insertion, deletion, query, and update operations.

It's important to note that **we cannot directly delete elements in an open addressing hash table**. Deleting an element creates an empty bucket `None` in the array. When searching for elements, if linear probing encounters this empty bucket, it will return, making the elements below this bucket inaccessible. The program may incorrectly assume these elements do not exist, as shown in Figure 6-7.

![Query issues caused by deletion in open addressing](hash_collision.assets/hash_table_open_addressing_deletion.png){ class="animation-figure" }

<p align="center"> Figure 6-7 &nbsp; Query issues caused by deletion in open addressing </p>

To solve this problem, we can adopt the <u>lazy deletion</u> mechanism: instead of directly removing elements from the hash table, **use a constant `TOMBSTONE` to mark the bucket**. In this mechanism, both `None` and `TOMBSTONE` represent empty buckets and can hold key-value pairs. However, when linear probing encounters `TOMBSTONE`, it should continue traversing since there may still be key-value pairs below it.

However, **lazy deletion may accelerate the performance degradation of the hash table**. Every deletion operation produces a delete mark, and as `TOMBSTONE` increases, the search time will also increase because linear probing may need to skip multiple `TOMBSTONE` to find the target element.

To address this, consider recording the index of the first encountered `TOMBSTONE` during linear probing and swapping the positions of the searched target element with that `TOMBSTONE`. The benefit of doing this is that each time an element is queried or added, the element will be moved to a bucket closer to its ideal position (the starting point of probing), thereby optimizing query efficiency.

The code below implements an open addressing (linear probing) hash table with lazy deletion. To make better use of the hash table space, we treat the hash table as a "circular array,". When going beyond the end of the array, we return to the beginning and continue traversing.

=== "Python"

    ```python title="hash_map_open_addressing.py"
    class HashMapOpenAddressing:
        """Open addressing hash table"""

        def __init__(self):
            """Constructor"""
            self.size = 0  # Number of key-value pairs
            self.capacity = 4  # Hash table capacity
            self.load_thres = 2.0 / 3.0  # Load factor threshold for triggering expansion
            self.extend_ratio = 2  # Expansion multiplier
            self.buckets: list[Pair | None] = [None] * self.capacity  # Bucket array
            self.TOMBSTONE = Pair(-1, "-1")  # Removal mark

        def hash_func(self, key: int) -> int:
            """Hash function"""
            return key % self.capacity

        def load_factor(self) -> float:
            """Load factor"""
            return self.size / self.capacity

        def find_bucket(self, key: int) -> int:
            """Search for the bucket index corresponding to key"""
            index = self.hash_func(key)
            first_tombstone = -1
            # Linear probing, break when encountering an empty bucket
            while self.buckets[index] is not None:
                # If the key is encountered, return the corresponding bucket index
                if self.buckets[index].key == key:
                    # If a removal mark was encountered earlier, move the key-value pair to that index
                    if first_tombstone != -1:
                        self.buckets[first_tombstone] = self.buckets[index]
                        self.buckets[index] = self.TOMBSTONE
                        return first_tombstone  # Return the moved bucket index
                    return index  # Return bucket index
                # Record the first encountered removal mark
                if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                    first_tombstone = index
                # Calculate the bucket index, return to the head if exceeding the tail
                index = (index + 1) % self.capacity
            # If the key does not exist, return the index of the insertion point
            return index if first_tombstone == -1 else first_tombstone

        def get(self, key: int) -> str:
            """Query operation"""
            # Search for the bucket index corresponding to key
            index = self.find_bucket(key)
            # If the key-value pair is found, return the corresponding val
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                return self.buckets[index].val
            # If the key-value pair does not exist, return None
            return None

        def put(self, key: int, val: str):
            """Add operation"""
            # When the load factor exceeds the threshold, perform expansion
            if self.load_factor() > self.load_thres:
                self.extend()
            # Search for the bucket index corresponding to key
            index = self.find_bucket(key)
            # If the key-value pair is found, overwrite val and return
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index].val = val
                return
            # If the key-value pair does not exist, add the key-value pair
            self.buckets[index] = Pair(key, val)
            self.size += 1

        def remove(self, key: int):
            """Remove operation"""
            # Search for the bucket index corresponding to key
            index = self.find_bucket(key)
            # If the key-value pair is found, cover it with a removal mark
            if self.buckets[index] not in [None, self.TOMBSTONE]:
                self.buckets[index] = self.TOMBSTONE
                self.size -= 1

        def extend(self):
            """Extend hash table"""
            # Temporarily store the original hash table
            buckets_tmp = self.buckets
            # Initialize the extended new hash table
            self.capacity *= self.extend_ratio
            self.buckets = [None] * self.capacity
            self.size = 0
            # Move key-value pairs from the original hash table to the new hash table
            for pair in buckets_tmp:
                if pair not in [None, self.TOMBSTONE]:
                    self.put(pair.key, pair.val)

        def print(self):
            """Print hash table"""
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
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Java"

    ```java title="hash_map_open_addressing.java"
    /* Open addressing hash table */
    class HashMapOpenAddressing {
        private int size; // Number of key-value pairs
        private int capacity = 4; // Hash table capacity
        private final double loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
        private final int extendRatio = 2; // Expansion multiplier
        private Pair[] buckets; // Bucket array
        private final Pair TOMBSTONE = new Pair(-1, "-1"); // Removal mark

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

        /* Search for the bucket index corresponding to key */
        private int findBucket(int key) {
            int index = hashFunc(key);
            int firstTombstone = -1;
            // Linear probing, break when encountering an empty bucket
            while (buckets[index] != null) {
                // If the key is encountered, return the corresponding bucket index
                if (buckets[index].key == key) {
                    // If a removal mark was encountered earlier, move the key-value pair to that index
                    if (firstTombstone != -1) {
                        buckets[firstTombstone] = buckets[index];
                        buckets[index] = TOMBSTONE;
                        return firstTombstone; // Return the moved bucket index
                    }
                    return index; // Return bucket index
                }
                // Record the first encountered removal mark
                if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                    firstTombstone = index;
                }
                // Calculate the bucket index, return to the head if exceeding the tail
                index = (index + 1) % capacity;
            }
            // If the key does not exist, return the index of the insertion point
            return firstTombstone == -1 ? index : firstTombstone;
        }

        /* Query operation */
        public String get(int key) {
            // Search for the bucket index corresponding to key
            int index = findBucket(key);
            // If the key-value pair is found, return the corresponding val
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                return buckets[index].val;
            }
            // If the key-value pair does not exist, return null
            return null;
        }

        /* Add operation */
        public void put(int key, String val) {
            // When the load factor exceeds the threshold, perform expansion
            if (loadFactor() > loadThres) {
                extend();
            }
            // Search for the bucket index corresponding to key
            int index = findBucket(key);
            // If the key-value pair is found, overwrite val and return
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index].val = val;
                return;
            }
            // If the key-value pair does not exist, add the key-value pair
            buckets[index] = new Pair(key, val);
            size++;
        }

        /* Remove operation */
        public void remove(int key) {
            // Search for the bucket index corresponding to key
            int index = findBucket(key);
            // If the key-value pair is found, cover it with a removal mark
            if (buckets[index] != null && buckets[index] != TOMBSTONE) {
                buckets[index] = TOMBSTONE;
                size--;
            }
        }

        /* Extend hash table */
        private void extend() {
            // Temporarily store the original hash table
            Pair[] bucketsTmp = buckets;
            // Initialize the extended new hash table
            capacity *= extendRatio;
            buckets = new Pair[capacity];
            size = 0;
            // Move key-value pairs from the original hash table to the new hash table
            for (Pair pair : bucketsTmp) {
                if (pair != null && pair != TOMBSTONE) {
                    put(pair.key, pair.val);
                }
            }
        }

        /* Print hash table */
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
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Go"

    ```go title="hash_map_open_addressing.go"
    [class]{hashMapOpenAddressing}-[func]{}
    ```

=== "Swift"

    ```swift title="hash_map_open_addressing.swift"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "JS"

    ```javascript title="hash_map_open_addressing.js"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "TS"

    ```typescript title="hash_map_open_addressing.ts"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Dart"

    ```dart title="hash_map_open_addressing.dart"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Rust"

    ```rust title="hash_map_open_addressing.rs"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "C"

    ```c title="hash_map_open_addressing.c"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="hash_map_open_addressing.kt"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Ruby"

    ```ruby title="hash_map_open_addressing.rb"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

=== "Zig"

    ```zig title="hash_map_open_addressing.zig"
    [class]{HashMapOpenAddressing}-[func]{}
    ```

### 2. &nbsp; Quadratic probing

Quadratic probing is similar to linear probing and is one of the common strategies of open addressing. When a collision occurs, quadratic probing does not simply skip a fixed number of steps but skips a number of steps equal to the "square of the number of probes", i.e., $1, 4, 9, \dots$ steps.

Quadratic probing has the following advantages:

- Quadratic probing attempts to alleviate the clustering effect of linear probing by skipping the distance of the square of the number of probes.
- Quadratic probing skips larger distances to find empty positions, which helps to distribute data more evenly.

However, quadratic probing is not perfect:

- Clustering still exists, i.e., some positions are more likely to be occupied than others.
- Due to the growth of squares, quadratic probing may not probe the entire hash table, meaning that even if there are empty buckets in the hash table, quadratic probing may not be able to access them.

### 3. &nbsp; Double hashing

As the name suggests, the double hashing method uses multiple hash functions $f_1(x)$, $f_2(x)$, $f_3(x)$, $\dots$ for probing.

- **Inserting Elements**: If hash function $f_1(x)$ encounters a conflict, it tries $f_2(x)$, and so on, until an empty position is found and the element is inserted.
- **Searching for Elements**: Search in the same order of hash functions until the target element is found and returned; if an empty position is encountered or all hash functions have been tried, it indicates the element is not in the hash table, then return `None`.

Compared to linear probing, the double hashing method is less prone to clustering, but multiple hash functions introduce additional computational overhead.

!!! tip

    Please note that open addressing (linear probing, quadratic probing, and double hashing) hash tables all have the problem of "can not directly delete elements."

## 6.2.3 &nbsp; Choice of programming languages

Different programming languages adopt different hash table implementation strategies. Here are a few examples:

- Python uses open addressing. The `dict` dictionary uses pseudo-random numbers for probing.
- Java uses separate chaining. Since JDK 1.8, when the array length in `HashMap` reaches 64 and the length of a linked list reaches 8, the linked list is converted to a red-black tree to improve search performance.
- Go uses separate chaining. Go stipulates that each bucket can store up to 8 key-value pairs, and if the capacity is exceeded, an overflow bucket is linked; when there are too many overflow buckets, a special equal-capacity resizing operation is performed to ensure performance.
