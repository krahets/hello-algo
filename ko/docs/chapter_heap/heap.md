---
comments: true
---

# 8.1 &nbsp; 힙

<u>힙(heap)</u>은 특정 조건을 만족하는 완전 이진 트리로, 아래 그림(8-1)과 같이 크게 두 종류로 나뉜다.

- <u>최소 힙(min heap)</u>: 모든 노드의 값이 자식 노드의 값보다 작거나 같다($\leq$).
- <u>최대 힙(max heap)</u>: 모든 노드의 값이 자식 노드의 값보다 크거나 같다($\geq$).

![최소 힙과 최대 힙](heap.assets/min_heap_and_max_heap.png){ class="animation-figure" }

<p align="center"> 그림 8-1 &nbsp; 최소 힙과 최대 힙 </p>

힙은 완전 이진 트리의 특수한 형태이므로 다음 성질을 가진다.

- 가장 아래 레벨은 왼쪽부터 노드가 채워지며, 나머지 레벨은 모두 가득 차 있다.
- 이진 트리의 루트 노드를 '힙의 루트', 가장 아래 레벨에서 맨 오른쪽에 있는 노드를 '힙의 끝'이라고 한다.
- 최대 힙(최소 힙)에서는 힙의 루트 원소(루트 노드)의 값이 가장 크다(작다).

## 8.1.1 &nbsp; 힙의 주요 연산

많은 프로그래밍 언어에서 제공하는 것은 <u>우선순위 큐(priority queue)</u>라는 점을 알아 두자. 우선순위 큐는 우선순위에 따라 정렬되는 큐로 정의되는 추상 자료 구조다.

실제로 **힙은 보통 우선순위 큐를 구현하는 데 사용되며, 최대 힙은 원소를 큰 값부터 작은 값 순서로 꺼내는 우선순위 큐에 해당한다**. 사용하는 입장에서는 '우선순위 큐'와 '힙'을 동등한 자료 구조로 볼 수 있다. 따라서 이 책에서는 둘을 특별히 구분하지 않고 모두 '힙'이라고 한다.

힙의 주요 연산은 아래 표(8-1)와 같다. 메서드 이름은 프로그래밍 언어에 따라 달라진다.

<p align="center"> 표 8-1 &nbsp; 힙 연산의 효율 </p>

<div class="center-table" markdown>

| 메서드 이름 | 설명 | 시간 복잡도 |
| ----------- | ------------------------------------------------ | ----------- |
| `push()`    | 힙에 원소 삽입 | $O(\log n)$ |
| `pop()`     | 힙의 루트 원소 꺼내기 | $O(\log n)$ |
| `peek()`    | 힙의 루트 원소에 접근(최대 / 최소 힙에서는 각각 최댓값 / 최솟값) | $O(1)$      |
| `size()`    | 힙의 원소 수 구하기 | $O(1)$      |
| `isEmpty()` | 힙이 비어 있는지 확인 | $O(1)$      |

</div>

실제 응용에서는 프로그래밍 언어가 제공하는 힙 클래스(또는 우선순위 큐 클래스)를 바로 사용할 수 있다.

정렬 알고리즘에서 '오름차순 정렬'과 '내림차순 정렬'을 선택하듯이, `flag`를 설정하거나 `Comparator`를 수정하여 '최소 힙'과 '최대 힙'을 전환할 수 있다. 코드는 다음과 같다.

=== "Python"

    ```python title="heap.py"
    # 최소 힙 초기화
    min_heap, flag = [], 1
    # 최대 힙 초기화
    max_heap, flag = [], -1

    # Python의 heapq 모듈은 기본적으로 최소 힙을 구현한다
    # 원소의 부호를 바꾼 뒤 삽입하면 대소 관계가 뒤집히므로 최대 힙을 구현할 수 있다
    # 이 예제에서 flag = 1이면 최소 힙, flag = -1이면 최대 힙에 해당한다

    # 힙에 원소 삽입
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # 힙의 루트 원소 구하기
    peek: int = flag * max_heap[0] # 5

    # 힙의 루트 원소 꺼내기
    # 꺼낸 원소들은 큰 값부터 작은 값 순서로 나열된다
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # 힙의 크기 구하기
    size: int = len(max_heap)

    # 힙이 비어 있는지 확인
    is_empty: bool = not max_heap

    # 리스트를 입력받아 힙 구성
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    ```

