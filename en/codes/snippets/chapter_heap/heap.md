<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# Initialize a min heap
min_heap, flag = [], 1
# Initialize a max heap
max_heap, flag = [], -1

# Python's heapq module implements a min heap by default
# Negate elements before insertion to reverse their order and implement a max heap
# Here, flag = 1 gives a min heap and flag = -1 gives a max heap

# Insert elements into the heap
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# Access the root element
peek: int = flag * max_heap[0] # 5

# Remove root elements
# Removed elements form a descending sequence
val = flag * heapq.heappop(max_heap) # 5
val = flag * heapq.heappop(max_heap) # 4
val = flag * heapq.heappop(max_heap) # 3
val = flag * heapq.heappop(max_heap) # 2
val = flag * heapq.heappop(max_heap) # 1

# Get the heap size
size: int = len(max_heap)

# Check whether the heap is empty
is_empty: bool = not max_heap

# Build a heap from a list
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* Initialize a heap */
// Initialize a min heap
priority_queue<int, vector<int>, greater<int>> minHeap;
// Initialize a max heap
priority_queue<int, vector<int>, less<int>> maxHeap;

/* Insert elements into the heap */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* Access the root element */
int peek = maxHeap.top(); // 5

/* Remove root elements */
// Removed elements form a descending sequence
maxHeap.pop(); // 5
maxHeap.pop(); // 4
maxHeap.pop(); // 3
maxHeap.pop(); // 2
maxHeap.pop(); // 1

/* Get the heap size */
int size = maxHeap.size();

/* Check whether the heap is empty */
bool isEmpty = maxHeap.empty();

/* Build a heap from a list */
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* Initialize a heap */
// Initialize a min heap
Queue<Integer> minHeap = new PriorityQueue<>();
// Initialize a max heap by changing the Comparator with a lambda expression
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* Insert elements into the heap */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* Access the root element */
int peek = maxHeap.peek(); // 5

/* Remove root elements */
// Removed elements form a descending sequence
peek = maxHeap.poll(); // 5
peek = maxHeap.poll(); // 4
peek = maxHeap.poll(); // 3
peek = maxHeap.poll(); // 2
peek = maxHeap.poll(); // 1

/* Get the heap size */
int size = maxHeap.size();

/* Check whether the heap is empty */
boolean isEmpty = maxHeap.isEmpty();

/* Build a heap from a list */
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* Initialize a heap */
// Initialize a min heap
PriorityQueue<int, int> minHeap = new();
// Initialize a max heap by changing the Comparer with a lambda expression
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* Insert elements into the heap */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* Access the root element */
int peek = maxHeap.Peek();//5

/* Remove root elements */
// Removed elements form a descending sequence
peek = maxHeap.Dequeue();  // 5
peek = maxHeap.Dequeue();  // 4
peek = maxHeap.Dequeue();  // 3
peek = maxHeap.Dequeue();  // 2
peek = maxHeap.Dequeue();  // 1

/* Get the heap size */
int size = maxHeap.Count;

/* Check whether the heap is empty */
bool isEmpty = maxHeap.Count == 0;

/* Build a heap from a list */
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// In Go, implement heap.Interface to build an integer max heap
// Implementing heap.Interface also requires implementing sort.Interface
type intHeap []any

// Push implements the heap.Interface method for inserting an element
func (h *intHeap) Push(x any) {
    // Push and Pop use pointer receivers
    // because they change the slice length as well as its contents.
    *h = append(*h, x.(int))
}

