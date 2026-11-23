<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# 최소 힙 초기화
min_heap, flag = [], 1
# 최대 힙 초기화
max_heap, flag = [], -1

# Python의 heapq 모듈은 기본적으로 최소 힙을 구현한다
# 원소의 부호를 바꾸어 힙에 삽입하면 대소 관계가 뒤집히므로 최대 힙을 구현할 수 있다
# 이 예제에서 flag = 1은 최소 힙에, flag = -1은 최대 힙에 해당한다

# 힙에 원소 삽입
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# 힙의 루트 원소 반환
peek: int = flag * max_heap[0]  # 5

# 힙의 루트 원소 꺼내기
# 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
val = flag * heapq.heappop(max_heap)  # 5
val = flag * heapq.heappop(max_heap)  # 4
val = flag * heapq.heappop(max_heap)  # 3
val = flag * heapq.heappop(max_heap)  # 2
val = flag * heapq.heappop(max_heap)  # 1

# 힙 크기 반환
size: int = len(max_heap)

# 힙이 비어 있는지 판단
is_empty: bool = not max_heap

# 리스트를 입력하여 힙 구성
# 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* 힙 초기화 */
// 최소 힙 초기화
priority_queue<int, vector<int>, greater<int>> minHeap;
// 최대 힙 초기화
priority_queue<int, vector<int>, less<int>> maxHeap;

/* 힙에 원소 삽입 */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* 힙의 루트 원소 반환 */
int peek = maxHeap.top(); // 5

/* 힙의 루트 원소 꺼내기 */
// 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
maxHeap.pop(); // 5
maxHeap.pop(); // 4
maxHeap.pop(); // 3
maxHeap.pop(); // 2
maxHeap.pop(); // 1

/* 힙 크기 반환 */
int size = maxHeap.size();

/* 힙이 비어 있는지 판단 */
bool isEmpty = maxHeap.empty();

/* 리스트를 입력하여 힙 구성 */
// 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* 힙 초기화 */
// 최소 힙 초기화
Queue<Integer> minHeap = new PriorityQueue<>();
// 최대 힙 초기화(lambda 식으로 Comparator를 수정하면 된다)
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* 힙에 원소 삽입 */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* 힙의 루트 원소 반환 */
int peek = maxHeap.peek(); // 5

/* 힙의 루트 원소 꺼내기 */
// 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
peek = maxHeap.poll(); // 5
peek = maxHeap.poll(); // 4
peek = maxHeap.poll(); // 3
peek = maxHeap.poll(); // 2
peek = maxHeap.poll(); // 1

/* 힙 크기 반환 */
int size = maxHeap.size();

/* 힙이 비어 있는지 판단 */
boolean isEmpty = maxHeap.isEmpty();

/* 리스트를 입력하여 힙 구성 */
// 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* 힙 초기화 */
// 최소 힙 초기화
PriorityQueue<int, int> minHeap = new();
// 최대 힙 초기화(람다 식으로 Comparer를 변경하면 된다)
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* 힙에 원소 삽입 */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* 힙의 루트 원소 반환 */
int peek = maxHeap.Peek(); // 5

/* 힙의 루트 원소 꺼내기 */
// 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
peek = maxHeap.Dequeue(); // 5
peek = maxHeap.Dequeue(); // 4
peek = maxHeap.Dequeue(); // 3
peek = maxHeap.Dequeue(); // 2
peek = maxHeap.Dequeue(); // 1

/* 힙 크기 반환 */
int size = maxHeap.Count;

/* 힙이 비어 있는지 판단 */
bool isEmpty = maxHeap.Count == 0;

/* 리스트를 입력하여 힙 구성 */
// 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// Go에서는 heap.Interface를 구현하여 정수 최대 힙을 만들 수 있다
// heap.Interface를 구현하려면 sort.Interface도 구현해야 한다
type intHeap []any

// Push: heap.Interface의 함수로, 힙에 원소를 삽입한다
func (h *intHeap) Push(x any) {
    // Push와 Pop은 포인터 리시버(pointer receiver)를 매개변수로 사용한다
    // 슬라이스의 내용뿐 아니라 길이도 변경하기 때문이다.
    *h = append(*h, x.(int))
}

// Pop: heap.Interface의 함수로, 슬라이스의 마지막 원소를 꺼낸다(heap.Pop이 이미 힙의 루트 원소를 교환하여 맨 뒤로 옮겼다)
func (h *intHeap) Pop() any {
    // 꺼낼 원소는 맨 마지막에 저장되어 있다
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Len: sort.Interface의 함수
func (h *intHeap) Len() int {
    return len(*h)
}

// Less: sort.Interface의 함수
func (h *intHeap) Less(i, j int) bool {
    // 최소 힙을 구현하려면 부등호를 <로 바꾸어야 한다
    return (*h)[i].(int) > (*h)[j].(int)
}

// Swap: sort.Interface의 함수
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top: 힙의 루트 원소를 반환한다
func (h *intHeap) Top() any {
    return (*h)[0]
}

func TestHeap(t *testing.T) {
    /* 힙 초기화 */
    // 최대 힙 초기화
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* 힙에 원소 삽입 */
    // heap.Interface의 함수를 호출하여 원소를 추가한다
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 5)
    heap.Push(maxHeap, 4)

    /* 힙의 루트 원소 반환 */
    top := maxHeap.Top()
    fmt.Printf("힙의 루트 원소: %d\n", top)

    /* 힙의 루트 원소 꺼내기 */
    // heap.Interface의 함수를 호출하여 원소를 제거한다
    fmt.Printf("힙에서 꺼낸 원소: %d\n", heap.Pop(maxHeap)) // 5
    fmt.Printf("힙에서 꺼낸 원소: %d\n", heap.Pop(maxHeap)) // 4
    fmt.Printf("힙에서 꺼낸 원소: %d\n", heap.Pop(maxHeap)) // 3
    fmt.Printf("힙에서 꺼낸 원소: %d\n", heap.Pop(maxHeap)) // 2
    fmt.Printf("힙에서 꺼낸 원소: %d\n", heap.Pop(maxHeap)) // 1

    /* 힙 크기 반환 */
    size := len(*maxHeap)
    fmt.Printf("힙의 원소 개수: %d\n", size)

    /* 힙이 비어 있는지 판단 */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("힙이 비어 있는가: %t\n", isEmpty)
}
```

```swift title="heap.swift"
import HeapModule

