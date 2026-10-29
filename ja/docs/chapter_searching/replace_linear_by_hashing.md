---
comments: true
---

# 10.4 &nbsp; ハッシュを使った最適化

アルゴリズムの問題では、**線形探索をハッシュ探索に置き換えることで、時間計算量を減らす方法をよく使います**。一つの問題を通して理解を深めましょう。

!!! question "問題"

    整数配列 `nums` と目標要素 `target` が与えられます。配列内から和が `target` になる二つの要素を探し、それぞれのインデックスを返してください。解はいずれか一つでかまいません。

## 10.4.1 &nbsp; 線形探索：時間を使って領域を節約する

すべての組み合わせを直接調べることを考えます。図 10-9 のように二重ループを使い、各反復で二つの整数の和が `target` かどうかを判定し、そうであればインデックスを返します。

![線形探索で二数の和を求める](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> 図 10-9 &nbsp; 線形探索で二数の和を求める </p>

コードは次のとおりです。

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """方法 1：総当たり列挙"""
        # 二重ループのため、時間計算量は O(n^2)
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 方法 1：総当たり列挙 */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    func twoSumBruteForce(nums []int, target int) []int {
        size := len(nums)
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    function twoSumBruteForce(nums, target) {
        const n = nums.length;
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    function twoSumBruteForce(nums: number[], target: number): number[] {
        const n = nums.length;
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    List<int> twoSumBruteForce(List<int> nums, int target) {
      int size = nums.length;
      // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
    pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        let size = nums.len();
        // 二重ループのため、時間計算量は O(n^2)
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
    /* 方法 1：総当たり列挙 */
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
    /* 方法 1：総当たり列挙 */
    fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // 二重ループのため、時間計算量は O(n^2)
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
    ### 方法 1：総当たり列挙 ###
    def two_sum_brute_force(nums, target)
      # 二重ループのため、時間計算量は O(n^2)
      for i in 0...(nums.length - 1)
        for j in (i + 1)...nums.length
          return [i, j] if nums[i] + nums[j] == target
        end
      end

      []
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%201%EF%BC%9A%E7%B7%8F%E5%BD%93%E3%81%9F%E3%82%8A%E5%88%97%E6%8C%99%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E9%87%8D%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E3%81%9F%E3%82%81%E3%80%81%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%E3%81%AF%20O%28n%5E2%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi,%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums,%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%201%EF%BC%9A%E7%B7%8F%E5%BD%93%E3%81%9F%E3%82%8A%E5%88%97%E6%8C%99%22%22%22%0A%20%20%20%20%23%20%E4%BA%8C%E9%87%8D%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E3%81%9F%E3%82%81%E3%80%81%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%E3%81%AF%20O%28n%5E2%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi,%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums,%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

この方法の時間計算量は $O(n^2)$、空間計算量は $O(1)$ であり、データが多いと非常に時間がかかります。

## 10.4.2 &nbsp; ハッシュ探索：領域を使って時間を節約する

配列の要素をキー、そのインデックスを値とするハッシュテーブルを使うことを考えます。配列をループで走査し、各反復で図 10-10 の手順を実行します。

1. 数値 `target - nums[i]` がハッシュテーブルにあるか調べ、あれば二つの要素のインデックスをそのまま返します。
2. `nums[i]` とインデックス `i` のペアをハッシュテーブルに追加します。

=== "<1>"
    ![補助ハッシュテーブルで二数の和を求める](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![ハッシュテーブルによる二数の和の探索の手順 2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![ハッシュテーブルによる二数の和の探索の手順 3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> 図 10-10 &nbsp; 補助ハッシュテーブルで二数の和を求める </p>

実装は次のとおりで、一重のループだけで済みます。

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """方法 2：補助ハッシュテーブル"""
        # 補助ハッシュテーブルの空間計算量は O(n)
        dic = {}
        # 一重ループのため、時間計算量は O(n)
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 方法 2：補助ハッシュテーブル */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // 補助ハッシュテーブルの空間計算量は O(n)
        unordered_map<int, int> dic;
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 補助ハッシュテーブルの空間計算量は O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 補助ハッシュテーブルの空間計算量は O(n)
        Dictionary<int, int> dic = [];
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    func twoSumHashTable(nums []int, target int) []int {
        // 補助ハッシュテーブルの空間計算量は O(n)
        hashTable := map[int]int{}
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
        // 補助ハッシュテーブルの空間計算量は O(n)
        var dic: [Int: Int] = [:]
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    function twoSumHashTable(nums, target) {
        // 補助ハッシュテーブルの空間計算量は O(n)
        let m = {};
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    function twoSumHashTable(nums: number[], target: number): number[] {
        // 補助ハッシュテーブルの空間計算量は O(n)
        let m: Map<number, number> = new Map();
        // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    List<int> twoSumHashTable(List<int> nums, int target) {
      int size = nums.length;
      // 補助ハッシュテーブルの空間計算量は O(n)
      Map<int, int> dic = HashMap();
      // 一重ループのため、時間計算量は O(n)
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
    /* 方法 2：補助ハッシュテーブル */
    pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        // 補助ハッシュテーブルの空間計算量は O(n)
        let mut dic = HashMap::new();
        // 一重ループのため、時間計算量は O(n)
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
    /* ハッシュテーブル */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // uthash.h を用いて実装する
    } HashTable;

    /* ハッシュテーブルから取得する */
    HashTable *find(HashTable *h, int key) {
        HashTable *tmp;
        HASH_FIND_INT(h, &key, tmp);
        return tmp;
    }

    /* ハッシュテーブルに要素を挿入する */
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

    /* 方法 2：補助ハッシュテーブル */
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
    /* 方法 2：補助ハッシュテーブル */
    fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // 補助ハッシュテーブルの空間計算量は O(n)
        val dic = HashMap<Int, Int>()
        // 一重ループのため、時間計算量は O(n)
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
    ### 方法 2：補助ハッシュテーブル ###
    def two_sum_hash_table(nums, target)
      # 補助ハッシュテーブルの空間計算量は O(n)
      dic = {}
      # 一重ループのため、時間計算量は O(n)
      for i in 0...nums.length
        return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

        dic[nums[i]] = i
      end

      []
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%202%EF%BC%9A%E8%A3%9C%E5%8A%A9%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%22%22%22%0A%20%20%20%20%23%20%E8%A3%9C%E5%8A%A9%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AE%E7%A9%BA%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%E3%81%AF%20O%28n%29%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%E4%B8%80%E9%87%8D%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E3%81%9F%E3%82%81%E3%80%81%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%E3%81%AF%20O%28n%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D,%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums,%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E6%96%B9%E6%B3%95%202%EF%BC%9A%E8%A3%9C%E5%8A%A9%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%22%22%22%0A%20%20%20%20%23%20%E8%A3%9C%E5%8A%A9%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AE%E7%A9%BA%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%E3%81%AF%20O%28n%29%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%E4%B8%80%E9%87%8D%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E3%81%9F%E3%82%81%E3%80%81%E6%99%82%E9%96%93%E8%A8%88%E7%AE%97%E9%87%8F%E3%81%AF%20O%28n%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D,%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums,%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

この方法では、ハッシュ探索によって時間計算量を $O(n^2)$ から $O(n)$ に減らし、実行効率を大きく向上させています。

追加のハッシュテーブルを維持する必要があるため、空間計算量は $O(n)$ です。**それでも、時間と空間の効率のバランスがよいため、この問題の最適な解法となります**。