// Pop implements the heap.Interface method used to remove the root element
func (h *intHeap) Pop() any {
    // The element to remove has been placed at the end
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Len implements a sort.Interface method
func (h *intHeap) Len() int {
    return len(*h)
}

// Less implements a sort.Interface method
func (h *intHeap) Less(i, j int) bool {
    // For a min heap, change this to a less-than comparison
    return (*h)[i].(int) > (*h)[j].(int)
}

// Swap implements a sort.Interface method
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top returns the root element
func (h *intHeap) Top() any {
    return (*h)[0]
}

/* Driver Code */
func TestHeap(t *testing.T) {
    /* Initialize a heap */
    // Initialize a max heap
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* Insert elements into the heap */
    // Call the heap.Interface methods to add elements
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 4)
    heap.Push(maxHeap, 5)

    /* Access the root element */
    top := maxHeap.Top()
    fmt.Printf("The root element is %d\n", top)

    /* Remove root elements */
    // Call the heap.Interface methods to remove elements
    heap.Pop(maxHeap) // 5
    heap.Pop(maxHeap) // 4
    heap.Pop(maxHeap) // 3
    heap.Pop(maxHeap) // 2
    heap.Pop(maxHeap) // 1

    /* Get the heap size */
    size := len(*maxHeap)
    fmt.Printf("The heap contains %d elements\n", size)

    /* Check whether the heap is empty */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("Is the heap empty: %t\n", isEmpty)
}
```

```swift title="heap.swift"
/* Initialize a heap */
// Swift's Heap type supports both minimum and maximum operations and requires swift-collections
var heap = Heap<Int>()

/* Insert elements into the heap */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* Access the root element */
var peek = heap.max()!

/* Remove root elements */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* Get the heap size */
let size = heap.count

/* Check whether the heap is empty */
let isEmpty = heap.isEmpty

/* Build a heap from a list */
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
use std::collections::BinaryHeap;
use std::cmp::Reverse;

/* Initialize a heap */
// Initialize a min heap
let mut min_heap = BinaryHeap::<Reverse<i32>>::new();
// Initialize a max heap
let mut max_heap = BinaryHeap::new();

/* Insert elements into the heap */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* Access the root element */
let peek = max_heap.peek().unwrap();  // 5

/* Remove root elements */
// Removed elements form a descending sequence
let peek = max_heap.pop().unwrap();   // 5
let peek = max_heap.pop().unwrap();   // 4
let peek = max_heap.pop().unwrap();   // 3
let peek = max_heap.pop().unwrap();   // 2
let peek = max_heap.pop().unwrap();   // 1

/* Get the heap size */
let size = max_heap.len();

/* Check whether the heap is empty */
let is_empty = max_heap.is_empty();

/* Build a heap from a list */
let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// C provides no built-in Heap class
```

```kotlin title="heap.kt"
/* Initialize a heap */
// Initialize a min heap
var minHeap = PriorityQueue<Int>()
// Initialize a max heap by changing the Comparator with a lambda expression
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* Insert elements into the heap */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* Access the root element */
var peek = maxHeap.peek() // 5

/* Remove root elements */
// Removed elements form a descending sequence
peek = maxHeap.poll() // 5
peek = maxHeap.poll() // 4
peek = maxHeap.poll() // 3
peek = maxHeap.poll() // 2
peek = maxHeap.poll() // 1

/* Get the heap size */
val size = maxHeap.size

/* Check whether the heap is empty */
val isEmpty = maxHeap.isEmpty()

/* Build a heap from a list */
minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# Ruby provides no built-in Heap class
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20min%20heap%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20Initialize%20a%20max%20heap%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%27s%20heapq%20module%20implements%20a%20min%20heap%20by%20default%0A%20%20%20%20%23%20Negate%20elements%20before%20insertion%20to%20reverse%20their%20order%20and%20implement%20a%20max%20heap%0A%20%20%20%20%23%20Here%2C%20flag%20%3D%201%20gives%20a%20min%20heap%20and%20flag%20%3D%20-1%20gives%20a%20max%20heap%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20elements%20into%20the%20heap%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20Access%20the%20root%20element%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20root%20elements%0A%20%20%20%20%23%20Removed%20elements%20form%20a%20descending%20sequence%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20Get%20the%20heap%20size%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20Check%20whether%20the%20heap%20is%20empty%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20Build%20a%20heap%20from%20a%20list%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
