<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# 初始化雙端佇列
deq: deque[int] = deque()

# 將元素加入雙端佇列
deq.append(2)  # 加到隊尾
deq.append(5)
deq.append(4)
deq.appendleft(3)  # 加到隊首
deq.appendleft(1)

# 讀取隊首與隊尾元素
front: int = deq[0]  # 隊首元素
rear: int = deq[-1]  # 隊尾元素

# 從雙端佇列取出元素
pop_front: int = deq.popleft()  # 從隊首取出元素
pop_rear: int = deq.pop()  # 從隊尾取出元素

# 取得雙端佇列長度
size: int = len(deq)

# 判斷雙端佇列是否為空
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* 初始化雙端佇列 */
deque<int> deque;

/* 將元素加入雙端佇列 */
deque.push_back(2); // 加到隊尾
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // 加到隊首
deque.push_front(1);

/* 讀取隊首與隊尾元素 */
int front = deque.front(); // 隊首元素
int back = deque.back(); // 隊尾元素

/* 從雙端佇列移除元素 */
deque.pop_front(); // 移除隊首元素
deque.pop_back(); // 移除隊尾元素

/* 取得雙端佇列長度 */
int size = deque.size();

/* 判斷雙端佇列是否為空 */
bool empty = deque.empty();
```

```java title="deque.java"
/* 初始化雙端佇列 */
Deque<Integer> deque = new LinkedList<>();

/* 將元素加入雙端佇列 */
deque.offerLast(2); // 加到隊尾
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3); // 加到隊首
deque.offerFirst(1);

/* 讀取隊首與隊尾元素 */
int peekFirst = deque.peekFirst(); // 隊首元素
int peekLast = deque.peekLast(); // 隊尾元素

/* 從雙端佇列取出元素 */
int popFirst = deque.pollFirst(); // 從隊首取出元素
int popLast = deque.pollLast(); // 從隊尾取出元素

/* 取得雙端佇列長度 */
int size = deque.size();

/* 判斷雙端佇列是否為空 */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* 初始化雙端佇列 */
// 在 C# 中，可用鏈結串列 LinkedList 當作雙端佇列
LinkedList<int> deque = new();

/* 將元素加入雙端佇列 */
deque.AddLast(2);   // 加到隊尾
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // 加到隊首
deque.AddFirst(1);

/* 讀取隊首與隊尾元素 */
int? peekFirst = deque.First?.Value;  // 隊首元素
int? peekLast = deque.Last?.Value;    // 隊尾元素

/* 從雙端佇列取出元素 */
deque.RemoveFirst();  // 移除隊首元素
deque.RemoveLast();   // 移除隊尾元素

/* 取得雙端佇列長度 */
int size = deque.Count;

/* 判斷雙端佇列是否為空 */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* 初始化雙端佇列 */
// 在 Go 中，可用 list 套件的鏈結串列當作雙端佇列
deque := list.New()

/* 將元素加入雙端佇列 */
deque.PushBack(2) // 加到隊尾
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3) // 加到隊首
deque.PushFront(1)

/* 讀取隊首與隊尾元素 */
front := deque.Front() // 隊首節點
rear := deque.Back() // 隊尾節點

/* 從雙端佇列取出元素 */
deque.Remove(front) // 從隊首取出元素
deque.Remove(rear) // 從隊尾取出元素

/* 取得雙端佇列長度 */
size := deque.Len()

/* 判斷雙端佇列是否為空 */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* 初始化雙端佇列 */
// Swift 沒有內建雙端佇列類別，可以用 Array 當作雙端佇列
var deque: [Int] = []

/* 將元素加入雙端佇列 */
deque.append(2) // 加到隊尾
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // 加到隊首
deque.insert(1, at: 0)

/* 讀取隊首與隊尾元素 */
let peekFirst = deque.first! // 隊首元素
let peekLast = deque.last! // 隊尾元素

/* 從雙端佇列取出元素 */
// 用 Array 模擬時，removeFirst 的時間複雜度為 O(n)
let popFirst = deque.removeFirst() // 從隊首取出元素
let popLast = deque.removeLast() // 從隊尾取出元素

/* 取得雙端佇列長度 */
let size = deque.count

/* 判斷雙端佇列是否為空 */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* 初始化雙端佇列 */
// JavaScript 沒有內建雙端佇列，只能用 Array 來模擬
const deque = [];

/* 將元素加入雙端佇列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，底層使用陣列，因此 unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);

/* 讀取隊首與隊尾元素 */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* 從雙端佇列取出元素 */
// 請注意，底層使用陣列，因此 shift() 方法的時間複雜度為 O(n)
const popFront = deque.shift();
const popBack = deque.pop();

/* 取得雙端佇列長度 */
const size = deque.length;

