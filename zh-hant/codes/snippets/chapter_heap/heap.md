<!-- [snippet]{heap_operations} -->
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

```javascript title="heap.js"
// JavaScript 沒有內建 Heap 類別
```

```typescript title="heap.ts"
// TypeScript 沒有內建 Heap 類別
```

```dart title="heap.dart"
// Dart 沒有內建 Heap 類別
```

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

```c title="heap.c"
// C 沒有內建 Heap 類別
```

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

```ruby title="heap.rb"
# Ruby 沒有內建 Heap 類別
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap,%20flag%20%3D%20%5B%5D,%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20max_heap,%20flag%20%3D%20%5B%5D,%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E7%B5%84%E9%A0%90%E8%A8%AD%E4%BD%BF%E7%94%A8%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%85%88%E5%B0%87%E5%85%83%E7%B4%A0%E4%B9%98%E4%BB%A5%20-1%20%E5%86%8D%E6%94%BE%E5%85%A5%E5%A0%86%E7%A9%8D%EF%BC%8C%E5%8D%B3%E5%8F%AF%E5%8F%8D%E8%BD%89%E5%A4%A7%E5%B0%8F%E9%97%9C%E4%BF%82%EF%BC%8C%E5%AF%A6%E4%BD%9C%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%9C%AC%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E4%BB%A3%E8%A1%A8%E6%9C%80%E5%B0%8F%E5%A0%86%E7%A9%8D%EF%BC%8Cflag%20%3D%20-1%20%E4%BB%A3%E8%A1%A8%E6%9C%80%E5%A4%A7%E5%A0%86%E7%A9%8D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%94%BE%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%8F%96%E5%87%BA%E5%A0%86%E7%A9%8D%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20%23%20%E4%BE%9D%E5%BA%8F%E5%8F%96%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%E6%9C%83%E5%BD%A2%E6%88%90%E7%94%B1%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E6%95%B8%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%A9%8D%E7%9A%84%E5%85%83%E7%B4%A0%E5%80%8B%E6%95%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E8%BC%B8%E5%85%A5%E7%9A%84%E4%B8%B2%E5%88%97%E5%BB%BA%E6%88%90%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E6%99%82%E9%96%93%E8%A4%87%E9%9B%9C%E5%BA%A6%E6%98%AF%20O%28n%29%EF%BC%8C%E8%80%8C%E9%9D%9E%20O%28nlogn%29%0A%20%20%20%20min_heap%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
