---
comments: true
---

# 8.1 &nbsp; 堆積

<u>堆積（heap）</u>是符合特定條件的完全二元樹，主要分為以下兩種，如圖 8-1 所示。

- <u>最小堆積（min heap）</u>：任一節點的值 $\leq$ 其子節點的值。
- <u>最大堆積（max heap）</u>：任一節點的值 $\geq$ 其子節點的值。

![最小堆積與最大堆積](heap.assets/min_heap_and_max_heap.svg){ class="animation-figure" }

<p align="center"> 圖 8-1 &nbsp; 最小堆積與最大堆積 </p>

堆積是完全二元樹的一種特例，具有以下特性。

- 最底層的節點從左往右依序填入，其餘各層皆已填滿。
- 我們稱二元樹的根節點為「堆積頂端」，最底層最右側的節點為「堆積底端」。
- 在最大堆積（最小堆積）中，頂端元素也就是根節點，其值是整個堆積中的最大值（最小值）。

## 8.1.1 &nbsp; 堆積的常用操作

許多程式語言提供的是<u>優先佇列（priority queue）</u>。這種抽象資料結構是一個依元素優先順序排列的佇列。

實際上，**優先佇列通常以堆積實作。最大堆積相當於依元素值由大到小取出元素的優先佇列**。從使用者的角度來看，可以將「優先佇列」和「堆積」視為等價的資料結構。因此，本書統稱兩者為「堆積」。

表 8-1 列出堆積的常用操作，實際的方法名稱依程式語言而定。

<p align="center"> 表 8-1 &nbsp; 堆積的操作效率 </p>

<div class="center-table" markdown>

| 方法名稱      | 說明                                             | 時間複雜度  |
| ----------- | ------------------------------------------------ | ----------- |
| `push()`    | 將元素加入堆積                                         | $O(\log n)$ |
| `pop()`     | 取出堆積頂端元素                                     | $O(\log n)$ |
| `peek()`    | 讀取堆積頂端元素（最大堆積為最大值，最小堆積為最小值） | $O(1)$      |
| `size()`    | 取得堆積中的元素個數                                 | $O(1)$      |
| `isEmpty()` | 判斷堆積是否為空                                   | $O(1)$      |

</div>

實際應用時，可以直接使用程式語言提供的堆積類別（或優先佇列類別）。

就像排序演算法可以「由小到大」或「由大到小」排列，我們可以設定 `flag` 或修改 `Comparator`，在最小堆積與最大堆積之間切換。程式碼如下：

=== "Python"

    ```python title="heap.py"
    # 初始化最小堆積
    min_heap, flag = [], 1
    # 初始化最大堆積
    max_heap, flag = [], -1

    # Python 的 heapq 模組預設實作最小堆積
    # 可以先將元素變號再加入堆積，顛倒元素間的大小關係，藉此實作最大堆積
    # 本例中 flag = 1 代表最小堆積，flag = -1 代表最大堆積

    # 將元素加入堆積
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # 取得堆積頂端元素
    peek: int = flag * max_heap[0]  # 5

    # 取出堆積頂端元素
    # 取出的元素會依照由大到小的順序排列
    val = flag * heapq.heappop(max_heap)  # 5
    val = flag * heapq.heappop(max_heap)  # 4
    val = flag * heapq.heappop(max_heap)  # 3
    val = flag * heapq.heappop(max_heap)  # 2
    val = flag * heapq.heappop(max_heap)  # 1

    # 取得堆積大小
    size: int = len(max_heap)

    # 判斷堆積是否為空
    is_empty: bool = not max_heap

    # 以輸入串列建立堆積
    # 時間複雜度為 O(n)，而非 O(nlogn)
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    ```

=== "C++"

    ```cpp title="heap.cpp"
    /* 初始化堆積 */
    // 初始化最小堆積
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 初始化最大堆積
    priority_queue<int, vector<int>, less<int>> maxHeap;

    /* 將元素加入堆積 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);

    /* 取得堆積頂端元素 */
    int peek = maxHeap.top(); // 5

    /* 取出堆積頂端元素 */
    // 取出的元素會依照由大到小的順序排列
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* 取得堆積大小 */
    int size = maxHeap.size();

    /* 判斷堆積是否為空 */
    bool isEmpty = maxHeap.empty();

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    ```

