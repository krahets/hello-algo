---
comments: true
---

# 5.1 &nbsp; 스택

<u>스택(stack)</u>은 후입선출 원리를 따르는 선형 자료 구조다.

스택은 탁자 위에 쌓인 접시에 비유할 수 있다. 한 번에 접시 하나만 옮길 수 있다면 맨 아래 접시를 꺼내려면 위의 접시들을 차례로 치워야 한다. 접시를 정수, 문자, 객체 등 여러 자료형의 원소로 바꾸면 스택이라는 자료 구조가 된다.

아래 그림(5-1)과 같이 원소가 쌓인 맨 위를 ‘스택의 꼭대기’, 맨 아래를 ‘스택의 바닥’이라고 한다. 맨 위에 원소를 추가하는 연산을 ‘스택에 삽입하기’, 맨 위 원소를 삭제하는 연산을 ‘스택에서 꺼내기’라고 한다.

![스택의 후입선출 규칙](stack.assets/stack_operations.png){ class="animation-figure" }

<p align="center"> 그림 5-1 &nbsp; 스택의 후입선출 규칙 </p>

## 5.1.1 &nbsp; 스택의 기본 연산

스택의 기본 연산은 아래 표(5-1)와 같다. 구체적인 메서드 이름은 프로그래밍 언어에 따라 다르며, 여기서는 흔히 쓰이는 `push()`, `pop()`, `peek()`를 예로 든다.

<p align="center"> 표 5-1 &nbsp; 스택의 연산 효율 </p>

<div class="center-table" markdown>

| 메서드     | 설명                   | 시간 복잡도 |
| -------- | ---------------------- | ---------- |
| `push()` | 원소를 스택에 삽입(맨 위에 추가) | $O(1)$     |
| `pop()`  | 스택 맨 위 원소를 꺼냄           | $O(1)$     |
| `peek()` | 스택 맨 위 원소에 접근           | $O(1)$     |

</div>

보통 프로그래밍 언어에 내장된 스택 클래스를 바로 사용할 수 있다. 전용 스택 클래스가 없는 언어에서는 ‘배열’이나 ‘연결 리스트’를 스택으로 사용하면서, 프로그램 논리상 스택과 무관한 연산은 사용하지 않으면 된다.

=== "Python"

    ```python title="stack.py"
    # 스택 초기화
    # Python에는 내장 스택 클래스가 없으므로 list를 스택으로 사용할 수 있다
    stack: list[int] = []

    # 스택에 원소 삽입
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # 스택 맨 위 원소에 접근
    peek: int = stack[-1]

    # 스택에서 원소 꺼내기
    pop: int = stack.pop()

    # 스택 길이 구하기
    size: int = len(stack)

    # 비어 있는지 확인
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* 스택 초기화 */
    stack<int> stack;

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 스택 맨 위 원소에 접근 */
    int top = stack.top();

    /* 스택에서 원소 꺼내기 */
    stack.pop(); // 반환값 없음

    /* 스택 길이 구하기 */
    int size = stack.size();

    /* 비어 있는지 확인 */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* 스택 초기화 */
    Stack<Integer> stack = new Stack<>();

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 스택 맨 위 원소에 접근 */
    int peek = stack.peek();

    /* 스택에서 원소 꺼내기 */
    int pop = stack.pop();

    /* 스택 길이 구하기 */
    int size = stack.size();

    /* 비어 있는지 확인 */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* 스택 초기화 */
    Stack<int> stack = new();

    /* 스택에 원소 삽입 */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* 스택 맨 위 원소에 접근 */
    int peek = stack.Peek();

    /* 스택에서 원소 꺼내기 */
    int pop = stack.Pop();

    /* 스택 길이 구하기 */
    int size = stack.Count;

    /* 비어 있는지 확인 */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* 스택 초기화 */
    // Go에서는 Slice를 스택으로 사용하는 것을 권한다
    var stack []int

    /* 스택에 원소 삽입 */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* 스택 맨 위 원소에 접근 */
    peek := stack[len(stack)-1]

    /* 스택에서 원소 꺼내기 */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* 스택 길이 구하기 */
    size := len(stack)

    /* 비어 있는지 확인 */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* 스택 초기화 */
    // Swift에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
    var stack: [Int] = []

    /* 스택에 원소 삽입 */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* 스택 맨 위 원소에 접근 */
    let peek = stack.last!

    /* 스택에서 원소 꺼내기 */
    let pop = stack.removeLast()

    /* 스택 길이 구하기 */
    let size = stack.count

    /* 비어 있는지 확인 */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* 스택 초기화 */
    // JavaScript에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
    const stack = [];

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 스택 맨 위 원소에 접근 */
    const peek = stack[stack.length-1];

    /* 스택에서 원소 꺼내기 */
    const pop = stack.pop();

    /* 스택 길이 구하기 */
    const size = stack.length;

    /* 비어 있는지 확인 */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* 스택 초기화 */
    // TypeScript에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
    const stack: number[] = [];

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 스택 맨 위 원소에 접근 */
    const peek = stack[stack.length - 1];

    /* 스택에서 원소 꺼내기 */
    const pop = stack.pop();

    /* 스택 길이 구하기 */
    const size = stack.length;

    /* 비어 있는지 확인 */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* 스택 초기화 */
    // Dart에는 내장 스택 클래스가 없으므로 List를 스택으로 사용할 수 있다
    List<int> stack = [];

    /* 스택에 원소 삽입 */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* 스택 맨 위 원소에 접근 */
    int peek = stack.last;

    /* 스택에서 원소 꺼내기 */
    int pop = stack.removeLast();

    /* 스택 길이 구하기 */
    int size = stack.length;

    /* 비어 있는지 확인 */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* 스택 초기화 */
    // Vec를 스택으로 사용
    let mut stack: Vec<i32> = Vec::new();

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* 스택 맨 위 원소에 접근 */
    let top = stack.last().unwrap();

    /* 스택에서 원소 꺼내기 */
    let pop = stack.pop().unwrap();

    /* 스택 길이 구하기 */
    let size = stack.len();

    /* 비어 있는지 확인 */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C는 내장 스택을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"
    /* 스택 초기화 */
    val stack = Stack<Int>()

    /* 스택에 원소 삽입 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)

    /* 스택 맨 위 원소에 접근 */
    val peek = stack.peek()

    /* 스택에서 원소 꺼내기 */
    val pop = stack.pop()

    /* 스택 길이 구하기 */
    val size = stack.size

    /* 비어 있는지 확인 */
    val isEmpty = stack.isEmpty()
    ```

