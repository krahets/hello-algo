---
comments: true
---

# 11.5 &nbsp; Quick sort

<u>Quick sort</u> is a sorting algorithm based on the divide and conquer strategy, known for its efficiency and wide application.

The core operation of quick sort is "pivot partitioning," aiming to: select an element from the array as the "pivot," move all elements smaller than the pivot to its left, and move elements greater than the pivot to its right. Specifically, the pivot partitioning process is illustrated as follows.

1. Select the leftmost element of the array as the pivot, and initialize two pointers `i` and `j` at both ends of the array.
2. Set up a loop where each round uses `i` (`j`) to find the first element larger (smaller) than the pivot, then swap these two elements.
3. Repeat step `2.` until `i` and `j` meet, finally swap the pivot to the boundary between the two sub-arrays.

=== "<1>"
    ![Pivot division process](quick_sort.assets/pivot_division_step1.png){ class="animation-figure" }

=== "<2>"
    ![pivot_division_step2](quick_sort.assets/pivot_division_step2.png){ class="animation-figure" }

=== "<3>"
    ![pivot_division_step3](quick_sort.assets/pivot_division_step3.png){ class="animation-figure" }

=== "<4>"
    ![pivot_division_step4](quick_sort.assets/pivot_division_step4.png){ class="animation-figure" }

=== "<5>"
    ![pivot_division_step5](quick_sort.assets/pivot_division_step5.png){ class="animation-figure" }

=== "<6>"
    ![pivot_division_step6](quick_sort.assets/pivot_division_step6.png){ class="animation-figure" }

=== "<7>"
    ![pivot_division_step7](quick_sort.assets/pivot_division_step7.png){ class="animation-figure" }

=== "<8>"
    ![pivot_division_step8](quick_sort.assets/pivot_division_step8.png){ class="animation-figure" }

=== "<9>"
    ![pivot_division_step9](quick_sort.assets/pivot_division_step9.png){ class="animation-figure" }

<p align="center"> Figure 11-8 &nbsp; Pivot division process </p>

After the pivot partitioning, the original array is divided into three parts: left sub-array, pivot, and right sub-array, satisfying "any element in the left sub-array $\leq$ pivot $\leq$ any element in the right sub-array." Therefore, we only need to sort these two sub-arrays next.

!!! note "Quick sort's divide and conquer strategy"

    The essence of pivot partitioning is to simplify a longer array's sorting problem into two shorter arrays' sorting problems.

