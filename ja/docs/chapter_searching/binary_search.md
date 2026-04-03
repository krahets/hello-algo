---
comments: true
---

# 10.1 &nbsp; 二分探索

<u>二分探索（binary search）</u>は分割統治法に基づく効率的な探索アルゴリズムです。データが整列済みである性質を利用し、各ラウンドで探索範囲を半分に縮小し、目標要素を見つけるか探索区間が空になるまで続けます。

!!! question

    長さ $n$ の配列 `nums` が与えられます。要素は小さい順に並んでおり、重複しません。要素 `target` がこの配列内にある場合はそのインデックスを返し、含まれない場合は $-1$ を返してください。例を次の図に示します。

![二分探索の例](binary_search.assets/binary_search_example.png){ class="animation-figure" }

<p align="center"> 図 10-1 &nbsp; 二分探索の例 </p>

次の図に示すように、まずポインタ $i = 0$ と $j = n - 1$ を初期化し、それぞれ配列の先頭要素と末尾要素を指すようにして、探索区間 $[0, n - 1]$ を表します。角括弧は閉区間を表し、境界値自体を含むことに注意してください。

次に、以下の 2 つの手順を繰り返します。

1. 中央のインデックス $m = \lfloor {(i + j) / 2} \rfloor$ を計算します。ここで $\lfloor \: \rfloor$ は切り捨てを表します。
2. `nums[m]` と `target` の大小関係を判定し、次の 3 つの場合に分かれます。
    1. `nums[m] < target` のとき、`target` は区間 $[m + 1, j]$ にあるため、$i = m + 1$ を実行します。
    2. `nums[m] > target` のとき、`target` は区間 $[i, m - 1]$ にあるため、$j = m - 1$ を実行します。
    3. `nums[m] = target` のとき、`target` が見つかったので、インデックス $m$ を返します。

配列に目標要素が含まれない場合、探索区間は最終的に空まで縮小されます。このとき $-1$ を返します。

=== "<1>"
    ![二分探索の流れ](binary_search.assets/binary_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.png){ class="animation-figure" }

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.png){ class="animation-figure" }

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.png){ class="animation-figure" }

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.png){ class="animation-figure" }

<p align="center"> 図 10-2 &nbsp; 二分探索の流れ </p>

注意すべき点として、$i$ と $j$ はどちらも `int` 型であるため、**$i + j$ が `int` 型の範囲を超える可能性があります**。大きな数によるオーバーフローを避けるため、通常は式 $m = \lfloor {i + (j - i) / 2} \rfloor$ を用いて中点を計算します。

コードは次のとおりです。

