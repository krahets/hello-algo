<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# 両端キューを初期化
deq: deque[int] = deque()

# 要素をエンキュー
deq.append(2)      # 末尾に追加
deq.append(5)
deq.append(4)
deq.appendleft(3)  # 先頭に追加
deq.appendleft(1)

# 要素にアクセス
front: int = deq[0]  # 先頭要素
rear: int = deq[-1]  # 末尾要素

# 要素をデキュー
pop_front: int = deq.popleft()  # 先頭要素を取り出す
pop_rear: int = deq.pop()       # 末尾要素を取り出す

# 両端キューの長さを取得
size: int = len(deq)

# 両端キューが空かどうかを判定
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* 両端キューを初期化 */
deque<int> deque;

/* 要素をエンキュー */
deque.push_back(2);   // 末尾に追加
deque.push_back(5);
deque.push_back(4);
deque.push_front(3);  // 先頭に追加
deque.push_front(1);

/* 要素にアクセス */
int front = deque.front(); // 先頭要素
int back = deque.back();   // 末尾要素

/* 要素をデキュー */
deque.pop_front();  // 先頭要素を取り出す
deque.pop_back();   // 末尾要素を取り出す

/* 両端キューの長さを取得 */
int size = deque.size();

/* 両端キューが空かどうかを判定 */
bool empty = deque.empty();
```

```java title="deque.java"
/* 両端キューを初期化 */
Deque<Integer> deque = new LinkedList<>();

/* 要素をエンキュー */
deque.offerLast(2);   // 末尾に追加
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3);  // 先頭に追加
deque.offerFirst(1);

/* 要素にアクセス */
int peekFirst = deque.peekFirst();  // 先頭要素
int peekLast = deque.peekLast();    // 末尾要素

/* 要素をデキュー */
int popFirst = deque.pollFirst();  // 先頭要素を取り出す
int popLast = deque.pollLast();    // 末尾要素を取り出す

/* 両端キューの長さを取得 */
int size = deque.size();

/* 両端キューが空かどうかを判定 */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* 両端キューを初期化 */
// C# では LinkedList を両端キューとして使う
LinkedList<int> deque = new();

/* 要素をエンキュー */
deque.AddLast(2);   // 末尾に追加
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // 先頭に追加
deque.AddFirst(1);

/* 要素にアクセス */
int peekFirst = deque.First.Value;  // 先頭要素
int peekLast = deque.Last.Value;    // 末尾要素

/* 要素をデキュー */
deque.RemoveFirst();  // 先頭要素を取り出す
deque.RemoveLast();   // 末尾要素を取り出す

/* 両端キューの長さを取得 */
int size = deque.Count;

/* 両端キューが空かどうかを判定 */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* 両端キューを初期化 */
// Go では list を両端キューとして使う
deque := list.New()

/* 要素をエンキュー */
deque.PushBack(2)      // 末尾に追加
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3)     // 先頭に追加
deque.PushFront(1)

/* 要素にアクセス */
front := deque.Front() // 先頭要素
rear := deque.Back()   // 末尾要素

/* 要素をデキュー */
deque.Remove(front)    // 先頭要素を取り出す
deque.Remove(rear)     // 末尾要素を取り出す

/* 両端キューの長さを取得 */
size := deque.Len()

/* 両端キューが空かどうかを判定 */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* 両端キューを初期化 */
// Swift には組み込みの両端キュークラスがないため、Array を両端キューとして使える
var deque: [Int] = []

/* 要素をエンキュー */
deque.append(2) // 末尾に追加
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // 先頭に追加
deque.insert(1, at: 0)

/* 要素にアクセス */
let peekFirst = deque.first! // 先頭要素
let peekLast = deque.last! // 末尾要素

/* 要素をデキュー */
// Array で代用する場合、popFirst の計算量は O(n)
let popFirst = deque.removeFirst() // 先頭要素を取り出す
let popLast = deque.removeLast() // 末尾要素を取り出す

/* 両端キューの長さを取得 */
let size = deque.count

/* 両端キューが空かどうかを判定 */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* 両端キューを初期化 */
// JavaScript には組み込みの両端キューがないため、Array で代用する必要がある
const deque = [];

/* 要素をエンキュー */
deque.push(2);
deque.push(5);
deque.push(4);
// 配列なので unshift() の時間計算量は O(n) であることに注意
deque.unshift(3);
deque.unshift(1);

