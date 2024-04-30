---
comments: true
---

# 10.2 &nbsp; Binary search insertion

Binary search is not only used to search for target elements but also to solve many variant problems, such as searching for the insertion position of target elements.

## 10.2.1 &nbsp; Case with no duplicate elements

!!! question

    Given an ordered array `nums` of length $n$ and an element `target`, where the array has no duplicate elements. Now insert `target` into the array `nums` while maintaining its order. If the element `target` already exists in the array, insert it to its left side. Please return the index of `target` in the array after insertion. See the example shown in the Figure 10-4 .

![Example data for binary search insertion point](binary_search_insertion.assets/binary_search_insertion_example.png){ class="animation-figure" }

<p align="center"> Figure 10-4 &nbsp; Example data for binary search insertion point </p>

If you want to reuse the binary search code from the previous section, you need to answer the following two questions.

**Question one**: When the array contains `target`, is the insertion point index the index of that element?

The requirement to insert `target` to the left of equal elements means that the newly inserted `target` replaces the original `target` position. Thus, **when the array contains `target`, the insertion point index is the index of that `target`**.

**Question two**: When the array does not contain `target`, what is the index of the insertion point?

Further consider the binary search process: when `nums[m] < target`, pointer $i$ moves, meaning that pointer $i$ is approaching an element greater than or equal to `target`. Similarly, pointer $j$ is always approaching an element less than or equal to `target`.