=== "Python"

    ```python title="quick_sort.py"
    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵划分"""
        # 以 nums[left] 为基准数
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 从右向左找首个小于基准数的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 从左向右找首个大于基准数的元素
            # 元素交换
            nums[i], nums[j] = nums[j], nums[i]
        # 将基准数交换至两子数组的分界线
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 返回基准数的索引
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 元素交换 */
    void swap(vector<int> &nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    int partition(vector<int> &nums, int left, int right) {
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            swap(nums, i, j); // 交换这两个元素
        }
        swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i;            // 返回基准数的索引
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 元素交换 */
    void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    int partition(int[] nums, int left, int right) {
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            swap(nums, i, j); // 交换这两个元素
        }
        swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i;             // 返回基准数的索引
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 元素交换 */
    void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 哨兵划分 */
    int Partition(int[] nums, int left, int right) {
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            Swap(nums, i, j); // 交换这两个元素
        }
        Swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i;             // 返回基准数的索引
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 哨兵划分 */
    func (q *quickSort) partition(nums []int, left, right int) int {
        // 以 nums[left] 为基准数
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // 从右向左找首个小于基准数的元素
            }
            for i < j && nums[i] <= nums[left] {
                i++ // 从左向右找首个大于基准数的元素
            }
            // 元素交换
            nums[i], nums[j] = nums[j], nums[i]
        }
        // 将基准数交换至两子数组的分界线
        nums[i], nums[left] = nums[left], nums[i]
        return i // 返回基准数的索引
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 哨兵划分 */
    func partition(nums: inout [Int], left: Int, right: Int) -> Int {
        // 以 nums[left] 为基准数
        var i = left
        var j = right
        while i < j {
            while i < j, nums[j] >= nums[left] {
                j -= 1 // 从右向左找首个小于基准数的元素
            }
            while i < j, nums[i] <= nums[left] {
                i += 1 // 从左向右找首个大于基准数的元素
            }
            nums.swapAt(i, j) // 交换这两个元素
        }
        nums.swapAt(i, left) // 将基准数交换至两子数组的分界线
        return i // 返回基准数的索引
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 元素交换 */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    partition(nums, left, right) {
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            // 元素交换
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 元素交换 */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    partition(nums: number[], left: number, right: number): number {
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            // 元素交换
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 元素交换 */
    void _swap(List<int> nums, int i, int j) {
      int tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;
    }

    /* 哨兵划分 */
    int _partition(List<int> nums, int left, int right) {
      // 以 nums[left] 为基准数
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
        while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
        _swap(nums, i, j); // 交换这两个元素
      }
      _swap(nums, i, left); // 将基准数交换至两子数组的分界线
      return i; // 返回基准数的索引
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 哨兵划分 */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 以 nums[left] 为基准数
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            nums.swap(i, j); // 交换这两个元素
        }
        nums.swap(i, left); // 将基准数交换至两子数组的分界线
        i // 返回基准数的索引
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 元素交换 */
    void swap(int nums[], int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 哨兵划分 */
    int partition(int nums[], int left, int right) {
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 从右向左找首个小于基准数的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 从左向右找首个大于基准数的元素
            }
            // 交换这两个元素
            swap(nums, i, j);
        }
        // 将基准数交换至两子数组的分界线
        swap(nums, i, left);
        // 返回基准数的索引
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 元素交换 */
    fun swap(nums: IntArray, i: Int, j: Int) {
        val temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }

    /* 哨兵划分 */
    fun partition(nums: IntArray, left: Int, right: Int): Int {
        // 以 nums[left] 为基准数
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--           // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++           // 从左向右找首个大于基准数的元素
            swap(nums, i, j)  // 交换这两个元素
        }
        swap(nums, i, left)   // 将基准数交换至两子数组的分界线
        return i              // 返回基准数的索引
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSort}-[func]{partition}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    // 元素交换
    fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 哨兵划分
    fn partition(nums: []i32, left: usize, right: usize) usize {
        // 以 nums[left] 为基准数
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 从右向左找首个小于基准数的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 从左向右找首个大于基准数的元素
            swap(nums, i, j);   // 交换这两个元素
        }
        swap(nums, i, left);    // 将基准数交换至两子数组的分界线
        return i;               // 返回基准数的索引
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.5.1 &nbsp; Algorithm process

The overall process of quick sort is shown in Figure 11-9.

1. First, perform a "pivot partitioning" on the original array to obtain the unsorted left and right sub-arrays.
2. Then, recursively perform "pivot partitioning" on both the left and right sub-arrays.
3. Continue recursively until the sub-array length reaches 1, thus completing the sorting of the entire array.

![Quick sort process](quick_sort.assets/quick_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-9 &nbsp; Quick sort process </p>

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序"""
        # 子数组长度为 1 时终止递归
        if left >= right:
            return
        # 哨兵划分
        pivot = self.partition(nums, left, right)
        # 递归左子数组、右子数组
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 快速排序 */
    void quickSort(vector<int> &nums, int left, int right) {
        // 子数组长度为 1 时终止递归
        if (left >= right)
            return;
        // 哨兵划分
        int pivot = partition(nums, left, right);
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 快速排序 */
    void quickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止递归
        if (left >= right)
            return;
        // 哨兵划分
        int pivot = partition(nums, left, right);
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 快速排序 */
    void QuickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止递归
        if (left >= right)
            return;
        // 哨兵划分
        int pivot = Partition(nums, left, right);
        // 递归左子数组、右子数组
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 快速排序 */
    func (q *quickSort) quickSort(nums []int, left, right int) {
        // 子数组长度为 1 时终止递归
        if left >= right {
            return
        }
        // 哨兵划分
        pivot := q.partition(nums, left, right)
        // 递归左子数组、右子数组
        q.quickSort(nums, left, pivot-1)
        q.quickSort(nums, pivot+1, right)
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 快速排序 */
    func quickSort(nums: inout [Int], left: Int, right: Int) {
        // 子数组长度为 1 时终止递归
        if left >= right {
            return
        }
        // 哨兵划分
        let pivot = partition(nums: &nums, left: left, right: right)
        // 递归左子数组、右子数组
        quickSort(nums: &nums, left: left, right: pivot - 1)
        quickSort(nums: &nums, left: pivot + 1, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 快速排序 */
    quickSort(nums, left, right) {
        // 子数组长度为 1 时终止递归
        if (left >= right) return;
        // 哨兵划分
        const pivot = this.partition(nums, left, right);
        // 递归左子数组、右子数组
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 快速排序 */
    quickSort(nums: number[], left: number, right: number): void {
        // 子数组长度为 1 时终止递归
        if (left >= right) {
            return;
        }
        // 哨兵划分
        const pivot = this.partition(nums, left, right);
        // 递归左子数组、右子数组
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 快速排序 */
    void quickSort(List<int> nums, int left, int right) {
      // 子数组长度为 1 时终止递归
      if (left >= right) return;
      // 哨兵划分
      int pivot = _partition(nums, left, right);
      // 递归左子数组、右子数组
      quickSort(nums, left, pivot - 1);
      quickSort(nums, pivot + 1, right);
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 快速排序 */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // 子数组长度为 1 时终止递归
        if left >= right {
            return;
        }
        // 哨兵划分
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // 递归左子数组、右子数组
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 快速排序 */
    void quickSort(int nums[], int left, int right) {
        // 子数组长度为 1 时终止递归
        if (left >= right) {
            return;
        }
        // 哨兵划分
        int pivot = partition(nums, left, right);
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 快速排序 */
    fun quickSort(nums: IntArray, left: Int, right: Int) {
        // 子数组长度为 1 时终止递归
        if (left >= right) return
        // 哨兵划分
        val pivot = partition(nums, left, right)
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1)
        quickSort(nums, pivot + 1, right)
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSort}-[func]{quick_sort}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    // 快速排序
    fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 子数组长度为 1 时终止递归
        if (left >= right) return;
        // 哨兵划分
        var pivot = partition(nums, left, right);
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E6%97%B6%E7%BB%88%E6%AD%A2%E9%80%92%E5%BD%92%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%0A%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E3%80%81%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E6%97%B6%E7%BB%88%E6%AD%A2%E9%80%92%E5%BD%92%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%0A%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E3%80%81%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.5.2 &nbsp; Algorithm features

- **Time complexity of $O(n \log n)$, adaptive sorting**: In average cases, the recursive levels of pivot partitioning are $\log n$, and the total number of loops per level is $n$, using $O(n \log n)$ time overall. In the worst case, each round of pivot partitioning divides an array of length $n$ into two sub-arrays of lengths $0$ and $n - 1$, reaching $n$ recursive levels, and using $O(n^2)$ time overall.
- **Space complexity of $O(n)$, in-place sorting**: In completely reversed input arrays, reaching the worst recursion depth of $n$, using $O(n)$ stack frame space. The sorting operation is performed on the original array without the aid of additional arrays.
- **Non-stable sorting**: In the final step of pivot partitioning, the pivot may be swapped to the right of equal elements.

## 11.5.3 &nbsp; Why is quick sort fast

From its name, it is apparent that quick sort should have certain efficiency advantages. Although the average time complexity of quick sort is the same as "merge sort" and "heap sort," quick sort is generally more efficient, mainly for the following reasons.

- **Low probability of worst-case scenarios**: Although the worst time complexity of quick sort is $O(n^2)$, less stable than merge sort, in most cases, quick sort can operate under a time complexity of $O(n \log n)$.
- **High cache usage efficiency**: During the pivot partitioning operation, the system can load the entire sub-array into the cache, thus accessing elements more efficiently. In contrast, algorithms like "heap sort" need to access elements in a jumping manner, lacking this feature.
- **Small constant coefficient of complexity**: Among the mentioned algorithms, quick sort has the fewest total number of comparisons, assignments, and swaps. This is similar to why "insertion sort" is faster than "bubble sort."

## 11.5.4 &nbsp; Pivot optimization

**Quick sort's time efficiency may decrease under certain inputs**. For example, if the input array is completely reversed, since we select the leftmost element as the pivot, after the pivot partitioning, the pivot is swapped to the array's right end, causing the left sub-array length to be $n - 1$ and the right sub-array length to be $0$. If this recursion continues, each round of pivot partitioning will have a sub-array length of $0$, and the divide and conquer strategy fails, degrading quick sort to a form similar to "bubble sort."

To avoid this situation, **we can optimize the strategy for selecting the pivot in the pivot partitioning**. For instance, we can randomly select an element as the pivot. However, if luck is not on our side, and we keep selecting suboptimal pivots, the efficiency is still not satisfactory.

It's important to note that programming languages usually generate "pseudo-random numbers". If we construct a specific test case for a pseudo-random number sequence, the efficiency of quick sort may still degrade.

For further improvement, we can select three candidate elements (usually the first, last, and midpoint elements of the array), **and use the median of these three candidate elements as the pivot**. This significantly increases the probability that the pivot is "neither too small nor too large". Of course, we can also select more candidate elements to further enhance the algorithm's robustness. Using this method significantly reduces the probability of time complexity degradation to $O(n^2)$.

Sample code is as follows:

=== "Python"

    ```python title="quick_sort.py"
    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """选取三个候选元素的中位数"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m 在 l 和 r 之间
        if (m <= l <= r) or (r <= l <= m):
            return left  # l 在 m 和 r 之间
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """哨兵划分（三数取中值）"""
        # 以 nums[left] 为基准数
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 将中位数交换至数组最左端
        nums[left], nums[med] = nums[med], nums[left]
        # 以 nums[left] 为基准数
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 从右向左找首个小于基准数的元素
            while i < j and nums[i] <= nums[left]:
                i += 1  # 从左向右找首个大于基准数的元素
            # 元素交换
            nums[i], nums[j] = nums[j], nums[i]
        # 将基准数交换至两子数组的分界线
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 返回基准数的索引
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 选取三个候选元素的中位数 */
    int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    /* 哨兵划分（三数取中值） */
    int partition(vector<int> &nums, int left, int right) {
        // 选取三个候选元素的中位数
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        swap(nums, left, med);
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            swap(nums, i, j); // 交换这两个元素
        }
        swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i;            // 返回基准数的索引
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 选取三个候选元素的中位数 */
    int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    /* 哨兵划分（三数取中值） */
    int partition(int[] nums, int left, int right) {
        // 选取三个候选元素的中位数
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        swap(nums, left, med);
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            swap(nums, i, j); // 交换这两个元素
        }
        swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i;             // 返回基准数的索引
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 选取三个候选元素的中位数 */
    int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    /* 哨兵划分（三数取中值） */
    int Partition(int[] nums, int left, int right) {
        // 选取三个候选元素的中位数
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        Swap(nums, left, med);
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            Swap(nums, i, j); // 交换这两个元素
        }
        Swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i;             // 返回基准数的索引
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 选取三个候选元素的中位数 */
    func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
        l, m, r := nums[left], nums[mid], nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m 在 l 和 r 之间
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l 在 m 和 r 之间
        }
        return right
    }

    /* 哨兵划分（三数取中值）*/
    func (q *quickSortMedian) partition(nums []int, left, right int) int {
        // 以 nums[left] 为基准数
        med := q.medianThree(nums, left, (left+right)/2, right)
        // 将中位数交换至数组最左端
        nums[left], nums[med] = nums[med], nums[left]
        // 以 nums[left] 为基准数
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- //从右向左找首个小于基准数的元素
            }
            for i < j && nums[i] <= nums[left] {
                i++ //从左向右找首个大于基准数的元素
            }
            //元素交换
            nums[i], nums[j] = nums[j], nums[i]
        }
        //将基准数交换至两子数组的分界线
        nums[i], nums[left] = nums[left], nums[i]
        return i //返回基准数的索引
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 选取三个候选元素的中位数 */
    func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
        let l = nums[left]
        let m = nums[mid]
        let r = nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m 在 l 和 r 之间
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l 在 m 和 r 之间
        }
        return right
    }

    /* 哨兵划分（三数取中值） */
    func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
        // 选取三个候选元素的中位数
        let med = medianThree(nums: nums, left: left, mid: (left + right) / 2, right: right)
        // 将中位数交换至数组最左端
        nums.swapAt(left, med)
        return partition(nums: &nums, left: left, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 选取三个候选元素的中位数 */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m 在 l 和 r 之间
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l 在 m 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 哨兵划分（三数取中值） */
    partition(nums, left, right) {
        // 选取三个候选元素的中位数
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 将中位数交换至数组最左端
        this.swap(nums, left, med);
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 选取三个候选元素的中位数 */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m 在 l 和 r 之间
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l 在 m 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* 哨兵划分（三数取中值） */
    partition(nums: number[], left: number, right: number): number {
        // 选取三个候选元素的中位数
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // 将中位数交换至数组最左端
        this.swap(nums, left, med);
        // 以 nums[left] 为基准数
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // 从右向左找首个小于基准数的元素
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // 从左向右找首个大于基准数的元素
            }
            this.swap(nums, i, j); // 交换这两个元素
        }
        this.swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 选取三个候选元素的中位数 */
    int _medianThree(List<int> nums, int left, int mid, int right) {
      int l = nums[left], m = nums[mid], r = nums[right];
      if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m 在 l 和 r 之间
      if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l 在 m 和 r 之间
      return right;
    }

    /* 哨兵划分（三数取中值） */
    int _partition(List<int> nums, int left, int right) {
      // 选取三个候选元素的中位数
      int med = _medianThree(nums, left, (left + right) ~/ 2, right);
      // 将中位数交换至数组最左端
      _swap(nums, left, med);
      // 以 nums[left] 为基准数
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
        while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
        _swap(nums, i, j); // 交换这两个元素
      }
      _swap(nums, i, left); // 将基准数交换至两子数组的分界线
      return i; // 返回基准数的索引
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 选取三个候选元素的中位数 */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m 在 l 和 r 之间
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l 在 m 和 r 之间
        }
        right
    }

    /* 哨兵划分（三数取中值） */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // 选取三个候选元素的中位数
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        nums.swap(left, med);
        // 以 nums[left] 为基准数
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // 从右向左找首个小于基准数的元素
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // 从左向右找首个大于基准数的元素
            }
            nums.swap(i, j); // 交换这两个元素
        }
        nums.swap(i, left); // 将基准数交换至两子数组的分界线
        i // 返回基准数的索引
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 选取三个候选元素的中位数 */
    int medianThree(int nums[], int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    /* 哨兵划分（三数取中值） */
    int partitionMedian(int nums[], int left, int right) {
        // 选取三个候选元素的中位数
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        swap(nums, left, med);
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            swap(nums, i, j); // 交换这两个元素
        }
        swap(nums, i, left); // 将基准数交换至两子数组的分界线
        return i;            // 返回基准数的索引
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 选取三个候选元素的中位数 */
    fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
        val l = nums[left]
        val m = nums[mid]
        val r = nums[right]
        if ((m in l..r) || (m in r..l))
            return mid  // m 在 l 和 r 之间
        if ((l in m..r) || (l in r..m))
            return left // l 在 m 和 r 之间
        return right
    }

    /* 哨兵划分（三数取中值） */
    fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
        // 选取三个候选元素的中位数
        val med = medianThree(nums, left, (left + right) / 2, right)
        // 将中位数交换至数组最左端
        swap(nums, left, med)
        // 以 nums[left] 为基准数
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--                      // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++                      // 从左向右找首个大于基准数的元素
            swap(nums, i, j)             // 交换这两个元素
        }
        swap(nums, i, left)              // 将基准数交换至两子数组的分界线
        return i                         // 返回基准数的索引
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSortMedian}-[func]{median_three}

    [class]{QuickSortMedian}-[func]{partition}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    // 选取三个候选元素的中位数
    fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    // 哨兵划分（三数取中值）
    fn partition(nums: []i32, left: usize, right: usize) usize {
        // 选取三个候选元素的中位数
        var med = medianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        swap(nums, left, med);
        // 以 nums[left] 为基准数
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 从右向左找首个小于基准数的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 从左向右找首个大于基准数的元素
            swap(nums, i, j);   // 交换这两个元素
        }
        swap(nums, i, left);    // 将基准数交换至两子数组的分界线
        return i;               // 返回基准数的索引
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%80%89%E5%8F%96%E4%B8%89%E4%B8%AA%E5%80%99%E9%80%89%E5%85%83%E7%B4%A0%E7%9A%84%E4%B8%AD%E4%BD%8D%E6%95%B0%22%22%22%0A%20%20%20%20l,%20m,%20r%20%3D%20nums%5Bleft%5D,%20nums%5Bmid%5D,%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%20%E5%9C%A8%20l%20%E5%92%8C%20r%20%E4%B9%8B%E9%97%B4%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%20%E5%9C%A8%20m%20%E5%92%8C%20r%20%E4%B9%8B%E9%97%B4%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%EF%BC%88%E4%B8%89%E6%95%B0%E5%8F%96%E4%B8%AD%E5%80%BC%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20med%20%3D%20median_three%28nums,%20left,%20%28left%20%2B%20right%29%20//%202,%20right%29%0A%20%20%20%20%23%20%E5%B0%86%E4%B8%AD%E4%BD%8D%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E6%95%B0%E7%BB%84%E6%9C%80%E5%B7%A6%E7%AB%AF%0A%20%20%20%20nums%5Bleft%5D,%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D,%20nums%5Bleft%5D%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%B8%AD%E4%BD%8D%E5%9F%BA%E5%87%86%E6%95%B0%E4%BC%98%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%EF%BC%88%E4%B8%AD%E4%BD%8D%E5%9F%BA%E5%87%86%E6%95%B0%E4%BC%98%E5%8C%96%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%80%89%E5%8F%96%E4%B8%89%E4%B8%AA%E5%80%99%E9%80%89%E5%85%83%E7%B4%A0%E7%9A%84%E4%B8%AD%E4%BD%8D%E6%95%B0%22%22%22%0A%20%20%20%20l,%20m,%20r%20%3D%20nums%5Bleft%5D,%20nums%5Bmid%5D,%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%20%E5%9C%A8%20l%20%E5%92%8C%20r%20%E4%B9%8B%E9%97%B4%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%20%E5%9C%A8%20m%20%E5%92%8C%20r%20%E4%B9%8B%E9%97%B4%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%EF%BC%88%E4%B8%89%E6%95%B0%E5%8F%96%E4%B8%AD%E5%80%BC%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20med%20%3D%20median_three%28nums,%20left,%20%28left%20%2B%20right%29%20//%202,%20right%29%0A%20%20%20%20%23%20%E5%B0%86%E4%B8%AD%E4%BD%8D%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E6%95%B0%E7%BB%84%E6%9C%80%E5%B7%A6%E7%AB%AF%0A%20%20%20%20nums%5Bleft%5D,%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D,%20nums%5Bleft%5D%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%B8%AD%E4%BD%8D%E5%9F%BA%E5%87%86%E6%95%B0%E4%BC%98%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%EF%BC%88%E4%B8%AD%E4%BD%8D%E5%9F%BA%E5%87%86%E6%95%B0%E4%BC%98%E5%8C%96%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.5.5 &nbsp; Tail recursion optimization

**Under certain inputs, quick sort may occupy more space**. For a completely ordered input array, assume the sub-array length in recursion is $m$, each round of pivot partitioning produces a left sub-array of length $0$ and a right sub-array of length $m - 1$, meaning the problem size reduced per recursive call is very small (only one element), and the height of the recursion tree can reach $n - 1$, requiring $O(n)$ stack frame space.

To prevent the accumulation of stack frame space, we can compare the lengths of the two sub-arrays after each round of pivot sorting, **and only recursively sort the shorter sub-array**. Since the length of the shorter sub-array will not exceed $n / 2$, this method ensures that the recursion depth does not exceed $\log n$, thus optimizing the worst space complexity to $O(\log n)$. The code is as follows:

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """快速排序（尾递归优化）"""
        # 子数组长度为 1 时终止
        while left < right:
            # 哨兵划分操作
            pivot = self.partition(nums, left, right)
            # 对两个子数组中较短的那个执行快速排序
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 递归排序左子数组
                left = pivot + 1  # 剩余未排序区间为 [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 递归排序右子数组
                right = pivot - 1  # 剩余未排序区间为 [left, pivot - 1]
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* 快速排序（尾递归优化） */
    void quickSort(vector<int> &nums, int left, int right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            int pivot = partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 递归排序左子数组
                left = pivot + 1;                 // 剩余未排序区间为 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1;                 // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* 快速排序（尾递归优化） */
    void quickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            int pivot = partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 递归排序左子数组
                left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* 快速排序（尾递归优化） */
    void QuickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            int pivot = Partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 递归排序左子数组
                left = pivot + 1;  // 剩余未排序区间为 [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* 快速排序（尾递归优化）*/
    func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
        // 子数组长度为 1 时终止
        for left < right {
            // 哨兵划分操作
            pivot := q.partition(nums, left, right)
            // 对两个子数组中较短的那个执行快速排序
            if pivot-left < right-pivot {
                q.quickSort(nums, left, pivot-1) // 递归排序左子数组
                left = pivot + 1                 // 剩余未排序区间为 [pivot + 1, right]
            } else {
                q.quickSort(nums, pivot+1, right) // 递归排序右子数组
                right = pivot - 1                 // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* 快速排序（尾递归优化） */
    func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
        var left = left
        var right = right
        // 子数组长度为 1 时终止
        while left < right {
            // 哨兵划分操作
            let pivot = partition(nums: &nums, left: left, right: right)
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left) < (right - pivot) {
                quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 递归排序左子数组
                left = pivot + 1 // 剩余未排序区间为 [pivot + 1, right]
            } else {
                quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 递归排序右子数组
                right = pivot - 1 // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* 快速排序（尾递归优化） */
    quickSort(nums, left, right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            let pivot = this.partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 递归排序左子数组
                left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* 快速排序（尾递归优化） */
    quickSort(nums: number[], left: number, right: number): void {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            let pivot = this.partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // 递归排序左子数组
                left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* 快速排序（尾递归优化） */
    void quickSort(List<int> nums, int left, int right) {
      // 子数组长度为 1 时终止
      while (left < right) {
        // 哨兵划分操作
        int pivot = _partition(nums, left, right);
        // 对两个子数组中较短的那个执行快速排序
        if (pivot - left < right - pivot) {
          quickSort(nums, left, pivot - 1); // 递归排序左子数组
          left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
        } else {
          quickSort(nums, pivot + 1, right); // 递归排序右子数组
          right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
        }
      }
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* 快速排序（尾递归优化） */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // 子数组长度为 1 时终止
        while left < right {
            // 哨兵划分操作
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // 对两个子数组中较短的那个执行快速排序
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // 递归排序左子数组
                left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* 快速排序（尾递归优化） */
    void quickSortTailCall(int nums[], int left, int right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            int pivot = partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                // 递归排序左子数组
                quickSortTailCall(nums, left, pivot - 1);
                // 剩余未排序区间为 [pivot + 1, right]
                left = pivot + 1;
            } else {
                // 递归排序右子数组
                quickSortTailCall(nums, pivot + 1, right);
                // 剩余未排序区间为 [left, pivot - 1]
                right = pivot - 1;
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* 快速排序（尾递归优化） */
    fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
        // 子数组长度为 1 时终止
        var l = left
        var r = right
        while (l < r) {
            // 哨兵划分操作
            val pivot = partition(nums, l, r)
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - l < r - pivot) {
                quickSort(nums, l, pivot - 1) // 递归排序左子数组
                l = pivot + 1 // 剩余未排序区间为 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, r) // 递归排序右子数组
                r = pivot - 1 // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSortTailCall}-[func]{quick_sort}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    // 快速排序（尾递归优化）
    fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // 子数组长度为 1 时终止递归
        while (left < right) {
            // 哨兵划分操作
            var pivot = partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // 递归排序左子数组
                left = pivot + 1;                   // 剩余未排序区间为 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right);  // 递归排序右子数组
                right = pivot - 1;                  // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%EF%BC%88%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E6%97%B6%E7%BB%88%E6%AD%A2%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%E6%93%8D%E4%BD%9C%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%20%20%20%20%23%20%E5%AF%B9%E4%B8%A4%E4%B8%AA%E5%AD%90%E6%95%B0%E7%BB%84%E4%B8%AD%E8%BE%83%E7%9F%AD%E7%9A%84%E9%82%A3%E4%B8%AA%E6%89%A7%E8%A1%8C%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%20%20%23%20%E9%80%92%E5%BD%92%E6%8E%92%E5%BA%8F%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%20%20%23%20%E5%89%A9%E4%BD%99%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bpivot%20%2B%201,%20right%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%20%20%23%20%E9%80%92%E5%BD%92%E6%8E%92%E5%BA%8F%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%20%20%23%20%E5%89%A9%E4%BD%99%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bleft,%20pivot%20-%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%EF%BC%88%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96%EF%BC%89%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%EF%BC%88%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%22%22%22%0A%20%20%20%20%23%20%E4%BB%A5%20nums%5Bleft%5D%20%E4%B8%BA%E5%9F%BA%E5%87%86%E6%95%B0%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%E4%BB%8E%E5%8F%B3%E5%90%91%E5%B7%A6%E6%89%BE%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E4%BB%8E%E5%B7%A6%E5%90%91%E5%8F%B3%E6%89%BE%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20%E5%B0%86%E5%9F%BA%E5%87%86%E6%95%B0%E4%BA%A4%E6%8D%A2%E8%87%B3%E4%B8%A4%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%88%86%E7%95%8C%E7%BA%BF%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%E8%BF%94%E5%9B%9E%E5%9F%BA%E5%87%86%E6%95%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%EF%BC%88%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E6%97%B6%E7%BB%88%E6%AD%A2%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%93%A8%E5%85%B5%E5%88%92%E5%88%86%E6%93%8D%E4%BD%9C%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%20%20%20%20%23%20%E5%AF%B9%E4%B8%A4%E4%B8%AA%E5%AD%90%E6%95%B0%E7%BB%84%E4%B8%AD%E8%BE%83%E7%9F%AD%E7%9A%84%E9%82%A3%E4%B8%AA%E6%89%A7%E8%A1%8C%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%20%20%23%20%E9%80%92%E5%BD%92%E6%8E%92%E5%BA%8F%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%20%20%23%20%E5%89%A9%E4%BD%99%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bpivot%20%2B%201,%20right%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%20%20%23%20%E9%80%92%E5%BD%92%E6%8E%92%E5%BA%8F%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%20%20%23%20%E5%89%A9%E4%BD%99%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bleft,%20pivot%20-%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%EF%BC%88%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96%EF%BC%89%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F%EF%BC%88%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>
