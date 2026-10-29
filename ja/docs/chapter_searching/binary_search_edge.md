---
comments: true
---

# 10.3 &nbsp; 二分探索で境界を探す

## 10.3.1 &nbsp; 左の境界を探す

!!! question "問題"

    重複する要素を含む可能性がある、長さ $n$ の整列済み配列 `nums` が与えられます。配列内で最も左にある要素 `target` のインデックスを返してください。含まれない場合は $-1$ を返します。

二分探索で挿入位置を探す方法を思い出してください。探索後、$i$ は最も左の `target` を指します。**つまり、挿入位置の探索は、本質的には最も左の `target` のインデックスを探しています**。

挿入位置を探す関数を使って、左の境界を探すことを考えます。ただし、配列に `target` が含まれない場合、次の二つの結果になる可能性があります。

- 挿入位置のインデックス $i$ が範囲外になります。
- 要素 `nums[i]` が `target` と等しくありません。

このどちらかに当てはまれば、そのまま $-1$ を返します。コードは次のとおりです。

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """二分探索で最も左にある target を探す"""
        # target の挿入位置を探すことに等しい
        i = binary_search_insertion(nums, target)
        # target が見つからなかったので、-1 を返す
        if i == len(nums) or nums[i] != target:
            return -1
        # target が見つかったので、インデックス i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分探索で最も左にある target を探す */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // target の挿入位置を探すことに等しい
        int i = binarySearchInsertion(nums, target);
        // target が見つからなかったので、-1 を返す
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分探索で最も左にある target を探す */
    int binarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すことに等しい
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target が見つからなかったので、-1 を返す
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 二分探索で最も左にある target を探す */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すことに等しい
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // target が見つからなかったので、-1 を返す
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 二分探索で最も左にある target を探す */
    func binarySearchLeftEdge(nums []int, target int) int {
        // target の挿入位置を探すことに等しい
        i := binarySearchInsertion(nums, target)
        // target が見つからなかったので、-1 を返す
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // target が見つかったので、インデックス i を返す
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 二分探索で最も左にある target を探す */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // target の挿入位置を探すことに等しい
        let i = binarySearchInsertion(nums: nums, target: target)
        // target が見つからなかったので、-1 を返す
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // target が見つかったので、インデックス i を返す
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 二分探索で最も左にある target を探す */
    function binarySearchLeftEdge(nums, target) {
        // target の挿入位置を探すことに等しい
        const i = binarySearchInsertion(nums, target);
        // target が見つからなかったので、-1 を返す
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 二分探索で最も左にある target を探す */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // target の挿入位置を探すことに等しい
        const i = binarySearchInsertion(nums, target);
        // target が見つからなかったので、-1 を返す
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 二分探索で最も左にある target を探す */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // target の挿入位置を探すことに等しい
      int i = binarySearchInsertion(nums, target);
      // target が見つからなかったので、-1 を返す
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // target が見つかったので、インデックス i を返す
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 二分探索で最も左にある target を探す */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // target の挿入位置を探すことに等しい
        let i = binary_search_insertion(nums, target);
        // target が見つからなかったので、-1 を返す
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 二分探索で最も左にある target を探す */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // target の挿入位置を探すことに等しい
        int i = binarySearchInsertion(nums, numSize, target);
        // target が見つからなかったので、-1 を返す
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // target が見つかったので、インデックス i を返す
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 二分探索で最も左にある target を探す */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // target の挿入位置を探すことに等しい
        val i = binarySearchInsertion(nums, target)
        // target が見つからなかったので、-1 を返す
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // target が見つかったので、インデックス i を返す
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### 二分探索で最も左にある target を探す ###
    def binary_search_left_edge(nums, target)
      # target の挿入位置を探すことに等しい
      i = binary_search_insertion(nums, target)

      # target が見つからなかったので、-1 を返す
      return -1 if i == nums.length || nums[i] != target

      i # target が見つかったので、インデックス i を返す
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%80%81%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AB%E3%81%82%E3%82%8B%20target%20%E3%82%92%E6%8E%A2%E3%81%99%22%22%22%0A%20%20%20%20%23%20target%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%E3%81%93%E3%81%A8%E3%81%AB%E7%AD%89%E3%81%97%E3%81%84%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E5%A2%83%E7%95%8C%E3%81%A8%E5%8F%B3%E5%A2%83%E7%95%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AB%E3%81%82%E3%82%8B%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%80%81%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AB%E3%81%82%E3%82%8B%20target%20%E3%82%92%E6%8E%A2%E3%81%99%22%22%22%0A%20%20%20%20%23%20target%20%E3%81%AE%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%82%92%E6%8E%A2%E3%81%99%E3%81%93%E3%81%A8%E3%81%AB%E7%AD%89%E3%81%97%E3%81%84%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E5%A2%83%E7%95%8C%E3%81%A8%E5%8F%B3%E5%A2%83%E7%95%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AB%E3%81%82%E3%82%8B%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 10.3.2 &nbsp; 右の境界を探す

では、最も右の `target` はどう探せばよいでしょうか。最も直接的な方法は、`nums[m] == target` の場合にポインタで区間を縮める操作を書き換えることです。コードは省略するので、興味があれば実装してみてください。

ここでは、さらに工夫した二つの方法を紹介します。

### 1. &nbsp; 左の境界を探す処理の再利用

実は、最も左の要素を探す関数を使って、最も右の要素を探すこともできます。具体的には、**最も右の `target` を探す問題を、最も左の `target + 1` を探す問題に置き換えます**。

図 10-7 のように、探索後のポインタ $i$ は最も左の `target + 1`（存在する場合）を指し、$j$ は最も右の `target` を指します。**そのため、$j$ を返せばよいのです**。

![右の境界の探索を左の境界の探索に置き換える](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> 図 10-7 &nbsp; 右の境界の探索を左の境界の探索に置き換える </p>

返される挿入位置は $i$ なので、そこから $1$ を引いて $j$ を得る必要があります。

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """二分探索で最も右にある target を探す"""
        # 最も左にある target + 1 を探す問題に変換する
        i = binary_search_insertion(nums, target + 1)
        # j は最も右にある target を指し、i は target より大きい最初の要素を指す
        j = i - 1
        # target が見つからなかったので、-1 を返す
        if j == -1 or nums[j] != target:
            return -1
        # target が見つかったので、インデックス j を返す
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分探索で最も右にある target を探す */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // 最も左にある target + 1 を探す問題に変換する
        int i = binarySearchInsertion(nums, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分探索で最も右にある target を探す */
    int binarySearchRightEdge(int[] nums, int target) {
        // 最も左にある target + 1 を探す問題に変換する
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 二分探索で最も右にある target を探す */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 最も左にある target + 1 を探す問題に変換する
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 二分探索で最も右にある target を探す */
    func binarySearchRightEdge(nums []int, target int) int {
        // 最も左にある target + 1 を探す問題に変換する
        i := binarySearchInsertion(nums, target+1)
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        j := i - 1
        // target が見つからなかったので、-1 を返す
        if j == -1 || nums[j] != target {
            return -1
        }
        // target が見つかったので、インデックス j を返す
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 二分探索で最も右にある target を探す */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // 最も左にある target + 1 を探す問題に変換する
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        let j = i - 1
        // target が見つからなかったので、-1 を返す
        if j == -1 || nums[j] != target {
            return -1
        }
        // target が見つかったので、インデックス j を返す
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 二分探索で最も右にある target を探す */
    function binarySearchRightEdge(nums, target) {
        // 最も左にある target + 1 を探す問題に変換する
        const i = binarySearchInsertion(nums, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        const j = i - 1;
        // target が見つからなかったので、-1 を返す
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 二分探索で最も右にある target を探す */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // 最も左にある target + 1 を探す問題に変換する
        const i = binarySearchInsertion(nums, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        const j = i - 1;
        // target が見つからなかったので、-1 を返す
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 二分探索で最も右にある target を探す */
    int binarySearchRightEdge(List<int> nums, int target) {
      // 最も左にある target + 1 を探す問題に変換する
      int i = binarySearchInsertion(nums, target + 1);
      // j は最も右にある target を指し、i は target より大きい最初の要素を指す
      int j = i - 1;
      // target が見つからなかったので、-1 を返す
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // target が見つかったので、インデックス j を返す
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 二分探索で最も右にある target を探す */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // 最も左にある target + 1 を探す問題に変換する
        let i = binary_search_insertion(nums, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        let j = i - 1;
        // target が見つからなかったので、-1 を返す
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 二分探索で最も右にある target を探す */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // 最も左にある target + 1 を探す問題に変換する
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったので、インデックス j を返す
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 二分探索で最も右にある target を探す */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // 最も左にある target + 1 を探す問題に変換する
        val i = binarySearchInsertion(nums, target + 1)
        // j は最も右にある target を指し、i は target より大きい最初の要素を指す
        val j = i - 1
        // target が見つからなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // target が見つかったので、インデックス j を返す
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### 二分探索で最も右にある target を探す ###
    def binary_search_right_edge(nums, target)
      # 最も左にある target + 1 を探す問題に変換する
      i = binary_search_insertion(nums, target + 1)

      # j は最も右にある target を指し、i は target より大きい最初の要素を指す
      j = i - 1

      # target が見つからなかったので、-1 を返す
      return -1 if j == -1 || nums[j] != target

      j # target が見つかったので、インデックス j を返す
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%80%81%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AB%E3%81%82%E3%82%8B%20target%20%E3%82%92%E6%8E%A2%E3%81%99%22%22%22%0A%20%20%20%20%23%20%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AB%E3%81%82%E3%82%8B%20target%20%2B%201%20%E3%82%92%E6%8E%A2%E3%81%99%E5%95%8F%E9%A1%8C%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E3%81%AF%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AB%E3%81%82%E3%82%8B%20target%20%E3%82%92%E6%8C%87%E3%81%97%E3%80%81i%20%E3%81%AF%20target%20%E3%82%88%E3%82%8A%E5%A4%A7%E3%81%8D%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20j%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E5%A2%83%E7%95%8C%E3%81%A8%E5%8F%B3%E5%A2%83%E7%95%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AB%E3%81%82%E3%82%8B%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%AB%E3%82%88%E3%82%8B%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AE%E6%8E%A2%E7%B4%A2%EF%BC%88%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%81%8C%E3%81%82%E3%82%8B%E5%A0%B4%E5%90%88%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E9%96%89%E5%8C%BA%E9%96%93%20%5B0,%20n-1%5D%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20m%20%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bm%2B1,%20j%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%81%AF%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AF%E3%80%81%E5%8C%BA%E9%96%93%20%5Bi,%20m-1%5D%20%E3%81%AB%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%20i%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AB%E3%81%82%E3%82%8B%20target%20%E3%82%92%E6%8E%A2%E3%81%99%22%22%22%0A%20%20%20%20%23%20%E6%9C%80%E3%82%82%E5%B7%A6%E3%81%AB%E3%81%82%E3%82%8B%20target%20%2B%201%20%E3%82%92%E6%8E%A2%E3%81%99%E5%95%8F%E9%A1%8C%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E3%81%AF%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AB%E3%81%82%E3%82%8B%20target%20%E3%82%92%E6%8C%87%E3%81%97%E3%80%81i%20%E3%81%AF%20target%20%E3%82%88%E3%82%8A%E5%A4%A7%E3%81%8D%E3%81%84%E6%9C%80%E5%88%9D%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%87%E3%81%99%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20target%20%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20j%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%AB%E3%82%80%E9%85%8D%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E3%81%A7%E5%B7%A6%E5%A2%83%E7%95%8C%E3%81%A8%E5%8F%B3%E5%A2%83%E7%95%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E3%82%82%E5%8F%B3%E3%81%AB%E3%81%82%E3%82%8B%E8%A6%81%E7%B4%A0%20%7Btarget%7D%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AF%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; 要素の探索への置き換え

配列に `target` が含まれない場合、最終的に $i$ は `target` より大きい最初の要素を、$j$ は `target` より小さい最も右の要素を指します。

したがって、図 10-8 のように、配列に存在しない要素を用意して左右の境界を探すことができます。

- 最も左の `target` を探す場合：`target - 0.5` の探索に置き換え、ポインタ $i$ を返します。
- 最も右の `target` を探す場合：`target + 0.5` の探索に置き換え、ポインタ $j$ を返します。

![境界の探索を要素の探索に置き換える](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> 図 10-8 &nbsp; 境界の探索を要素の探索に置き換える </p>

コードは省略しますが、次の二点に注意してください。

- 与えられた配列には小数が含まれないため、等しい場合の処理を考える必要はありません。
- この方法では小数を使うため、関数内の変数 `target` を浮動小数点数型に変更する必要があります（Python では変更不要です）。
