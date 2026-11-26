---
comments: true
---

# 11.2 &nbsp; 選擇排序

<u>選擇排序（selection sort）</u>的做法很簡單：執行迴圈，每輪從未排序區間選出最小元素，放到已排序區間的尾端。

假設陣列長度為 $n$，選擇排序的流程如圖 11-2 所示。

1. 一開始所有元素都尚未排序，也就是說，未排序的索引區間為 $[0, n-1]$。
2. 選取區間 $[0, n-1]$ 中的最小元素，與索引 $0$ 的元素交換。完成後，陣列的第 1 個元素已排好。
3. 選取區間 $[1, n-1]$ 中的最小元素，與索引 $1$ 的元素交換。完成後，陣列的前 2 個元素已排好。
4. 依此類推。經過 $n - 1$ 輪選擇與交換，陣列的前 $n - 1$ 個元素都已排好。
5. 只剩最後一個元素，它必定是最大元素，無須再排，整個陣列就排好了。

=== "<1>"
    ![選擇排序的步驟](selection_sort.assets/selection_sort_step1.svg){ class="animation-figure" }

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.svg){ class="animation-figure" }

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.svg){ class="animation-figure" }

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.svg){ class="animation-figure" }

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.svg){ class="animation-figure" }

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.svg){ class="animation-figure" }

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.svg){ class="animation-figure" }

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.svg){ class="animation-figure" }

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.svg){ class="animation-figure" }

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.svg){ class="animation-figure" }

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.svg){ class="animation-figure" }

<p align="center"> 圖 11-2 &nbsp; 選擇排序的步驟 </p>