=== "Ruby"

    ```ruby title="stack.rb"
    # 스택 초기화
    # Ruby에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
    stack = []

    # 스택에 원소 삽입
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # 스택 맨 위 원소에 접근
    peek = stack.last

    # 스택에서 원소 꺼내기
    pop = stack.pop

    # 스택 길이 구하기
    size = stack.length

    # 비어 있는지 확인
    is_empty = stack.empty?
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20Python%EC%97%90%EB%8A%94%20%EB%82%B4%EC%9E%A5%20%EC%8A%A4%ED%83%9D%20%ED%81%B4%EB%9E%98%EC%8A%A4%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20list%EB%A5%BC%20%EC%8A%A4%ED%83%9D%EC%9C%BC%EB%A1%9C%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20Python%EC%97%90%EB%8A%94%20%EB%82%B4%EC%9E%A5%20%EC%8A%A4%ED%83%9D%20%ED%81%B4%EB%9E%98%EC%8A%A4%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20list%EB%A5%BC%20%EC%8A%A4%ED%83%9D%EC%9C%BC%EB%A1%9C%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 5.1.2 &nbsp; 스택 구현

스택의 작동 원리를 깊이 이해하기 위해 스택 클래스를 직접 구현해 보자.

스택은 후입선출 원리를 따르므로 맨 위에서만 원소를 추가하거나 삭제할 수 있다. 반면 배열과 연결 리스트는 어느 위치에서든 추가와 삭제가 가능하므로, **스택은 제약을 가한 배열이나 연결 리스트로 볼 수 있다**. 즉, 일부 무관한 연산을 ‘가려서’ 외부에 보이는 논리가 스택의 특성에 맞도록 만들 수 있다.

### 1. &nbsp; 연결 리스트 기반 구현

연결 리스트로 스택을 구현할 때는 머리 노드를 스택의 꼭대기로, 꼬리 노드를 바닥으로 볼 수 있다.

아래 그림(5-2)과 같이 스택에 삽입할 때는 연결 리스트의 맨 앞에 원소를 넣으면 된다. 이 방식을 ‘머리 삽입’이라고 한다. 스택에서 꺼낼 때는 머리 노드를 삭제하면 된다.

=== "<1>"
    ![연결 리스트 기반 스택의 삽입과 꺼내기](stack.assets/linkedlist_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![연결 리스트 기반 스택에 원소 삽입](stack.assets/linkedlist_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![연결 리스트 기반 스택에서 원소 꺼내기](stack.assets/linkedlist_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> 그림 5-2 &nbsp; 연결 리스트 기반 스택의 삽입과 꺼내기 </p>

연결 리스트로 스택을 구현한 예제 코드는 다음과 같다.

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """연결 리스트로 구현한 스택"""

        def __init__(self):
            """생성자"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """스택의 길이 반환"""
            return self._size

        def is_empty(self) -> bool:
            """스택이 비어 있는지 판단"""
            return self._size == 0

        def push(self, val: int):
            """스택에 삽입"""
            node = ListNode(val)
            node.next = self._peek
            self._peek = node
            self._size += 1

        def pop(self) -> int:
            """스택에서 꺼내기"""
            num = self.peek()
            self._peek = self._peek.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """스택 맨 위 원소 접근"""
            if self.is_empty():
                raise IndexError("스택이 비어 있다")
            return self._peek.val

        def to_list(self) -> list[int]:
            """출력에 사용할 리스트로 변환"""
            arr = []
            node = self._peek
            while node:
                arr.append(node.val)
                node = node.next
            arr.reverse()
            return arr
    ```

