---
comments: true
---

# 6.2. &nbsp; 二分查找边界

上一节规定目标元素在数组中是唯一的。如果目标元素在数组中多次出现，上节介绍的方法只能保证返回其中一个目标元素的索引，**而无法确定该索引的左边和右边还有多少目标元素**。

为了查找最左一个 `target` ，我们可以先进行二分查找，找到任意一个目标元素，**再加一个向左遍历的线性查找**，找到最左的 `target` 返回即可。然而，由于加入了线性查找，这个方法的时间复杂度可能会劣化至 $O(n)$ 。

![线性查找最左元素](binary_search_edge.assets/binary_search_left_edge_naive.png)

<p align="center"> Fig. 线性查找最左元素 </p>

## 6.2.1. &nbsp; 查找最左一个元素

!!! question "查找并返回元素 `target` 在有序数组 `nums` 中首次出现的索引。若数组中不包含该元素，则返回 $-1$ 。数组可能包含重复元素。"

实际上，我们可以仅通过二分查找解决以上问题。方法的整体框架不变，先计算中点索引 `m` ，再判断 `target` 和 `nums[m]` 大小关系：

- 当 `nums[m] < target` 或 `nums[m] > target` 时，说明还没有找到 `target` ，因此采取与上节代码相同的缩小区间操作。
- 当 `nums[m] == target` 时，说明找到了一个目标元素，此时应该如何缩小区间？

对于该情况，**我们可以将查找目标想象为 `leftarget`**，其中 `leftarget` 表示从右到左首个小于 `target` 的元素。具体来说：

- 当 `nums[m] == target` 时，说明 `leftarget` 在区间 `[i, m - 1]` 中，因此采用 `j = m - 1` 来缩小区间，**从而使指针 `j` 向 `leftarget` 收缩靠近**。
- 二分查找完成后，`i` 指向最左一个 `target` ，`j` 指向 `leftarget` ，因此最终返回索引 `i` 即可。

=== "<1>"
    ![二分查找最左元素的步骤](binary_search_edge.assets/binary_search_left_edge_step1.png)

=== "<2>"
    ![binary_search_left_edge_step2](binary_search_edge.assets/binary_search_left_edge_step2.png)

=== "<3>"
    ![binary_search_left_edge_step3](binary_search_edge.assets/binary_search_left_edge_step3.png)

=== "<4>"
    ![binary_search_left_edge_step4](binary_search_edge.assets/binary_search_left_edge_step4.png)

=== "<5>"
    ![binary_search_left_edge_step5](binary_search_edge.assets/binary_search_left_edge_step5.png)

=== "<6>"
    ![binary_search_left_edge_step6](binary_search_edge.assets/binary_search_left_edge_step6.png)

=== "<7>"
    ![binary_search_left_edge_step7](binary_search_edge.assets/binary_search_left_edge_step7.png)

=== "<8>"
    ![binary_search_left_edge_step8](binary_search_edge.assets/binary_search_left_edge_step8.png)

注意，数组可能不包含目标元素 `target` 。因此在函数返回前，我们需要先判断 `nums[i]` 与 `target` 是否相等。另外，当 `target` 大于数组中的所有元素时，索引 `i` 会越界，因此也需要额外判断。

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分查找最左一个元素 */
    int binarySearchLeftEdge(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target)
                i = m + 1; // target 在区间 [m+1, j] 中
            else if (nums[m] > target)
                j = m - 1; // target 在区间 [i, m-1] 中
            else
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
        if (i == nums.length || nums[i] != target)
            return -1; // 未找到目标元素，返回 -1
        return i;
    }
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分查找最左一个元素 */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target)
                i = m + 1; // target 在区间 [m+1, j] 中
            else if (nums[m] > target)
                j = m - 1; // target 在区间 [i, m-1] 中
            else
                j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
        if (i == nums.size() || nums[i] != target)
            return -1; // 未找到目标元素，返回 -1
        return i;
    }
    ```

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """二分查找最左一个元素"""
        # 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
        i, j = 0, len(nums) - 1
        while i <= j:
            m = (i + j) // 2  # 计算中点索引 m
            if nums[m] < target:
                i = m + 1  # 此情况说明 target 在区间 [m+1, j] 中
            elif nums[m] > target:
                j = m - 1  # 此情况说明 target 在区间 [i, m-1] 中
            else:
                j = m - 1  # 此情况说明首个小于 target 的元素在区间 [i, m-1] 中
        if i == len(nums) or nums[i] != target:
            return -1  # 未找到目标元素，返回 -1
        return i
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "JavaScript"

    ```javascript title="binary_search_edge.js"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "TypeScript"

    ```typescript title="binary_search_edge.ts"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "C"

    ```c title="binary_search_edge.c"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    [class]{binary_search_edge}-[func]{binarySearchLeftEdge}
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

## 6.2.2. &nbsp; 查找最右一个元素

类似地，我们也可以二分查找最右一个元素。设首个大于 `target` 的元素为 `rightarget` 。

- 当 `nums[m] == target` 时，说明 `rightarget` 在区间 `[m + 1, j]` 中，因此执行 `i = m + 1` 将搜索区间向右收缩。
- 完成二分后，`i` 指向 `rightarget` ，`j` 指向最右一个 `target` ，因此最终返回索引 `j` 即可。

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分查找最右一个元素 */
    int binarySearchRightEdge(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target)
                i = m + 1; // target 在区间 [m+1, j] 中
            else if (nums[m] > target)
                j = m - 1; // target 在区间 [i, m-1] 中
            else
                i = m + 1; // 首个大于 target 的元素在区间 [m+1, j] 中
        }
        if (j < 0 || nums[j] != target)
            return -1; // 未找到目标元素，返回 -1
        return j;
    }
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分查找最右一个元素 */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 初始化双闭区间 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 计算中点索引 m
            if (nums[m] < target)
                i = m + 1; // target 在区间 [m+1, j] 中
            else if (nums[m] > target)
                j = m - 1; // target 在区间 [i, m-1] 中
            else
                i = m + 1; // 首个大于 target 的元素在区间 [m+1, j] 中
        }
        if (j < 0 || nums[j] != target)
            return -1; // 未找到目标元素，返回 -1
        return j;
    }
    ```

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """二分查找最右一个元素"""
        # 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
        i, j = 0, len(nums) - 1
        while i <= j:
            m = (i + j) // 2  # 计算中点索引 m
            if nums[m] < target:
                i = m + 1  # target 在区间 [m+1, j] 中
            elif nums[m] > target:
                j = m - 1  # target 在区间 [i, m-1] 中
            else:
                i = m + 1  # 首个大于 target 的元素在区间 [m+1, j] 中
        if j == len(nums) or nums[j] != target:
            return -1  # 未找到目标元素，返回 -1
        return j
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "JavaScript"

    ```javascript title="binary_search_edge.js"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "TypeScript"

    ```typescript title="binary_search_edge.ts"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "C"

    ```c title="binary_search_edge.c"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    [class]{binary_search_edge}-[func]{binarySearchRightEdge}
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchRightEdge}
    ```

观察下图，搜索最右元素时指针 `j` 起到了搜索最左元素时指针 `i` 的作用，反之亦然。本质上看，**搜索最左元素和最右元素的实现是镜像对称的**。

![二分查找最左元素和最右元素](binary_search_edge.assets/binary_search_left_right_edge.png)

<p align="center"> Fig. 二分查找最左元素和最右元素 </p>

!!! tip

    以上代码采取的都是“双闭区间”写法。有兴趣的读者可以自行实现“左闭右开”写法。