=== "C++"

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

    /* 힙의 루트 원소 구하기 */
    int peek = maxHeap.top(); // 5

    /* 힙의 루트 원소 꺼내기 */
    // 꺼낸 원소들은 큰 값부터 작은 값 순서로 나열된다
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* 힙의 크기 구하기 */
    int size = maxHeap.size();

    /* 힙이 비어 있는지 확인 */
    bool isEmpty = maxHeap.empty();

    /* 리스트를 입력받아 힙 구성 */
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    ```

=== "Java"

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

    /* 힙의 루트 원소 구하기 */
    int peek = maxHeap.peek(); // 5

    /* 힙의 루트 원소 꺼내기 */
    // 꺼낸 원소들은 큰 값부터 작은 값 순서로 나열된다
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1

    /* 힙의 크기 구하기 */
    int size = maxHeap.size();

    /* 힙이 비어 있는지 확인 */
    boolean isEmpty = maxHeap.isEmpty();

    /* 리스트를 입력받아 힙 구성 */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C#"

    ```csharp title="heap.cs"
    /* 힙 초기화 */
    // 최소 힙 초기화
    PriorityQueue<int, int> minHeap = new();
    // 최대 힙 초기화(lambda 식으로 Comparer를 수정하면 된다)
    PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    /* 힙에 원소 삽입 */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* 힙의 루트 원소 구하기 */
    int peek = maxHeap.Peek();//5

    /* 힙의 루트 원소 꺼내기 */
    // 꺼낸 원소들은 큰 값부터 작은 값 순서로 나열된다
    peek = maxHeap.Dequeue();  // 5
    peek = maxHeap.Dequeue();  // 4
    peek = maxHeap.Dequeue();  // 3
    peek = maxHeap.Dequeue();  // 2
    peek = maxHeap.Dequeue();  // 1

    /* 힙의 크기 구하기 */
    int size = maxHeap.Count;

    /* 힙이 비어 있는지 확인 */
    bool isEmpty = maxHeap.Count == 0;

    /* 리스트를 입력받아 힙 구성 */
    minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
    ```

=== "Go"

    ```go title="heap.go"
    // Go에서는 heap.Interface를 구현하여 정수 최대 힙을 만들 수 있다
    // heap.Interface를 구현하려면 sort.Interface도 구현해야 한다
    type intHeap []any

    // Push는 heap.Interface의 메서드로, 힙에 원소를 삽입한다
    func (h *intHeap) Push(x any) {
        // Push와 Pop은 포인터 리시버(pointer receiver)를 매개변수로 사용한다
        // 슬라이스의 내용뿐 아니라 길이도 수정하기 때문이다.
        *h = append(*h, x.(int))
    }

    // Pop은 heap.Interface의 메서드로, 힙의 루트 원소를 꺼낸다
    func (h *intHeap) Pop() any {
        // 꺼낼 원소는 맨 끝에 저장되어 있다
        last := (*h)[len(*h)-1]
        *h = (*h)[:len(*h)-1]
        return last
    }

    // Len은 sort.Interface의 메서드다
    func (h *intHeap) Len() int {
        return len(*h)
    }

    // Less는 sort.Interface의 메서드다
    func (h *intHeap) Less(i, j int) bool {
        // 최소 힙을 구현하려면 부등호를 <로 바꿔야 한다
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap은 sort.Interface의 메서드다
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top은 힙의 루트 원소를 구한다
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    /* 실행 코드 */
    func TestHeap(t *testing.T) {
        /* 힙 초기화 */
        // 최대 힙 초기화
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* 힙에 원소 삽입 */
        // heap.Interface의 메서드를 호출하여 원소를 추가한다
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 4)
        heap.Push(maxHeap, 5)

        /* 힙의 루트 원소 구하기 */
        top := maxHeap.Top()
        fmt.Printf("힙의 루트 원소: %d\n", top)

        /* 힙의 루트 원소 꺼내기 */
        // heap.Interface의 메서드를 호출하여 원소를 제거한다
        heap.Pop(maxHeap) // 5
        heap.Pop(maxHeap) // 4
        heap.Pop(maxHeap) // 3
        heap.Pop(maxHeap) // 2
        heap.Pop(maxHeap) // 1

        /* 힙의 크기 구하기 */
        size := len(*maxHeap)
        fmt.Printf("힙의 원소 수: %d\n", size)

        /* 힙이 비어 있는지 확인 */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("힙이 비어 있는가: %t\n", isEmpty)
    }
    ```

=== "Swift"

    ```swift title="heap.swift"
    /* 힙 초기화 */
    // Swift의 Heap 타입은 최대 힙과 최소 힙을 모두 지원하며, swift-collections를 가져와야 한다
    var heap = Heap<Int>()

    /* 힙에 원소 삽입 */
    heap.insert(1)
    heap.insert(3)
    heap.insert(2)
    heap.insert(5)
    heap.insert(4)

    /* 힙의 루트 원소 구하기 */
    var peek = heap.max()!

    /* 힙의 루트 원소 꺼내기 */
    peek = heap.removeMax() // 5
    peek = heap.removeMax() // 4
    peek = heap.removeMax() // 3
    peek = heap.removeMax() // 2
    peek = heap.removeMax() // 1

    /* 힙의 크기 구하기 */
    let size = heap.count

    /* 힙이 비어 있는지 확인 */
    let isEmpty = heap.isEmpty

    /* 리스트를 입력받아 힙 구성 */
    let heap2 = Heap([1, 3, 2, 5, 4])
    ```

=== "JS"

    ```javascript title="heap.js"
    // JavaScript는 내장 Heap 클래스를 제공하지 않는다
    ```

=== "TS"

    ```typescript title="heap.ts"
    // TypeScript는 내장 Heap 클래스를 제공하지 않는다
    ```

=== "Dart"

    ```dart title="heap.dart"
    // Dart는 내장 Heap 클래스를 제공하지 않는다
    ```

=== "Rust"

    ```rust title="heap.rs"
    use std::collections::BinaryHeap;
    use std::cmp::Reverse;

    /* 힙 초기화 */
    // 최소 힙 초기화
    let mut min_heap = BinaryHeap::<Reverse<i32>>::new();
    // 최대 힙 초기화
    let mut max_heap = BinaryHeap::new();

    /* 힙에 원소 삽입 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);

    /* 힙의 루트 원소 구하기 */
    let peek = max_heap.peek().unwrap();  // 5

    /* 힙의 루트 원소 꺼내기 */
    // 꺼낸 원소들은 큰 값부터 작은 값 순서로 나열된다
    let peek = max_heap.pop().unwrap();   // 5
    let peek = max_heap.pop().unwrap();   // 4
    let peek = max_heap.pop().unwrap();   // 3
    let peek = max_heap.pop().unwrap();   // 2
    let peek = max_heap.pop().unwrap();   // 1

    /* 힙의 크기 구하기 */
    let size = max_heap.len();

    /* 힙이 비어 있는지 확인 */
    let is_empty = max_heap.is_empty();

    /* 리스트를 입력받아 힙 구성 */
    let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    ```

=== "C"

    ```c title="heap.c"
    // C는 내장 Heap 클래스를 제공하지 않는다
    ```

=== "Kotlin"

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

    /* 힙의 루트 원소 구하기 */
    var peek = maxHeap.peek() // 5

    /* 힙의 루트 원소 꺼내기 */
    // 꺼낸 원소들은 큰 값부터 작은 값 순서로 나열된다
    peek = maxHeap.poll() // 5
    peek = maxHeap.poll() // 4
    peek = maxHeap.poll() // 3
    peek = maxHeap.poll() // 2
    peek = maxHeap.poll() // 1

    /* 힙의 크기 구하기 */
    val size = maxHeap.size

    /* 힙이 비어 있는지 확인 */
    val isEmpty = maxHeap.isEmpty()

    /* 리스트를 입력받아 힙 구성 */
    minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
    ```

