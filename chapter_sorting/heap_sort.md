---
comments: true
---

# 11.7. &nbsp; 堆排序

!!! tip

    阅读本节前，请确保已学完「堆」章节。

「堆排序 Heap Sort」是一种基于堆数据结构实现的高效排序算法。我们可以利用已经学过的“建堆操作”和“元素出堆操作”实现堆排序：

1. 输入数组并建立小顶堆，此时最小元素位于堆顶。
2. 不断执行出堆操作，依次记录出堆元素，即可得到从小到大排序的序列。

以上方法虽然可行，但需要借助一个额外数组来保存弹出的元素，比较浪费空间。在实际中，我们通常使用一种更加优雅的实现方式。

## 11.7.1. &nbsp; 算法流程

设数组的长度为 $n$ ，堆排序的流程如下：

1. 输入数组并建立大顶堆。完成后，最大元素位于堆顶。
2. 将堆顶元素（第一个元素）与堆底元素（最后一个元素）交换。完成交换后，堆的长度减 $1$ ，已排序元素数量加 $1$ 。
3. 从堆顶元素开始，从顶到底执行堆化操作（Sift Down）。完成堆化后，堆的性质得到修复。
4. 循环执行第 `2.` 和 `3.` 步。循环 $n - 1$ 轮后，即可完成数组排序。

实际上，元素出堆操作中也包含第 `2.` 和 `3.` 步，只是多了一个弹出元素的步骤。

=== "<1>"
    ![堆排序步骤](heap_sort.assets/heap_sort_step1.png)

=== "<2>"
    ![heap_sort_step2](heap_sort.assets/heap_sort_step2.png)

=== "<3>"
    ![heap_sort_step3](heap_sort.assets/heap_sort_step3.png)

=== "<4>"
    ![heap_sort_step4](heap_sort.assets/heap_sort_step4.png)

=== "<5>"
    ![heap_sort_step5](heap_sort.assets/heap_sort_step5.png)

=== "<6>"
    ![heap_sort_step6](heap_sort.assets/heap_sort_step6.png)

=== "<7>"
    ![heap_sort_step7](heap_sort.assets/heap_sort_step7.png)

=== "<8>"
    ![heap_sort_step8](heap_sort.assets/heap_sort_step8.png)

=== "<9>"
    ![heap_sort_step9](heap_sort.assets/heap_sort_step9.png)

=== "<10>"
    ![heap_sort_step10](heap_sort.assets/heap_sort_step10.png)

=== "<11>"
    ![heap_sort_step11](heap_sort.assets/heap_sort_step11.png)

=== "<12>"
    ![heap_sort_step12](heap_sort.assets/heap_sort_step12.png)

在代码实现中，我们使用了与堆章节相同的从顶至底堆化（Sift Down）的函数。值得注意的是，由于堆的长度会随着提取最大元素而减小，因此我们需要给 Sift Down 函数添加一个长度参数 $n$ ，用于指定堆的当前有效长度。

=== "Java"

    ```java title="heap_sort.java"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    void siftDown(int[] nums, int n, int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i)
                break;
            // 交换两节点
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    void heapSort(int[] nums) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (int i = nums.length - 1; i > 0; i--) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0);
        }
    }
    ```

