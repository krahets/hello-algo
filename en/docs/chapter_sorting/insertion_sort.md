---
comments: true
---

# 11.4 &nbsp; Insertion sort

<u>Insertion sort</u> is a simple sorting algorithm that works very much like the process of manually sorting a deck of cards.

Specifically, we select a pivot element from the unsorted interval, compare it with the elements in the sorted interval to its left, and insert the element into the correct position.

The Figure 11-6  shows the process of inserting an element into an array. Assuming the pivot element is `base`, we need to move all elements between the target index and `base` one position to the right, then assign `base` to the target index.

![Single insertion operation](insertion_sort.assets/insertion_operation.png){ class="animation-figure" }

<p align="center"> Figure 11-6 &nbsp; Single insertion operation </p>

## 11.4.1 &nbsp; Algorithm process

The overall process of insertion sort is shown in the following figure.

1. Initially, the first element of the array is sorted.
2. The second element of the array is taken as `base`, and after inserting it into the correct position, **the first two elements of the array are sorted**.
3. The third element is taken as `base`, and after inserting it into the correct position, **the first three elements of the array are sorted**.
4. And so on, in the last round, the last element is taken as `base`, and after inserting it into the correct position, **all elements are sorted**.

![Insertion sort process](insertion_sort.assets/insertion_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-7 &nbsp; Insertion sort process </p>

Example code is as follows:

=== "Python"

    ```python title="insertion_sort.py"
    def insertion_sort(nums: list[int]):
        """插入排序"""
        # 外循环：已排序区间为 [0, i-1]
        for i in range(1, len(nums)):
            base = nums[i]
            j = i - 1
            # 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while j >= 0 and nums[j] > base:
                nums[j + 1] = nums[j]  # 将 nums[j] 向右移动一位
                j -= 1
            nums[j + 1] = base  # 将 base 赋值到正确位置
    ```

=== "C++"

    ```cpp title="insertion_sort.cpp"
    /* 插入排序 */
    void insertionSort(vector<int> &nums) {
        // 外循环：已排序区间为 [0, i-1]
        for (int i = 1; i < nums.size(); i++) {
            int base = nums[i], j = i - 1;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = base; // 将 base 赋值到正确位置
        }
    }
    ```

=== "Java"

    ```java title="insertion_sort.java"
    /* 插入排序 */
    void insertionSort(int[] nums) {
        // 外循环：已排序区间为 [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = base;        // 将 base 赋值到正确位置
        }
    }
    ```

=== "C#"

    ```csharp title="insertion_sort.cs"
    /* 插入排序 */
    void InsertionSort(int[] nums) {
        // 外循环：已排序区间为 [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = bas;         // 将 base 赋值到正确位置
        }
    }
    ```

=== "Go"

    ```go title="insertion_sort.go"
    /* 插入排序 */
    func insertionSort(nums []int) {
        // 外循环：已排序区间为 [0, i-1]
        for i := 1; i < len(nums); i++ {
            base := nums[i]
            j := i - 1
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            for j >= 0 && nums[j] > base {
                nums[j+1] = nums[j] // 将 nums[j] 向右移动一位
                j--
            }
            nums[j+1] = base // 将 base 赋值到正确位置
        }
    }
    ```

=== "Swift"

    ```swift title="insertion_sort.swift"
    /* 插入排序 */
    func insertionSort(nums: inout [Int]) {
        // 外循环：已排序区间为 [0, i-1]
        for i in nums.indices.dropFirst() {
            let base = nums[i]
            var j = i - 1
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while j >= 0, nums[j] > base {
                nums[j + 1] = nums[j] // 将 nums[j] 向右移动一位
                j -= 1
            }
            nums[j + 1] = base // 将 base 赋值到正确位置
        }
    }
    ```

=== "JS"

    ```javascript title="insertion_sort.js"
    /* 插入排序 */
    function insertionSort(nums) {
        // 外循环：已排序区间为 [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            let base = nums[i],
                j = i - 1;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = base; // 将 base 赋值到正确位置
        }
    }
    ```

=== "TS"

    ```typescript title="insertion_sort.ts"
    /* 插入排序 */
    function insertionSort(nums: number[]): void {
        // 外循环：已排序区间为 [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            const base = nums[i];
            let j = i - 1;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = base; // 将 base 赋值到正确位置
        }
    }
    ```

=== "Dart"

    ```dart title="insertion_sort.dart"
    /* 插入排序 */
    void insertionSort(List<int> nums) {
      // 外循环：已排序区间为 [0, i-1]
      for (int i = 1; i < nums.length; i++) {
        int base = nums[i], j = i - 1;
        // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
        while (j >= 0 && nums[j] > base) {
          nums[j + 1] = nums[j]; // 将 nums[j] 向右移动一位
          j--;
        }
        nums[j + 1] = base; // 将 base 赋值到正确位置
      }
    }
    ```

=== "Rust"

    ```rust title="insertion_sort.rs"
    /* 插入排序 */
    fn insertion_sort(nums: &mut [i32]) {
        // 外循环：已排序区间为 [0, i-1]
        for i in 1..nums.len() {
            let (base, mut j) = (nums[i], (i - 1) as i32);
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while j >= 0 && nums[j as usize] > base {
                nums[(j + 1) as usize] = nums[j as usize]; // 将 nums[j] 向右移动一位
                j -= 1;
            }
            nums[(j + 1) as usize] = base; // 将 base 赋值到正确位置
        }
    }
    ```

=== "C"

    ```c title="insertion_sort.c"
    /* 插入排序 */
    void insertionSort(int nums[], int size) {
        // 外循环：已排序区间为 [0, i-1]
        for (int i = 1; i < size; i++) {
            int base = nums[i], j = i - 1;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > base) {
                // 将 nums[j] 向右移动一位
                nums[j + 1] = nums[j];
                j--;
            }
            // 将 base 赋值到正确位置
            nums[j + 1] = base;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="insertion_sort.kt"
    /* 插入排序 */
    fun insertionSort(nums: IntArray) {
        //外循环: 已排序元素为 1, 2, ..., n
        for (i in nums.indices) {
            val base = nums[i]
            var j = i - 1
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j] // 将 nums[j] 向右移动一位
                j--
            }
            nums[j + 1] = base        // 将 base 赋值到正确位置
        }
    }
    ```

=== "Ruby"

    ```ruby title="insertion_sort.rb"
    ### 插入排序 ###
    def insertion_sort(nums)
      n = nums.length
      # 外循环：已排序区间为 [0, i-1]
      for i in 1...n
        base = nums[i]
        j = i - 1
        # 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
        while j >= 0 && nums[j] > base
          nums[j + 1] = nums[j] # 将 nums[j] 向右移动一位
          j -= 1
        end
        nums[j + 1] = base # 将 base 赋值到正确位置
      end
    end
    ```

=== "Zig"

    ```zig title="insertion_sort.zig"
    // 插入排序
    fn insertionSort(nums: []i32) void {
        // 外循环：已排序区间为 [0, i-1]
        var i: usize = 1;
        while (i < nums.len) : (i += 1) {
            var base = nums[i];
            var j: usize = i;
            // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
            while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
                nums[j] = nums[j - 1];  // 将 nums[j] 向右移动一位
            }
            nums[j] = base;             // 将 base 赋值到正确位置
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B7%B2%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%20base%20%E6%8F%92%E5%85%A5%E5%88%B0%E5%B7%B2%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i-1%5D%20%E4%B8%AD%E7%9A%84%E6%AD%A3%E7%A1%AE%E4%BD%8D%E7%BD%AE%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20%E5%B0%86%20nums%5Bj%5D%20%E5%90%91%E5%8F%B3%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20%E5%B0%86%20base%20%E8%B5%8B%E5%80%BC%E5%88%B0%E6%AD%A3%E7%A1%AE%E4%BD%8D%E7%BD%AE%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B7%B2%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%20base%20%E6%8F%92%E5%85%A5%E5%88%B0%E5%B7%B2%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i-1%5D%20%E4%B8%AD%E7%9A%84%E6%AD%A3%E7%A1%AE%E4%BD%8D%E7%BD%AE%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20%E5%B0%86%20nums%5Bj%5D%20%E5%90%91%E5%8F%B3%E7%A7%BB%E5%8A%A8%E4%B8%80%E4%BD%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20%E5%B0%86%20base%20%E8%B5%8B%E5%80%BC%E5%88%B0%E6%AD%A3%E7%A1%AE%E4%BD%8D%E7%BD%AE%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.4.2 &nbsp; Algorithm characteristics

- **Time complexity is $O(n^2)$, adaptive sorting**: In the worst case, each insertion operation requires $n - 1$, $n-2$, ..., $2$, $1$ loops, summing up to $(n - 1) n / 2$, thus the time complexity is $O(n^2)$. In the case of ordered data, the insertion operation will terminate early. When the input array is completely ordered, insertion sort achieves the best time complexity of $O(n)$.
- **Space complexity is $O(1)$, in-place sorting**: Pointers $i$ and $j$ use a constant amount of extra space.
- **Stable sorting**: During the insertion operation, we insert elements to the right of equal elements, not changing their order.

## 11.4.3 &nbsp; Advantages of insertion sort

The time complexity of insertion sort is $O(n^2)$, while the time complexity of quicksort, which we will study next, is $O(n \log n)$. Although insertion sort has a higher time complexity, **it is usually faster in cases of small data volumes**.

This conclusion is similar to that for linear and binary search. Algorithms like quicksort that have a time complexity of $O(n \log n)$ and are based on the divide-and-conquer strategy often involve more unit operations. In cases of small data volumes, the numerical values of $n^2$ and $n \log n$ are close, and complexity does not dominate, with the number of unit operations per round playing a decisive role.

In fact, many programming languages (such as Java) use insertion sort in their built-in sorting functions. The general approach is: for long arrays, use sorting algorithms based on divide-and-conquer strategies, such as quicksort; for short arrays, use insertion sort directly.

Although bubble sort, selection sort, and insertion sort all have a time complexity of $O(n^2)$, in practice, **insertion sort is used significantly more frequently than bubble sort and selection sort**, mainly for the following reasons.

- Bubble sort is based on element swapping, which requires the use of a temporary variable, involving 3 unit operations; insertion sort is based on element assignment, requiring only 1 unit operation. Therefore, **the computational overhead of bubble sort is generally higher than that of insertion sort**.
- The time complexity of selection sort is always $O(n^2)$. **Given a set of partially ordered data, insertion sort is usually more efficient than selection sort**.
- Selection sort is unstable and cannot be applied to multi-level sorting.
