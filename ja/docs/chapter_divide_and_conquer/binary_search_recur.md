---
comments: true
---

# 12.2 &nbsp; 分割統治法による探索

これまでに学んだ探索アルゴリズムは、大きく二つに分類できます。

- **総当たり探索**：データ構造全体をたどる方法で、時間計算量は $O(n)$ です。
- **適応的探索**：データの特有の構造や事前に分かっている情報を利用し、時間計算量を $O(\log n)$ や、場合によっては $O(1)$ にまで減らせます。

実際、**時間計算量が $O(\log n)$ の探索アルゴリズムには、分割統治の考え方を使うものが多くあります**。二分探索や木を使った探索がその例です。

- 二分探索では、各段階で「配列内の目的の要素を探す」という問題を「配列の半分で目的の要素を探す」という小さな問題に分けます。配列が空になるか、目的の要素が見つかるまでこれを繰り返します。
- 木は分割統治の考え方をよく表しています。二分探索木、AVL 木、ヒープなどでは、さまざまな操作を $O(\log n)$ の時間で実行できます。

二分探索における分割統治の考え方を整理します。

- **問題を分割できる**：中央の要素と目的の要素を比較し、配列での探索という元の問題を、その半分での探索という部分問題に再帰的に分けます。
- **部分問題が独立している**：各段階で扱う部分問題は一つだけで、ほかの部分問題の影響を受けません。
- **部分問題の解をまとめる必要がない**：二分探索の目的は特定の要素を見つけることなので、解をまとめる必要はありません。部分問題が解けた時点で、元の問題も解けています。

総当たり探索では一度に一つの候補しか除けませんが、**分割統治による探索では一度に候補の半分を除けます**。これが探索効率が上がる理由です。

### 1. &nbsp; 分割統治法による二分探索の実装

以前の章では二分探索を反復で実装しました。ここでは分割統治法を使い、再帰で実装します。

!!! question "問題"

    長さ $n$ のソート済み配列 `nums` が与えられ、すべての値は異なります。要素 `target` を探してください。

分割統治の観点から、探索区間 $[i, j]$ に対応する部分問題を $f(i, j)$ と表します。

元の問題 $f(0, n-1)$ を出発点として、次の手順で二分探索を行います。

1. 探索区間 $[i, j]$ の中央 $m$ を求め、これを使って探索区間の半分を除外します。
2. 規模が半分になった部分問題を再帰的に解きます。対象は $f(i, m-1)$ または $f(m+1, j)$ です。
3. 手順 `1.` と手順 `2.` を繰り返し、`target` が見つかるか区間が空になったら戻ります。

図 12-4 は、配列内の要素 $6$ を二分探索する際の分割統治の過程です。

![二分探索における分割統治の過程](binary_search_recur.assets/binary_search_recur.svg){ class="animation-figure" }

<p align="center"> 図 12-4 &nbsp; 二分探索における分割統治の過程 </p>

実装では、問題 $f(i, j)$ を解く再帰関数 `dfs()` を定義します。

=== "Python"

    ```python title="binary_search_recur.py"
    def dfs(nums: list[int], target: int, i: int, j: int) -> int:
        """二分探索：問題 f(i, j)"""
        # 区間が空なら目的の要素はないので -1 を返す
        if i > j:
            return -1
        # 中央のインデックス m を求める
        m = (i + j) // 2
        if nums[m] < target:
            # 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j)
        elif nums[m] > target:
            # 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1)
        else:
            # 目的の要素が見つかったので、そのインデックスを返す
            return m

    def binary_search(nums: list[int], target: int) -> int:
        """二分探索"""
        n = len(nums)
        # 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1)
    ```