=== "C++"

    ```cpp title="heap_sort.cpp"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    void siftDown(vector<int> &nums, int n, int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) {
                break;
            }
            // 交换两节点
            swap(nums[i], nums[ma]);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    void heapSort(vector<int> &nums) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (int i = nums.size() / 2 - 1; i >= 0; --i) {
            siftDown(nums, nums.size(), i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (int i = nums.size() - 1; i > 0; --i) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            swap(nums[0], nums[i]);
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Python"

    ```python title="heap_sort.py"
    def sift_down(nums: list[int], n: int, i: int):
        """堆的长度为 n ，从节点 i 开始，从顶至底堆化"""
        while True:
            # 判断节点 i, l, r 中值最大的节点，记为 ma
            l = 2 * i + 1
            r = 2 * i + 2
            ma = i
            if l < n and nums[l] > nums[ma]:
                ma = l
            if r < n and nums[r] > nums[ma]:
                ma = r
            # 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if ma == i:
                break
            # 交换两节点
            nums[i], nums[ma] = nums[ma], nums[i]
            # 循环向下堆化
            i = ma

    def heap_sort(nums: list[int]):
        """堆排序"""
        # 建堆操作：堆化除叶节点以外的其他所有节点
        for i in range(len(nums) // 2 - 1, -1, -1):
            sift_down(nums, len(nums), i)
        # 从堆中提取最大元素，循环 n-1 轮
        for i in range(len(nums) - 1, 0, -1):
            # 交换根节点与最右叶节点（即交换首元素与尾元素）
            nums[0], nums[i] = nums[i], nums[0]
            # 以根节点为起点，从顶至底进行堆化
            sift_down(nums, i, 0)
    ```

=== "Go"

    ```go title="heap_sort.go"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    func siftDown(nums *[]int, n, i int) {
        for true {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            l := 2*i + 1
            r := 2*i + 2
            ma := i
            if l < n && (*nums)[l] > (*nums)[ma] {
                ma = l
            }
            if r < n && (*nums)[r] > (*nums)[ma] {
                ma = r
            }
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if ma == i {
                break
            }
            // 交换两节点
            (*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
            // 循环向下堆化
            i = ma
        }
    }

    /* 堆排序 */
    func heapSort(nums *[]int) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for i := len(*nums)/2 - 1; i >= 0; i-- {
            siftDown(nums, len(*nums), i)
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for i := len(*nums) - 1; i > 0; i-- {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            (*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0)
        }
    }
    ```

=== "JavaScript"

    ```javascript title="heap_sort.js"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    function siftDown(nums, n, i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let ma = i;
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma === i) {
                break;
            }
            // 交换两节点
            [nums[i], nums[ma]] = [nums[ma], nums[i]];
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    function heapSort(nums) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (let i = nums.length - 1; i > 0; i--) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            [nums[0], nums[i]] = [nums[i], nums[0]];
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0);
        }
    }
    ```

=== "TypeScript"

    ```typescript title="heap_sort.ts"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    function siftDown(nums: number[], n: number, i: number): void {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let ma = i;
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma === i) {
                break;
            }
            // 交换两节点
            [nums[i], nums[ma]] = [nums[ma], nums[i]];
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    function heapSort(nums: number[]): void {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (let i = nums.length - 1; i > 0; i--) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            [nums[0], nums[i]] = [nums[i], nums[0]];
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0);
        }
    }
    ```

=== "C"

    ```c title="heap_sort.c"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    void siftDown(int nums[], int n, int i) {
        while (1) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) {
                break;
            }
            // 交换两节点
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    void heapSort(int nums[], int n) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (int i = n / 2 - 1; i >= 0; --i) {
            siftDown(nums, n, i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (int i = n - 1; i > 0; --i) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0);
        }
    }
    ```

=== "C#"

    ```csharp title="heap_sort.cs"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    void siftDown(int[] nums, int n, int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i)
                break;
            // 交换两节点
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    void heapSort(int[] nums) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.Length, i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (int i = nums.Length - 1; i > 0; i--) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Swift"

    ```swift title="heap_sort.swift"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    func siftDown(nums: inout [Int], n: Int, i: Int) {
        var i = i
        while true {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            let l = 2 * i + 1
            let r = 2 * i + 2
            var ma = i
            if l < n, nums[l] > nums[ma] {
                ma = l
            }
            if r < n, nums[r] > nums[ma] {
                ma = r
            }
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if ma == i {
                break
            }
            // 交换两节点
            nums.swapAt(i, ma)
            // 循环向下堆化
            i = ma
        }
    }

    /* 堆排序 */
    func heapSort(nums: inout [Int]) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
            siftDown(nums: &nums, n: nums.count, i: i)
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for i in stride(from: nums.count - 1, to: 0, by: -1) {
            // 交换根节点与最右叶节点（即交换首元素与尾元素）
            nums.swapAt(0, i)
            // 以根节点为起点，从顶至底进行堆化
            siftDown(nums: &nums, n: i, i: 0)
        }
    }
    ```

=== "Zig"

    ```zig title="heap_sort.zig"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Dart"

    ```dart title="heap_sort.dart"
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    void siftDown(List<int> nums, int n, int i) {
      while (true) {
        // 判断节点 i, l, r 中值最大的节点，记为 ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma]) ma = l;
        if (r < n && nums[r] > nums[ma]) ma = r;
        // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
        if (ma == i) break;
        // 交换两节点
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // 循环向下堆化
        i = ma;
      }
    }

    /* 堆排序 */
    void heapSort(List<int> nums) {
      // 建堆操作：堆化除叶节点以外的其他所有节点
      for (int i = nums.length ~/ 2 - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
      }
      // 从堆中提取最大元素，循环 n-1 轮
      for (int i = nums.length - 1; i > 0; i--) {
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // 以根节点为起点，从顶至底进行堆化
        siftDown(nums, i, 0);
      }
    }
    ```

## 11.7.2. &nbsp; 算法特性

- **时间复杂度 $O(n \log n)$ 、非自适应排序** ：建堆操作使用 $O(n)$ 时间。从堆中提取最大元素的时间复杂度为 $O(\log n)$ ，共循环 $n - 1$ 轮。
- **空间复杂度 $O(1)$ 、原地排序** ：几个指针变量使用 $O(1)$ 空间。元素交换和堆化操作都是在原数组上进行的。
- **非稳定排序**：在交换堆顶元素和堆底元素时，相等元素的相对位置可能发生变化。
