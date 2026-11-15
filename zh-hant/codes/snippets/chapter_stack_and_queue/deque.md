<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# 初始化雙向佇列
deq: deque[int] = deque()

# 元素入列
deq.append(2)      # 新增至佇列尾
deq.append(5)
deq.append(4)
deq.appendleft(3)  # 新增至佇列首
deq.appendleft(1)

# 訪問元素
front: int = deq[0]  # 佇列首元素
rear: int = deq[-1]  # 佇列尾元素

# 元素出列
pop_front: int = deq.popleft()  # 佇列首元素出列
pop_rear: int = deq.pop()       # 佇列尾元素出列

# 獲取雙向佇列的長度
size: int = len(deq)

# 判斷雙向佇列是否為空
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* 初始化雙向佇列 */
deque<int> deque;

/* 元素入列 */
deque.push_back(2);   // 新增至佇列尾
deque.push_back(5);
deque.push_back(4);
deque.push_front(3);  // 新增至佇列首
deque.push_front(1);

/* 訪問元素 */
int front = deque.front(); // 佇列首元素
int back = deque.back();   // 佇列尾元素

/* 元素出列 */
deque.pop_front();  // 佇列首元素出列
deque.pop_back();   // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
int size = deque.size();

/* 判斷雙向佇列是否為空 */
bool empty = deque.empty();
```

```java title="deque.java"
/* 初始化雙向佇列 */
Deque<Integer> deque = new LinkedList<>();

/* 元素入列 */
deque.offerLast(2);   // 新增至佇列尾
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3);  // 新增至佇列首
deque.offerFirst(1);

/* 訪問元素 */
int peekFirst = deque.peekFirst();  // 佇列首元素
int peekLast = deque.peekLast();    // 佇列尾元素

/* 元素出列 */
int popFirst = deque.pollFirst();  // 佇列首元素出列
int popLast = deque.pollLast();    // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
int size = deque.size();

/* 判斷雙向佇列是否為空 */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* 初始化雙向佇列 */
// 在 C# 中，將鏈結串列 LinkedList 看作雙向佇列來使用
LinkedList<int> deque = new();

/* 元素入列 */
deque.AddLast(2);   // 新增至佇列尾
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // 新增至佇列首
deque.AddFirst(1);

/* 訪問元素 */
int peekFirst = deque.First.Value;  // 佇列首元素
int peekLast = deque.Last.Value;    // 佇列尾元素

/* 元素出列 */
deque.RemoveFirst();  // 佇列首元素出列
deque.RemoveLast();   // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
int size = deque.Count;

/* 判斷雙向佇列是否為空 */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* 初始化雙向佇列 */
// 在 Go 中，將 list 作為雙向佇列使用
deque := list.New()

/* 元素入列 */
deque.PushBack(2)      // 新增至佇列尾
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3)     // 新增至佇列首
deque.PushFront(1)

/* 訪問元素 */
front := deque.Front() // 佇列首元素
rear := deque.Back()   // 佇列尾元素

/* 元素出列 */
deque.Remove(front)    // 佇列首元素出列
deque.Remove(rear)     // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
size := deque.Len()

/* 判斷雙向佇列是否為空 */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* 初始化雙向佇列 */
// Swift 沒有內建的雙向佇列類別，可以把 Array 當作雙向佇列來使用
var deque: [Int] = []

/* 元素入列 */
deque.append(2) // 新增至佇列尾
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // 新增至佇列首
deque.insert(1, at: 0)

/* 訪問元素 */
let peekFirst = deque.first! // 佇列首元素
let peekLast = deque.last! // 佇列尾元素

/* 元素出列 */
// 使用 Array 模擬時 popFirst 的複雜度為 O(n)
let popFirst = deque.removeFirst() // 佇列首元素出列
let popLast = deque.removeLast() // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
let size = deque.count

/* 判斷雙向佇列是否為空 */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* 初始化雙向佇列 */
// JavaScript 沒有內建的雙端佇列，只能把 Array 當作雙端佇列來使用
const deque = [];

/* 元素入列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，由於是陣列，unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);

/* 訪問元素 */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* 元素出列 */
// 請注意，由於是陣列，shift() 方法的時間複雜度為 O(n)
const popFront = deque.shift();
const popBack = deque.pop();

/* 獲取雙向佇列的長度 */
const size = deque.length;

