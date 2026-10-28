---
comments: true
---

# 5.3 &nbsp; 덱

큐에서는 맨 앞 원소를 삭제하거나 맨 뒤에 원소를 추가하는 것만 가능하다. 아래 그림(5-7)의 <u>덱(double-ended queue)</u>은 앞뒤 양쪽에서 원소를 추가하고 삭제할 수 있어 더 유연하다.

![덱의 연산](deque.assets/deque_operations.png){ class="animation-figure" }

<p align="center"> 그림 5-7 &nbsp; 덱의 연산 </p>

## 5.3.1 &nbsp; 덱의 기본 연산

덱의 기본 연산은 아래 표(5-3)와 같다. 구체적인 메서드 이름은 사용하는 프로그래밍 언어에 따라 정해진다.

<p align="center"> 표 5-3 &nbsp; 덱의 연산 효율 </p>

<div class="center-table" markdown>

| 메서드         | 설명             | 시간 복잡도 |
| -------------- | ---------------- | ---------- |
| `push_first()` | 맨 앞에 원소 추가 | $O(1)$     |
| `push_last()`  | 맨 뒤에 원소 추가 | $O(1)$     |
| `pop_first()`  | 맨 앞 원소 삭제     | $O(1)$     |
| `pop_last()`   | 맨 뒤 원소 삭제     | $O(1)$     |
| `peek_first()` | 맨 앞 원소에 접근     | $O(1)$     |
| `peek_last()`  | 맨 뒤 원소에 접근     | $O(1)$     |

</div>

마찬가지로 프로그래밍 언어가 제공하는 덱 클래스를 바로 사용할 수 있다.

=== "Python"

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

=== "C++"

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

=== "Java"

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

=== "C#"

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

=== "Go"

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

=== "Swift"

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

=== "JS"

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

=== "TS"

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

=== "Dart"

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

=== "Rust"

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

=== "C"

    ```c title="deque.c"
    // C는 내장 덱을 제공하지 않는다
    ```

=== "Kotlin"

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

=== "Ruby"

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

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%8D%B1%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20deq.append%282%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%EB%8D%B1%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%8D%B1%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20deq.append%282%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%EB%8D%B1%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 5.3.2 &nbsp; 덱 구현 *

덱의 구현은 큐와 비슷하며, 기반 자료 구조로 연결 리스트나 배열을 선택할 수 있다.

### 1. &nbsp; 이중 연결 리스트 기반 구현

앞 절에서는 일반적인 단일 연결 리스트로 큐를 구현했다. 머리 노드를 삭제하는 연산(큐에서 꺼내기)과 꼬리 노드 뒤에 새 노드를 추가하는 연산(큐에 삽입하기)을 쉽게 수행할 수 있기 때문이다.

덱에서는 앞과 뒤 모두 삽입과 꺼내기를 수행할 수 있다. 즉, 큐와 대칭되는 반대 방향의 연산도 구현해야 한다. 이를 위해 ‘이중 연결 리스트’를 덱의 기반 자료 구조로 사용한다.

아래 그림(5-8)과 같이 이중 연결 리스트의 머리 노드와 꼬리 노드를 덱의 맨 앞과 맨 뒤로 보고, 양 끝에서 노드를 추가하고 삭제하는 기능을 구현한다.

=== "<1>"
    ![연결 리스트 기반 덱의 삽입과 꺼내기](deque.assets/linkedlist_deque_step1.png){ class="animation-figure" }

=== "<2>"
    ![연결 리스트 기반 덱의 맨 뒤에 삽입](deque.assets/linkedlist_deque_step2_push_last.png){ class="animation-figure" }

=== "<3>"
    ![연결 리스트 기반 덱의 맨 앞에 삽입](deque.assets/linkedlist_deque_step3_push_first.png){ class="animation-figure" }

=== "<4>"
    ![연결 리스트 기반 덱의 맨 뒤에서 꺼내기](deque.assets/linkedlist_deque_step4_pop_last.png){ class="animation-figure" }

