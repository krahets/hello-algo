<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# 初始化佇列
# 在 Python 中，我們一般將雙向佇列類別 deque 當作佇列使用
# 雖然 queue.Queue() 是純正的佇列類別，但不太好用，因此不推薦
que: deque[int] = deque()

# 元素入列
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# 訪問佇列首元素
front: int = que[0]

# 元素出列
pop: int = que.popleft()

# 獲取佇列的長度
size: int = len(que)

# 判斷佇列是否為空
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* 初始化佇列 */
queue<int> queue;

/* 元素入列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 訪問佇列首元素 */
int front = queue.front();

/* 元素出列 */
queue.pop();

/* 獲取佇列的長度 */
int size = queue.size();

/* 判斷佇列是否為空 */
bool empty = queue.empty();
```

```java title="queue.java"
/* 初始化佇列 */
Queue<Integer> queue = new LinkedList<>();

/* 元素入列 */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* 訪問佇列首元素 */
int peek = queue.peek();

/* 元素出列 */
int pop = queue.poll();

/* 獲取佇列的長度 */
int size = queue.size();

/* 判斷佇列是否為空 */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* 初始化佇列 */
Queue<int> queue = new();

/* 元素入列 */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* 訪問佇列首元素 */
int peek = queue.Peek();

/* 元素出列 */
int pop = queue.Dequeue();

/* 獲取佇列的長度 */
int size = queue.Count;

/* 判斷佇列是否為空 */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* 初始化佇列 */
// 在 Go 中，將 list 作為佇列來使用
queue := list.New()

/* 元素入列 */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* 訪問佇列首元素 */
peek := queue.Front()

/* 元素出列 */
pop := queue.Front()
queue.Remove(pop)

/* 獲取佇列的長度 */
size := queue.Len()

/* 判斷佇列是否為空 */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* 初始化佇列 */
// Swift 沒有內建的佇列類別，可以把 Array 當作佇列來使用
var queue: [Int] = []

/* 元素入列 */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* 訪問佇列首元素 */
let peek = queue.first!

/* 元素出列 */
// 由於是陣列，因此 removeFirst 的複雜度為 O(n)
let pop = queue.removeFirst()

/* 獲取佇列的長度 */
let size = queue.count

/* 判斷佇列是否為空 */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* 初始化佇列 */
// JavaScript 沒有內建的佇列，可以把 Array 當作佇列來使用
const queue = [];

/* 元素入列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 訪問佇列首元素 */
const peek = queue[0];

/* 元素出列 */
// 底層是陣列，因此 shift() 方法的時間複雜度為 O(n)
const pop = queue.shift();

/* 獲取佇列的長度 */
const size = queue.length;

/* 判斷佇列是否為空 */
const empty = queue.length === 0;
```

```typescript title="queue.ts"
/* 初始化佇列 */
// TypeScript 沒有內建的佇列，可以把 Array 當作佇列來使用
const queue: number[] = [];

/* 元素入列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 訪問佇列首元素 */
const peek = queue[0];

/* 元素出列 */
// 底層是陣列，因此 shift() 方法的時間複雜度為 O(n)
const pop = queue.shift();

/* 獲取佇列的長度 */
const size = queue.length;

/* 判斷佇列是否為空 */
const empty = queue.length === 0;
```

```dart title="queue.dart"
/* 初始化佇列 */
// 在 Dart 中，佇列類別 Queue 是雙向佇列，也可作為佇列使用
Queue<int> queue = Queue();

/* 元素入列 */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* 訪問佇列首元素 */
int peek = queue.first;

/* 元素出列 */
int pop = queue.removeFirst();

/* 獲取佇列的長度 */
int size = queue.length;

/* 判斷佇列是否為空 */
bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
/* 初始化雙向佇列 */
// 在 Rust 中使用雙向佇列作為普通佇列來使用
let mut deque: VecDeque<u32> = VecDeque::new();

/* 元素入列 */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* 訪問佇列首元素 */
if let Some(front) = deque.front() {
}

/* 元素出列 */
if let Some(pop) = deque.pop_front() {
}

/* 獲取佇列的長度 */
let size = deque.len();

/* 判斷佇列是否為空 */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C 未提供內建佇列
```

```kotlin title="queue.kt"
/* 初始化佇列 */
val queue = LinkedList<Int>()

/* 元素入列 */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* 訪問佇列首元素 */
val peek = queue.peek()

/* 元素出列 */
val pop = queue.poll()

/* 獲取佇列的長度 */
val size = queue.size

/* 判斷佇列是否為空 */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# 初始化佇列
# Ruby 內建的佇列（Thread::Queue) 沒有 peek 和走訪方法，可以把 Array 當作佇列來使用
queue = []

# 元素入列
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# 訪問佇列元素
peek = queue.first

# 元素出列
# 清注意，由於是陣列，Array#shift 方法時間複雜度為 O(n)
pop = queue.shift

# 獲取佇列的長度
size = queue.length

# 判斷佇列是否為空
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BD%87%E5%88%97%0A%20%20%20%20%23%20%E5%9C%A8%20Python%20%E4%B8%AD%EF%BC%8C%E6%88%91%E5%80%91%E4%B8%80%E8%88%AC%E5%B0%87%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%E9%A1%9E%E5%88%A5%20deque%20%E7%9C%8B%E4%BD%9C%E4%BD%87%E5%88%97%E4%BD%BF%E7%94%A8%0A%20%20%20%20%23%20%E9%9B%96%E7%84%B6%20queue.Queue%28%29%20%E6%98%AF%E7%B4%94%E6%AD%A3%E7%9A%84%E4%BD%87%E5%88%97%E9%A1%9E%E5%88%A5%EF%BC%8C%E4%BD%86%E4%B8%8D%E5%A4%AA%E5%A5%BD%E7%94%A8%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%88%97%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E5%88%97%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E5%88%97%E5%85%83%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E5%88%97%E5%BE%8C%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E4%BD%87%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%95%B7%E5%BA%A6%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