=== "Java"

    ```java title="heap.java"
    /* 初始化堆積 */
    // 初始化最小堆積
    Queue<Integer> minHeap = new PriorityQueue<>();
    // 初始化最大堆積（用 lambda 運算式修改 Comparator 即可）
    Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

    /* 將元素加入堆積 */
    maxHeap.offer(1);
    maxHeap.offer(3);
    maxHeap.offer(2);
    maxHeap.offer(5);
    maxHeap.offer(4);

    /* 取得堆積頂端元素 */
    int peek = maxHeap.peek(); // 5

    /* 取出堆積頂端元素 */
    // 取出的元素會依照由大到小的順序排列
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1

    /* 取得堆積大小 */
    int size = maxHeap.size();

    /* 判斷堆積是否為空 */
    boolean isEmpty = maxHeap.isEmpty();

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C#"

    ```csharp title="heap.cs"
    /* 初始化堆積 */
    // 初始化最小堆積
    PriorityQueue<int, int> minHeap = new();
    // 初始化最大堆積（用 lambda 運算式修改 Comparer 即可）
    PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    /* 將元素加入堆積 */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* 取得堆積頂端元素 */
    int peek = maxHeap.Peek(); // 5

    /* 取出堆積頂端元素 */
    // 取出的元素會依照由大到小的順序排列
    peek = maxHeap.Dequeue(); // 5
    peek = maxHeap.Dequeue(); // 4
    peek = maxHeap.Dequeue(); // 3
    peek = maxHeap.Dequeue(); // 2
    peek = maxHeap.Dequeue(); // 1

    /* 取得堆積大小 */
    int size = maxHeap.Count;

    /* 判斷堆積是否為空 */
    bool isEmpty = maxHeap.Count == 0;

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
    ```

=== "Go"

    ```go title="heap.go"
    // 在 Go 中可以實作 heap.Interface 來建立整數最大堆積
    // 實作 heap.Interface 時也要實作 sort.Interface
    type intHeap []any

    // Push 是 heap.Interface 的方法，負責將元素加入堆積
    func (h *intHeap) Push(x any) {
        // Push 和 Pop 都使用指標接收者（pointer receiver）
        // 因為這兩個方法除了調整切片的內容，也會改變切片的長度。
        *h = append(*h, x.(int))
    }

    // Pop 是 heap.Interface 的方法，取出切片的最後一個元素（heap.Pop 已將頂端元素換到尾端）
    func (h *intHeap) Pop() any {
        // 待取出的元素位於尾端
        last := (*h)[len(*h)-1]
        *h = (*h)[:len(*h)-1]
        return last
    }

    // Len 是 sort.Interface 的方法
    func (h *intHeap) Len() int {
        return len(*h)
    }

    // Less 是 sort.Interface 的方法
    func (h *intHeap) Less(i, j int) bool {
        // 若要實作最小堆積，這裡應改用小於符號
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap 是 sort.Interface 的方法
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top 取得堆積頂端元素
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    func TestHeap(t *testing.T) {
        /* 初始化堆積 */
        // 初始化最大堆積
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* 將元素加入堆積 */
        // 呼叫 heap.Interface 的方法以加入元素
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 5)
        heap.Push(maxHeap, 4)

        /* 取得堆積頂端元素 */
        top := maxHeap.Top()
        fmt.Printf("堆積頂端元素為 %d\n", top)

        /* 取出堆積頂端元素 */
        // 呼叫 heap.Interface 的方法以移除元素
        fmt.Printf("從堆積取出的元素為 %d\n", heap.Pop(maxHeap)) // 5
        fmt.Printf("從堆積取出的元素為 %d\n", heap.Pop(maxHeap)) // 4
        fmt.Printf("從堆積取出的元素為 %d\n", heap.Pop(maxHeap)) // 3
        fmt.Printf("從堆積取出的元素為 %d\n", heap.Pop(maxHeap)) // 2
        fmt.Printf("從堆積取出的元素為 %d\n", heap.Pop(maxHeap)) // 1

        /* 取得堆積大小 */
        size := len(*maxHeap)
        fmt.Printf("堆積中的元素個數為 %d\n", size)

        /* 判斷堆積是否為空 */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("堆積是否為空 %t\n", isEmpty)
    }
    ```

=== "Swift"

    ```swift title="heap.swift"
    import HeapModule

    /* 初始化堆積 */
    // Swift 的 Heap 型別同時支援最大堆積與最小堆積，須引入 swift-collections 套件
    var heap = Heap<Int>()

    /* 將元素加入堆積 */
    heap.insert(1)
    heap.insert(3)
    heap.insert(2)
    heap.insert(5)
    heap.insert(4)

    /* 取得堆積頂端元素 */
    var peek = heap.max()

    /* 取出堆積頂端元素 */
    peek = heap.removeMax() // 5
    peek = heap.removeMax() // 4
    peek = heap.removeMax() // 3
    peek = heap.removeMax() // 2
    peek = heap.removeMax() // 1

    /* 取得堆積大小 */
    let size = heap.count

    /* 判斷堆積是否為空 */
    let isEmpty = heap.isEmpty

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    let heap2 = Heap([1, 3, 2, 5, 4])
    ```

=== "JS"

    ```javascript title="heap.js"
    // JavaScript 沒有內建 Heap 類別
    ```

=== "TS"

    ```typescript title="heap.ts"
    // TypeScript 沒有內建 Heap 類別
    ```

=== "Dart"

    ```dart title="heap.dart"
    // Dart 沒有內建 Heap 類別
    ```

=== "Rust"

    ```rust title="heap.rs"
    use std::{cmp::Reverse, collections::BinaryHeap};

    /* 初始化堆積 */
    // 初始化最小堆積
    // Rust 的 BinaryHeap 是最大堆積，實作最小堆積時需用 Reverse 包裝元素
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // 初始化最大堆積
    let mut max_heap = BinaryHeap::new();

    /* 將元素加入堆積 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);

    /* 取得堆積頂端元素 */
    let peek = max_heap.peek().unwrap(); // 5

    /* 取出堆積頂端元素 */
    // 取出的元素會依照由大到小的順序排列
    let peek = max_heap.pop().unwrap(); // 5
    let peek = max_heap.pop().unwrap(); // 4
    let peek = max_heap.pop().unwrap(); // 3
    let peek = max_heap.pop().unwrap(); // 2
    let peek = max_heap.pop().unwrap(); // 1

    /* 取得堆積大小 */
    let size = max_heap.len();

    /* 判斷堆積是否為空 */
    let is_empty = max_heap.is_empty();

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    ```

=== "C"

    ```c title="heap.c"
    // C 沒有內建 Heap 類別
    ```

=== "Kotlin"

    ```kotlin title="heap.kt"
    /* 初始化堆積 */
    // 初始化最小堆積
    var minHeap = PriorityQueue<Int>()
    // 初始化最大堆積（用 lambda 運算式修改 Comparator 即可）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    /* 將元素加入堆積 */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)

    /* 取得堆積頂端元素 */
    var peek = maxHeap.peek() // 5

    /* 取出堆積頂端元素 */
    // 取出的元素會依照由大到小的順序排列
    peek = maxHeap.poll() // 5
    peek = maxHeap.poll() // 4
    peek = maxHeap.poll() // 3
    peek = maxHeap.poll() // 2
    peek = maxHeap.poll() // 1

    /* 取得堆積大小 */
    val size = maxHeap.size

    /* 判斷堆積是否為空 */
    val isEmpty = maxHeap.isEmpty()

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    ```

=== "Ruby"

    ```ruby title="heap.rb"
    # Ruby 沒有內建 Heap 類別
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap,%20flag%20%3D%20%5B%5D,%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20max_heap,%20flag%20%3D%20%5B%5D,%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E7%B5%84%E9%A0%90%E8%A8%AD%E4%BD%BF%E7%94%A8%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%85%88%E5%B0%87%E5%85%83%E7%B4%A0%E4%B9%98%E4%BB%A5%20-1%20%E5%86%8D%E6%94%BE%E5%85%A5%E5%A0%86%E7%A9%8D%EF%BC%8C%E5%8D%B3%E5%8F%AF%E5%8F%8D%E8%BD%89%E5%A4%A7%E5%B0%8F%E9%97%9C%E4%BF%82%EF%BC%8C%E5%AF%A6%E4%BD%9C%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%9C%AC%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E4%BB%A3%E8%A1%A8%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%EF%BC%8Cflag%20%3D%20-1%20%E4%BB%A3%E8%A1%A8%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%94%BE%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%8F%96%E5%87%BA%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%23%20%E4%BE%9D%E5%BA%8F%E5%8F%96%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%E6%9C%83%E5%BD%A2%E6%88%90%E7%94%B1%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E6%95%B8%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E7%9A%84%E5%85%83%E7%B4%A0%E5%80%8B%E6%95%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E8%BC%B8%E5%85%A5%E7%9A%84%E4%B8%B2%E5%88%97%E5%BB%BA%E6%88%90%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E6%98%AF%20O%28n%29%EF%BC%8C%E8%80%8C%E9%9D%9E%20O%28nlogn%29%0A%20%20%20%20min_heap%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap,%20flag%20%3D%20%5B%5D,%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20max_heap,%20flag%20%3D%20%5B%5D,%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E7%B5%84%E9%A0%90%E8%A8%AD%E4%BD%BF%E7%94%A8%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%85%88%E5%B0%87%E5%85%83%E7%B4%A0%E4%B9%98%E4%BB%A5%20-1%20%E5%86%8D%E6%94%BE%E5%85%A5%E5%A0%86%E7%A9%8D%EF%BC%8C%E5%8D%B3%E5%8F%AF%E5%8F%8D%E8%BD%89%E5%A4%A7%E5%B0%8F%E9%97%9C%E4%BF%82%EF%BC%8C%E5%AF%A6%E4%BD%9C%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%9C%AC%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E4%BB%A3%E8%A1%A8%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%EF%BC%8Cflag%20%3D%20-1%20%E4%BB%A3%E8%A1%A8%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%94%BE%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%8F%96%E5%87%BA%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%23%20%E4%BE%9D%E5%BA%8F%E5%8F%96%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%E6%9C%83%E5%BD%A2%E6%88%90%E7%94%B1%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E6%95%B8%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E7%9A%84%E5%85%83%E7%B4%A0%E5%80%8B%E6%95%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E8%BC%B8%E5%85%A5%E7%9A%84%E4%B8%B2%E5%88%97%E5%BB%BA%E6%88%90%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E6%98%AF%20O%28n%29%EF%BC%8C%E8%80%8C%E9%9D%9E%20O%28nlogn%29%0A%20%20%20%20min_heap%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 8.1.2 &nbsp; 堆積的實作

