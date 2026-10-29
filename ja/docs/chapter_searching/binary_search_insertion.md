---
comments: true
---

# 10.2 &nbsp; 二分探索で挿入位置を探す

二分探索は目的の要素を探すだけでなく、その挿入位置を探すなど、多くの派生問題にも利用できます。

## 10.2.1 &nbsp; 重複する要素がない場合

!!! question "問題"

    長さ $n$ の整列済み配列 `nums` と要素 `target` が与えられます。配列内に重複する要素はありません。整列状態を保ちながら、`target` を配列 `nums` に挿入します。すでに `target` が存在する場合は、その左側に挿入します。挿入後の `target` のインデックスを返してください。例を図 10-4 に示します。

![二分探索で挿入位置を探す入力例](binary_search_insertion.assets/binary_search_insertion_example.png){ class="animation-figure" }

<p align="center"> 図 10-4 &nbsp; 二分探索で挿入位置を探す入力例 </p>

前節の二分探索のコードを再利用するには、次の二つの問いに答える必要があります。

**問い一**：配列に `target` が含まれる場合、挿入位置のインデックスはその要素のインデックスでしょうか。

問題では、等しい要素の左に `target` を挿入するよう求めています。つまり、新しく挿入した `target` が元の `target` の位置に入ります。したがって、**配列に `target` が含まれる場合、挿入位置はその `target` のインデックスです**。

**問い二**：配列に `target` が存在しない場合、挿入位置はどの要素のインデックスでしょうか。

二分探索の過程をさらに考えてみましょう。`nums[m] < target` のとき $i$ が移動するということは、ポインタ $i$ が `target` 以上の要素へ近づいているということです。同様に、ポインタ $j$ は常に `target` 以下の要素へ近づいています。

