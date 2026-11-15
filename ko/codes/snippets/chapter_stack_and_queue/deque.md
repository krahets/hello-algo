<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# 덱 초기화
deq: deque[int] = deque()

# 덱에 원소 삽입
deq.append(2)      # 맨 뒤에 추가
deq.append(5)
deq.append(4)
deq.appendleft(3)  # 맨 앞에 추가
deq.appendleft(1)

# 원소 접근
front: int = deq[0]  # 맨 앞 원소
rear: int = deq[-1]  # 맨 뒤 원소

# 덱에서 원소 꺼내기
pop_front: int = deq.popleft()  # 맨 앞 원소 꺼내기
pop_rear: int = deq.pop()       # 맨 뒤 원소 꺼내기

# 덱 길이 구하기
size: int = len(deq)

# 덱이 비어 있는지 확인
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* 덱 초기화 */
deque<int> deque;

/* 덱에 원소 삽입 */
deque.push_back(2);   // 맨 뒤에 추가
deque.push_back(5);
deque.push_back(4);
deque.push_front(3);  // 맨 앞에 추가
deque.push_front(1);

/* 원소 접근 */
int front = deque.front(); // 맨 앞 원소
int back = deque.back();   // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
deque.pop_front();  // 맨 앞 원소 꺼내기
deque.pop_back();   // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
int size = deque.size();

/* 덱이 비어 있는지 확인 */
bool empty = deque.empty();
```

```java title="deque.java"
/* 덱 초기화 */
Deque<Integer> deque = new LinkedList<>();

/* 덱에 원소 삽입 */
deque.offerLast(2);   // 맨 뒤에 추가
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3);  // 맨 앞에 추가
deque.offerFirst(1);

/* 원소 접근 */
int peekFirst = deque.peekFirst();  // 맨 앞 원소
int peekLast = deque.peekLast();    // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
int popFirst = deque.pollFirst();  // 맨 앞 원소 꺼내기
int popLast = deque.pollLast();    // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
int size = deque.size();

/* 덱이 비어 있는지 확인 */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* 덱 초기화 */
// C#에서는 연결 리스트 LinkedList를 덱으로 사용한다
LinkedList<int> deque = new();

/* 덱에 원소 삽입 */
deque.AddLast(2);   // 맨 뒤에 추가
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // 맨 앞에 추가
deque.AddFirst(1);

/* 원소 접근 */
int peekFirst = deque.First.Value;  // 맨 앞 원소
int peekLast = deque.Last.Value;    // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
deque.RemoveFirst();  // 맨 앞 원소 꺼내기
deque.RemoveLast();   // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
int size = deque.Count;

/* 덱이 비어 있는지 확인 */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* 덱 초기화 */
// Go에서는 list를 덱으로 사용한다
deque := list.New()

/* 덱에 원소 삽입 */
deque.PushBack(2)      // 맨 뒤에 추가
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3)     // 맨 앞에 추가
deque.PushFront(1)

/* 원소 접근 */
front := deque.Front() // 맨 앞 원소
rear := deque.Back()   // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
deque.Remove(front)    // 맨 앞 원소 꺼내기
deque.Remove(rear)     // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
size := deque.Len()

/* 덱이 비어 있는지 확인 */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* 덱 초기화 */
// Swift에는 내장 덱 클래스가 없으므로 Array를 덱으로 사용할 수 있다
var deque: [Int] = []

/* 덱에 원소 삽입 */
deque.append(2) // 맨 뒤에 추가
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // 맨 앞에 추가
deque.insert(1, at: 0)

/* 원소 접근 */
let peekFirst = deque.first! // 맨 앞 원소
let peekLast = deque.last! // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
// Array로 구현하면 popFirst의 복잡도는 O(n)이다
let popFirst = deque.removeFirst() // 맨 앞 원소 꺼내기
let popLast = deque.removeLast() // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
let size = deque.count

/* 덱이 비어 있는지 확인 */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* 덱 초기화 */
// JavaScript에는 내장 덱이 없으므로 Array를 덱으로 사용해야 한다
const deque = [];

