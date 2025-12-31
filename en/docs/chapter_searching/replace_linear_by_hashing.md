---
comments: true
---

# 10.4 &nbsp; Hash Optimization Strategy

In algorithm problems, **we often reduce the time complexity of algorithms by replacing linear search with hash-based search**. Let's use an algorithm problem to deepen our understanding.

!!! question

    Given an integer array `nums` and a target element `target`, search for two elements in the array whose "sum" equals `target`, and return their array indices. Any solution will do.

## 10.4.1 &nbsp; Linear Search: Trading Time for Space

Consider directly traversing all possible combinations. As shown in Figure 10-9, we open a two-layer loop and judge in each round whether the sum of two integers equals `target`. If so, return their indices.

![Linear search solution for two sum](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> Figure 10-9 &nbsp; Linear search solution for two sum </p>

The code is shown below:

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """Method 1: Brute force enumeration"""
        # Two nested loops, time complexity is O(n^2)
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* Method 1: Brute force enumeration */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // Two nested loops, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return {i, j};
            }
        }
        return {};
    }
    ```

=== "Java"

    ```java title="two_sum.java"
    /* Method 1: Brute force enumeration */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // Two nested loops, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }
    ```

=== "C#"

    ```csharp title="two_sum.cs"
    /* Method 1: Brute force enumeration */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // Two nested loops, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }
    ```

=== "Go"

    ```go title="two_sum.go"
    /* Method 1: Brute force enumeration */
    func twoSumBruteForce(nums []int, target int) []int {
        size := len(nums)
        // Two nested loops, time complexity is O(n^2)
        for i := 0; i < size-1; i++ {
            for j := i + 1; j < size; j++ {
                if nums[i]+nums[j] == target {
                    return []int{i, j}
                }
            }
        }
        return nil
    }
    ```

=== "Swift"

    ```swift title="two_sum.swift"
    /* Method 1: Brute force enumeration */
    func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
        // Two nested loops, time complexity is O(n^2)
        for i in nums.indices.dropLast() {
            for j in nums.indices.dropFirst(i + 1) {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [0]
    }
    ```

=== "JS"

    ```javascript title="two_sum.js"
    /* Method 1: Brute force enumeration */
    function twoSumBruteForce(nums, target) {
        const n = nums.length;
        // Two nested loops, time complexity is O(n^2)
        for (let i = 0; i < n; i++) {
            for (let j = i + 1; j < n; j++) {
                if (nums[i] + nums[j] === target) {
                    return [i, j];
                }
            }
        }
        return [];
    }
    ```

=== "TS"

    ```typescript title="two_sum.ts"
    /* Method 1: Brute force enumeration */
    function twoSumBruteForce(nums: number[], target: number): number[] {
        const n = nums.length;
        // Two nested loops, time complexity is O(n^2)
        for (let i = 0; i < n; i++) {
            for (let j = i + 1; j < n; j++) {
                if (nums[i] + nums[j] === target) {
                    return [i, j];
                }
            }
        }
        return [];
    }
    ```

=== "Dart"

    ```dart title="two_sum.dart"
    /* Method 1: Brute force enumeration */
    List<int> twoSumBruteForce(List<int> nums, int target) {
      int size = nums.length;
      // Two nested loops, time complexity is O(n^2)
      for (var i = 0; i < size - 1; i++) {
        for (var j = i + 1; j < size; j++) {
          if (nums[i] + nums[j] == target) return [i, j];
        }
      }
      return [0];
    }
    ```

=== "Rust"

    ```rust title="two_sum.rs"
    /* Method 1: Brute force enumeration */
    pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        let size = nums.len();
        // Two nested loops, time complexity is O(n^2)
        for i in 0..size - 1 {
            for j in i + 1..size {
                if nums[i] + nums[j] == target {
                    return Some(vec![i as i32, j as i32]);
                }
            }
        }
        None
    }
    ```

=== "C"

    ```c title="two_sum.c"
    /* Method 1: Brute force enumeration */
    int *twoSumBruteForce(int *nums, int numsSize, int target, int *returnSize) {
        for (int i = 0; i < numsSize; ++i) {
            for (int j = i + 1; j < numsSize; ++j) {
                if (nums[i] + nums[j] == target) {
                    int *res = malloc(sizeof(int) * 2);
                    res[0] = i, res[1] = j;
                    *returnSize = 2;
                    return res;
                }
            }
        }
        *returnSize = 0;
        return NULL;
    }
    ```

=== "Kotlin"

    ```kotlin title="two_sum.kt"
    /* Method 1: Brute force enumeration */
    fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // Two nested loops, time complexity is O(n^2)
        for (i in 0..<size - 1) {
            for (j in i + 1..<size) {
                if (nums[i] + nums[j] == target) return intArrayOf(i, j)
            }
        }
        return IntArray(0)
    }
    ```

=== "Ruby"

    ```ruby title="two_sum.rb"
    ### Method 1: Brute force enumeration ###
    def two_sum_brute_force(nums, target)
      # Two nested loops, time complexity is O(n^2)
      for i in 0...(nums.length - 1)
        for j in (i + 1)...nums.length
          return [i, j] if nums[i] + nums[j] == target
        end
      end

      []
    end
    ```

This method has a time complexity of $O(n^2)$ and a space complexity of $O(1)$, which is very time-consuming with large data volumes.

## 10.4.2 &nbsp; Hash-Based Search: Trading Space for Time

Consider using a hash table where key-value pairs are array elements and element indices respectively. Loop through the array, performing the steps shown in Figure 10-10 in each round:

1. Check if the number `target - nums[i]` is in the hash table. If so, directly return the indices of these two elements.
2. Add the key-value pair `nums[i]` and index `i` to the hash table.

=== "<1>"
    ![Hash table solution for two sum](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> Figure 10-10 &nbsp; Hash table solution for two sum </p>

The implementation code is shown below, requiring only a single loop:

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """Method 2: Auxiliary hash table"""
        # Auxiliary hash table, space complexity is O(n)
        dic = {}
        # Single loop, time complexity is O(n)
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* Method 2: Auxiliary hash table */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // Auxiliary hash table, space complexity is O(n)
        unordered_map<int, int> dic;
        // Single loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.find(target - nums[i]) != dic.end()) {
                return {dic[target - nums[i]], i};
            }
            dic.emplace(nums[i], i);
        }
        return {};
    }
    ```