=== "Ruby"

    ```ruby title="heap.rb"
    # Ruby는 내장 Heap 클래스를 제공하지 않는다
    ```

??? pythontutor "실행 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%EC%9D%98%20heapq%20%EB%AA%A8%EB%93%88%EC%9D%80%20%EA%B8%B0%EB%B3%B8%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EB%B6%80%ED%98%B8%EB%A5%BC%20%EB%B0%94%EA%BE%BC%20%EB%92%A4%20%EC%82%BD%EC%9E%85%ED%95%98%EB%A9%B4%20%EB%8C%80%EC%86%8C%20%EA%B4%80%EA%B3%84%EA%B0%80%20%EB%92%A4%EC%A7%91%ED%9E%88%EB%AF%80%EB%A1%9C%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%9D%B4%20%EC%98%88%EC%A0%9C%EC%97%90%EC%84%9C%20flag%20%3D%201%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%2C%20flag%20%3D%20-1%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%97%90%20%ED%95%B4%EB%8B%B9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20%23%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%EB%93%A4%EC%9D%80%20%ED%81%B0%20%EA%B0%92%EB%B6%80%ED%84%B0%20%EC%9E%91%EC%9D%80%20%EA%B0%92%20%EC%88%9C%EC%84%9C%EB%A1%9C%20%EB%82%98%EC%97%B4%EB%90%9C%EB%8B%A4%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%ED%81%AC%EA%B8%B0%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9E%85%EB%A0%A5%EB%B0%9B%EC%95%84%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%EC%9D%98%20heapq%20%EB%AA%A8%EB%93%88%EC%9D%80%20%EA%B8%B0%EB%B3%B8%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EB%B6%80%ED%98%B8%EB%A5%BC%20%EB%B0%94%EA%BE%BC%20%EB%92%A4%20%EC%82%BD%EC%9E%85%ED%95%98%EB%A9%B4%20%EB%8C%80%EC%86%8C%20%EA%B4%80%EA%B3%84%EA%B0%80%20%EB%92%A4%EC%A7%91%ED%9E%88%EB%AF%80%EB%A1%9C%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%9D%B4%20%EC%98%88%EC%A0%9C%EC%97%90%EC%84%9C%20flag%20%3D%201%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%2C%20flag%20%3D%20-1%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%97%90%20%ED%95%B4%EB%8B%B9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20%23%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%EB%93%A4%EC%9D%80%20%ED%81%B0%20%EA%B0%92%EB%B6%80%ED%84%B0%20%EC%9E%91%EC%9D%80%20%EA%B0%92%20%EC%88%9C%EC%84%9C%EB%A1%9C%20%EB%82%98%EC%97%B4%EB%90%9C%EB%8B%A4%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%ED%81%AC%EA%B8%B0%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9E%85%EB%A0%A5%EB%B0%9B%EC%95%84%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 8.1.2 &nbsp; 힙의 구현

아래에서는 최대 힙을 구현한다. 이를 최소 힙으로 바꾸려면 모든 대소 비교 조건을 반대로 바꾸면 된다(예를 들어 $\geq$를 $\leq$로 바꾼다). 관심 있는 독자는 직접 구현해 보자.

### 1. &nbsp; 힙의 저장과 표현

'이진 트리' 장에서 살펴보았듯이 완전 이진 트리는 배열로 표현하기에 매우 적합하다. 힙은 완전 이진 트리이므로 **배열을 사용하여 힙을 저장한다**.

배열로 이진 트리를 표현할 때 원소는 노드의 값을, 인덱스는 이진 트리에서 노드의 위치를 나타낸다. **노드 포인터는 인덱스 매핑 공식으로 구현한다**.

아래 그림(8-2)과 같이 인덱스 $i$가 주어지면 왼쪽 자식 노드의 인덱스는 $2i + 1$, 오른쪽 자식 노드의 인덱스는 $2i + 2$, 부모 노드의 인덱스는 $(i - 1) / 2$(내림 정수 나눗셈)이다. 인덱스가 범위를 벗어나면 빈 노드이거나 노드가 존재하지 않는다는 뜻이다.

![힙의 표현과 저장](heap.assets/representation_of_heap.png){ class="animation-figure" }

<p align="center"> 그림 8-2 &nbsp; 힙의 표현과 저장 </p>

나중에 편리하게 사용할 수 있도록 인덱스 매핑 공식을 함수로 만들 수 있다.

=== "Python"

    ```python title="my_heap.py"
    def left(self, i: int) -> int:
        """왼쪽 자식 노드의 인덱스 반환"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """오른쪽 자식 노드의 인덱스 반환"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """부모 노드의 인덱스 반환"""
        return (i - 1) // 2  # 나눗셈의 결과를 내림한다
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int parent(int i) {
        return (i - 1) / 2; // 나눗셈의 결과를 내림한다
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int parent(int i) {
        return (i - 1) / 2; // 나눗셈의 결과를 내림한다
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int Parent(int i) {
        return (i - 1) / 2; // 나눗셈의 결과를 내림한다
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    func (h *maxHeap) left(i int) int {
        return 2*i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    func (h *maxHeap) right(i int) int {
        return 2*i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    func (h *maxHeap) parent(i int) int {
        // 나눗셈의 결과를 내림한다
        return (i - 1) / 2
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    func parent(i: Int) -> Int {
        (i - 1) / 2 // 나눗셈의 결과를 내림한다
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 나눗셈의 결과를 내림한다
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 나눗셈의 결과를 내림한다
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    int _left(int i) {
      return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int _right(int i) {
      return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int _parent(int i) {
      return (i - 1) ~/ 2; // 나눗셈의 결과를 내림한다
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 나눗셈의 결과를 내림한다
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    int left(MaxHeap *maxHeap, int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    int right(MaxHeap *maxHeap, int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 반환 */
    int parent(MaxHeap *maxHeap, int i) {
        return (i - 1) / 2; // 내림
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 왼쪽 자식 노드의 인덱스 반환 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    fun parent(i: Int): Int {
        return (i - 1) / 2 // 나눗셈의 결과를 내림한다
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 왼쪽 자식 노드의 인덱스 반환 ###
    def left(i)
      2 * i + 1
    end

    ### 오른쪽 자식 노드의 인덱스 반환 ###
    def right(i)
      2 * i + 2
    end

    ### 부모 노드의 인덱스 반환 ###
    def parent(i)
      (i - 1) / 2     # 나눗셈의 결과를 내림한다
    end
    ```

