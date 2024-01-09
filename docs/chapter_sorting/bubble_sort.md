---
comments: true
---

# 11.3 &nbsp; 冒泡排序

「冒泡排序 bubble sort」通过连续地比较与交换相邻元素实现排序。这个过程就像气泡从底部升到顶部一样，因此得名冒泡排序。

如图 11-4 所示，冒泡过程可以利用元素交换操作来模拟：从数组最左端开始向右遍历，依次比较相邻元素大小，如果“左元素 > 右元素”就交换二者。遍历完成后，最大的元素会被移动到数组的最右端。

=== "<1>"
    ![利用元素交换操作模拟冒泡](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

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

<p align="center"> 图 11-4 &nbsp; 利用元素交换操作模拟冒泡 </p>

## 11.3.1 &nbsp; 算法流程

设数组的长度为 $n$ ，冒泡排序的步骤如图 11-5 所示。

1. 首先，对 $n$ 个元素执行“冒泡”，**将数组的最大元素交换至正确位置**。
2. 接下来，对剩余 $n - 1$ 个元素执行“冒泡”，**将第二大元素交换至正确位置**。
3. 以此类推，经过 $n - 1$ 轮“冒泡”后，**前 $n - 1$ 大的元素都被交换至正确位置**。
4. 仅剩的一个元素必定是最小元素，无须排序，因此数组排序完成。

![冒泡排序流程](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> 图 11-5 &nbsp; 冒泡排序流程 </p>

示例代码如下：

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
        for i in stride(from: nums.count - 1, to: 0, by: -1) {
            // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端 
            for j in stride(from: 0, to: i, by: 1) {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
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

??? pythontutor "可视化运行"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

## 11.3.2 &nbsp; 效率优化

我们发现，如果某轮“冒泡”中没有执行任何交换操作，说明数组已经完成排序，可直接返回结果。因此，可以增加一个标志位 `flag` 来监测这种情况，一旦出现就立即返回。

经过优化，冒泡排序的最差时间复杂度和平均时间复杂度仍为 $O(n^2)$ ；但当输入数组完全有序时，可达到最佳时间复杂度 $O(n)$ 。

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
        for i in stride(from: nums.count - 1, to: 0, by: -1) {
            var flag = false // 初始化标志位
            for j in stride(from: 0, to: i, by: 1) {
                if nums[j] > nums[j + 1] {
                    // 交换 nums[j] 与 nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
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
                    flag = true;  // 记录交换元素
                }
            }
            if !flag {break};  // 此轮“冒泡”未交换任何元素，直接跳出
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

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A0%87%E5%BF%97%E4%BC%98%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%87%E5%BF%97%E4%BD%8D%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E8%AE%B0%E5%BD%95%E4%BA%A4%E6%8D%A2%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E6%AD%A4%E8%BD%AE%E2%80%9C%E5%86%92%E6%B3%A1%E2%80%9D%E6%9C%AA%E4%BA%A4%E6%8D%A2%E4%BB%BB%E4%BD%95%E5%85%83%E7%B4%A0%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E5%87%BA%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A0%87%E5%BF%97%E4%BC%98%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%87%E5%BF%97%E4%BD%8D%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E5%B0%86%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%20%5B0,%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%E8%87%B3%E8%AF%A5%E5%8C%BA%E9%97%B4%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8D%A2%20nums%5Bj%5D%20%E4%B8%8E%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E8%AE%B0%E5%BD%95%E4%BA%A4%E6%8D%A2%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E6%AD%A4%E8%BD%AE%E2%80%9C%E5%86%92%E6%B3%A1%E2%80%9D%E6%9C%AA%E4%BA%A4%E6%8D%A2%E4%BB%BB%E4%BD%95%E5%85%83%E7%B4%A0%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E5%87%BA%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

## 11.3.3 &nbsp; 算法特性

- **时间复杂度为 $O(n^2)$、自适应排序**：各轮“冒泡”遍历的数组长度依次为 $n - 1$、$n - 2$、$\dots$、$2$、$1$ ，总和为 $(n - 1) n / 2$ 。在引入 `flag` 优化后，最佳时间复杂度可达到 $O(n)$ 。
- **空间复杂度为 $O(1)$、原地排序**：指针 $i$ 和 $j$ 使用常数大小的额外空间。
- **稳定排序**：由于在“冒泡”中遇到相等元素不交换。
