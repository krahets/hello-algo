<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# 初始化栈
# Python 没有内置的栈类，可以把 list 当作栈来使用
stack: list[int] = []

# 元素入栈
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# 访问栈顶元素
peek: int = stack[-1]

# 元素出栈
pop: int = stack.pop()

# 获取栈的长度
size: int = len(stack)

# 判断是否为空
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* 初始化栈 */
stack<int> stack;

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 访问栈顶元素 */
int top = stack.top();

/* 元素出栈 */
stack.pop(); // 无返回值

/* 获取栈的长度 */
int size = stack.size();

/* 判断是否为空 */
bool empty = stack.empty();
```

```java title="stack.java"
/* 初始化栈 */
Stack<Integer> stack = new Stack<>();

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 访问栈顶元素 */
int peek = stack.peek();

/* 元素出栈 */
int pop = stack.pop();

/* 获取栈的长度 */
int size = stack.size();

/* 判断是否为空 */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* 初始化栈 */
Stack<int> stack = new();

/* 元素入栈 */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* 访问栈顶元素 */
int peek = stack.Peek();

/* 元素出栈 */
int pop = stack.Pop();

/* 获取栈的长度 */
int size = stack.Count;

/* 判断是否为空 */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* 初始化栈 */
// 在 Go 中，推荐将 Slice 当作栈来使用
var stack []int

/* 元素入栈 */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* 访问栈顶元素 */
peek := stack[len(stack)-1]

/* 元素出栈 */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* 获取栈的长度 */
size := len(stack)

/* 判断是否为空 */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* 初始化栈 */
// Swift 没有内置的栈类，可以把 Array 当作栈来使用
var stack: [Int] = []

/* 元素入栈 */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* 访问栈顶元素 */
let peek = stack.last!

/* 元素出栈 */
let pop = stack.removeLast()

/* 获取栈的长度 */
let size = stack.count

/* 判断是否为空 */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* 初始化栈 */
// JavaScript 没有内置的栈类，可以把 Array 当作栈来使用
const stack = [];

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 访问栈顶元素 */
const peek = stack[stack.length-1];

/* 元素出栈 */
const pop = stack.pop();

/* 获取栈的长度 */
const size = stack.length;

/* 判断是否为空 */
const is_empty = stack.length === 0;
```

```typescript title="stack.ts"
/* 初始化栈 */
// TypeScript 没有内置的栈类，可以把 Array 当作栈来使用
const stack: number[] = [];

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 访问栈顶元素 */
const peek = stack[stack.length - 1];

/* 元素出栈 */
const pop = stack.pop();

/* 获取栈的长度 */
const size = stack.length;

/* 判断是否为空 */
const is_empty = stack.length === 0;
```

```dart title="stack.dart"
/* 初始化栈 */
// Dart 没有内置的栈类，可以把 List 当作栈来使用
List<int> stack = [];

/* 元素入栈 */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* 访问栈顶元素 */
int peek = stack.last;

/* 元素出栈 */
int pop = stack.removeLast();

/* 获取栈的长度 */
int size = stack.length;

/* 判断是否为空 */
bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
/* 初始化栈 */
// 把 Vec 当作栈来使用
let mut stack: Vec<i32> = Vec::new();

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 访问栈顶元素 */
let top = stack.last().unwrap();

/* 元素出栈 */
let pop = stack.pop().unwrap();

/* 获取栈的长度 */
let size = stack.len();

/* 判断是否为空 */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C 未提供内置栈
```

```kotlin title="stack.kt"
/* 初始化栈 */
val stack = Stack<Int>()

/* 元素入栈 */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* 访问栈顶元素 */
val peek = stack.peek()

/* 元素出栈 */
val pop = stack.pop()

/* 获取栈的长度 */
val size = stack.size

/* 判断是否为空 */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# 初始化栈
# Ruby 没有内置的栈类，可以把 Array 当作栈来使用
stack = []

# 元素入栈
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# 访问栈顶元素
peek = stack.last

# 元素出栈
pop = stack.pop

# 获取栈的长度
size = stack.length

# 判断是否为空
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%88%0A%20%20%20%20%23%20Python%20%E6%B2%A1%E6%9C%89%E5%86%85%E7%BD%AE%E7%9A%84%E6%A0%88%E7%B1%BB%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E5%BD%93%E4%BD%9C%E6%A0%88%E6%9D%A5%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E6%A0%88%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E6%A0%88%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E6%A0%88%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%90%8E%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E6%A0%88%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