=== "Java"

    ```java title="two_sum.java"
    /* Method 2: Auxiliary hash table */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // Auxiliary hash table, space complexity is O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // Single loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }
    ```

=== "C#"

    ```csharp title="two_sum.cs"
    /* Method 2: Auxiliary hash table */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // Auxiliary hash table, space complexity is O(n)
        Dictionary<int, int> dic = [];
        // Single loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.ContainsKey(target - nums[i])) {
                return [dic[target - nums[i]], i];
            }
            dic.Add(nums[i], i);
        }
        return [];
    }
    ```

=== "Go"

    ```go title="two_sum.go"
    /* Method 2: Auxiliary hash table */
    func twoSumHashTable(nums []int, target int) []int {
        // Auxiliary hash table, space complexity is O(n)
        hashTable := map[int]int{}
        // Single loop, time complexity is O(n)
        for idx, val := range nums {
            if preIdx, ok := hashTable[target-val]; ok {
                return []int{preIdx, idx}
            }
            hashTable[val] = idx
        }
        return nil
    }
    ```

=== "Swift"

    ```swift title="two_sum.swift"
    /* Method 2: Auxiliary hash table */
    func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
        // Auxiliary hash table, space complexity is O(n)
        var dic: [Int: Int] = [:]
        // Single loop, time complexity is O(n)
        for i in nums.indices {
            if let j = dic[target - nums[i]] {
                return [j, i]
            }
            dic[nums[i]] = i
        }
        return [0]
    }
    ```

=== "JS"

    ```javascript title="two_sum.js"
    /* Method 2: Auxiliary hash table */
    function twoSumHashTable(nums, target) {
        // Auxiliary hash table, space complexity is O(n)
        let m = {};
        // Single loop, time complexity is O(n)
        for (let i = 0; i < nums.length; i++) {
            if (m[target - nums[i]] !== undefined) {
                return [m[target - nums[i]], i];
            } else {
                m[nums[i]] = i;
            }
        }
        return [];
    }
    ```

