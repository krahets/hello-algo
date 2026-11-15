<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# 初始化小頂堆積
min_heap, flag = [], 1
# 初始化大頂堆積
max_heap, flag = [], -1

# Python 的 heapq 模組預設實現小頂堆積
# 考慮將“元素取負”後再入堆積，這樣就可以將大小關係顛倒，從而實現大頂堆積
# 在本示例中，flag = 1 時對應小頂堆積，flag = -1 時對應大頂堆積

# 元素入堆積
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# 獲取堆積頂元素
peek: int = flag * max_heap[0] # 5

# 堆積頂元素出堆積
# 出堆積元素會形成一個從大到小的序列
val = flag * heapq.heappop(max_heap) # 5
val = flag * heapq.heappop(max_heap) # 4
val = flag * heapq.heappop(max_heap) # 3
val = flag * heapq.heappop(max_heap) # 2
val = flag * heapq.heappop(max_heap) # 1

# 獲取堆積大小
size: int = len(max_heap)

# 判斷堆積是否為空
is_empty: bool = not max_heap

# 輸入串列並建堆積
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* 初始化堆積 */
// 初始化小頂堆積
priority_queue<int, vector<int>, greater<int>> minHeap;
// 初始化大頂堆積
priority_queue<int, vector<int>, less<int>> maxHeap;

/* 元素入堆積 */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* 獲取堆積頂元素 */
int peek = maxHeap.top(); // 5

/* 堆積頂元素出堆積 */
// 出堆積元素會形成一個從大到小的序列
maxHeap.pop(); // 5
maxHeap.pop(); // 4
maxHeap.pop(); // 3
maxHeap.pop(); // 2
maxHeap.pop(); // 1

/* 獲取堆積大小 */
int size = maxHeap.size();

/* 判斷堆積是否為空 */
bool isEmpty = maxHeap.empty();

/* 輸入串列並建堆積 */
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* 初始化堆積 */
// 初始化小頂堆積
Queue<Integer> minHeap = new PriorityQueue<>();
// 初始化大頂堆積（使用 lambda 表示式修改 Comparator 即可）
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* 元素入堆積 */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* 獲取堆積頂元素 */
int peek = maxHeap.peek(); // 5

/* 堆積頂元素出堆積 */
// 出堆積元素會形成一個從大到小的序列
peek = maxHeap.poll(); // 5
peek = maxHeap.poll(); // 4
peek = maxHeap.poll(); // 3
peek = maxHeap.poll(); // 2
peek = maxHeap.poll(); // 1

/* 獲取堆積大小 */
int size = maxHeap.size();

/* 判斷堆積是否為空 */
boolean isEmpty = maxHeap.isEmpty();

/* 輸入串列並建堆積 */
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* 初始化堆積 */
// 初始化小頂堆積
PriorityQueue<int, int> minHeap = new();
// 初始化大頂堆積（使用 lambda 表示式修改 Comparer 即可）
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* 元素入堆積 */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* 獲取堆積頂元素 */
int peek = maxHeap.Peek();//5

/* 堆積頂元素出堆積 */
// 出堆積元素會形成一個從大到小的序列
peek = maxHeap.Dequeue();  // 5
peek = maxHeap.Dequeue();  // 4
peek = maxHeap.Dequeue();  // 3
peek = maxHeap.Dequeue();  // 2
peek = maxHeap.Dequeue();  // 1

/* 獲取堆積大小 */
int size = maxHeap.Count;

/* 判斷堆積是否為空 */
bool isEmpty = maxHeap.Count == 0;

/* 輸入串列並建堆積 */
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// Go 語言中可以透過實現 heap.Interface 來構建整數大頂堆積
// 實現 heap.Interface 需要同時實現 sort.Interface
type intHeap []any

// Push heap.Interface 的方法，實現推入元素到堆積
func (h *intHeap) Push(x any) {
    // Push 和 Pop 使用 pointer receiver 作為參數
    // 因為它們不僅會對切片的內容進行調整，還會修改切片的長度。
    *h = append(*h, x.(int))
}

// Pop heap.Interface 的方法，實現彈出堆積頂元素
func (h *intHeap) Pop() any {
    // 待出堆積元素存放在最後
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Len sort.Interface 的方法
func (h *intHeap) Len() int {
    return len(*h)
}

// Less sort.Interface 的方法
func (h *intHeap) Less(i, j int) bool {
    // 如果實現小頂堆積，則需要調整為小於號
    return (*h)[i].(int) > (*h)[j].(int)
}

// Swap sort.Interface 的方法
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top 獲取堆積頂元素
func (h *intHeap) Top() any {
    return (*h)[0]
}

/* Driver Code */
func TestHeap(t *testing.T) {
    /* 初始化堆積 */
    // 初始化大頂堆積
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* 元素入堆積 */
    // 呼叫 heap.Interface 的方法，來新增元素
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 4)
    heap.Push(maxHeap, 5)

    /* 獲取堆積頂元素 */
    top := maxHeap.Top()
    fmt.Printf("堆積頂元素為 %d\n", top)

    /* 堆積頂元素出堆積 */
    // 呼叫 heap.Interface 的方法，來移除元素
    heap.Pop(maxHeap) // 5
    heap.Pop(maxHeap) // 4
    heap.Pop(maxHeap) // 3
    heap.Pop(maxHeap) // 2
    heap.Pop(maxHeap) // 1

    /* 獲取堆積大小 */
    size := len(*maxHeap)
    fmt.Printf("堆積元素數量為 %d\n", size)

    /* 判斷堆積是否為空 */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("堆積是否為空 %t\n", isEmpty)
}
```

```swift title="heap.swift"
/* 初始化堆積 */
// Swift 的 Heap 型別同時支持最大堆積和最小堆積，且需要引入 swift-collections
var heap = Heap<Int>()

