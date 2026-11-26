<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# Initialize the deque
deq: deque[int] = deque()

# Add elements to the deque
deq.append(2)  # Add at the rear
deq.append(5)
deq.append(4)
deq.appendleft(3)  # Add at the front
deq.appendleft(1)

# Peek at the front and rear elements
front: int = deq[0]  # Front element
rear: int = deq[-1]  # Rear element

# Remove elements from both ends
pop_front: int = deq.popleft()  # Remove and return the front element
pop_rear: int = deq.pop()  # Remove and return the rear element

# Get the deque size
size: int = len(deq)

# Check whether the deque is empty
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* Initialize the deque */
deque<int> deque;

/* Add elements to the deque */
deque.push_back(2); // Add at the rear
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // Add at the front
deque.push_front(1);

/* Peek at the front and rear elements */
int front = deque.front(); // Front element
int back = deque.back(); // Rear element

/* Remove elements from both ends */
deque.pop_front(); // Remove the front element
deque.pop_back(); // Remove the rear element

/* Get the deque size */
int size = deque.size();

/* Check whether the deque is empty */
bool empty = deque.empty();
```

```java title="deque.java"
/* Initialize the deque */
Deque<Integer> deque = new LinkedList<>();

/* Add elements to the deque */
deque.offerLast(2); // Add at the rear
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3); // Add at the front
deque.offerFirst(1);

/* Peek at the front and rear elements */
int peekFirst = deque.peekFirst(); // Front element
int peekLast = deque.peekLast(); // Rear element

/* Remove elements from both ends */
int popFirst = deque.pollFirst(); // Remove and return the front element
int popLast = deque.pollLast(); // Remove and return the rear element

/* Get the deque size */
int size = deque.size();

/* Check whether the deque is empty */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* Initialize the deque */
// Use a LinkedList as a deque in C#
LinkedList<int> deque = new();

/* Add elements to the deque */
deque.AddLast(2);   // Add at the rear
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // Add at the front
deque.AddFirst(1);

/* Peek at the front and rear elements */
int? peekFirst = deque.First?.Value;  // Front element
int? peekLast = deque.Last?.Value;    // Rear element

/* Remove elements from both ends */
deque.RemoveFirst();  // Remove the front element
deque.RemoveLast();   // Remove the rear element

/* Get the deque size */
int size = deque.Count;

/* Check whether the deque is empty */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* Initialize the deque */
// Use Go's list.List as a deque
deque := list.New()

/* Add elements to the deque */
deque.PushBack(2) // Add at the rear
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3) // Add at the front
deque.PushFront(1)

/* Peek at the front and rear elements */
front := deque.Front() // Front element
rear := deque.Back() // Rear element

/* Remove elements from both ends */
deque.Remove(front) // Remove the front element
deque.Remove(rear) // Remove the rear element

/* Get the deque size */
size := deque.Len()

/* Check whether the deque is empty */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* Initialize the deque */
// Swift has no built-in deque class, so use an Array as a deque
var deque: [Int] = []

/* Add elements to the deque */
deque.append(2) // Add at the rear
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // Add at the front
deque.insert(1, at: 0)

/* Peek at the front and rear elements */
let peekFirst = deque.first! // Front element
let peekLast = deque.last! // Rear element

/* Remove elements from both ends */
// With an Array, removeFirst takes O(n) time
let popFirst = deque.removeFirst() // Remove and return the front element
let popLast = deque.removeLast() // Remove and return the rear element

/* Get the deque size */
let size = deque.count

/* Check whether the deque is empty */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* Initialize the deque */
// JavaScript has no built-in deque, so use an Array as a deque
const deque = [];

/* Add elements to the deque */
deque.push(2);
deque.push(5);
deque.push(4);
// unshift() takes O(n) time because the deque uses an array
deque.unshift(3);
deque.unshift(1);

/* Peek at the front and rear elements */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* Remove elements from both ends */
// shift() takes O(n) time because the deque uses an array
const popFront = deque.shift();
const popBack = deque.pop();

