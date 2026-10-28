# 덱

큐에서는 맨 앞 원소를 삭제하거나 맨 뒤에 원소를 추가하는 것만 가능하다. 아래 그림의 <u>덱(double-ended queue)</u>은 앞뒤 양쪽에서 원소를 추가하고 삭제할 수 있어 더 유연하다.

![덱의 연산](deque.assets/deque_operations.png)

## 덱의 기본 연산

덱의 기본 연산은 아래 표와 같다. 구체적인 메서드 이름은 사용하는 프로그래밍 언어에 따라 정해진다.

<p align="center"> 표 <id> &nbsp; 덱의 연산 효율 </p>

| 메서드         | 설명             | 시간 복잡도 |
| -------------- | ---------------- | ---------- |
| `push_first()` | 맨 앞에 원소 추가 | $O(1)$     |
| `push_last()`  | 맨 뒤에 원소 추가 | $O(1)$     |
| `pop_first()`  | 맨 앞 원소 삭제     | $O(1)$     |
| `pop_last()`   | 맨 뒤 원소 삭제     | $O(1)$     |
| `peek_first()` | 맨 앞 원소에 접근     | $O(1)$     |
| `peek_last()`  | 맨 뒤 원소에 접근     | $O(1)$     |

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

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%8D%B1%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20deq.append%282%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%EB%8D%B1%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 덱 구현 *

덱의 구현은 큐와 비슷하며, 기반 자료 구조로 연결 리스트나 배열을 선택할 수 있다.

### 이중 연결 리스트 기반 구현

앞 절에서는 일반적인 단일 연결 리스트로 큐를 구현했다. 머리 노드를 삭제하는 연산(큐에서 꺼내기)과 꼬리 노드 뒤에 새 노드를 추가하는 연산(큐에 삽입하기)을 쉽게 수행할 수 있기 때문이다.

덱에서는 앞과 뒤 모두 삽입과 꺼내기를 수행할 수 있다. 즉, 큐와 대칭되는 반대 방향의 연산도 구현해야 한다. 이를 위해 ‘이중 연결 리스트’를 덱의 기반 자료 구조로 사용한다.

아래 그림과 같이 이중 연결 리스트의 머리 노드와 꼬리 노드를 덱의 맨 앞과 맨 뒤로 보고, 양 끝에서 노드를 추가하고 삭제하는 기능을 구현한다.

=== "<1>"
    ![연결 리스트 기반 덱의 삽입과 꺼내기](deque.assets/linkedlist_deque_step1.png)

=== "<2>"
    ![연결 리스트 기반 덱의 맨 뒤에 삽입](deque.assets/linkedlist_deque_step2_push_last.png)

=== "<3>"
    ![연결 리스트 기반 덱의 맨 앞에 삽입](deque.assets/linkedlist_deque_step3_push_first.png)

=== "<4>"
    ![연결 리스트 기반 덱의 맨 뒤에서 꺼내기](deque.assets/linkedlist_deque_step4_pop_last.png)

=== "<5>"
    ![연결 리스트 기반 덱의 맨 앞에서 꺼내기](deque.assets/linkedlist_deque_step5_pop_first.png)

구현 코드는 다음과 같다.

```src
[file]{linkedlist_deque}-[class]{linked_list_deque}-[func]{}
```

### 배열 기반 구현

아래 그림과 같이 배열 기반 큐와 마찬가지로 원형 배열을 사용하여 덱을 구현할 수 있다.

=== "<1>"
    ![배열 기반 덱의 삽입과 꺼내기](deque.assets/array_deque_step1.png)

=== "<2>"
    ![배열 기반 덱의 맨 뒤에 삽입](deque.assets/array_deque_step2_push_last.png)

=== "<3>"
    ![배열 기반 덱의 맨 앞에 삽입](deque.assets/array_deque_step3_push_first.png)

=== "<4>"
    ![배열 기반 덱의 맨 뒤에서 꺼내기](deque.assets/array_deque_step4_pop_last.png)

=== "<5>"
    ![배열 기반 덱의 맨 앞에서 꺼내기](deque.assets/array_deque_step5_pop_first.png)

큐 구현에 ‘맨 앞에 삽입하기’와 ‘맨 뒤에서 꺼내기’ 메서드만 추가하면 된다.

```src
[file]{array_deque}-[class]{array_deque}-[func]{}
```

## 덱의 활용

덱은 스택과 큐의 논리를 모두 갖추므로 **둘의 모든 활용 상황에 적용할 수 있으며, 더 높은 자유도도 제공한다**.

소프트웨어의 ‘실행 취소’는 보통 스택으로 구현한다. 시스템이 각 변경 작업을 스택에 `push`하고, `pop`으로 취소한다. 다만 자원 제약 때문에 보통 취소 가능한 단계 수를 제한한다(예를 들어 $50$단계만 저장). 스택 길이가 $50$을 넘으면 바닥(덱의 맨 앞)에서 삭제해야 한다. **스택은 이 기능을 지원하지 않으므로 덱으로 대체해야 한다**. ‘실행 취소’의 핵심 논리는 여전히 스택의 후입선출 원리를 따르며, 덱은 여기에 필요한 추가 논리를 더 유연하게 구현하게 해 준다.
