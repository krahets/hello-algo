<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# Initialize a stack
# Python has no built-in stack class; use a list as a stack
stack: list[int] = []

# Push elements
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# Access the top element
peek: int = stack[-1]

# Pop an element
pop: int = stack.pop()

# Get the stack size
size: int = len(stack)

# Check whether the stack is empty
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* Initialize a stack */
stack<int> stack;

/* Push elements */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Access the top element */
int top = stack.top();

/* Pop an element */
stack.pop(); // No return value

/* Get the stack size */
int size = stack.size();

/* Check whether the stack is empty */
bool empty = stack.empty();
```

```java title="stack.java"
/* Initialize a stack */
Stack<Integer> stack = new Stack<>();

/* Push elements */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Access the top element */
int peek = stack.peek();

/* Pop an element */
int pop = stack.pop();

/* Get the stack size */
int size = stack.size();

/* Check whether the stack is empty */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* Initialize a stack */
Stack<int> stack = new();

/* Push elements */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* Access the top element */
int peek = stack.Peek();

/* Pop an element */
int pop = stack.Pop();

/* Get the stack size */
int size = stack.Count;

/* Check whether the stack is empty */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* Initialize a stack */
// In Go, a slice is recommended for use as a stack
var stack []int

/* Push elements */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* Access the top element */
peek := stack[len(stack)-1]

/* Pop an element */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* Get the stack size */
size := len(stack)

/* Check whether the stack is empty */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* Initialize a stack */
// Swift has no built-in stack class; use an Array as a stack
var stack: [Int] = []

/* Push elements */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* Access the top element */
let peek = stack.last!

/* Pop an element */
let pop = stack.removeLast()

/* Get the stack size */
let size = stack.count

/* Check whether the stack is empty */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* Initialize a stack */
// JavaScript has no built-in stack class; use an Array as a stack
const stack = [];

/* Push elements */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Access the top element */
const peek = stack[stack.length-1];

/* Pop an element */
const pop = stack.pop();

/* Get the stack size */
const size = stack.length;

/* Check whether the stack is empty */
const is_empty = stack.length === 0;
```

```typescript title="stack.ts"
/* Initialize a stack */
// TypeScript has no built-in stack class; use an Array as a stack
const stack: number[] = [];

/* Push elements */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Access the top element */
const peek = stack[stack.length - 1];

/* Pop an element */
const pop = stack.pop();

/* Get the stack size */
const size = stack.length;

/* Check whether the stack is empty */
const is_empty = stack.length === 0;
```

```dart title="stack.dart"
/* Initialize a stack */
// Dart has no built-in stack class; use a List as a stack
List<int> stack = [];

/* Push elements */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* Access the top element */
int peek = stack.last;

/* Pop an element */
int pop = stack.removeLast();

/* Get the stack size */
int size = stack.length;

/* Check whether the stack is empty */
bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
/* Initialize a stack */
// Use a Vec as a stack
let mut stack: Vec<i32> = Vec::new();

/* Push elements */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Access the top element */
let top = stack.last().unwrap();

/* Pop an element */
let pop = stack.pop().unwrap();

/* Get the stack size */
let size = stack.len();

/* Check whether the stack is empty */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C provides no built-in stack
```

```kotlin title="stack.kt"
/* Initialize a stack */
val stack = Stack<Int>()

/* Push elements */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* Access the top element */
val peek = stack.peek()

/* Pop an element */
val pop = stack.pop()

/* Get the stack size */
val size = stack.size

/* Check whether the stack is empty */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# Initialize a stack
# Ruby has no built-in stack class; use an Array as a stack
stack = []

# Push elements
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# Access the top element
peek = stack.last

# Pop an element
pop = stack.pop

# Get the stack size
size = stack.length

# Check whether the stack is empty
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20stack%0A%20%20%20%20%23%20Python%20has%20no%20built-in%20stack%20class%3B%20use%20a%20list%20as%20a%20stack%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20Push%20elements%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22Stack%3A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22Top%20element%3A%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%3A%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22After%20popping%3A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22Stack%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20stack%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
