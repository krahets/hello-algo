---
comments: true
---

# 10.3 &nbsp; 二分搜尋邊界

## 10.3.1 &nbsp; 查詢左邊界

!!! question

    給定一個長度為 $n$ 的有序陣列 `nums` ，其中可能包含重複元素。請返回陣列中最左一個元素 `target` 的索引。若陣列中不包含該元素，則返回 $-1$ 。

回憶二分搜尋插入點的方法，搜尋完成後 $i$ 指向最左一個 `target` ，**因此查詢插入點本質上是在查詢最左一個 `target` 的索引**。

考慮透過查詢插入點的函式實現查詢左邊界。請注意，陣列中可能不包含 `target` ，這種情況可能導致以下兩種結果。

- 插入點的索引 $i$ 越界。
- 元素 `nums[i]` 與 `target` 不相等。

當遇到以上兩種情況時，直接返回 $-1$ 即可。程式碼如下所示：

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """二分搜尋最左一個 target"""
        # 等價於查詢 target 的插入點
        i = binary_search_insertion(nums, target)
        # 未找到 target ，返回 -1
        if i == len(nums) or nums[i] != target:
            return -1
        # 找到 target ，返回索引 i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分搜尋最左一個 target */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // 等價於查詢 target 的插入點
        int i = binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分搜尋最左一個 target */
    int binarySearchLeftEdge(int[] nums, int target) {
        // 等價於查詢 target 的插入點
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 二分搜尋最左一個 target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // 等價於查詢 target 的插入點
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 二分搜尋最左一個 target */
    func binarySearchLeftEdge(nums []int, target int) int {
        // 等價於查詢 target 的插入點
        i := binarySearchInsertion(nums, target)
        // 未找到 target ，返回 -1
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // 找到 target ，返回索引 i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 二分搜尋最左一個 target */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // 等價於查詢 target 的插入點
        let i = binarySearchInsertion(nums: nums, target: target)
        // 未找到 target ，返回 -1
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // 找到 target ，返回索引 i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 二分搜尋最左一個 target */
    function binarySearchLeftEdge(nums, target) {
        // 等價於查詢 target 的插入點
        const i = binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 二分搜尋最左一個 target */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // 等價於查詢 target 的插入點
        const i = binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 二分搜尋最左一個 target */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // 等價於查詢 target 的插入點
      int i = binarySearchInsertion(nums, target);
      // 未找到 target ，返回 -1
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // 找到 target ，返回索引 i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 二分搜尋最左一個 target */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // 等價於查詢 target 的插入點
        let i = binary_search_insertion(nums, target);
        // 未找到 target ，返回 -1
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // 找到 target ，返回索引 i
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 二分搜尋最左一個 target */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // 等價於查詢 target 的插入點
        int i = binarySearchInsertion(nums, numSize, target);
        // 未找到 target ，返回 -1
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 二分搜尋最左一個 target */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // 等價於查詢 target 的插入點
        val i = binarySearchInsertion(nums, target)
        // 未找到 target ，返回 -1
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // 找到 target ，返回索引 i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    [class]{}-[func]{binary_search_left_edge}
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E7%AD%89%E4%BB%B7%E4%BA%8E%E6%9F%A5%E6%89%BE%20target%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E7%AD%89%E4%BB%B7%E4%BA%8E%E6%9F%A5%E6%89%BE%20target%20%E7%9A%84%E6%8F%92%E5%85%A5%E7%82%B9%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 10.3.2 &nbsp; 查詢右邊界

那麼如何查詢最右一個 `target` 呢？最直接的方式是修改程式碼，替換在 `nums[m] == target` 情況下的指標收縮操作。程式碼在此省略，有興趣的讀者可以自行實現。

下面我們介紹兩種更加取巧的方法。

### 1. &nbsp; 複用查詢左邊界

實際上，我們可以利用查詢最左元素的函式來查詢最右元素，具體方法為：**將查詢最右一個 `target` 轉化為查詢最左一個 `target + 1`**。

如圖 10-7 所示，查詢完成後，指標 $i$ 指向最左一個 `target + 1`（如果存在），而 $j$ 指向最右一個 `target` ，**因此返回 $j$ 即可**。

![將查詢右邊界轉化為查詢左邊界](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> 圖 10-7 &nbsp; 將查詢右邊界轉化為查詢左邊界 </p>

請注意，返回的插入點是 $i$ ，因此需要將其減 $1$ ，從而獲得 $j$ ：

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """二分搜尋最右一個 target"""
        # 轉化為查詢最左一個 target + 1
        i = binary_search_insertion(nums, target + 1)
        # j 指向最右一個 target ，i 指向首個大於 target 的元素
        j = i - 1
        # 未找到 target ，返回 -1
        if j == -1 or nums[j] != target:
            return -1
        # 找到 target ，返回索引 j
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 二分搜尋最右一個 target */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // 轉化為查詢最左一個 target + 1
        int i = binarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 二分搜尋最右一個 target */
    int binarySearchRightEdge(int[] nums, int target) {
        // 轉化為查詢最左一個 target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* 二分搜尋最右一個 target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 轉化為查詢最左一個 target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* 二分搜尋最右一個 target */
    func binarySearchRightEdge(nums []int, target int) int {
        // 轉化為查詢最左一個 target + 1
        i := binarySearchInsertion(nums, target+1)
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        j := i - 1
        // 未找到 target ，返回 -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // 找到 target ，返回索引 j
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* 二分搜尋最右一個 target */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // 轉化為查詢最左一個 target + 1
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        let j = i - 1
        // 未找到 target ，返回 -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // 找到 target ，返回索引 j
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* 二分搜尋最右一個 target */
    function binarySearchRightEdge(nums, target) {
        // 轉化為查詢最左一個 target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        const j = i - 1;
        // 未找到 target ，返回 -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* 二分搜尋最右一個 target */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // 轉化為查詢最左一個 target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        const j = i - 1;
        // 未找到 target ，返回 -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* 二分搜尋最右一個 target */
    int binarySearchRightEdge(List<int> nums, int target) {
      // 轉化為查詢最左一個 target + 1
      int i = binarySearchInsertion(nums, target + 1);
      // j 指向最右一個 target ，i 指向首個大於 target 的元素
      int j = i - 1;
      // 未找到 target ，返回 -1
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // 找到 target ，返回索引 j
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* 二分搜尋最右一個 target */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // 轉化為查詢最左一個 target + 1
        let i = binary_search_insertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        let j = i - 1;
        // 未找到 target ，返回 -1
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // 找到 target ，返回索引 j
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* 二分搜尋最右一個 target */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // 轉化為查詢最左一個 target + 1
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* 二分搜尋最右一個 target */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // 轉化為查詢最左一個 target + 1
        val i = binarySearchInsertion(nums, target + 1)
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        val j = i - 1
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // 找到 target ，返回索引 j
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    [class]{}-[func]{binary_search_right_edge}
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchRightEdge}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E8%BD%AC%E5%8C%96%E4%B8%BA%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E6%8C%87%E5%90%91%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%20%EF%BC%8Ci%20%E6%8C%87%E5%90%91%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%8F%92%E5%85%A5%E7%82%B9%EF%BC%88%E5%AD%98%E5%9C%A8%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%EF%BC%89%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E9%97%AD%E5%8C%BA%E9%97%B4%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%E7%B4%A2%E5%BC%95%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bm%2B1,%20j%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%E9%A6%96%E4%B8%AA%E5%B0%8F%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%E5%9C%A8%E5%8C%BA%E9%97%B4%20%5Bi,%20m-1%5D%20%E4%B8%AD%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%8F%92%E5%85%A5%E7%82%B9%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%22%22%22%0A%20%20%20%20%23%20%E8%BD%AC%E5%8C%96%E4%B8%BA%E6%9F%A5%E6%89%BE%E6%9C%80%E5%B7%A6%E4%B8%80%E4%B8%AA%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%E6%8C%87%E5%90%91%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%20target%20%EF%BC%8Ci%20%E6%8C%87%E5%90%91%E9%A6%96%E4%B8%AA%E5%A4%A7%E4%BA%8E%20target%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20%E6%9C%AA%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20!%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%E6%89%BE%E5%88%B0%20target%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%85%83%E7%B4%A0%E7%9A%84%E6%95%B0%E7%BB%84%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE%E5%B7%A6%E8%BE%B9%E7%95%8C%E5%92%8C%E5%8F%B3%E8%BE%B9%E7%95%8C%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%8F%B3%E4%B8%80%E4%B8%AA%E5%85%83%E7%B4%A0%20%7Btarget%7D%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 轉化為查詢元素

我們知道，當陣列不包含 `target` 時，最終 $i$ 和 $j$ 會分別指向首個大於、小於 `target` 的元素。

因此，如圖 10-8 所示，我們可以構造一個陣列中不存在的元素，用於查詢左右邊界。

- 查詢最左一個 `target` ：可以轉化為查詢 `target - 0.5` ，並返回指標 $i$ 。
- 查詢最右一個 `target` ：可以轉化為查詢 `target + 0.5` ，並返回指標 $j$ 。

![將查詢邊界轉化為查詢元素](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> 圖 10-8 &nbsp; 將查詢邊界轉化為查詢元素 </p>

程式碼在此省略，以下兩點值得注意。

- 給定陣列不包含小數，這意味著我們無須關心如何處理相等的情況。
- 因為該方法引入了小數，所以需要將函式中的變數 `target` 改為浮點數型別（Python 無須改動）。