/* 元素入堆積 */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* 獲取堆積頂元素 */
var peek = heap.max()!

/* 堆積頂元素出堆積 */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* 獲取堆積大小 */
let size = heap.count

/* 判斷堆積是否為空 */
let isEmpty = heap.isEmpty

/* 輸入串列並建堆積 */
let heap2 = Heap([1, 3, 2, 5, 4])
```

```javascript title="heap.js"
// JavaScript 未提供內建 Heap 類別
```

```typescript title="heap.ts"
// TypeScript 未提供內建 Heap 類別
```

```dart title="heap.dart"
// Dart 未提供內建 Heap 類別
```

```rust title="heap.rs"
use std::collections::BinaryHeap;
use std::cmp::Reverse;

/* 初始化堆積 */
// 初始化小頂堆積
let mut min_heap = BinaryHeap::<Reverse<i32>>::new();
// 初始化大頂堆積
let mut max_heap = BinaryHeap::new();

/* 元素入堆積 */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* 獲取堆積頂元素 */
let peek = max_heap.peek().unwrap();  // 5

/* 堆積頂元素出堆積 */
// 出堆積元素會形成一個從大到小的序列
let peek = max_heap.pop().unwrap();   // 5
let peek = max_heap.pop().unwrap();   // 4
let peek = max_heap.pop().unwrap();   // 3
let peek = max_heap.pop().unwrap();   // 2
let peek = max_heap.pop().unwrap();   // 1

/* 獲取堆積大小 */
let size = max_heap.len();

/* 判斷堆積是否為空 */
let is_empty = max_heap.is_empty();

/* 輸入串列並建堆積 */
let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// C 未提供內建 Heap 類別
```

```kotlin title="heap.kt"
/* 初始化堆積 */
// 初始化小頂堆積
var minHeap = PriorityQueue<Int>()
// 初始化大頂堆積（使用 lambda 表示式修改 Comparator 即可）
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* 元素入堆積 */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* 獲取堆積頂元素 */
var peek = maxHeap.peek() // 5

/* 堆積頂元素出堆積 */
// 出堆積元素會形成一個從大到小的序列
peek = maxHeap.poll() // 5
peek = maxHeap.poll() // 4
peek = maxHeap.poll() // 3
peek = maxHeap.poll() // 2
peek = maxHeap.poll() // 1

/* 獲取堆積大小 */
val size = maxHeap.size

/* 判斷堆積是否為空 */
val isEmpty = maxHeap.isEmpty()

/* 輸入串列並建堆積 */
minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# Ruby 未提供內建 Heap 類別
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B0%8F%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A4%A7%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E7%B5%84%E9%A0%90%E8%A8%AD%E5%AF%A6%E7%8F%BE%E5%B0%8F%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E8%80%83%E6%85%AE%E5%B0%87%E2%80%9C%E5%85%83%E7%B4%A0%E5%8F%96%E8%B2%A0%E2%80%9D%E5%BE%8C%E5%86%8D%E5%85%A5%E5%A0%86%E7%A9%8D%EF%BC%8C%E9%80%99%E6%A8%A3%E5%B0%B1%E5%8F%AF%E4%BB%A5%E5%B0%87%E5%A4%A7%E5%B0%8F%E9%97%9C%E4%BF%82%E9%A1%9B%E5%80%92%EF%BC%8C%E5%BE%9E%E8%80%8C%E5%AF%A6%E7%8F%BE%E5%A4%A7%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%9C%A8%E6%9C%AC%E7%A4%BA%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E6%99%82%E5%B0%8D%E6%87%89%E5%B0%8F%E9%A0%82%E5%A0%86%E7%A9%8D%EF%BC%8Cflag%20%3D%20-1%20%E6%99%82%E5%B0%8D%E6%87%89%E5%A4%A7%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%A0%86%E7%A9%8D%E9%A0%82%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%87%BA%E5%A0%86%E7%A9%8D%E5%85%83%E7%B4%A0%E6%9C%83%E5%BD%A2%E6%88%90%E4%B8%80%E5%80%8B%E5%BE%9E%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E5%BA%8F%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BC%B8%E5%85%A5%E4%B8%B2%E5%88%97%E4%B8%A6%E5%BB%BA%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
