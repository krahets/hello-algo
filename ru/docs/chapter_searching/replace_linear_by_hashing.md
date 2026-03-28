---
comments: true
---

# 10.4 &nbsp; Стратегии хеш-оптимизации

В алгоритмических задачах **мы часто заменяем линейный поиск на хеш-поиск, чтобы уменьшить временную сложность алгоритма**. Разберем одну задачу, чтобы лучше понять этот прием.

!!! question

    Дан массив целых чисел `nums` и целевой элемент `target` . Найдите в массиве два элемента, сумма которых равна `target` , и верните их индексы. Подойдет любой корректный ответ.

## 10.4.1 &nbsp; Линейный поиск: обмен времени на пространство

Рассмотрим прямой перебор всех возможных комбинаций. Как показано на рисунке 10-9, мы запускаем два вложенных цикла и на каждом шаге проверяем, равна ли сумма двух целых чисел `target` ; если да, то возвращаем их индексы.

![Линейный поиск для задачи о двух суммах](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> Рисунок 10-9 &nbsp; Линейный поиск для задачи о двух суммах </p>

Код приведен ниже:

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """Метод 1: полный перебор"""
        # Два вложенных цикла, временная сложность O(n^2)
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* Метод 1: полный перебор */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    func twoSumBruteForce(nums []int, target int) []int {
        size := len(nums)
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    function twoSumBruteForce(nums, target) {
        const n = nums.length;
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    function twoSumBruteForce(nums: number[], target: number): number[] {
        const n = nums.length;
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Способ 1: полный перебор */
    List<int> twoSumBruteForce(List<int> nums, int target) {
      int size = nums.length;
      // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
    pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        let size = nums.len();
        // Два вложенных цикла, временная сложность O(n^2)
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
    /* Метод 1: полный перебор */
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
    /* Метод 1: полный перебор */
    fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // Два вложенных цикла, временная сложность O(n^2)
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
    =begin
    File: two_sum.rb
    Created Time: 2024-04-09
    Author: Blue Bean (lonnnnnnner@gmail.com)
    =end

    # ## Метод 1: полный перебор ###
    def two_sum_brute_force(nums, target)
      # Два вложенных цикла, временная сложность O(n^2)
      for i in 0...(nums.length - 1)
        for j in (i + 1)...nums.length
          return [i, j] if nums[i] + nums[j] == target
        end
      end

      []
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%201%3A%20%D0%BF%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%22%22%22%0A%20%20%20%20%23%20%D0%94%D0%B2%D0%B0%20%D0%B2%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%BD%D1%8B%D1%85%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B0%2C%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%5E2%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201%2C%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi%2C%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums%2C%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_brute_force%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%201%3A%20%D0%BF%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%22%22%22%0A%20%20%20%20%23%20%D0%94%D0%B2%D0%B0%20%D0%B2%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%BD%D1%8B%D1%85%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B0%2C%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%5E2%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201%2C%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%2B%20nums%5Bj%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bi%2C%20j%5D%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_brute_force%28nums%2C%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Временная сложность этого метода равна $O(n^2)$ , а пространственная сложность равна $O(1)$ , поэтому на больших объемах данных он очень медленный.

## 10.4.2 &nbsp; Хеш-поиск: обмен пространства на время

Рассмотрим вариант с использованием хеш-таблицы, где ключами и значениями будут элементы массива и их индексы. При циклическом обходе массива на каждом шаге выполняются действия, показанные на рисунке 10-10.

1. Проверить, находится ли число `target - nums[i]` в хеш-таблице; если да, то сразу вернуть индексы этих двух элементов.
2. Добавить в хеш-таблицу пару из ключа `nums[i]` и индекса `i` .

=== "<1>"
    ![Вспомогательная хеш-таблица для задачи о двух суммах](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> Рисунок 10-10 &nbsp; Вспомогательная хеш-таблица для задачи о двух суммах </p>

Код реализации показан ниже, и для него достаточно одного цикла:

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """Метод 2: вспомогательная хеш-таблица"""
        # Вспомогательная хеш-таблица, пространственная сложность O(n)
        dic = {}
        # Один цикл, временная сложность O(n)
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* Метод 2: вспомогательная хеш-таблица */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        unordered_map<int, int> dic;
        // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        Dictionary<int, int> dic = [];
        // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    func twoSumHashTable(nums []int, target int) []int {
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        hashTable := map[int]int{}
        // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        var dic: [Int: Int] = [:]
        // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    function twoSumHashTable(nums, target) {
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        let m = {};
        // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    function twoSumHashTable(nums: number[], target: number): number[] {
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        let m: Map<number, number> = new Map();
        // Один цикл, временная сложность O(n)
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
    /* Способ 2: вспомогательная хеш-таблица */
    List<int> twoSumHashTable(List<int> nums, int target) {
      int size = nums.length;
      // Вспомогательная хеш-таблица, пространственная сложность O(n)
      Map<int, int> dic = HashMap();
      // Один цикл, временная сложность O(n)
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
    /* Метод 2: вспомогательная хеш-таблица */
    pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        let mut dic = HashMap::new();
        // Один цикл, временная сложность O(n)
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
    /* Хеш-таблица */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // Реализовано на основе uthash.h
    } HashTable;

    /* Поиск в хеш-таблице */
    HashTable *find(HashTable *h, int key) {
        HashTable *tmp;
        HASH_FIND_INT(h, &key, tmp);
        return tmp;
    }

    /* Вставка элемента в хеш-таблицу */
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

    /* Метод 2: вспомогательная хеш-таблица */
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
    /* Метод 2: вспомогательная хеш-таблица */
    fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
        val size = nums.size
        // Вспомогательная хеш-таблица, пространственная сложность O(n)
        val dic = HashMap<Int, Int>()
        // Один цикл, временная сложность O(n)
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
    =begin
    File: two_sum.rb
    Created Time: 2024-04-09
    Author: Blue Bean (lonnnnnnner@gmail.com)
    =end

    # ## Метод 1: полный перебор ###
    def two_sum_brute_force(nums, target)
      # Два вложенных цикла, временная сложность O(n^2)
      for i in 0...(nums.length - 1)
        for j in (i + 1)...nums.length
          return [i, j] if nums[i] + nums[j] == target
        end
      end

      []
    end

    # ## Метод 2: вспомогательная хеш-таблица ###
    def two_sum_hash_table(nums, target)
      # Вспомогательная хеш-таблица, пространственная сложность O(n)
      dic = {}
      # Один цикл, временная сложность O(n)
      for i in 0...nums.length
        return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

        dic[nums[i]] = i
      end

      []
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%202%3A%20%D0%B2%D1%81%D0%BF%D0%BE%D0%BC%D0%BE%D0%B3%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%92%D1%81%D0%BF%D0%BE%D0%BC%D0%BE%D0%B3%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%2C%20%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%29%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%D0%9E%D0%B4%D0%B8%D0%BD%20%D1%86%D0%B8%D0%BA%D0%BB%2C%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D%2C%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums%2C%20target%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20two_sum_hash_table%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%202%3A%20%D0%B2%D1%81%D0%BF%D0%BE%D0%BC%D0%BE%D0%B3%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%92%D1%81%D0%BF%D0%BE%D0%BC%D0%BE%D0%B3%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%2C%20%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%29%0A%20%20%20%20dic%20%3D%20%7B%7D%0A%20%20%20%20%23%20%D0%9E%D0%B4%D0%B8%D0%BD%20%D1%86%D0%B8%D0%BA%D0%BB%2C%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%29%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20nums%5Bi%5D%20in%20dic%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20%5Bdic%5Btarget%20-%20nums%5Bi%5D%5D%2C%20i%5D%0A%20%20%20%20%20%20%20%20dic%5Bnums%5Bi%5D%5D%20%3D%20i%0A%20%20%20%20return%20%5B%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%207%2C%2011%2C%2015%5D%0A%20%20%20%20target%20%3D%2013%0A%20%20%20%20res%20%3D%20two_sum_hash_table%28nums%2C%20target%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Благодаря хеш-поиску этот метод снижает временную сложность с $O(n^2)$ до $O(n)$ , существенно повышая эффективность работы.

Поскольку требуется поддерживать дополнительную хеш-таблицу, пространственная сложность составляет $O(n)$ . **Несмотря на это, в целом данный метод лучше сбалансирован по времени и памяти, поэтому именно он является оптимальным решением этой задачи**.