/* Get the deque size */
const size = deque.length;

/* Check whether the deque is empty */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* Initialize the deque */
// TypeScript has no built-in deque, so use an Array as a deque
const deque: number[] = [];

/* Add elements to the deque */
deque.push(2);
deque.push(5);
deque.push(4);
// unshift() takes O(n) time because the deque uses an array
deque.unshift(3);
deque.unshift(1);

/* Peek at the front and rear elements */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* Remove elements from both ends */
// shift() takes O(n) time because the deque uses an array
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* Get the deque size */
const size: number = deque.length;

/* Check whether the deque is empty */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* Initialize the deque */
// Dart defines Queue as a double-ended queue
final Queue<int> deque = Queue();

/* Add elements to the deque */
deque.addLast(2); // Add at the rear
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // Add at the front
deque.addFirst(1);

/* Peek at the front and rear elements */
final int peekFirst = deque.first; // Front element
final int peekLast = deque.last; // Rear element

/* Remove elements from both ends */
final int popFirst = deque.removeFirst(); // Remove and return the front element
final int popLast = deque.removeLast(); // Remove and return the rear element

/* Get the deque size */
final int size = deque.length;

/* Check whether the deque is empty */
final bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
// Initialize the deque
let mut deque: VecDeque<i32> = VecDeque::new();

/* Add elements to the deque */
deque.push_back(2); // Add at the rear
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // Add at the front
deque.push_front(1);

// Peek at the front and rear elements
let peek_first = deque.front().unwrap(); // Front element
let peek_last = deque.back().unwrap(); // Rear element

// Remove elements from both ends
let pop_first = deque.pop_front().unwrap(); // Remove and return the front element
let pop_last = deque.pop_back().unwrap(); // Remove and return the rear element

// Get the deque size
let size = deque.len();

// Check whether the deque is empty
let is_empty = deque.is_empty();
```

```c title="deque.c"
// C has no built-in deque
```

```kotlin title="deque.kt"
/* Initialize the deque */
val deque = LinkedList<Int>()

/* Add elements to the deque */
deque.offerLast(2) // Add at the rear
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // Add at the front
deque.offerFirst(1)

/* Peek at the front and rear elements */
val peekFirst = deque.peekFirst() // Front element
val peekLast = deque.peekLast() // Rear element

/* Remove elements from both ends */
val popFirst = deque.pollFirst() // Remove and return the front element
val popLast = deque.pollLast() // Remove and return the rear element

/* Get the deque size */
val size = deque.size

/* Check whether the deque is empty */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# Initialize the deque
# Ruby has no built-in deque, so use an Array as a deque
deque = []

# Add elements to the deque
deque << 2
deque << 5
deque << 4
# Array#unshift takes O(n) time because the deque uses an array
deque.unshift(3)
deque.unshift(1)

# Peek at the front and rear elements
peek_first = deque.first
peek_last = deque.last

# Remove elements from both ends
# Array#shift takes O(n) time because the deque uses an array
pop_front = deque.shift
pop_back = deque.pop

# Get the deque size
size = deque.length

# Check whether the deque is empty
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20deque%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Add%20elements%20to%20the%20deque%0A%20%20%20%20deq.append%282%29%20%20%23%20Add%20to%20the%20rear%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20Add%20to%20the%20front%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20Access%20elements%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20Front%20element%0A%20%20%20%20print%28%22Front%20element%20%28front%29%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20Rear%20element%0A%20%20%20%20print%28%22Rear%20element%20%28rear%29%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20Remove%20elements%20from%20the%20deque%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20Remove%20the%20front%20element%0A%20%20%20%20print%28%22Removed%20from%20front%20%28pop_front%29%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22deque%20after%20front%20removal%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20Remove%20the%20rear%20element%0A%20%20%20%20print%28%22Removed%20from%20rear%20%28pop_rear%29%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22deque%20after%20rear%20removal%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20Get%20the%20length%20of%20the%20deque%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22Deque%20length%20%28size%29%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20deque%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22Deque%20is%20empty%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