/* 要素にアクセス */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* 要素をデキュー */
// 配列なので shift() の時間計算量は O(n) であることに注意
const popFront = deque.shift();
const popBack = deque.pop();

/* 両端キューの長さを取得 */
const size = deque.length;

/* 両端キューが空かどうかを判定 */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* 両端キューを初期化 */
// TypeScript には組み込みの両端キューがないため、Array で代用する必要がある
const deque: number[] = [];

/* 要素をエンキュー */
deque.push(2);
deque.push(5);
deque.push(4);
// 配列なので unshift() の時間計算量は O(n) であることに注意
deque.unshift(3);
deque.unshift(1);

/* 要素にアクセス */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* 要素をデキュー */
// 配列なので shift() の時間計算量は O(n) であることに注意
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* 両端キューの長さを取得 */
const size: number = deque.length;

/* 両端キューが空かどうかを判定 */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* 両端キューを初期化 */
// Dart では Queue は両端キューとして定義されている
Queue<int> deque = Queue<int>();

/* 要素をエンキュー */
deque.addLast(2);  // 末尾に追加
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 先頭に追加
deque.addFirst(1);

/* 要素にアクセス */
int peekFirst = deque.first; // 先頭要素
int peekLast = deque.last;   // 末尾要素

/* 要素をデキュー */
int popFirst = deque.removeFirst(); // 先頭要素を取り出す
int popLast = deque.removeLast();   // 末尾要素を取り出す

/* 両端キューの長さを取得 */
int size = deque.length;

/* 両端キューが空かどうかを判定 */
bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
/* 両端キューを初期化 */
let mut deque: VecDeque<u32> = VecDeque::new();

/* 要素をエンキュー */
deque.push_back(2);  // 末尾に追加
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // 先頭に追加
deque.push_front(1);

/* 要素にアクセス */
if let Some(front) = deque.front() { // 先頭要素
}
if let Some(rear) = deque.back() {   // 末尾要素
}

/* 要素をデキュー */
if let Some(pop_front) = deque.pop_front() { // 先頭要素を取り出す
}
if let Some(pop_rear) = deque.pop_back() {   // 末尾要素を取り出す
}

/* 両端キューの長さを取得 */
let size = deque.len();

/* 両端キューが空かどうかを判定 */
let is_empty = deque.is_empty();
```

```c title="deque.c"
// C には組み込みの両端キューがない
```

```kotlin title="deque.kt"
/* 両端キューを初期化 */
val deque = LinkedList<Int>()

/* 要素をエンキュー */
deque.offerLast(2)  // 末尾に追加
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // 先頭に追加
deque.offerFirst(1)

/* 要素にアクセス */
val peekFirst = deque.peekFirst() // 先頭要素
val peekLast = deque.peekLast()   // 末尾要素

/* 要素をデキュー */
val popFirst = deque.pollFirst() // 先頭要素を取り出す
val popLast = deque.pollLast()   // 末尾要素を取り出す

/* 両端キューの長さを取得 */
val size = deque.size

/* 両端キューが空かどうかを判定 */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# 両端キューを初期化
# Ruby には組み込みの両端キューがないため、Array で代用する必要がある
deque = []

# 要素をエンキュー
deque << 2
deque << 5
deque << 4
# 配列なので Array#unshift の時間計算量は O(n) であることに注意
deque.unshift(3)
deque.unshift(1)

# 要素にアクセス
peek_first = deque.first
peek_last = deque.last

# 要素をデキュー
# 配列なので Array#shift の時間計算量は O(n) であることに注意
pop_front = deque.shift
pop_back = deque.pop

# 両端キューの長さを取得
size = deque.length

# 両端キューが空かどうかを判定
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20deq%20%3D%20deque()%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20deq.append(2)%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.append(5)%0A%20%20%20%20deq.append(4)%0A%20%20%20%20deq.appendleft(3)%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.appendleft(1)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20front%20%3D%22%2C%20front)%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%20rear%20%3D%22%2C%20rear)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20pop_front%20%3D%20deq.popleft()%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_front%20%3D%22%2C%20pop_front)%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%20%20%20%20pop_rear%20%3D%20deq.pop()%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_rear%20%3D%22%2C%20pop_rear)%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(deq)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(deq)%20%3D%3D%200%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
