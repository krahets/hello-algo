---
comments: true
---

# 10.3 &nbsp; Binary search boundaries

## 10.3.1 &nbsp; Find the left boundary

!!! question

    Given a sorted array `nums` of length $n$, which may contain duplicate elements, return the index of the leftmost element `target`. If the element is not present in the array, return $-1$.

Recall the method of binary search for an insertion point, after the search is completed, $i$ points to the leftmost `target`, **thus searching for the insertion point is essentially searching for the index of the leftmost `target`**.

Consider implementing the search for the left boundary using the function for finding an insertion point. Note that the array might not contain `target`, which could lead to the following two results:

- The index $i$ of the insertion point is out of bounds.
- The element `nums[i]` is not equal to `target`.

In these cases, simply return $-1$. The code is as follows:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """二分查找最左一个 target"""
        # 等价于查找 target 的插入点
        i = binary_search_insertion(nums, target)
        # 未找到 target ，返回 -1
        if i == len(nums) or nums[i] != target:
            return -1
        # 找到 target ，返回索引 i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分查找最左一个 target */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // 等价于查找 target 的插入点
        int i = binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分查找最左一个 target */
    int binarySearchLeftEdge(int[] nums, int target) {
        // 等价于查找 target 的插入点
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 二分查找最左一个 target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // 等价于查找 target 的插入点
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 二分查找最左一个 target */
    func binarySearchLeftEdge(nums []int, target int) int {
        // 等价于查找 target 的插入点
        i := binarySearchInsertion(nums, target)
        // 未找到 target ，返回 -1
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // 找到 target ，返回索引 i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 二分查找最左一个 target */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // 等价于查找 target 的插入点
        let i = binarySearchInsertion(nums: nums, target: target)
        // 未找到 target ，返回 -1
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // 找到 target ，返回索引 i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 二分查找最左一个 target */
    function binarySearchLeftEdge(nums, target) {
        // 等价于查找 target 的插入点
        const i = binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 二分查找最左一个 target */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // 等价于查找 target 的插入点
        const i = binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 二分查找最左一个 target */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // 等价于查找 target 的插入点
      int i = binarySearchInsertion(nums, target);
      // 未找到 target ，返回 -1
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // 找到 target ，返回索引 i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 二分查找最左一个 target */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // 等价于查找 target 的插入点
        let i = binary_search_insertion(nums, target);
        // 未找到 target ，返回 -1
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // 找到 target ，返回索引 i
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 二分查找最左一个 target */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // 等价于查找 target 的插入点
        int i = binarySearchInsertion(nums, numSize, target);
        // 未找到 target ，返回 -1
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 二分查找最左一个 target */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // 等价于查找 target 的插入点
        val i = binarySearchInsertion(nums, target)
        // 未找到 target ，返回 -1
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // 找到 target ，返回索引 i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### 二分查找最左一个 target ###
    def binary_search_left_edge(nums, target)
      # 等价于查找 target 的插入点
      i = binary_search_insertion(nums, target)

      # 未找到 target ，返回 -1
      return -1 if i == nums.length || nums[i] != target

      i # 找到 target ，返回索引 i
    end
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E7%AD%89%E4%BB%B7%E4%BA%8E%E6%9F%A5%E6%89%BE%20target%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E7%AD%89%E4%BB%B7%E4%BA%8E%E6%9F%A5%E6%89%BE%20target%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 10.3.2 &nbsp; Find the right boundary

So how do we find the rightmost `target`? The most straightforward way is to modify the code, replacing the pointer contraction operation in the case of `nums[m] == target`. The code is omitted here, but interested readers can implement it on their own.

Below we introduce two more cunning methods.

### 1. &nbsp; Reusing the search for the left boundary

In fact, we can use the function for finding the leftmost element to find the rightmost element, specifically by **transforming the search for the rightmost `target` into a search for the leftmost `target + 1`**.

As shown in Figure 10-7, after the search is completed, the pointer $i$ points to the leftmost `target + 1` (if it exists), while $j$ points to the rightmost `target`, **thus returning $j$ is sufficient**.

![Transforming the search for the right boundary into the search for the left boundary](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> Figure 10-7 &nbsp; Transforming the search for the right boundary into the search for the left boundary </p>

Please note, the insertion point returned is $i$, therefore, it should be subtracted by $1$ to obtain $j$:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """二分查找最右一个 target"""
        # 转化为查找最左一个 target + 1
        i = binary_search_insertion(nums, target + 1)
        # j 指向最右一个 target ，i 指向首个大于 target 的元素
        j = i - 1
        # 未找到 target ，返回 -1
        if j == -1 or nums[j] != target:
            return -1
        # 找到 target ，返回索引 j
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分查找最右一个 target */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // 转化为查找最左一个 target + 1
        int i = binarySearchInsertion(nums, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分查找最右一个 target */
    int binarySearchRightEdge(int[] nums, int target) {
        // 转化为查找最左一个 target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 二分查找最右一个 target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 转化为查找最左一个 target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 二分查找最右一个 target */
    func binarySearchRightEdge(nums []int, target int) int {
        // 转化为查找最左一个 target + 1
        i := binarySearchInsertion(nums, target+1)
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        j := i - 1
        // 未找到 target ，返回 -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // 找到 target ，返回索引 j
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 二分查找最右一个 target */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // 转化为查找最左一个 target + 1
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        let j = i - 1
        // 未找到 target ，返回 -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // 找到 target ，返回索引 j
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 二分查找最右一个 target */
    function binarySearchRightEdge(nums, target) {
        // 转化为查找最左一个 target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        const j = i - 1;
        // 未找到 target ，返回 -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 二分查找最右一个 target */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // 转化为查找最左一个 target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        const j = i - 1;
        // 未找到 target ，返回 -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 二分查找最右一个 target */
    int binarySearchRightEdge(List<int> nums, int target) {
      // 转化为查找最左一个 target + 1
      int i = binarySearchInsertion(nums, target + 1);
      // j 指向最右一个 target ，i 指向首个大于 target 的元素
      int j = i - 1;
      // 未找到 target ，返回 -1
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // 找到 target ，返回索引 j
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 二分查找最右一个 target */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // 转化为查找最左一个 target + 1
        let i = binary_search_insertion(nums, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        let j = i - 1;
        // 未找到 target ，返回 -1
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // 找到 target ，返回索引 j
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 二分查找最右一个 target */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // 转化为查找最左一个 target + 1
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 二分查找最右一个 target */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // 转化为查找最左一个 target + 1
        val i = binarySearchInsertion(nums, target + 1)
        // j 指向最右一个 target ，i 指向首个大于 target 的元素
        val j = i - 1
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // 找到 target ，返回索引 j
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### 二分查找最右一个 target ###
    def binary_search_right_edge(nums, target)
      # 转化为查找最左一个 target + 1
      i = binary_search_insertion(nums, target + 1)

      # j 指向最右一个 target ，i 指向首个大于 target 的元素
      j = i - 1

      # 未找到 target ，返回 -1
      return -1 if j == -1 || nums[j] != target

      j # 找到 target ，返回索引 j
    end
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchRightEdge}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E8%BD%AC%E5%8C%96%E4%B8%BA%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E6%8C%87%E5%90%91%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%20%EF%BC%8Ci%20%E6%8C%87%E5%90%91%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E8%BD%AC%E5%8C%96%E4%B8%BA%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E6%8C%87%E5%90%91%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%20%EF%BC%8Ci%20%E6%8C%87%E5%90%91%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 2. &nbsp; Transforming into an element search

We know that when the array does not contain `target`, $i$ and $j$ will eventually point to the first element greater and smaller than `target` respectively.

Thus, as shown in Figure 10-8, we can construct an element that does not exist in the array, to search for the left and right boundaries.

- To find the leftmost `target`: it can be transformed into searching for `target - 0.5`, and return the pointer $i$.
- To find the rightmost `target`: it can be transformed into searching for `target + 0.5`, and return the pointer $j$.

![Transforming the search for boundaries into the search for an element](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> Figure 10-8 &nbsp; Transforming the search for boundaries into the search for an element </p>

The code is omitted here, but two points are worth noting.

- The given array does not contain decimals, meaning we do not need to worry about how to handle equal situations.
- Since this method introduces decimals, the variable `target` in the function needs to be changed to a floating point type (no change needed in Python).