/* 判斷雙端佇列是否為空 */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* 初始化雙端佇列 */
// TypeScript 沒有內建雙端佇列，只能用 Array 來模擬
const deque: number[] = [];

/* 將元素加入雙端佇列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，底層使用陣列，因此 unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);

/* 讀取隊首與隊尾元素 */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* 從雙端佇列取出元素 */
// 請注意，底層使用陣列，因此 shift() 方法的時間複雜度為 O(n)
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* 取得雙端佇列長度 */
const size: number = deque.length;

/* 判斷雙端佇列是否為空 */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* 初始化雙端佇列 */
// 在 Dart 中，Queue 定義為雙端佇列
final Queue<int> deque = Queue();

/* 將元素加入雙端佇列 */
deque.addLast(2); // 加到隊尾
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 加到隊首
deque.addFirst(1);

/* 讀取隊首與隊尾元素 */
final int peekFirst = deque.first; // 隊首元素
final int peekLast = deque.last; // 隊尾元素

/* 從雙端佇列取出元素 */
final int popFirst = deque.removeFirst(); // 從隊首取出元素
final int popLast = deque.removeLast(); // 從隊尾取出元素

/* 取得雙端佇列長度 */
final int size = deque.length;

/* 判斷雙端佇列是否為空 */
final bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
// 初始化雙端佇列
let mut deque: VecDeque<i32> = VecDeque::new();

/* 將元素加入雙端佇列 */
deque.push_back(2); // 加到隊尾
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // 加到隊首
deque.push_front(1);

// 讀取隊首與隊尾元素
let peek_first = deque.front().unwrap(); // 隊首元素
let peek_last = deque.back().unwrap(); // 隊尾元素

// 從雙端佇列取出元素
let pop_first = deque.pop_front().unwrap(); // 從隊首取出元素
let pop_last = deque.pop_back().unwrap(); // 從隊尾取出元素

// 取得雙端佇列長度
let size = deque.len();

// 判斷雙端佇列是否為空
let is_empty = deque.is_empty();
```

```c title="deque.c"
// C 沒有內建雙端佇列
```

```kotlin title="deque.kt"
/* 初始化雙端佇列 */
val deque = LinkedList<Int>()

/* 將元素加入雙端佇列 */
deque.offerLast(2) // 加到隊尾
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // 加到隊首
deque.offerFirst(1)

/* 讀取隊首與隊尾元素 */
val peekFirst = deque.peekFirst() // 隊首元素
val peekLast = deque.peekLast() // 隊尾元素

/* 從雙端佇列取出元素 */
val popFirst = deque.pollFirst() // 從隊首取出元素
val popLast = deque.pollLast() // 從隊尾取出元素

/* 取得雙端佇列長度 */
val size = deque.size

/* 判斷雙端佇列是否為空 */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# 初始化雙端佇列
# Ruby 沒有內建雙端佇列，只能用 Array 來模擬
deque = []

# 將元素加入雙端佇列
deque << 2
deque << 5
deque << 4
# 請注意，Array 是陣列，因此 Array#unshift 的時間複雜度為 O(n)
deque.unshift(3)
deque.unshift(1)

# 讀取隊首與隊尾元素
peek_first = deque.first
peek_last = deque.last

# 從雙端佇列取出元素
# 請注意，Array 是陣列，因此 Array#shift 的時間複雜度為 O(n)
pop_front = deque.shift
pop_back = deque.pop

# 取得雙端佇列長度
size = deque.length

# 判斷雙端佇列是否為空
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%B0%87%E5%85%83%E7%B4%A0%E5%8A%A0%E5%85%A5%E4%BD%87%E5%88%97%0A%20%20%20%20deq.append%282%29%20%20%23%20%E5%8A%A0%E5%85%A5%E9%9A%8A%E5%B0%BE%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%E5%8A%A0%E5%85%A5%E9%9A%8A%E9%A6%96%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E9%9A%8A%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%9A%8A%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E9%9A%8A%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%9A%8A%E5%B0%BE%E5%85%83%E7%B4%A0%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%E5%BE%9E%E4%BD%87%E5%88%97%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%E5%8F%96%E5%87%BA%E9%9A%8A%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E5%BE%9E%E9%9A%8A%E9%A6%96%E5%8F%96%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%E5%BE%9E%E9%9A%8A%E9%A6%96%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%E5%BE%8C%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%E5%8F%96%E5%87%BA%E9%9A%8A%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E5%BE%9E%E9%9A%8A%E5%B0%BE%E5%8F%96%E5%87%BA%E7%9A%84%E5%85%83%E7%B4%A0%20%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%E5%BE%9E%E9%9A%8A%E5%B0%BE%E5%8F%96%E5%87%BA%E5%85%83%E7%B4%A0%E5%BE%8C%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E5%8F%96%E5%BE%97%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%E9%95%B7%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E9%9B%99%E7%AB%AF%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
