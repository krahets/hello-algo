<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# 큐 초기화
# Python에서는 보통 덱 클래스 deque를 큐로 사용한다
# queue.Queue()는 전용 큐 클래스이지만 사용이 불편하므로 권하지 않는다
que: deque[int] = deque()

# 큐에 원소 삽입
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# 큐의 맨 앞 원소에 접근
front: int = que[0]

# 큐에서 원소 꺼내기
pop: int = que.popleft()

# 큐 길이 구하기
size: int = len(que)

# 큐가 비어 있는지 확인
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* 큐 초기화 */
queue<int> queue;

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 큐의 맨 앞 원소에 접근 */
int front = queue.front();

/* 큐에서 원소 꺼내기 */
queue.pop();

/* 큐 길이 구하기 */
int size = queue.size();

/* 큐가 비어 있는지 확인 */
bool empty = queue.empty();
```

```java title="queue.java"
/* 큐 초기화 */
Queue<Integer> queue = new LinkedList<>();

/* 큐에 원소 삽입 */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* 큐의 맨 앞 원소에 접근 */
int peek = queue.peek();

/* 큐에서 원소 꺼내기 */
int pop = queue.poll();

/* 큐 길이 구하기 */
int size = queue.size();

/* 큐가 비어 있는지 확인 */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* 큐 초기화 */
Queue<int> queue = new();

/* 큐에 원소 삽입 */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* 큐의 맨 앞 원소에 접근 */
int peek = queue.Peek();

/* 큐에서 원소 꺼내기 */
int pop = queue.Dequeue();

/* 큐 길이 구하기 */
int size = queue.Count;

/* 큐가 비어 있는지 확인 */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* 큐 초기화 */
// Go에서는 list를 큐로 사용한다
queue := list.New()

/* 큐에 원소 삽입 */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* 큐의 맨 앞 원소에 접근 */
peek := queue.Front()

/* 큐에서 원소 꺼내기 */
pop := queue.Front()
queue.Remove(pop)

/* 큐 길이 구하기 */
size := queue.Len()

/* 큐가 비어 있는지 확인 */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* 큐 초기화 */
// Swift에는 내장 큐 클래스가 없으므로 Array를 큐로 사용할 수 있다
var queue: [Int] = []

/* 큐에 원소 삽입 */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* 큐의 맨 앞 원소에 접근 */
let peek = queue.first!

/* 큐에서 원소 꺼내기 */
// 배열이므로 removeFirst의 복잡도는 O(n)이다
let pop = queue.removeFirst()

/* 큐 길이 구하기 */
let size = queue.count

/* 큐가 비어 있는지 확인 */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* 큐 초기화 */
// JavaScript에는 내장 큐가 없으므로 Array를 큐로 사용할 수 있다
const queue = [];

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 큐의 맨 앞 원소에 접근 */
const peek = queue[0];

/* 큐에서 원소 꺼내기 */
// 기반이 배열이므로 shift() 메서드의 시간 복잡도는 O(n)이다
const pop = queue.shift();

/* 큐 길이 구하기 */
const size = queue.length;

/* 큐가 비어 있는지 확인 */
const empty = queue.length === 0;
```

```typescript title="queue.ts"
/* 큐 초기화 */
// TypeScript에는 내장 큐가 없으므로 Array를 큐로 사용할 수 있다
const queue: number[] = [];

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 큐의 맨 앞 원소에 접근 */
const peek = queue[0];

/* 큐에서 원소 꺼내기 */
// 기반이 배열이므로 shift() 메서드의 시간 복잡도는 O(n)이다
const pop = queue.shift();

/* 큐 길이 구하기 */
const size = queue.length;

/* 큐가 비어 있는지 확인 */
const empty = queue.length === 0;
```

```dart title="queue.dart"
/* 큐 초기화 */
// Dart의 Queue 클래스는 덱이며 일반 큐로도 사용할 수 있다
Queue<int> queue = Queue();

/* 큐에 원소 삽입 */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* 큐의 맨 앞 원소에 접근 */
int peek = queue.first;

/* 큐에서 원소 꺼내기 */
int pop = queue.removeFirst();

/* 큐 길이 구하기 */
int size = queue.length;

/* 큐가 비어 있는지 확인 */
bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
/* 덱 초기화 */
// Rust에서는 덱을 일반 큐로 사용한다
let mut deque: VecDeque<u32> = VecDeque::new();

/* 큐에 원소 삽입 */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* 큐의 맨 앞 원소에 접근 */
if let Some(front) = deque.front() {
}

/* 큐에서 원소 꺼내기 */
if let Some(pop) = deque.pop_front() {
}

/* 큐 길이 구하기 */
let size = deque.len();

/* 큐가 비어 있는지 확인 */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C는 내장 큐를 제공하지 않는다
```

```kotlin title="queue.kt"
/* 큐 초기화 */
val queue = LinkedList<Int>()

/* 큐에 원소 삽입 */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* 큐의 맨 앞 원소에 접근 */
val peek = queue.peek()

/* 큐에서 원소 꺼내기 */
val pop = queue.poll()

/* 큐 길이 구하기 */
val size = queue.size

/* 큐가 비어 있는지 확인 */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# 큐 초기화
# Ruby의 내장 큐(Thread::Queue)에는 peek와 순회 메서드가 없으므로 Array를 큐로 사용할 수 있다
queue = []

# 큐에 원소 삽입
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# 큐 원소에 접근
peek = queue.first

# 큐에서 원소 꺼내기
# 배열이므로 Array#shift 메서드의 시간 복잡도는 O(n)임에 주의
pop = queue.shift

# 큐 길이 구하기
size = queue.length

# 큐가 비어 있는지 확인
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%81%90%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20Python%EC%97%90%EC%84%9C%EB%8A%94%20%EB%B3%B4%ED%86%B5%20%EB%8D%B1%20%ED%81%B4%EB%9E%98%EC%8A%A4%20deque%EB%A5%BC%20%ED%81%90%EB%A1%9C%20%EC%82%AC%EC%9A%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20queue.Queue%28%29%EB%8A%94%20%EC%A0%84%EC%9A%A9%20%ED%81%90%20%ED%81%B4%EB%9E%98%EC%8A%A4%EC%9D%B4%EC%A7%80%EB%A7%8C%20%EC%82%AC%EC%9A%A9%EC%9D%B4%20%EB%B6%88%ED%8E%B8%ED%95%98%EB%8B%A4%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%ED%81%90%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%ED%81%90%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%ED%81%90%EC%9D%98%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%ED%81%90%EC%9D%98%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%ED%81%90%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%ED%81%90%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%ED%81%90%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%ED%81%90%EA%B0%80%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%ED%81%90%EA%B0%80%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