在程式中，我們用 $k$ 記錄未排序區間中最小元素的位置：

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """選擇排序"""
        n = len(nums)
        # 外層迴圈：未排序區間為 [i, n-1]
        for i in range(n - 1):
            # 內層迴圈：找出未排序區間中的最小元素
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # 記錄最小元素的索引
            # 將最小元素與未排序區間的第一個元素交換
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    /* 選擇排序 */
    void selectionSort(vector<int> &nums) {
        int n = nums.size();
        // 外層迴圈：未排序區間為 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 記錄最小元素的索引
            }
            // 將最小元素與未排序區間的第一個元素交換
            swap(nums[i], nums[k]);
        }
    }
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* 選擇排序 */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // 外層迴圈：未排序區間為 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 記錄最小元素的索引
            }
            // 將最小元素與未排序區間的第一個元素交換
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    /* 選擇排序 */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // 外層迴圈：未排序區間為 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 記錄最小元素的索引
            }
            // 將最小元素與未排序區間的第一個元素交換
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }
    ```

=== "Go"

    ```go title="selection_sort.go"
    /* 選擇排序 */
    func selectionSort(nums []int) {
        n := len(nums)
        // 外層迴圈：未排序區間為 [i, n-1]
        for i := 0; i < n-1; i++ {
            // 內層迴圈：找出未排序區間中的最小元素
            k := i
            for j := i + 1; j < n; j++ {
                if nums[j] < nums[k] {
                    // 記錄最小元素的索引
                    k = j
                }
            }
            // 將最小元素與未排序區間的第一個元素交換
            nums[i], nums[k] = nums[k], nums[i]

        }
    }
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    /* 選擇排序 */
    func selectionSort(nums: inout [Int]) {
        // 外層迴圈：未排序區間為 [i, n-1]
        for i in nums.indices.dropLast() {
            // 內層迴圈：找出未排序區間中的最小元素
            var k = i
            for j in nums.indices.dropFirst(i + 1) {
                if nums[j] < nums[k] {
                    k = j // 記錄最小元素的索引
                }
            }
            // 將最小元素與未排序區間的第一個元素交換
            nums.swapAt(i, k)
        }
    }
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    /* 選擇排序 */
    function selectionSort(nums) {
        let n = nums.length;
        // 外層迴圈：未排序區間為 [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // 記錄最小元素的索引
                }
            }
            // 將最小元素與未排序區間的第一個元素交換
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    /* 選擇排序 */
    function selectionSort(nums: number[]): void {
        let n = nums.length;
        // 外層迴圈：未排序區間為 [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // 記錄最小元素的索引
                }
            }
            // 將最小元素與未排序區間的第一個元素交換
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    /* 選擇排序 */
    void selectionSort(List<int> nums) {
      int n = nums.length;
      // 外層迴圈：未排序區間為 [i, n-1]
      for (int i = 0; i < n - 1; i++) {
        // 內層迴圈：找出未排序區間中的最小元素
        int k = i;
        for (int j = i + 1; j < n; j++) {
          if (nums[j] < nums[k]) k = j; // 記錄最小元素的索引
        }
        // 將最小元素與未排序區間的第一個元素交換
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
      }
    }
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    /* 選擇排序 */
    fn selection_sort(nums: &mut [i32]) {
        if nums.is_empty() {
            return;
        }
        let n = nums.len();
        // 外層迴圈：未排序區間為 [i, n-1]
        for i in 0..n - 1 {
            // 內層迴圈：找出未排序區間中的最小元素
            let mut k = i;
            for j in i + 1..n {
                if nums[j] < nums[k] {
                    k = j; // 記錄最小元素的索引
                }
            }
            // 將最小元素與未排序區間的第一個元素交換
            nums.swap(i, k);
        }
    }
    ```

=== "C"

    ```c title="selection_sort.c"
    /* 選擇排序 */
    void selectionSort(int nums[], int n) {
        // 外層迴圈：未排序區間為 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 記錄最小元素的索引
            }
            // 將最小元素與未排序區間的第一個元素交換
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="selection_sort.kt"
    /* 選擇排序 */
    fun selectionSort(nums: IntArray) {
        val n = nums.size
        // 外層迴圈：未排序區間為 [i, n-1]
        for (i in 0..<n - 1) {
            var k = i
            // 內層迴圈：找出未排序區間中的最小元素
            for (j in i + 1..<n) {
                if (nums[j] < nums[k])
                    k = j // 記錄最小元素的索引
            }
            // 將最小元素與未排序區間的第一個元素交換
            val temp = nums[i]
            nums[i] = nums[k]
            nums[k] = temp
        }
    }
    ```

=== "Ruby"

    ```ruby title="selection_sort.rb"
    ### 選擇排序 ###
    def selection_sort(nums)
      n = nums.length
      # 外層迴圈：未排序區間為 [i, n-1]
      for i in 0...(n - 1)
        # 內層迴圈：找出未排序區間中的最小元素
        k = i
        for j in (i + 1)...n
          if nums[j] < nums[k]
            k = j # 記錄最小元素的索引
          end
        end
        # 將最小元素與未排序區間的第一個元素交換
        nums[i], nums[k] = nums[k], nums[i]
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E9%81%B8%E6%93%87%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%89%BE%E5%87%BA%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E4%B8%AD%E7%9A%84%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20%E8%A8%98%E9%8C%84%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E8%88%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%9A%84%E7%AC%AC%E4%B8%80%E5%80%8B%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22%E9%81%B8%E6%93%87%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E9%81%B8%E6%93%87%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E5%B1%A4%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%89%BE%E5%87%BA%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E4%B8%AD%E7%9A%84%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20%E8%A8%98%E9%8C%84%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E6%9C%80%E5%B0%8F%E5%85%83%E7%B4%A0%E8%88%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%9A%84%E7%AC%AC%E4%B8%80%E5%80%8B%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22%E9%81%B8%E6%93%87%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 11.2.1 &nbsp; 演算法特性

- **時間複雜度為 $O(n^2)$、不具調適性的排序**：外層迴圈共執行 $n - 1$ 輪。內層迴圈在第一輪執行 $n - 1$ 次，最後一輪執行 $1$ 次。各輪內層迴圈的執行次數依序為 $n - 1$、$n - 2$、$\dots$、$2$、$1$，總和為 $\frac{n(n - 1)}{2}$。
- **空間複雜度為 $O(1)$、原地排序**：指標 $i$ 和 $j$ 只占用常數大小的額外空間。
- **不穩定排序**：如圖 11-3 所示，元素 `nums[i]` 可能被換到另一個與它相等的元素右側，使兩者的相對順序改變。

![選擇排序不穩定的例子](selection_sort.assets/selection_sort_instability.svg){ class="animation-figure" }

<p align="center"> 圖 11-3 &nbsp; 選擇排序不穩定的例子 </p>
