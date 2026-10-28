---
comments: true
---

# 10.4 &nbsp; 해시를 이용한 최적화 전략

알고리즘 문제에서는 **선형 탐색을 해시 탐색으로 바꾸어 시간 복잡도를 줄이는 경우가 많다**. 한 가지 문제를 통해 더 자세히 알아보자.

!!! question "문제"

    정수 배열 `nums`와 목표 원소 `target`이 주어진다. 배열에서 '합'이 `target`인 두 원소를 찾아 그 인덱스를 반환하라. 답이 여러 개라면 아무거나 하나를 반환해도 된다.

## 10.4.1 &nbsp; 선형 탐색: 시간을 더 써서 공간 절약

가능한 모든 조합을 직접 순회해 보자. 아래 그림(10-9)과 같이 이중 반복문을 사용하여 매번 두 정수의 합이 `target`인지 확인하고, 맞으면 두 인덱스를 반환한다.

![선형 탐색으로 두 수의 합 구하기](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> 그림 10-9 &nbsp; 선형 탐색으로 두 수의 합 구하기 </p>

코드는 다음과 같다.

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """방법 1: 완전 열거"""
        # 이중 반복문이며 시간 복잡도는 O(n^2)이다
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 방법 1: 완전 열거 */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    func twoSumBruteForce(nums []int, target int) []int {
        size := len(nums)
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    function twoSumBruteForce(nums, target) {
        const n = nums.length;
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    function twoSumBruteForce(nums: number[], target: number): number[] {
        const n = nums.length;
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    List<int> twoSumBruteForce(List<int> nums, int target) {
      int size = nums.length;
      // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
    pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        let size = nums.len();
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    /* 방법 1: 완전 열거 */
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
    /* 방법 1: 완전 열거 */
    fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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
    ### 방법 1: 완전 열거 ###
    def two_sum_brute_force(nums, target)
      # 이중 반복문이며 시간 복잡도는 O(n^2)이다
      for i in 0...(nums.length - 1)
        for j in (i + 1)...nums.length
          return [i, j] if nums[i] + nums[j] == target
        end
      end

      []
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EB%B0%A9%EB%B2%95%201%3A%20%EC%99%84%EC%A0%84%20%EC%97%B4%EA%B1%B0%22%22%22%0A%20%20%20%20%23%20%EC%9D%B4%EC%A4%91%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%B4%EB%A9%B0%20%EC%8B%9C%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%5E2%29%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi,%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums,%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EB%B0%A9%EB%B2%95%201%3A%20%EC%99%84%EC%A0%84%20%EC%97%B4%EA%B1%B0%22%22%22%0A%20%20%20%20%23%20%EC%9D%B4%EC%A4%91%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%B4%EB%A9%B0%20%EC%8B%9C%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%5E2%29%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi,%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums,%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

이 방법의 시간 복잡도는 $O(n^2)$, 공간 복잡도는 $O(1)$이다. 데이터가 많으면 시간이 매우 오래 걸린다.

## 10.4.2 &nbsp; 해시 탐색: 공간을 더 써서 시간 절약

키와 값으로 각각 배열 원소와 그 인덱스를 저장하는 해시 테이블을 사용해 보자. 배열을 순회하면서 매번 아래 그림(10-10)의 단계를 수행한다.

1. 수 `target - nums[i]`가 해시 테이블에 있는지 확인하고, 있으면 두 원소의 인덱스를 바로 반환한다.
2. `nums[i]`와 인덱스 `i`로 이루어진 키-값 쌍을 해시 테이블에 추가한다.

=== "<1>"
    ![보조 해시 테이블로 두 수의 합 구하기](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![해시 테이블로 두 수의 합 구하기 2단계](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![해시 테이블로 두 수의 합 구하기 3단계](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> 그림 10-10 &nbsp; 보조 해시 테이블로 두 수의 합 구하기 </p>

구현 코드는 다음과 같으며, 단일 반복문만 있으면 된다.

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """방법 2: 보조 해시 테이블"""
        # 보조 해시 테이블의 공간 복잡도는 O(n)이다
        dic = {}
        # 단일 반복문이며 시간 복잡도는 O(n)이다
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 방법 2: 보조 해시 테이블 */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        unordered_map<int, int> dic;
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        Map<Integer, Integer> dic = new HashMap<>();
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        Dictionary<int, int> dic = [];
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    func twoSumHashTable(nums []int, target int) []int {
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        hashTable := map[int]int{}
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        var dic: [Int: Int] = [:]
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    function twoSumHashTable(nums, target) {
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        let m = {};
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    function twoSumHashTable(nums: number[], target: number): number[] {
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        let m: Map<number, number> = new Map();
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    List<int> twoSumHashTable(List<int> nums, int target) {
      int size = nums.length;
      // 보조 해시 테이블의 공간 복잡도는 O(n)이다
      Map<int, int> dic = HashMap();
      // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 방법 2: 보조 해시 테이블 */
    pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        let mut dic = HashMap::new();
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    /* 해시 테이블 */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // uthash.h를 기반으로 구현한다
    } HashTable;

    /* 해시 테이블 조회 */
    HashTable *find(HashTable *h, int key) {
        HashTable *tmp;
        HASH_FIND_INT(h, &key, tmp);
        return tmp;
    }

    /* 해시 테이블에 원소 삽입 */
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

    /* 방법 2: 보조 해시 테이블 */
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
    /* 방법 2: 보조 해시 테이블 */
    fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        val dic = HashMap<Int, Int>()
        // 단일 반복문이며 시간 복잡도는 O(n)이다
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
    ### 방법 2: 보조 해시 테이블 ###
    def two_sum_hash_table(nums, target)
      # 보조 해시 테이블의 공간 복잡도는 O(n)이다
      dic = {}
      # 단일 반복문이며 시간 복잡도는 O(n)이다
      for i in 0...nums.length
        return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

        dic[nums[i]] = i
      end

      []
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EB%B0%A9%EB%B2%95%202%3A%20%EB%B3%B4%EC%A1%B0%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%22%22%22%0A%20%20%20%20%23%20%EB%B3%B4%EC%A1%B0%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%98%20%EA%B3%B5%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%29%EC%9D%B4%EB%8B%A4%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%EB%8B%A8%EC%9D%BC%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%B4%EB%A9%B0%20%EC%8B%9C%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%29%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D,%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums,%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%EB%B0%A9%EB%B2%95%202%3A%20%EB%B3%B4%EC%A1%B0%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%22%22%22%0A%20%20%20%20%23%20%EB%B3%B4%EC%A1%B0%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%98%20%EA%B3%B5%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%29%EC%9D%B4%EB%8B%A4%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%EB%8B%A8%EC%9D%BC%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%B4%EB%A9%B0%20%EC%8B%9C%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%29%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D,%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%207,%2011,%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums,%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

이 방법은 해시 탐색으로 시간 복잡도를 $O(n^2)$에서 $O(n)$으로 줄여 실행 효율을 크게 높인다.

해시 테이블을 추가로 유지해야 하므로 공간 복잡도는 $O(n)$이다. **그렇더라도 시간과 공간 효율의 균형이 더 좋으므로 이 문제의 최적 풀이에 해당한다**.
