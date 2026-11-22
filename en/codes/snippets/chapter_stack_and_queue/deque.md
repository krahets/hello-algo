<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# Initialize the deque
deq: deque[int] = deque()

# Enqueue elements
deq.append(2)  # Add to the rear
deq.append(5)
deq.append(4)
deq.appendleft(3)  # Add to the front
deq.appendleft(1)

# Access an element
front: int = deq[0]  # Front element
rear: int = deq[-1]  # Rear element

# Dequeue an element
pop_front: int = deq.popleft()  # Dequeue the front element
pop_rear: int = deq.pop()  # Dequeue the rear element

# Get the deque size
size: int = len(deq)

# Check whether the deque is empty
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* Initialize the deque */
deque<int> deque;

/* Enqueue elements */
deque.push_back(2); // Add to the rear
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // Add to the front
deque.push_front(1);

/* Access an element */
int front = deque.front(); // Front element
int back = deque.back(); // Rear element

/* Dequeue an element */
deque.pop_front(); // Dequeue the front element
deque.pop_back(); // Dequeue the rear element

/* Get the deque size */
int size = deque.size();

/* Check whether the deque is empty */
bool empty = deque.empty();
```

```java title="deque.java"
/* Initialize the deque */
Deque<Integer> deque = new LinkedList<>();

/* Enqueue elements */
deque.offerLast(2); // Add to the rear
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3); // Add to the front
deque.offerFirst(1);

/* Access an element */
int peekFirst = deque.peekFirst(); // Front element
int peekLast = deque.peekLast(); // Rear element

/* Dequeue an element */
int popFirst = deque.pollFirst(); // Dequeue the front element
int popLast = deque.pollLast(); // Dequeue the rear element

/* Get the deque size */
int size = deque.size();

/* Check whether the deque is empty */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* Initialize the deque */
// In C#, use the linked list LinkedList as a deque
LinkedList<int> deque = new();

/* Enqueue elements */
deque.AddLast(2);   // Add to the rear
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // Add to the front
deque.AddFirst(1);

/* Access an element */
int? peekFirst = deque.First?.Value;  // Front element
int? peekLast = deque.Last?.Value;    // Rear element

/* Dequeue an element */
deque.RemoveFirst();  // Dequeue the front element
deque.RemoveLast();   // Dequeue the rear element

/* Get the deque size */
int size = deque.Count;

/* Check whether the deque is empty */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* Initialize the deque */
// In Go, list can be used as a deque
deque := list.New()

/* Enqueue elements */
deque.PushBack(2) // Add to the rear
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3) // Add to the front
deque.PushFront(1)

/* Access an element */
front := deque.Front() // Front element
rear := deque.Back() // Rear element

/* Dequeue an element */
deque.Remove(front) // Dequeue the front element
deque.Remove(rear) // Dequeue the rear element

/* Get the deque size */
size := deque.Len()

/* Check whether the deque is empty */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* Initialize the deque */
// The Swift standard library has no built-in deque class; Array can be used as a deque
var deque: [Int] = []

/* Enqueue elements */
deque.append(2) // Add to the rear
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // Add to the front
deque.insert(1, at: 0)

/* Access an element */
let peekFirst = deque.first! // Front element
let peekLast = deque.last! // Rear element

/* Dequeue an element */
// When using Array to simulate a deque, popFirst has O(n) complexity
let popFirst = deque.removeFirst() // Dequeue the front element
let popLast = deque.removeLast() // Dequeue the rear element

/* Get the deque size */
let size = deque.count

/* Check whether the deque is empty */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* Initialize the deque */
// JavaScript has no built-in deque; use an Array as a deque
const deque = [];

/* Enqueue elements */
deque.push(2);
deque.push(5);
deque.push(4);
// Note: because this uses an array, unshift() has O(n) time complexity
deque.unshift(3);
deque.unshift(1);

