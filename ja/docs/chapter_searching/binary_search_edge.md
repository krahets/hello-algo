---
comments: true
---

# 10.3 &nbsp; 二分探索の境界

## 10.3.1 &nbsp; 左端境界を探す

!!! question

    長さ $n$ のソート済み配列 `nums` が与えられ、その中には重複要素が含まれる可能性があります。配列内で最も左にある要素 `target` のインデックスを返してください。配列にこの要素が含まれない場合は、$-1$ を返します。

二分探索で挿入位置を求める方法を思い出すと、探索完了後に $i$ は最も左にある `target` を指します。**したがって、挿入位置を探すことの本質は、最も左にある `target` のインデックスを探すことです**。

挿入位置を探す関数を使って左端境界を求めることを考えます。なお、配列に `target` が含まれない場合があり、そのときは次の 2 つの結果が起こりえます。

- 挿入位置のインデックス $i$ が範囲外になる。
- 要素 `nums[i]` が `target` と等しくない。

上の 2 つの状況に当てはまる場合は、直接 $-1$ を返せば十分です。コードは以下のとおりです：

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """最も左の target を二分探索"""
        # target の挿入位置を探すのと等価
        i = binary_search_insertion(nums, target)
        # target が見つからなければ、-1 を返す
        if i == len(nums) or nums[i] != target:
            return -1
        # target が見つかったら、インデックス i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 最も左の target を二分探索 */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // target の挿入位置を探すのと等価
        int i = binarySearchInsertion(nums, target);
        // target が見つからなければ、-1 を返す
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 最も左の target を二分探索 */
    int binarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すのと等価
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target が見つからなければ、-1 を返す
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 最も左の target を二分探索 */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すのと等価
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // target が見つからなければ、-1 を返す
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 最も左の target を二分探索 */
    func binarySearchLeftEdge(nums []int, target int) int {
        // target の挿入位置を探すのと等価
        i := binarySearchInsertion(nums, target)
        // target が見つからなければ、-1 を返す
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // target が見つかったら、インデックス i を返す
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 最も左の target を二分探索 */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // target の挿入位置を探すのと等価
        let i = binarySearchInsertion(nums: nums, target: target)
        // target が見つからなければ、-1 を返す
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // target が見つかったら、インデックス i を返す
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 最も左の target を二分探索 */
    function binarySearchLeftEdge(nums, target) {
        // target の挿入位置を探すのと等価
        const i = binarySearchInsertion(nums, target);
        // target が見つからなければ、-1 を返す
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 最も左の target を二分探索 */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // target の挿入位置を探すのと等価
        const i = binarySearchInsertion(nums, target);
        // target が見つからなければ、-1 を返す
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 最も左の target を二分探索 */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // target の挿入位置を探すのと等価
      int i = binarySearchInsertion(nums, target);
      // target が見つからなければ、-1 を返す
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // target が見つかったら、インデックス i を返す
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 最も左の target を二分探索 */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // target の挿入位置を探すのと等価
        let i = binary_search_insertion(nums, target);
        // target が見つからなければ、-1 を返す
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 最も左の target を二分探索 */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // target の挿入位置を探すのと等価
        int i = binarySearchInsertion(nums, numSize, target);
        // target が見つからなければ、-1 を返す
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 最も左の target を二分探索 */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // target の挿入位置を探すのと等価
        val i = binarySearchInsertion(nums, target)
        // target が見つからなければ、-1 を返す
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // target が見つかったら、インデックス i を返す
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### target の最左位置を二分探索 ###
    def binary_search_left_edge(nums, target)
      # target の挿入位置を探すのと等価
      i = binary_search_insertion(nums, target)

      # target が見つからなければ、-1 を返す
      return -1 if i == nums.length || nums[i] != target

      i # target が見つかったら、インデックス i を返す
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%82%E3%82%8A%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%20%5B0%2C%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AE%20target%20%E3%82%92%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20target%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%E3%81%AE%E3%81%A8%E7%AD%89%E4%BE%A1%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E7%AB%AF%E3%81%A8%E5%8F%B3%E7%AB%AF%E3%82%92%E6%8E%A2%E3%81%99%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E7%AB%AF%E3%81%AE%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%82%E3%82%8A%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%20%5B0%2C%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AE%20target%20%E3%82%92%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20target%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%E3%81%AE%E3%81%A8%E7%AD%89%E4%BE%A1%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E7%AB%AF%E3%81%A8%E5%8F%B3%E7%AB%AF%E3%82%92%E6%8E%A2%E3%81%99%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E7%AB%AF%E3%81%AE%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 10.3.2 &nbsp; 右端境界を探す

では、最も右にある `target` はどのように探せるでしょうか。最も直接的な方法はコードを修正し、`nums[m] == target` の場合のポインタの縮小操作を置き換えることです。ここではコードを省略するので、興味があれば自分で実装してみてください。

ここでは、より巧妙な 2 つの方法を紹介します。

### 1. &nbsp; 左端境界探索を再利用する

実際には、最も左の要素を探す関数を利用して最も右の要素を探せます。具体的には、**最も右にある `target` を探すことを、最も左にある `target + 1` を探すことに変換します**。

下図のように、探索完了後、ポインタ $i$ は最も左にある `target + 1`（存在する場合）を指し、$j$ は最も右にある `target` を指します。**したがって $j$ を返せばよいです**。

![右端境界の探索を左端境界の探索に変換する](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> 図 10-7 &nbsp; 右端境界の探索を左端境界の探索に変換する </p>

返される挿入位置は $i$ なので、そこから $1$ を引いて $j$ を得る必要があることに注意してください：

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """最も右の target を二分探索"""
        # 最左の target + 1 を探す問題に変換する
        i = binary_search_insertion(nums, target + 1)
        # j は最も右の target を指し、i は target より大きい最初の要素を指す
        j = i - 1
        # target が見つからなければ、-1 を返す
        if j == -1 or nums[j] != target:
            return -1
        # target が見つかったら、インデックス j を返す
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 最も右の target を二分探索 */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // 最左の target + 1 を探す問題に変換する
        int i = binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 最も右の target を二分探索 */
    int binarySearchRightEdge(int[] nums, int target) {
        // 最左の target + 1 を探す問題に変換する
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 最も右の target を二分探索 */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 最左の target + 1 を探す問題に変換する
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 最も右の target を二分探索 */
    func binarySearchRightEdge(nums []int, target int) int {
        // 最左の target + 1 を探す問題に変換する
        i := binarySearchInsertion(nums, target+1)
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        j := i - 1
        // target が見つからなければ、-1 を返す
        if j == -1 || nums[j] != target {
            return -1
        }
        // target が見つかったら、インデックス j を返す
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 最も右の target を二分探索 */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // 最左の target + 1 を探す問題に変換する
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        let j = i - 1
        // target が見つからなければ、-1 を返す
        if j == -1 || nums[j] != target {
            return -1
        }
        // target が見つかったら、インデックス j を返す
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 最も右の target を二分探索 */
    function binarySearchRightEdge(nums, target) {
        // 最左の target + 1 を探す問題に変換する
        const i = binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        const j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 最も右の target を二分探索 */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // 最左の target + 1 を探す問題に変換する
        const i = binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        const j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 最も右の target を二分探索 */
    int binarySearchRightEdge(List<int> nums, int target) {
      // 最左の target + 1 を探す問題に変換する
      int i = binarySearchInsertion(nums, target + 1);
      // j は最も右の target を指し、i は target より大きい最初の要素を指す
      int j = i - 1;
      // target が見つからなければ、-1 を返す
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // target が見つかったら、インデックス j を返す
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 最も右の target を二分探索 */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // 最左の target + 1 を探す問題に変換する
        let i = binary_search_insertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        let j = i - 1;
        // target が見つからなければ、-1 を返す
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 最も右の target を二分探索 */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // 最左の target + 1 を探す問題に変換する
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 最も右の target を二分探索 */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // 最左の target + 1 を探す問題に変換する
        val i = binarySearchInsertion(nums, target + 1)
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        val j = i - 1
        // target が見つからなければ、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // target が見つかったら、インデックス j を返す
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### target の最右位置を二分探索 ###
    def binary_search_right_edge(nums, target)
      # 最左の target + 1 を探す問題に変換する
      i = binary_search_insertion(nums, target + 1)

      # j は最も右の target を指し、i は target より大きい最初の要素を指す
      j = i - 1

      # target が見つからなければ、-1 を返す
      return -1 if j == -1 || nums[j] != target

      j # target が見つかったら、インデックス j を返す
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%82%E3%82%8A%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%20%5B0%2C%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AE%20target%20%E3%82%92%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E6%9C%80%E5%B7%A6%E3%81%AE%20target%20%2B%201%20%E3%82%92%E6%8E%A2%E3%81%99%E5%95%8F%E9%A1%8C%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E3%81%AF%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AE%20target%20%E3%82%92%E6%8C%87%E3%81%97%E3%80%81i%20%E3%81%AF%20target%20%E3%82%88%E3%82%8A%E5%A4%A7%E3%81%8D%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20j%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E7%AB%AF%E3%81%A8%E5%8F%B3%E7%AB%AF%E3%82%92%E6%8E%A2%E3%81%99%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%8F%B3%E7%AB%AF%E3%81%AE%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%82%E3%82%8A%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E4%B8%A1%E9%96%89%E5%8C%BA%E9%96%93%20%5B0%2C%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%E4%B8%AD%E7%82%B9%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi%2C%20m-1%5D%20%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AE%20target%20%E3%82%92%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E6%9C%80%E5%B7%A6%E3%81%AE%20target%20%2B%201%20%E3%82%92%E6%8E%A2%E3%81%99%E5%95%8F%E9%A1%8C%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E3%81%AF%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AE%20target%20%E3%82%92%E6%8C%87%E3%81%97%E3%80%81i%20%E3%81%AF%20target%20%E3%82%88%E3%82%8A%E5%A4%A7%E3%81%8D%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20j%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E7%AB%AF%E3%81%A8%E5%8F%B3%E7%AB%AF%E3%82%92%E6%8E%A2%E3%81%99%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%8F%B3%E7%AB%AF%E3%81%AE%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 2. &nbsp; 要素探索に変換する

配列に `target` が含まれない場合、最終的に $i$ と $j$ はそれぞれ `target` より大きい最初の要素と、`target` より小さい最初の要素を指すことになります。

したがって、下図のように、配列中に存在しない要素を構成して、それを使って左右の境界を探せます。

- 最も左にある `target` の探索：`target - 0.5` を探すことに変換でき、ポインタ $i$ を返します。
- 最も右にある `target` の探索：`target + 0.5` を探すことに変換でき、ポインタ $j$ を返します。

![境界の探索を要素の探索に変換する](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> 図 10-8 &nbsp; 境界の探索を要素の探索に変換する </p>

ここではコードを省略しますが、次の 2 点に注意が必要です。

- 与えられた配列には小数が含まれないため、等しい場合をどう処理するかを気にする必要はありません。
- この方法では小数を導入するため、関数内の変数 `target` を浮動小数点数型に変更する必要があります（Python は変更不要です）。
