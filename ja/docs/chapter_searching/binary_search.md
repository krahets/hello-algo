---
comments: true
---

# 10.1 &nbsp; 二分探索

<u>二分探索（binary search）</u>は、分割統治法に基づく効率のよい探索アルゴリズムです。データが整列済みであることを利用し、目標の要素が見つかるか探索区間が空になるまで、探索範囲を毎回半分に狭めます。

!!! question "問題"

    長さ $n$ の配列 `nums` が与えられます。要素は小さい順に並び、重複はありません。要素 `target` を探し、配列内のインデックスを返してください。その要素が配列になければ $-1$ を返してください。図 10-1 に例を示します。

![二分探索のサンプルデータ](binary_search.assets/binary_search_example.svg){ class="animation-figure" }

<p align="center"> 図 10-1 &nbsp; 二分探索のサンプルデータ </p>

図 10-2 のように、まずポインタを $i = 0$、$j = n - 1$ と初期化します。それぞれ配列の先頭要素と末尾要素を指し、探索区間 $[0, n - 1]$ を表します。角括弧は両端の値を含む閉区間を表します。

続いて、次の二つの手順を繰り返します。

1. 中央のインデックス $m = \lfloor {(i + j) / 2} \rfloor$ を求めます。ここで $\lfloor \: \rfloor$ は小数点以下を切り捨てる操作を表します。
2. `nums[m]` と `target` の大小関係を調べます。次の三つの場合があります。
    1. `nums[m] < target` のとき、`target` があるとすれば区間 $[m + 1, j]$ 内なので、$i = m + 1$ とします。
    2. `nums[m] > target` のとき、`target` があるとすれば区間 $[i, m - 1]$ 内なので、$j = m - 1$ とします。
    3. `nums[m] = target` のとき、`target` が見つかったのでインデックス $m$ を返します。

配列に目標の要素がなければ、探索区間はやがて空になります。そのときは $-1$ を返します。

=== "<1>"
    ![二分探索の手順](binary_search.assets/binary_search_step1.svg){ class="animation-figure" }

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.svg){ class="animation-figure" }

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.svg){ class="animation-figure" }

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.svg){ class="animation-figure" }

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.svg){ class="animation-figure" }

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.svg){ class="animation-figure" }

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.svg){ class="animation-figure" }

<p align="center"> 図 10-2 &nbsp; 二分探索の手順 </p>

$i$ と $j$ はどちらも `int` 型なので、**$i + j$ が `int` 型で表せる範囲を超える可能性があります**。このオーバーフローを避けるため、通常は $m = \lfloor {i + (j - i) / 2} \rfloor$ という式で中央のインデックスを求めます。

コードを以下に示します。