=== "C++"

    ```cpp title="binary_search_recur.cpp"
    /* 二分探索：問題 f(i, j) */
    int dfs(vector<int> &nums, int target, int i, int j) {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1;
        }
        // 中央のインデックス m を求める
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    int binarySearch(vector<int> &nums, int target) {
        int n = nums.size();
        // 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Java"

    ```java title="binary_search_recur.java"
    /* 二分探索：問題 f(i, j) */
    int dfs(int[] nums, int target, int i, int j) {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1;
        }
        // 中央のインデックス m を求める
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "C#"

    ```csharp title="binary_search_recur.cs"
    /* 二分探索：問題 f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1;
        }
        // 中央のインデックス m を求める
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            return DFS(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // 問題 f(0, n-1) を解く
        return DFS(nums, target, 0, n - 1);
    }
    ```

=== "Go"

    ```go title="binary_search_recur.go"
    /* 二分探索：問題 f(i, j) */
    func dfs(nums []int, target, i, j int) int {
        // 区間が空なら目的の要素はないので -1 を返す
        if i > j {
            return -1
        }
        //    中央のインデックスを求める
        m := i + ((j - i) >> 1)
        //中央の要素と目的の要素の大小を比べる
        if nums[m] < target {
            // 中央の要素が小さければ右半分を再帰的に探索する
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m+1, j)
        } else if nums[m] > target {
            // 中央の要素が大きければ左半分を再帰的に探索する
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m-1)
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m
        }
    }

    /* 二分探索 */
    func binarySearch(nums []int, target int) int {
        n := len(nums)
        return dfs(nums, target, 0, n-1)
    }
    ```

