---
comments: true
---

# 12.2 &nbsp; Divide and conquer search strategy

We have learned that search algorithms fall into two main categories.

- **Brute-force search**: It is implemented by traversing the data structure, with a time complexity of $O(n)$.
- **Adaptive search**: It utilizes a unique data organization form or prior information, and its time complexity can reach $O(\log n)$ or even $O(1)$.

In fact, **search algorithms with a time complexity of $O(\log n)$ are usually based on the divide-and-conquer strategy**, such as binary search and trees.

- Each step of binary search divides the problem (searching for a target element in an array) into a smaller problem (searching for the target element in half of the array), continuing until the array is empty or the target element is found.
- Trees represent the divide-and-conquer idea, where in data structures like binary search trees, AVL trees, and heaps, the time complexity of various operations is $O(\log n)$.

The divide-and-conquer strategy of binary search is as follows.

- **The problem can be divided**: Binary search recursively divides the original problem (searching in an array) into subproblems (searching in half of the array), achieved by comparing the middle element with the target element.
- **Subproblems are independent**: In binary search, each round handles one subproblem, unaffected by other subproblems.
- **The solutions of subproblems do not need to be merged**: Binary search aims to find a specific element, so there is no need to merge the solutions of subproblems. When a subproblem is solved, the original problem is also solved.

Divide-and-conquer can enhance search efficiency because brute-force search can only eliminate one option per round, **whereas divide-and-conquer can eliminate half of the options**.

### 1. &nbsp; Implementing binary search based on divide-and-conquer

In previous chapters, binary search was implemented based on iteration. Now, we implement it based on divide-and-conquer (recursion).

!!! question

    Given an ordered array `nums` of length $n$, where all elements are unique, please find the element `target`.

From a divide-and-conquer perspective, we denote the subproblem corresponding to the search interval $[i, j]$ as $f(i, j)$.

Starting from the original problem $f(0, n-1)$, perform the binary search through the following steps.

1. Calculate the midpoint $m$ of the search interval $[i, j]$, and use it to eliminate half of the search interval.
2. Recursively solve the subproblem reduced by half in size, which could be $f(i, m-1)$ or $f(m+1, j)$.
3. Repeat steps `1.` and `2.`, until `target` is found or the interval is empty and returns.

The diagram below shows the divide-and-conquer process of binary search for element $6$ in an array.

![The divide-and-conquer process of binary search](binary_search_recur.assets/binary_search_recur.png){ class="animation-figure" }

<p align="center"> Figure 12-4 &nbsp; The divide-and-conquer process of binary search </p>

In the implementation code, we declare a recursive function `dfs()` to solve the problem $f(i, j)$:

=== "Python"

    ```python title="binary_search_recur.py"
    def dfs(nums: list[int], target: int, i: int, j: int) -> int:
        """二分查找：问题 f(i, j)"""
        # 若区间为空，代表无目标元素，则返回 -1
        if i > j:
            return -1
        # 计算中点索引 m
        m = (i + j) // 2
        if nums[m] < target:
            # 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j)
        elif nums[m] > target:
            # 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1)
        else:
            # 找到目标元素，返回其索引
            return m

    def binary_search(nums: list[int], target: int) -> int:
        """二分查找"""
        n = len(nums)
        # 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1)
    ```

=== "C++"

    ```cpp title="binary_search_recur.cpp"
    /* 二分查找：问题 f(i, j) */
    int dfs(vector<int> &nums, int target, int i, int j) {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1;
        }
        // 计算中点索引 m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    int binarySearch(vector<int> &nums, int target) {
        int n = nums.size();
        // 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Java"

    ```java title="binary_search_recur.java"
    /* 二分查找：问题 f(i, j) */
    int dfs(int[] nums, int target, int i, int j) {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1;
        }
        // 计算中点索引 m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "C#"

    ```csharp title="binary_search_recur.cs"
    /* 二分查找：问题 f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1;
        }
        // 计算中点索引 m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // 求解问题 f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }
    ```

=== "Go"

    ```go title="binary_search_recur.go"
    /* 二分查找：问题 f(i, j) */
    func dfs(nums []int, target, i, j int) int {
        // 如果区间为空，代表没有目标元素，则返回 -1
        if i > j {
            return -1
        }
        //    计算索引中点
        m := i + ((j - i) >> 1)
        //判断中点与目标元素大小
        if nums[m] < target {
            // 小于则递归右半数组
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m+1, j)
        } else if nums[m] > target {
            // 小于则递归左半数组
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m-1)
        } else {
            // 找到目标元素，返回其索引
            return m
        }
    }

    /* 二分查找 */
    func binarySearch(nums []int, target int) int {
        n := len(nums)
        return dfs(nums, target, 0, n-1)
    }
    ```

