<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# Initialize a queue
# In Python, we usually use the deque class as a queue
# Although queue.Queue() is a dedicated queue class, it is less convenient and is not recommended here
que: deque[int] = deque()

# Enqueue elements
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# Access the front element
front: int = que[0]

# Dequeue an element
pop: int = que.popleft()

# Get the queue size
size: int = len(que)

# Check whether the queue is empty
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* Initialize a queue */
queue<int> queue;

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Access the front element */
int front = queue.front();

/* Dequeue an element */
queue.pop();

/* Get the queue size */
int size = queue.size();

/* Check whether the queue is empty */
bool empty = queue.empty();
```

```java title="queue.java"
/* Initialize a queue */
Queue<Integer> queue = new LinkedList<>();

/* Enqueue elements */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* Access the front element */
int peek = queue.peek();

/* Dequeue an element */
int pop = queue.poll();

/* Get the queue size */
int size = queue.size();

/* Check whether the queue is empty */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* Initialize a queue */
Queue<int> queue = new();

/* Enqueue elements */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* Access the front element */
int peek = queue.Peek();

/* Dequeue an element */
int pop = queue.Dequeue();

/* Get the queue size */
int size = queue.Count;

/* Check whether the queue is empty */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* Initialize a queue */
// In Go, use a list as a queue
queue := list.New()

/* Enqueue elements */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* Access the front element */
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
/* Initialize a queue */
// Swift has no built-in queue class; use an Array as a queue
var queue: [Int] = []

/* Enqueue elements */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* Access the front element */
let peek = queue.first!

/* Dequeue an element */
// Because this is an array, removeFirst takes O(n) time
let pop = queue.removeFirst()

/* Get the queue size */
let size = queue.count

/* Check whether the queue is empty */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* Initialize a queue */
// JavaScript has no built-in queue; use an Array as a queue
const queue = [];

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Access the front element */
const peek = queue[0];

/* Dequeue an element */
// The underlying structure is an array, so shift() takes O(n) time
const pop = queue.shift();

/* Get the queue size */
const size = queue.length;

/* Check whether the queue is empty */
const empty = queue.length === 0;
```

```typescript title="queue.ts"
/* Initialize a queue */
// TypeScript has no built-in queue; use an Array as a queue
const queue: number[] = [];

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Access the front element */
const peek = queue[0];

/* Dequeue an element */
// The underlying structure is an array, so shift() takes O(n) time
const pop = queue.shift();

/* Get the queue size */
const size = queue.length;

/* Check whether the queue is empty */
const empty = queue.length === 0;
```

```dart title="queue.dart"
/* Initialize a queue */
// In Dart, Queue is a deque and can also be used as a queue
Queue<int> queue = Queue();

/* Enqueue elements */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* Access the front element */
int peek = queue.first;

/* Dequeue an element */
int pop = queue.removeFirst();

/* Get the queue size */
int size = queue.length;

/* Check whether the queue is empty */
bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
/* Initialize a deque */
// In Rust, use a deque as an ordinary queue
let mut deque: VecDeque<u32> = VecDeque::new();

/* Enqueue elements */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* Access the front element */
if let Some(front) = deque.front() {
}

/* Dequeue an element */
if let Some(pop) = deque.pop_front() {
}

/* Get the queue size */
let size = deque.len();

/* Check whether the queue is empty */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C provides no built-in queue
```

```kotlin title="queue.kt"
/* Initialize a queue */
val queue = LinkedList<Int>()

/* Enqueue elements */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* Access the front element */
val peek = queue.peek()

/* Dequeue an element */
val pop = queue.poll()

/* Get the queue size */
val size = queue.size

/* Check whether the queue is empty */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# Initialize a queue
# Ruby's built-in Thread::Queue has no peek or traversal methods; use an Array as a queue
queue = []

# Enqueue elements
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# Access the front element of the queue
peek = queue.first

# Dequeue an element
# Note that this is an array, so Array#shift takes O(n) time
pop = queue.shift

# Get the queue size
size = queue.length

# Check whether the queue is empty
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20queue%0A%20%20%20%20%23%20In%20Python%2C%20we%20usually%20use%20the%20deque%20class%20as%20a%20queue%0A%20%20%20%20%23%20Although%20queue.Queue%28%29%20is%20a%20dedicated%20queue%20class%2C%20it%20is%20less%20convenient%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22Queue%3A%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20Access%20the%20front%20element%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22Front%20element%3A%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22Dequeued%20element%3A%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22After%20dequeuing%3A%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22Queue%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20queue%20empty%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