/* 힙 초기화 */
// Swift의 Heap 타입은 최대 힙과 최소 힙을 모두 지원하며, swift-collections 패키지를 도입해야 한다
var heap = Heap<Int>()

/* 힙에 원소 삽입 */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* 힙의 루트 원소 반환 */
var peek = heap.max()

/* 힙의 루트 원소 꺼내기 */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* 힙 크기 반환 */
let size = heap.count

/* 힙이 비어 있는지 판단 */
let isEmpty = heap.isEmpty

/* 리스트를 입력하여 힙 구성 */
// 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
let heap2 = Heap([1, 3, 2, 5, 4])
```

```javascript title="heap.js"
// JavaScript는 내장 Heap 클래스를 제공하지 않는다
```

```typescript title="heap.ts"
// TypeScript는 내장 Heap 클래스를 제공하지 않는다
```

```dart title="heap.dart"
// Dart는 내장 Heap 클래스를 제공하지 않는다
```

```rust title="heap.rs"
use std::{cmp::Reverse, collections::BinaryHeap};

/* 힙 초기화 */
// 최소 힙 초기화
// Rust의 BinaryHeap은 최대 힙이며, 최소 힙을 만들려면 원소를 Reverse로 감싸야 한다
#[allow(unused_assignments)]
let mut min_heap = BinaryHeap::new();
// 최대 힙 초기화
let mut max_heap = BinaryHeap::new();

/* 힙에 원소 삽입 */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* 힙의 루트 원소 반환 */
let peek = max_heap.peek().unwrap(); // 5

/* 힙의 루트 원소 꺼내기 */
// 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
let peek = max_heap.pop().unwrap(); // 5
let peek = max_heap.pop().unwrap(); // 4
let peek = max_heap.pop().unwrap(); // 3
let peek = max_heap.pop().unwrap(); // 2
let peek = max_heap.pop().unwrap(); // 1

/* 힙 크기 반환 */
let size = max_heap.len();

/* 힙이 비어 있는지 판단 */
let is_empty = max_heap.is_empty();

/* 리스트를 입력하여 힙 구성 */
// 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// C는 내장 Heap 클래스를 제공하지 않는다
```

```kotlin title="heap.kt"
/* 힙 초기화 */
// 최소 힙 초기화
var minHeap = PriorityQueue<Int>()
// 최대 힙 초기화(lambda 식으로 Comparator를 수정하면 된다)
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* 힙에 원소 삽입 */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* 힙의 루트 원소 반환 */
var peek = maxHeap.peek() // 5

/* 힙의 루트 원소 꺼내기 */
// 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
peek = maxHeap.poll() // 5
peek = maxHeap.poll() // 4
peek = maxHeap.poll() // 3
peek = maxHeap.poll() // 2
peek = maxHeap.poll() // 1

/* 힙 크기 반환 */
val size = maxHeap.size

/* 힙이 비어 있는지 판단 */
val isEmpty = maxHeap.isEmpty()

/* 리스트를 입력하여 힙 구성 */
// 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# Ruby는 내장 Heap 클래스를 제공하지 않는다
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%EC%9D%98%20heapq%20%EB%AA%A8%EB%93%88%EC%9D%80%20%EA%B8%B0%EB%B3%B8%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EB%B6%80%ED%98%B8%EB%A5%BC%20%EB%B0%94%EA%BE%BC%20%EB%92%A4%20%EC%82%BD%EC%9E%85%ED%95%98%EB%A9%B4%20%EB%8C%80%EC%86%8C%20%EA%B4%80%EA%B3%84%EA%B0%80%20%EB%92%A4%EC%A7%91%ED%9E%88%EB%AF%80%EB%A1%9C%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%9D%B4%20%EC%98%88%EC%A0%9C%EC%97%90%EC%84%9C%20flag%20%3D%201%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%2C%20flag%20%3D%20-1%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%97%90%20%ED%95%B4%EB%8B%B9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20%23%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%EB%93%A4%EC%9D%80%20%ED%81%B0%20%EA%B0%92%EB%B6%80%ED%84%B0%20%EC%9E%91%EC%9D%80%20%EA%B0%92%20%EC%88%9C%EC%84%9C%EB%A1%9C%20%EB%82%98%EC%97%B4%EB%90%9C%EB%8B%A4%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%ED%81%AC%EA%B8%B0%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9E%85%EB%A0%A5%EB%B0%9B%EC%95%84%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20%23%20%EC%8B%9C%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%29%EC%9D%B4%EB%A9%B0%20O%28nlogn%29%EC%9D%B4%20%EC%95%84%EB%8B%88%EB%8B%A4%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