=== "Swift"

    ```swift title="binary_search_recur.swift"
    /* 二分查找：问题 f(i, j) */
    func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
        // 若区间为空，代表无目标元素，则返回 -1
        if i > j {
            return -1
        }
        // 计算中点索引 m
        let m = (i + j) / 2
        if nums[m] < target {
            // 递归子问题 f(m+1, j)
            return dfs(nums: nums, target: target, i: m + 1, j: j)
        } else if nums[m] > target {
            // 递归子问题 f(i, m-1)
            return dfs(nums: nums, target: target, i: i, j: m - 1)
        } else {
            // 找到目标元素，返回其索引
            return m
        }
    }

    /* 二分查找 */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // 求解问题 f(0, n-1)
        dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="binary_search_recur.js"
    /* 二分查找：问题 f(i, j) */
    function dfs(nums, target, i, j) {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1;
        }
        // 计算中点索引 m
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    function binarySearch(nums, target) {
        const n = nums.length;
        // 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "TS"

    ```typescript title="binary_search_recur.ts"
    /* 二分查找：问题 f(i, j) */
    function dfs(nums: number[], target: number, i: number, j: number): number {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1;
        }
        // 计算中点索引 m
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    function binarySearch(nums: number[], target: number): number {
        const n = nums.length;
        // 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Dart"

    ```dart title="binary_search_recur.dart"
    /* 二分查找：问题 f(i, j) */
    int dfs(List<int> nums, int target, int i, int j) {
      // 若区间为空，代表无目标元素，则返回 -1
      if (i > j) {
        return -1;
      }
      // 计算中点索引 m
      int m = (i + j) ~/ 2;
      if (nums[m] < target) {
        // 递归子问题 f(m+1, j)
        return dfs(nums, target, m + 1, j);
      } else if (nums[m] > target) {
        // 递归子问题 f(i, m-1)
        return dfs(nums, target, i, m - 1);
      } else {
        // 找到目标元素，返回其索引
        return m;
      }
    }

    /* 二分查找 */
    int binarySearch(List<int> nums, int target) {
      int n = nums.length;
      // 求解问题 f(0, n-1)
      return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Rust"

    ```rust title="binary_search_recur.rs"
    /* 二分查找：问题 f(i, j) */
    fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
        // 若区间为空，代表无目标元素，则返回 -1
        if i > j {
            return -1;
        }
        let m: i32 = (i + j) / 2;
        if nums[m as usize] < target {
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if nums[m as usize] > target {
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        let n = nums.len() as i32;
        // 求解问题 f(0, n-1)
        dfs(nums, target, 0, n - 1)
    }
    ```

=== "C"

    ```c title="binary_search_recur.c"
    /* 二分查找：问题 f(i, j) */
    int dfs(int nums[], int target, int i, int j) {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1;
        }
        // 计算中点索引 m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }

    /* 二分查找 */
    int binarySearch(int nums[], int target, int numsSize) {
        int n = numsSize;
        // 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_recur.kt"
    /* 二分查找：问题 f(i, j) */
    fun dfs(
        nums: IntArray,
        target: Int,
        i: Int,
        j: Int
    ): Int {
        // 若区间为空，代表无目标元素，则返回 -1
        if (i > j) {
            return -1
        }
        // 计算中点索引 m
        val m = (i + j) / 2
        return if (nums[m] < target) {
            // 递归子问题 f(m+1, j)
            dfs(nums, target, m + 1, j)
        } else if (nums[m] > target) {
            // 递归子问题 f(i, m-1)
            dfs(nums, target, i, m - 1)
        } else {
            // 找到目标元素，返回其索引
            m
        }
    }

    /* 二分查找 */
    fun binarySearch(nums: IntArray, target: Int): Int {
        val n = nums.size
        // 求解问题 f(0, n-1)
        return dfs(nums, target, 0, n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_recur.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{binary_search}
    ```

=== "Zig"

    ```zig title="binary_search_recur.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{binarySearch}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28nums%3A%20list%5Bint%5D,%20target%3A%20int,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%EF%BC%9A%E9%97%AE%E9%A2%98%20f%28i,%20j%29%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%8C%BA%E9%97%B4%E4%B8%BA%E7%A9%BA%EF%BC%8C%E4%BB%A3%E8%A1%A8%E6%97%A0%E7%9B%AE%E6%A0%87%E5%85%83%E7%B4%A0%EF%BC%8C%E5%88%99%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20i%20%3E%20j%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%0A%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%AD%90%E9%97%AE%E9%A2%98%20f%28m%2B1,%20j%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20m%20%2B%201,%20j%29%0A%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%AD%90%E9%97%AE%E9%A2%98%20f%28i,%20m-1%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20i,%20m%20-%201%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E7%9B%AE%E6%A0%87%E5%85%83%E7%B4%A0%EF%BC%8C%E8%BF%94%E5%9B%9E%E5%85%B6%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20return%20m%0A%0Adef%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E6%B1%82%E8%A7%A3%E9%97%AE%E9%A2%98%20f%280,%20n-1%29%0A%20%20%20%20return%20dfs%28nums,%20target,%200,%20n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%EF%BC%88%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E6%A0%87%E5%85%83%E7%B4%A0%206%20%E7%9A%84%E7%B4%A2%E5%BC%95%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28nums%3A%20list%5Bint%5D,%20target%3A%20int,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%EF%BC%9A%E9%97%AE%E9%A2%98%20f%28i,%20j%29%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%8C%BA%E9%97%B4%E4%B8%BA%E7%A9%BA%EF%BC%8C%E4%BB%A3%E8%A1%A8%E6%97%A0%E7%9B%AE%E6%A0%87%E5%85%83%E7%B4%A0%EF%BC%8C%E5%88%99%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20i%20%3E%20j%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%0A%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%AD%90%E9%97%AE%E9%A2%98%20f%28m%2B1,%20j%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20m%20%2B%201,%20j%29%0A%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%AD%90%E9%97%AE%E9%A2%98%20f%28i,%20m-1%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums,%20target,%20i,%20m%20-%201%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E7%9B%AE%E6%A0%87%E5%85%83%E7%B4%A0%EF%BC%8C%E8%BF%94%E5%9B%9E%E5%85%B6%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20return%20m%0A%0Adef%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E6%B1%82%E8%A7%A3%E9%97%AE%E9%A2%98%20f%280,%20n-1%29%0A%20%20%20%20return%20dfs%28nums,%20target,%200,%20n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%EF%BC%88%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%EF%BC%89%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22%E7%9B%AE%E6%A0%87%E5%85%83%E7%B4%A0%206%20%E7%9A%84%E7%B4%A2%E5%BC%95%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>
