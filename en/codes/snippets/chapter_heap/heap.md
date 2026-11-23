<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# Initialize a min heap
min_heap, flag = [], 1
# Initialize a max heap
max_heap, flag = [], -1

# Python's heapq module implements a min heap by default
# Negate each element before pushing it onto the heap to reverse the ordering and implement a max heap
# In this example, flag = 1 represents a min heap and flag = -1 represents a max heap

# Push an element onto the heap
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# Get the top element of the heap
peek: int = flag * max_heap[0]  # 5

# Pop the top element from the heap
# The elements are popped in descending order
val = flag * heapq.heappop(max_heap)  # 5
val = flag * heapq.heappop(max_heap)  # 4
val = flag * heapq.heappop(max_heap)  # 3
val = flag * heapq.heappop(max_heap)  # 2
val = flag * heapq.heappop(max_heap)  # 1

# Get the heap size
size: int = len(max_heap)

# Check whether the heap is empty
is_empty: bool = not max_heap

# Build a heap from an input list
# The time complexity is O(n), not O(nlogn)
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* Initialize the heap */
// Initialize a min heap
priority_queue<int, vector<int>, greater<int>> minHeap;
// Initialize a max heap
priority_queue<int, vector<int>, less<int>> maxHeap;

/* Push an element onto the heap */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* Get the top element of the heap */
int peek = maxHeap.top(); // 5

/* Pop the top element from the heap */
// The elements are popped in descending order
maxHeap.pop(); // 5
maxHeap.pop(); // 4
maxHeap.pop(); // 3
maxHeap.pop(); // 2
maxHeap.pop(); // 1

/* Get the heap size */
int size = maxHeap.size();

/* Check whether the heap is empty */
bool isEmpty = maxHeap.empty();

/* Build a heap from an input list */
// The time complexity is O(n), not O(nlogn)
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* Initialize heaps */
// Initialize a min heap
Queue<Integer> minHeap = new PriorityQueue<>();
// Initialize a max heap by supplying a lambda expression as the Comparator
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* Push an element onto the heap */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* Get the top element of the heap */
int peek = maxHeap.peek(); // 5

/* Pop the top element from the heap */
// The elements are popped in descending order
peek = maxHeap.poll(); // 5
peek = maxHeap.poll(); // 4
peek = maxHeap.poll(); // 3
peek = maxHeap.poll(); // 2
peek = maxHeap.poll(); // 1

/* Get the heap size */
int size = maxHeap.size();

/* Check whether the heap is empty */
boolean isEmpty = maxHeap.isEmpty();

/* Build a heap from an input list */
// The time complexity is O(n), not O(nlogn)
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* Initialize heaps */
// Initialize a min heap
PriorityQueue<int, int> minHeap = new();
// Initialize a max heap (use a lambda expression to customize the Comparer)
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* Push an element onto the heap */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* Get the top element of the heap */
int peek = maxHeap.Peek(); // 5

/* Pop the top element from the heap */
// The elements are popped in descending order
peek = maxHeap.Dequeue(); // 5
peek = maxHeap.Dequeue(); // 4
peek = maxHeap.Dequeue(); // 3
peek = maxHeap.Dequeue(); // 2
peek = maxHeap.Dequeue(); // 1

/* Get the heap size */
int size = maxHeap.Count;

/* Check whether the heap is empty */
bool isEmpty = maxHeap.Count == 0;

/* Build a heap from an input list */
// The time complexity is O(n), not O(nlogn)
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// In Go, implement heap.Interface to build an integer max heap
// Implementing heap.Interface also requires implementing sort.Interface
type intHeap []any

// Push is a heap.Interface function that pushes an element onto the heap
func (h *intHeap) Push(x any) {
    // Push and Pop use pointer receivers
    // because they modify the slice length as well as its contents.
    *h = append(*h, x.(int))
}