=== "C++"

    ```cpp title="linkedlist_stack.cpp"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack {
      private:
        ListNode *stackTop; // 머리 노드를 스택의 맨 위로 사용한다
        int stkSize;        // 스택의 길이

      public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }

        ~LinkedListStack() {
            // 연결 리스트를 순회하며 노드를 삭제하여 메모리를 해제한다
            freeMemoryLinkedList(stackTop);
        }

        /* 스택의 길이 반환 */
        int size() {
            return stkSize;
        }

        /* 스택이 비어 있는지 판단 */
        bool isEmpty() {
            return size() == 0;
        }

        /* 스택에 삽입 */
        void push(int num) {
            ListNode *node = new ListNode(num);
            node->next = stackTop;
            stackTop = node;
            stkSize++;
        }

        /* 스택에서 꺼내기 */
        int pop() {
            int num = top();
            ListNode *tmp = stackTop;
            stackTop = stackTop->next;
            // 메모리 해제
            delete tmp;
            stkSize--;
            return num;
        }

        /* 스택 맨 위 원소 접근 */
        int top() {
            if (isEmpty())
                throw out_of_range("스택이 비어 있다");
            return stackTop->val;
        }

        /* List를 Array로 변환하여 반환 */
        vector<int> toVector() {
            ListNode *node = stackTop;
            vector<int> res(size());
            for (int i = res.size() - 1; i >= 0; i--) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_stack.java"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack {
        private ListNode stackPeek; // 머리 노드를 스택의 맨 위로 사용한다
        private int stkSize = 0; // 스택의 길이

        public LinkedListStack() {
            stackPeek = null;
        }

        /* 스택의 길이 반환 */
        public int size() {
            return stkSize;
        }

        /* 스택이 비어 있는지 판단 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 스택에 삽입 */
        public void push(int num) {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }

        /* 스택에서 꺼내기 */
        public int pop() {
            int num = peek();
            stackPeek = stackPeek.next;
            stkSize--;
            return num;
        }

        /* 스택 맨 위 원소 접근 */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stackPeek.val;
        }

        /* List를 Array로 변환하여 반환 */
        public int[] toArray() {
            ListNode node = stackPeek;
            int[] res = new int[size()];
            for (int i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_stack.cs"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack {
        ListNode? stackPeek;  // 머리 노드를 스택의 맨 위로 사용한다
        int stkSize = 0;   // 스택의 길이

        public LinkedListStack() {
            stackPeek = null;
        }

        /* 스택의 길이 반환 */
        public int Size() {
            return stkSize;
        }

        /* 스택이 비어 있는지 판단 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 스택에 삽입 */
        public void Push(int num) {
            ListNode node = new(num) {
                next = stackPeek
            };
            stackPeek = node;
            stkSize++;
        }

        /* 스택에서 꺼내기 */
        public int Pop() {
            int num = Peek();
            stackPeek = stackPeek!.next;
            stkSize--;
            return num;
        }

        /* 스택 맨 위 원소 접근 */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stackPeek!.val;
        }

        /* List를 Array로 변환하여 반환 */
        public int[] ToArray() {
            if (stackPeek == null)
                return [];

            ListNode? node = stackPeek;
            int[] res = new int[Size()];
            for (int i = res.Length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_stack.go"
    /* 연결 리스트로 구현한 스택 */
    type linkedListStack struct {
        // 내장 패키지 list로 스택을 구현한다
        data *list.List
    }

    /* 스택 초기화 */
    func newLinkedListStack() *linkedListStack {
        return &linkedListStack{
            data: list.New(),
        }
    }

    /* 스택에 삽입 */
    func (s *linkedListStack) push(value int) {
        s.data.PushBack(value)
    }

    /* 스택에서 꺼내기 */
    func (s *linkedListStack) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* 스택 맨 위 원소 접근 */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* 스택의 길이 반환 */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* 스택이 비어 있는지 판단 */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 출력에 사용할 List 반환 */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack {
        private var _peek: ListNode? // 머리 노드를 스택의 맨 위로 사용한다
        private var _size: Int // 스택의 길이

        init() {
            _size = 0
        }

        /* 스택의 길이 반환 */
        func size() -> Int {
            _size
        }

        /* 스택이 비어 있는지 판단 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 스택에 삽입 */
        func push(num: Int) {
            let node = ListNode(x: num)
            node.next = _peek
            _peek = node
            _size += 1
        }

        /* 스택에서 꺼내기 */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            _peek = _peek?.next
            _size -= 1
            return num
        }

        /* 스택 맨 위 원소 접근 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("스택이 비어 있다")
            }
            return _peek!.val
        }

        /* List를 Array로 변환하여 반환 */
        func toArray() -> [Int] {
            var node = _peek
            var res = Array(repeating: 0, count: size())
            for i in res.indices.reversed() {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_stack.js"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack {
        #stackPeek; // 머리 노드를 스택의 맨 위로 사용한다
        #stkSize = 0; // 스택의 길이

        constructor() {
            this.#stackPeek = null;
        }

        /* 스택의 길이 반환 */
        get size() {
            return this.#stkSize;
        }

        /* 스택이 비어 있는지 판단 */
        isEmpty() {
            return this.size === 0;
        }

        /* 스택에 삽입 */
        push(num) {
            const node = new ListNode(num);
            node.next = this.#stackPeek;
            this.#stackPeek = node;
            this.#stkSize++;
        }

        /* 스택에서 꺼내기 */
        pop() {
            const num = this.peek();
            this.#stackPeek = this.#stackPeek.next;
            this.#stkSize--;
            return num;
        }

        /* 스택 맨 위 원소 접근 */
        peek() {
            if (!this.#stackPeek) throw new Error('스택이 비어 있다');
            return this.#stackPeek.val;
        }

        /* 연결 리스트를 Array로 변환하여 반환 */
        toArray() {
            let node = this.#stackPeek;
            const res = new Array(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_stack.ts"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack {
        private stackPeek: ListNode | null; // 머리 노드를 스택의 맨 위로 사용한다
        private stkSize: number = 0; // 스택의 길이

        constructor() {
            this.stackPeek = null;
        }

        /* 스택의 길이 반환 */
        get size(): number {
            return this.stkSize;
        }

        /* 스택이 비어 있는지 판단 */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* 스택에 삽입 */
        push(num: number): void {
            const node = new ListNode(num);
            node.next = this.stackPeek;
            this.stackPeek = node;
            this.stkSize++;
        }

        /* 스택에서 꺼내기 */
        pop(): number {
            const num = this.peek();
            if (!this.stackPeek) throw new Error('스택이 비어 있다');
            this.stackPeek = this.stackPeek.next;
            this.stkSize--;
            return num;
        }

        /* 스택 맨 위 원소 접근 */
        peek(): number {
            if (!this.stackPeek) throw new Error('스택이 비어 있다');
            return this.stackPeek.val;
        }

        /* 연결 리스트를 Array로 변환하여 반환 */
        toArray(): number[] {
            let node = this.stackPeek;
            const res = new Array<number>(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_stack.dart"
    /* 연결 리스트 클래스로 구현한 스택 */
    class LinkedListStack {
      ListNode? _stackPeek; // 머리 노드를 스택의 맨 위로 사용한다
      int _stkSize = 0; // 스택의 길이

      LinkedListStack() {
        _stackPeek = null;
      }

      /* 스택의 길이 반환 */
      int size() {
        return _stkSize;
      }

      /* 스택이 비어 있는지 판단 */
      bool isEmpty() {
        return _stkSize == 0;
      }

      /* 스택에 삽입 */
      void push(int _num) {
        final ListNode node = ListNode(_num);
        node.next = _stackPeek;
        _stackPeek = node;
        _stkSize++;
      }

      /* 스택에서 꺼내기 */
      int pop() {
        final int _num = peek();
        _stackPeek = _stackPeek!.next;
        _stkSize--;
        return _num;
      }

      /* 스택 맨 위 원소 접근 */
      int peek() {
        if (_stackPeek == null) {
          throw Exception("스택이 비어 있다");
        }
        return _stackPeek!.val;
      }

      /* 연결 리스트를 List로 변환하여 반환 */
      List<int> toList() {
        ListNode? node = _stackPeek;
        List<int> list = [];
        while (node != null) {
          list.add(node.val);
          node = node.next;
        }
        list = list.reversed.toList();
        return list;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_stack.rs"
    /* 연결 리스트로 구현한 스택 */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 머리 노드를 스택의 맨 위로 사용한다
        stk_size: usize,                              // 스택의 길이
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* 스택의 길이 반환 */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* 스택이 비어 있는지 판단 */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* 스택에 삽입 */
        pub fn push(&mut self, num: T) {
            let node = ListNode::new(num);
            node.borrow_mut().next = self.stack_peek.take();
            self.stack_peek = Some(node);
            self.stk_size += 1;
        }

        /* 스택에서 꺼내기 */
        pub fn pop(&mut self) -> Option<T> {
            self.stack_peek.take().map(|old_head| {
                self.stack_peek = old_head.borrow_mut().next.take();
                self.stk_size -= 1;

                old_head.borrow().val
            })
        }

        /* 스택 맨 위 원소 접근 */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.stack_peek.as_ref()
        }

        /* List를 Array로 변환하여 반환 */
        pub fn to_array(&self) -> Vec<T> {
            fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
                if let Some(node) = head {
                    let mut nums = _to_array(node.borrow().next.as_ref());
                    nums.push(node.borrow().val);
                    return nums;
                }
                return Vec::new();
            }

            _to_array(self.peek())
        }
    }
    ```