### 2. &nbsp; 힙의 루트 원소에 접근

힙의 루트 원소는 이진 트리의 루트 노드, 즉 리스트의 첫 번째 원소다.

=== "Python"

    ```python title="my_heap.py"
    def peek(self) -> int:
        """힙의 루트 원소 접근"""
        return self.max_heap[0]
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 힙의 루트 원소 접근 */
    int peek() {
        return maxHeap[0];
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 힙의 루트 원소 접근 */
    int peek() {
        return maxHeap.get(0);
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 힙의 루트 원소 접근 */
    int Peek() {
        return maxHeap[0];
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 힙의 루트 원소 접근 */
    func (h *maxHeap) peek() any {
        return h.data[0]
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 힙의 루트 원소 접근 */
    func peek() -> Int {
        maxHeap[0]
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 힙의 루트 원소 접근 */
    peek() {
        return this.#maxHeap[0];
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 힙의 루트 원소 접근 */
    peek(): number {
        return this.maxHeap[0];
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 힙의 루트 원소 접근 */
    int peek() {
      return _maxHeap[0];
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 힙의 루트 원소 접근 */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 힙의 루트 원소 접근 */
    int peek(MaxHeap *maxHeap) {
        return maxHeap->data[0];
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 힙의 루트 원소 접근 */
    fun peek(): Int {
        return maxHeap[0]
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 힙의 루트 원소 접근 ###
    def peek
      @max_heap[0]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%EC%9D%80%20%EC%9D%B4%EB%AF%B8%20%EC%9C%A0%ED%9A%A8%ED%95%9C%20%ED%9E%99%EC%9D%B4%EB%9D%BC%EB%8A%94%20%EC%A0%90%EC%97%90%20%EC%A3%BC%EC%9D%98%ED%95%9C%EB%8B%A4%20%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EB%B0%98%ED%99%98%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%7Bpeek%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%EC%9D%80%20%EC%9D%B4%EB%AF%B8%20%EC%9C%A0%ED%9A%A8%ED%95%9C%20%ED%9E%99%EC%9D%B4%EB%9D%BC%EB%8A%94%20%EC%A0%90%EC%97%90%20%EC%A3%BC%EC%9D%98%ED%95%9C%EB%8B%A4%20%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EB%B0%98%ED%99%98%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%8A%94%20%7Bpeek%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 3. &nbsp; 힙에 원소 삽입

원소 `val`이 주어지면 먼저 힙의 끝에 추가한다. 추가한 `val`이 힙의 다른 원소보다 클 수 있으므로, 힙의 성립 조건이 깨질 수 있다. **따라서 삽입한 노드에서 루트 노드까지의 경로에 있는 노드들을 조정해야 한다**. 이 연산을 <u>힙 재정렬(heapify)</u>이라고 한다.

삽입한 노드부터 **아래에서 위로 힙을 재정렬**해 보자. 아래 그림(8-3)과 같이 삽입한 노드의 값과 부모 노드의 값을 비교하여 삽입한 노드가 더 크면 서로 바꾼다. 이 작업을 반복하여 아래에서 위로 힙의 노드들을 조정하고, 루트 노드를 지나거나 바꿀 필요가 없는 노드를 만나면 종료한다.

=== "<1>"
    ![힙에 원소를 삽입하는 단계](heap.assets/heap_push_step1.png){ class="animation-figure" }

=== "<2>"
    ![힙 삽입 2단계](heap.assets/heap_push_step2.png){ class="animation-figure" }

=== "<3>"
    ![힙 삽입 3단계](heap.assets/heap_push_step3.png){ class="animation-figure" }

=== "<4>"
    ![힙 삽입 4단계](heap.assets/heap_push_step4.png){ class="animation-figure" }

=== "<5>"
    ![힙 삽입 5단계](heap.assets/heap_push_step5.png){ class="animation-figure" }

=== "<6>"
    ![힙 삽입 6단계](heap.assets/heap_push_step6.png){ class="animation-figure" }

=== "<7>"
    ![힙 삽입 7단계](heap.assets/heap_push_step7.png){ class="animation-figure" }

=== "<8>"
    ![힙 삽입 8단계](heap.assets/heap_push_step8.png){ class="animation-figure" }

=== "<9>"
    ![힙 삽입 9단계](heap.assets/heap_push_step9.png){ class="animation-figure" }

<p align="center"> 그림 8-3 &nbsp; 힙에 원소를 삽입하는 단계 </p>

전체 노드 수가 $n$이면 트리의 높이는 $O(\log n)$이다. 따라서 힙 재정렬의 반복 횟수는 최대 $O(\log n)$이며, **힙에 원소를 삽입하는 연산의 시간 복잡도는 $O(\log n)$**이다. 코드는 다음과 같다.

=== "Python"

    ```python title="my_heap.py"
    def push(self, val: int):
        """힙에 원소 삽입"""
        # 노드 추가
        self.max_heap.append(val)
        # 아래에서 위로 힙을 재정렬한다
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """노드 i에서 시작하여 아래에서 위로 힙 재정렬"""
        while True:
            # 노드 i의 부모 노드를 구한다
            p = self.parent(i)
            # 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 두 노드를 교환한다
            self.swap(i, p)
            # 위쪽으로 힙 재정렬을 반복한다
            i = p
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 힙에 원소 삽입 */
    void push(int val) {
        // 노드 추가
        maxHeap.push_back(val);
        // 아래에서 위로 힙을 재정렬한다
        siftUp(size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void siftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 두 노드를 교환한다
            swap(maxHeap[i], maxHeap[p]);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 힙에 원소 삽입 */
    void push(int val) {
        // 노드 추가
        maxHeap.add(val);
        // 아래에서 위로 힙을 재정렬한다
        siftUp(size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void siftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 두 노드를 교환한다
            swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 힙에 원소 삽입 */
    void Push(int val) {
        // 노드 추가
        maxHeap.Add(val);
        // 아래에서 위로 힙을 재정렬한다
        SiftUp(Size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void SiftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = Parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 종료한다
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 두 노드를 교환한다
            Swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 힙에 원소 삽입 */
    func (h *maxHeap) push(val any) {
        // 노드 추가
        h.data = append(h.data, val)
        // 아래에서 위로 힙을 재정렬한다
        h.siftUp(len(h.data) - 1)
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    func (h *maxHeap) siftUp(i int) {
        for true {
            // 노드 i의 부모 노드를 구한다
            p := h.parent(i)
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if p < 0 || h.data[i].(int) <= h.data[p].(int) {
                break
            }
            // 두 노드를 교환한다
            h.swap(i, p)
            // 위쪽으로 힙 재정렬을 반복한다
            i = p
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 힙에 원소 삽입 */
    func push(val: Int) {
        // 노드 추가
        maxHeap.append(val)
        // 아래에서 위로 힙을 재정렬한다
        siftUp(i: size() - 1)
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    func siftUp(i: Int) {
        var i = i
        while true {
            // 노드 i의 부모 노드를 구한다
            let p = parent(i: i)
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 두 노드를 교환한다
            swap(i: i, j: p)
            // 위쪽으로 힙 재정렬을 반복한다
            i = p
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 힙에 원소 삽입 */
    push(val) {
        // 노드 추가
        this.#maxHeap.push(val);
        // 아래에서 위로 힙을 재정렬한다
        this.#siftUp(this.size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    #siftUp(i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            const p = this.#parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 두 노드를 교환한다
            this.#swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 힙에 원소 삽입 */
    push(val: number): void {
        // 노드 추가
        this.maxHeap.push(val);
        // 아래에서 위로 힙을 재정렬한다
        this.siftUp(this.size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    siftUp(i: number): void {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            const p = this.parent(i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 두 노드를 교환한다
            this.swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 힙에 원소 삽입 */
    void push(int val) {
      // 노드 추가
      _maxHeap.add(val);
      // 아래에서 위로 힙을 재정렬한다
      siftUp(size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void siftUp(int i) {
      while (true) {
        // 노드 i의 부모 노드를 구한다
        int p = _parent(i);
        // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
        if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
          break;
        }
        // 두 노드를 교환한다
        _swap(i, p);
        // 위쪽으로 힙 재정렬을 반복한다
        i = p;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 힙에 원소 삽입 */
    fn push(&mut self, val: i32) {
        // 노드 추가
        self.max_heap.push(val);
        // 아래에서 위로 힙을 재정렬한다
        self.sift_up(self.size() - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // 노드 i가 이미 힙의 루트이므로 힙 재정렬을 마친다
            if i == 0 {
                break;
            }
            // 노드 i의 부모 노드를 구한다
            let p = Self::parent(i);
            // 노드를 조정할 필요가 없으면 힙 재정렬을 마친다
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 두 노드를 교환한다
            self.swap(i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 힙에 원소 삽입 */
    void push(MaxHeap *maxHeap, int val) {
        // 기본적으로 이렇게 많은 노드를 추가해서는 안 된다
        if (maxHeap->size == MAX_SIZE) {
            printf("힙이 가득 찼다!");
            return;
        }
        // 노드 추가
        maxHeap->data[maxHeap->size] = val;
        maxHeap->size++;

        // 아래에서 위로 힙을 재정렬한다
        siftUp(maxHeap, maxHeap->size - 1);
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    void siftUp(MaxHeap *maxHeap, int i) {
        while (true) {
            // 노드 i의 부모 노드를 구한다
            int p = parent(maxHeap, i);
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
                break;
            }
            // 두 노드를 교환한다
            swap(maxHeap, i, p);
            // 위쪽으로 힙 재정렬을 반복한다
            i = p;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 힙에 원소 삽입 */
    fun push(_val: Int) {
        // 노드 추가
        maxHeap.add(_val)
        // 아래에서 위로 힙을 재정렬한다
        siftUp(size() - 1)
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    fun siftUp(it: Int) {
        // Kotlin의 함수 매개변수는 변경할 수 없으므로 임시 변수를 생성한다
        var i = it
        while (true) {
            // 노드 i의 부모 노드를 구한다
            val p = parent(i)
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 두 노드를 교환한다
            swap(i, p)
            // 위쪽으로 힙 재정렬을 반복한다
            i = p
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 힙에 원소 삽입 ###
    def push(val)
      # 노드 추가
      @max_heap << val
      # 아래에서 위로 힙을 재정렬한다
      sift_up(size - 1)
    end

    ### 노드 i에서 시작하여 아래에서 위로 힙 재정렬 ###
    def sift_up(i)
      loop do
        # 노드 i의 부모 노드를 구한다
        p = parent(i)
        # 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
        break if p < 0 || @max_heap[i] <= @max_heap[p]
        # 두 노드를 교환한다
        swap(i, p)
        # 위쪽으로 힙 재정렬을 반복한다
        i = p
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%B6%94%EA%B0%80%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EC%97%90%EC%84%9C%20%EC%9C%84%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%95%84%EB%9E%98%EC%97%90%EC%84%9C%20%EC%9C%84%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EB%84%98%EC%96%B4%EA%B0%80%EA%B1%B0%EB%82%98%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%88%98%EC%A0%95%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%A9%B4%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%9C%84%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%EC%9D%80%20%EC%9D%B4%EB%AF%B8%20%EC%9C%A0%ED%9A%A8%ED%95%9C%20%ED%9E%99%EC%9D%B4%EB%9D%BC%EB%8A%94%20%EC%A0%90%EC%97%90%20%EC%A3%BC%EC%9D%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%B6%94%EA%B0%80%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%EC%95%84%EB%9E%98%EC%97%90%EC%84%9C%20%EC%9C%84%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%95%84%EB%9E%98%EC%97%90%EC%84%9C%20%EC%9C%84%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EB%84%98%EC%96%B4%EA%B0%80%EA%B1%B0%EB%82%98%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%88%98%EC%A0%95%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%A9%B4%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%A7%88%EC%B9%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%9C%84%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%EC%9D%80%20%EC%9D%B4%EB%AF%B8%20%EC%9C%A0%ED%9A%A8%ED%95%9C%20%ED%9E%99%EC%9D%B4%EB%9D%BC%EB%8A%94%20%EC%A0%90%EC%97%90%20%EC%A3%BC%EC%9D%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 4. &nbsp; 힙의 루트 원소 꺼내기

힙의 루트 원소는 이진 트리의 루트 노드, 즉 리스트의 첫 번째 원소다. 리스트에서 첫 번째 원소를 바로 삭제하면 이진 트리의 모든 노드 인덱스가 바뀌어, 이후 힙 재정렬로 복구하기가 어려워진다. 원소 인덱스의 변화를 최소화하기 위해 다음 절차를 사용한다.

1. 힙의 루트 원소와 끝 원소를 교환한다(루트 노드와 맨 오른쪽 리프 노드를 교환한다).
2. 교환 후 리스트에서 힙의 끝 원소를 삭제한다(이미 교환했으므로 실제로 삭제되는 것은 원래의 루트 원소다).
3. 루트 노드부터 **위에서 아래로 힙을 재정렬**한다.

아래 그림(8-4)과 같이 **'위에서 아래로 힙 재정렬'은 '아래에서 위로 힙 재정렬'과 진행 방향이 반대다**. 루트 노드의 값을 두 자식 노드의 값과 비교하여, 더 큰 값을 가진 자식 노드와 루트 노드를 교환한다. 이 작업을 반복하며 리프 노드를 지나거나 교환할 필요가 없는 노드를 만나면 종료한다.

=== "<1>"
    ![힙의 루트 원소를 꺼내는 단계](heap.assets/heap_pop_step1.png){ class="animation-figure" }

=== "<2>"
    ![힙에서 꺼내기 2단계](heap.assets/heap_pop_step2.png){ class="animation-figure" }

=== "<3>"
    ![힙에서 꺼내기 3단계](heap.assets/heap_pop_step3.png){ class="animation-figure" }

=== "<4>"
    ![힙에서 꺼내기 4단계](heap.assets/heap_pop_step4.png){ class="animation-figure" }

=== "<5>"
    ![힙에서 꺼내기 5단계](heap.assets/heap_pop_step5.png){ class="animation-figure" }

=== "<6>"
    ![힙에서 꺼내기 6단계](heap.assets/heap_pop_step6.png){ class="animation-figure" }

=== "<7>"
    ![힙에서 꺼내기 7단계](heap.assets/heap_pop_step7.png){ class="animation-figure" }

=== "<8>"
    ![힙에서 꺼내기 8단계](heap.assets/heap_pop_step8.png){ class="animation-figure" }

=== "<9>"
    ![힙에서 꺼내기 9단계](heap.assets/heap_pop_step9.png){ class="animation-figure" }

=== "<10>"
    ![힙에서 꺼내기 10단계](heap.assets/heap_pop_step10.png){ class="animation-figure" }

<p align="center"> 그림 8-4 &nbsp; 힙의 루트 원소를 꺼내는 단계 </p>

원소 삽입과 마찬가지로 힙의 루트 원소를 꺼내는 연산의 시간 복잡도도 $O(\log n)$이다. 코드는 다음과 같다.

=== "Python"

    ```python title="my_heap.py"
    def pop(self) -> int:
        """힙에서 원소 꺼내기"""
        # 비어 있는 경우를 처리한다
        if self.is_empty():
            raise IndexError("힙이 비어 있다")
        # 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        self.swap(0, self.size() - 1)
        # 노드 삭제
        val = self.max_heap.pop()
        # 위에서 아래로 힙을 재정렬한다
        self.sift_down(0)
        # 힙의 루트 원소를 반환한다
        return val

    def sift_down(self, i: int):
        """노드 i에서 시작하여 위에서 아래로 힙 재정렬"""
        while True:
            # 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i:
                break
            # 두 노드를 교환한다
            self.swap(i, ma)
            # 아래쪽으로 힙 재정렬을 반복한다
            i = ma
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 힙에서 원소 꺼내기 */
    void pop() {
        // 비어 있는 경우를 처리한다
        if (isEmpty()) {
            throw out_of_range("힙이 비어 있다");
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 노드 삭제
        maxHeap.pop_back();
        // 위에서 아래로 힙을 재정렬한다
        siftDown(0);
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void siftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 힙에서 원소 꺼내기 */
    int pop() {
        // 비어 있는 경우를 처리한다
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(0, size() - 1);
        // 노드 삭제
        int val = maxHeap.remove(size() - 1);
        // 위에서 아래로 힙을 재정렬한다
        siftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void siftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i)
                break;
            // 두 노드를 교환한다
            swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 힙에서 원소 꺼내기 */
    int Pop() {
        // 비어 있는 경우를 처리한다
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        Swap(0, Size() - 1);
        // 노드 삭제
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 위에서 아래로 힙을 재정렬한다
        SiftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void SiftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 노드 i의 값이 가장 크거나 리프 노드를 넘어가면 힙 재정렬을 종료한다
            if (ma == i) break;
            // 두 노드를 교환한다
            Swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 힙에서 원소 꺼내기 */
    func (h *maxHeap) pop() any {
        // 비어 있는 경우를 처리한다
        if h.isEmpty() {
            fmt.Println("오류")
            return nil
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        h.swap(0, h.size()-1)
        // 노드 삭제
        val := h.data[len(h.data)-1]
        h.data = h.data[:len(h.data)-1]
        // 위에서 아래로 힙을 재정렬한다
        h.siftDown(0)

        // 힙의 루트 원소를 반환한다
        return val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    func (h *maxHeap) siftDown(i int) {
        for true {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 max로 표시한다
            l, r, max := h.left(i), h.right(i), i
            if l < h.size() && h.data[l].(int) > h.data[max].(int) {
                max = l
            }
            if r < h.size() && h.data[r].(int) > h.data[max].(int) {
                max = r
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if max == i {
                break
            }
            // 두 노드를 교환한다
            h.swap(i, max)
            // 아래쪽으로 힙 재정렬을 반복한다
            i = max
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 힙에서 원소 꺼내기 */
    func pop() -> Int {
        // 비어 있는 경우를 처리한다
        if isEmpty() {
            fatalError("힙이 비어 있다")
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(i: 0, j: size() - 1)
        // 노드 삭제
        let val = maxHeap.remove(at: size() - 1)
        // 위에서 아래로 힙을 재정렬한다
        siftDown(i: 0)
        // 힙의 루트 원소를 반환한다
        return val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    func siftDown(i: Int) {
        var i = i
        while true {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break
            }
            // 두 노드를 교환한다
            swap(i: i, j: ma)
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 힙에서 원소 꺼내기 */
    pop() {
        // 비어 있는 경우를 처리한다
        if (this.isEmpty()) throw new Error('힙이 비어 있다');
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        this.#swap(0, this.size() - 1);
        // 노드 삭제
        const val = this.#maxHeap.pop();
        // 위에서 아래로 힙을 재정렬한다
        this.#siftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    #siftDown(i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma === i) break;
            // 두 노드를 교환한다
            this.#swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 힙에서 원소 꺼내기 */
    pop(): number {
        // 비어 있는 경우를 처리한다
        if (this.isEmpty()) throw new RangeError('힙이 비어 있다.');
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        this.swap(0, this.size() - 1);
        // 노드 삭제
        const val = this.maxHeap.pop();
        // 위에서 아래로 힙을 재정렬한다
        this.siftDown(0);
        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    siftDown(i: number): void {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma === i) break;
            // 두 노드를 교환한다
            this.swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 힙에서 원소 꺼내기 */
    int pop() {
      // 비어 있는 경우를 처리한다
      if (isEmpty()) throw Exception('힙이 비어 있다');
      // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
      _swap(0, size() - 1);
      // 노드 삭제
      int val = _maxHeap.removeLast();
      // 위에서 아래로 힙을 재정렬한다
      siftDown(0);
      // 힙의 루트 원소를 반환한다
      return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void siftDown(int i) {
      while (true) {
        // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
        int l = _left(i);
        int r = _right(i);
        int ma = i;
        if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
        if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
        // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
        if (ma == i) break;
        // 두 노드를 교환한다
        _swap(i, ma);
        // 아래쪽으로 힙 재정렬을 반복한다
        i = ma;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 힙에서 원소 꺼내기 */
    fn pop(&mut self) -> i32 {
        // 비어 있는 경우를 처리한다
        if self.is_empty() {
            panic!("인덱스가 범위를 벗어났다");
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        self.swap(0, self.size() - 1);
        // 노드 삭제
        let val = self.max_heap.pop().unwrap();
        // 위에서 아래로 힙을 재정렬한다
        self.sift_down(0);
        // 힙의 루트 원소를 반환한다
        val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break;
            }
            // 두 노드를 교환한다
            self.swap(i, ma);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 힙에서 원소 꺼내기 */
    int pop(MaxHeap *maxHeap) {
        // 비어 있는 경우를 처리한다
        if (isEmpty(maxHeap)) {
            printf("힙이 비어 있다!");
            return INT_MAX;
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(maxHeap, 0, size(maxHeap) - 1);
        // 노드 삭제
        int val = maxHeap->data[maxHeap->size - 1];
        maxHeap->size--;
        // 위에서 아래로 힙을 재정렬한다
        siftDown(maxHeap, 0);

        // 힙의 루트 원소를 반환한다
        return val;
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    void siftDown(MaxHeap *maxHeap, int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 max로 표시한다
            int l = left(maxHeap, i);
            int r = right(maxHeap, i);
            int max = i;
            if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
                max = l;
            }
            if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
                max = r;
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (max == i) {
                break;
            }
            // 두 노드를 교환한다
            swap(maxHeap, i, max);
            // 아래쪽으로 힙 재정렬을 반복한다
            i = max;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 힙에서 원소 꺼내기 */
    fun pop(): Int {
        // 비어 있는 경우를 처리한다
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(0, size() - 1)
        // 노드 삭제
        val _val = maxHeap.removeAt(size() - 1)
        // 위에서 아래로 힙을 재정렬한다
        siftDown(0)
        // 힙의 루트 원소를 반환한다
        return _val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    fun siftDown(it: Int) {
        // Kotlin의 함수 매개변수는 변경할 수 없으므로 임시 변수를 생성한다
        var i = it
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i) break
            // 두 노드를 교환한다
            swap(i, ma)
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 힙에서 원소 꺼내기 ###
    def pop
      # 비어 있는 경우를 처리한다
      raise IndexError, "힙이 비어 있다" if is_empty?
      # 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
      swap(0, size - 1)
      # 노드 삭제
      val = @max_heap.pop
      # 위에서 아래로 힙을 재정렬한다
      sift_down(0)
      # 힙의 루트 원소를 반환한다
      val
    end

    ### 노드 i에서 시작하여 위에서 아래로 힙 재정렬 ###
    def sift_down(i)
      loop do
        # 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
        l, r, ma = left(i), right(i), i
        ma = l if l < size && @max_heap[l] > @max_heap[ma]
        ma = r if r < size && @max_heap[r] > @max_heap[ma]

        # 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
        break if ma == i

        # 두 노드를 교환한다
        swap(i, ma)
        # 아래쪽으로 힙 재정렬을 반복한다
        i = ma
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20self.max_heap%20%3D%20nums%0A%0A%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%20len%28self.max_heap%29%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%ED%9E%99%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%22%22%22%0A%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EB%A5%BC%20%EC%B2%98%EB%A6%AC%ED%95%9C%EB%8B%A4%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%99%80%20%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%28%EC%B2%AB%20%EC%9B%90%EC%86%8C%EC%99%80%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%29%0A%20%20self.swap%280,%20self.size%28%29%20-%201%29%0A%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AD%EC%A0%9C%0A%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%23%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20self.sift_down%280%29%0A%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20return%20val%0A%0A%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20while%20True%3A%0A%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B0%BE%EC%95%84%20ma%EB%A1%9C%20%ED%91%9C%EC%8B%9C%ED%95%9C%EB%8B%A4%0A%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20l%0A%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20r%0A%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%ED%9E%99%EC%9D%84%20%EB%8D%94%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20break%0A%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%23%20%EC%95%84%EB%9E%98%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%EC%9D%80%20%EC%9D%B4%EB%AF%B8%20%EC%9C%A0%ED%9A%A8%ED%95%9C%20%ED%9E%99%EC%9D%B4%EB%9D%BC%EB%8A%94%20%EC%A0%90%EC%97%90%20%EC%A3%BC%EC%9D%98%ED%95%9C%EB%8B%A4%0A%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%207,%206,%207,%206,%202,%201,%204,%203,%206,%202,%205%5D%29%0A%0A%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%22%22%22%EC%B5%9C%EB%8C%80%20%ED%9E%99%22%22%22%0A%0A%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B7%B8%EB%8C%80%EB%A1%9C%20%ED%9E%99%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%9C%EB%8B%A4%0A%20%20self.max_heap%20%3D%20nums%0A%0A%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%EB%B6%80%EB%AA%A8%20%EB%85%B8%EB%93%9C%EC%9D%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%EB%82%98%EB%88%97%EC%85%88%EC%9D%98%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EB%82%B4%EB%A6%BC%ED%95%9C%EB%8B%A4%0A%0A%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%22%22%22%0A%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%ED%9E%99%20%ED%81%AC%EA%B8%B0%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20return%20len%28self.max_heap%29%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%ED%9E%99%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%22%22%22%0A%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EB%A5%BC%20%EC%B2%98%EB%A6%AC%ED%95%9C%EB%8B%A4%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%23%20%EB%A3%A8%ED%8A%B8%20%EB%85%B8%EB%93%9C%EC%99%80%20%EA%B0%80%EC%9E%A5%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EB%A6%AC%ED%94%84%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%28%EC%B2%AB%20%EC%9B%90%EC%86%8C%EC%99%80%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9B%90%EC%86%8C%20%EA%B5%90%ED%99%98%29%0A%20%20self.swap%280,%20self.size%28%29%20-%201%29%0A%20%20%23%20%EB%85%B8%EB%93%9C%20%EC%82%AD%EC%A0%9C%0A%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%23%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%EC%9D%84%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20self.sift_down%280%29%0A%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20return%20val%0A%0A%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%22%22%22%EB%85%B8%EB%93%9C%20i%EC%97%90%EC%84%9C%20%EC%8B%9C%EC%9E%91%ED%95%98%EC%97%AC%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%95%84%EB%9E%98%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20while%20True%3A%0A%20%20%20%23%20%EB%85%B8%EB%93%9C%20i,%20l,%20r%20%EC%A4%91%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%B0%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EC%B0%BE%EC%95%84%20ma%EB%A1%9C%20%ED%91%9C%EC%8B%9C%ED%95%9C%EB%8B%A4%0A%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20l%0A%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20r%0A%20%20%20%23%20%EB%85%B8%EB%93%9C%20i%EC%9D%98%20%EA%B0%92%EC%9D%B4%20%EA%B0%80%EC%9E%A5%20%ED%81%AC%EA%B1%B0%EB%82%98%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20l,%20r%EC%9D%B4%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%ED%9E%99%EC%9D%84%20%EB%8D%94%20%EC%9E%AC%EC%A0%95%EB%A0%AC%ED%95%A0%20%ED%95%84%EC%9A%94%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20break%0A%20%20%20%23%20%EB%91%90%20%EB%85%B8%EB%93%9C%EB%A5%BC%20%EA%B5%90%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%23%20%EC%95%84%EB%9E%98%EC%AA%BD%EC%9C%BC%EB%A1%9C%20%ED%9E%99%20%EC%9E%AC%EC%A0%95%EB%A0%AC%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%EC%9D%80%20%EC%9D%B4%EB%AF%B8%20%EC%9C%A0%ED%9A%A8%ED%95%9C%20%ED%9E%99%EC%9D%B4%EB%9D%BC%EB%8A%94%20%EC%A0%90%EC%97%90%20%EC%A3%BC%EC%9D%98%ED%95%9C%EB%8B%A4%0A%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%207,%206,%207,%206,%202,%201,%204,%203,%206,%202,%205%5D%29%0A%0A%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 8.1.3 &nbsp; 힙의 주요 응용

- **우선순위 큐**: 힙은 우선순위 큐를 구현할 때 가장 먼저 고려하는 자료 구조다. 삽입과 꺼내기 연산의 시간 복잡도는 모두 $O(\log n)$이고, 힙 구성 연산은 $O(n)$으로 모두 매우 효율적이다.
- **힙 정렬**: 데이터가 주어지면 이를 이용해 힙을 만든 뒤 원소를 계속 꺼내어 정렬된 데이터를 얻을 수 있다. 다만 힙 정렬은 보통 더 간결한 방법으로 구현한다. 자세한 내용은 '힙 정렬' 절을 참고하자.
- **가장 큰 $k$ 개 원소 구하기**: 대표적인 알고리즘 문제이자 흔한 응용 사례다. 예를 들어 인기 상위 10개 뉴스를 웨이보의 인기 검색어로 선정하거나, 판매량 상위 10개 상품을 고를 때 사용할 수 있다.
