<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# 初始化堆疊
# Python 沒有內建的堆疊類別，可以把 list 當作堆疊來使用
stack: list[int] = []

# 元素入堆疊
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# 訪問堆疊頂元素
peek: int = stack[-1]

# 元素出堆疊
pop: int = stack.pop()

# 獲取堆疊的長度
size: int = len(stack)

# 判斷是否為空
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* 初始化堆疊 */
stack<int> stack;

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 訪問堆疊頂元素 */
int top = stack.top();

/* 元素出堆疊 */
stack.pop(); // 無返回值

/* 獲取堆疊的長度 */
int size = stack.size();

/* 判斷是否為空 */
bool empty = stack.empty();
```

```java title="stack.java"
/* 初始化堆疊 */
Stack<Integer> stack = new Stack<>();

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 訪問堆疊頂元素 */
int peek = stack.peek();

/* 元素出堆疊 */
int pop = stack.pop();

/* 獲取堆疊的長度 */
int size = stack.size();

/* 判斷是否為空 */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* 初始化堆疊 */
Stack<int> stack = new();

/* 元素入堆疊 */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* 訪問堆疊頂元素 */
int peek = stack.Peek();

/* 元素出堆疊 */
int pop = stack.Pop();

/* 獲取堆疊的長度 */
int size = stack.Count;

/* 判斷是否為空 */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* 初始化堆疊 */
// 在 Go 中，推薦將 Slice 當作堆疊來使用
var stack []int

/* 元素入堆疊 */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* 訪問堆疊頂元素 */
peek := stack[len(stack)-1]

/* 元素出堆疊 */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* 獲取堆疊的長度 */
size := len(stack)

/* 判斷是否為空 */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* 初始化堆疊 */
// Swift 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
var stack: [Int] = []

/* 元素入堆疊 */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* 訪問堆疊頂元素 */
let peek = stack.last!

/* 元素出堆疊 */
let pop = stack.removeLast()

/* 獲取堆疊的長度 */
let size = stack.count

/* 判斷是否為空 */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* 初始化堆疊 */
// JavaScript 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
const stack = [];

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 訪問堆疊頂元素 */
const peek = stack[stack.length-1];

/* 元素出堆疊 */
const pop = stack.pop();

/* 獲取堆疊的長度 */
const size = stack.length;

/* 判斷是否為空 */
const is_empty = stack.length === 0;
```

```typescript title="stack.ts"
/* 初始化堆疊 */
// TypeScript 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
const stack: number[] = [];

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 訪問堆疊頂元素 */
const peek = stack[stack.length - 1];

/* 元素出堆疊 */
const pop = stack.pop();

/* 獲取堆疊的長度 */
const size = stack.length;

/* 判斷是否為空 */
const is_empty = stack.length === 0;
```

```dart title="stack.dart"
/* 初始化堆疊 */
// Dart 沒有內建的堆疊類別，可以把 List 當作堆疊來使用
List<int> stack = [];

/* 元素入堆疊 */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* 訪問堆疊頂元素 */
int peek = stack.last;

/* 元素出堆疊 */
int pop = stack.removeLast();

/* 獲取堆疊的長度 */
int size = stack.length;

/* 判斷是否為空 */
bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
/* 初始化堆疊 */
// 把 Vec 當作堆疊來使用
let mut stack: Vec<i32> = Vec::new();

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 訪問堆疊頂元素 */
let top = stack.last().unwrap();

/* 元素出堆疊 */
let pop = stack.pop().unwrap();

/* 獲取堆疊的長度 */
let size = stack.len();

/* 判斷是否為空 */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C 未提供內建堆疊
```

```kotlin title="stack.kt"
/* 初始化堆疊 */
val stack = Stack<Int>()

/* 元素入堆疊 */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* 訪問堆疊頂元素 */
val peek = stack.peek()

/* 元素出堆疊 */
val pop = stack.pop()

/* 獲取堆疊的長度 */
val size = stack.size

/* 判斷是否為空 */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# 初始化堆疊
# Ruby 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
stack = []

# 元素入堆疊
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# 訪問堆疊頂元素
peek = stack.last

# 元素出堆疊
pop = stack.pop

# 獲取堆疊的長度
size = stack.length

# 判斷是否為空
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A0%86%E7%96%8A%0A%20%20%20%20%23%20Python%20%E6%B2%92%E6%9C%89%E5%85%A7%E5%BB%BA%E7%9A%84%E5%A0%86%E7%96%8A%E9%A1%9E%E5%88%A5%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E7%95%B6%E4%BD%9C%E5%A0%86%E7%96%8A%E4%BE%86%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%E7%96%8A%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%A0%86%E7%96%8A%E9%A0%82%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E9%A0%82%E5%85%83%E7%B4%A0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%E7%96%8A%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E5%A0%86%E7%96%8A%E5%85%83%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E5%A0%86%E7%96%8A%E5%BE%8C%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E5%A0%86%E7%96%8A%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E7%9A%84%E9%95%B7%E5%BA%A6%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%A0%86%E7%96%8A%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