// Pop is a heap.Interface function that pops the top element from the heap
func (h *intHeap) Pop() any {
    // The element to remove is stored at the end
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Len implements the sort.Interface length method
func (h *intHeap) Len() int {
    return len(*h)
}

// Less implements the sort.Interface comparison method
func (h *intHeap) Less(i, j int) bool {
    // For a min heap, change the comparison to less than
    return (*h)[i].(int) > (*h)[j].(int)
}

// Swap implements the sort.Interface swap method
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top returns the top element of the heap
func (h *intHeap) Top() any {
    return (*h)[0]
}

func TestHeap(t *testing.T) {
    /* Initialize the heap */
    // Initialize a max heap
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* Push an element onto the heap */
    // Call a heap.Interface function to add an element
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 5)
    heap.Push(maxHeap, 4)
    PrintHeap(*maxHeap)

    /* Get the top element of the heap */
    top := maxHeap.Top()
    fmt.Printf("Top element of the heap: %d\n", top)

    /* Pop the top element from the heap */
    // Call a heap.Interface function to remove an element
    fmt.Printf("Element popped from the heap: %d\n", heap.Pop(maxHeap)) // 5
    fmt.Printf("Element popped from the heap: %d\n", heap.Pop(maxHeap)) // 4
    fmt.Printf("Element popped from the heap: %d\n", heap.Pop(maxHeap)) // 3
    fmt.Printf("Element popped from the heap: %d\n", heap.Pop(maxHeap)) // 2
    fmt.Printf("Element popped from the heap: %d\n", heap.Pop(maxHeap)) // 1

    /* Get the heap size */
    size := len(*maxHeap)
    fmt.Printf("Number of elements in the heap: %d\n", size)

    /* Check whether the heap is empty */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("Is the heap empty? %t\n", isEmpty)
}
```

```swift title="heap.swift"
import HeapModule

/* Initialize the heap */
// Swift's Heap type supports both max heap and min heap operations and requires the swift-collections package
var heap = Heap<Int>()

/* Push an element onto the heap */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* Get the maximum element of the heap */
var peek = heap.max()

/* Remove the maximum element from the heap */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* Get the heap size */
let size = heap.count

/* Check whether the heap is empty */
let isEmpty = heap.isEmpty

/* Build a heap from an input list */
// The time complexity is O(n), not O(nlogn)
let heap2 = Heap([1, 3, 2, 5, 4])
```

```javascript title="heap.js"
// JavaScript provides no built-in Heap class
```

```typescript title="heap.ts"
// TypeScript provides no built-in Heap class
```

```dart title="heap.dart"
// Dart provides no built-in Heap class
```

```rust title="heap.rs"
use std::{cmp::Reverse, collections::BinaryHeap};

/* Initialize the heap */
// Initialize a min heap
// Rust's BinaryHeap is a max heap; wrap elements in Reverse to create a min heap
#[allow(unused_assignments)]
let mut min_heap = BinaryHeap::new();
// Initialize a max heap
let mut max_heap = BinaryHeap::new();

/* Push an element onto the heap */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* Get the top element of the heap */
let peek = max_heap.peek().unwrap(); // 5

/* Pop the top element from the heap */
// The elements are popped in descending order
let peek = max_heap.pop().unwrap(); // 5
let peek = max_heap.pop().unwrap(); // 4
let peek = max_heap.pop().unwrap(); // 3
let peek = max_heap.pop().unwrap(); // 2
let peek = max_heap.pop().unwrap(); // 1

/* Get the heap size */
let size = max_heap.len();

/* Check whether the heap is empty */
let is_empty = max_heap.is_empty();

/* Build a heap from an input list */
// The time complexity is O(n), not O(nlogn)
min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// C provides no built-in Heap class
```

```kotlin title="heap.kt"
/* Initialize heaps */
// Initialize a min heap
var minHeap = PriorityQueue<Int>()
// Initialize a max heap by supplying a lambda expression as the Comparator
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* Push an element onto the heap */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* Get the top element of the heap */
var peek = maxHeap.peek() // 5

/* Pop the top element from the heap */
// The elements are popped in descending order
peek = maxHeap.poll() // 5
peek = maxHeap.poll() // 4
peek = maxHeap.poll() // 3
peek = maxHeap.poll() // 2
peek = maxHeap.poll() // 1

/* Get the heap size */
val size = maxHeap.size

/* Check whether the heap is empty */
val isEmpty = maxHeap.isEmpty()

/* Build a heap from an input list */
// The time complexity is O(n), not O(nlogn)
minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# Ruby provides no built-in Heap class
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20min%20heap%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20Initialize%20a%20max%20heap%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%27s%20heapq%20module%20implements%20a%20min%20heap%20by%20default%0A%20%20%20%20%23%20Negate%20elements%20before%20insertion%20to%20reverse%20their%20order%20and%20implement%20a%20max%20heap%0A%20%20%20%20%23%20Here%2C%20flag%20%3D%201%20gives%20a%20min%20heap%20and%20flag%20%3D%20-1%20gives%20a%20max%20heap%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20elements%20into%20the%20heap%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20Access%20the%20root%20element%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20root%20elements%0A%20%20%20%20%23%20Removed%20elements%20form%20a%20descending%20sequence%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20Get%20the%20heap%20size%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20Check%20whether%20the%20heap%20is%20empty%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20Build%20a%20heap%20from%20a%20list%0A%20%20%20%20%23%20The%20time%20complexity%20is%20O%28n%29%2C%20not%20O%28nlogn%29%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
