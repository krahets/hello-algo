---
comments: true
---

# 10.2 &nbsp; 二分搜尋插入點

二分搜尋不僅可用於搜尋目標元素，還可用於解決許多變種問題，比如搜尋目標元素的插入位置。

## 10.2.1 &nbsp; 無重複元素的情況

!!! question

    給定一個長度為 $n$ 的有序陣列 `nums` 和一個元素 `target` ，陣列不存在重複元素。現將 `target` 插入陣列 `nums` 中，並保持其有序性。若陣列中已存在元素 `target` ，則插入到其左方。請返回插入後 `target` 在陣列中的索引。示例如圖 10-4 所示。

![二分搜尋插入點示例資料](binary_search_insertion.assets/binary_search_insertion_example.png){ class="animation-figure" }

<p align="center"> 圖 10-4 &nbsp; 二分搜尋插入點示例資料 </p>

如果想複用上一節的二分搜尋程式碼，則需要回答以下兩個問題。

**問題一**：當陣列中包含 `target` 時，插入點的索引是否是該元素的索引？

題目要求將 `target` 插入到相等元素的左邊，這意味著新插入的 `target` 替換了原來 `target` 的位置。也就是說，**當陣列包含 `target` 時，插入點的索引就是該 `target` 的索引**。

**問題二**：當陣列中不存在 `target` 時，插入點是哪個元素的索引？

進一步思考二分搜尋過程：當 `nums[m] < target` 時 $i$ 移動，這意味著指標 $i$ 在向大於等於 `target` 的元素靠近。同理，指標 $j$ 始終在向小於等於 `target` 的元素靠近。