/* Access an element */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* Dequeue an element */
// Note: because this uses an array, shift() has O(n) time complexity
const popFront = deque.shift();
const popBack = deque.pop();

/* Get the deque size */
const size = deque.length;

/* Check whether the deque is empty */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* Initialize the deque */
// TypeScript has no built-in deque; use an Array as a deque instead
const deque: number[] = [];

/* Enqueue elements */
deque.push(2);
deque.push(5);
deque.push(4);
// Note: because this uses an array, unshift() has O(n) time complexity
deque.unshift(3);
deque.unshift(1);

/* Access an element */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* Dequeue an element */
// Note: because this uses an array, shift() has O(n) time complexity
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* Get the deque size */
const size: number = deque.length;

/* Check whether the deque is empty */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* Initialize the deque */
// In Dart, Queue is defined as a deque
final Queue<int> deque = Queue();

/* Enqueue elements */
deque.addLast(2); // Add to the rear
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // Add to the front
deque.addFirst(1);

/* Access an element */
final int peekFirst = deque.first; // Front element
final int peekLast = deque.last; // Rear element

/* Dequeue an element */
final int popFirst = deque.removeFirst(); // Dequeue the front element
final int popLast = deque.removeLast(); // Dequeue the rear element

/* Get the deque size */
final int size = deque.length;

/* Check whether the deque is empty */
final bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
// Initialize the deque
let mut deque: VecDeque<i32> = VecDeque::new();

/* Enqueue elements */
deque.push_back(2); // Add to the rear
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // Add to the front
deque.push_front(1);

// Access an element
let peek_first = deque.front().unwrap(); // Front element
let peek_last = deque.back().unwrap(); // Rear element

// Dequeue an element
let pop_first = deque.pop_front().unwrap(); // Dequeue the front element
let pop_last = deque.pop_back().unwrap(); // Dequeue the rear element

// Get the deque size
let size = deque.len();

// Check whether the deque is empty
let is_empty = deque.is_empty();
```

```c title="deque.c"
// C provides no built-in deque
```

```kotlin title="deque.kt"
/* Initialize the deque */
val deque = LinkedList<Int>()

/* Enqueue elements */
deque.offerLast(2) // Add to the rear
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // Add to the front
deque.offerFirst(1)

/* Access an element */
val peekFirst = deque.peekFirst() // Front element
val peekLast = deque.peekLast() // Rear element

/* Dequeue an element */
val popFirst = deque.pollFirst() // Dequeue the front element
val popLast = deque.pollLast() // Dequeue the rear element

/* Get the deque size */
val size = deque.size

/* Check whether the deque is empty */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# Initialize the deque
# Ruby has no built-in deque class; use an Array as a deque
deque = []

# Enqueue elements
deque << 2
deque << 5
deque << 4
# Note that Array#unshift has O(n) time complexity because the underlying structure is an array
deque.unshift(3)
deque.unshift(1)

# Access an element
peek_first = deque.first
peek_last = deque.last

# Dequeue an element
# Note that Array#shift has O(n) time complexity because the underlying structure is an array
pop_front = deque.shift
pop_back = deque.pop

# Get the deque size
size = deque.length

# Check whether the deque is empty
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20deque%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20deq.append%282%29%20%20%23%20Add%20at%20the%20rear%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20Add%20at%20the%20front%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22Deque%3A%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20Access%20elements%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20Front%20element%0A%20%20%20%20print%28%22Front%20element%3A%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20Rear%20element%0A%20%20%20%20print%28%22Rear%20element%3A%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20Dequeue%20elements%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20Remove%20the%20front%20element%0A%20%20%20%20print%28%22Element%20removed%20from%20the%20front%3A%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22After%20removing%20from%20the%20front%3A%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20Remove%20the%20rear%20element%0A%20%20%20%20print%28%22Element%20removed%20from%20the%20rear%3A%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22After%20removing%20from%20the%20rear%3A%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20Get%20the%20deque%20size%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22Deque%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20deque%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20deque%20empty%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
