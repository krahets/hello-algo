<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# キューを初期化する
# Python では一般に、両端キューのクラス deque をキューとして使う
# queue.Queue() はキュー専用のクラスだが、使いづらいため推奨しない
que: deque[int] = deque()

# 要素をキューに追加する
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# キューの先頭要素を参照する
front: int = que[0]

# キューから要素を取り出す
pop: int = que.popleft()

# キューの要素数を取得する
size: int = len(que)

# キューが空かどうかを判定する
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* キューを初期化する */
queue<int> queue;

/* 要素をキューに追加する */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* キューの先頭要素を参照する */
int front = queue.front();

/* キューから要素を取り出す */
queue.pop();

/* キューの要素数を取得する */
int size = queue.size();

/* キューが空かどうかを判定する */
bool empty = queue.empty();
```

```java title="queue.java"
/* キューを初期化する */
Queue<Integer> queue = new LinkedList<>();

/* 要素をキューに追加する */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* キューの先頭要素を参照する */
int peek = queue.peek();

/* キューから要素を取り出す */
int pop = queue.poll();

/* キューの要素数を取得する */
int size = queue.size();

/* キューが空かどうかを判定する */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* キューを初期化する */
Queue<int> queue = new();

/* 要素をキューに追加する */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* キューの先頭要素を参照する */
int peek = queue.Peek();

/* キューから要素を取り出す */
int pop = queue.Dequeue();

/* キューの要素数を取得する */
int size = queue.Count;

/* キューが空かどうかを判定する */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* キューを初期化する */
// Go では list をキューとして使う
queue := list.New()

/* 要素をキューに追加する */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* キューの先頭要素を参照する */
peek := queue.Front()

/* キューから要素を取り出す */
pop := queue.Front()
queue.Remove(pop)

/* キューの要素数を取得する */
size := queue.Len()

/* キューが空かどうかを判定する */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* キューを初期化する */
// Swift には組み込みのキュークラスがないので、Array をキューとして使える
var queue: [Int] = []

/* 要素をキューに追加する */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* キューの先頭要素を参照する */
let peek = queue.first!

/* キューから要素を取り出す */
// Array でキューの動作を再現すると、removeFirst の時間計算量は O(n) になる
let pop = queue.removeFirst()

/* キューの要素数を取得する */
let size = queue.count

/* キューが空かどうかを判定する */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* キューを初期化する */
// JavaScript には組み込みのキューがないので、Array をキューとして使える
const queue = [];

/* 要素をキューに追加する */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* キューの先頭要素を参照する */
const peek = queue[0];

/* キューから要素を取り出す */
// 内部では配列を使うため、shift() の時間計算量は O(n) になる
const pop = queue.shift();

/* キューの要素数を取得する */
const size = queue.length;

/* キューが空かどうかを判定する */
const isEmpty = queue.length === 0;
```

```typescript title="queue.ts"
/* キューを初期化する */
// TypeScript には組み込みのキューがないので、Array をキューとして使える
const queue: number[] = [];

/* 要素をキューに追加する */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* キューの先頭要素を参照する */
const peek = queue[0];

/* キューから要素を取り出す */
// 内部では配列を使うため、shift() の時間計算量は O(n) になる
const pop = queue.shift();

/* キューの要素数を取得する */
const size = queue.length;

/* キューが空かどうかを判定する */
const isEmpty = queue.length === 0;
```

```dart title="queue.dart"
/* キューを初期化する */
// Dart では一般に、両端キューのクラス Queue をキューとして使う
final Queue<int> queue = Queue();

/* 要素をキューに追加する */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* キューの先頭要素を参照する */
final int peek = queue.first;

/* キューから要素を取り出す */
final int pop = queue.removeFirst();

/* キューの要素数を取得する */
final int size = queue.length;

/* キューが空かどうかを判定する */
final bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
// キューを初期化する
// Rust では一般に、両端キュー VecDeque をキューとして使う
let mut queue: VecDeque<i32> = VecDeque::new();

// 要素をキューに追加する
queue.push_back(1);
queue.push_back(3);
queue.push_back(2);
queue.push_back(5);
queue.push_back(4);

// キューの先頭要素を参照する
let peek = queue.front().unwrap();

// キューから要素を取り出す
let pop = queue.pop_front().unwrap();

// キューの要素数を取得する
let size = queue.len();

// キューが空かどうかを判定する
let is_empty = queue.is_empty();
```

```c title="queue.c"
// C には組み込みのキューがない
```

```kotlin title="queue.kt"
/* キューを初期化する */
val queue = LinkedList<Int>()

/* 要素をキューに追加する */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* キューの先頭要素を参照する */
val peek = queue.peek()

/* キューから要素を取り出す */
val pop = queue.poll()

/* キューの要素数を取得する */
val size = queue.size

/* キューが空かどうかを判定する */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# キューを初期化する
# Ruby 組み込みのキュー（Thread::Queue）には peek メソッドも要素を順にたどるメソッドもないので、Array をキューとして使える
queue = []

# 要素をキューに追加する
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# キューの要素を参照する
peek = queue.first

# キューから要素を取り出す
# 配列を使うため、Array#shift の時間計算量は O(n) になる点に注意
pop = queue.shift

# キューの要素数を取得する
size = queue.length

# キューが空かどうかを判定する
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%A7%E3%81%AF%E9%80%9A%E5%B8%B8%E3%80%81%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E3%82%AF%E3%83%A9%E3%82%B9%20deque%20%E3%82%92%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%86%0A%20%20%20%20%23%20queue.Queue%28%29%20%E3%81%AF%E3%82%AD%E3%83%A5%E3%83%BC%E5%B0%82%E7%94%A8%E3%81%AE%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%A0%E3%81%8C%E3%80%81%E3%82%84%E3%82%84%E4%BD%BF%E3%81%84%E3%81%AB%E3%81%8F%E3%81%84%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E3%82%AD%E3%83%A5%E3%83%BC%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E5%85%88%E9%A0%AD%E3%81%AE%E8%A6%81%E7%B4%A0%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8B%E3%82%89%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