因此二分結束時一定有：$i$ 指向首個大於 `target` 的元素，$j$ 指向首個小於 `target` 的元素。**易得當陣列不包含 `target` 時，插入索引為 $i$** 。程式碼如下所示：

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion_simple(nums: list[int], target: int) -> int:
        """二分搜尋插入點（無重複元素）"""
        i, j = 0, len(nums) - 1  # 初始化雙閉區間 [0, n-1]
        while i <= j:
            m = (i + j) // 2  # 計算中點索引 m
            if nums[m] < target:
                i = m + 1  # target 在區間 [m+1, j] 中
            elif nums[m] > target:
                j = m - 1  # target 在區間 [i, m-1] 中
            else:
                return m  # 找到 target ，返回插入點 m
        # 未找到 target ，返回插入點 i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 二分搜尋插入點（無重複元素） */
    int binarySearchInsertionSimple(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 二分搜尋插入點（無重複元素） */
    int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 二分搜尋插入點（無重複元素） */
    int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 二分搜尋插入點（無重複元素） */
    func binarySearchInsertionSimple(nums []int, target int) int {
        // 初始化雙閉區間 [0, n-1]
        i, j := 0, len(nums)-1
        for i <= j {
            // 計算中點索引 m
            m := i + (j-i)/2
            if nums[m] < target {
                // target 在區間 [m+1, j] 中
                i = m + 1
            } else if nums[m] > target {
                // target 在區間 [i, m-1] 中
                j = m - 1
            } else {
                // 找到 target ，返回插入點 m
                return m
            }
        }
        // 未找到 target ，返回插入點 i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 二分搜尋插入點（無重複元素） */
    func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
        // 初始化雙閉區間 [0, n-1]
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 計算中點索引 m
            if nums[m] < target {
                i = m + 1 // target 在區間 [m+1, j] 中
            } else if nums[m] > target {
                j = m - 1 // target 在區間 [i, m-1] 中
            } else {
                return m // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 二分搜尋插入點（無重複元素） */
    function binarySearchInsertionSimple(nums, target) {
        let i = 0,
            j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 二分搜尋插入點（無重複元素） */
    function binarySearchInsertionSimple(
        nums: Array<number>,
        target: number
    ): number {
        let i = 0,
            j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 二分搜尋插入點（無重複元素） */
    int binarySearchInsertionSimple(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 計算中點索引 m
        if (nums[m] < target) {
          i = m + 1; // target 在區間 [m+1, j] 中
        } else if (nums[m] > target) {
          j = m - 1; // target 在區間 [i, m-1] 中
        } else {
          return m; // 找到 target ，返回插入點 m
        }
      }
      // 未找到 target ，返回插入點 i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 二分搜尋插入點（無重複元素） */
    fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化雙閉區間 [0, n-1]
        while i <= j {
            let m = i + (j - i) / 2; // 計算中點索引 m
            if nums[m as usize] < target {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if nums[m as usize] > target {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m;
            }
        }
        // 未找到 target ，返回插入點 i
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 二分搜尋插入點（無重複元素） */
    int binarySearchInsertionSimple(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                return m; // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 二分搜尋插入點（無重複元素） */
    fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            val m = i + (j - i) / 2 // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1 // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1 // target 在區間 [i, m-1] 中
            } else {
                return m // 找到 target ，返回插入點 m
            }
        }
        // 未找到 target ，返回插入點 i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    [class]{}-[func]{binary_search_insertion_simple}
    ```

=== "Zig"

    ```zig title="binary_search_insertion.zig"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%EF%BC%88%E7%84%A1%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%99%E9%96%89%E5%8D%80%E9%96%93%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%AD%E9%BB%9E%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bi%2C%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E9%BB%9E%20m%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E9%BB%9E%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%84%A1%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%E7%9A%84%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%EF%BC%88%E7%84%A1%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%99%E9%96%89%E5%8D%80%E9%96%93%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%AD%E9%BB%9E%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bi%2C%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E9%BB%9E%20m%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E9%BB%9E%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%84%A1%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%E7%9A%84%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 10.2.2 &nbsp; 存在重複元素的情況

!!! question

    在上一題的基礎上，規定陣列可能包含重複元素，其餘不變。

假設陣列中存在多個 `target` ，則普通二分搜尋只能返回其中一個 `target` 的索引，**而無法確定該元素的左邊和右邊還有多少 `target`**。

題目要求將目標元素插入到最左邊，**所以我們需要查詢陣列中最左一個 `target` 的索引**。初步考慮透過圖 10-5 所示的步驟實現。

1. 執行二分搜尋，得到任意一個 `target` 的索引，記為 $k$ 。
2. 從索引 $k$ 開始，向左進行線性走訪，當找到最左邊的 `target` 時返回。

![線性查詢重複元素的插入點](binary_search_insertion.assets/binary_search_insertion_naive.png){ class="animation-figure" }

<p align="center"> 圖 10-5 &nbsp; 線性查詢重複元素的插入點 </p>

此方法雖然可用，但其包含線性查詢，因此時間複雜度為 $O(n)$ 。當陣列中存在很多重複的 `target` 時，該方法效率很低。

現考慮拓展二分搜尋程式碼。如圖 10-6 所示，整體流程保持不變，每輪先計算中點索引 $m$ ，再判斷 `target` 和 `nums[m]` 的大小關係，分為以下幾種情況。

- 當 `nums[m] < target` 或 `nums[m] > target` 時，說明還沒有找到 `target` ，因此採用普通二分搜尋的縮小區間操作，**從而使指標 $i$ 和 $j$ 向 `target` 靠近**。
- 當 `nums[m] == target` 時，說明小於 `target` 的元素在區間 $[i, m - 1]$ 中，因此採用 $j = m - 1$ 來縮小區間，**從而使指標 $j$ 向小於 `target` 的元素靠近**。

迴圈完成後，$i$ 指向最左邊的 `target` ，$j$ 指向首個小於 `target` 的元素，**因此索引 $i$ 就是插入點**。

=== "<1>"
    ![二分搜尋重複元素的插入點的步驟](binary_search_insertion.assets/binary_search_insertion_step1.png){ class="animation-figure" }

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

<p align="center"> 圖 10-6 &nbsp; 二分搜尋重複元素的插入點的步驟 </p>

觀察以下程式碼，判斷分支 `nums[m] > target` 和 `nums[m] == target` 的操作相同，因此兩者可以合併。

即便如此，我們仍然可以將判斷條件保持展開，因為其邏輯更加清晰、可讀性更好。

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion(nums: list[int], target: int) -> int:
        """二分搜尋插入點（存在重複元素）"""
        i, j = 0, len(nums) - 1  # 初始化雙閉區間 [0, n-1]
        while i <= j:
            m = (i + j) // 2  # 計算中點索引 m
            if nums[m] < target:
                i = m + 1  # target 在區間 [m+1, j] 中
            elif nums[m] > target:
                j = m - 1  # target 在區間 [i, m-1] 中
            else:
                j = m - 1  # 首個小於 target 的元素在區間 [i, m-1] 中
        # 返回插入點 i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 二分搜尋插入點（存在重複元素） */
    int binarySearchInsertion(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 二分搜尋插入點（存在重複元素） */
    int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* 二分搜尋插入點（存在重複元素） */
    int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* 二分搜尋插入點（存在重複元素） */
    func binarySearchInsertion(nums []int, target int) int {
        // 初始化雙閉區間 [0, n-1]
        i, j := 0, len(nums)-1
        for i <= j {
            // 計算中點索引 m
            m := i + (j-i)/2
            if nums[m] < target {
                // target 在區間 [m+1, j] 中
                i = m + 1
            } else if nums[m] > target {
                // target 在區間 [i, m-1] 中
                j = m - 1
            } else {
                // 首個小於 target 的元素在區間 [i, m-1] 中
                j = m - 1
            }
        }
        // 返回插入點 i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* 二分搜尋插入點（存在重複元素） */
    func binarySearchInsertion(nums: [Int], target: Int) -> Int {
        // 初始化雙閉區間 [0, n-1]
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // 計算中點索引 m
            if nums[m] < target {
                i = m + 1 // target 在區間 [m+1, j] 中
            } else if nums[m] > target {
                j = m - 1 // target 在區間 [i, m-1] 中
            } else {
                j = m - 1 // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* 二分搜尋插入點（存在重複元素） */
    function binarySearchInsertion(nums, target) {
        let i = 0,
            j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* 二分搜尋插入點（存在重複元素） */
    function binarySearchInsertion(nums: Array<number>, target: number): number {
        let i = 0,
            j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // 計算中點索引 m, 使用 Math.floor() 向下取整
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* 二分搜尋插入點（存在重複元素） */
    int binarySearchInsertion(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // 計算中點索引 m
        if (nums[m] < target) {
          i = m + 1; // target 在區間 [m+1, j] 中
        } else if (nums[m] > target) {
          j = m - 1; // target 在區間 [i, m-1] 中
        } else {
          j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
        }
      }
      // 返回插入點 i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* 二分搜尋插入點（存在重複元素） */
    pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化雙閉區間 [0, n-1]
        while i <= j {
            let m = i + (j - i) / 2; // 計算中點索引 m
            if nums[m as usize] < target {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if nums[m as usize] > target {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* 二分搜尋插入點（存在重複元素） */
    int binarySearchInsertion(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1; // target 在區間 [i, m-1] 中
            } else {
                j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* 二分搜尋插入點（存在重複元素） */
    fun binarySearchInsertion(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // 初始化雙閉區間 [0, n-1]
        while (i <= j) {
            val m = i + (j - i) / 2 // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1 // target 在區間 [m+1, j] 中
            } else if (nums[m] > target) {
                j = m - 1 // target 在區間 [i, m-1] 中
            } else {
                j = m - 1 // 首個小於 target 的元素在區間 [i, m-1] 中
            }
        }
        // 返回插入點 i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    [class]{}-[func]{binary_search_insertion}
    ```

=== "Zig"

    ```zig title="binary_search_insertion.zig"
    [class]{}-[func]{binarySearchInsertion}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%99%E9%96%89%E5%8D%80%E9%96%93%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%AD%E9%BB%9E%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bi%2C%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E5%80%8B%E5%B0%8F%E6%96%BC%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bi%2C%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E9%BB%9E%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%E7%9A%84%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%99%E9%96%89%E5%8D%80%E9%96%93%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%AD%E9%BB%9E%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bm%2B1%2C%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bi%2C%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E5%80%8B%E5%B0%8F%E6%96%BC%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8D%80%E9%96%93%20%5Bi%2C%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E9%BB%9E%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E8%A4%87%E5%85%83%E7%B4%A0%E7%9A%84%E9%99%A3%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%90%9C%E5%B0%8B%E6%8F%92%E5%85%A5%E9%BB%9E%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E6%8F%92%E5%85%A5%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

!!! tip

    本節的程式碼都是“雙閉區間”寫法。有興趣的讀者可以自行實現“左閉右開”寫法。

總的來看，二分搜尋無非就是給指標 $i$ 和 $j$ 分別設定搜尋目標，目標可能是一個具體的元素（例如 `target` ），也可能是一個元素範圍（例如小於 `target` 的元素）。

在不斷的迴圈二分中，指標 $i$ 和 $j$ 都逐漸逼近預先設定的目標。最終，它們或是成功找到答案，或是越過邊界後停止。