=== "Swift"

    ```swift title="binary_search_recur.swift"
    /* 二分探索：問題 f(i, j) */
    func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
        // 区間が空なら目的の要素はないので -1 を返す
        if i > j {
            return -1
        }
        // 中央のインデックス m を求める
        let m = (i + j) / 2
        if nums[m] < target {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums: nums, target: target, i: m + 1, j: j)
        } else if nums[m] > target {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums: nums, target: target, i: i, j: m - 1)
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m
        }
    }

    /* 二分探索 */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // 問題 f(0, n-1) を解く
        dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="binary_search_recur.js"
    /* 二分探索：問題 f(i, j) */
    function dfs(nums, target, i, j) {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1;
        }
        // 中央のインデックス m を求める
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    function binarySearch(nums, target) {
        const n = nums.length;
        // 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "TS"

    ```typescript title="binary_search_recur.ts"
    /* 二分探索：問題 f(i, j) */
    function dfs(nums: number[], target: number, i: number, j: number): number {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1;
        }
        // 中央のインデックス m を求める
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    function binarySearch(nums: number[], target: number): number {
        const n = nums.length;
        // 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Dart"

    ```dart title="binary_search_recur.dart"
    /* 二分探索：問題 f(i, j) */
    int dfs(List<int> nums, int target, int i, int j) {
      // 区間が空なら目的の要素はないので -1 を返す
      if (i > j) {
        return -1;
      }
      // 中央のインデックス m を求める
      int m = (i + j) ~/ 2;
      if (nums[m] < target) {
        // 部分問題 f(m+1, j) を再帰的に解く
        return dfs(nums, target, m + 1, j);
      } else if (nums[m] > target) {
        // 部分問題 f(i, m-1) を再帰的に解く
        return dfs(nums, target, i, m - 1);
      } else {
        // 目的の要素が見つかったので、そのインデックスを返す
        return m;
      }
    }

    /* 二分探索 */
    int binarySearch(List<int> nums, int target) {
      int n = nums.length;
      // 問題 f(0, n-1) を解く
      return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Rust"

    ```rust title="binary_search_recur.rs"
    /* 二分探索：問題 f(i, j) */
    fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
        // 区間が空なら目的の要素はないので -1 を返す
        if i > j {
            return -1;
        }
        let m: i32 = i + (j - i) / 2;
        if nums[m as usize] < target {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j);
        } else if nums[m as usize] > target {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        let n = nums.len() as i32;
        // 問題 f(0, n-1) を解く
        dfs(nums, target, 0, n - 1)
    }
    ```

=== "C"

    ```c title="binary_search_recur.c"
    /* 二分探索：問題 f(i, j) */
    int dfs(int nums[], int target, int i, int j) {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1;
        }
        // 中央のインデックス m を求める
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            return dfs(nums, target, i, m - 1);
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }

    /* 二分探索 */
    int binarySearch(int nums[], int target, int numsSize) {
        int n = numsSize;
        // 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_recur.kt"
    /* 二分探索：問題 f(i, j) */
    fun dfs(
        nums: IntArray,
        target: Int,
        i: Int,
        j: Int
    ): Int {
        // 区間が空なら目的の要素はないので -1 を返す
        if (i > j) {
            return -1
        }
        // 中央のインデックス m を求める
        val m = (i + j) / 2
        return if (nums[m] < target) {
            // 部分問題 f(m+1, j) を再帰的に解く
            dfs(nums, target, m + 1, j)
        } else if (nums[m] > target) {
            // 部分問題 f(i, m-1) を再帰的に解く
            dfs(nums, target, i, m - 1)
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            m
        }
    }

    /* 二分探索 */
    fun binarySearch(nums: IntArray, target: Int): Int {
        val n = nums.size
        // 問題 f(0, n-1) を解く
        return dfs(nums, target, 0, n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_recur.rb"
    ### 二分探索：問題 f(i, j) ###
    def dfs(nums, target, i, j)
      # 区間が空なら目的の要素はないので -1 を返す
      return -1 if i > j
      
      # 中央のインデックス m を求める
      m = (i + j) / 2

      if nums[m] < target
        # 部分問題 f(m+1, j) を再帰的に解く
        return dfs(nums, target, m + 1, j)
      elsif nums[m] > target
        # 部分問題 f(i, m-1) を再帰的に解く
        return dfs(nums, target, i, m - 1)
      else
        # 目的の要素が見つかったので、そのインデックスを返す
        return m
      end
    end

    ### 二分探索 ###
    def binary_search(nums, target)
      n = nums.length
      # 問題 f(0, n-1) を解く
      dfs(nums, target, 0, n - 1)
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28nums%3A%20list%5Bint%5D,%20target%3A%20int,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%9A%E5%95%8F%E9%A1%8C%20f%28i,%20j%29%22%22%22%0A%20%20%20%20%23%20%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AA%E3%82%89%E7%9B%AE%E7%9A%84%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%81%AA%E3%81%84%E3%81%AE%E3%81%A7%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3E%20j%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%0A%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28m%2B1,%20j%29%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A7%A3%E3%81%8F%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20m%20%2B%201,%20j%29%0A%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28i,%20m-1%29%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A7%A3%E3%81%8F%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20i,%20m%20-%201%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20return%20m%0A%0Adef%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%95%8F%E9%A1%8C%20f%280,%20n-1%29%20%E3%82%92%E8%A7%A3%E3%81%8F%0A%20%20%20%20return%20dfs%28nums,%20target,%200,%20n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E4%B8%A1%E7%AB%AF%E3%82%92%E5%90%AB%E3%82%80%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E7%9A%84%E3%81%AE%E8%A6%81%E7%B4%A0%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28nums%3A%20list%5Bint%5D,%20target%3A%20int,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%9A%E5%95%8F%E9%A1%8C%20f%28i,%20j%29%22%22%22%0A%20%20%20%20%23%20%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AA%E3%82%89%E7%9B%AE%E7%9A%84%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%81%AA%E3%81%84%E3%81%AE%E3%81%A7%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3E%20j%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%0A%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28m%2B1,%20j%29%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A7%A3%E3%81%8F%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20m%20%2B%201,%20j%29%0A%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28i,%20m-1%29%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A7%A3%E3%81%8F%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20i,%20m%20-%201%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20return%20m%0A%0Adef%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%95%8F%E9%A1%8C%20f%280,%20n-1%29%20%E3%82%92%E8%A7%A3%E3%81%8F%0A%20%20%20%20return%20dfs%28nums,%20target,%200,%20n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E4%B8%A1%E7%AB%AF%E3%82%92%E5%90%AB%E3%82%80%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E7%9A%84%E3%81%AE%E8%A6%81%E7%B4%A0%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
