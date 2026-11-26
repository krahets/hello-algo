<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# 初始化堆疊
# Python 沒有內建堆疊類別，可以用 list 當作堆疊
stack: list[int] = []

# 將元素推入堆疊
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# 讀取堆疊頂端的元素
peek: int = stack[-1]

# 從堆疊彈出元素
pop: int = stack.pop()

# 取得堆疊長度
size: int = len(stack)

# 判斷堆疊是否為空
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* 初始化堆疊 */
stack<int> stack;

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 讀取堆疊頂端的元素 */
int top = stack.top();

/* 移除堆疊頂端的元素 */
stack.pop(); // 沒有回傳值

/* 取得堆疊長度 */
int size = stack.size();

/* 判斷堆疊是否為空 */
bool empty = stack.empty();
```

```java title="stack.java"
/* 初始化堆疊 */
Stack<Integer> stack = new Stack<>();

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 讀取堆疊頂端的元素 */
int peek = stack.peek();

/* 從堆疊彈出元素 */
int pop = stack.pop();

/* 取得堆疊長度 */
int size = stack.size();

/* 判斷堆疊是否為空 */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* 初始化堆疊 */
Stack<int> stack = new();

/* 將元素推入堆疊 */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* 讀取堆疊頂端的元素 */
int peek = stack.Peek();

/* 從堆疊彈出元素 */
int pop = stack.Pop();

/* 取得堆疊長度 */
int size = stack.Count;

/* 判斷堆疊是否為空 */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* 初始化堆疊 */
// 在 Go 中，建議用切片（slice）當作堆疊
var stack []int

/* 將元素推入堆疊 */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* 讀取堆疊頂端的元素 */
peek := stack[len(stack)-1]

/* 從堆疊彈出元素 */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* 取得堆疊長度 */
size := len(stack)

/* 判斷堆疊是否為空 */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* 初始化堆疊 */
// Swift 沒有內建堆疊類別，可以用 Array 當作堆疊
var stack: [Int] = []

/* 將元素推入堆疊 */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* 讀取堆疊頂端的元素 */
let peek = stack.last!

/* 從堆疊彈出元素 */
let pop = stack.removeLast()

/* 取得堆疊長度 */
let size = stack.count

/* 判斷堆疊是否為空 */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* 初始化堆疊 */
// JavaScript 沒有內建堆疊類別，可以用 Array 當作堆疊
const stack = [];

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 讀取堆疊頂端的元素 */
const peek = stack[stack.length - 1];

/* 從堆疊彈出元素 */
const pop = stack.pop();

/* 取得堆疊長度 */
const size = stack.length;

/* 判斷堆疊是否為空 */
const isEmpty = stack.length === 0;
```

```typescript title="stack.ts"
/* 初始化堆疊 */
// TypeScript 沒有內建堆疊類別，可以用 Array 當作堆疊
const stack: number[] = [];

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 讀取堆疊頂端的元素 */
const peek = stack[stack.length - 1];

/* 從堆疊彈出元素 */
const pop = stack.pop();

/* 取得堆疊長度 */
const size = stack.length;

/* 判斷堆疊是否為空 */
const isEmpty = stack.length === 0;
```

```dart title="stack.dart"
/* 初始化堆疊 */
// Dart 沒有內建堆疊類別，可以用 List 當作堆疊
final List<int> stack = [];

/* 將元素推入堆疊 */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* 讀取堆疊頂端的元素 */
final int peek = stack.last;

/* 從堆疊彈出元素 */
final int pop = stack.removeLast();

/* 取得堆疊長度 */
final int size = stack.length;

/* 判斷堆疊是否為空 */
final bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
// 初始化堆疊
// 在 Rust 中，建議用 Vec 當作堆疊
let mut stack: Vec<i32> = Vec::new();

// 將元素推入堆疊
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

// 讀取堆疊頂端的元素
let peek = stack.last().unwrap();

// 從堆疊彈出元素
let pop = stack.pop().unwrap();

// 取得堆疊長度
let size = stack.len();

// 判斷堆疊是否為空
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C 沒有內建堆疊
```

```kotlin title="stack.kt"
/* 初始化堆疊 */
val stack = Stack<Int>()

/* 將元素推入堆疊 */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* 讀取堆疊頂端的元素 */
val peek = stack.peek()

/* 從堆疊彈出元素 */
val pop = stack.pop()

/* 取得堆疊長度 */
val size = stack.size

/* 判斷堆疊是否為空 */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# 初始化堆疊
# Ruby 沒有內建堆疊類別，可以用 Array 當作堆疊
stack = []

# 將元素推入堆疊
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# 讀取堆疊頂端的元素
peek = stack.last

# 從堆疊彈出元素
pop = stack.pop

# 取得堆疊長度
size = stack.length

# 判斷堆疊是否為空
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20%23%20Python%20%E6%B2%92%E6%9C%89%E5%85%A7%E5%BB%BA%E7%9A%84%E5%A0%86%E7%96%8A%E9%A1%9E%E5%88%A5%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E7%95%B6%E4%BD%9C%E5%A0%86%E7%96%8A%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E6%8E%A8%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E7%AB%AF%E7%9A%84%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E5%A0%86%E7%96%8A%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%BD%88%E5%87%BA%E5%85%83%E7%B4%A0%E5%BE%8C%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E5%A0%86%E7%96%8A%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
