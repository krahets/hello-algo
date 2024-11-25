---
comments: true
---

# 10.4 &nbsp; 雜湊最佳化策略

在演算法題中，**我們常透過將線性查詢替換為雜湊查詢來降低演算法的時間複雜度**。我們藉助一個演算法題來加深理解。

!!! question

    給定一個整數陣列 `nums` 和一個目標元素 `target` ，請在陣列中搜索“和”為 `target` 的兩個元素，並返回它們的陣列索引。返回任意一個解即可。

## 10.4.1 &nbsp; 線性查詢：以時間換空間

考慮直接走訪所有可能的組合。如圖 10-9 所示，我們開啟一個兩層迴圈，在每輪中判斷兩個整數的和是否為 `target` ，若是，則返回它們的索引。

![線性查詢求解兩數之和](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> 圖 10-9 &nbsp; 線性查詢求解兩數之和 </p>

程式碼如下所示：

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """方法一：暴力列舉"""
        # 兩層迴圈，時間複雜度為 O(n^2)
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 方法一：暴力列舉 */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    func twoSumBruteForce(nums []int, target int) []int {
        size := len(nums)
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    function twoSumBruteForce(nums, target) {
        const n = nums.length;
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    function twoSumBruteForce(nums: number[], target: number): number[] {
        const n = nums.length;
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一： 暴力列舉 */
    List<int> twoSumBruteForce(List<int> nums, int target) {
      int size = nums.length;
      // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
    pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        let size = nums.len();
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    /* 方法一：暴力列舉 */
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
    /* 方法一：暴力列舉 */
    fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // 兩層迴圈，時間複雜度為 O(n^2)
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
    ### 方法一：暴力列舉 ###
    def two_sum_brute_force(nums, target)
      # 兩層迴圈，時間複雜度為 O(n^2)
      for i in 0...(nums.length - 1)
        for j in (i + 1)...nums.length
          return [i, j] if nums[i] + nums[j] == target
        end
      end

      []
    end
    ```

=== "Zig"

    ```zig title="two_sum.zig"
    // 方法一：暴力列舉
    fn twoSumBruteForce(nums: []i32, target: i32) ?[2]i32 {
        var size: usize = nums.len;
        var i: usize = 0;
        // 兩層迴圈，時間複雜度為 O(n^2)
        while (i < size - 1) : (i += 1) {
            var j = i + 1;
            while (j < size) : (j += 1) {
                if (nums[i] + nums[j] == target) {
                    return [_]i32{@intCast(i), @intCast(j)};
                }
            }
        }
        return null;
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%E4%B8%80%EF%BC%9A%E6%9A%B4%E5%8A%9B%E5%88%97%E8%88%89%22%22%22%0A%20%20%20%20%23%20%E5%85%A9%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%8C%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%5E2%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201%2C%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi%2C%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums%2C%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%E4%B8%80%EF%BC%9A%E6%9A%B4%E5%8A%9B%E5%88%97%E8%88%89%22%22%22%0A%20%20%20%20%23%20%E5%85%A9%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%8C%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%5E2%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201%2C%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi%2C%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums%2C%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

此方法的時間複雜度為 $O(n^2)$ ，空間複雜度為 $O(1)$ ，在大資料量下非常耗時。

## 10.4.2 &nbsp; 雜湊查詢：以空間換時間

考慮藉助一個雜湊表，鍵值對分別為陣列元素和元素索引。迴圈走訪陣列，每輪執行圖 10-10 所示的步驟。

1. 判斷數字 `target - nums[i]` 是否在雜湊表中，若是，則直接返回這兩個元素的索引。
2. 將鍵值對 `nums[i]` 和索引 `i` 新增進雜湊表。

=== "<1>"
    ![輔助雜湊表求解兩數之和](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> 圖 10-10 &nbsp; 輔助雜湊表求解兩數之和 </p>

實現程式碼如下所示，僅需單層迴圈即可：

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """方法二：輔助雜湊表"""
        # 輔助雜湊表，空間複雜度為 O(n)
        dic = {}
        # 單層迴圈，時間複雜度為 O(n)
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 方法二：輔助雜湊表 */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // 輔助雜湊表，空間複雜度為 O(n)
        unordered_map<int, int> dic;
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 輔助雜湊表，空間複雜度為 O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 輔助雜湊表，空間複雜度為 O(n)
        Dictionary<int, int> dic = [];
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    func twoSumHashTable(nums []int, target int) []int {
        // 輔助雜湊表，空間複雜度為 O(n)
        hashTable := map[int]int{}
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
        // 輔助雜湊表，空間複雜度為 O(n)
        var dic: [Int: Int] = [:]
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    function twoSumHashTable(nums, target) {
        // 輔助雜湊表，空間複雜度為 O(n)
        let m = {};
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    function twoSumHashTable(nums: number[], target: number): number[] {
        // 輔助雜湊表，空間複雜度為 O(n)
        let m: Map<number, number> = new Map();
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二： 輔助雜湊表 */
    List<int> twoSumHashTable(List<int> nums, int target) {
      int size = nums.length;
      // 輔助雜湊表，空間複雜度為 O(n)
      Map<int, int> dic = HashMap();
      // 單層迴圈，時間複雜度為 O(n)
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
    /* 方法二：輔助雜湊表 */
    pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        // 輔助雜湊表，空間複雜度為 O(n)
        let mut dic = HashMap::new();
        // 單層迴圈，時間複雜度為 O(n)
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
    /* 雜湊表 */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // 基於 uthash.h 實現
    } HashTable;

    /* 雜湊表查詢 */
    HashTable *find(HashTable *h, int key) {
        HashTable *tmp;
        HASH_FIND_INT(h, &key, tmp);
        return tmp;
    }

    /* 雜湊表元素插入 */
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

    /* 方法二：輔助雜湊表 */
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
    /* 方法二：輔助雜湊表 */
    fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // 輔助雜湊表，空間複雜度為 O(n)
        val dic = HashMap<Int, Int>()
        // 單層迴圈，時間複雜度為 O(n)
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
    ### 方法二：輔助雜湊表 ###
    def two_sum_hash_table(nums, target)
      # 輔助雜湊表，空間複雜度為 O(n)
      dic = {}
      # 單層迴圈，時間複雜度為 O(n)
      for i in 0...nums.length
        return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

        dic[nums[i]] = i
      end

      []
    end
    ```

=== "Zig"

    ```zig title="two_sum.zig"
    // 方法二：輔助雜湊表
    fn twoSumHashTable(nums: []i32, target: i32) !?[2]i32 {
        var size: usize = nums.len;
        // 輔助雜湊表，空間複雜度為 O(n)
        var dic = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
        defer dic.deinit();
        var i: usize = 0;
        // 單層迴圈，時間複雜度為 O(n)
        while (i < size) : (i += 1) {
            if (dic.contains(target - nums[i])) {
                return [_]i32{dic.get(target - nums[i]).?, @intCast(i)};
            }
            try dic.put(nums[i], @intCast(i));
        }
        return null;
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%E4%BA%8C%EF%BC%9A%E8%BC%94%E5%8A%A9%E9%9B%9C%E6%B9%8A%E8%A1%A8%22%22%22%0A%20%20%20%20%23%20%E8%BC%94%E5%8A%A9%E9%9B%9C%E6%B9%8A%E8%A1%A8%EF%BC%8C%E7%A9%BA%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%29%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%E5%96%AE%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%8C%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D%2C%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums%2C%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%E4%BA%8C%EF%BC%9A%E8%BC%94%E5%8A%A9%E9%9B%9C%E6%B9%8A%E8%A1%A8%22%22%22%0A%20%20%20%20%23%20%E8%BC%94%E5%8A%A9%E9%9B%9C%E6%B9%8A%E8%A1%A8%EF%BC%8C%E7%A9%BA%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%29%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%E5%96%AE%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%8C%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E7%82%BA%20O%28n%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D%2C%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums%2C%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

此方法透過雜湊查詢將時間複雜度從 $O(n^2)$ 降至 $O(n)$ ，大幅提升執行效率。

由於需要維護一個額外的雜湊表，因此空間複雜度為 $O(n)$ 。**儘管如此，該方法的整體時空效率更為均衡，因此它是本題的最優解法**。