=== "C"

    ```c title="linkedlist_stack.c"
    /* 연결 리스트로 구현한 스택 */
    typedef struct {
        ListNode *top; // 머리 노드를 스택의 맨 위로 사용한다
        int size;      // 스택의 길이
    } LinkedListStack;

    /* 생성자 */
    LinkedListStack *newLinkedListStack() {
        LinkedListStack *s = malloc(sizeof(LinkedListStack));
        s->top = NULL;
        s->size = 0;
        return s;
    }

    /* 소멸자 */
    void delLinkedListStack(LinkedListStack *s) {
        while (s->top) {
            ListNode *n = s->top->next;
            free(s->top);
            s->top = n;
        }
        free(s);
    }

    /* 스택의 길이 반환 */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* 스택이 비어 있는지 판단 */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* 스택에 삽입 */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // 새로 추가한 노드의 포인터 필드를 갱신한다
        node->val = num;     // 새로 추가한 노드의 데이터 필드를 갱신한다
        s->top = node;       // 스택의 맨 위를 갱신한다
        s->size++;           // 스택 크기를 갱신한다
    }

    /* 스택 맨 위 원소 접근 */
    int peek(LinkedListStack *s) {
        if (s->size == 0) {
            printf("스택이 비어 있다\n");
            return INT_MAX;
        }
        return s->top->val;
    }

    /* 스택에서 꺼내기 */
    int pop(LinkedListStack *s) {
        int val = peek(s);
        ListNode *tmp = s->top;
        s->top = s->top->next;
        // 메모리 해제
        free(tmp);
        s->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_stack.kt"
    /* 연결 리스트로 구현한 스택 */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // 머리 노드를 스택의 맨 위로 사용한다
        private var stkSize: Int = 0 // 스택의 길이
    ) {

        /* 스택의 길이 반환 */
        fun size(): Int {
            return stkSize
        }

        /* 스택이 비어 있는지 판단 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* 스택에 삽입 */
        fun push(num: Int) {
            val node = ListNode(num)
            node.next = stackPeek
            stackPeek = node
            stkSize++
        }

        /* 스택에서 꺼내기 */
        fun pop(): Int? {
            val num = peek()
            stackPeek = stackPeek?.next
            stkSize--
            return num
        }

        /* 스택 맨 위 원소 접근 */
        fun peek(): Int? {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stackPeek?._val
        }

        /* List를 Array로 변환하여 반환 */
        fun toArray(): IntArray {
            var node = stackPeek
            val res = IntArray(size())
            for (i in res.size - 1 downTo 0) {
                res[i] = node?._val!!
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_stack.rb"
    ### 연결 리스트로 구현한 스택 ###
    class LinkedListStack
      attr_reader :size

      ### 생성자 ###
      def initialize
        @size = 0
      end

      ### 스택이 비어 있는지 판단 ###
      def is_empty?
        @peek.nil?
      end

      ### 스택에 삽입 ###
      def push(val)
        node = ListNode.new(val)
        node.next = @peek
        @peek = node
        @size += 1
      end

      ### 스택에서 꺼내기 ###
      def pop
        num = peek
        @peek = @peek.next
        @size -= 1
        num
      end

      ### 스택 맨 위 원소 접근 ###
      def peek
        raise IndexError, '스택이 비어 있다' if is_empty?

        @peek.val
      end

      ### 연결 리스트를 Array로 변환하여 반환 ###
      def to_array
        arr = []
        node = @peek
        while node
          arr << node.val
          node = node.next
        end
        arr.reverse
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A1%9C%20%EA%B5%AC%ED%98%84%ED%95%9C%20%EC%8A%A4%ED%83%9D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A1%9C%20%EB%B3%80%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%ED%9B%84%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A1%9C%20%EA%B5%AC%ED%98%84%ED%95%9C%20%EC%8A%A4%ED%83%9D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A1%9C%20%EB%B3%80%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%ED%9B%84%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 2. &nbsp; 배열 기반 구현

배열로 스택을 구현할 때는 배열의 끝을 스택의 꼭대기로 볼 수 있다. 아래 그림(5-3)과 같이 삽입과 꺼내기는 각각 배열 끝에 원소를 추가하고 삭제하는 연산에 해당하며, 시간 복잡도는 모두 $O(1)$이다.

=== "<1>"
    ![배열 기반 스택의 삽입과 꺼내기](stack.assets/array_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![배열 기반 스택에 원소 삽입](stack.assets/array_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![배열 기반 스택에서 원소 꺼내기](stack.assets/array_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> 그림 5-3 &nbsp; 배열 기반 스택의 삽입과 꺼내기 </p>

스택에 삽입되는 원소가 계속 늘어날 수 있으므로 동적 배열을 사용하면 배열의 용량 확장을 직접 처리하지 않아도 된다. 예제 코드는 다음과 같다.

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """배열로 구현한 스택"""

        def __init__(self):
            """생성자"""
            self._stack: list[int] = []

        def size(self) -> int:
            """스택의 길이 반환"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """스택이 비어 있는지 판단"""
            return self.size() == 0

        def push(self, item: int):
            """스택에 삽입"""
            self._stack.append(item)

        def pop(self) -> int:
            """스택에서 꺼내기"""
            if self.is_empty():
                raise IndexError("스택이 비어 있다")
            return self._stack.pop()

        def peek(self) -> int:
            """스택 맨 위 원소 접근"""
            if self.is_empty():
                raise IndexError("스택이 비어 있다")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """출력에 사용할 리스트 반환"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* 배열로 구현한 스택 */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* 스택의 길이 반환 */
        int size() {
            return stack.size();
        }

        /* 스택이 비어 있는지 판단 */
        bool isEmpty() {
            return stack.size() == 0;
        }

        /* 스택에 삽입 */
        void push(int num) {
            stack.push_back(num);
        }

        /* 스택에서 꺼내기 */
        int pop() {
            int num = top();
            stack.pop_back();
            return num;
        }

        /* 스택 맨 위 원소 접근 */
        int top() {
            if (isEmpty())
                throw out_of_range("스택이 비어 있다");
            return stack.back();
        }

        /* Vector 반환 */
        vector<int> toVector() {
            return stack;
        }
    };
    ```

