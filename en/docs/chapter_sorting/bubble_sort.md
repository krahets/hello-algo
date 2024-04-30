---
comments: true
---

# 11.3 &nbsp; Bubble sort

<u>Bubble sort</u> achieves sorting by continuously comparing and swapping adjacent elements. This process resembles bubbles rising from the bottom to the top, hence the name bubble sort.

As shown in Figure 11-4, the bubbling process can be simulated using element swap operations: starting from the leftmost end of the array and moving right, sequentially compare the size of adjacent elements. If "left element > right element," then swap them. After the traversal, the largest element will be moved to the far right end of the array.

=== "<1>"
    ![Simulating bubble process using element swap](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png){ class="animation-figure" }

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png){ class="animation-figure" }

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png){ class="animation-figure" }

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png){ class="animation-figure" }

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png){ class="animation-figure" }

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png){ class="animation-figure" }

<p align="center"> Figure 11-4 &nbsp; Simulating bubble process using element swap </p>

## 11.3.1 &nbsp; Algorithm process

Assuming the length of the array is $n$, the steps of bubble sort are shown in Figure 11-5.

1. First, perform a "bubble" on $n$ elements, **swapping the largest element to its correct position**.
2. Next, perform a "bubble" on the remaining $n - 1$ elements, **swapping the second largest element to its correct position**.
3. Similarly, after $n - 1$ rounds of "bubbling," **the top $n - 1$ largest elements will be swapped to their correct positions**.
4. The only remaining element is necessarily the smallest and does not require sorting, thus the array sorting is complete.

