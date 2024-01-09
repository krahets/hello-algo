---
comments: true
---

# 11.2 &nbsp; 选择排序

「选择排序 selection sort」的工作原理非常简单：开启一个循环，每轮从未排序区间选择最小的元素，将其放到已排序区间的末尾。

设数组的长度为 $n$ ，选择排序的算法流程如图 11-2 所示。

1. 初始状态下，所有元素未排序，即未排序（索引）区间为 $[0, n-1]$ 。
2. 选取区间 $[0, n-1]$ 中的最小元素，将其与索引 $0$ 处的元素交换。完成后，数组前 1 个元素已排序。
3. 选取区间 $[1, n-1]$ 中的最小元素，将其与索引 $1$ 处的元素交换。完成后，数组前 2 个元素已排序。
4. 以此类推。经过 $n - 1$ 轮选择与交换后，数组前 $n - 1$ 个元素已排序。
5. 仅剩的一个元素必定是最大元素，无须排序，因此数组排序完成。

=== "<1>"
    ![选择排序步骤](selection_sort.assets/selection_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png){ class="animation-figure" }

<p align="center"> 图 11-2 &nbsp; 选择排序步骤 </p>

在代码中，我们用 $k$ 来记录未排序区间内的最小元素：

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """选择排序"""
        n = len(nums)
        # 外循环：未排序区间为 [i, n-1]
        for i in range(n - 1):
            # 内循环：找到未排序区间内的最小元素
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # 记录最小元素的索引
            # 将该最小元素与未排序区间的首个元素交换
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    /* 选择排序 */
    void selectionSort(vector<int> &nums) {
        int n = nums.size();
        // 外循环：未排序区间为 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 记录最小元素的索引
            }
            // 将该最小元素与未排序区间的首个元素交换
            swap(nums[i], nums[k]);
        }
    }
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* 选择排序 */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // 外循环：未排序区间为 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 记录最小元素的索引
            }
            // 将该最小元素与未排序区间的首个元素交换
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    /* 选择排序 */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // 外循环：未排序区间为 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 记录最小元素的索引
            }
            // 将该最小元素与未排序区间的首个元素交换
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }
    ```

=== "Go"

    ```go title="selection_sort.go"
    /* 选择排序 */
    func selectionSort(nums []int) {
        n := len(nums)
        // 外循环：未排序区间为 [i, n-1]
        for i := 0; i < n-1; i++ {
            // 内循环：找到未排序区间内的最小元素
            k := i
            for j := i + 1; j < n; j++ {
                if nums[j] < nums[k] {
                    // 记录最小元素的索引
                    k = j
                }
            }
            // 将该最小元素与未排序区间的首个元素交换
            nums[i], nums[k] = nums[k], nums[i]

        }
    }
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    /* 选择排序 */
    func selectionSort(nums: inout [Int]) {
        // 外循环：未排序区间为 [i, n-1]
        for i in nums.indices.dropLast() {
            // 内循环：找到未排序区间内的最小元素
            var k = i
            for j in nums.indices.dropFirst(i + 1) {
                if nums[j] < nums[k] {
                    k = j // 记录最小元素的索引
                }
            }
            // 将该最小元素与未排序区间的首个元素交换
            nums.swapAt(i, k)
        }
    }
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    /* 选择排序 */
    function selectionSort(nums) {
        let n = nums.length;
        // 外循环：未排序区间为 [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // 记录最小元素的索引
                }
            }
            // 将该最小元素与未排序区间的首个元素交换
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    /* 选择排序 */
    function selectionSort(nums: number[]): void {
        let n = nums.length;
        // 外循环：未排序区间为 [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // 记录最小元素的索引
                }
            }
            // 将该最小元素与未排序区间的首个元素交换
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    /* 选择排序 */
    void selectionSort(List<int> nums) {
      int n = nums.length;
      // 外循环：未排序区间为 [i, n-1]
      for (int i = 0; i < n - 1; i++) {
        // 内循环：找到未排序区间内的最小元素
        int k = i;
        for (int j = i + 1; j < n; j++) {
          if (nums[j] < nums[k]) k = j; // 记录最小元素的索引
        }
        // 将该最小元素与未排序区间的首个元素交换
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
      }
    }
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    /* 选择排序 */
    fn selection_sort(nums: &mut [i32]) {
        let n = nums.len();
        // 外循环：未排序区间为 [i, n-1]
        for i in 0..n-1 {
            // 内循环：找到未排序区间内的最小元素
            let mut k = i;
            for j in i+1..n {
                if nums[j] < nums[k] {
                    k = j; // 记录最小元素的索引
                }
            }
            // 将该最小元素与未排序区间的首个元素交换
            nums.swap(i, k);
        }
    }
    ```

=== "C"

    ```c title="selection_sort.c"
    /* 选择排序 */
    void selectionSort(int nums[], int n) {
        // 外循环：未排序区间为 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内循环：找到未排序区间内的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 记录最小元素的索引
            }
            // 将该最小元素与未排序区间的首个元素交换
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "Zig"

    ```zig title="selection_sort.zig"
    [class]{}-[func]{selectionSort}
    ```

??? pythontutor "可视化运行"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%89%BE%E5%88%B0%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E5%86%85%E7%9A%84%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20%E8%AE%B0%E5%BD%95%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%E8%AF%A5%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E4%B8%8E%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E7%9A%84%E9%A6%96%E4%B8%AA%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%BE%AA%E7%8E%AF%EF%BC%9A%E6%89%BE%E5%88%B0%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E5%86%85%E7%9A%84%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20%E8%AE%B0%E5%BD%95%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%E8%AF%A5%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E4%B8%8E%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8C%BA%E9%97%B4%E7%9A%84%E9%A6%96%E4%B8%AA%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8D%A2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

## 11.2.1 &nbsp; 算法特性

- **时间复杂度为 $O(n^2)$、非自适应排序**：外循环共 $n - 1$ 轮，第一轮的未排序区间长度为 $n$ ，最后一轮的未排序区间长度为 $2$ ，即各轮外循环分别包含 $n$、$n - 1$、$\dots$、$3$、$2$ 轮内循环，求和为 $\frac{(n - 1)(n + 2)}{2}$ 。
- **空间复杂度为 $O(1)$、原地排序**：指针 $i$ 和 $j$ 使用常数大小的额外空间。
- **非稳定排序**：如图 11-3 所示，元素 `nums[i]` 有可能被交换至与其相等的元素的右边，导致两者的相对顺序发生改变。

![选择排序非稳定示例](selection_sort.assets/selection_sort_instability.png){ class="animation-figure" }

<p align="center"> 图 11-3 &nbsp; 选择排序非稳定示例 </p>
