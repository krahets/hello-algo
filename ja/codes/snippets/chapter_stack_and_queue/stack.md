<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# スタックを初期化
# Python には組み込みのスタッククラスがないため、list をスタックとして使える
stack: list[int] = []

# 要素をプッシュ
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# スタックの先頭要素にアクセス
peek: int = stack[-1]

# 要素をポップ
pop: int = stack.pop()

# スタックの長さを取得
size: int = len(stack)

# 空かどうかを判定
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* スタックを初期化 */
stack<int> stack;

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* スタックの先頭要素にアクセス */
int top = stack.top();

/* 要素をポップ */
stack.pop(); // 戻り値なし

/* スタックの長さを取得 */
int size = stack.size();

/* 空かどうかを判定 */
bool empty = stack.empty();
```

```java title="stack.java"
/* スタックを初期化 */
Stack<Integer> stack = new Stack<>();

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* スタックの先頭要素にアクセス */
int peek = stack.peek();

/* 要素をポップ */
int pop = stack.pop();

/* スタックの長さを取得 */
int size = stack.size();

/* 空かどうかを判定 */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* スタックを初期化 */
Stack<int> stack = new();

/* 要素をプッシュ */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* スタックの先頭要素にアクセス */
int peek = stack.Peek();

/* 要素をポップ */
int pop = stack.Pop();

/* スタックの長さを取得 */
int size = stack.Count;

/* 空かどうかを判定 */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* スタックを初期化 */
// Go では Slice をスタックとして使うことを推奨
var stack []int

/* 要素をプッシュ */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* スタックの先頭要素にアクセス */
peek := stack[len(stack)-1]

/* 要素をポップ */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* スタックの長さを取得 */
size := len(stack)

/* 空かどうかを判定 */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* スタックを初期化 */
// Swift には組み込みのスタッククラスがないため、Array をスタックとして使える
var stack: [Int] = []

/* 要素をプッシュ */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* スタックの先頭要素にアクセス */
let peek = stack.last!

/* 要素をポップ */
let pop = stack.removeLast()

/* スタックの長さを取得 */
let size = stack.count

/* 空かどうかを判定 */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* スタックを初期化 */
// JavaScript には組み込みのスタッククラスがないため、Array をスタックとして使える
const stack = [];

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* スタックの先頭要素にアクセス */
const peek = stack[stack.length-1];

/* 要素をポップ */
const pop = stack.pop();

/* スタックの長さを取得 */
const size = stack.length;

/* 空かどうかを判定 */
const is_empty = stack.length === 0;
```

```typescript title="stack.ts"
/* スタックを初期化 */
// TypeScript には組み込みのスタッククラスがないため、Array をスタックとして使える
const stack: number[] = [];

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* スタックの先頭要素にアクセス */
const peek = stack[stack.length - 1];

/* 要素をポップ */
const pop = stack.pop();

/* スタックの長さを取得 */
const size = stack.length;

/* 空かどうかを判定 */
const is_empty = stack.length === 0;
```

```dart title="stack.dart"
/* スタックを初期化 */
// Dart には組み込みのスタッククラスがないため、List をスタックとして使える
List<int> stack = [];

/* 要素をプッシュ */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* スタックの先頭要素にアクセス */
int peek = stack.last;

/* 要素をポップ */
int pop = stack.removeLast();

/* スタックの長さを取得 */
int size = stack.length;

/* 空かどうかを判定 */
bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
/* スタックを初期化 */
// Vec をスタックとして使う
let mut stack: Vec<i32> = Vec::new();

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* スタックの先頭要素にアクセス */
let top = stack.last().unwrap();

/* 要素をポップ */
let pop = stack.pop().unwrap();

/* スタックの長さを取得 */
let size = stack.len();

/* 空かどうかを判定 */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C には組み込みのスタックがない
```

```kotlin title="stack.kt"
/* スタックを初期化 */
val stack = Stack<Int>()

/* 要素をプッシュ */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* スタックの先頭要素にアクセス */
val peek = stack.peek()

/* 要素をポップ */
val pop = stack.pop()

/* スタックの長さを取得 */
val size = stack.size

/* 空かどうかを判定 */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# スタックを初期化
# Ruby には組み込みのスタッククラスがないため、Array をスタックとして使える
stack = []

# 要素をプッシュ
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# スタックの先頭要素にアクセス
peek = stack.last

# 要素をポップ
pop = stack.pop

# スタックの長さを取得
size = stack.length

# 空かどうかを判定
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%AB%E3%81%AF%E7%B5%84%E3%81%BF%E8%BE%BC%E3%81%BF%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%8C%E3%81%AA%E3%81%84%E3%81%9F%E3%82%81%E3%80%81list%20%E3%82%92%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%88%E3%82%8B%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.append(1)%0A%20%20%20%20stack.append(3)%0A%20%20%20%20stack.append(2)%0A%20%20%20%20stack.append(5)%0A%20%20%20%20stack.append(4)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop()%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop)%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(stack)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(stack)%20%3D%3D%200%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
