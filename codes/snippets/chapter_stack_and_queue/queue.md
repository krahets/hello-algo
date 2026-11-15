<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# 初始化队列
# 在 Python 中，我们一般将双向队列类 deque 当作队列使用
# 虽然 queue.Queue() 是纯正的队列类，但不太好用，因此不推荐
que: deque[int] = deque()

# 元素入队
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# 访问队首元素
front: int = que[0]

# 元素出队
pop: int = que.popleft()

# 获取队列的长度
size: int = len(que)

# 判断队列是否为空
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* 初始化队列 */
queue<int> queue;

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 访问队首元素 */
int front = queue.front();

/* 元素出队 */
queue.pop();

/* 获取队列的长度 */
int size = queue.size();

/* 判断队列是否为空 */
bool empty = queue.empty();
```

```java title="queue.java"
/* 初始化队列 */
Queue<Integer> queue = new LinkedList<>();

/* 元素入队 */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* 访问队首元素 */
int peek = queue.peek();

/* 元素出队 */
int pop = queue.poll();

/* 获取队列的长度 */
int size = queue.size();

/* 判断队列是否为空 */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* 初始化队列 */
Queue<int> queue = new();

/* 元素入队 */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* 访问队首元素 */
int peek = queue.Peek();

/* 元素出队 */
int pop = queue.Dequeue();

/* 获取队列的长度 */
int size = queue.Count;

/* 判断队列是否为空 */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* 初始化队列 */
// 在 Go 中，将 list 作为队列来使用
queue := list.New()

/* 元素入队 */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* 访问队首元素 */
peek := queue.Front()

/* 元素出队 */
pop := queue.Front()
queue.Remove(pop)

/* 获取队列的长度 */
size := queue.Len()

/* 判断队列是否为空 */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* 初始化队列 */
// Swift 没有内置的队列类，可以把 Array 当作队列来使用
var queue: [Int] = []

/* 元素入队 */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* 访问队首元素 */
let peek = queue.first!

/* 元素出队 */
// 由于是数组，因此 removeFirst 的复杂度为 O(n)
let pop = queue.removeFirst()

/* 获取队列的长度 */
let size = queue.count

/* 判断队列是否为空 */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* 初始化队列 */
// JavaScript 没有内置的队列，可以把 Array 当作队列来使用
const queue = [];

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 访问队首元素 */
const peek = queue[0];

/* 元素出队 */
// 底层是数组，因此 shift() 方法的时间复杂度为 O(n)
const pop = queue.shift();

/* 获取队列的长度 */
const size = queue.length;

/* 判断队列是否为空 */
const empty = queue.length === 0;
```

```typescript title="queue.ts"
/* 初始化队列 */
// TypeScript 没有内置的队列，可以把 Array 当作队列来使用
const queue: number[] = [];

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 访问队首元素 */
const peek = queue[0];

/* 元素出队 */
// 底层是数组，因此 shift() 方法的时间复杂度为 O(n)
const pop = queue.shift();

/* 获取队列的长度 */
const size = queue.length;

/* 判断队列是否为空 */
const empty = queue.length === 0;
```

```dart title="queue.dart"
/* 初始化队列 */
// 在 Dart 中，队列类 Queue 是双向队列，也可作为队列使用
Queue<int> queue = Queue();

/* 元素入队 */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* 访问队首元素 */
int peek = queue.first;

/* 元素出队 */
int pop = queue.removeFirst();

/* 获取队列的长度 */
int size = queue.length;

/* 判断队列是否为空 */
bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
/* 初始化双向队列 */
// 在 Rust 中使用双向队列作为普通队列来使用
let mut deque: VecDeque<u32> = VecDeque::new();

/* 元素入队 */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* 访问队首元素 */
if let Some(front) = deque.front() {
}

/* 元素出队 */
if let Some(pop) = deque.pop_front() {
}

/* 获取队列的长度 */
let size = deque.len();

/* 判断队列是否为空 */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C 未提供内置队列
```

```kotlin title="queue.kt"
/* 初始化队列 */
val queue = LinkedList<Int>()

/* 元素入队 */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* 访问队首元素 */
val peek = queue.peek()

/* 元素出队 */
val pop = queue.poll()

/* 获取队列的长度 */
val size = queue.size

/* 判断队列是否为空 */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# 初始化队列
# Ruby 内置的队列（Thread::Queue) 没有 peek 和遍历方法，可以把 Array 当作队列来使用
queue = []

# 元素入队
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# 访问队列元素
peek = queue.first

# 元素出队
# 清注意，由于是数组，Array#shift 方法时间复杂度为 O(n)
pop = queue.shift

# 获取队列的长度
size = queue.length

# 判断队列是否为空
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%98%9F%E5%88%97%0A%20%20%20%20%23%20%E5%9C%A8%20Python%20%E4%B8%AD%EF%BC%8C%E6%88%91%E4%BB%AC%E4%B8%80%E8%88%AC%E5%B0%86%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%B1%BB%20deque%20%E7%9C%8B%E4%BD%9C%E9%98%9F%E5%88%97%E4%BD%BF%E7%94%A8%0A%20%20%20%20%23%20%E8%99%BD%E7%84%B6%20queue.Queue%28%29%20%E6%98%AF%E7%BA%AF%E6%AD%A3%E7%9A%84%E9%98%9F%E5%88%97%E7%B1%BB%EF%BC%8C%E4%BD%86%E4%B8%8D%E5%A4%AA%E5%A5%BD%E7%94%A8%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E9%98%9F%E5%90%8E%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
