<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# Initialize the queue
# In Python, the double-ended queue class deque is commonly used as a FIFO queue
# queue.Queue() creates a dedicated queue, but it is less convenient here, so we do not recommend it
que: deque[int] = deque()

# Enqueue elements
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# Peek at the front element
front: int = que[0]

# Dequeue an element
pop: int = que.popleft()

# Get the queue size
size: int = len(que)

# Check whether the queue is empty
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* Initialize the queue */
queue<int> queue;

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Peek at the front element */
int front = queue.front();

/* Dequeue an element */
queue.pop();

/* Get the queue size */
int size = queue.size();

/* Check whether the queue is empty */
bool empty = queue.empty();
```

```java title="queue.java"
/* Initialize the queue */
Queue<Integer> queue = new LinkedList<>();

/* Enqueue elements */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* Peek at the front element */
int peek = queue.peek();

/* Dequeue an element */
int pop = queue.poll();

/* Get the queue size */
int size = queue.size();

/* Check whether the queue is empty */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* Initialize the queue */
Queue<int> queue = new();

/* Enqueue elements */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* Peek at the front element */
int peek = queue.Peek();

/* Dequeue an element */
int pop = queue.Dequeue();

/* Get the queue size */
int size = queue.Count;

/* Check whether the queue is empty */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* Initialize the queue */
// Use Go's list.List as a queue
queue := list.New()

/* Enqueue elements */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* Peek at the front element */
peek := queue.Front()

/* Dequeue an element */
pop := queue.Front()
queue.Remove(pop)

/* Get the queue size */
size := queue.Len()

/* Check whether the queue is empty */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* Initialize the queue */
// Swift has no built-in queue class, so use an Array as a queue
var queue: [Int] = []

/* Enqueue elements */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* Peek at the front element */
let peek = queue.first!

/* Dequeue an element */
// With an Array, removeFirst takes O(n) time
let pop = queue.removeFirst()

/* Get the queue size */
let size = queue.count

/* Check whether the queue is empty */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* Initialize the queue */
// JavaScript has no built-in queue, so use an Array as a queue
const queue = [];

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Peek at the front element */
const peek = queue[0];

/* Dequeue an element */
// shift() takes O(n) time because the queue uses an array
const pop = queue.shift();

/* Get the queue size */
const size = queue.length;

/* Check whether the queue is empty */
const isEmpty = queue.length === 0;
```

```typescript title="queue.ts"
/* Initialize the queue */
// TypeScript has no built-in queue, so use an Array as a queue
const queue: number[] = [];

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Peek at the front element */
const peek = queue[0];

/* Dequeue an element */
// shift() takes O(n) time because the queue uses an array
const pop = queue.shift();

/* Get the queue size */
const size = queue.length;

/* Check whether the queue is empty */
const isEmpty = queue.length === 0;
```

```dart title="queue.dart"
/* Initialize the queue */
// In Dart, the double-ended Queue is commonly used as a queue
final Queue<int> queue = Queue();

/* Enqueue elements */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* Peek at the front element */
final int peek = queue.first;

/* Dequeue an element */
final int pop = queue.removeFirst();

/* Get the queue size */
final int size = queue.length;

/* Check whether the queue is empty */
final bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
// Initialize the queue
// In Rust, the double-ended VecDeque is commonly used as a queue
let mut queue: VecDeque<i32> = VecDeque::new();

// Enqueue elements
queue.push_back(1);
queue.push_back(3);
queue.push_back(2);
queue.push_back(5);
queue.push_back(4);

// Peek at the front element
let peek = queue.front().unwrap();

// Dequeue an element
let pop = queue.pop_front().unwrap();

// Get the queue size
let size = queue.len();

// Check whether the queue is empty
let is_empty = queue.is_empty();
```

```c title="queue.c"
// C has no built-in queue
```

```kotlin title="queue.kt"
/* Initialize the queue */
val queue = LinkedList<Int>()

/* Enqueue elements */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* Peek at the front element */
val peek = queue.peek()

/* Dequeue an element */
val pop = queue.poll()

/* Get the queue size */
val size = queue.size

/* Check whether the queue is empty */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# Initialize the queue
# Ruby's built-in Thread::Queue has no methods for peeking or iterating, so use an Array as a queue
queue = []

# Enqueue elements
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# Peek at the front element
peek = queue.first

# Dequeue an element
# Array#shift takes O(n) time because the queue uses an array
pop = queue.shift

# Get the queue size
size = queue.length

# Check whether the queue is empty
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20%23%20In%20Python,%20we%20commonly%20use%20the%20double-ended%20queue%20class%20deque%20as%20a%20queue%0A%20%20%20%20%23%20queue.Queue%28%29%20creates%20a%20dedicated%20queue,%20but%20it%20is%20less%20convenient%20to%20use%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22Queue%20%28que%29%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20Read%20the%20front%20element%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22Front%20element%20%28front%29%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22que%20after%20dequeue%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20length%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22Queue%20length%20%28size%29%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