=== "<5>"
    ![연결 리스트 기반 덱의 맨 앞에서 꺼내기](deque.assets/linkedlist_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 그림 5-8 &nbsp; 연결 리스트 기반 덱의 삽입과 꺼내기 </p>

구현 코드는 다음과 같다.

=== "Python"

    ```python title="linkedlist_deque.py"
    class ListNode:
        """이중 연결 리스트 노드"""

        def __init__(self, val: int):
            """생성자"""
            self.val: int = val
            self.next: ListNode | None = None  # 다음 노드 참조
            self.prev: ListNode | None = None  # 이전 노드 참조

    class LinkedListDeque:
        """이중 연결 리스트로 구현한 덱"""

        def __init__(self):
            """생성자"""
            self._front: ListNode | None = None  # 머리 노드 front
            self._rear: ListNode | None = None  # 꼬리 노드 rear
            self._size: int = 0  # 덱의 길이

        def size(self) -> int:
            """덱의 길이 반환"""
            return self._size

        def is_empty(self) -> bool:
            """덱이 비어 있는지 판단"""
            return self._size == 0

        def push(self, num: int, is_front: bool):
            """큐 삽입 연산"""
            node = ListNode(num)
            # 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if self.is_empty():
                self._front = self._rear = node
            # 맨 앞에 삽입하는 연산
            elif is_front:
                # node를 연결 리스트의 맨 앞에 추가한다
                self._front.prev = node
                node.next = self._front
                self._front = node  # 머리 노드를 갱신한다
            # 맨 뒤에 삽입하는 연산
            else:
                # node를 연결 리스트의 맨 뒤에 추가한다
                self._rear.next = node
                node.prev = self._rear
                self._rear = node  # 꼬리 노드를 갱신한다
            self._size += 1  # 큐 길이를 갱신한다

        def push_first(self, num: int):
            """맨 앞에 삽입"""
            self.push(num, True)

        def push_last(self, num: int):
            """맨 뒤에 삽입"""
            self.push(num, False)

        def pop(self, is_front: bool) -> int:
            """큐에서 꺼내는 연산"""
            if self.is_empty():
                raise IndexError("덱이 비어 있다")
            # 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if self._size == 1:
                val: int = self._front.val
                self._front = None
                self._rear = None
            # 맨 앞에서 꺼내는 연산
            elif is_front:
                val: int = self._front.val  # 머리 노드의 값을 임시로 저장한다
                # 머리 노드를 삭제한다
                fnext: ListNode | None = self._front.next
                fnext.prev = None
                self._front.next = None
                self._front = fnext  # 머리 노드를 갱신한다
            # 맨 뒤에서 꺼내는 연산
            else:
                val: int = self._rear.val  # 꼬리 노드의 값을 임시로 저장한다
                # 꼬리 노드를 삭제한다
                rprev: ListNode | None = self._rear.prev
                rprev.next = None
                self._rear.prev = None
                self._rear = rprev  # 꼬리 노드를 갱신한다
            self._size -= 1  # 큐 길이를 갱신한다
            return val

        def pop_first(self) -> int:
            """맨 앞에서 꺼내기"""
            return self.pop(True)

        def pop_last(self) -> int:
            """맨 뒤에서 꺼내기"""
            return self.pop(False)

        def peek_first(self) -> int:
            """맨 앞 원소 접근"""
            if self.is_empty():
                raise IndexError("덱이 비어 있다")
            return self._front.val

        def peek_last(self) -> int:
            """맨 뒤 원소 접근"""
            if self.is_empty():
                raise IndexError("덱이 비어 있다")
            return self._rear.val

        def to_array(self) -> list[int]:
            """출력에 사용할 배열 반환"""
            node = self._front
            res = [0] * self.size()
            for i in range(self.size()):
                res[i] = node.val
                node = node.next
            return res
    ```

=== "C++"

    ```cpp title="linkedlist_deque.cpp"
    /* 이중 연결 리스트 노드 */
    struct DoublyListNode {
        int val;              // 노드 값
        DoublyListNode *next; // 다음 노드 포인터
        DoublyListNode *prev; // 이전 노드 포인터
        DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
        }
    };

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
      private:
        DoublyListNode *front, *rear; // 머리 노드 front, 꼬리 노드 rear
        int queSize = 0;              // 덱의 길이

      public:
        /* 생성자 */
        LinkedListDeque() : front(nullptr), rear(nullptr) {
        }

        /* 소멸자 */
        ~LinkedListDeque() {
            // 연결 리스트를 순회하며 노드를 삭제하여 메모리를 해제한다
            DoublyListNode *pre, *cur = front;
            while (cur != nullptr) {
                pre = cur;
                cur = cur->next;
                delete pre;
            }
        }

        /* 덱의 길이 반환 */
        int size() {
            return queSize;
        }

        /* 덱이 비어 있는지 판단 */
        bool isEmpty() {
            return size() == 0;
        }

        /* 큐 삽입 연산 */
        void push(int num, bool isFront) {
            DoublyListNode *node = new DoublyListNode(num);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (isEmpty())
                front = rear = node;
            // 맨 앞에 삽입하는 연산
            else if (isFront) {
                // node를 연결 리스트의 맨 앞에 추가한다
                front->prev = node;
                node->next = front;
                front = node; // 머리 노드를 갱신한다
            // 맨 뒤에 삽입하는 연산
            } else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                rear->next = node;
                node->prev = rear;
                rear = node; // 꼬리 노드를 갱신한다
            }
            queSize++; // 큐 길이를 갱신한다
        }

        /* 맨 앞에 삽입 */
        void pushFirst(int num) {
            push(num, true);
        }

        /* 맨 뒤에 삽입 */
        void pushLast(int num) {
            push(num, false);
        }

        /* 큐에서 꺼내는 연산 */
        int pop(bool isFront) {
            if (isEmpty())
                throw out_of_range("큐가 비어 있다");
            int val;
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (queSize == 1) {
                val = front->val;
                delete front; // 같은 노드를 가리키므로 하나만 해제하면 된다
                front = nullptr;
                rear = nullptr;
            }
            // 맨 앞에서 꺼내는 연산
            else if (isFront) {
                val = front->val; // 머리 노드의 값을 임시로 저장한다
                // 머리 노드를 삭제한다
                DoublyListNode *fNext = front->next;
                fNext->prev = nullptr;
                front->next = nullptr;
                delete front;
                front = fNext; // 머리 노드를 갱신한다
            // 맨 뒤에서 꺼내는 연산
            } else {
                val = rear->val; // 꼬리 노드의 값을 임시로 저장한다
                // 꼬리 노드를 삭제한다
                DoublyListNode *rPrev = rear->prev;
                rPrev->next = nullptr;
                rear->prev = nullptr;
                delete rear;
                rear = rPrev; // 꼬리 노드를 갱신한다
            }
            queSize--; // 큐 길이를 갱신한다
            return val;
        }

        /* 맨 앞에서 꺼내기 */
        int popFirst() {
            return pop(true);
        }

        /* 맨 뒤에서 꺼내기 */
        int popLast() {
            return pop(false);
        }

        /* 맨 앞 원소 접근 */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("덱이 비어 있다");
            return front->val;
        }

        /* 맨 뒤 원소 접근 */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("덱이 비어 있다");
            return rear->val;
        }

        /* 출력에 사용할 배열 반환 */
        vector<int> toVector() {
            DoublyListNode *node = front;
            vector<int> res(size());
            for (int i = 0; i < res.size(); i++) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_deque.java"
    /* 이중 연결 리스트 노드 */
    class ListNode {
        int val; // 노드 값
        ListNode next; // 다음 노드 참조
        ListNode prev; // 이전 노드 참조

        ListNode(int val) {
            this.val = val;
            prev = next = null;
        }
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
        private ListNode front, rear; // 머리 노드 front, 꼬리 노드 rear
        private int queSize = 0; // 덱의 길이

        public LinkedListDeque() {
            front = rear = null;
        }

        /* 덱의 길이 반환 */
        public int size() {
            return queSize;
        }

        /* 덱이 비어 있는지 판단 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 큐 삽입 연산 */
        private void push(int num, boolean isFront) {
            ListNode node = new ListNode(num);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (isEmpty())
                front = rear = node;
            // 맨 앞에 삽입하는 연산
            else if (isFront) {
                // node를 연결 리스트의 맨 앞에 추가한다
                front.prev = node;
                node.next = front;
                front = node; // 머리 노드를 갱신한다
            // 맨 뒤에 삽입하는 연산
            } else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                rear.next = node;
                node.prev = rear;
                rear = node; // 꼬리 노드를 갱신한다
            }
            queSize++; // 큐 길이를 갱신한다
        }

        /* 맨 앞에 삽입 */
        public void pushFirst(int num) {
            push(num, true);
        }

        /* 맨 뒤에 삽입 */
        public void pushLast(int num) {
            push(num, false);
        }

        /* 큐에서 꺼내는 연산 */
        private int pop(boolean isFront) {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            int val;
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (queSize == 1) {
                val = front.val;
                front = null;
                rear = null;
            }
            // 맨 앞에서 꺼내는 연산
            else if (isFront) {
                val = front.val; // 머리 노드의 값을 임시로 저장한다
                // 머리 노드를 삭제한다
                ListNode fNext = front.next;
                fNext.prev = null;
                front.next = null;
                front = fNext; // 머리 노드를 갱신한다
            // 맨 뒤에서 꺼내는 연산
            } else {
                val = rear.val; // 꼬리 노드의 값을 임시로 저장한다
                // 꼬리 노드를 삭제한다
                ListNode rPrev = rear.prev;
                rPrev.next = null;
                rear.prev = null;
                rear = rPrev; // 꼬리 노드를 갱신한다
            }
            queSize--; // 큐 길이를 갱신한다
            return val;
        }

        /* 맨 앞에서 꺼내기 */
        public int popFirst() {
            return pop(true);
        }

        /* 맨 뒤에서 꺼내기 */
        public int popLast() {
            return pop(false);
        }

        /* 맨 앞 원소 접근 */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* 맨 뒤 원소 접근 */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return rear.val;
        }

        /* 출력에 사용할 배열 반환 */
        public int[] toArray() {
            ListNode node = front;
            int[] res = new int[size()];
            for (int i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_deque.cs"
    /* 이중 연결 리스트 노드 */
    class ListNode(int val) {
        public int val = val;       // 노드 값
        public ListNode? next = null; // 다음 노드 참조
        public ListNode? prev = null; // 이전 노드 참조
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
        ListNode? front, rear; // 머리 노드 front, 꼬리 노드 rear
        int queSize = 0;      // 덱의 길이

        public LinkedListDeque() {
            front = null;
            rear = null;
        }

        /* 덱의 길이 반환 */
        public int Size() {
            return queSize;
        }

        /* 덱이 비어 있는지 판단 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 큐 삽입 연산 */
        void Push(int num, bool isFront) {
            ListNode node = new(num);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (IsEmpty()) {
                front = node;
                rear = node;
            }
            // 맨 앞에 삽입하는 연산
            else if (isFront) {
                // node를 연결 리스트의 맨 앞에 추가한다
                front!.prev = node;
                node.next = front;
                front = node; // 머리 노드를 갱신한다                           
            }
            // 맨 뒤에 삽입하는 연산
            else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                rear!.next = node;
                node.prev = rear;
                rear = node;  // 꼬리 노드를 갱신한다
            }

            queSize++; // 큐 길이를 갱신한다
        }

        /* 맨 앞에 삽입 */
        public void PushFirst(int num) {
            Push(num, true);
        }

        /* 맨 뒤에 삽입 */
        public void PushLast(int num) {
            Push(num, false);
        }

        /* 큐에서 꺼내는 연산 */
        int? Pop(bool isFront) {
            if (IsEmpty())
                throw new Exception();
            int? val;
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (queSize == 1) {
                val = front!.val;
                front = null;
                rear = null;
            }
            // 맨 앞에서 꺼내는 연산
            else if (isFront) {
                val = front!.val; // 머리 노드의 값을 임시로 저장한다
                // 머리 노드를 삭제한다
                ListNode? fNext = front?.next;
                fNext!.prev = null;
                front.next = null;
                front = fNext;   // 머리 노드를 갱신한다
            }
            // 맨 뒤에서 꺼내는 연산
            else {
                val = rear!.val;  // 꼬리 노드의 값을 임시로 저장한다
                // 꼬리 노드를 삭제한다
                ListNode? rPrev = rear?.prev;
                rPrev!.next = null;
                rear.prev = null;
                rear = rPrev;    // 꼬리 노드를 갱신한다
            }

            queSize--; // 큐 길이를 갱신한다
            return val;
        }

        /* 맨 앞에서 꺼내기 */
        public int? PopFirst() {
            return Pop(true);
        }

        /* 맨 뒤에서 꺼내기 */
        public int? PopLast() {
            return Pop(false);
        }

        /* 맨 앞 원소 접근 */
        public int? PeekFirst() {
            if (IsEmpty())
                throw new Exception();
            return front?.val;
        }

        /* 맨 뒤 원소 접근 */
        public int? PeekLast() {
            if (IsEmpty())
                throw new Exception();
            return rear?.val;
        }

        /* 출력에 사용할 배열 반환 */
        public int?[] ToArray() {
            ListNode? node = front;
            int?[] res = new int?[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node?.val;
                node = node?.next;
            }

            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_deque.go"
    /* 이중 연결 리스트로 구현한 덱 */
    type linkedListDeque struct {
        // 내장 패키지 list를 사용한다
        data *list.List
    }

    /* 덱 초기화 */
    func newLinkedListDeque() *linkedListDeque {
        return &linkedListDeque{
            data: list.New(),
        }
    }

    /* 맨 앞에 원소 삽입 */
    func (s *linkedListDeque) pushFirst(value any) {
        s.data.PushFront(value)
    }

    /* 맨 뒤에 원소 삽입 */
    func (s *linkedListDeque) pushLast(value any) {
        s.data.PushBack(value)
    }

    /* 맨 앞 원소를 꺼낸다 */
    func (s *linkedListDeque) popFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* 맨 뒤 원소를 꺼낸다 */
    func (s *linkedListDeque) popLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* 맨 앞 원소 접근 */
    func (s *linkedListDeque) peekFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* 맨 뒤 원소 접근 */
    func (s *linkedListDeque) peekLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* 큐의 길이 반환 */
    func (s *linkedListDeque) size() int {
        return s.data.Len()
    }

    /* 큐가 비어 있는지 판단 */
    func (s *linkedListDeque) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 출력에 사용할 List 반환 */
    func (s *linkedListDeque) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"
    /* 이중 연결 리스트 노드 */
    class ListNode {
        var val: Int // 노드 값
        var next: ListNode? // 다음 노드 참조
        weak var prev: ListNode? // 이전 노드 참조

        init(val: Int) {
            self.val = val
        }
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
        private var front: ListNode? // 머리 노드 front
        private var rear: ListNode? // 꼬리 노드 rear
        private var _size: Int // 덱의 길이

        init() {
            _size = 0
        }

        /* 덱의 길이 반환 */
        func size() -> Int {
            _size
        }

        /* 덱이 비어 있는지 판단 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 큐 삽입 연산 */
        private func push(num: Int, isFront: Bool) {
            let node = ListNode(val: num)
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if isEmpty() {
                front = node
                rear = node
            }
            // 맨 앞에 삽입하는 연산
            else if isFront {
                // node를 연결 리스트의 맨 앞에 추가한다
                front?.prev = node
                node.next = front
                front = node // 머리 노드를 갱신한다
            }
            // 맨 뒤에 삽입하는 연산
            else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                rear?.next = node
                node.prev = rear
                rear = node // 꼬리 노드를 갱신한다
            }
            _size += 1 // 큐 길이를 갱신한다
        }

        /* 맨 앞에 삽입 */
        func pushFirst(num: Int) {
            push(num: num, isFront: true)
        }

        /* 맨 뒤에 삽입 */
        func pushLast(num: Int) {
            push(num: num, isFront: false)
        }

        /* 큐에서 꺼내는 연산 */
        private func pop(isFront: Bool) -> Int {
            if isEmpty() {
                fatalError("덱이 비어 있다")
            }
            let val: Int
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if _size == 1 {
                val = front!.val
                front = nil
                rear = nil
            }
            // 맨 앞에서 꺼내는 연산
            else if isFront {
                val = front!.val // 머리 노드의 값을 임시로 저장한다
                // 머리 노드를 삭제한다
                let fNext = front?.next
                fNext?.prev = nil
                front?.next = nil
                front = fNext // 머리 노드를 갱신한다
            }
            // 맨 뒤에서 꺼내는 연산
            else {
                val = rear!.val // 꼬리 노드의 값을 임시로 저장한다
                // 꼬리 노드를 삭제한다
                let rPrev = rear?.prev
                rPrev?.next = nil
                rear?.prev = nil
                rear = rPrev // 꼬리 노드를 갱신한다
            }
            _size -= 1 // 큐 길이를 갱신한다
            return val
        }

        /* 맨 앞에서 꺼내기 */
        func popFirst() -> Int {
            pop(isFront: true)
        }

        /* 맨 뒤에서 꺼내기 */
        func popLast() -> Int {
            pop(isFront: false)
        }

        /* 맨 앞 원소 접근 */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("덱이 비어 있다")
            }
            return front!.val
        }

        /* 맨 뒤 원소 접근 */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("덱이 비어 있다")
            }
            return rear!.val
        }

        /* 출력에 사용할 배열 반환 */
        func toArray() -> [Int] {
            var node = front
            var res = Array(repeating: 0, count: size())
            for i in res.indices {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_deque.js"
    /* 이중 연결 리스트 노드 */
    class ListNode {
        prev; // 이전 노드 참조(포인터)
        next; // 다음 노드 참조(포인터)
        val; // 노드 값

        constructor(val) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
        #front; // 머리 노드 front
        #rear; // 꼬리 노드 rear
        #queSize; // 덱의 길이

        constructor() {
            this.#front = null;
            this.#rear = null;
            this.#queSize = 0;
        }

        /* 맨 뒤에 삽입하는 연산 */
        pushLast(val) {
            const node = new ListNode(val);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                this.#rear.next = node;
                node.prev = this.#rear;
                this.#rear = node; // 꼬리 노드를 갱신한다
            }
            this.#queSize++;
        }

        /* 맨 앞에 삽입하는 연산 */
        pushFirst(val) {
            const node = new ListNode(val);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // node를 연결 리스트의 맨 앞에 추가한다
                this.#front.prev = node;
                node.next = this.#front;
                this.#front = node; // 머리 노드를 갱신한다
            }
            this.#queSize++;
        }

        /* 맨 뒤에서 꺼내는 연산 */
        popLast() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#rear.val; // 꼬리 노드의 값을 저장한다
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (this.#queSize === 1) {
                this.#front = null;
                this.#rear = null;
            }
            // 꼬리 노드를 삭제한다
            else {
                let temp = this.#rear.prev;
                temp.next = null;
                this.#rear.prev = null;
                this.#rear = temp; // 꼬리 노드를 갱신한다
            }
            this.#queSize--;
            return value;
        }

        /* 맨 앞에서 꺼내는 연산 */
        popFirst() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#front.val; // 머리 노드의 값을 저장한다
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (this.#queSize === 1) {
                this.#front = null;
                this.#rear = null;
            }
            // 머리 노드를 삭제한다
            else {
                let temp = this.#front.next;
                temp.prev = null;
                this.#front.next = null;
                this.#front = temp; // 머리 노드를 갱신한다
            }
            this.#queSize--;
            return value;
        }

        /* 맨 뒤 원소 접근 */
        peekLast() {
            return this.#queSize === 0 ? null : this.#rear.val;
        }

        /* 맨 앞 원소 접근 */
        peekFirst() {
            return this.#queSize === 0 ? null : this.#front.val;
        }

        /* 덱의 길이 반환 */
        size() {
            return this.#queSize;
        }

        /* 덱이 비어 있는지 판단 */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 덱을 출력한다 */
        print() {
            const arr = [];
            let temp = this.#front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_deque.ts"
    /* 이중 연결 리스트 노드 */
    class ListNode {
        prev: ListNode; // 이전 노드 참조(포인터)
        next: ListNode; // 다음 노드 참조(포인터)
        val: number; // 노드 값

        constructor(val: number) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
        private front: ListNode; // 머리 노드 front
        private rear: ListNode; // 꼬리 노드 rear
        private queSize: number; // 덱의 길이

        constructor() {
            this.front = null;
            this.rear = null;
            this.queSize = 0;
        }

        /* 맨 뒤에 삽입하는 연산 */
        pushLast(val: number): void {
            const node: ListNode = new ListNode(val);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // 꼬리 노드를 갱신한다
            }
            this.queSize++;
        }

        /* 맨 앞에 삽입하는 연산 */
        pushFirst(val: number): void {
            const node: ListNode = new ListNode(val);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // node를 연결 리스트의 맨 앞에 추가한다
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // 머리 노드를 갱신한다
            }
            this.queSize++;
        }

        /* 맨 뒤에서 꺼내는 연산 */
        popLast(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.rear!.val; // 꼬리 노드의 값을 저장한다
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (this.queSize === 1) {
                this.front = null;
                this.rear = null;
            }
            // 꼬리 노드를 삭제한다
            else {
                let temp: ListNode = this.rear!.prev;
                temp!.next = null;
                this.rear!.prev = null;
                this.rear = temp; // 꼬리 노드를 갱신한다
            }
            this.queSize--;
            return value;
        }

        /* 맨 앞에서 꺼내는 연산 */
        popFirst(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.front.val; // 머리 노드의 값을 저장한다
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (this.queSize === 1) {
                this.front = null;
                this.rear = null;
            }
            // 머리 노드를 삭제한다
            else {
                let temp: ListNode = this.front!.next;
                temp!.prev = null;
                this.front!.next = null;
                this.front = temp; // 머리 노드를 갱신한다
            }
            this.queSize--;
            return value;
        }

        /* 맨 뒤 원소 접근 */
        peekLast(): number {
            return this.queSize === 0 ? null : this.rear.val;
        }

        /* 맨 앞 원소 접근 */
        peekFirst(): number {
            return this.queSize === 0 ? null : this.front.val;
        }

        /* 덱의 길이 반환 */
        size(): number {
            return this.queSize;
        }

        /* 덱이 비어 있는지 판단 */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 덱을 출력한다 */
        print(): void {
            const arr: number[] = [];
            let temp: ListNode = this.front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_deque.dart"
    /* 이중 연결 리스트 노드 */
    class ListNode {
      int val; // 노드 값
      ListNode? next; // 다음 노드 참조
      ListNode? prev; // 이전 노드 참조

      ListNode(this.val, {this.next, this.prev});
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
      late ListNode? _front; // 머리 노드 _front
      late ListNode? _rear; // 꼬리 노드 _rear
      int _queSize = 0; // 덱의 길이

      LinkedListDeque() {
        this._front = null;
        this._rear = null;
      }

      /* 덱의 길이 반환 */
      int size() {
        return this._queSize;
      }

      /* 덱이 비어 있는지 판단 */
      bool isEmpty() {
        return size() == 0;
      }

      /* 큐 삽입 연산 */
      void push(int _num, bool isFront) {
        final ListNode node = ListNode(_num);
        if (isEmpty()) {
          // 연결 리스트가 비어 있으면 _front와 _rear가 모두 node를 가리키게 한다
          _front = _rear = node;
        } else if (isFront) {
          // 맨 앞에 삽입하는 연산
          // node를 연결 리스트의 맨 앞에 추가한다
          _front!.prev = node;
          node.next = _front;
          _front = node; // 머리 노드를 갱신한다
        } else {
          // 맨 뒤에 삽입하는 연산
          // node를 연결 리스트의 맨 뒤에 추가한다
          _rear!.next = node;
          node.prev = _rear;
          _rear = node; // 꼬리 노드를 갱신한다
        }
        _queSize++; // 큐 길이를 갱신한다
      }

      /* 맨 앞에 삽입 */
      void pushFirst(int _num) {
        push(_num, true);
      }

      /* 맨 뒤에 삽입 */
      void pushLast(int _num) {
        push(_num, false);
      }

      /* 큐에서 꺼내는 연산 */
      int? pop(bool isFront) {
        // 큐가 비어 있으면 바로 null을 반환한다
        if (isEmpty()) {
          return null;
        }
        final int val;
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (_queSize == 1) {
          val = _front!.val;
          _front = null;
          _rear = null;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
          val = _front!.val; // 머리 노드의 값을 임시로 저장한다
          // 머리 노드를 삭제한다
          ListNode? fNext = _front!.next;
          fNext!.prev = null;
          _front!.next = null;
          _front = fNext; // 머리 노드를 갱신한다
        // 맨 뒤에서 꺼내는 연산
        } else {
          val = _rear!.val; // 꼬리 노드의 값을 임시로 저장한다
          // 꼬리 노드를 삭제한다
          ListNode? rPrev = _rear!.prev;
          rPrev!.next = null;
          _rear!.prev = null;
          _rear = rPrev; // 꼬리 노드를 갱신한다
        }
        _queSize--; // 큐 길이를 갱신한다
        return val;
      }

      /* 맨 앞에서 꺼내기 */
      int? popFirst() {
        return pop(true);
      }

      /* 맨 뒤에서 꺼내기 */
      int? popLast() {
        return pop(false);
      }

      /* 맨 앞 원소 접근 */
      int? peekFirst() {
        return _front?.val;
      }

      /* 맨 뒤 원소 접근 */
      int? peekLast() {
        return _rear?.val;
      }

      /* 출력에 사용할 배열 반환 */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> res = [];
        for (int i = 0; i < _queSize; i++) {
          res.add(node!.val);
          node = node.next;
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_deque.rs"
    /* 이중 연결 리스트 노드 */
    pub struct ListNode<T> {
        pub val: T,                                 // 노드 값
        pub next: Option<Rc<RefCell<ListNode<T>>>>, // 다음 노드 포인터
        pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 이전 노드 포인터
    }

    impl<T> ListNode<T> {
        pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
            Rc::new(RefCell::new(ListNode {
                val,
                next: None,
                prev: None,
            }))
        }
    }

    /* 이중 연결 리스트로 구현한 덱 */
    #[allow(dead_code)]
    pub struct LinkedListDeque<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>, // 머리 노드 front
        rear: Option<Rc<RefCell<ListNode<T>>>>,  // 꼬리 노드 rear
        que_size: usize,                         // 덱의 길이
    }

    impl<T: Copy> LinkedListDeque<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0,
            }
        }

        /* 덱의 길이 반환 */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* 덱이 비어 있는지 판단 */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* 큐 삽입 연산 */
        fn push(&mut self, num: T, is_front: bool) {
            let node = ListNode::new(num);
            // 맨 앞에 삽입하는 연산
            if is_front {
                match self.front.take() {
                    // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
                    None => {
                        self.rear = Some(node.clone());
                        self.front = Some(node);
                    }
                    // node를 연결 리스트의 맨 앞에 추가한다
                    Some(old_front) => {
                        old_front.borrow_mut().prev = Some(node.clone());
                        node.borrow_mut().next = Some(old_front);
                        self.front = Some(node); // 머리 노드를 갱신한다
                    }
                }
            }
            // 맨 뒤에 삽입하는 연산
            else {
                match self.rear.take() {
                    // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
                    None => {
                        self.front = Some(node.clone());
                        self.rear = Some(node);
                    }
                    // node를 연결 리스트의 맨 뒤에 추가한다
                    Some(old_rear) => {
                        old_rear.borrow_mut().next = Some(node.clone());
                        node.borrow_mut().prev = Some(old_rear);
                        self.rear = Some(node); // 꼬리 노드를 갱신한다
                    }
                }
            }
            self.que_size += 1; // 큐 길이를 갱신한다
        }

        /* 맨 앞에 삽입 */
        pub fn push_first(&mut self, num: T) {
            self.push(num, true);
        }

        /* 맨 뒤에 삽입 */
        pub fn push_last(&mut self, num: T) {
            self.push(num, false);
        }

        /* 큐에서 꺼내는 연산 */
        fn pop(&mut self, is_front: bool) -> Option<T> {
            // 큐가 비어 있으면 바로 None을 반환한다
            if self.is_empty() {
                return None;
            };
            // 맨 앞에서 꺼내는 연산
            if is_front {
                self.front.take().map(|old_front| {
                    match old_front.borrow_mut().next.take() {
                        Some(new_front) => {
                            new_front.borrow_mut().prev.take();
                            self.front = Some(new_front); // 머리 노드를 갱신한다
                        }
                        None => {
                            self.rear.take();
                        }
                    }
                    self.que_size -= 1; // 큐 길이를 갱신한다
                    old_front.borrow().val
                })
            }
            // 맨 뒤에서 꺼내는 연산
            else {
                self.rear.take().map(|old_rear| {
                    match old_rear.borrow_mut().prev.take() {
                        Some(new_rear) => {
                            new_rear.borrow_mut().next.take();
                            self.rear = Some(new_rear); // 꼬리 노드를 갱신한다
                        }
                        None => {
                            self.front.take();
                        }
                    }
                    self.que_size -= 1; // 큐 길이를 갱신한다
                    old_rear.borrow().val
                })
            }
        }

        /* 맨 앞에서 꺼내기 */
        pub fn pop_first(&mut self) -> Option<T> {
            return self.pop(true);
        }

        /* 맨 뒤에서 꺼내기 */
        pub fn pop_last(&mut self) -> Option<T> {
            return self.pop(false);
        }

        /* 맨 앞 원소 접근 */
        pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* 맨 뒤 원소 접근 */
        pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.rear.as_ref()
        }

        /* 출력에 사용할 배열 반환 */
        pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            let mut res: Vec<T> = Vec::new();
            fn recur<T: Copy>(cur: Option<&Rc<RefCell<ListNode<T>>>>, res: &mut Vec<T>) {
                if let Some(cur) = cur {
                    res.push(cur.borrow().val);
                    recur(cur.borrow().next.as_ref(), res);
                }
            }

            recur(head, &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="linkedlist_deque.c"
    /* 이중 연결 리스트 노드 */
    typedef struct DoublyListNode {
        int val;                     // 노드 값
        struct DoublyListNode *next; // 다음 노드
        struct DoublyListNode *prev; // 이전 노드
    } DoublyListNode;

    /* 생성자 */
    DoublyListNode *newDoublyListNode(int num) {
        DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
        new->val = num;
        new->next = NULL;
        new->prev = NULL;
        return new;
    }

    /* 소멸자 */
    void delDoublyListNode(DoublyListNode *node) {
        free(node);
    }

    /* 이중 연결 리스트로 구현한 덱 */
    typedef struct {
        DoublyListNode *front, *rear; // 머리 노드 front, 꼬리 노드 rear
        int queSize;                  // 덱의 길이
    } LinkedListDeque;

    /* 생성자 */
    LinkedListDeque *newLinkedListDeque() {
        LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
        deque->front = NULL;
        deque->rear = NULL;
        deque->queSize = 0;
        return deque;
    }

    /* 소멸자 */
    void delLinkedListdeque(LinkedListDeque *deque) {
        // 모든 노드를 해제한다
        for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
            DoublyListNode *tmp = deque->front;
            deque->front = deque->front->next;
            free(tmp);
        }
        // deque 구조체를 해제한다
        free(deque);
    }

    /* 큐의 길이 반환 */
    int size(LinkedListDeque *deque) {
        return deque->queSize;
    }

    /* 큐가 비어 있는지 판단 */
    bool empty(LinkedListDeque *deque) {
        return (size(deque) == 0);
    }

    /* 큐에 삽입 */
    void push(LinkedListDeque *deque, int num, bool isFront) {
        DoublyListNode *node = newDoublyListNode(num);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (empty(deque)) {
            deque->front = deque->rear = node;
        }
        // 맨 앞에 삽입하는 연산
        else if (isFront) {
            // node를 연결 리스트의 맨 앞에 추가한다
            deque->front->prev = node;
            node->next = deque->front;
            deque->front = node; // 머리 노드를 갱신한다
        }
        // 맨 뒤에 삽입하는 연산
        else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            deque->rear->next = node;
            node->prev = deque->rear;
            deque->rear = node;
        }
        deque->queSize++; // 큐 길이를 갱신한다
    }

    /* 맨 앞에 삽입 */
    void pushFirst(LinkedListDeque *deque, int num) {
        push(deque, num, true);
    }

    /* 맨 뒤에 삽입 */
    void pushLast(LinkedListDeque *deque, int num) {
        push(deque, num, false);
    }

    /* 맨 앞 원소 접근 */
    int peekFirst(LinkedListDeque *deque) {
        assert(size(deque) && deque->front);
        return deque->front->val;
    }

    /* 맨 뒤 원소 접근 */
    int peekLast(LinkedListDeque *deque) {
        assert(size(deque) && deque->rear);
        return deque->rear->val;
    }

    /* 큐에서 꺼내기 */
    int pop(LinkedListDeque *deque, bool isFront) {
        if (empty(deque))
            return -1;
        int val;
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (deque->queSize == 1) {
            val = deque->front->val;
            delDoublyListNode(deque->front); // 같은 노드를 가리키므로 하나만 해제하면 된다
            deque->front = NULL;
            deque->rear = NULL;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            val = peekFirst(deque); // 머리 노드의 값을 임시로 저장한다
            DoublyListNode *fNext = deque->front->next;
            fNext->prev = NULL;
            deque->front->next = NULL;
            delDoublyListNode(deque->front);
            deque->front = fNext; // 머리 노드를 갱신한다
        }
        // 맨 뒤에서 꺼내는 연산
        else {
            val = peekLast(deque); // 꼬리 노드의 값을 임시로 저장한다
            DoublyListNode *rPrev = deque->rear->prev;
            rPrev->next = NULL;
            deque->rear->prev = NULL;
            delDoublyListNode(deque->rear);
            deque->rear = rPrev; // 꼬리 노드를 갱신한다
        }
        deque->queSize--; // 큐 길이를 갱신한다
        return val;
    }

    /* 맨 앞에서 꺼내기 */
    int popFirst(LinkedListDeque *deque) {
        return pop(deque, true);
    }

    /* 맨 뒤에서 꺼내기 */
    int popLast(LinkedListDeque *deque) {
        return pop(deque, false);
    }

    /* 큐 출력 */
    void printLinkedListDeque(LinkedListDeque *deque) {
        int *arr = malloc(sizeof(int) * deque->queSize);
        // 연결 리스트의 데이터를 배열에 복사한다
        int i;
        DoublyListNode *node;
        for (i = 0, node = deque->front; i < deque->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, deque->queSize);
        free(arr);
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_deque.kt"
    /* 이중 연결 리스트 노드 */
    class ListNode(var _val: Int) {
        // 노드 값
        var next: ListNode? = null // 다음 노드 참조
        var prev: ListNode? = null // 이전 노드 참조
    }

    /* 이중 연결 리스트로 구현한 덱 */
    class LinkedListDeque {
        private var front: ListNode? = null // 머리 노드 front
        private var rear: ListNode? = null // 꼬리 노드 rear
        private var queSize: Int = 0 // 덱의 길이

        /* 덱의 길이 반환 */
        fun size(): Int {
            return queSize
        }

        /* 덱이 비어 있는지 판단 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* 큐 삽입 연산 */
        fun push(num: Int, isFront: Boolean) {
            val node = ListNode(num)
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (isEmpty()) {
                rear = node
                front = rear
                // 맨 앞에 삽입하는 연산
            } else if (isFront) {
                // node를 연결 리스트의 맨 앞에 추가한다
                front?.prev = node
                node.next = front
                front = node // 머리 노드를 갱신한다
                // 맨 뒤에 삽입하는 연산
            } else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                rear?.next = node
                node.prev = rear
                rear = node // 꼬리 노드를 갱신한다
            }
            queSize++ // 큐 길이를 갱신한다
        }

        /* 맨 앞에 삽입 */
        fun pushFirst(num: Int) {
            push(num, true)
        }

        /* 맨 뒤에 삽입 */
        fun pushLast(num: Int) {
            push(num, false)
        }

        /* 큐에서 꺼내는 연산 */
        fun pop(isFront: Boolean): Int {
            if (isEmpty()) 
                throw IndexOutOfBoundsException()
            val _val: Int
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (queSize == 1) {
                _val = front!!._val
                front = null
                rear = null
            }
            // 맨 앞에서 꺼내는 연산
            else if (isFront) {
                _val = front!!._val // 머리 노드의 값을 임시로 저장한다
                // 머리 노드를 삭제한다
                val fNext = front!!.next
                fNext!!.prev = null
                front!!.next = null
                front = fNext // 머리 노드를 갱신한다
                // 맨 뒤에서 꺼내는 연산
            } else {
                _val = rear!!._val // 꼬리 노드의 값을 임시로 저장한다
                // 꼬리 노드를 삭제한다
                val rPrev = rear!!.prev
                rPrev!!.next = null
                rear!!.prev = null
                rear = rPrev // 꼬리 노드를 갱신한다
            }
            queSize-- // 큐 길이를 갱신한다
            return _val
        }

        /* 맨 앞에서 꺼내기 */
        fun popFirst(): Int {
            return pop(true)
        }

        /* 맨 뒤에서 꺼내기 */
        fun popLast(): Int {
            return pop(false)
        }

        /* 맨 앞 원소 접근 */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* 맨 뒤 원소 접근 */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return rear!!._val
        }

        /* 출력에 사용할 배열 반환 */
        fun toArray(): IntArray {
            var node = front
            val res = IntArray(size())
            for (i in res.indices) {
                res[i] = node!!._val
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_deque.rb"
    =begin
    File: linkedlist_deque.rb
    Created Time: 2024-04-06
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    ### 이중 연결 리스트 노드
    class ListNode
      attr_accessor :val
      attr_accessor :next # 다음 노드 참조
      attr_accessor :prev # 이전 노드 참조

      ### 생성자 ###
      def initialize(val)
        @val = val
      end
    end

    ### 이중 연결 리스트로 구현한 덱 ###
    class LinkedListDeque
      ### 덱의 길이 반환 ###
      attr_reader :size

      ### 생성자 ###
      def initialize
        @front = nil  # 머리 노드 front
        @rear = nil   # 꼬리 노드 rear
        @size = 0     # 덱의 길이
      end

      ### 덱이 비어 있는지 판단 ###
      def is_empty?
        size.zero?
      end

      ### 큐 삽입 연산 ###
      def push(num, is_front)
        node = ListNode.new(num)
        # 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if is_empty?
          @front = @rear = node
        # 맨 앞에 삽입하는 연산
        elsif is_front
          # node를 연결 리스트의 맨 앞에 추가한다
          @front.prev = node
          node.next = @front
          @front = node # 머리 노드를 갱신한다
        # 맨 뒤에 삽입하는 연산
        else
          # node를 연결 리스트의 맨 뒤에 추가한다
          @rear.next = node
          node.prev = @rear
          @rear = node # 꼬리 노드를 갱신한다
        end
        @size += 1 # 큐 길이를 갱신한다
      end

      ### 맨 앞에 삽입 ###
      def push_first(num)
        push(num, true)
      end

      ### 맨 뒤에 삽입 ###
      def push_last(num)
        push(num, false)
      end

      ### 큐에서 꺼내는 연산 ###
      def pop(is_front)
        raise IndexError, '덱이 비어 있다' if is_empty?

        # 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if @size == 1
          val = @front.val
          @front = nil
          @rear = nil
        # 맨 앞에서 꺼내는 연산
        elsif is_front
          val = @front.val # 머리 노드의 값을 임시로 저장한다
          # 머리 노드를 삭제한다
          fnext = @front.next
          fnext.prev = nil
          @front.next = nil
          @front = fnext # 머리 노드를 갱신한다
        # 맨 뒤에서 꺼내는 연산
        else
          val = @rear.val # 꼬리 노드의 값을 임시로 저장한다
          # 꼬리 노드를 삭제한다
          rprev = @rear.prev
          rprev.next = nil
          @rear.prev = nil
          @rear = rprev # 꼬리 노드를 갱신한다
        end
        @size -= 1 # 큐 길이를 갱신한다

        val
      end

      ### 맨 앞에서 꺼내기 ###
      def pop_first
        pop(true)
      end

      ### 맨 앞에서 꺼내기 ###
      def pop_last
        pop(false)
      end

      ### 맨 앞 원소 접근 ###
      def peek_first
        raise IndexError, '덱이 비어 있다' if is_empty?

        @front.val
      end

      ### 맨 뒤 원소 접근 ###
      def peek_last
        raise IndexError, '덱이 비어 있다' if is_empty?

        @rear.val
      end

      ### 출력에 사용할 배열 반환 ###
      def to_array
        node = @front
        res = Array.new(size, 0)
        for i in 0...size
          res[i] = node.val
          node = node.next
        end
        res
      end
    end
    ```

### 2. &nbsp; 배열 기반 구현

아래 그림(5-9)과 같이 배열 기반 큐와 마찬가지로 원형 배열을 사용하여 덱을 구현할 수 있다.

=== "<1>"
    ![배열 기반 덱의 삽입과 꺼내기](deque.assets/array_deque_step1.png){ class="animation-figure" }

=== "<2>"
    ![배열 기반 덱의 맨 뒤에 삽입](deque.assets/array_deque_step2_push_last.png){ class="animation-figure" }

=== "<3>"
    ![배열 기반 덱의 맨 앞에 삽입](deque.assets/array_deque_step3_push_first.png){ class="animation-figure" }

=== "<4>"
    ![배열 기반 덱의 맨 뒤에서 꺼내기](deque.assets/array_deque_step4_pop_last.png){ class="animation-figure" }

=== "<5>"
    ![배열 기반 덱의 맨 앞에서 꺼내기](deque.assets/array_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 그림 5-9 &nbsp; 배열 기반 덱의 삽입과 꺼내기 </p>

큐 구현에 ‘맨 앞에 삽입하기’와 ‘맨 뒤에서 꺼내기’ 메서드만 추가하면 된다.

=== "Python"

    ```python title="array_deque.py"
    class ArrayDeque:
        """원형 배열로 구현한 덱"""

        def __init__(self, capacity: int):
            """생성자"""
            self._nums: list[int] = [0] * capacity
            self._front: int = 0
            self._size: int = 0

        def capacity(self) -> int:
            """덱의 용량 반환"""
            return len(self._nums)

        def size(self) -> int:
            """덱의 길이 반환"""
            return self._size

        def is_empty(self) -> bool:
            """덱이 비어 있는지 판단"""
            return self._size == 0

        def index(self, i: int) -> int:
            """원형 배열 인덱스 계산"""
            # 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            # i가 배열의 끝을 넘어가면 처음으로 돌아온다
            # i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + self.capacity()) % self.capacity()

        def push_first(self, num: int):
            """맨 앞에 삽입"""
            if self._size == self.capacity():
                print("덱이 가득 찼다")
                return
            # 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            # 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            self._front = self.index(self._front - 1)
            # num을 맨 앞에 추가한다
            self._nums[self._front] = num
            self._size += 1

        def push_last(self, num: int):
            """맨 뒤에 삽입"""
            if self._size == self.capacity():
                print("덱이 가득 찼다")
                return
            # 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            rear = self.index(self._front + self._size)
            # num을 맨 뒤에 추가한다
            self._nums[rear] = num
            self._size += 1

        def pop_first(self) -> int:
            """맨 앞에서 꺼내기"""
            num = self.peek_first()
            # 맨 앞 포인터를 뒤로 한 칸 이동한다
            self._front = self.index(self._front + 1)
            self._size -= 1
            return num

        def pop_last(self) -> int:
            """맨 뒤에서 꺼내기"""
            num = self.peek_last()
            self._size -= 1
            return num

        def peek_first(self) -> int:
            """맨 앞 원소 접근"""
            if self.is_empty():
                raise IndexError("덱이 비어 있다")
            return self._nums[self._front]

        def peek_last(self) -> int:
            """맨 뒤 원소 접근"""
            if self.is_empty():
                raise IndexError("덱이 비어 있다")
            # 마지막 원소의 인덱스를 계산한다
            last = self.index(self._front + self._size - 1)
            return self._nums[last]

        def to_array(self) -> list[int]:
            """출력에 사용할 배열 반환"""
            # 유효한 길이 범위 안의 리스트 원소만 변환한다
            res = []
            for i in range(self._size):
                res.append(self._nums[self.index(self._front + i)])
            return res
    ```

=== "C++"

    ```cpp title="array_deque.cpp"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
      private:
        vector<int> nums; // 덱의 원소를 저장하는 배열
        int front;        // 맨 앞 원소를 가리키는 맨 앞 포인터
        int queSize;      // 덱 길이

      public:
        /* 생성자 */
        ArrayDeque(int capacity) {
            nums.resize(capacity);
            front = queSize = 0;
        }

        /* 덱의 용량 반환 */
        int capacity() {
            return nums.size();
        }

        /* 덱의 길이 반환 */
        int size() {
            return queSize;
        }

        /* 덱이 비어 있는지 판단 */
        bool isEmpty() {
            return queSize == 0;
        }

        /* 원형 배열 인덱스 계산 */
        int index(int i) {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + capacity()) % capacity();
        }

        /* 맨 앞에 삽입 */
        void pushFirst(int num) {
            if (queSize == capacity()) {
                cout << "덱이 가득 찼다" << endl;
                return;
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            front = index(front - 1);
            // num을 맨 앞에 추가한다
            nums[front] = num;
            queSize++;
        }

        /* 맨 뒤에 삽입 */
        void pushLast(int num) {
            if (queSize == capacity()) {
                cout << "덱이 가득 찼다" << endl;
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            int rear = index(front + queSize);
            // num을 맨 뒤에 추가한다
            nums[rear] = num;
            queSize++;
        }

        /* 맨 앞에서 꺼내기 */
        int popFirst() {
            int num = peekFirst();
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 맨 뒤에서 꺼내기 */
        int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* 맨 앞 원소 접근 */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("덱이 비어 있다");
            return nums[front];
        }

        /* 맨 뒤 원소 접근 */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("덱이 비어 있다");
            // 마지막 원소의 인덱스를 계산한다
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 출력에 사용할 배열 반환 */
        vector<int> toVector() {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            vector<int> res(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="array_deque.java"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
        private int[] nums; // 덱의 원소를 저장하는 배열
        private int front; // 맨 앞 원소를 가리키는 맨 앞 포인터
        private int queSize; // 덱 길이

        /* 생성자 */
        public ArrayDeque(int capacity) {
            this.nums = new int[capacity];
            front = queSize = 0;
        }

        /* 덱의 용량 반환 */
        public int capacity() {
            return nums.length;
        }

        /* 덱의 길이 반환 */
        public int size() {
            return queSize;
        }

        /* 덱이 비어 있는지 판단 */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* 원형 배열 인덱스 계산 */
        private int index(int i) {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + capacity()) % capacity();
        }

        /* 맨 앞에 삽입 */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("덱이 가득 찼다");
                return;
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            front = index(front - 1);
            // num을 맨 앞에 추가한다
            nums[front] = num;
            queSize++;
        }

        /* 맨 뒤에 삽입 */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("덱이 가득 찼다");
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            int rear = index(front + queSize);
            // num을 맨 뒤에 추가한다
            nums[rear] = num;
            queSize++;
        }

        /* 맨 앞에서 꺼내기 */
        public int popFirst() {
            int num = peekFirst();
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 맨 뒤에서 꺼내기 */
        public int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* 맨 앞 원소 접근 */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* 맨 뒤 원소 접근 */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            // 마지막 원소의 인덱스를 계산한다
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 출력에 사용할 배열 반환 */
        public int[] toArray() {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_deque.cs"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
        int[] nums;  // 덱의 원소를 저장하는 배열
        int front;   // 맨 앞 원소를 가리키는 맨 앞 포인터
        int queSize; // 덱 길이

        /* 생성자 */
        public ArrayDeque(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 덱의 용량 반환 */
        int Capacity() {
            return nums.Length;
        }

        /* 덱의 길이 반환 */
        public int Size() {
            return queSize;
        }

        /* 덱이 비어 있는지 판단 */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* 원형 배열 인덱스 계산 */
        int Index(int i) {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + Capacity()) % Capacity();
        }

        /* 맨 앞에 삽입 */
        public void PushFirst(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("덱이 가득 찼다");
                return;
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            front = Index(front - 1);
            // num을 맨 앞에 추가한다
            nums[front] = num;
            queSize++;
        }

        /* 맨 뒤에 삽입 */
        public void PushLast(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("덱이 가득 찼다");
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            int rear = Index(front + queSize);
            // num을 맨 뒤에 추가한다
            nums[rear] = num;
            queSize++;
        }

        /* 맨 앞에서 꺼내기 */
        public int PopFirst() {
            int num = PeekFirst();
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            front = Index(front + 1);
            queSize--;
            return num;
        }

        /* 맨 뒤에서 꺼내기 */
        public int PopLast() {
            int num = PeekLast();
            queSize--;
            return num;
        }

        /* 맨 앞 원소 접근 */
        public int PeekFirst() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            return nums[front];
        }

        /* 맨 뒤 원소 접근 */
        public int PeekLast() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            // 마지막 원소의 인덱스를 계산한다
            int last = Index(front + queSize - 1);
            return nums[last];
        }

        /* 출력에 사용할 배열 반환 */
        public int[] ToArray() {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[Index(j)];
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_deque.go"
    /* 원형 배열로 구현한 덱 */
    type arrayDeque struct {
        nums        []int // 덱의 원소를 저장하는 배열
        front       int   // 맨 앞 원소를 가리키는 맨 앞 포인터
        queSize     int   // 덱 길이
        queCapacity int   // 큐 용량(저장할 수 있는 최대 원소 개수)
    }

    /* 큐 초기화 */
    func newArrayDeque(queCapacity int) *arrayDeque {
        return &arrayDeque{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* 덱의 길이 반환 */
    func (q *arrayDeque) size() int {
        return q.queSize
    }

    /* 덱이 비어 있는지 판단 */
    func (q *arrayDeque) isEmpty() bool {
        return q.queSize == 0
    }

    /* 원형 배열 인덱스 계산 */
    func (q *arrayDeque) index(i int) int {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + q.queCapacity) % q.queCapacity
    }

    /* 맨 앞에 삽입 */
    func (q *arrayDeque) pushFirst(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("덱이 가득 찼다")
            return
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        q.front = q.index(q.front - 1)
        // num을 맨 앞에 추가한다
        q.nums[q.front] = num
        q.queSize++
    }

    /* 맨 뒤에 삽입 */
    func (q *arrayDeque) pushLast(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("덱이 가득 찼다")
            return
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        rear := q.index(q.front + q.queSize)
        // num을 맨 뒤에 추가한다
        q.nums[rear] = num
        q.queSize++
    }

    /* 맨 앞에서 꺼내기 */
    func (q *arrayDeque) popFirst() any {
        num := q.peekFirst()
        if num == nil {
            return nil
        }
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        q.front = q.index(q.front + 1)
        q.queSize--
        return num
    }

    /* 맨 뒤에서 꺼내기 */
    func (q *arrayDeque) popLast() any {
        num := q.peekLast()
        if num == nil {
            return nil
        }
        q.queSize--
        return num
    }

    /* 맨 앞 원소 접근 */
    func (q *arrayDeque) peekFirst() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* 맨 뒤 원소 접근 */
    func (q *arrayDeque) peekLast() any {
        if q.isEmpty() {
            return nil
        }
        // 마지막 원소의 인덱스를 계산한다
        last := q.index(q.front + q.queSize - 1)
        return q.nums[last]
    }

    /* 출력에 사용할 Slice 반환 */
    func (q *arrayDeque) toSlice() []int {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        res := make([]int, q.queSize)
        for i, j := 0, q.front; i < q.queSize; i++ {
            res[i] = q.nums[q.index(j)]
            j++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="array_deque.swift"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
        private var nums: [Int] // 덱의 원소를 저장하는 배열
        private var front: Int // 맨 앞 원소를 가리키는 맨 앞 포인터
        private var _size: Int // 덱 길이

        /* 생성자 */
        init(capacity: Int) {
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* 덱의 용량 반환 */
        func capacity() -> Int {
            nums.count
        }

        /* 덱의 길이 반환 */
        func size() -> Int {
            _size
        }

        /* 덱이 비어 있는지 판단 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 원형 배열 인덱스 계산 */
        private func index(i: Int) -> Int {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            (i + capacity()) % capacity()
        }

        /* 맨 앞에 삽입 */
        func pushFirst(num: Int) {
            if size() == capacity() {
                print("덱이 가득 찼다")
                return
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            front = index(i: front - 1)
            // num을 맨 앞에 추가한다
            nums[front] = num
            _size += 1
        }

        /* 맨 뒤에 삽입 */
        func pushLast(num: Int) {
            if size() == capacity() {
                print("덱이 가득 찼다")
                return
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            let rear = index(i: front + size())
            // num을 맨 뒤에 추가한다
            nums[rear] = num
            _size += 1
        }

        /* 맨 앞에서 꺼내기 */
        func popFirst() -> Int {
            let num = peekFirst()
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            front = index(i: front + 1)
            _size -= 1
            return num
        }

        /* 맨 뒤에서 꺼내기 */
        func popLast() -> Int {
            let num = peekLast()
            _size -= 1
            return num
        }

        /* 맨 앞 원소 접근 */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("덱이 비어 있다")
            }
            return nums[front]
        }

        /* 맨 뒤 원소 접근 */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("덱이 비어 있다")
            }
            // 마지막 원소의 인덱스를 계산한다
            let last = index(i: front + size() - 1)
            return nums[last]
        }

        /* 출력에 사용할 배열 반환 */
        func toArray() -> [Int] {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            (front ..< front + size()).map { nums[index(i: $0)] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_deque.js"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
        #nums; // 덱의 원소를 저장하는 배열
        #front; // 맨 앞 원소를 가리키는 맨 앞 포인터
        #queSize; // 덱 길이

        /* 생성자 */
        constructor(capacity) {
            this.#nums = new Array(capacity);
            this.#front = 0;
            this.#queSize = 0;
        }

        /* 덱의 용량 반환 */
        capacity() {
            return this.#nums.length;
        }

        /* 덱의 길이 반환 */
        size() {
            return this.#queSize;
        }

        /* 덱이 비어 있는지 판단 */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 원형 배열 인덱스 계산 */
        index(i) {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + this.capacity()) % this.capacity();
        }

        /* 맨 앞에 삽입 */
        pushFirst(num) {
            if (this.#queSize === this.capacity()) {
                console.log('덱이 가득 찼다');
                return;
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            this.#front = this.index(this.#front - 1);
            // num을 맨 앞에 추가한다
            this.#nums[this.#front] = num;
            this.#queSize++;
        }

        /* 맨 뒤에 삽입 */
        pushLast(num) {
            if (this.#queSize === this.capacity()) {
                console.log('덱이 가득 찼다');
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            const rear = this.index(this.#front + this.#queSize);
            // num을 맨 뒤에 추가한다
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* 맨 앞에서 꺼내기 */
        popFirst() {
            const num = this.peekFirst();
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            this.#front = this.index(this.#front + 1);
            this.#queSize--;
            return num;
        }

        /* 맨 뒤에서 꺼내기 */
        popLast() {
            const num = this.peekLast();
            this.#queSize--;
            return num;
        }

        /* 맨 앞 원소 접근 */
        peekFirst() {
            if (this.isEmpty()) throw new Error('덱이 비어 있다.');
            return this.#nums[this.#front];
        }

        /* 맨 뒤 원소 접근 */
        peekLast() {
            if (this.isEmpty()) throw new Error('덱이 비어 있다.');
            // 마지막 원소의 인덱스를 계산한다
            const last = this.index(this.#front + this.#queSize - 1);
            return this.#nums[last];
        }

        /* 출력에 사용할 배열 반환 */
        toArray() {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            const res = [];
            for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
                res[i] = this.#nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_deque.ts"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
        private nums: number[]; // 덱의 원소를 저장하는 배열
        private front: number; // 맨 앞 원소를 가리키는 맨 앞 포인터
        private queSize: number; // 덱 길이

        /* 생성자 */
        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = 0;
            this.queSize = 0;
        }

        /* 덱의 용량 반환 */
        capacity(): number {
            return this.nums.length;
        }

        /* 덱의 길이 반환 */
        size(): number {
            return this.queSize;
        }

        /* 덱이 비어 있는지 판단 */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 원형 배열 인덱스 계산 */
        index(i: number): number {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + this.capacity()) % this.capacity();
        }

        /* 맨 앞에 삽입 */
        pushFirst(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('덱이 가득 찼다');
                return;
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            this.front = this.index(this.front - 1);
            // num을 맨 앞에 추가한다
            this.nums[this.front] = num;
            this.queSize++;
        }

        /* 맨 뒤에 삽입 */
        pushLast(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('덱이 가득 찼다');
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            const rear: number = this.index(this.front + this.queSize);
            // num을 맨 뒤에 추가한다
            this.nums[rear] = num;
            this.queSize++;
        }

        /* 맨 앞에서 꺼내기 */
        popFirst(): number {
            const num: number = this.peekFirst();
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            this.front = this.index(this.front + 1);
            this.queSize--;
            return num;
        }

        /* 맨 뒤에서 꺼내기 */
        popLast(): number {
            const num: number = this.peekLast();
            this.queSize--;
            return num;
        }

        /* 맨 앞 원소 접근 */
        peekFirst(): number {
            if (this.isEmpty()) throw new Error('덱이 비어 있다.');
            return this.nums[this.front];
        }

        /* 맨 뒤 원소 접근 */
        peekLast(): number {
            if (this.isEmpty()) throw new Error('덱이 비어 있다.');
            // 마지막 원소의 인덱스를 계산한다
            const last = this.index(this.front + this.queSize - 1);
            return this.nums[last];
        }

        /* 출력에 사용할 배열 반환 */
        toArray(): number[] {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            const res: number[] = [];
            for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
                res[i] = this.nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_deque.dart"
    /* 원형 배열로 구현한 덱 */
    class ArrayDeque {
      late List<int> _nums; // 덱의 원소를 저장하는 배열
      late int _front; // 맨 앞 원소를 가리키는 맨 앞 포인터
      late int _queSize; // 덱 길이

      /* 생성자 */
      ArrayDeque(int capacity) {
        this._nums = List.filled(capacity, 0);
        this._front = this._queSize = 0;
      }

      /* 덱의 용량 반환 */
      int capacity() {
        return _nums.length;
      }

      /* 덱의 길이 반환 */
      int size() {
        return _queSize;
      }

      /* 덱이 비어 있는지 판단 */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* 원형 배열 인덱스 계산 */
      int index(int i) {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + capacity()) % capacity();
      }

      /* 맨 앞에 삽입 */
      void pushFirst(int _num) {
        if (_queSize == capacity()) {
          throw Exception("덱이 가득 찼다");
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 사용하여 _front가 배열의 시작을 넘어가면 끝으로 돌아가게 한다
        _front = index(_front - 1);
        // _num을 맨 앞에 추가한다
        _nums[_front] = _num;
        _queSize++;
      }

      /* 맨 뒤에 삽입 */
      void pushLast(int _num) {
        if (_queSize == capacity()) {
          throw Exception("덱이 가득 찼다");
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        int rear = index(_front + _queSize);
        // _num을 맨 뒤에 추가한다
        _nums[rear] = _num;
        _queSize++;
      }

      /* 맨 앞에서 꺼내기 */
      int popFirst() {
        int _num = peekFirst();
        // 맨 앞 포인터를 오른쪽으로 한 칸 이동한다
        _front = index(_front + 1);
        _queSize--;
        return _num;
      }

      /* 맨 뒤에서 꺼내기 */
      int popLast() {
        int _num = peekLast();
        _queSize--;
        return _num;
      }

      /* 맨 앞 원소 접근 */
      int peekFirst() {
        if (isEmpty()) {
          throw Exception("덱이 비어 있다");
        }
        return _nums[_front];
      }

      /* 맨 뒤 원소 접근 */
      int peekLast() {
        if (isEmpty()) {
          throw Exception("덱이 비어 있다");
        }
        // 마지막 원소의 인덱스를 계산한다
        int last = index(_front + _queSize - 1);
        return _nums[last];
      }

      /* 출력에 사용할 배열 반환 */
      List<int> toArray() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[index(j)];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_deque.rs"
    /* 원형 배열로 구현한 덱 */
    struct ArrayDeque<T> {
        nums: Vec<T>,    // 덱의 원소를 저장하는 배열
        front: usize,    // 맨 앞 원소를 가리키는 맨 앞 포인터
        que_size: usize, // 덱 길이
    }

    impl<T: Copy + Default> ArrayDeque<T> {
        /* 생성자 */
        pub fn new(capacity: usize) -> Self {
            Self {
                nums: vec![T::default(); capacity],
                front: 0,
                que_size: 0,
            }
        }

        /* 덱의 용량 반환 */
        pub fn capacity(&self) -> usize {
            self.nums.len()
        }

        /* 덱의 길이 반환 */
        pub fn size(&self) -> usize {
            self.que_size
        }

        /* 덱이 비어 있는지 판단 */
        pub fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* 원형 배열 인덱스 계산 */
        fn index(&self, i: i32) -> usize {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            ((i + self.capacity() as i32) % self.capacity() as i32) as usize
        }

        /* 맨 앞에 삽입 */
        pub fn push_first(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("덱이 가득 찼다");
                return;
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            self.front = self.index(self.front as i32 - 1);
            // num을 맨 앞에 추가한다
            self.nums[self.front] = num;
            self.que_size += 1;
        }

        /* 맨 뒤에 삽입 */
        pub fn push_last(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("덱이 가득 찼다");
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            let rear = self.index(self.front as i32 + self.que_size as i32);
            // num을 맨 뒤에 추가한다
            self.nums[rear] = num;
            self.que_size += 1;
        }

        /* 맨 앞에서 꺼내기 */
        fn pop_first(&mut self) -> T {
            let num = self.peek_first();
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            self.front = self.index(self.front as i32 + 1);
            self.que_size -= 1;
            num
        }

        /* 맨 뒤에서 꺼내기 */
        fn pop_last(&mut self) -> T {
            let num = self.peek_last();
            self.que_size -= 1;
            num
        }

        /* 맨 앞 원소 접근 */
        fn peek_first(&self) -> T {
            if self.is_empty() {
                panic!("덱이 비어 있다")
            };
            self.nums[self.front]
        }

        /* 맨 뒤 원소 접근 */
        fn peek_last(&self) -> T {
            if self.is_empty() {
                panic!("덱이 비어 있다")
            };
            // 마지막 원소의 인덱스를 계산한다
            let last = self.index(self.front as i32 + self.que_size as i32 - 1);
            self.nums[last]
        }

        /* 출력에 사용할 배열 반환 */
        fn to_array(&self) -> Vec<T> {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            let mut res = vec![T::default(); self.que_size];
            let mut j = self.front;
            for i in 0..self.que_size {
                res[i] = self.nums[self.index(j as i32)];
                j += 1;
            }
            res
        }
    }
    ```

=== "C"

    ```c title="array_deque.c"
    /* 원형 배열로 구현한 덱 */
    typedef struct {
        int *nums;       // 큐의 원소를 저장하는 배열
        int front;       // 맨 앞 원소를 가리키는 맨 앞 포인터
        int queSize;     // 맨 뒤 포인터, 큐의 맨 뒤 + 1을 가리킨다
        int queCapacity; // 큐 용량
    } ArrayDeque;

    /* 생성자 */
    ArrayDeque *newArrayDeque(int capacity) {
        ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
        // 배열 초기화
        deque->queCapacity = capacity;
        deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
        deque->front = deque->queSize = 0;
        return deque;
    }

    /* 소멸자 */
    void delArrayDeque(ArrayDeque *deque) {
        free(deque->nums);
        free(deque);
    }

    /* 덱의 용량 반환 */
    int capacity(ArrayDeque *deque) {
        return deque->queCapacity;
    }

    /* 덱의 길이 반환 */
    int size(ArrayDeque *deque) {
        return deque->queSize;
    }

    /* 덱이 비어 있는지 판단 */
    bool empty(ArrayDeque *deque) {
        return deque->queSize == 0;
    }

    /* 원형 배열 인덱스 계산 */
    int dequeIndex(ArrayDeque *deque, int i) {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return ((i + capacity(deque)) % capacity(deque));
    }

    /* 맨 앞에 삽입 */
    void pushFirst(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("덱이 가득 찼다\r\n");
            return;
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산으로 front가 배열의 처음을 넘어가면 끝으로 돌아가게 한다
        deque->front = dequeIndex(deque, deque->front - 1);
        // num을 큐의 맨 앞에 추가한다
        deque->nums[deque->front] = num;
        deque->queSize++;
    }

    /* 맨 뒤에 삽입 */
    void pushLast(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("덱이 가득 찼다\r\n");
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        int rear = dequeIndex(deque, deque->front + deque->queSize);
        // num을 맨 뒤에 추가한다
        deque->nums[rear] = num;
        deque->queSize++;
    }

    /* 맨 앞 원소 접근 */
    int peekFirst(ArrayDeque *deque) {
        // 접근 예외: 덱이 비어 있다
        assert(empty(deque) == 0);
        return deque->nums[deque->front];
    }

    /* 맨 뒤 원소 접근 */
    int peekLast(ArrayDeque *deque) {
        // 접근 예외: 덱이 비어 있다
        assert(empty(deque) == 0);
        int last = dequeIndex(deque, deque->front + deque->queSize - 1);
        return deque->nums[last];
    }

    /* 맨 앞에서 꺼내기 */
    int popFirst(ArrayDeque *deque) {
        int num = peekFirst(deque);
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        deque->front = dequeIndex(deque, deque->front + 1);
        deque->queSize--;
        return num;
    }

    /* 맨 뒤에서 꺼내기 */
    int popLast(ArrayDeque *deque) {
        int num = peekLast(deque);
        deque->queSize--;
        return num;
    }

    /* 출력에 사용할 배열 반환 */
    int *toArray(ArrayDeque *deque, int *queSize) {
        *queSize = deque->queSize;
        int *res = (int *)calloc(deque->queSize, sizeof(int));
        int j = deque->front;
        for (int i = 0; i < deque->queSize; i++) {
            res[i] = deque->nums[j % deque->queCapacity];
            j++;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_deque.kt"
    /* 생성자 */
    class ArrayDeque(capacity: Int) {
        private var nums: IntArray = IntArray(capacity) // 덱의 원소를 저장하는 배열
        private var front: Int = 0 // 맨 앞 원소를 가리키는 맨 앞 포인터
        private var queSize: Int = 0 // 덱 길이

        /* 덱의 용량 반환 */
        fun capacity(): Int {
            return nums.size
        }

        /* 덱의 길이 반환 */
        fun size(): Int {
            return queSize
        }

        /* 덱이 비어 있는지 판단 */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* 원형 배열 인덱스 계산 */
        private fun index(i: Int): Int {
            // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
            // i가 배열의 끝을 넘어가면 처음으로 돌아온다
            // i가 배열의 처음을 넘어가면 끝으로 돌아온다
            return (i + capacity()) % capacity()
        }

        /* 맨 앞에 삽입 */
        fun pushFirst(num: Int) {
            if (queSize == capacity()) {
                println("덱이 가득 찼다")
                return
            }
            // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
            // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
            front = index(front - 1)
            // num을 맨 앞에 추가한다
            nums[front] = num
            queSize++
        }

        /* 맨 뒤에 삽입 */
        fun pushLast(num: Int) {
            if (queSize == capacity()) {
                println("덱이 가득 찼다")
                return
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            val rear = index(front + queSize)
            // num을 맨 뒤에 추가한다
            nums[rear] = num
            queSize++
        }

        /* 맨 앞에서 꺼내기 */
        fun popFirst(): Int {
            val num = peekFirst()
            // 맨 앞 포인터를 뒤로 한 칸 이동한다
            front = index(front + 1)
            queSize--
            return num
        }

        /* 맨 뒤에서 꺼내기 */
        fun popLast(): Int {
            val num = peekLast()
            queSize--
            return num
        }

        /* 맨 앞 원소 접근 */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* 맨 뒤 원소 접근 */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            // 마지막 원소의 인덱스를 계산한다
            val last = index(front + queSize - 1)
            return nums[last]
        }

        /* 출력에 사용할 배열 반환 */
        fun toArray(): IntArray {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            val res = IntArray(queSize)
            var i = 0
            var j = front
            while (i < queSize) {
                res[i] = nums[index(j)]
                i++
                j++
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_deque.rb"
    ### 원형 배열로 구현한 덱 ###
    class ArrayDeque
      ### 덱의 길이 반환 ###
      attr_reader :size

      ### 생성자 ###
      def initialize(capacity)
        @nums = Array.new(capacity, 0)
        @front = 0
        @size = 0
      end

      ### 덱의 용량 반환 ###
      def capacity
        @nums.length
      end

      ### 덱이 비어 있는지 판단 ###
      def is_empty?
        size.zero?
      end

      ### 맨 앞에 삽입 ###
      def push_first(num)
        if size == capacity
          puts '덱이 가득 찼다'
          return
        end

        # 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        # 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        @front = index(@front - 1)
        # num을 맨 앞에 추가한다
        @nums[@front] = num
        @size += 1
      end

      ### 맨 뒤에 삽입 ###
      def push_last(num)
        if size == capacity
          puts '덱이 가득 찼다'
          return
        end

        # 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        rear = index(@front + size)
        # num을 맨 뒤에 추가한다
        @nums[rear] = num
        @size += 1
      end

      ### 맨 앞에서 꺼내기 ###
      def pop_first
        num = peek_first
        # 맨 앞 포인터를 뒤로 한 칸 이동한다
        @front = index(@front + 1)
        @size -= 1
        num
      end

      ### 맨 뒤에서 꺼내기 ###
      def pop_last
        num = peek_last
        @size -= 1
        num
      end

      ### 맨 앞 원소 접근 ###
      def peek_first
        raise IndexError, '덱이 비어 있다' if is_empty?

        @nums[@front]
      end

      ### 맨 뒤 원소 접근 ###
      def peek_last
        raise IndexError, '덱이 비어 있다' if is_empty?

        # 마지막 원소의 인덱스를 계산한다
        last = index(@front + size - 1)
        @nums[last]
      end

      ### 출력에 사용할 배열 반환 ###
      def to_array
        # 유효한 길이 범위 안의 리스트 원소만 변환한다
        res = []
        for i in 0...size
          res << @nums[index(@front + i)]
        end
        res
      end

      private

      ### 원형 배열 인덱스 계산 ###
      def index(i)
        # 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        # i가 배열의 끝을 넘어가면 처음으로 돌아온다
        # i가 배열의 처음을 넘어가면 끝으로 돌아온다
        (i + capacity) % capacity
      end
    end
    ```

## 5.3.3 &nbsp; 덱의 활용

덱은 스택과 큐의 논리를 모두 갖추므로 **둘의 모든 활용 상황에 적용할 수 있으며, 더 높은 자유도도 제공한다**.

소프트웨어의 ‘실행 취소’는 보통 스택으로 구현한다. 시스템이 각 변경 작업을 스택에 `push`하고, `pop`으로 취소한다. 다만 자원 제약 때문에 보통 취소 가능한 단계 수를 제한한다(예를 들어 $50$단계만 저장). 스택 길이가 $50$을 넘으면 바닥(덱의 맨 앞)에서 삭제해야 한다. **스택은 이 기능을 지원하지 않으므로 덱으로 대체해야 한다**. ‘실행 취소’의 핵심 논리는 여전히 스택의 후입선출 원리를 따르며, 덱은 여기에 필요한 추가 논리를 더 유연하게 구현하게 해 준다.