下文實作最大堆積。若要改成最小堆積，只要反轉所有大小比較的判斷條件（例如將 $\geq$ 改為 $\leq$）。有興趣的讀者可以動手試試。

### 1. &nbsp; 堆積的儲存與表示法

「二元樹」一章提過，完全二元樹很適合用陣列表示。堆積正是一種完全二元樹，**因此我們用陣列來儲存堆積**。

用陣列表示二元樹時，元素代表節點值，索引代表節點在樹中的位置。**節點指標可透過索引之間的對應公式來實作**。

如圖 8-2 所示，給定索引 $i$，其左子節點的索引為 $2i + 1$，右子節點的索引為 $2i + 2$，父節點的索引為 $(i - 1) / 2$（向下取整的整數除法）。若索引超出範圍，表示該位置為空或節點不存在。

![堆積的表示與儲存](heap.assets/representation_of_heap.svg){ class="animation-figure" }

<p align="center"> 圖 8-2 &nbsp; 堆積的表示與儲存 </p>

我們可以把這些索引公式寫成函式，方便後續使用：

=== "Python"

    ```python title="my_heap.py"
    def left(self, i: int) -> int:
        """取得左子節點的索引"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """取得右子節點的索引"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """取得父節點的索引"""
        return (i - 1) // 2  # 向下取整的整數除法
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 取得左子節點的索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下取整的整數除法
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 取得左子節點的索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下取整的整數除法
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 取得左子節點的索引 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int Parent(int i) {
        return (i - 1) / 2; // 向下取整的整數除法
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 取得左子節點的索引 */
    func (h *maxHeap) left(i int) int {
        return 2*i + 1
    }

    /* 取得右子節點的索引 */
    func (h *maxHeap) right(i int) int {
        return 2*i + 2
    }

    /* 取得父節點的索引 */
    func (h *maxHeap) parent(i int) int {
        // 向下取整的整數除法
        return (i - 1) / 2
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 取得左子節點的索引 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 取得右子節點的索引 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 取得父節點的索引 */
    func parent(i: Int) -> Int {
        (i - 1) / 2 // 向下取整的整數除法
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 取得左子節點的索引 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 向下取整的整數除法
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 取得左子節點的索引 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 向下取整的整數除法
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 取得左子節點的索引 */
    int _left(int i) {
      return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int _right(int i) {
      return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int _parent(int i) {
      return (i - 1) ~/ 2; // 向下取整的整數除法
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 取得左子節點的索引 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 取得右子節點的索引 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 取得父節點的索引 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 向下取整的整數除法
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 取得左子節點的索引 */
    int left(MaxHeap *maxHeap, int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int right(MaxHeap *maxHeap, int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int parent(MaxHeap *maxHeap, int i) {
        return (i - 1) / 2; // 無條件捨去至整數
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 取得左子節點的索引 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 取得右子節點的索引 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 取得父節點的索引 */
    fun parent(i: Int): Int {
        return (i - 1) / 2 // 向下取整的整數除法
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 取得左子節點的索引 ###
    def left(i)
      2 * i + 1
    end

    ### 取得右子節點的索引 ###
    def right(i)
      2 * i + 2
    end

    ### 取得父節點的索引 ###
    def parent(i)
      (i - 1) / 2     # 向下取整的整數除法
    end
    ```