=== "TS"

    ```typescript title="two_sum.ts"
    /* Method 2: Auxiliary hash table */
    function twoSumHashTable(nums: number[], target: number): number[] {
        // Auxiliary hash table, space complexity is O(n)
        let m: Map<number, number> = new Map();
        // Single loop, time complexity is O(n)
        for (let i = 0; i < nums.length; i++) {
            let index = m.get(target - nums[i]);
            if (index !== undefined) {
                return [index, i];
            } else {
                m.set(nums[i], i);
            }
        }
        return [];
    }
    ```

=== "Dart"

    ```dart title="two_sum.dart"
    /* Method 2: Auxiliary hash table */
    List<int> twoSumHashTable(List<int> nums, int target) {
      int size = nums.length;
      // Auxiliary hash table, space complexity is O(n)
      Map<int, int> dic = HashMap();
      // Single loop, time complexity is O(n)
      for (var i = 0; i < size; i++) {
        if (dic.containsKey(target - nums[i])) {
          return [dic[target - nums[i]]!, i];
        }
        dic.putIfAbsent(nums[i], () => i);
      }
      return [0];
    }
    ```

=== "Rust"

    ```rust title="two_sum.rs"
    /* Method 2: Auxiliary hash table */
    pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        // Auxiliary hash table, space complexity is O(n)
        let mut dic = HashMap::new();
        // Single loop, time complexity is O(n)
        for (i, num) in nums.iter().enumerate() {
            match dic.get(&(target - num)) {
                Some(v) => return Some(vec![*v as i32, i as i32]),
                None => dic.insert(num, i as i32),
            };
        }
        None
    }
    ```

=== "C"

    ```c title="two_sum.c"
    /* Hash table */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // Implemented using uthash.h
    } HashTable;

    /* Hash table lookup */
    HashTable *find(HashTable *h, int key) {
        HashTable *tmp;
        HASH_FIND_INT(h, &key, tmp);
        return tmp;
    }

    /* Hash table element insertion */
    void insert(HashTable **h, int key, int val) {
        HashTable *t = find(*h, key);
        if (t == NULL) {
            HashTable *tmp = malloc(sizeof(HashTable));
            tmp->key = key, tmp->val = val;
            HASH_ADD_INT(*h, key, tmp);
        } else {
            t->val = val;
        }
    }

    /* Method 2: Auxiliary hash table */
    int *twoSumHashTable(int *nums, int numsSize, int target, int *returnSize) {
        HashTable *hashtable = NULL;
        for (int i = 0; i < numsSize; i++) {
            HashTable *t = find(hashtable, target - nums[i]);
            if (t != NULL) {
                int *res = malloc(sizeof(int) * 2);
                res[0] = t->val, res[1] = i;
                *returnSize = 2;
                return res;
            }
            insert(&hashtable, nums[i], i);
        }
        *returnSize = 0;
        return NULL;
    }
    ```

=== "Kotlin"

    ```kotlin title="two_sum.kt"
    /* Method 2: Auxiliary hash table */
    fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // Auxiliary hash table, space complexity is O(n)
        val dic = HashMap<Int, Int>()
        // Single loop, time complexity is O(n)
        for (i in 0..<size) {
            if (dic.containsKey(target - nums[i])) {
                return intArrayOf(dic[target - nums[i]]!!, i)
            }
            dic[nums[i]] = i
        }
        return IntArray(0)
    }
    ```

=== "Ruby"

    ```ruby title="two_sum.rb"
    ### Method 2: Auxiliary hash table ###
    def two_sum_hash_table(nums, target)
      # Auxiliary hash table, space complexity is O(n)
      dic = {}
      # Single loop, time complexity is O(n)
      for i in 0...nums.length
        return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

        dic[nums[i]] = i
      end

      []
    end
    ```

This method reduces the time complexity from $O(n^2)$ to $O(n)$ through hash-based search, greatly improving runtime efficiency.

Since an additional hash table needs to be maintained, the space complexity is $O(n)$. **Nevertheless, this method achieves a more balanced overall time-space efficiency, making it the optimal solution for this problem**.