=== "Python"

    ```python title="binary_search.py"
    def binary_search(nums: list[int], target: int) -> int:
        """二分探索（閉区間）"""
        # 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        i, j = 0, len(nums) - 1
        # 探索区間が空になるまで繰り返す（i > j のとき空）
        while i <= j:
            # Python の整数はメモリが許す限りいくらでも大きくできるため、オーバーフローを考慮する必要はない
            m = (i + j) // 2  # 中央のインデックス m を求める
            if nums[m] < target:
                i = m + 1  # この場合、target の探索範囲は [m+1, j]
            elif nums[m] > target:
                j = m - 1  # この場合、target の探索範囲は [i, m-1]
            else:
                return m  # 目標の要素が見つかったので、そのインデックスを返す
        return -1  # 目標の要素が見つからなかったので -1 を返す
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* 二分探索（閉区間） */
    int binarySearch(vector<int> &nums, int target) {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        int i = 0, j = nums.size() - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target)    // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            else // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* 二分探索（閉区間） */
    int binarySearch(int[] nums, int target) {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        int i = 0, j = nums.length - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target) // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            else // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* 二分探索（閉区間） */
    int BinarySearch(int[] nums, int target) {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        int i = 0, j = nums.Length - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            int m = i + (j - i) / 2;   // 中央のインデックス m を求める
            if (nums[m] < target)      // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            else                       // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* 二分探索（閉区間） */
    func binarySearch(nums []int, target int) int {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        i, j := 0, len(nums)-1
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        for i <= j {
            m := i + (j-i)/2      // 中央のインデックス m を求める
            if nums[m] < target { // この場合、target の探索範囲は [m+1, j]
                i = m + 1
            } else if nums[m] > target { // この場合、target の探索範囲は [i, m-1]
                j = m - 1
            } else { // 目標の要素が見つかったので、そのインデックスを返す
                return m
            }
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* 二分探索（閉区間） */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        var i = nums.startIndex
        var j = nums.endIndex - 1
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while i <= j {
            let m = i + (j - i) / 2 // 中央のインデックス m を求める
            if nums[m] < target { // この場合、target の探索範囲は [m+1, j]
                i = m + 1
            } else if nums[m] > target { // この場合、target の探索範囲は [i, m-1]
                j = m - 1
            } else { // 目標の要素が見つかったので、そのインデックスを返す
                return m
            }
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* 二分探索（閉区間） */
    function binarySearch(nums, target) {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        let i = 0,
            j = nums.length - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            // parseInt() で小数点以下を切り捨て、中央のインデックス m を求める
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            else if (nums[m] > target)
                // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            else return m; // 目標の要素が見つかったので、そのインデックスを返す
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* 二分探索（閉区間） */
    function binarySearch(nums: number[], target: number): number {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        let i = 0,
            j = nums.length - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            // 中央のインデックス m を求める
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            } else if (nums[m] > target) {
                // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            } else {
                // 目標の要素が見つかったので、そのインデックスを返す
                return m;
            }
        }
        return -1; // 目標の要素が見つからなかったので -1 を返す
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* 二分探索（閉区間） */
    int binarySearch(List<int> nums, int target) {
      // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
      int i = 0, j = nums.length - 1;
      // 探索区間が空になるまで繰り返す（i > j のとき空）
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 中央のインデックス m を求める
        if (nums[m] < target) {
          // この場合、target の探索範囲は [m+1, j]
          i = m + 1;
        } else if (nums[m] > target) {
          // この場合、target の探索範囲は [i, m-1]
          j = m - 1;
        } else {
          // 目標の要素が見つかったので、そのインデックスを返す
          return m;
        }
      }
      // 目標の要素が見つからなかったので -1 を返す
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* 二分探索（閉区間） */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        let mut i = 0;
        let mut j = nums.len() as i32 - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while i <= j {
            let m = i + (j - i) / 2; // 中央のインデックス m を求める
            if nums[m as usize] < target {
                // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            } else if nums[m as usize] > target {
                // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            } else {
                // 目標の要素が見つかったので、そのインデックスを返す
                return m;
            }
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* 二分探索（閉区間） */
    int binarySearch(int *nums, int len, int target) {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        int i = 0, j = len - 1;
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target)    // この場合、target の探索範囲は [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m-1]
                j = m - 1;
            else // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* 二分探索（閉区間） */
    fun binarySearch(nums: IntArray, target: Int): Int {
        // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
        var i = 0
        var j = nums.size - 1
        // 探索区間が空になるまで繰り返す（i > j のとき空）
        while (i <= j) {
            val m = i + (j - i) / 2 // 中央のインデックス m を求める
            if (nums[m] < target) // この場合、target の探索範囲は [m+1, j]
                i = m + 1
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m-1]
                j = m - 1
            else  // 目標の要素が見つかったので、そのインデックスを返す
                return m
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### 二分探索（閉区間） ###
    def binary_search(nums, target)
      # 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
      i, j = 0, nums.length - 1

      # 探索区間が空になるまで繰り返す（i > j のとき空）
      while i <= j
        # Ruby の整数はメモリが許す限りいくらでも大きくできるため、オーバーフローを考慮する必要はない
        m = (i + j) / 2   # 中央のインデックス m を求める
      
        if nums[m] < target
          i = m + 1 # この場合、target の探索範囲は [m+1, j]
        elsif nums[m] > target
          j = m - 1 # この場合、target の探索範囲は [i, m-1]
        else
          return m  # 目標の要素が見つかったので、そのインデックスを返す
        end
      end

      -1  # 目標の要素が見つからなかったので -1 を返す
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%81%A7%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81i%20%E3%81%AF%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%80%81j%20%E3%81%AF%E6%9C%AB%E5%B0%BE%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%0A%20%20%20%20%23%20%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%EF%BC%88i%20%3E%20j%20%E3%81%AE%E3%81%A8%E3%81%8D%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20Python%20%E3%81%AE%E6%95%B4%E6%95%B0%E3%81%AF%E3%83%A1%E3%83%A2%E3%83%AA%E3%81%8C%E8%A8%B1%E3%81%99%E9%99%90%E3%82%8A%E3%81%84%E3%81%8F%E3%82%89%E3%81%A7%E3%82%82%E5%A4%A7%E3%81%8D%E3%81%8F%E3%81%A7%E3%81%8D%E3%82%8B%E3%81%9F%E3%82%81%E3%80%81%E3%82%AA%E3%83%BC%E3%83%90%E3%83%BC%E3%83%95%E3%83%AD%E3%83%BC%E3%82%92%E8%80%83%E6%85%AE%E3%81%99%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%AF%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bm%2B1,%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bi,%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E6%A8%99%E5%80%A4%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%81%A7%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81i%20%E3%81%AF%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%80%81j%20%E3%81%AF%E6%9C%AB%E5%B0%BE%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%0A%20%20%20%20%23%20%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%EF%BC%88i%20%3E%20j%20%E3%81%AE%E3%81%A8%E3%81%8D%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20Python%20%E3%81%AE%E6%95%B4%E6%95%B0%E3%81%AF%E3%83%A1%E3%83%A2%E3%83%AA%E3%81%8C%E8%A8%B1%E3%81%99%E9%99%90%E3%82%8A%E3%81%84%E3%81%8F%E3%82%89%E3%81%A7%E3%82%82%E5%A4%A7%E3%81%8D%E3%81%8F%E3%81%A7%E3%81%8D%E3%82%8B%E3%81%9F%E3%82%81%E3%80%81%E3%82%AA%E3%83%BC%E3%83%90%E3%83%BC%E3%83%95%E3%83%AD%E3%83%BC%E3%82%92%E8%80%83%E6%85%AE%E3%81%99%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%AF%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bm%2B1,%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bi,%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E6%A8%99%E5%80%A4%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

**時間計算量は $O(\log n)$** です。二分探索のループでは区間が毎回半分に狭まるので、繰り返し回数は $\log_2 n$ です。

**空間計算量は $O(1)$** です。ポインタ $i$ と $j$ が使う領域の大きさは一定です。

## 10.1.1 &nbsp; 区間の表し方

先ほどの閉区間のほかに、よく使う表し方に「左閉右開区間」があります。$[0, n)$ と表し、左端を含み、右端を含みません。この表し方では、区間 $[i, j)$ は $i = j$ のときに空になります。

この表し方でも、同じ働きをする二分探索を実装できます。

=== "Python"

    ```python title="binary_search.py"
    def binary_search_lcro(nums: list[int], target: int) -> int:
        """二分探索（左閉右開区間）"""
        # 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        i, j = 0, len(nums)
        # 探索区間が空になるまで繰り返す（i = j のとき空）
        while i < j:
            m = (i + j) // 2  # 中央のインデックス m を求める
            if nums[m] < target:
                i = m + 1  # この場合、target の探索範囲は [m+1, j)
            elif nums[m] > target:
                j = m  # この場合、target の探索範囲は [i, m)
            else:
                return m  # 目標の要素が見つかったので、そのインデックスを返す
        return -1  # 目標の要素が見つからなかったので -1 を返す
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(vector<int> &nums, int target) {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        int i = 0, j = nums.size();
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target)    // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m)
                j = m;
            else // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(int[] nums, int target) {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        int i = 0, j = nums.length;
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target) // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m)
                j = m;
            else // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* 二分探索（左閉右開区間） */
    int BinarySearchLCRO(int[] nums, int target) {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        int i = 0, j = nums.Length;
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            int m = i + (j - i) / 2;   // 中央のインデックス m を求める
            if (nums[m] < target)      // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m)
                j = m;
            else                       // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* 二分探索（左閉右開区間） */
    func binarySearchLCRO(nums []int, target int) int {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        i, j := 0, len(nums)
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        for i < j {
            m := i + (j-i)/2      // 中央のインデックス m を求める
            if nums[m] < target { // この場合、target の探索範囲は [m+1, j)
                i = m + 1
            } else if nums[m] > target { // この場合、target の探索範囲は [i, m)
                j = m
            } else { // 目標の要素が見つかったので、そのインデックスを返す
                return m
            }
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* 二分探索（左閉右開区間） */
    func binarySearchLCRO(nums: [Int], target: Int) -> Int {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        var i = nums.startIndex
        var j = nums.endIndex
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while i < j {
            let m = i + (j - i) / 2 // 中央のインデックス m を求める
            if nums[m] < target { // この場合、target の探索範囲は [m+1, j)
                i = m + 1
            } else if nums[m] > target { // この場合、target の探索範囲は [i, m)
                j = m
            } else { // 目標の要素が見つかったので、そのインデックスを返す
                return m
            }
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* 二分探索（左閉右開区間） */
    function binarySearchLCRO(nums, target) {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        let i = 0,
            j = nums.length;
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            // parseInt() で小数点以下を切り捨て、中央のインデックス m を求める
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            else if (nums[m] > target)
                // この場合、target の探索範囲は [i, m)
                j = m;
            // 目標の要素が見つかったので、そのインデックスを返す
            else return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* 二分探索（左閉右開区間） */
    function binarySearchLCRO(nums: number[], target: number): number {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        let i = 0,
            j = nums.length;
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            // 中央のインデックス m を求める
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            } else if (nums[m] > target) {
                // この場合、target の探索範囲は [i, m)
                j = m;
            } else {
                // 目標の要素が見つかったので、そのインデックスを返す
                return m;
            }
        }
        return -1; // 目標の要素が見つからなかったので -1 を返す
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(List<int> nums, int target) {
      // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
      int i = 0, j = nums.length;
      // 探索区間が空になるまで繰り返す（i = j のとき空）
      while (i < j) {
        int m = i + (j - i) ~/ 2; // 中央のインデックス m を求める
        if (nums[m] < target) {
          // この場合、target の探索範囲は [m+1, j)
          i = m + 1;
        } else if (nums[m] > target) {
          // この場合、target の探索範囲は [i, m)
          j = m;
        } else {
          // 目標の要素が見つかったので、そのインデックスを返す
          return m;
        }
      }
      // 目標の要素が見つからなかったので -1 を返す
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* 二分探索（左閉右開区間） */
    fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        let mut i = 0;
        let mut j = nums.len() as i32;
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while i < j {
            let m = i + (j - i) / 2; // 中央のインデックス m を求める
            if nums[m as usize] < target {
                // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            } else if nums[m as usize] > target {
                // この場合、target の探索範囲は [i, m)
                j = m;
            } else {
                // 目標の要素が見つかったので、そのインデックスを返す
                return m;
            }
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(int *nums, int len, int target) {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        int i = 0, j = len;
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target)    // この場合、target の探索範囲は [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m)
                j = m;
            else // 目標の要素が見つかったので、そのインデックスを返す
                return m;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* 二分探索（左閉右開区間） */
    fun binarySearchLCRO(nums: IntArray, target: Int): Int {
        // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
        var i = 0
        var j = nums.size
        // 探索区間が空になるまで繰り返す（i = j のとき空）
        while (i < j) {
            val m = i + (j - i) / 2 // 中央のインデックス m を求める
            if (nums[m] < target) // この場合、target の探索範囲は [m+1, j)
                i = m + 1
            else if (nums[m] > target) // この場合、target の探索範囲は [i, m)
                j = m
            else  // 目標の要素が見つかったので、そのインデックスを返す
                return m
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### 二分探索（左閉右開区間） ###
    def binary_search_lcro(nums, target)
      # 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
      i, j = 0, nums.length

      # 探索区間が空になるまで繰り返す（i = j のとき空）
      while i < j
        # 中央のインデックス m を求める
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # この場合、target の探索範囲は [m+1, j)
        elsif nums[m] > target
          j = m # この場合、target の探索範囲は [i, m)
        else
          return m  # 目標の要素が見つかったので、そのインデックスを返す
        end
      end

      -1  # 目標の要素が見つからなかったので -1 を返す
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%20%5B0,%20n%29%20%E3%81%A7%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81i%20%E3%81%AF%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%80%81j%20%E3%81%AF%E6%9C%AB%E5%B0%BE%E3%81%AE%E4%B8%80%E3%81%A4%E5%85%88%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%0A%20%20%20%20%23%20%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%EF%BC%88i%20%3D%20j%20%E3%81%AE%E3%81%A8%E3%81%8D%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bm%2B1,%20j%29%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bi,%20m%29%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E6%A8%99%E5%80%A4%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%20%5B0,%20n%29%20%E3%81%A7%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81i%20%E3%81%AF%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E3%80%81j%20%E3%81%AF%E6%9C%AB%E5%B0%BE%E3%81%AE%E4%B8%80%E3%81%A4%E5%85%88%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%0A%20%20%20%20%23%20%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%EF%BC%88i%20%3D%20j%20%E3%81%AE%E3%81%A8%E3%81%8D%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bm%2B1,%20j%29%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AE%E6%8E%A2%E7%B4%A2%E7%AF%84%E5%9B%B2%E3%81%AF%20%5Bi,%20m%29%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E6%A8%99%E5%80%A4%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 10-3 のように、どちらの区間を使うかによって、二分探索の初期化、ループ条件、区間の狭め方が変わります。

閉区間は左右の端をどちらも含むので、ポインタ $i$ で区間を狭める操作と、ポインタ $j$ で狭める操作は対称になります。それだけ間違いにくいため、**一般には閉区間を使う書き方を勧めます**。

![二通りの区間の定義](binary_search.assets/binary_search_ranges.svg){ class="animation-figure" }

<p align="center"> 図 10-3 &nbsp; 二通りの区間の定義 </p>

## 10.1.2 &nbsp; 利点と制約

二分探索は時間と記憶領域の両面で効率に優れています。

- 二分探索は高速です。データ量が多いとき、時間計算量が対数オーダーであることは大きな利点です。たとえば、データ数が $n = 2^{20}$ のとき、線形探索ではループが $2^{20} = 1048576$ 回必要ですが、二分探索ではわずか $\log_2 2^{20} = 20$ 回です。
- 二分探索には追加の記憶領域が必要ありません。ハッシュ探索のように追加の領域を使う探索アルゴリズムと比べて、メモリを節約できます。

ただし、二分探索があらゆる場面に適しているわけではありません。主な理由を挙げます。

- 二分探索が使えるのは整列済みのデータに限られます。入力が未整列なら、二分探索のためだけにソートするのは割に合いません。ソートの時間計算量は通常 $O(n \log n)$ で、線形探索よりも二分探索よりも大きいためです。また、頻繁に要素を挿入する場合、配列の順序を保つには決まった位置に要素を挿入する必要があります。これにも $O(n)$ の時間がかかり、負担は大きくなります。
- 二分探索に適しているのは配列です。二分探索では、要素を順番にたどらず、離れた位置に飛んでアクセスします。連結リストでこのようなアクセスを行うと効率が悪いため、連結リストや、それを使って実装したデータ構造には適していません。
- データ量が少ないときは線形探索のほうが高速です。線形探索ではループ 1 回につき判定が 1 回で済みます。二分探索では加算 1 回、除算 1 回、判定 1～3 回、さらに加算または減算が 1 回あり、合計 4～6 回の基本操作が必要です。そのため、データ数 $n$ が小さいときは、かえって線形探索のほうが速くなります。
