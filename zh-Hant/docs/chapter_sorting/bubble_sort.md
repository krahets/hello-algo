---
comments: true
---

# 11.3 &nbsp; 泡沫排序

<u>泡沫排序（bubble sort）</u>透過連續地比較與交換相鄰元素實現排序。這個過程就像氣泡從底部升到頂部一樣，因此得名泡沫排序。

如圖 11-4 所示，冒泡過程可以利用元素交換操作來模擬：從陣列最左端開始向右走訪，依次比較相鄰元素大小，如果“左元素 > 右元素”就交換二者。走訪完成後，最大的元素會被移動到陣列的最右端。

=== "<1>"
    ![利用元素交換操作模擬冒泡](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

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

<p align="center"> 圖 11-4 &nbsp; 利用元素交換操作模擬冒泡 </p>

## 11.3.1 &nbsp; 演算法流程

設陣列的長度為 $n$ ，泡沫排序的步驟如圖 11-5 所示。

1. 首先，對 $n$ 個元素執行“冒泡”，**將陣列的最大元素交換至正確位置**。
2. 接下來，對剩餘 $n - 1$ 個元素執行“冒泡”，**將第二大元素交換至正確位置**。
3. 以此類推，經過 $n - 1$ 輪“冒泡”後，**前 $n - 1$ 大的元素都被交換至正確位置**。
4. 僅剩的一個元素必定是最小元素，無須排序，因此陣列排序完成。

![泡沫排序流程](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> 圖 11-5 &nbsp; 泡沫排序流程 </p>

示例程式碼如下：

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """泡沫排序"""
        n = len(nums)
        # 外迴圈：未排序區間為 [0, i]
        for i in range(n - 1, 0, -1):
            # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # 交換 nums[j] 與 nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* 泡沫排序 */
    void bubbleSort(vector<int> &nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    // 這裡使用了 std::swap() 函式
                    swap(nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* 泡沫排序 */
    void bubbleSort(int[] nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
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
    /* 泡沫排序 */
    void BubbleSort(int[] nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* 泡沫排序 */
    func bubbleSort(nums []int) {
        // 外迴圈：未排序區間為 [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                }
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* 泡沫排序 */
    func bubbleSort(nums: inout [Int]) {
        // 外迴圈：未排序區間為 [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* 泡沫排序 */
    function bubbleSort(nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
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
    /* 泡沫排序 */
    function bubbleSort(nums: number[]): void {
        // 外迴圈：未排序區間為 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
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
    /* 泡沫排序 */
    void bubbleSort(List<int> nums) {
      // 外迴圈：未排序區間為 [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // 交換 nums[j] 與 nums[j + 1]
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
    /* 泡沫排序 */
    fn bubble_sort(nums: &mut [i32]) {
        // 外迴圈：未排序區間為 [0, i]
        for i in (1..nums.len()).rev() {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    nums.swap(j, j + 1);
                }
            }
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* 泡沫排序 */
    void bubbleSort(int nums[], int size) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = size - 1; i > 0; i--) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
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
    /* 泡沫排序 */
    fun bubbleSort(nums: IntArray) {
        // 外迴圈：未排序區間為 [0, i]
        for (i in nums.size - 1 downTo 1) {
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
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
    ### 泡沫排序 ###
    def bubble_sort(nums)
      n = nums.length
      # 外迴圈：未排序區間為 [0, i]
      for i in (n - 1).downto(1)
        # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for j in 0...i
          if nums[j] > nums[j + 1]
            # 交換 nums[j] 與 nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    // 泡沫排序
    fn bubbleSort(nums: []i32) void {
        // 外迴圈：未排序區間為 [0, i]
        var i: usize = nums.len - 1;
        while (i > 0) : (i -= 1) {
            var j: usize = 0;
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            while (j < i) : (j += 1) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    var tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E8%BF%B4%E5%9C%88%EF%BC%9A%E5%B0%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%20%5B0%2C%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8F%9B%E8%87%B3%E8%A9%B2%E5%8D%80%E9%96%93%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%20nums%5Bj%5D%20%E8%88%87%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E8%BF%B4%E5%9C%88%EF%BC%9A%E5%B0%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%20%5B0%2C%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8F%9B%E8%87%B3%E8%A9%B2%E5%8D%80%E9%96%93%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%20nums%5Bj%5D%20%E8%88%87%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 11.3.2 &nbsp; 效率最佳化

我們發現，如果某輪“冒泡”中沒有執行任何交換操作，說明陣列已經完成排序，可直接返回結果。因此，可以增加一個標誌位 `flag` 來監測這種情況，一旦出現就立即返回。

經過最佳化，泡沫排序的最差時間複雜度和平均時間複雜度仍為 $O(n^2)$ ；但當輸入陣列完全有序時，可達到最佳時間複雜度 $O(n)$ 。

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """泡沫排序（標誌最佳化）"""
        n = len(nums)
        # 外迴圈：未排序區間為 [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # 初始化標誌位
            # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # 交換 nums[j] 與 nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # 記錄交換元素
            if not flag:
                break  # 此輪“冒泡”未交換任何元素，直接跳出
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* 泡沫排序（標誌最佳化）*/
    void bubbleSortWithFlag(vector<int> &nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    // 這裡使用了 std::swap() 函式
                    swap(nums[j], nums[j + 1]);
                    flag = true; // 記錄交換元素
                }
            }
            if (!flag)
                break; // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* 泡沫排序（標誌最佳化） */
    void bubbleSortWithFlag(int[] nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 記錄交換元素
                }
            }
            if (!flag)
                break; // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* 泡沫排序（標誌最佳化）*/
    void BubbleSortWithFlag(int[] nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // 記錄交換元素
                }
            }
            if (!flag) break;     // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* 泡沫排序（標誌最佳化）*/
    func bubbleSortWithFlag(nums []int) {
        // 外迴圈：未排序區間為 [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            flag := false // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                    flag = true // 記錄交換元素
                }
            }
            if flag == false { // 此輪“冒泡”未交換任何元素，直接跳出
                break
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* 泡沫排序（標誌最佳化）*/
    func bubbleSortWithFlag(nums: inout [Int]) {
        // 外迴圈：未排序區間為 [0, i]
        for i in nums.indices.dropFirst().reversed() {
            var flag = false // 初始化標誌位
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    nums.swapAt(j, j + 1)
                    flag = true // 記錄交換元素
                }
            }
            if !flag { // 此輪“冒泡”未交換任何元素，直接跳出
                break
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* 泡沫排序（標誌最佳化）*/
    function bubbleSortWithFlag(nums) {
        // 外迴圈：未排序區間為 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 記錄交換元素
                }
            }
            if (!flag) break; // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* 泡沫排序（標誌最佳化）*/
    function bubbleSortWithFlag(nums: number[]): void {
        // 外迴圈：未排序區間為 [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 記錄交換元素
                }
            }
            if (!flag) break; // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* 泡沫排序（標誌最佳化）*/
    void bubbleSortWithFlag(List<int> nums) {
      // 外迴圈：未排序區間為 [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        bool flag = false; // 初始化標誌位
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // 交換 nums[j] 與 nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            flag = true; // 記錄交換元素
          }
        }
        if (!flag) break; // 此輪“冒泡”未交換任何元素，直接跳出
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* 泡沫排序（標誌最佳化） */
    fn bubble_sort_with_flag(nums: &mut [i32]) {
        // 外迴圈：未排序區間為 [0, i]
        for i in (1..nums.len()).rev() {
            let mut flag = false; // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // 交換 nums[j] 與 nums[j + 1]
                    nums.swap(j, j + 1);
                    flag = true; // 記錄交換元素
                }
            }
            if !flag {
                break; // 此輪“冒泡”未交換任何元素，直接跳出
            };
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* 泡沫排序（標誌最佳化）*/
    void bubbleSortWithFlag(int nums[], int size) {
        // 外迴圈：未排序區間為 [0, i]
        for (int i = size - 1; i > 0; i--) {
            bool flag = false;
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
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
    /* 泡沫排序（標誌最佳化） */
    fun bubbleSortWithFlag(nums: IntArray) {
        // 外迴圈：未排序區間為 [0, i]
        for (i in nums.size - 1 downTo 1) {
            var flag = false // 初始化標誌位
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    flag = true // 記錄交換元素
                }
            }
            if (!flag) break // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### 泡沫排序（標誌最佳化）###
    def bubble_sort_with_flag(nums)
      n = nums.length
      # 外迴圈：未排序區間為 [0, i]
      for i in (n - 1).downto(1)
        flag = false # 初始化標誌位

        # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for j in 0...i
          if nums[j] > nums[j + 1]
            # 交換 nums[j] 與 nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
            flag = true # 記錄交換元素
          end
        end

        break unless flag # 此輪“冒泡”未交換任何元素，直接跳出
      end
    end
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    // 泡沫排序（標誌最佳化）
    fn bubbleSortWithFlag(nums: []i32) void {
        // 外迴圈：未排序區間為 [0, i]
        var i: usize = nums.len - 1;
        while (i > 0) : (i -= 1) {
            var flag = false;   // 初始化標誌位
            var j: usize = 0;
            // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
            while (j < i) : (j += 1) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    var tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true;
                }
            }
            if (!flag) break;   // 此輪“冒泡”未交換任何元素，直接跳出
        }
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A8%99%E8%AA%8C%E6%9C%80%E4%BD%B3%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A8%99%E8%AA%8C%E4%BD%8D%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E8%BF%B4%E5%9C%88%EF%BC%9A%E5%B0%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%20%5B0%2C%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8F%9B%E8%87%B3%E8%A9%B2%E5%8D%80%E9%96%93%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%20nums%5Bj%5D%20%E8%88%87%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E8%A8%98%E9%8C%84%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E6%AD%A4%E8%BC%AA%E2%80%9C%E5%86%92%E6%B3%A1%E2%80%9D%E6%9C%AA%E4%BA%A4%E6%8F%9B%E4%BB%BB%E4%BD%95%E5%85%83%E7%B4%A0%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E5%87%BA%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A8%99%E8%AA%8C%E6%9C%80%E4%BD%B3%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E8%BF%B4%E5%9C%88%EF%BC%9A%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%E7%82%BA%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A8%99%E8%AA%8C%E4%BD%8D%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A7%E8%BF%B4%E5%9C%88%EF%BC%9A%E5%B0%87%E6%9C%AA%E6%8E%92%E5%BA%8F%E5%8D%80%E9%96%93%20%5B0%2C%20i%5D%20%E4%B8%AD%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%E4%BA%A4%E6%8F%9B%E8%87%B3%E8%A9%B2%E5%8D%80%E9%96%93%E7%9A%84%E6%9C%80%E5%8F%B3%E7%AB%AF%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%20nums%5Bj%5D%20%E8%88%87%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E8%A8%98%E9%8C%84%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E6%AD%A4%E8%BC%AA%E2%80%9C%E5%86%92%E6%B3%A1%E2%80%9D%E6%9C%AA%E4%BA%A4%E6%8F%9B%E4%BB%BB%E4%BD%95%E5%85%83%E7%B4%A0%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E5%87%BA%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E6%B3%A1%E6%B2%AB%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 11.3.3 &nbsp; 演算法特性

- **時間複雜度為 $O(n^2)$、自適應排序**：各輪“冒泡”走訪的陣列長度依次為 $n - 1$、$n - 2$、$\dots$、$2$、$1$ ，總和為 $(n - 1) n / 2$ 。在引入 `flag` 最佳化後，最佳時間複雜度可達到 $O(n)$ 。
- **空間複雜度為 $O(1)$、原地排序**：指標 $i$ 和 $j$ 使用常數大小的額外空間。
- **穩定排序**：由於在“冒泡”中遇到相等元素不交換。