=== "Java"

    ```java title="array_stack.java"
    /* 배열로 구현한 스택 */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // 리스트(동적 배열)를 초기화한다
            stack = new ArrayList<>();
        }

        /* 스택의 길이 반환 */
        public int size() {
            return stack.size();
        }

        /* 스택이 비어 있는지 판단 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 스택에 삽입 */
        public void push(int num) {
            stack.add(num);
        }

        /* 스택에서 꺼내기 */
        public int pop() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.remove(size() - 1);
        }

        /* 스택 맨 위 원소 접근 */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.get(size() - 1);
        }

        /* List를 Array로 변환하여 반환 */
        public Object[] toArray() {
            return stack.toArray();
        }
    }
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* 배열로 구현한 스택 */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // 리스트(동적 배열)를 초기화한다
            stack = [];
        }

        /* 스택의 길이 반환 */
        public int Size() {
            return stack.Count;
        }

        /* 스택이 비어 있는지 판단 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 스택에 삽입 */
        public void Push(int num) {
            stack.Add(num);
        }

        /* 스택에서 꺼내기 */
        public int Pop() {
            if (IsEmpty())
                throw new Exception();
            var val = Peek();
            stack.RemoveAt(Size() - 1);
            return val;
        }

        /* 스택 맨 위 원소 접근 */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stack[Size() - 1];
        }

        /* List를 Array로 변환하여 반환 */
        public int[] ToArray() {
            return [.. stack];
        }
    }
    ```