したがって、二分探索が終わると、$i$ は `target` より大きい最初の要素を、$j$ は `target` より小さい最も右の要素を指します。**配列に `target` が含まれない場合、挿入位置のインデックスは $i$ だと分かります**。コードは次のとおりです。

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion_simple(nums: list[int], target: int) -> int:
        """二分探索による挿入位置の探索（重複要素がない場合）"""
        i, j = 0, len(nums) - 1  # 閉区間 [0, n-1] を初期化する
        while i <= j:
            m = (i + j) // 2  # 中央のインデックス m を計算する
            if nums[m] < target:
                i = m + 1  # target は区間 [m+1, j] に存在する
            elif nums[m] > target:
                j = m - 1  # target は区間 [i, m-1] に存在する
            else:
                return m  # target が見つかったので、挿入位置 m を返す
        # target が見つからなかったので、挿入位置 i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    int binarySearchInsertionSimple(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    func binarySearchInsertionSimple(nums []int, target int) int {
        // 閉区間 [0, n-1] を初期化する
        i, j := 0, len(nums)-1
        for i <= j {
            // 中央のインデックス m を計算する
            m := i + (j-i)/2
            if nums[m] < target {
                // target は区間 [m+1, j] に存在する
                i = m + 1
            } else if nums[m] > target {
                // target は区間 [i, m-1] に存在する
                j = m - 1
            } else {
                // target が見つかったので、挿入位置 m を返す
                return m
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
        // 閉区間 [0, n-1] を初期化する
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 中央のインデックス m を計算する
            if nums[m] < target {
                i = m + 1 // target は区間 [m+1, j] に存在する
            } else if nums[m] > target {
                j = m - 1 // target は区間 [i, m-1] に存在する
            } else {
                return m // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    function binarySearchInsertionSimple(nums, target) {
        let i = 0,
            j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 中央のインデックス m を計算し、Math.floor() で小数点以下を切り捨てる
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    function binarySearchInsertionSimple(
        nums: Array<number>,
        target: number
    ): number {
        let i = 0,
            j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 中央のインデックス m を計算し、Math.floor() で小数点以下を切り捨てる
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    int binarySearchInsertionSimple(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
          i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
          j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
          return m; // target が見つかったので、挿入位置 m を返す
        }
      }
      // target が見つからなかったので、挿入位置 i を返す
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 閉区間 [0, n-1] を初期化する
        while i <= j {
            let m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if nums[m as usize] < target {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if nums[m as usize] > target {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m;
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    int binarySearchInsertionSimple(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            val m = i + (j - i) / 2 // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1 // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1 // target は区間 [i, m-1] に存在する
            } else {
                return m // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### 二分探索による挿入位置の探索（重複要素がない場合） ###
    def binary_search_insertion_simple(nums, target)
      # 閉区間 [0, n-1] を初期化する
      i, j = 0, nums.length - 1

      while i <= j
        # 中央のインデックス m を計算する
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target は区間 [m+1, j] に存在する
        elsif nums[m] > target
          j = m - 1 # target は区間 [i, m-1] に存在する
        else
          return m  # target が見つかったので、挿入位置 m を返す
        end
      end

      i # target が見つからなかったので、挿入位置 i を返す
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20m%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%AE%E3%81%AA%E3%81%84%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums,%20target%29%0A%20%20%20%20print%28f%22%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20m%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%AE%E3%81%AA%E3%81%84%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums,%20target%29%0A%20%20%20%20print%28f%22%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 10.2.2 &nbsp; 重複する要素がある場合

!!! question "問題"

    前の問題で、配列に重複する要素が含まれる可能性があるものとし、ほかの条件は変えません。

配列に複数の `target` があると、通常の二分探索ではそのうち一つのインデックスしか返せず、**その左右にいくつの `target` があるかは分かりません**。

問題では同じ要素の最も左に挿入するよう求めているため、**配列内で最も左の `target` のインデックスを探す必要があります**。まず、図 10-5 の手順を考えてみます。

1. 二分探索でいずれかの `target` のインデックスを求め、$k$ とします。
2. インデックス $k$ から左へ線形に走査し、最も左の `target` が見つかったら返します。

![線形探索で重複する要素の挿入位置を探す](binary_search_insertion.assets/binary_search_insertion_naive.png){ class="animation-figure" }

<p align="center"> 図 10-5 &nbsp; 線形探索で重複する要素の挿入位置を探す </p>

この方法でも求められますが、線形探索を含むため時間計算量は $O(n)$ です。配列に `target` が多数重複している場合、効率が低くなります。

そこで、二分探索のコードを拡張します。図 10-6 のように全体の流れは変えず、各反復で中点のインデックス $m$ を計算し、`target` と `nums[m]` の大小関係を判定します。次の場合に分かれます。

- `nums[m] < target` または `nums[m] > target` の場合、まだ `target` が見つかっていないので、通常の二分探索と同じ操作で区間を縮めます。**これにより、ポインタ $i$ と $j$ が `target` へ近づきます**。
- `nums[m] == target` の場合、`target` より小さい要素は区間 $[i, m - 1]$ にあるので、$j = m - 1$ として区間を縮めます。**これにより、ポインタ $j$ が `target` より小さい要素へ近づきます**。

ループが終わると、$i$ は最も左の `target` を、$j$ は `target` より小さい最も右の要素を指します。**したがって、インデックス $i$ が挿入位置です**。

=== "<1>"
    ![二分探索で重複する要素の挿入位置を探す手順](binary_search_insertion.assets/binary_search_insertion_step1.png){ class="animation-figure" }

=== "<2>"
    ![二分探索による挿入位置の探索の手順 2](binary_search_insertion.assets/binary_search_insertion_step2.png){ class="animation-figure" }

=== "<3>"
    ![二分探索による挿入位置の探索の手順 3](binary_search_insertion.assets/binary_search_insertion_step3.png){ class="animation-figure" }

=== "<4>"
    ![二分探索による挿入位置の探索の手順 4](binary_search_insertion.assets/binary_search_insertion_step4.png){ class="animation-figure" }

=== "<5>"
    ![二分探索による挿入位置の探索の手順 5](binary_search_insertion.assets/binary_search_insertion_step5.png){ class="animation-figure" }

=== "<6>"
    ![二分探索による挿入位置の探索の手順 6](binary_search_insertion.assets/binary_search_insertion_step6.png){ class="animation-figure" }

=== "<7>"
    ![二分探索による挿入位置の探索の手順 7](binary_search_insertion.assets/binary_search_insertion_step7.png){ class="animation-figure" }

=== "<8>"
    ![二分探索による挿入位置の探索の手順 8](binary_search_insertion.assets/binary_search_insertion_step8.png){ class="animation-figure" }

<p align="center"> 図 10-6 &nbsp; 二分探索で重複する要素の挿入位置を探す手順 </p>

以下のコードを見ると、条件分岐 `nums[m] > target` と `nums[m] == target` では同じ操作を行うため、二つをまとめられます。

それでも、条件を分けたままにしておけば、論理が明確で読みやすくなります。

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion(nums: list[int], target: int) -> int:
        """二分探索による挿入位置の探索（重複要素がある場合）"""
        i, j = 0, len(nums) - 1  # 閉区間 [0, n-1] を初期化する
        while i <= j:
            m = (i + j) // 2  # 中央のインデックス m を計算する
            if nums[m] < target:
                i = m + 1  # target は区間 [m+1, j] に存在する
            elif nums[m] > target:
                j = m - 1  # target は区間 [i, m-1] に存在する
            else:
                j = m - 1  # target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        # 挿入位置 i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    int binarySearchInsertion(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    func binarySearchInsertion(nums []int, target int) int {
        // 閉区間 [0, n-1] を初期化する
        i, j := 0, len(nums)-1
        for i <= j {
            // 中央のインデックス m を計算する
            m := i + (j-i)/2
            if nums[m] < target {
                // target は区間 [m+1, j] に存在する
                i = m + 1
            } else if nums[m] > target {
                // target は区間 [i, m-1] に存在する
                j = m - 1
            } else {
                // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
                j = m - 1
            }
        }
        // 挿入位置 i を返す
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    func binarySearchInsertion(nums: [Int], target: Int) -> Int {
        // 閉区間 [0, n-1] を初期化する
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 中央のインデックス m を計算する
            if nums[m] < target {
                i = m + 1 // target は区間 [m+1, j] に存在する
            } else if nums[m] > target {
                j = m - 1 // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1 // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    function binarySearchInsertion(nums, target) {
        let i = 0,
            j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 中央のインデックス m を計算し、Math.floor() で小数点以下を切り捨てる
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    function binarySearchInsertion(nums: Array<number>, target: number): number {
        let i = 0,
            j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 中央のインデックス m を計算し、Math.floor() で小数点以下を切り捨てる
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    int binarySearchInsertion(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
          i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
          j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
          j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
      }
      // 挿入位置 i を返す
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 閉区間 [0, n-1] を初期化する
        while i <= j {
            let m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if nums[m as usize] < target {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if nums[m as usize] > target {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    int binarySearchInsertion(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    fun binarySearchInsertion(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            val m = i + (j - i) / 2 // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1 // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1 // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1 // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### 二分探索による挿入位置の探索（重複要素がある場合） ###
    def binary_search_insertion(nums, target)
      # 閉区間 [0, n-1] を初期化する
      i, j = 0, nums.length - 1

      while i <= j
        # 中央のインデックス m を計算する
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target は区間 [m+1, j] に存在する
        elsif nums[m] > target
          j = m - 1 # target は区間 [i, m-1] に存在する
        else
          j = m - 1 # target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        end
      end

      i # 挿入位置 i を返す
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%80%81%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20print%28f%22%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%80%81%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20print%28f%22%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

!!! tip "ヒント"

    この節のコードはすべて両端を含む閉区間で書いています。興味があれば、左閉右開の書き方でも実装してみてください。

全体として見ると、二分探索は、ポインタ $i$ と $j$ にそれぞれ探索目標を定めるものにすぎません。目標は特定の要素（例えば `target`）である場合も、要素の範囲（例えば `target` より小さい要素）である場合もあります。

二分を繰り返す中で、ポインタ $i$ と $j$ はあらかじめ定めた目標に近づいていきます。最終的には答えを見つけるか、境界を越えて停止します。
