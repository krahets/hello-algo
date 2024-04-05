---
comments: true
---

# 8.3 &nbsp; Top-k 問題

!!! question

    給定一個長度為 $n$ 的無序陣列 `nums` ，請返回陣列中最大的 $k$ 個元素。

對於該問題，我們先介紹兩種思路比較直接的解法，再介紹效率更高的堆積解法。

## 8.3.1 &nbsp; 方法一：走訪選擇

我們可以進行圖 8-6 所示的 $k$ 輪走訪，分別在每輪中提取第 $1$、$2$、$\dots$、$k$ 大的元素，時間複雜度為 $O(nk)$ 。

此方法只適用於 $k \ll n$ 的情況，因為當 $k$ 與 $n$ 比較接近時，其時間複雜度趨向於 $O(n^2)$ ，非常耗時。

![走訪尋找最大的 k 個元素](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> 圖 8-6 &nbsp; 走訪尋找最大的 k 個元素 </p>

!!! tip

    當 $k = n$ 時，我們可以得到完整的有序序列，此時等價於“選擇排序”演算法。

## 8.3.2 &nbsp; 方法二：排序

如圖 8-7 所示，我們可以先對陣列 `nums` 進行排序，再返回最右邊的 $k$ 個元素，時間複雜度為 $O(n \log n)$ 。

顯然，該方法“超額”完成任務了，因為我們只需找出最大的 $k$ 個元素即可，而不需要排序其他元素。

![排序尋找最大的 k 個元素](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> 圖 8-7 &nbsp; 排序尋找最大的 k 個元素 </p>

## 8.3.3 &nbsp; 方法三：堆積

我們可以基於堆積更加高效地解決 Top-k 問題，流程如圖 8-8 所示。

1. 初始化一個小頂堆積，其堆積頂元素最小。
2. 先將陣列的前 $k$ 個元素依次入堆積。
3. 從第 $k + 1$ 個元素開始，若當前元素大於堆積頂元素，則將堆積頂元素出堆積，並將當前元素入堆積。
4. 走訪完成後，堆積中儲存的就是最大的 $k$ 個元素。

=== "<1>"
    ![基於堆積尋找最大的 k 個元素](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

=== "<2>"
    ![top_k_heap_step2](top_k.assets/top_k_heap_step2.png){ class="animation-figure" }

=== "<3>"
    ![top_k_heap_step3](top_k.assets/top_k_heap_step3.png){ class="animation-figure" }

=== "<4>"
    ![top_k_heap_step4](top_k.assets/top_k_heap_step4.png){ class="animation-figure" }

=== "<5>"
    ![top_k_heap_step5](top_k.assets/top_k_heap_step5.png){ class="animation-figure" }

=== "<6>"
    ![top_k_heap_step6](top_k.assets/top_k_heap_step6.png){ class="animation-figure" }

=== "<7>"
    ![top_k_heap_step7](top_k.assets/top_k_heap_step7.png){ class="animation-figure" }

=== "<8>"
    ![top_k_heap_step8](top_k.assets/top_k_heap_step8.png){ class="animation-figure" }

=== "<9>"
    ![top_k_heap_step9](top_k.assets/top_k_heap_step9.png){ class="animation-figure" }

<p align="center"> 圖 8-8 &nbsp; 基於堆積尋找最大的 k 個元素 </p>

示例程式碼如下：

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """基於堆積查詢陣列中最大的 k 個元素"""
        # 初始化小頂堆積
        heap = []
        # 將陣列的前 k 個元素入堆積
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # 從第 k+1 個元素開始，保持堆積的長度為 k
        for i in range(k, len(nums)):
            # 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // 初始化小頂堆積
        priority_queue<int, vector<int>, greater<int>> heap;
        // 將陣列的前 k 個元素入堆積
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (int i = k; i < nums.size(); i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > heap.top()) {
                heap.pop();
                heap.push(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Java"

    ```java title="top_k.java"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // 初始化小頂堆積
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 將陣列的前 k 個元素入堆積
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (int i = k; i < nums.length; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > heap.peek()) {
                heap.poll();
                heap.offer(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "C#"

    ```csharp title="top_k.cs"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 初始化小頂堆積
        PriorityQueue<int, int> heap = new();
        // 將陣列的前 k 個元素入堆積
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (int i = k; i < nums.Length; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > heap.Peek()) {
                heap.Dequeue();
                heap.Enqueue(nums[i], nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Go"

    ```go title="top_k.go"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    func topKHeap(nums []int, k int) *minHeap {
        // 初始化小頂堆積
        h := &minHeap{}
        heap.Init(h)
        // 將陣列的前 k 個元素入堆積
        for i := 0; i < k; i++ {
            heap.Push(h, nums[i])
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for i := k; i < len(nums); i++ {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if nums[i] > h.Top().(int) {
                heap.Pop(h)
                heap.Push(h, nums[i])
            }
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="top_k.swift"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    func topKHeap(nums: [Int], k: Int) -> [Int] {
        // 初始化一個小頂堆積，並將前 k 個元素建堆積
        var heap = Heap(nums.prefix(k))
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for i in nums.indices.dropFirst(k) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if nums[i] > heap.min()! {
                _ = heap.removeMin()
                heap.insert(nums[i])
            }
        }
        return heap.unordered
    }
    ```

=== "JS"

    ```javascript title="top_k.js"
    /* 元素入堆積 */
    function pushMinHeap(maxHeap, val) {
        // 元素取反
        maxHeap.push(-val);
    }

    /* 元素出堆積 */
    function popMinHeap(maxHeap) {
        // 元素取反
        return -maxHeap.pop();
    }

    /* 訪問堆積頂元素 */
    function peekMinHeap(maxHeap) {
        // 元素取反
        return -maxHeap.peek();
    }

    /* 取出堆積中元素 */
    function getMinHeap(maxHeap) {
        // 元素取反
        return maxHeap.getMaxHeap().map((num) => -num);
    }

    /* 基於堆積查詢陣列中最大的 k 個元素 */
    function topKHeap(nums, k) {
        // 初始化小頂堆積
        // 請注意：我們將堆積中所有元素取反，從而用大頂堆積來模擬小頂堆積
        const maxHeap = new MaxHeap([]);
        // 將陣列的前 k 個元素入堆積
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (let i = k; i < nums.length; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // 返回堆積中元素
        return getMinHeap(maxHeap);
    }
    ```

=== "TS"

    ```typescript title="top_k.ts"
    /* 元素入堆積 */
    function pushMinHeap(maxHeap: MaxHeap, val: number): void {
        // 元素取反
        maxHeap.push(-val);
    }

    /* 元素出堆積 */
    function popMinHeap(maxHeap: MaxHeap): number {
        // 元素取反
        return -maxHeap.pop();
    }

    /* 訪問堆積頂元素 */
    function peekMinHeap(maxHeap: MaxHeap): number {
        // 元素取反
        return -maxHeap.peek();
    }

    /* 取出堆積中元素 */
    function getMinHeap(maxHeap: MaxHeap): number[] {
        // 元素取反
        return maxHeap.getMaxHeap().map((num: number) => -num);
    }

    /* 基於堆積查詢陣列中最大的 k 個元素 */
    function topKHeap(nums: number[], k: number): number[] {
        // 初始化小頂堆積
        // 請注意：我們將堆積中所有元素取反，從而用大頂堆積來模擬小頂堆積
        const maxHeap = new MaxHeap([]);
        // 將陣列的前 k 個元素入堆積
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (let i = k; i < nums.length; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // 返回堆積中元素
        return getMinHeap(maxHeap);
    }
    ```

=== "Dart"

    ```dart title="top_k.dart"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    MinHeap topKHeap(List<int> nums, int k) {
      // 初始化小頂堆積，將陣列的前 k 個元素入堆積
      MinHeap heap = MinHeap(nums.sublist(0, k));
      // 從第 k+1 個元素開始，保持堆積的長度為 k
      for (int i = k; i < nums.length; i++) {
        // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
        if (nums[i] > heap.peek()) {
          heap.pop();
          heap.push(nums[i]);
        }
      }
      return heap;
    }
    ```

=== "Rust"

    ```rust title="top_k.rs"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
        // BinaryHeap 是大頂堆積，使用 Reverse 將元素取反，從而實現小頂堆積
        let mut heap = BinaryHeap::<Reverse<i32>>::new();
        // 將陣列的前 k 個元素入堆積
        for &num in nums.iter().take(k) {
            heap.push(Reverse(num));
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for &num in nums.iter().skip(k) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if num > heap.peek().unwrap().0 {
                heap.pop();
                heap.push(Reverse(num));
            }
        }
        heap
    }
    ```

=== "C"

    ```c title="top_k.c"
    /* 元素入堆積 */
    void pushMinHeap(MaxHeap *maxHeap, int val) {
        // 元素取反
        push(maxHeap, -val);
    }

    /* 元素出堆積 */
    int popMinHeap(MaxHeap *maxHeap) {
        // 元素取反
        return -pop(maxHeap);
    }

    /* 訪問堆積頂元素 */
    int peekMinHeap(MaxHeap *maxHeap) {
        // 元素取反
        return -peek(maxHeap);
    }

    /* 取出堆積中元素 */
    int *getMinHeap(MaxHeap *maxHeap) {
        // 將堆積中所有元素取反並存入 res 陣列
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    /* 取出堆積中元素 */
    int *getMinHeap(MaxHeap *maxHeap) {
        // 將堆積中所有元素取反並存入 res 陣列
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    // 基於堆積查詢陣列中最大的 k 個元素的函式
    int *topKHeap(int *nums, int sizeNums, int k) {
        // 初始化小頂堆積
        // 請注意：我們將堆積中所有元素取反，從而用大頂堆積來模擬小頂堆積
        int *empty = (int *)malloc(0);
        MaxHeap *maxHeap = newMaxHeap(empty, 0);
        // 將陣列的前 k 個元素入堆積
        for (int i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (int i = k; i < sizeNums; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        int *res = getMinHeap(maxHeap);
        // 釋放記憶體
        delMaxHeap(maxHeap);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
        // 初始化小頂堆積
        val heap = PriorityQueue<Int>()
        // 將陣列的前 k 個元素入堆積
        for (i in 0..<k) {
            heap.offer(nums[i])
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (i in k..<nums.size) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
            if (nums[i] > heap.peek()) {
                heap.poll()
                heap.offer(nums[i])
            }
        }
        return heap
    }
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    [class]{}-[func]{top_k_heap}
    ```

=== "Zig"

    ```zig title="top_k.zig"
    [class]{}-[func]{topKHeap}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E5%A0%86%E6%9F%A5%E6%89%BE%E6%95%B0%E7%BB%84%E4%B8%AD%E6%9C%80%E5%A4%A7%E7%9A%84%20k%20%E4%B8%AA%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B0%8F%E9%A1%B6%E5%A0%86%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%B0%86%E6%95%B0%E7%BB%84%E7%9A%84%E5%89%8D%20k%20%E4%B8%AA%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20%E4%BB%8E%E7%AC%AC%20k%2B1%20%E4%B8%AA%E5%85%83%E7%B4%A0%E5%BC%80%E5%A7%8B%EF%BC%8C%E4%BF%9D%E6%8C%81%E5%A0%86%E7%9A%84%E9%95%BF%E5%BA%A6%E4%B8%BA%20k%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E5%A4%A7%E4%BA%8E%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%EF%BC%8C%E5%88%99%E5%B0%86%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%E3%80%81%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E5%A0%86%E6%9F%A5%E6%89%BE%E6%95%B0%E7%BB%84%E4%B8%AD%E6%9C%80%E5%A4%A7%E7%9A%84%20k%20%E4%B8%AA%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B0%8F%E9%A1%B6%E5%A0%86%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%B0%86%E6%95%B0%E7%BB%84%E7%9A%84%E5%89%8D%20k%20%E4%B8%AA%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20%E4%BB%8E%E7%AC%AC%20k%2B1%20%E4%B8%AA%E5%85%83%E7%B4%A0%E5%BC%80%E5%A7%8B%EF%BC%8C%E4%BF%9D%E6%8C%81%E5%A0%86%E7%9A%84%E9%95%BF%E5%BA%A6%E4%B8%BA%20k%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E5%A4%A7%E4%BA%8E%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%EF%BC%8C%E5%88%99%E5%B0%86%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%E3%80%81%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

總共執行了 $n$ 輪入堆積和出堆積，堆積的最大長度為 $k$ ，因此時間複雜度為 $O(n \log k)$ 。該方法的效率很高，當 $k$ 較小時，時間複雜度趨向 $O(n)$ ；當 $k$ 較大時，時間複雜度不會超過 $O(n \log n)$ 。

另外，該方法適用於動態資料流的使用場景。在不斷加入資料時，我們可以持續維護堆積內的元素，從而實現最大的 $k$ 個元素的動態更新。