=== "Go"

    ```go title="array_stack.go"
    /* 배열로 구현한 스택 */
    type arrayStack struct {
        data []int // 데이터
    }

    /* 스택 초기화 */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // 스택의 길이를 0, 용량을 16으로 설정한다
            data: make([]int, 0, 16),
        }
    }

    /* 스택의 길이 */
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    /* 스택이 비어 있는지 판단 */
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    /* 스택에 삽입 */
    func (s *arrayStack) push(v int) {
        // 슬라이스는 용량이 자동으로 확장된다
        s.data = append(s.data, v)
    }

    /* 스택에서 꺼내기 */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* 스택 맨 위 원소 반환 */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* 출력에 사용할 Slice 반환 */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* 배열로 구현한 스택 */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // 리스트(동적 배열)를 초기화한다
            stack = []
        }

        /* 스택의 길이 반환 */
        func size() -> Int {
            stack.count
        }

        /* 스택이 비어 있는지 판단 */
        func isEmpty() -> Bool {
            stack.isEmpty
        }

        /* 스택에 삽입 */
        func push(num: Int) {
            stack.append(num)
        }

        /* 스택에서 꺼내기 */
        @discardableResult
        func pop() -> Int {
            if isEmpty() {
                fatalError("스택이 비어 있다")
            }
            return stack.removeLast()
        }

        /* 스택 맨 위 원소 접근 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("스택이 비어 있다")
            }
            return stack.last!
        }

        /* List를 Array로 변환하여 반환 */
        func toArray() -> [Int] {
            stack
        }
    }
    ```

