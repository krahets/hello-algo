<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# 初始化佇列
# 在 Python 中，通常用雙端佇列類別 deque 當作一般佇列
# 雖然 queue.Queue() 能建立專用佇列類別的實例，但用起來較不方便，因此不建議使用
que: deque[int] = deque()

# 將元素加入佇列
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# 讀取隊首元素
front: int = que[0]

# 從佇列取出元素
pop: int = que.popleft()

# 取得佇列長度
size: int = len(que)

# 判斷佇列是否為空
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* 初始化佇列 */
queue<int> queue;

/* 將元素加入佇列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 讀取隊首元素 */
int front = queue.front();

/* 從佇列移除元素 */
queue.pop();

/* 取得佇列長度 */
int size = queue.size();

/* 判斷佇列是否為空 */
bool empty = queue.empty();
```

```java title="queue.java"
/* 初始化佇列 */
Queue<Integer> queue = new LinkedList<>();

/* 將元素加入佇列 */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* 讀取隊首元素 */
int peek = queue.peek();

/* 從佇列取出元素 */
int pop = queue.poll();

/* 取得佇列長度 */
int size = queue.size();

/* 判斷佇列是否為空 */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* 初始化佇列 */
Queue<int> queue = new();

/* 將元素加入佇列 */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* 讀取隊首元素 */
int peek = queue.Peek();

/* 從佇列取出元素 */
int pop = queue.Dequeue();

/* 取得佇列長度 */
int size = queue.Count;

/* 判斷佇列是否為空 */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* 初始化佇列 */
// 在 Go 中，可用 list 套件的鏈結串列當作佇列
queue := list.New()

/* 將元素加入佇列 */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* 取得隊首節點 */
peek := queue.Front()

/* 從佇列取出元素 */
pop := queue.Front()
queue.Remove(pop)

/* 取得佇列長度 */
size := queue.Len()

/* 判斷佇列是否為空 */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* 初始化佇列 */
// Swift 沒有內建佇列類別，可以用 Array 當作佇列
var queue: [Int] = []

/* 將元素加入佇列 */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* 讀取隊首元素 */
let peek = queue.first!

/* 從佇列取出元素 */
// 用 Array 模擬時，removeFirst 的時間複雜度為 O(n)
let pop = queue.removeFirst()

/* 取得佇列長度 */
let size = queue.count

/* 判斷佇列是否為空 */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* 初始化佇列 */
// JavaScript 沒有內建佇列，可以用 Array 當作佇列
const queue = [];

/* 將元素加入佇列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 讀取隊首元素 */
const peek = queue[0];

/* 從佇列取出元素 */
// 底層使用陣列，因此 shift() 方法的時間複雜度為 O(n)
const pop = queue.shift();

/* 取得佇列長度 */
const size = queue.length;

/* 判斷佇列是否為空 */
const isEmpty = queue.length === 0;
```

```typescript title="queue.ts"
/* 初始化佇列 */
// TypeScript 沒有內建佇列，可以用 Array 當作佇列
const queue: number[] = [];

/* 將元素加入佇列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 讀取隊首元素 */
const peek = queue[0];

/* 從佇列取出元素 */
// 底層使用陣列，因此 shift() 方法的時間複雜度為 O(n)
const pop = queue.shift();

/* 取得佇列長度 */
const size = queue.length;

/* 判斷佇列是否為空 */
const isEmpty = queue.length === 0;
```

```dart title="queue.dart"
/* 初始化佇列 */
// 在 Dart 中，通常用雙端佇列類別 Queue 當作一般佇列
final Queue<int> queue = Queue();

/* 將元素加入佇列 */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* 讀取隊首元素 */
final int peek = queue.first;

/* 從佇列取出元素 */
final int pop = queue.removeFirst();

/* 取得佇列長度 */
final int size = queue.length;

/* 判斷佇列是否為空 */
final bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
// 初始化佇列
// 在 Rust 中，通常用雙端佇列 VecDeque 當作一般佇列
let mut queue: VecDeque<i32> = VecDeque::new();

// 將元素加入佇列
queue.push_back(1);
queue.push_back(3);
queue.push_back(2);
queue.push_back(5);
queue.push_back(4);

// 讀取隊首元素
let peek = queue.front().unwrap();

// 從佇列取出元素
let pop = queue.pop_front().unwrap();

// 取得佇列長度
let size = queue.len();

// 判斷佇列是否為空
let is_empty = queue.is_empty();
```

```c title="queue.c"
// C 沒有內建佇列
```

```kotlin title="queue.kt"
/* 初始化佇列 */
val queue = LinkedList<Int>()

/* 將元素加入佇列 */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* 讀取隊首元素 */
val peek = queue.peek()

/* 從佇列取出元素 */
val pop = queue.poll()

/* 取得佇列長度 */
val size = queue.size

/* 判斷佇列是否為空 */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# 初始化佇列
# Ruby 內建的佇列（Thread::Queue）沒有 peek 方法，也沒有走訪元素的方法，可以用 Array 當作佇列
queue = []

# 將元素加入佇列
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# 讀取隊首元素
peek = queue.first

# 從佇列取出元素
# 請注意，Array 是陣列，因此 Array#shift 的時間複雜度為 O(n)
pop = queue.shift

# 取得佇列長度
size = queue.length

# 判斷佇列是否為空
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BD%87%E5%88%97%0A%20%20%20%20%23%20%E5%9C%A8%20Python%20%E4%B8%AD%EF%BC%8C%E9%80%9A%E5%B8%B8%E6%8A%8A%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%E9%A1%9E%E5%88%A5%20deque%20%E7%95%B6%E4%BD%9C%E4%BD%87%E5%88%97%E4%BD%BF%E7%94%A8%0A%20%20%20%20%23%20%E9%9B%96%E7%84%B6%E5%8F%AF%E4%BB%A5%E7%94%A8%20queue.Queue%28%29%20%E5%BB%BA%E7%AB%8B%E5%B0%88%E7%94%A8%E7%9A%84%E4%BD%87%E5%88%97%EF%BC%8C%E4%BD%BF%E7%94%A8%E8%B5%B7%E4%BE%86%E5%8D%BB%E4%B8%8D%E5%A4%AA%E6%96%B9%E4%BE%BF%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E5%8A%A0%E5%85%A5%E4%BD%87%E5%88%97%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E9%9A%8A%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E9%9A%8A%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E4%BD%87%E5%88%97%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%8F%96%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%E5%BE%8C%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E4%BD%87%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
