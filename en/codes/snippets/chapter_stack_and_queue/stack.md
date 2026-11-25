<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# Initialize the stack
# Python has no built-in stack class, so use a list as a stack
stack: list[int] = []

# Push elements onto the stack
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# Peek at the top element
peek: int = stack[-1]

# Pop the top element
pop: int = stack.pop()

# Get the stack size
size: int = len(stack)

# Check whether the stack is empty
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* Initialize the stack */
stack<int> stack;

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Peek at the top element */
int top = stack.top();

/* Pop the top element */
stack.pop(); // Returns no value

/* Get the stack size */
int size = stack.size();

/* Check whether the stack is empty */
bool empty = stack.empty();
```

```java title="stack.java"
/* Initialize the stack */
Stack<Integer> stack = new Stack<>();

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Peek at the top element */
int peek = stack.peek();

/* Pop the top element */
int pop = stack.pop();

/* Get the stack size */
int size = stack.size();

/* Check whether the stack is empty */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* Initialize the stack */
Stack<int> stack = new();

/* Push elements onto the stack */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* Peek at the top element */
int peek = stack.Peek();

/* Pop the top element */
int pop = stack.Pop();

/* Get the stack size */
int size = stack.Count;

/* Check whether the stack is empty */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* Initialize the stack */
// In Go, a slice is the recommended choice for a stack
var stack []int

/* Push elements onto the stack */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* Peek at the top element */
peek := stack[len(stack)-1]

/* Pop the top element */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* Get the stack size */
size := len(stack)

/* Check whether the stack is empty */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* Initialize the stack */
// Swift has no built-in stack class, so use an Array as a stack
var stack: [Int] = []

/* Push elements onto the stack */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* Peek at the top element */
let peek = stack.last!

/* Pop the top element */
let pop = stack.removeLast()

/* Get the stack size */
let size = stack.count

/* Check whether the stack is empty */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* Initialize the stack */
// JavaScript has no built-in stack class, so use an Array as a stack
const stack = [];

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Peek at the top element */
const peek = stack[stack.length - 1];

/* Pop the top element */
const pop = stack.pop();

/* Get the stack size */
const size = stack.length;

/* Check whether the stack is empty */
const isEmpty = stack.length === 0;
```

```typescript title="stack.ts"
/* Initialize the stack */
// TypeScript has no built-in stack class, so use an Array as a stack
const stack: number[] = [];

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Peek at the top element */
const peek = stack[stack.length - 1];

/* Pop the top element */
const pop = stack.pop();

/* Get the stack size */
const size = stack.length;

/* Check whether the stack is empty */
const isEmpty = stack.length === 0;
```

```dart title="stack.dart"
/* Initialize the stack */
// Dart has no built-in stack class, so use a List as a stack
final List<int> stack = [];

/* Push elements onto the stack */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* Peek at the top element */
final int peek = stack.last;

/* Pop the top element */
final int pop = stack.removeLast();

/* Get the stack size */
final int size = stack.length;

/* Check whether the stack is empty */
final bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
// Initialize the stack
// In Rust, Vec is the recommended choice for a stack
let mut stack: Vec<i32> = Vec::new();

// Push elements onto the stack
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

// Peek at the top element
let peek = stack.last().unwrap();

// Pop the top element
let pop = stack.pop().unwrap();

// Get the stack size
let size = stack.len();

// Check whether the stack is empty
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C has no built-in stack
```

```kotlin title="stack.kt"
/* Initialize the stack */
val stack = Stack<Int>()

/* Push elements onto the stack */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* Peek at the top element */
val peek = stack.peek()

/* Pop the top element */
val pop = stack.pop()

/* Get the stack size */
val size = stack.size

/* Check whether the stack is empty */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# Initialize the stack
# Ruby has no built-in stack class, so use an Array as a stack
stack = []

# Push elements onto the stack
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# Peek at the top element
peek = stack.last

# Pop the top element
pop = stack.pop

# Get the stack size
size = stack.length

# Check whether the stack is empty
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20stack%0A%20%20%20%20%23%20Python%20has%20no%20built-in%20stack%20class,%20so%20we%20can%20use%20a%20list%20as%20a%20stack%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20Push%20elements%20onto%20the%20stack%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20Read%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22Top%20element%20%28peek%29%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%20off%20the%20stack%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%20%28pop%29%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22stack%20after%20pop%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22Stack%20length%20%28size%29%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20stack%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22Stack%20is%20empty%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