Therefore, at the end of the binary, it is certain that: $i$ points to the first element greater than `target`, and $j$ points to the first element less than `target`. **It is easy to see that when the array does not contain `target`, the insertion index is $i$**. The code is as follows:

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion_simple(nums: list[int], target: int) -> int:
        """二分查找插入点（无重复元素）"""
        i, j = 0, len(nums) - 1  # 初始化双闭区间 [0, n-1]
        while i <= j:
            m = (i + j) // 2  # 计算中点索引 m
            if nums[m] < target:
                i = m + 1  # target 在区间 [m+1, j] 中
            elif nums[m] > target:
                j = m - 1  # target 在区间 [i, m-1] 中
            else:
                return m  # 找到 target ，返回插入点 m
        # 未找到 target ，返回插入点 i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 二分查找插入点（无重复元素） */
    int binarySearchInsertionSimple(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 二分查找插入点（无重复元素） */
    int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 二分查找插入点（无重复元素） */
    int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 二分查找插入点（无重复元素） */
    func binarySearchInsertionSimple(nums []int, target int) int {
        // 初始化双闭区间 [0, n-1]
        i, j := 0, len(nums)-1
        for i <= j {
            // 计算中点索引 m
            m := i + (j-i)/2
            if nums[m] < target {
                // target 在区间 [m+1, j] 中
                i = m + 1
            } else if nums[m] > target {
                // target 在区间 [i, m-1] 中
                j = m - 1
            } else {
                // 找到 target ，返回插入点 m
                return m
            }
        }
        // 未找到 target ，返回插入点 i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 二分查找插入点（无重复元素） */
    func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
        // 初始化双闭区间 [0, n-1]
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 计算中点索引 m
            if nums[m] < target {
                i = m + 1 // target 在区间 [m+1, j] 中
            } else if nums[m] > target {
                j = m - 1 // target 在区间 [i, m-1] 中
            } else {
                return m // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 二分查找插入点（无重复元素） */
    function binarySearchInsertionSimple(nums, target) {
        let i = 0,
            j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 计算中点索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 二分查找插入点（无重复元素） */
    function binarySearchInsertionSimple(
        nums: Array<number>,
        target: number
    ): number {
        let i = 0,
            j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 计算中点索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 二分查找插入点（无重复元素） */
    int binarySearchInsertionSimple(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 计算中点索引 m
        if (nums[m] < target) {
          i = m + 1; // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
          j = m - 1; // target 在区间 [i, m-1] 中
        } else {
          return m; // 找到 target ，返回插入点 m
        }
      }
      // 未找到 target ，返回插入点 i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 二分查找插入点（无重复元素） */
    fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化双闭区间 [0, n-1]
        while i <= j {
            let m = i + (j - i) / 2; // 计算中点索引 m
            if nums[m as usize] < target {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if nums[m as usize] > target {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m;
            }
        }
        // 未找到 target ，返回插入点 i
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 二分查找插入点（无重复元素） */
    int binarySearchInsertionSimple(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 二分查找插入点（无重复元素） */
    fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            val m = i + (j - i) / 2 // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1 // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1 // target 在区间 [i, m-1] 中
            } else {
                return m // 找到 target ，返回插入点 m
            }
        }
        // 未找到 target ，返回插入点 i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### 二分查找插入点（无重复元素） ###
    def binary_search_insertion_simple(nums, target)
      # 初始化双闭区间 [0, n-1]
      i, j = 0, nums.length - 1

      while i <= j
        # 计算中点索引 m
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target 在区间 [m+1, j] 中
        elsif nums[m] > target
          j = m - 1 # target 在区间 [i, m-1] 中
        else
          return m  # 找到 target ，返回插入点 m
        end
      end

      i # 未找到 target ，返回插入点 i
    end
    ```

=== "Zig"

    ```zig title="binary_search_insertion.zig"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E6%97%A0%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20m%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%97%A0%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums,%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E6%97%A0%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20m%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%97%A0%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums,%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 10.2.2 &nbsp; Case with duplicate elements

!!! question

    Based on the previous question, assume the array may contain duplicate elements, all else remains the same.

Suppose there are multiple `target`s in the array, ordinary binary search can only return the index of one of the `target`s, **and it cannot determine how many `target`s are to the left and right of that element**.

The task requires inserting the target element to the very left, **so we need to find the index of the leftmost `target` in the array**. Initially consider implementing this through the steps shown in the Figure 10-5 .

1. Perform a binary search, get an arbitrary index of `target`, denoted as $k$.
2. Start from index $k$, and perform a linear search to the left until the leftmost `target` is found and return.

![Linear search for the insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_naive.png){ class="animation-figure" }

<p align="center"> Figure 10-5 &nbsp; Linear search for the insertion point of duplicate elements </p>

Although this method is feasible, it includes linear search, so its time complexity is $O(n)$. This method is inefficient when the array contains many duplicate `target`s.

Now consider extending the binary search code. As shown in the Figure 10-6 , the overall process remains the same, each round first calculates the midpoint index $m$, then judges the size relationship between `target` and `nums[m]`, divided into the following cases.

- When `nums[m] < target` or `nums[m] > target`, it means `target` has not been found yet, thus use the normal binary search interval reduction operation, **thus making pointers $i$ and $j$ approach `target`**.
- When `nums[m] == target`, it indicates that the elements less than `target` are in the interval $[i, m - 1]$, therefore use $j = m - 1$ to narrow the interval, **thus making pointer $j$ approach elements less than `target`**.

After the loop, $i$ points to the leftmost `target`, and $j$ points to the first element less than `target`, **therefore index $i$ is the insertion point**.

=== "<1>"
    ![Steps for binary search insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_step1.png){ class="animation-figure" }

=== "<2>"
    ![binary_search_insertion_step2](binary_search_insertion.assets/binary_search_insertion_step2.png){ class="animation-figure" }

=== "<3>"
    ![binary_search_insertion_step3](binary_search_insertion.assets/binary_search_insertion_step3.png){ class="animation-figure" }

=== "<4>"
    ![binary_search_insertion_step4](binary_search_insertion.assets/binary_search_insertion_step4.png){ class="animation-figure" }

=== "<5>"
    ![binary_search_insertion_step5](binary_search_insertion.assets/binary_search_insertion_step5.png){ class="animation-figure" }

=== "<6>"
    ![binary_search_insertion_step6](binary_search_insertion.assets/binary_search_insertion_step6.png){ class="animation-figure" }

=== "<7>"
    ![binary_search_insertion_step7](binary_search_insertion.assets/binary_search_insertion_step7.png){ class="animation-figure" }

=== "<8>"
    ![binary_search_insertion_step8](binary_search_insertion.assets/binary_search_insertion_step8.png){ class="animation-figure" }

<p align="center"> Figure 10-6 &nbsp; Steps for binary search insertion point of duplicate elements </p>

Observe the code, the operations of the branch `nums[m] > target` and `nums[m] == target` are the same, so the two can be combined.

Even so, we can still keep the conditions expanded, as their logic is clearer and more readable.

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion(nums: list[int], target: int) -> int:
        """二分查找插入点（存在重复元素）"""
        i, j = 0, len(nums) - 1  # 初始化双闭区间 [0, n-1]
        while i <= j:
            m = (i + j) // 2  # 计算中点索引 m
            if nums[m] < target:
                i = m + 1  # target 在区间 [m+1, j] 中
            elif nums[m] > target:
                j = m - 1  # target 在区间 [i, m-1] 中
            else:
                j = m - 1  # 首个小于 target 的元素在区间 [i, m-1] 中
        # 返回插入点 i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 二分查找插入点（存在重复元素） */
    int binarySearchInsertion(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 二分查找插入点（存在重复元素） */
    int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 二分查找插入点（存在重复元素） */
    int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 二分查找插入点（存在重复元素） */
    func binarySearchInsertion(nums []int, target int) int {
        // 初始化双闭区间 [0, n-1]
        i, j := 0, len(nums)-1
        for i <= j {
            // 计算中点索引 m
            m := i + (j-i)/2
            if nums[m] < target {
                // target 在区间 [m+1, j] 中
                i = m + 1
            } else if nums[m] > target {
                // target 在区间 [i, m-1] 中
                j = m - 1
            } else {
                // 首个小于 target 的元素在区间 [i, m-1] 中
                j = m - 1
            }
        }
        // 返回插入点 i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 二分查找插入点（存在重复元素） */
    func binarySearchInsertion(nums: [Int], target: Int) -> Int {
        // 初始化双闭区间 [0, n-1]
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 计算中点索引 m
            if nums[m] < target {
                i = m + 1 // target 在区间 [m+1, j] 中
            } else if nums[m] > target {
                j = m - 1 // target 在区间 [i, m-1] 中
            } else {
                j = m - 1 // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 二分查找插入点（存在重复元素） */
    function binarySearchInsertion(nums, target) {
        let i = 0,
            j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 计算中点索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 二分查找插入点（存在重复元素） */
    function binarySearchInsertion(nums: Array<number>, target: number): number {
        let i = 0,
            j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 计算中点索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 二分查找插入点（存在重复元素） */
    int binarySearchInsertion(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 计算中点索引 m
        if (nums[m] < target) {
          i = m + 1; // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
          j = m - 1; // target 在区间 [i, m-1] 中
        } else {
          j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
      }
      // 返回插入点 i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 二分查找插入点（存在重复元素） */
    pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化双闭区间 [0, n-1]
        while i <= j {
            let m = i + (j - i) / 2; // 计算中点索引 m
            if nums[m as usize] < target {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if nums[m as usize] > target {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 二分查找插入点（存在重复元素） */
    int binarySearchInsertion(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在区间 [i, m-1] 中
            } else {
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 二分查找插入点（存在重复元素） */
    fun binarySearchInsertion(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            val m = i + (j - i) / 2 // 计算中点索引 m
            if (nums[m] < target) {
                i = m + 1 // target 在区间 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1 // target 在区间 [i, m-1] 中
            } else {
                j = m - 1 // 首个小于 target 的元素在区间 [i, m-1] 中
            }
        }
        // 返回插入点 i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### 二分查找插入点（存在重复元素） ###
    def binary_search_insertion(nums, target)
      # 初始化双闭区间 [0, n-1]
      i, j = 0, nums.length - 1

      while i <= j
        # 计算中点索引 m
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target 在区间 [m+1, j] 中
        elsif nums[m] > target
          j = m - 1 # target 在区间 [i, m-1] 中
        else
          j = m - 1 # 首个小于 target 的元素在区间 [i, m-1] 中
        end
      end

      i # 返回插入点 i
    end
    ```

=== "Zig"

    ```zig title="binary_search_insertion.zig"
    [class]{}-[func]{binarySearchInsertion}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

!!! tip

    The code in this section uses "closed intervals". Readers interested can implement the "left-closed right-open" method themselves.

In summary, binary search is merely about setting search targets for pointers $i$ and $j$, which might be a specific element (like `target`) or a range of elements (like elements less than `target`).

In the continuous loop of binary search, pointers $i$ and $j$ gradually approach the predefined target. Ultimately, they either find the answer or stop after crossing the boundary.
