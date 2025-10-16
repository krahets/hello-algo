---
comments: true
---

# 10.4 &nbsp; ハッシュ最適化戦略

アルゴリズム問題において、**線形探索をハッシュベースの探索に置き換えることで、アルゴリズムの時間計算量を削減することがよくあります**。アルゴリズム問題を使用して理解を深めましょう。

!!! question

    整数配列`nums`と目標要素`target`が与えられ、配列内で「和」が`target`に等しい2つの要素を探索し、それらの配列インデックスを返してください。任意の解が受け入れられます。

## 10.4.1 &nbsp; 線形探索：時間を空間と交換

すべての可能な組み合わせを直接横断することを考えてみます。下図に示すように、ネストしたループを開始し、各反復で2つの整数の和が`target`に等しいかどうかを判断します。そうであれば、それらのインデックスを返します。

![Linear search solution for two-sum problem](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> 図 10-9 &nbsp; Linear search solution for two-sum problem </p>

コードは以下の通りです：

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """方法一：ブルートフォース列挙"""
        # 二重ループ、時間計算量は O(n^2)
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 方法一：ブルートフォース列挙 */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // 二重ループ、時間計算量はO(n^2)
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
    /* 方法一: 暴力列挙 */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 二重ループ、時間計算量は O(n^2)
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
    [class]{two_sum}-[func]{TwoSumBruteForce}
    ```

=== "Go"

    ```go title="two_sum.go"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Swift"

    ```swift title="two_sum.swift"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "JS"

    ```javascript title="two_sum.js"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "TS"

    ```typescript title="two_sum.ts"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Dart"

    ```dart title="two_sum.dart"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Rust"

    ```rust title="two_sum.rs"
    [class]{}-[func]{two_sum_brute_force}
    ```

=== "C"

    ```c title="two_sum.c"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Kotlin"

    ```kotlin title="two_sum.kt"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Ruby"

    ```ruby title="two_sum.rb"
    [class]{}-[func]{two_sum_brute_force}
    ```

=== "Zig"

    ```zig title="two_sum.zig"
    [class]{}-[func]{twoSumBruteForce}
    ```

この方法の時間計算量は$O(n^2)$、空間計算量は$O(1)$で、大容量データでは非常に時間がかかる可能性があります。

## 10.4.2 &nbsp; ハッシュ探索：空間を時間と交換

ハッシュテーブルの使用を考えてみましょう。キーと値のペアはそれぞれ配列要素とそのインデックスです。配列をループし、各反復中に下図に示すステップを実行します。

1. 数値`target - nums[i]`がハッシュテーブルにあるかどうかを確認します。ある場合は、これら2つの要素のインデックスを直接返します。
2. キーと値のペア`nums[i]`とインデックス`i`をハッシュテーブルに追加します。

=== "<1>"
    ![Help hash table solve two-sum](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> 図 10-10 &nbsp; Help hash table solve two-sum </p>

実装コードは以下に示され、単一のループのみが必要です：

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """方法二：補助ハッシュテーブル"""
        # 補助ハッシュテーブル、空間計算量は O(n)
        dic = {}
        # 単一ループ、時間計算量は O(n)
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* 方法二：補助ハッシュテーブル */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // 補助ハッシュテーブル、空間計算量はO(n)
        unordered_map<int, int> dic;
        // 単層ループ、時間計算量はO(n)
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
    /* 方法二: 補助ハッシュテーブル */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 補助ハッシュテーブル、空間計算量は O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // 単一層ループ、時間計算量は O(n)
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
    [class]{two_sum}-[func]{TwoSumHashTable}
    ```

=== "Go"

    ```go title="two_sum.go"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Swift"

    ```swift title="two_sum.swift"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "JS"

    ```javascript title="two_sum.js"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "TS"

    ```typescript title="two_sum.ts"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Dart"

    ```dart title="two_sum.dart"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Rust"

    ```rust title="two_sum.rs"
    [class]{}-[func]{two_sum_hash_table}
    ```

=== "C"

    ```c title="two_sum.c"
    [class]{HashTable}-[func]{}

    [class]{}-[func]{twoSumHashTable}
    ```

=== "Kotlin"

    ```kotlin title="two_sum.kt"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Ruby"

    ```ruby title="two_sum.rb"
    [class]{}-[func]{two_sum_hash_table}
    ```

=== "Zig"

    ```zig title="two_sum.zig"
    [class]{}-[func]{twoSumHashTable}
    ```

この方法は、ハッシュ探索を使用することで時間計算量を$O(n^2)$から$O(n)$に削減し、実行時効率を大幅に向上させます。

追加のハッシュテーブルを維持する必要があるため、空間計算量は$O(n)$です。**それにもかかわらず、この方法は全体的により均衡のとれた時空間効率を持ち、この問題の最適解となります**。