### 2. &nbsp; 讀取堆積頂端元素

堆積頂端元素就是二元樹的根節點，也就是串列的第一個元素：

=== "Python"

    ```python title="my_heap.py"
    def peek(self) -> int:
        """讀取堆積頂端元素"""
        return self.max_heap[0]
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 讀取堆積頂端元素 */
    int peek() {
        return maxHeap[0];
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 讀取堆積頂端元素 */
    int peek() {
        return maxHeap.get(0);
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 讀取堆積頂端元素 */
    int Peek() {
        return maxHeap[0];
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 讀取堆積頂端元素 */
    func (h *maxHeap) peek() any {
        return h.data[0]
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 讀取堆積頂端元素 */
    func peek() -> Int {
        maxHeap[0]
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 讀取堆積頂端元素 */
    peek() {
        return this.#maxHeap[0];
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 讀取堆積頂端元素 */
    peek(): number {
        return this.maxHeap[0];
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 讀取堆積頂端元素 */
    int peek() {
      return _maxHeap[0];
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 讀取堆積頂端元素 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 讀取堆積頂端元素 */
    int peek(MaxHeap *maxHeap) {
        return maxHeap->data[0];
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 讀取堆積頂端元素 */
    fun peek(): Int {
        return maxHeap[0]
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 讀取堆積頂端元素 ###
    def peek
      @max_heap[0]
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E4%BE%9D%E5%8E%9F%E9%A0%86%E5%BA%8F%E5%85%A8%E9%83%A8%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%90%91%E4%B8%8B%E5%8F%96%E6%95%B4%E7%9A%84%E6%95%B4%E6%95%B8%E9%99%A4%E6%B3%95%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%80%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%B3%A8%E6%84%8F%EF%BC%9A%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%E5%B7%B2%E7%B6%93%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%20%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%E7%82%BA%20%7Bpeek%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E4%BE%9D%E5%8E%9F%E9%A0%86%E5%BA%8F%E5%85%A8%E9%83%A8%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%90%91%E4%B8%8B%E5%8F%96%E6%95%B4%E7%9A%84%E6%95%B4%E6%95%B8%E9%99%A4%E6%B3%95%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%AE%80%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%B3%A8%E6%84%8F%EF%BC%9A%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%E5%B7%B2%E7%B6%93%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%20%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%E7%82%BA%20%7Bpeek%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 3. &nbsp; 將元素加入堆積

給定元素 `val`，先將它加到堆積底端。加入後，`val` 可能大於堆積中的其他元素，使堆積不再符合原本的性質。**因此，必須沿著插入節點到根節點的路徑調整節點**，這項操作稱為<u>堆積化（heapify）</u>。

從新加入的節點開始，**由下往上調整堆積**。如圖 8-3 所示，比較插入節點與父節點的值，若插入節點的值較大，就交換兩者。反覆執行這個操作，由下往上調整，直到越過根節點或遇到無須交換的節點為止。

=== "<1>"
    ![將元素加入堆積的步驟](heap.assets/heap_push_step1.svg){ class="animation-figure" }

=== "<2>"
    ![heap_push_step2](heap.assets/heap_push_step2.svg){ class="animation-figure" }

=== "<3>"
    ![heap_push_step3](heap.assets/heap_push_step3.svg){ class="animation-figure" }

=== "<4>"
    ![heap_push_step4](heap.assets/heap_push_step4.svg){ class="animation-figure" }

=== "<5>"
    ![heap_push_step5](heap.assets/heap_push_step5.svg){ class="animation-figure" }

=== "<6>"
    ![heap_push_step6](heap.assets/heap_push_step6.svg){ class="animation-figure" }

=== "<7>"
    ![heap_push_step7](heap.assets/heap_push_step7.svg){ class="animation-figure" }

=== "<8>"
    ![heap_push_step8](heap.assets/heap_push_step8.svg){ class="animation-figure" }

=== "<9>"
    ![heap_push_step9](heap.assets/heap_push_step9.svg){ class="animation-figure" }

<p align="center"> 圖 8-3 &nbsp; 將元素加入堆積的步驟 </p>

設節點總數為 $n$，則樹的高度為 $O(\log n)$。因此調整堆積的迴圈最多執行 $O(\log n)$ 輪，**將元素加入堆積的時間複雜度為 $O(\log n)$**。程式碼如下：

=== "Python"

    ```python title="my_heap.py"
    def push(self, val: int):
        """將元素加入堆積"""
        # 新增節點
        self.max_heap.append(val)
        # 由下往上調整堆積
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """從節點 i 開始向上調整堆積"""
        while True:
            # 取得節點 i 的父節點
            p = self.parent(i)
            # 若已越過根節點，或節點已符合堆積性質，就結束調整
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 交換兩個節點
            self.swap(i, p)
            # 繼續向上調整堆積
            i = p
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 將元素加入堆積 */
    void push(int val) {
        // 新增節點
        maxHeap.push_back(val);
        // 由下往上調整堆積
        siftUp(size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    void siftUp(int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交換兩個節點
            swap(maxHeap[i], maxHeap[p]);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 將元素加入堆積 */
    void push(int val) {
        // 新增節點
        maxHeap.add(val);
        // 由下往上調整堆積
        siftUp(size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    void siftUp(int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 交換兩個節點
            swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 將元素加入堆積 */
    void Push(int val) {
        // 新增節點
        maxHeap.Add(val);
        // 由下往上調整堆積
        SiftUp(Size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    void SiftUp(int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = Parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交換兩個節點
            Swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 將元素加入堆積 */
    func (h *maxHeap) push(val any) {
        // 新增節點
        h.data = append(h.data, val)
        // 由下往上調整堆積
        h.siftUp(len(h.data) - 1)
    }

    /* 從節點 i 開始向上調整堆積 */
    func (h *maxHeap) siftUp(i int) {
        for true {
            // 取得節點 i 的父節點
            p := h.parent(i)
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if p < 0 || h.data[i].(int) <= h.data[p].(int) {
                break
            }
            // 交換兩個節點
            h.swap(i, p)
            // 繼續向上調整堆積
            i = p
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 將元素加入堆積 */
    func push(val: Int) {
        // 新增節點
        maxHeap.append(val)
        // 由下往上調整堆積
        siftUp(i: size() - 1)
    }

    /* 從節點 i 開始向上調整堆積 */
    func siftUp(i: Int) {
        var i = i
        while true {
            // 取得節點 i 的父節點
            let p = parent(i: i)
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 交換兩個節點
            swap(i: i, j: p)
            // 繼續向上調整堆積
            i = p
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 將元素加入堆積 */
    push(val) {
        // 新增節點
        this.#maxHeap.push(val);
        // 由下往上調整堆積
        this.#siftUp(this.size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    #siftUp(i) {
        while (true) {
            // 取得節點 i 的父節點
            const p = this.#parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 交換兩個節點
            this.#swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 將元素加入堆積 */
    push(val: number): void {
        // 新增節點
        this.maxHeap.push(val);
        // 由下往上調整堆積
        this.siftUp(this.size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    siftUp(i: number): void {
        while (true) {
            // 取得節點 i 的父節點
            const p = this.parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 交換兩個節點
            this.swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 將元素加入堆積 */
    void push(int val) {
      // 新增節點
      _maxHeap.add(val);
      // 由下往上調整堆積
      siftUp(size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    void siftUp(int i) {
      while (true) {
        // 取得節點 i 的父節點
        int p = _parent(i);
        // 若已越過根節點，或節點已符合堆積性質，就結束調整
        if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
          break;
        }
        // 交換兩個節點
        _swap(i, p);
        // 繼續向上調整堆積
        i = p;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 將元素加入堆積 */
    fn push(&mut self, val: i32) {
        // 新增節點
        self.max_heap.push(val);
        // 由下往上調整堆積
        self.sift_up(self.size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 節點 i 已位於堆積頂端，結束調整
            if i == 0 {
                break;
            }
            // 取得節點 i 的父節點
            let p = Self::parent(i);
            // 若節點已符合堆積性質，就結束調整
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 交換兩個節點
            self.swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 將元素加入堆積 */
    void push(MaxHeap *maxHeap, int val) {
        // 在預設情況下，不應加入這麼多節點
        if (maxHeap->size == MAX_SIZE) {
            printf("heap is full!");
            return;
        }
        // 新增節點
        maxHeap->data[maxHeap->size] = val;
        maxHeap->size++;

        // 由下往上調整堆積
        siftUp(maxHeap, maxHeap->size - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    void siftUp(MaxHeap *maxHeap, int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = parent(maxHeap, i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
                break;
            }
            // 交換兩個節點
            swap(maxHeap, i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 將元素加入堆積 */
    fun push(_val: Int) {
        // 新增節點
        maxHeap.add(_val)
        // 由下往上調整堆積
        siftUp(size() - 1)
    }

    /* 從節點 i 開始向上調整堆積 */
    fun siftUp(it: Int) {
        // Kotlin 的函式參數不能重新指派，因此建立暫存變數
        var i = it
        while (true) {
            // 取得節點 i 的父節點
            val p = parent(i)
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 交換兩個節點
            swap(i, p)
            // 繼續向上調整堆積
            i = p
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 將元素加入堆積 ###
    def push(val)
      # 新增節點
      @max_heap << val
      # 由下往上調整堆積
      sift_up(size - 1)
    end

    ### 從節點 i 開始向上調整堆積 ###
    def sift_up(i)
      loop do
        # 取得節點 i 的父節點
        p = parent(i)
        # 若已越過根節點，或節點已符合堆積性質，就結束調整
        break if p < 0 || @max_heap[i] <= @max_heap[p]
        # 交換兩個節點
        swap(i, p)
        # 繼續向上調整堆積
        i = p
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E4%BE%9D%E5%8E%9F%E9%A0%86%E5%BA%8F%E5%85%A8%E9%83%A8%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%90%91%E4%B8%8B%E5%8F%96%E6%95%B4%E7%9A%84%E6%95%B4%E6%95%B8%E9%99%A4%E6%B3%95%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B0%87%E5%85%83%E7%B4%A0%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E7%94%B1%E4%B8%8B%E5%BE%80%E4%B8%8A%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BE%9E%E7%AF%80%E9%BB%9E%20i%20%E9%96%8B%E5%A7%8B%E5%90%91%E4%B8%8A%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E7%AF%80%E9%BB%9E%20i%20%E7%9A%84%E7%88%B6%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E8%B6%8A%E9%81%8E%E6%A0%B9%E7%AF%80%E9%BB%9E%EF%BC%8C%E6%88%96%E7%AF%80%E9%BB%9E%E5%B7%B2%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%EF%BC%8C%E5%B0%B1%E7%B5%90%E6%9D%9F%E8%AA%BF%E6%95%B4%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%E5%85%A9%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%B9%BC%E7%BA%8C%E5%90%91%E4%B8%8A%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%B3%A8%E6%84%8F%EF%BC%9A%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%E5%B7%B2%E7%B6%93%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E4%BE%9D%E5%8E%9F%E9%A0%86%E5%BA%8F%E5%85%A8%E9%83%A8%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%90%91%E4%B8%8B%E5%8F%96%E6%95%B4%E7%9A%84%E6%95%B4%E6%95%B8%E9%99%A4%E6%B3%95%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B0%87%E5%85%83%E7%B4%A0%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E7%94%B1%E4%B8%8B%E5%BE%80%E4%B8%8A%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BE%9E%E7%AF%80%E9%BB%9E%20i%20%E9%96%8B%E5%A7%8B%E5%90%91%E4%B8%8A%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E7%AF%80%E9%BB%9E%20i%20%E7%9A%84%E7%88%B6%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E8%B6%8A%E9%81%8E%E6%A0%B9%E7%AF%80%E9%BB%9E%EF%BC%8C%E6%88%96%E7%AF%80%E9%BB%9E%E5%B7%B2%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%EF%BC%8C%E5%B0%B1%E7%B5%90%E6%9D%9F%E8%AA%BF%E6%95%B4%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%E5%85%A9%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%B9%BC%E7%BA%8C%E5%90%91%E4%B8%8A%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%B3%A8%E6%84%8F%EF%BC%9A%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%E5%B7%B2%E7%B6%93%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 4. &nbsp; 取出堆積頂端元素

堆積頂端元素是二元樹的根節點，也就是串列的第一個元素。如果直接刪除串列開頭的元素，樹中所有剩餘節點的索引都會改變，後續就難以透過調整來恢復堆積性質。為了盡量減少索引變動，我們採用以下步驟。

1. 交換堆積頂端與底端的元素（交換根節點與最右側的葉節點）。
2. 交換後，從串列尾端刪除堆積底端的元素（注意，因為已經交換過，實際刪除的是原本的頂端元素）。
3. 從根節點開始，**由上往下調整堆積**。

如圖 8-4 所示，**「由上往下調整堆積」與「由下往上調整堆積」的方向相反**。比較根節點與兩個子節點的值，若子節點的值較大，就將其中較大的那個與根節點交換。反覆執行這個操作，直到越過葉節點或遇到無須交換的節點。

=== "<1>"
    ![取出堆積頂端元素的步驟](heap.assets/heap_pop_step1.svg){ class="animation-figure" }

=== "<2>"
    ![heap_pop_step2](heap.assets/heap_pop_step2.svg){ class="animation-figure" }

=== "<3>"
    ![heap_pop_step3](heap.assets/heap_pop_step3.svg){ class="animation-figure" }

=== "<4>"
    ![heap_pop_step4](heap.assets/heap_pop_step4.svg){ class="animation-figure" }

=== "<5>"
    ![heap_pop_step5](heap.assets/heap_pop_step5.svg){ class="animation-figure" }

=== "<6>"
    ![heap_pop_step6](heap.assets/heap_pop_step6.svg){ class="animation-figure" }

=== "<7>"
    ![heap_pop_step7](heap.assets/heap_pop_step7.svg){ class="animation-figure" }

=== "<8>"
    ![heap_pop_step8](heap.assets/heap_pop_step8.svg){ class="animation-figure" }

=== "<9>"
    ![heap_pop_step9](heap.assets/heap_pop_step9.svg){ class="animation-figure" }

=== "<10>"
    ![heap_pop_step10](heap.assets/heap_pop_step10.svg){ class="animation-figure" }

<p align="center"> 圖 8-4 &nbsp; 取出堆積頂端元素的步驟 </p>

和加入元素類似，取出堆積頂端元素的時間複雜度也是 $O(\log n)$。程式碼如下：

=== "Python"

    ```python title="my_heap.py"
    def pop(self) -> int:
        """從堆積取出元素"""
        # 檢查堆積是否為空
        if self.is_empty():
            raise IndexError("堆積為空")
        # 交換根節點與最右側的葉節點（即首尾兩個元素）
        self.swap(0, self.size() - 1)
        # 刪除節點
        val = self.max_heap.pop()
        # 由上往下調整堆積
        self.sift_down(0)
        # 回傳堆積頂端元素
        return val

    def sift_down(self, i: int):
        """從節點 i 開始向下調整堆積"""
        while True:
            # 找出節點 i、l、r 中值最大的節點，記為 ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if ma == i:
                break
            # 交換兩個節點
            self.swap(i, ma)
            # 繼續向下調整堆積
            i = ma
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 從堆積取出元素 */
    void pop() {
        // 檢查堆積是否為空
        if (isEmpty()) {
            throw out_of_range("堆積為空");
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 刪除節點
        maxHeap.pop_back();
        // 由上往下調整堆積
        siftDown(0);
    }

    /* 從節點 i 開始向下調整堆積 */
    void siftDown(int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 繼續向下調整堆積
            i = ma;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 從堆積取出元素 */
    int pop() {
        // 檢查堆積是否為空
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(0, size() - 1);
        // 刪除節點
        int val = maxHeap.remove(size() - 1);
        // 由上往下調整堆積
        siftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    void siftDown(int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma == i)
                break;
            // 交換兩個節點
            swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 從堆積取出元素 */
    int Pop() {
        // 檢查堆積是否為空
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        Swap(0, Size() - 1);
        // 刪除節點
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 由上往下調整堆積
        SiftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    void SiftDown(int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若節點 i 的值最大，或已越過葉節點，就結束調整
            if (ma == i) break;
            // 交換兩個節點
            Swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 從堆積取出元素 */
    func (h *maxHeap) pop() any {
        // 檢查堆積是否為空
        if h.isEmpty() {
            fmt.Println("error")
            return nil
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        h.swap(0, h.size()-1)
        // 刪除節點
        val := h.data[len(h.data)-1]
        h.data = h.data[:len(h.data)-1]
        // 由上往下調整堆積
        h.siftDown(0)

        // 回傳堆積頂端元素
        return val
    }

    /* 從節點 i 開始向下調整堆積 */
    func (h *maxHeap) siftDown(i int) {
        for true {
            // 找出節點 i、l、r 中值最大的節點，記為 max
            l, r, max := h.left(i), h.right(i), i
            if l < h.size() && h.data[l].(int) > h.data[max].(int) {
                max = l
            }
            if r < h.size() && h.data[r].(int) > h.data[max].(int) {
                max = r
            }
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if max == i {
                break
            }
            // 交換兩個節點
            h.swap(i, max)
            // 繼續向下調整堆積
            i = max
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 從堆積取出元素 */
    func pop() -> Int {
        // 檢查堆積是否為空
        if isEmpty() {
            fatalError("堆積為空")
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(i: 0, j: size() - 1)
        // 刪除節點
        let val = maxHeap.remove(at: size() - 1)
        // 由上往下調整堆積
        siftDown(i: 0)
        // 回傳堆積頂端元素
        return val
    }

    /* 從節點 i 開始向下調整堆積 */
    func siftDown(i: Int) {
        var i = i
        while true {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if ma == i {
                break
            }
            // 交換兩個節點
            swap(i: i, j: ma)
            // 繼續向下調整堆積
            i = ma
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 從堆積取出元素 */
    pop() {
        // 檢查堆積是否為空
        if (this.isEmpty()) throw new Error('堆積為空');
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        this.#swap(0, this.size() - 1);
        // 刪除節點
        const val = this.#maxHeap.pop();
        // 由上往下調整堆積
        this.#siftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    #siftDown(i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma === i) break;
            // 交換兩個節點
            this.#swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 從堆積取出元素 */
    pop(): number {
        // 檢查堆積是否為空
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        this.swap(0, this.size() - 1);
        // 刪除節點
        const val = this.maxHeap.pop();
        // 由上往下調整堆積
        this.siftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    siftDown(i: number): void {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma === i) break;
            // 交換兩個節點
            this.swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 從堆積取出元素 */
    int pop() {
      // 檢查堆積是否為空
      if (isEmpty()) throw Exception('堆積為空');
      // 交換根節點與最右側的葉節點（即首尾兩個元素）
      _swap(0, size() - 1);
      // 刪除節點
      int val = _maxHeap.removeLast();
      // 由上往下調整堆積
      siftDown(0);
      // 回傳堆積頂端元素
      return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    void siftDown(int i) {
      while (true) {
        // 找出節點 i、l、r 中值最大的節點，記為 ma
        int l = _left(i);
        int r = _right(i);
        int ma = i;
        if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
        if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
        // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
        if (ma == i) break;
        // 交換兩個節點
        _swap(i, ma);
        // 繼續向下調整堆積
        i = ma;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 從堆積取出元素 */
    fn pop(&mut self) -> i32 {
        // 檢查堆積是否為空
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        self.swap(0, self.size() - 1);
        // 刪除節點
        let val = self.max_heap.pop().unwrap();
        // 由上往下調整堆積
        self.sift_down(0);
        // 回傳堆積頂端元素
        val
    }

    /* 從節點 i 開始向下調整堆積 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if ma == i {
                break;
            }
            // 交換兩個節點
            self.swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 從堆積取出元素 */
    int pop(MaxHeap *maxHeap) {
        // 檢查堆積是否為空
        if (isEmpty(maxHeap)) {
            printf("heap is empty!");
            return INT_MAX;
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(maxHeap, 0, size(maxHeap) - 1);
        // 刪除節點
        int val = maxHeap->data[maxHeap->size - 1];
        maxHeap->size--;
        // 由上往下調整堆積
        siftDown(maxHeap, 0);

        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    void siftDown(MaxHeap *maxHeap, int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 max
            int l = left(maxHeap, i);
            int r = right(maxHeap, i);
            int max = i;
            if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
                max = l;
            }
            if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
                max = r;
            }
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (max == i) {
                break;
            }
            // 交換兩個節點
            swap(maxHeap, i, max);
            // 繼續向下調整堆積
            i = max;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 從堆積取出元素 */
    fun pop(): Int {
        // 檢查堆積是否為空
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(0, size() - 1)
        // 刪除節點
        val _val = maxHeap.removeAt(size() - 1)
        // 由上往下調整堆積
        siftDown(0)
        // 回傳堆積頂端元素
        return _val
    }

    /* 從節點 i 開始向下調整堆積 */
    fun siftDown(it: Int) {
        // Kotlin 的函式參數不能重新指派，因此建立暫存變數
        var i = it
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma == i) break
            // 交換兩個節點
            swap(i, ma)
            // 繼續向下調整堆積
            i = ma
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 從堆積取出元素 ###
    def pop
      # 檢查堆積是否為空
      raise IndexError, "堆積為空" if is_empty?
      # 交換根節點與最右側的葉節點（即首尾兩個元素）
      swap(0, size - 1)
      # 刪除節點
      val = @max_heap.pop
      # 由上往下調整堆積
      sift_down(0)
      # 回傳堆積頂端元素
      val
    end

    ### 從節點 i 開始向下調整堆積 ###
    def sift_down(i)
      loop do
        # 找出節點 i、l、r 中值最大的節點，記為 ma
        l, r, ma = left(i), right(i), i
        ma = l if l < size && @max_heap[l] > @max_heap[ma]
        ma = r if r < size && @max_heap[r] > @max_heap[ma]

        # 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
        break if ma == i

        # 交換兩個節點
        swap(i, ma)
        # 繼續向下調整堆積
        i = ma
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%22%22%22%0A%0A%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E4%BE%9D%E5%8E%9F%E9%A0%86%E5%BA%8F%E5%85%A8%E9%83%A8%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%90%91%E4%B8%8B%E5%8F%96%E6%95%B4%E7%9A%84%E6%95%B4%E6%95%B8%E9%99%A4%E6%B3%95%0A%0A%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%22%22%22%0A%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%BE%9E%E5%A0%86%E7%A9%8D%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E6%AA%A2%E6%9F%A5%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%A9%8D%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%E6%A0%B9%E7%AF%80%E9%BB%9E%E8%88%87%E6%9C%80%E5%8F%B3%E5%81%B4%E7%9A%84%E8%91%89%E7%AF%80%E9%BB%9E%EF%BC%88%E5%8D%B3%E9%A6%96%E5%B0%BE%E5%85%A9%E5%80%8B%E5%85%83%E7%B4%A0%EF%BC%89%0A%20%20%20%20self.swap%280,%20self.size%28%29%20-%201%29%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%20%20%23%20%E7%94%B1%E4%B8%8A%E5%BE%80%E4%B8%8B%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20self.sift_down%280%29%0A%20%20%20%20%23%20%E5%9B%9E%E5%82%B3%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%0A%20%20%20%20return%20val%0A%0A%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BE%9E%E7%AF%80%E9%BB%9E%20i%20%E9%96%8B%E5%A7%8B%E5%90%91%E4%B8%8B%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%22%22%22%0A%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%23%20%E6%89%BE%E5%87%BA%E7%AF%80%E9%BB%9E%20i%E3%80%81l%E3%80%81r%20%E4%B8%AD%E5%80%BC%E6%9C%80%E5%A4%A7%E7%9A%84%E7%AF%80%E9%BB%9E%EF%BC%8C%E8%A8%98%E7%82%BA%20ma%0A%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%23%20%E8%8B%A5%E7%AF%80%E9%BB%9E%20i%20%E7%9A%84%E5%80%BC%E6%9C%80%E5%A4%A7%EF%BC%8C%E6%88%96%E5%AD%90%E7%AF%80%E9%BB%9E%E7%B4%A2%E5%BC%95%20l%E3%80%81r%20%E5%9D%87%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%EF%BC%8C%E5%8D%B3%E5%8F%AF%E7%B5%90%E6%9D%9F%E8%AA%BF%E6%95%B4%EF%BC%8C%E8%B7%B3%E5%87%BA%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%E5%85%A9%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%23%20%E7%B9%BC%E7%BA%8C%E5%90%91%E4%B8%8B%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%23%20%E6%B3%A8%E6%84%8F%EF%BC%9A%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%E5%B7%B2%E7%B6%93%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%0A%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%207,%206,%207,%206,%202,%201,%204,%203,%206,%202,%205%5D%29%0A%0A%20%20%23%20%E5%8F%96%E5%87%BA%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%0A%20%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%22%22%22%0A%0A%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E4%BE%9D%E5%8E%9F%E9%A0%86%E5%BA%8F%E5%85%A8%E9%83%A8%E5%8A%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%90%91%E4%B8%8B%E5%8F%96%E6%95%B4%E7%9A%84%E6%95%B4%E6%95%B8%E9%99%A4%E6%B3%95%0A%0A%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E4%BA%A4%E6%8F%9B%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%22%22%22%0A%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%22%22%22%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%22%22%22%0A%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%BE%9E%E5%A0%86%E7%A9%8D%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%22%22%22%0A%20%20%20%20%23%20%E6%AA%A2%E6%9F%A5%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20raise%20IndexError%28%22%E5%A0%86%E7%A9%8D%E7%82%BA%E7%A9%BA%22%29%0A%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%E6%A0%B9%E7%AF%80%E9%BB%9E%E8%88%87%E6%9C%80%E5%8F%B3%E5%81%B4%E7%9A%84%E8%91%89%E7%AF%80%E9%BB%9E%EF%BC%88%E5%8D%B3%E9%A6%96%E5%B0%BE%E5%85%A9%E5%80%8B%E5%85%83%E7%B4%A0%EF%BC%89%0A%20%20%20%20self.swap%280,%20self.size%28%29%20-%201%29%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%20%20%23%20%E7%94%B1%E4%B8%8A%E5%BE%80%E4%B8%8B%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20self.sift_down%280%29%0A%20%20%20%20%23%20%E5%9B%9E%E5%82%B3%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%0A%20%20%20%20return%20val%0A%0A%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BE%9E%E7%AF%80%E9%BB%9E%20i%20%E9%96%8B%E5%A7%8B%E5%90%91%E4%B8%8B%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%22%22%22%0A%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%23%20%E6%89%BE%E5%87%BA%E7%AF%80%E9%BB%9E%20i%E3%80%81l%E3%80%81r%20%E4%B8%AD%E5%80%BC%E6%9C%80%E5%A4%A7%E7%9A%84%E7%AF%80%E9%BB%9E%EF%BC%8C%E8%A8%98%E7%82%BA%20ma%0A%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%23%20%E8%8B%A5%E7%AF%80%E9%BB%9E%20i%20%E7%9A%84%E5%80%BC%E6%9C%80%E5%A4%A7%EF%BC%8C%E6%88%96%E5%AD%90%E7%AF%80%E9%BB%9E%E7%B4%A2%E5%BC%95%20l%E3%80%81r%20%E5%9D%87%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%EF%BC%8C%E5%8D%B3%E5%8F%AF%E7%B5%90%E6%9D%9F%E8%AA%BF%E6%95%B4%EF%BC%8C%E8%B7%B3%E5%87%BA%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%23%20%E4%BA%A4%E6%8F%9B%E5%85%A9%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%23%20%E7%B9%BC%E7%BA%8C%E5%90%91%E4%B8%8B%E8%AA%BF%E6%95%B4%E5%A0%86%E7%A9%8D%0A%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%23%20%E6%B3%A8%E6%84%8F%EF%BC%9A%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%E5%B7%B2%E7%B6%93%E7%AC%A6%E5%90%88%E5%A0%86%E7%A9%8D%E6%80%A7%E8%B3%AA%0A%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%207,%206,%207,%206,%202,%201,%204,%203,%206,%202,%205%5D%29%0A%0A%20%20%23%20%E5%8F%96%E5%87%BA%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E5%85%83%E7%B4%A0%0A%20%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 8.1.3 &nbsp; 堆積的常見應用

- **優先佇列**：堆積通常是實作優先佇列的首選資料結構。加入和取出元素的時間複雜度皆為 $O(\log n)$，建立堆積則為 $O(n)$，這些操作都很有效率。
- **堆積排序**：給定一組資料，可以先用它們建立堆積，再反覆取出頂端元素，就能得到排序好的資料。不過，我們通常會用更簡潔的方式實作堆積排序，詳見「堆積排序」一章。
- **取得最大的 $k$ 個元素**：這是經典的演算法問題，也是堆積的典型應用。例如選取熱門程度前 10 名的新聞作為微博熱搜，或選出銷量前 10 名的商品。