/* 判斷雙向佇列是否為空 */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* 初始化雙向佇列 */
// TypeScript 沒有內建的雙端佇列，只能把 Array 當作雙端佇列來使用
const deque: number[] = [];

/* 元素入列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，由於是陣列，unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);

/* 訪問元素 */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* 元素出列 */
// 請注意，由於是陣列，shift() 方法的時間複雜度為 O(n)
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* 獲取雙向佇列的長度 */
const size: number = deque.length;

/* 判斷雙向佇列是否為空 */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* 初始化雙向佇列 */
// 在 Dart 中，Queue 被定義為雙向佇列
Queue<int> deque = Queue<int>();

/* 元素入列 */
deque.addLast(2);  // 新增至佇列尾
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 新增至佇列首
deque.addFirst(1);

/* 訪問元素 */
int peekFirst = deque.first; // 佇列首元素
int peekLast = deque.last;   // 佇列尾元素

/* 元素出列 */
int popFirst = deque.removeFirst(); // 佇列首元素出列
int popLast = deque.removeLast();   // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
int size = deque.length;

/* 判斷雙向佇列是否為空 */
bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
/* 初始化雙向佇列 */
let mut deque: VecDeque<u32> = VecDeque::new();

/* 元素入列 */
deque.push_back(2);  // 新增至佇列尾
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // 新增至佇列首
deque.push_front(1);

/* 訪問元素 */
if let Some(front) = deque.front() { // 佇列首元素
}
if let Some(rear) = deque.back() {   // 佇列尾元素
}

/* 元素出列 */
if let Some(pop_front) = deque.pop_front() { // 佇列首元素出列
}
if let Some(pop_rear) = deque.pop_back() {   // 佇列尾元素出列
}

/* 獲取雙向佇列的長度 */
let size = deque.len();

/* 判斷雙向佇列是否為空 */
let is_empty = deque.is_empty();
```

```c title="deque.c"
// C 未提供內建雙向佇列
```

```kotlin title="deque.kt"
/* 初始化雙向佇列 */
val deque = LinkedList<Int>()

/* 元素入列 */
deque.offerLast(2)  // 新增至佇列尾
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // 新增至佇列首
deque.offerFirst(1)

/* 訪問元素 */
val peekFirst = deque.peekFirst() // 佇列首元素
val peekLast = deque.peekLast()   // 佇列尾元素

/* 元素出列 */
val popFirst = deque.pollFirst() // 佇列首元素出列
val popLast = deque.pollLast()   // 佇列尾元素出列

/* 獲取雙向佇列的長度 */
val size = deque.size

/* 判斷雙向佇列是否為空 */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# 初始化雙向佇列
# Ruby 沒有內直的雙端佇列，只能把 Array 當作雙端佇列來使用
deque = []

# 元素如隊
deque << 2
deque << 5
deque << 4
# 請注意，由於是陣列，Array#unshift 方法的時間複雜度為 O(n)
deque.unshift(3)
deque.unshift(1)

# 訪問元素
peek_first = deque.first
peek_last = deque.last

# 元素出列
# 請注意，由於是陣列， Array#shift 方法的時間複雜度為 O(n)
pop_front = deque.shift
pop_back = deque.pop

# 獲取雙向佇列的長度
size = deque.length

# 判斷雙向佇列是否為空
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%88%97%0A%20%20%20%20deq.append%282%29%20%20%23%20%E6%96%B0%E5%A2%9E%E8%87%B3%E4%BD%87%E5%88%97%E5%B0%BE%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%E6%96%B0%E5%A2%9E%E8%87%B3%E4%BD%87%E5%88%97%E9%A6%96%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E4%BD%87%E5%88%97%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E5%B0%BE%E5%85%83%E7%B4%A0%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E5%88%97%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%E5%87%BA%E5%88%97%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%A6%96%E5%87%BA%E5%88%97%E5%85%83%E7%B4%A0%20%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%A6%96%E5%87%BA%E5%88%97%E5%BE%8C%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%E4%BD%87%E5%88%97%E5%B0%BE%E5%85%83%E7%B4%A0%E5%87%BA%E5%88%97%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E5%B0%BE%E5%87%BA%E5%88%97%E5%85%83%E7%B4%A0%20%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E5%B0%BE%E5%87%BA%E5%88%97%E5%BE%8C%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%E9%95%B7%E5%BA%A6%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