=== "JS"

    ```javascript title="array_stack.js"
    /* 배열로 구현한 스택 */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* 스택의 길이 반환 */
        get size() {
            return this.#stack.length;
        }

        /* 스택이 비어 있는지 판단 */
        isEmpty() {
            return this.#stack.length === 0;
        }

        /* 스택에 삽입 */
        push(num) {
            this.#stack.push(num);
        }

        /* 스택에서 꺼내기 */
        pop() {
            if (this.isEmpty()) throw new Error('스택이 비어 있다');
            return this.#stack.pop();
        }

        /* 스택 맨 위 원소 접근 */
        top() {
            if (this.isEmpty()) throw new Error('스택이 비어 있다');
            return this.#stack[this.#stack.length - 1];
        }

        /* Array를 반환한다 */
        toArray() {
            return this.#stack;
        }
    }
    ```

=== "TS"

    ```typescript title="array_stack.ts"
    /* 배열로 구현한 스택 */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* 스택의 길이 반환 */
        get size(): number {
            return this.stack.length;
        }

        /* 스택이 비어 있는지 판단 */
        isEmpty(): boolean {
            return this.stack.length === 0;
        }

        /* 스택에 삽입 */
        push(num: number): void {
            this.stack.push(num);
        }

        /* 스택에서 꺼내기 */
        pop(): number | undefined {
            if (this.isEmpty()) throw new Error('스택이 비어 있다');
            return this.stack.pop();
        }

        /* 스택 맨 위 원소 접근 */
        top(): number | undefined {
            if (this.isEmpty()) throw new Error('스택이 비어 있다');
            return this.stack[this.stack.length - 1];
        }

        /* Array를 반환한다 */
        toArray() {
            return this.stack;
        }
    }
    ```

=== "Dart"

    ```dart title="array_stack.dart"
    /* 배열로 구현한 스택 */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* 스택의 길이 반환 */
      int size() {
        return _stack.length;
      }

      /* 스택이 비어 있는지 판단 */
      bool isEmpty() {
        return _stack.isEmpty;
      }

      /* 스택에 삽입 */
      void push(int _num) {
        _stack.add(_num);
      }

      /* 스택에서 꺼내기 */
      int pop() {
        if (isEmpty()) {
          throw Exception("스택이 비어 있다");
        }
        return _stack.removeLast();
      }

      /* 스택 맨 위 원소 접근 */
      int peek() {
        if (isEmpty()) {
          throw Exception("스택이 비어 있다");
        }
        return _stack.last;
      }

      /* 스택을 Array로 변환하여 반환 */
      List<int> toArray() => _stack;
    }
    ```

=== "Rust"

    ```rust title="array_stack.rs"
    /* 배열로 구현한 스택 */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* 스택 초기화 */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* 스택의 길이 반환 */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* 스택이 비어 있는지 판단 */
        fn is_empty(&self) -> bool {
            self.size() == 0
        }

        /* 스택에 삽입 */
        fn push(&mut self, num: T) {
            self.stack.push(num);
        }

        /* 스택에서 꺼내기 */
        fn pop(&mut self) -> Option<T> {
            self.stack.pop()
        }

        /* 스택 맨 위 원소 접근 */
        fn peek(&self) -> Option<&T> {
            if self.is_empty() {
                panic!("스택이 비어 있다")
            };
            self.stack.last()
        }

        /* &Vec를 반환한다 */
        fn to_array(&self) -> &Vec<T> {
            &self.stack
        }
    }
    ```