/* 덱에 원소 삽입 */
deque.push(2);
deque.push(5);
deque.push(4);
// 배열이므로 unshift() 메서드의 시간 복잡도는 O(n)임에 주의
deque.unshift(3);
deque.unshift(1);

/* 원소 접근 */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* 덱에서 원소 꺼내기 */
// 배열이므로 shift() 메서드의 시간 복잡도는 O(n)임에 주의
const popFront = deque.shift();
const popBack = deque.pop();

/* 덱 길이 구하기 */
const size = deque.length;

/* 덱이 비어 있는지 확인 */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* 덱 초기화 */
// TypeScript에는 내장 덱이 없으므로 Array를 덱으로 사용해야 한다
const deque: number[] = [];

/* 덱에 원소 삽입 */
deque.push(2);
deque.push(5);
deque.push(4);
// 배열이므로 unshift() 메서드의 시간 복잡도는 O(n)임에 주의
deque.unshift(3);
deque.unshift(1);

/* 원소 접근 */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* 덱에서 원소 꺼내기 */
// 배열이므로 shift() 메서드의 시간 복잡도는 O(n)임에 주의
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* 덱 길이 구하기 */
const size: number = deque.length;

/* 덱이 비어 있는지 확인 */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* 덱 초기화 */
// Dart의 Queue는 덱으로 정의되어 있다
Queue<int> deque = Queue<int>();

/* 덱에 원소 삽입 */
deque.addLast(2);  // 맨 뒤에 추가
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 맨 앞에 추가
deque.addFirst(1);

/* 원소 접근 */
int peekFirst = deque.first; // 맨 앞 원소
int peekLast = deque.last;   // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
int popFirst = deque.removeFirst(); // 맨 앞 원소 꺼내기
int popLast = deque.removeLast();   // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
int size = deque.length;

/* 덱이 비어 있는지 확인 */
bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
/* 덱 초기화 */
let mut deque: VecDeque<u32> = VecDeque::new();

/* 덱에 원소 삽입 */
deque.push_back(2);  // 맨 뒤에 추가
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // 맨 앞에 추가
deque.push_front(1);

/* 원소 접근 */
if let Some(front) = deque.front() { // 맨 앞 원소
}
if let Some(rear) = deque.back() {   // 맨 뒤 원소
}

/* 덱에서 원소 꺼내기 */
if let Some(pop_front) = deque.pop_front() { // 맨 앞 원소 꺼내기
}
if let Some(pop_rear) = deque.pop_back() {   // 맨 뒤 원소 꺼내기
}

/* 덱 길이 구하기 */
let size = deque.len();

/* 덱이 비어 있는지 확인 */
let is_empty = deque.is_empty();
```

```c title="deque.c"
// C는 내장 덱을 제공하지 않는다
```

```kotlin title="deque.kt"
/* 덱 초기화 */
val deque = LinkedList<Int>()

/* 덱에 원소 삽입 */
deque.offerLast(2)  // 맨 뒤에 추가
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // 맨 앞에 추가
deque.offerFirst(1)

/* 원소 접근 */
val peekFirst = deque.peekFirst() // 맨 앞 원소
val peekLast = deque.peekLast()   // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
val popFirst = deque.pollFirst() // 맨 앞 원소 꺼내기
val popLast = deque.pollLast()   // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
val size = deque.size

/* 덱이 비어 있는지 확인 */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# 덱 초기화
# Ruby에는 내장 덱이 없으므로 Array를 덱으로 사용해야 한다
deque = []

# 덱에 원소 삽입
deque << 2
deque << 5
deque << 4
# 배열이므로 Array#unshift 메서드의 시간 복잡도는 O(n)임에 주의
deque.unshift(3)
deque.unshift(1)

# 원소 접근
peek_first = deque.first
peek_last = deque.last

# 덱에서 원소 꺼내기
# 배열이므로 Array#shift 메서드의 시간 복잡도는 O(n)임에 주의
pop_front = deque.shift
pop_back = deque.pop

# 덱 길이 구하기
size = deque.length

# 덱이 비어 있는지 확인
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%8D%B1%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20deq.append%282%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%EB%8D%B1%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