![Bubble sort process](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-5 &nbsp; Bubble sort process </p>

Example code is as follows:

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """冒泡排序"""
        n = len(nums)
        # 外循环：未排序区间为 [0, i]
        for i in range(n - 1, 0, -1):
            # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # 交换 nums[j] 与 nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* 冒泡排序 */
    void bubbleSort(vector<int> &nums) {
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    // 这里使用了 std::swap() 函数
                    swap(nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* 冒泡排序 */
    void bubbleSort(int[] nums) {
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* 冒泡排序 */
    void BubbleSort(int[] nums) {
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* 冒泡排序 */
    func bubbleSort(nums []int) {
        // 外循环：未排序区间为 [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                }
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* 冒泡排序 */
    func bubbleSort(nums: inout [Int]) {
        // 外循环：未排序区间为 [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* 冒泡排序 */
    function bubbleSort(nums) {
        // 外循环：未排序区间为 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* 冒泡排序 */
    function bubbleSort(nums: number[]): void {
        // 外循环：未排序区间为 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* 冒泡排序 */
    void bubbleSort(List<int> nums) {
      // 外循环：未排序区间为 [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // 交换 nums[j] 与 nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
          }
        }
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* 冒泡排序 */
    fn bubble_sort(nums: &mut [i32]) {
        // 外循环：未排序区间为 [0, i]
        for i in (1..nums.len()).rev() {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* 冒泡排序 */
    void bubbleSort(int nums[], int size) {
        // 外循环：未排序区间为 [0, i]
        for (int i = size - 1; i > 0; i--) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                }
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* 冒泡排序 */
    fun bubbleSort(nums: IntArray) {
        // 外循环：未排序区间为 [0, i]
        for (i in nums.size - 1 downTo 1) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                }
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    [class]{}-[func]{bubble_sort}
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    // 冒泡排序
    fn bubbleSort(nums: []i32) void {
        // 外循环：未排序区间为 [0, i]
        var i: usize = nums.len - 1;
        while (i > 0) : (i -= 1) {
            var j: usize = 0;
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            while (j < i) : (j += 1) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    var tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.3.2 &nbsp; Efficiency optimization

We find that if no swaps are performed in a round of "bubbling," the array is already sorted, and we can return the result immediately. Thus, we can add a flag `flag` to monitor this situation and return immediately when it occurs.

Even after optimization, the worst-case time complexity and average time complexity of bubble sort remain at $O(n^2)$; however, when the input array is completely ordered, it can achieve the best time complexity of $O(n)$.

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """冒泡排序（标志优化）"""
        n = len(nums)
        # 外循环：未排序区间为 [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # 初始化标志位
            # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # 交换 nums[j] 与 nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # 记录交换元素
            if not flag:
                break  # 此轮“冒泡”未交换任何元素，直接跳出
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* 冒泡排序（标志优化）*/
    void bubbleSortWithFlag(vector<int> &nums) {
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    // 这里使用了 std::swap() 函数
                    swap(nums[j], nums[j + 1]);
                    flag = true; // 记录交换元素
                }
            }
            if (!flag)
                break; // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* 冒泡排序（标志优化） */
    void bubbleSortWithFlag(int[] nums) {
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 记录交换元素
                }
            }
            if (!flag)
                break; // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* 冒泡排序（标志优化）*/
    void BubbleSortWithFlag(int[] nums) {
        // 外循环：未排序区间为 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // 记录交换元素
                }
            }
            if (!flag) break;     // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* 冒泡排序（标志优化）*/
    func bubbleSortWithFlag(nums []int) {
        // 外循环：未排序区间为 [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            flag := false // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                    flag = true // 记录交换元素
                }
            }
            if flag == false { // 此轮“冒泡”未交换任何元素，直接跳出
                break
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* 冒泡排序（标志优化）*/
    func bubbleSortWithFlag(nums: inout [Int]) {
        // 外循环：未排序区间为 [0, i]
        for i in nums.indices.dropFirst().reversed() {
            var flag = false // 初始化标志位
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    nums.swapAt(j, j + 1)
                    flag = true // 记录交换元素
                }
            }
            if !flag { // 此轮“冒泡”未交换任何元素，直接跳出
                break
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* 冒泡排序（标志优化）*/
    function bubbleSortWithFlag(nums) {
        // 外循环：未排序区间为 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 记录交换元素
                }
            }
            if (!flag) break; // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* 冒泡排序（标志优化）*/
    function bubbleSortWithFlag(nums: number[]): void {
        // 外循环：未排序区间为 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 记录交换元素
                }
            }
            if (!flag) break; // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* 冒泡排序（标志优化）*/
    void bubbleSortWithFlag(List<int> nums) {
      // 外循环：未排序区间为 [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        bool flag = false; // 初始化标志位
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // 交换 nums[j] 与 nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            flag = true; // 记录交换元素
          }
        }
        if (!flag) break; // 此轮“冒泡”未交换任何元素，直接跳出
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* 冒泡排序（标志优化） */
    fn bubble_sort_with_flag(nums: &mut [i32]) {
        // 外循环：未排序区间为 [0, i]
        for i in (1..nums.len()).rev() {
            let mut flag = false; // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 记录交换元素
                }
            }
            if !flag {
                break; // 此轮“冒泡”未交换任何元素，直接跳出
            };
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* 冒泡排序（标志优化）*/
    void bubbleSortWithFlag(int nums[], int size) {
        // 外循环：未排序区间为 [0, i]
        for (int i = size - 1; i > 0; i--) {
            bool flag = false;
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                    flag = true;
                }
            }
            if (!flag)
                break;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* 冒泡排序（标志优化） */
    fun bubbleSortWithFlag(nums: IntArray) {
        // 外循环：未排序区间为 [0, i]
        for (i in nums.size - 1 downTo 1) {
            var flag = false // 初始化标志位
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    flag = true // 记录交换元素
                }
            }
            if (!flag) break // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    [class]{}-[func]{bubble_sort_with_flag}
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    // 冒泡排序（标志优化）
    fn bubbleSortWithFlag(nums: []i32) void {
        // 外循环：未排序区间为 [0, i]
        var i: usize = nums.len - 1;
        while (i > 0) : (i -= 1) {
            var flag = false;   // 初始化标志位
            var j: usize = 0;
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            while (j < i) : (j += 1) {
                if (nums[j] > nums[j + 1]) {
                    // 交换 nums[j] 与 nums[j + 1]
                    var tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true;
                }
            }
            if (!flag) break;   // 此轮“冒泡”未交换任何元素，直接跳出
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A0%87%E5%BF%97%E4%BC%98%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%87%E5%BF%97%E4%BD%8D%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E8%AE%B0%E5%BD%95%E4%BA%A4%E6%8D%A2%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E6%AD%A4%E8%BD%AE%E2%80%9C%E5%86%92%E6%B3%A1%E2%80%9D%E6%9C%AA%E4%BA%A4%E6%8D%A2%E4%BB%BB%E4%BD%95%E5%85%83%E7%B4%A0%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E5%87%BA%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A0%87%E5%BF%97%E4%BC%98%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%87%E5%BF%97%E4%BD%8D%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E8%AE%B0%E5%BD%95%E4%BA%A4%E6%8D%A2%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E6%AD%A4%E8%BD%AE%E2%80%9C%E5%86%92%E6%B3%A1%E2%80%9D%E6%9C%AA%E4%BA%A4%E6%8D%A2%E4%BB%BB%E4%BD%95%E5%85%83%E7%B4%A0%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E5%87%BA%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.3.3 &nbsp; Algorithm characteristics

- **Time complexity of $O(n^2)$, adaptive sorting**: The length of the array traversed in each round of "bubbling" decreases sequentially from $n - 1$, $n - 2$, $\dots$, $2$, $1$, totaling $(n - 1) n / 2$. With the introduction of `flag` optimization, the best time complexity can reach $O(n)$.
- **Space complexity of $O(1)$, in-place sorting**: Only a constant amount of extra space is used by pointers $i$ and $j$.
- **Stable sorting**: As equal elements are not swapped during the "bubbling".