=== "C"

    ```c title="array_stack.c"
    /* 배열로 구현한 스택 */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* 생성자 */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // 용량 확장을 피하도록 큰 용량으로 초기화한다
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* 소멸자 */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* 스택의 길이 반환 */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* 스택이 비어 있는지 판단 */
    bool isEmpty(ArrayStack *stack) {
        return stack->size == 0;
    }

    /* 스택에 삽입 */
    void push(ArrayStack *stack, int num) {
        if (stack->size == MAX_SIZE) {
            printf("스택이 가득 찼다\n");
            return;
        }
        stack->data[stack->size] = num;
        stack->size++;
    }

    /* 스택 맨 위 원소 접근 */
    int peek(ArrayStack *stack) {
        if (stack->size == 0) {
            printf("스택이 비어 있다\n");
            return INT_MAX;
        }
        return stack->data[stack->size - 1];
    }

    /* 스택에서 꺼내기 */
    int pop(ArrayStack *stack) {
        int val = peek(stack);
        stack->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_stack.kt"
    /* 배열로 구현한 스택 */
    class ArrayStack {
        // 리스트(동적 배열)를 초기화한다
        private val stack = mutableListOf<Int>()

        /* 스택의 길이 반환 */
        fun size(): Int {
            return stack.size
        }

        /* 스택이 비어 있는지 판단 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* 스택에 삽입 */
        fun push(num: Int) {
            stack.add(num)
        }

        /* 스택에서 꺼내기 */
        fun pop(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack.removeAt(size() - 1)
        }

        /* 스택 맨 위 원소 접근 */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack[size() - 1]
        }

        /* List를 Array로 변환하여 반환 */
        fun toArray(): Array<Any> {
            return stack.toTypedArray()
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_stack.rb"
    ### 배열로 구현한 스택 ###
    class ArrayStack
      ### 생성자 ###
      def initialize
        @stack = []
      end

      ### 스택의 길이 반환 ###
      def size
        @stack.length
      end

      ### 스택이 비어 있는지 판단 ###
      def is_empty?
        @stack.empty?
      end

      ### 스택에 삽입 ###
      def push(item)
        @stack << item
      end

      ### 스택에서 꺼내기 ###
      def pop
        raise IndexError, '스택이 비어 있다' if is_empty?

        @stack.pop
      end

      ### 스택 맨 위 원소 접근 ###
      def peek
        raise IndexError, '스택이 비어 있다' if is_empty?

        @stack.last
      end

      ### 출력에 사용할 리스트 반환 ###
      def to_array
        @stack
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%EB%B0%B0%EC%97%B4%EB%A1%9C%20%EA%B5%AC%ED%98%84%ED%95%9C%20%EC%8A%A4%ED%83%9D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%ED%9B%84%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%EB%B0%B0%EC%97%B4%EB%A1%9C%20%EA%B5%AC%ED%98%84%ED%95%9C%20%EC%8A%A4%ED%83%9D%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%83%9D%EC%84%B1%EC%9E%90%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%82%BD%EC%9E%85%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8B%A4%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%B0%98%ED%99%98%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%ED%9B%84%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20%EB%B0%98%ED%99%98%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%98%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%8C%90%EB%8B%A8%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 5.1.3 &nbsp; 두 구현의 비교

**지원 연산**

두 구현 모두 스택 정의에 포함된 모든 연산을 지원한다. 배열 기반 구현은 임의 접근도 지원하지만, 이는 스택의 정의를 벗어나므로 일반적으로 사용하지 않는다.

**시간 효율**

배열 기반 구현에서는 삽입과 꺼내기를 미리 할당한 연속 메모리에서 수행한다. 캐시 지역성이 좋아 효율이 높다. 다만 삽입 시 배열 용량을 넘으면 확장이 발생하여 그 삽입 연산의 시간 복잡도는 $O(n)$이 된다.

연결 리스트 기반 구현은 크기를 유연하게 늘릴 수 있어 배열 확장에 따른 효율 저하가 없다. 하지만 삽입 시 노드 객체를 초기화하고 포인터를 수정해야 하므로 상대적으로 효율이 낮다. 삽입할 원소 자체가 노드 객체라면 초기화 단계를 생략하여 효율을 높일 수 있다.

따라서 삽입하고 꺼내는 원소가 `int`나 `double` 같은 기본 자료형이라면 다음과 같이 정리할 수 있다.

- 배열 기반 스택은 용량 확장이 발생할 때 효율이 낮아지지만, 확장은 드물게 일어나므로 평균 효율은 더 높다.
- 연결 리스트 기반 스택은 더 안정적인 효율을 제공한다.

**공간 효율**

리스트를 초기화할 때 시스템은 ‘초기 용량’을 할당하며, 이 용량은 실제 필요보다 클 수 있다. 또한 확장 시 보통 2배처럼 일정한 비율로 늘리므로 확장 후 용량도 실제 필요보다 클 수 있다. 따라서 **배열 기반 스택은 어느 정도 공간을 낭비할 수 있다**.

반면 연결 리스트 노드는 포인터를 추가로 저장해야 하므로 **노드 하나가 차지하는 공간이 상대적으로 크다**.

따라서 어느 구현이 메모리를 더 절약하는지는 단정할 수 없으며 구체적인 상황에 따라 분석해야 한다.

## 5.1.4 &nbsp; 스택의 대표적인 활용

- **브라우저의 뒤로 및 앞으로, 소프트웨어의 실행 취소 및 다시 실행**. 새 웹 페이지를 열 때마다 브라우저는 이전 페이지를 스택에 넣어 뒤로 가기로 돌아갈 수 있게 한다. 뒤로 가기는 실제로 스택에서 원소를 꺼내는 연산이다. 뒤로 가기와 앞으로 가기를 함께 지원하려면 스택 두 개를 사용해야 한다.
- **프로그램 메모리 관리**. 함수가 호출될 때마다 시스템은 스택 맨 위에 스택 프레임을 추가해 함수의 문맥 정보를 기록한다. 재귀 함수에서는 아래로 호출을 이어 가는 단계에서 스택에 계속 넣고, 위로 되돌아오는 단계에서 계속 꺼낸다.