=== "Python"

    ```python title="binary_search.py"
    def binary_search(nums: list[int], target: int) -> int:
        """二分探索（両閉区間）"""
        # 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        i, j = 0, len(nums) - 1
        # ループし、探索区間が空になったら終了する（i > j で空）
        while i <= j:
            # 理論上、Python の数値は無限に大きくできるため（メモリ容量に依存）、大きな数のオーバーフローを考慮する必要はない
            m = (i + j) // 2  # 中点インデックス m を計算
            if nums[m] < target:
                i = m + 1  # この場合、target は区間 [m+1, j] にある
            elif nums[m] > target:
                j = m - 1  # この場合、target は区間 [i, m-1] にある
            else:
                return m  # 目標要素が見つかったらそのインデックスを返す
        return -1  # 目標要素が見つからなければ -1 を返す
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* 二分探索（両閉区間） */
    int binarySearch(vector<int> &nums, int target) {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        int i = 0, j = nums.size() - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target)    // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            else // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* 二分探索（両閉区間） */
    int binarySearch(int[] nums, int target) {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        int i = 0, j = nums.length - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            else // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* 二分探索（両閉区間） */
    int BinarySearch(int[] nums, int target) {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        int i = 0, j = nums.Length - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            int m = i + (j - i) / 2;   // 中点インデックス m を計算
            if (nums[m] < target)      // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            else                       // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* 二分探索（両閉区間） */
    func binarySearch(nums []int, target int) int {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        i, j := 0, len(nums)-1
        // ループし、探索区間が空になったら終了する（i > j で空）
        for i <= j {
            m := i + (j-i)/2      // 中点インデックス m を計算
            if nums[m] < target { // この場合、target は区間 [m+1, j] にある
                i = m + 1
            } else if nums[m] > target { // この場合、target は区間 [i, m-1] にある
                j = m - 1
            } else { // 目標要素が見つかったらそのインデックスを返す
                return m
            }
        }
        // 目標要素が見つからなければ -1 を返す
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* 二分探索（両閉区間） */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        var i = nums.startIndex
        var j = nums.endIndex - 1
        // ループし、探索区間が空になったら終了する（i > j で空）
        while i <= j {
            let m = i + (j - i) / 2 // 中点インデックス m を計算
            if nums[m] < target { // この場合、target は区間 [m+1, j] にある
                i = m + 1
            } else if nums[m] > target { // この場合、target は区間 [i, m-1] にある
                j = m - 1
            } else { // 目標要素が見つかったらそのインデックスを返す
                return m
            }
        }
        // 目標要素が見つからなければ -1 を返す
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* 二分探索（両閉区間） */
    function binarySearch(nums, target) {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        let i = 0,
            j = nums.length - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            // 中点インデックス `m` を計算し、`parseInt()` で切り捨てる
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            else if (nums[m] > target)
                // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            else return m; // 目標要素が見つかったらそのインデックスを返す
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* 二分探索（両閉区間） */
    function binarySearch(nums: number[], target: number): number {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        let i = 0,
            j = nums.length - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            // 中点インデックス m を計算
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            } else if (nums[m] > target) {
                // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            } else {
                // 目標要素が見つかったらそのインデックスを返す
                return m;
            }
        }
        return -1; // 目標要素が見つからなければ -1 を返す
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* 二分探索（両閉区間） */
    int binarySearch(List<int> nums, int target) {
      // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
      int i = 0, j = nums.length - 1;
      // ループし、探索区間が空になったら終了する（i > j で空）
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 中点インデックス m を計算
        if (nums[m] < target) {
          // この場合、target は区間 [m+1, j] にある
          i = m + 1;
        } else if (nums[m] > target) {
          // この場合、target は区間 [i, m-1] にある
          j = m - 1;
        } else {
          // 目標要素が見つかったらそのインデックスを返す
          return m;
        }
      }
      // 目標要素が見つからなければ -1 を返す
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* 二分探索（両閉区間） */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        let mut i = 0;
        let mut j = nums.len() as i32 - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while i <= j {
            let m = i + (j - i) / 2; // 中点インデックス m を計算
            if nums[m as usize] < target {
                // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            } else if nums[m as usize] > target {
                // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            } else {
                // 目標要素が見つかったらそのインデックスを返す
                return m;
            }
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* 二分探索（両閉区間） */
    int binarySearch(int *nums, int len, int target) {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        int i = 0, j = len - 1;
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target)    // この場合、target は区間 [m+1, j] にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
                j = m - 1;
            else // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* 二分探索（両閉区間） */
    fun binarySearch(nums: IntArray, target: Int): Int {
        // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
        var i = 0
        var j = nums.size - 1
        // ループし、探索区間が空になったら終了する（i > j で空）
        while (i <= j) {
            val m = i + (j - i) / 2 // 中点インデックス m を計算
            if (nums[m] < target) // この場合、target は区間 [m+1, j] にある
                i = m + 1
            else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
                j = m - 1
            else  // 目標要素が見つかったらそのインデックスを返す
                return m
        }
        // 目標要素が見つからなければ -1 を返す
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### 二分探索（両閉区間） ###
    def binary_search(nums, target)
      # 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
      i, j = 0, nums.length - 1

      # ループし、探索区間が空になったら終了する（i > j で空）
      while i <= j
        # 理論上、Ruby の数値は無限に大きくできるため（メモリ容量に依存）、大きな数のオーバーフローを考慮する必要はない
        m = (i + j) / 2   # 中点インデックス m を計算
      
        if nums[m] < target
          i = m + 1 # この場合、target は区間 [m+1, j] にある
        elsif nums[m] > target
          j = m - 1 # この場合、target は区間 [i, m-1] にある
        else
          return m  # 目標要素が見つかったらそのインデックスを返す
        end
      end

      -1  # 目標要素が見つからなければ -1 を返す
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%20%5B0%2C%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%E3%80%82%E3%81%A4%E3%81%BE%E3%82%8A%20i%2C%20j%20%E3%81%AF%E3%81%9D%E3%82%8C%E3%81%9E%E3%82%8C%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%A8%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%97%E3%80%81%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%EF%BC%88i%20%3E%20j%20%E3%81%A7%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%90%86%E8%AB%96%E4%B8%8A%E3%80%81Python%20%E3%81%AE%E6%95%B0%E5%80%A4%E3%81%AF%E7%84%A1%E9%99%90%E3%81%AB%E5%A4%A7%E3%81%8D%E3%81%8F%E3%81%A7%E3%81%8D%E3%82%8B%E3%81%9F%E3%82%81%EF%BC%88%E3%83%A1%E3%83%A2%E3%83%AA%E5%AE%B9%E9%87%8F%E3%81%AB%E4%BE%9D%E5%AD%98%EF%BC%89%E3%80%81%E5%A4%A7%E3%81%8D%E3%81%AA%E6%95%B0%E3%81%AE%E3%82%AA%E3%83%BC%E3%83%90%E3%83%BC%E3%83%95%E3%83%AD%E3%83%BC%E3%82%92%E8%80%83%E6%85%AE%E3%81%99%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%AF%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums%2C%20target%29%0A%20%20%20%20print%28%22%E5%AF%BE%E8%B1%A1%E8%A6%81%E7%B4%A0%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22%2C%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%20%5B0%2C%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%E3%80%82%E3%81%A4%E3%81%BE%E3%82%8A%20i%2C%20j%20%E3%81%AF%E3%81%9D%E3%82%8C%E3%81%9E%E3%82%8C%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%A8%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%97%E3%80%81%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%EF%BC%88i%20%3E%20j%20%E3%81%A7%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%90%86%E8%AB%96%E4%B8%8A%E3%80%81Python%20%E3%81%AE%E6%95%B0%E5%80%A4%E3%81%AF%E7%84%A1%E9%99%90%E3%81%AB%E5%A4%A7%E3%81%8D%E3%81%8F%E3%81%A7%E3%81%8D%E3%82%8B%E3%81%9F%E3%82%81%EF%BC%88%E3%83%A1%E3%83%A2%E3%83%AA%E5%AE%B9%E9%87%8F%E3%81%AB%E4%BE%9D%E5%AD%98%EF%BC%89%E3%80%81%E5%A4%A7%E3%81%8D%E3%81%AA%E6%95%B0%E3%81%AE%E3%82%AA%E3%83%BC%E3%83%90%E3%83%BC%E3%83%95%E3%83%AD%E3%83%BC%E3%82%92%E8%80%83%E6%85%AE%E3%81%99%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%AF%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums%2C%20target%29%0A%20%20%20%20print%28%22%E5%AF%BE%E8%B1%A1%E8%A6%81%E7%B4%A0%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22%2C%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

**時間計算量は $O(\log n)$** ：二分探索のループでは各ラウンドで区間が半分になるため、ループ回数は $\log_2 n$ です。

**空間計算量は $O(1)$** ：ポインタ $i$ と $j$ に必要なのは定数サイズの空間だけです。

## 10.1.1 &nbsp; 区間の表し方

上記の両閉区間のほかに、一般的な区間表現として「左閉右開」区間があり、$[0, n)$ と定義されます。つまり左端は含み、右端は含みません。この表現では、区間 $[i, j)$ は $i = j$ のとき空です。

この表現に基づいて、同じ機能を持つ二分探索アルゴリズムを実装できます。

=== "Python"

    ```python title="binary_search.py"
    def binary_search_lcro(nums: list[int], target: int) -> int:
        """二分探索（左閉右開区間）"""
        # 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        i, j = 0, len(nums)
        # ループし、探索区間が空になったら終了する（i = j で空）
        while i < j:
            m = (i + j) // 2  # 中点インデックス m を計算
            if nums[m] < target:
                i = m + 1  # この場合、target は区間 [m+1, j) にある
            elif nums[m] > target:
                j = m  # この場合、target は区間 [i, m) にある
            else:
                return m  # 目標要素が見つかったらそのインデックスを返す
        return -1  # 目標要素が見つからなければ -1 を返す
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(vector<int> &nums, int target) {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        int i = 0, j = nums.size();
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target)    // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m) にある
                j = m;
            else // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(int[] nums, int target) {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        int i = 0, j = nums.length;
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m) にある
                j = m;
            else // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* 二分探索（左閉右開区間） */
    int BinarySearchLCRO(int[] nums, int target) {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        int i = 0, j = nums.Length;
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            int m = i + (j - i) / 2;   // 中点インデックス m を計算
            if (nums[m] < target)      // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m) にある
                j = m;
            else                       // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* 二分探索（左閉右開区間） */
    func binarySearchLCRO(nums []int, target int) int {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        i, j := 0, len(nums)
        // ループし、探索区間が空になったら終了する（i = j で空）
        for i < j {
            m := i + (j-i)/2      // 中点インデックス m を計算
            if nums[m] < target { // この場合、target は区間 [m+1, j) にある
                i = m + 1
            } else if nums[m] > target { // この場合、target は区間 [i, m) にある
                j = m
            } else { // 目標要素が見つかったらそのインデックスを返す
                return m
            }
        }
        // 目標要素が見つからなければ -1 を返す
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* 二分探索（左閉右開区間） */
    func binarySearchLCRO(nums: [Int], target: Int) -> Int {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        var i = nums.startIndex
        var j = nums.endIndex
        // ループし、探索区間が空になったら終了する（i = j で空）
        while i < j {
            let m = i + (j - i) / 2 // 中点インデックス m を計算
            if nums[m] < target { // この場合、target は区間 [m+1, j) にある
                i = m + 1
            } else if nums[m] > target { // この場合、target は区間 [i, m) にある
                j = m
            } else { // 目標要素が見つかったらそのインデックスを返す
                return m
            }
        }
        // 目標要素が見つからなければ -1 を返す
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* 二分探索（左閉右開区間） */
    function binarySearchLCRO(nums, target) {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        let i = 0,
            j = nums.length;
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            // 中点インデックス `m` を計算し、`parseInt()` で切り捨てる
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            else if (nums[m] > target)
                // この場合、target は区間 [i, m) にある
                j = m;
            // 目標要素が見つかったらそのインデックスを返す
            else return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* 二分探索（左閉右開区間） */
    function binarySearchLCRO(nums: number[], target: number): number {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        let i = 0,
            j = nums.length;
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            // 中点インデックス m を計算
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            } else if (nums[m] > target) {
                // この場合、target は区間 [i, m) にある
                j = m;
            } else {
                // 目標要素が見つかったらそのインデックスを返す
                return m;
            }
        }
        return -1; // 目標要素が見つからなければ -1 を返す
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(List<int> nums, int target) {
      // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
      int i = 0, j = nums.length;
      // ループし、探索区間が空になったら終了する（i = j で空）
      while (i < j) {
        int m = i + (j - i) ~/ 2; // 中点インデックス m を計算
        if (nums[m] < target) {
          // この場合、target は区間 [m+1, j) にある
          i = m + 1;
        } else if (nums[m] > target) {
          // この場合、target は区間 [i, m) にある
          j = m;
        } else {
          // 目標要素が見つかったらそのインデックスを返す
          return m;
        }
      }
      // 目標要素が見つからなければ -1 を返す
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* 二分探索（左閉右開区間） */
    fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        let mut i = 0;
        let mut j = nums.len() as i32;
        // ループし、探索区間が空になったら終了する（i = j で空）
        while i < j {
            let m = i + (j - i) / 2; // 中点インデックス m を計算
            if nums[m as usize] < target {
                // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            } else if nums[m as usize] > target {
                // この場合、target は区間 [i, m) にある
                j = m;
            } else {
                // 目標要素が見つかったらそのインデックスを返す
                return m;
            }
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* 二分探索（左閉右開区間） */
    int binarySearchLCRO(int *nums, int len, int target) {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        int i = 0, j = len;
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target)    // この場合、target は区間 [m+1, j) にある
                i = m + 1;
            else if (nums[m] > target) // この場合、target は区間 [i, m) にある
                j = m;
            else // 目標要素が見つかったらそのインデックスを返す
                return m;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* 二分探索（左閉右開区間） */
    fun binarySearchLCRO(nums: IntArray, target: Int): Int {
        // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
        var i = 0
        var j = nums.size
        // ループし、探索区間が空になったら終了する（i = j で空）
        while (i < j) {
            val m = i + (j - i) / 2 // 中点インデックス m を計算
            if (nums[m] < target) // この場合、target は区間 [m+1, j) にある
                i = m + 1
            else if (nums[m] > target) // この場合、target は区間 [i, m) にある
                j = m
            else  // 目標要素が見つかったらそのインデックスを返す
                return m
        }
        // 目標要素が見つからなければ -1 を返す
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### 二分探索（左閉右開区間） ###
    def binary_search_lcro(nums, target)
      # 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
      i, j = 0, nums.length

      # ループし、探索区間が空になったら終了する（i = j で空）
      while i < j
        # 中点インデックス m を計算
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # この場合、target は区間 [m+1, j) にある
        elsif nums[m] > target
          j = m - 1 # この場合、target は区間 [i, m) にある
        else
          return m  # 目標要素が見つかったらそのインデックスを返す
        end
      end

      -1  # 目標要素が見つからなければ -1 を返す
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%20%5B0%2C%20n%29%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%E3%80%82%E3%81%A4%E3%81%BE%E3%82%8A%20i%2C%20j%20%E3%81%AF%E3%81%9D%E3%82%8C%E3%81%9E%E3%82%8C%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%A8%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%2B1%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%97%E3%80%81%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%EF%BC%88i%20%3D%20j%20%E3%81%A7%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%29%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m%29%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums%2C%20target%29%0A%20%20%20%20print%28%22%E5%AF%BE%E8%B1%A1%E8%A6%81%E7%B4%A0%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22%2C%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%20%5B0%2C%20n%29%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%E3%80%82%E3%81%A4%E3%81%BE%E3%82%8A%20i%2C%20j%20%E3%81%AF%E3%81%9D%E3%82%8C%E3%81%9E%E3%82%8C%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%A8%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%2B1%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%97%E3%80%81%E6%8E%A2%E7%B4%A2%E5%8C%BA%E9%96%93%E3%81%8C%E7%A9%BA%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%EF%BC%88i%20%3D%20j%20%E3%81%A7%E7%A9%BA%EF%BC%89%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%29%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20%E3%81%93%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m%29%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%81%9D%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20-1%20%20%23%20%E7%9B%AE%E6%A8%99%E8%A6%81%E7%B4%A0%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%20-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%EF%BC%88%E5%B7%A6%E9%96%89%E5%8F%B3%E9%96%8B%E5%8C%BA%E9%96%93%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums%2C%20target%29%0A%20%20%20%20print%28%22%E5%AF%BE%E8%B1%A1%E8%A6%81%E7%B4%A0%206%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20%3D%20%22%2C%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図に示すように、2 種類の区間表現では、二分探索アルゴリズムの初期化、ループ条件、区間の縮小操作がそれぞれ異なります。

「両閉区間」の表現では左右の境界がどちらも閉区間として定義されるため、ポインタ $i$ とポインタ $j$ による区間縮小の操作も対称になります。このほうがミスをしにくいため、**一般には「両閉区間」の書き方を推奨します**。

![2 種類の区間定義](binary_search.assets/binary_search_ranges.png){ class="animation-figure" }

<p align="center"> 図 10-3 &nbsp; 2 種類の区間定義 </p>

## 10.1.2 &nbsp; 利点と限界

二分探索は時間と空間の両面で優れた性能を持ちます。

- 二分探索は時間効率が高いです。データ量が大きい場合、対数時間計算量は大きな優位性を持ちます。たとえば、データサイズ $n = 2^{20}$ のとき、線形探索では $2^{20} = 1048576$ 回のループが必要ですが、二分探索では $\log_2 2^{20} = 20$ 回で済みます。
- 二分探索は追加の空間を必要としません。追加領域を要する探索アルゴリズム（たとえばハッシュ探索）と比べて、二分探索はより省メモリです。

しかし、二分探索があらゆる状況に適しているわけではなく、主な理由は次のとおりです。

- 二分探索は整列済みデータにしか適用できません。入力データが無秩序な場合、二分探索を使うためだけにソートするのは割に合いません。ソートアルゴリズムの時間計算量は通常 $O(n \log n)$ であり、線形探索や二分探索よりも高いからです。要素を頻繁に挿入する場面では、配列の整列性を保つために特定位置へ挿入する必要があり、その時間計算量は $O(n)$ と高コストです。
- 二分探索は配列にしか適していません。二分探索では要素へ飛び飛びにアクセスする必要がありますが、連結リストでそのようなアクセスを行う効率は低いため、連結リストやそれを基に実装されたデータ構造には向きません。
- データ量が小さい場合は線形探索のほうが高性能です。線形探索では各ラウンドで 1 回の比較だけで済みますが、二分探索では 1 回の加算、1 回の除算、1 ~ 3 回の比較、1 回の加算（減算）が必要で、合計 4 ~ 6 個の基本操作になります。したがって、データ量 $n$ が小さいときは、線形探索のほうがかえって速くなります。
