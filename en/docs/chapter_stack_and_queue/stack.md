---
comments: true
---

# 5.1 &nbsp; Stack

A <u>stack</u> is a linear data structure that follows the Last In First Out (LIFO) logic.

We can compare a stack to a pile of plates on a table. If we specify that only one plate can be moved at a time, then to get the bottom plate, we must first remove the plates above it one by one. If we replace the plates with various types of elements (such as integers, characters, objects, etc.), we get the stack data structure.

As shown in Figure 5-1, we call the top of the stacked elements the "top" and the bottom the "base." The operation of adding an element to the top is called "push," and the operation of removing the top element is called "pop."

![LIFO rule of stack](stack.assets/stack_operations.png){ class="animation-figure" }

<p align="center"> Figure 5-1 &nbsp; LIFO rule of stack </p>

## 5.1.1 &nbsp; Common Stack Operations

The common operations on a stack are shown in Table 5-1. The specific method names depend on the programming language used. Here, we use the common naming convention of `push()`, `pop()`, and `peek()`.

<p align="center"> Table 5-1 &nbsp; Efficiency of Stack Operations </p>

<div class="center-table" markdown>

| Method   | Description                                    | Time Complexity |
| -------- | ---------------------------------------------- | --------------- |
| `push()` | Push element onto stack (add to top)          | $O(1)$          |
| `pop()`  | Pop top element from stack                     | $O(1)$          |
| `peek()` | Access top element                             | $O(1)$          |

</div>

Typically, we can directly use the built-in stack class provided by the programming language. However, some languages may not provide a dedicated stack class. In these cases, we can use the language's "array" or "linked list" as a stack and ignore operations unrelated to the stack in the program logic.

=== "Python"

    ```python title="stack.py"
    # Initialize stack
    # Python does not have a built-in stack class, can use list as a stack
    stack: list[int] = []

    # Push elements
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # Access top element
    peek: int = stack[-1]

    # Pop element
    pop: int = stack.pop()

    # Get stack length
    size: int = len(stack)

    # Check if empty
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* Initialize stack */
    stack<int> stack;

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access top element */
    int top = stack.top();

    /* Pop element */
    stack.pop(); // No return value

    /* Get stack length */
    int size = stack.size();

    /* Check if empty */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* Initialize stack */
    Stack<Integer> stack = new Stack<>();

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access top element */
    int peek = stack.peek();

    /* Pop element */
    int pop = stack.pop();

    /* Get stack length */
    int size = stack.size();

    /* Check if empty */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* Initialize stack */
    Stack<int> stack = new();

    /* Push elements */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* Access top element */
    int peek = stack.Peek();

    /* Pop element */
    int pop = stack.Pop();

    /* Get stack length */
    int size = stack.Count;

    /* Check if empty */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* Initialize stack */
    // In Go, it is recommended to use Slice as a stack
    var stack []int

    /* Push elements */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* Access top element */
    peek := stack[len(stack)-1]

    /* Pop element */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* Get stack length */
    size := len(stack)

    /* Check if empty */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* Initialize stack */
    // Swift does not have a built-in stack class, can use Array as a stack
    var stack: [Int] = []

    /* Push elements */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* Access top element */
    let peek = stack.last!

    /* Pop element */
    let pop = stack.removeLast()

    /* Get stack length */
    let size = stack.count

    /* Check if empty */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* Initialize stack */
    // JavaScript does not have a built-in stack class, can use Array as a stack
    const stack = [];

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access top element */
    const peek = stack[stack.length-1];

    /* Pop element */
    const pop = stack.pop();

    /* Get stack length */
    const size = stack.length;

    /* Check if empty */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* Initialize stack */
    // TypeScript does not have a built-in stack class, can use Array as a stack
    const stack: number[] = [];

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access top element */
    const peek = stack[stack.length - 1];

    /* Pop element */
    const pop = stack.pop();

    /* Get stack length */
    const size = stack.length;

    /* Check if empty */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* Initialize stack */
    // Dart does not have a built-in stack class, can use List as a stack
    List<int> stack = [];

    /* Push elements */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* Access top element */
    int peek = stack.last;

    /* Pop element */
    int pop = stack.removeLast();

    /* Get stack length */
    int size = stack.length;

    /* Check if empty */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* Initialize stack */
    // Use Vec as a stack
    let mut stack: Vec<i32> = Vec::new();

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access top element */
    let top = stack.last().unwrap();

    /* Pop element */
    let pop = stack.pop().unwrap();

    /* Get stack length */
    let size = stack.len();

    /* Check if empty */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C does not provide a built-in stack
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"
    /* Initialize stack */
    val stack = Stack<Int>()

    /* Push elements */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)

    /* Access top element */
    val peek = stack.peek()

    /* Pop element */
    val pop = stack.pop()

    /* Get stack length */
    val size = stack.size

    /* Check if empty */
    val isEmpty = stack.isEmpty()
    ```

=== "Ruby"

    ```ruby title="stack.rb"
    # Initialize stack
    # Ruby does not have a built-in stack class, can use Array as a stack
    stack = []

    # Push elements
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # Access top element
    peek = stack.last

    # Pop element
    pop = stack.pop

    # Get stack length
    size = stack.length

    # Check if empty
    is_empty = stack.empty?
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%88%0A%20%20%20%20%23%20Python%20%E6%B2%A1%E6%9C%89%E5%86%85%E7%BD%AE%E7%9A%84%E6%A0%88%E7%B1%BB%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E5%BD%93%E4%BD%9C%E6%A0%88%E6%9D%A5%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E6%A0%88%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E6%A0%88%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E6%A0%88%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%90%8E%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E6%A0%88%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%88%0A%20%20%20%20%23%20Python%20%E6%B2%A1%E6%9C%89%E5%86%85%E7%BD%AE%E7%9A%84%E6%A0%88%E7%B1%BB%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E5%BD%93%E4%BD%9C%E6%A0%88%E6%9D%A5%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E6%A0%88%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E6%A0%88%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E6%A0%88%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%90%8E%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E6%A0%88%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 5.1.2 &nbsp; Stack Implementation

To gain a deeper understanding of how a stack operates, let's try implementing a stack class ourselves.

A stack follows the LIFO principle, so we can only add or remove elements at the top. However, both arrays and linked lists allow adding and removing elements at any position. **Therefore, a stack can be viewed as a restricted array or linked list**. In other words, we can "shield" some irrelevant operations of arrays or linked lists so that their external logic conforms to the characteristics of a stack.

### 1. &nbsp; Linked List Implementation

When implementing a stack using a linked list, we can treat the head node of the linked list as the top of the stack and the tail node as the base.

As shown in Figure 5-2, for the push operation, we simply insert an element at the head of the linked list. This node insertion method is called the "head insertion method." For the pop operation, we just need to remove the head node from the linked list.

=== "LinkedListStack"
    ![Push and pop operations in linked list implementation of stack](stack.assets/linkedlist_stack_step1.png){ class="animation-figure" }

=== "push()"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> Figure 5-2 &nbsp; Push and pop operations in linked list implementation of stack </p>

Below is sample code for implementing a stack based on a linked list:

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """Stack based on linked list implementation"""

        def __init__(self):
            """Constructor"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """Get the length of the stack"""
            return self._size

        def is_empty(self) -> bool:
            """Check if the stack is empty"""
            return self._size == 0

        def push(self, val: int):
            """Push"""
            node = ListNode(val)
            node.next = self._peek
            self._peek = node
            self._size += 1

        def pop(self) -> int:
            """Pop"""
            num = self.peek()
            self._peek = self._peek.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """Access top of the stack element"""
            if self.is_empty():
                raise IndexError("Stack is empty")
            return self._peek.val

        def to_list(self) -> list[int]:
            """Convert to list for printing"""
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
    /* Stack based on linked list implementation */
    class LinkedListStack {
      private:
        ListNode *stackTop; // Use head node as stack top
        int stkSize;        // Stack length

      public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }

        ~LinkedListStack() {
            // Traverse linked list to delete nodes and free memory
            freeMemoryLinkedList(stackTop);
        }

        /* Get the length of the stack */
        int size() {
            return stkSize;
        }

        /* Check if the stack is empty */
        bool isEmpty() {
            return size() == 0;
        }

        /* Push */
        void push(int num) {
            ListNode *node = new ListNode(num);
            node->next = stackTop;
            stackTop = node;
            stkSize++;
        }

        /* Pop */
        int pop() {
            int num = top();
            ListNode *tmp = stackTop;
            stackTop = stackTop->next;
            // Free memory
            delete tmp;
            stkSize--;
            return num;
        }

        /* Return list for printing */
        int top() {
            if (isEmpty())
                throw out_of_range("Stack is empty");
            return stackTop->val;
        }

        /* Convert List to Array and return */
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
    /* Stack based on linked list implementation */
    class LinkedListStack {
        private ListNode stackPeek; // Use head node as stack top
        private int stkSize = 0; // Stack length

        public LinkedListStack() {
            stackPeek = null;
        }

        /* Get the length of the stack */
        public int size() {
            return stkSize;
        }

        /* Check if the stack is empty */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Push */
        public void push(int num) {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }

        /* Pop */
        public int pop() {
            int num = peek();
            stackPeek = stackPeek.next;
            stkSize--;
            return num;
        }

        /* Return list for printing */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stackPeek.val;
        }

        /* Convert List to Array and return */
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
    /* Stack based on linked list implementation */
    class LinkedListStack {
        ListNode? stackPeek;  // Use head node as stack top
        int stkSize = 0;   // Stack length

        public LinkedListStack() {
            stackPeek = null;
        }

        /* Get the length of the stack */
        public int Size() {
            return stkSize;
        }

        /* Check if the stack is empty */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Push */
        public void Push(int num) {
            ListNode node = new(num) {
                next = stackPeek
            };
            stackPeek = node;
            stkSize++;
        }

        /* Pop */
        public int Pop() {
            int num = Peek();
            stackPeek = stackPeek!.next;
            stkSize--;
            return num;
        }

        /* Return list for printing */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stackPeek!.val;
        }

        /* Convert List to Array and return */
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
    /* Stack based on linked list implementation */
    type linkedListStack struct {
        // Use built-in package list to implement stack
        data *list.List
    }

    /* Access top of the stack element */
    func newLinkedListStack() *linkedListStack {
        return &linkedListStack{
            data: list.New(),
        }
    }

    /* Push */
    func (s *linkedListStack) push(value int) {
        s.data.PushBack(value)
    }

    /* Pop */
    func (s *linkedListStack) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* Return list for printing */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* Get the length of the stack */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* Check if the stack is empty */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Get List for printing */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* Stack based on linked list implementation */
    class LinkedListStack {
        private var _peek: ListNode? // Use head node as stack top
        private var _size: Int // Stack length

        init() {
            _size = 0
        }

        /* Get the length of the stack */
        func size() -> Int {
            _size
        }

        /* Check if the stack is empty */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Push */
        func push(num: Int) {
            let node = ListNode(x: num)
            node.next = _peek
            _peek = node
            _size += 1
        }

        /* Pop */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            _peek = _peek?.next
            _size -= 1
            return num
        }

        /* Return list for printing */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Stack is empty")
            }
            return _peek!.val
        }

        /* Convert List to Array and return */
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
    /* Stack based on linked list implementation */
    class LinkedListStack {
        #stackPeek; // Use head node as stack top
        #stkSize = 0; // Stack length

        constructor() {
            this.#stackPeek = null;
        }

        /* Get the length of the stack */
        get size() {
            return this.#stkSize;
        }

        /* Check if the stack is empty */
        isEmpty() {
            return this.size === 0;
        }

        /* Push */
        push(num) {
            const node = new ListNode(num);
            node.next = this.#stackPeek;
            this.#stackPeek = node;
            this.#stkSize++;
        }

        /* Pop */
        pop() {
            const num = this.peek();
            this.#stackPeek = this.#stackPeek.next;
            this.#stkSize--;
            return num;
        }

        /* Return list for printing */
        peek() {
            if (!this.#stackPeek) throw new Error('Stack is empty');
            return this.#stackPeek.val;
        }

        /* Convert linked list to Array and return */
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
    /* Stack based on linked list implementation */
    class LinkedListStack {
        private stackPeek: ListNode | null; // Use head node as stack top
        private stkSize: number = 0; // Stack length

        constructor() {
            this.stackPeek = null;
        }

        /* Get the length of the stack */
        get size(): number {
            return this.stkSize;
        }

        /* Check if the stack is empty */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* Push */
        push(num: number): void {
            const node = new ListNode(num);
            node.next = this.stackPeek;
            this.stackPeek = node;
            this.stkSize++;
        }

        /* Pop */
        pop(): number {
            const num = this.peek();
            if (!this.stackPeek) throw new Error('Stack is empty');
            this.stackPeek = this.stackPeek.next;
            this.stkSize--;
            return num;
        }

        /* Return list for printing */
        peek(): number {
            if (!this.stackPeek) throw new Error('Stack is empty');
            return this.stackPeek.val;
        }

        /* Convert linked list to Array and return */
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
    /* Stack implemented based on linked list class */
    class LinkedListStack {
      ListNode? _stackPeek; // Use head node as stack top
      int _stkSize = 0; // Stack length

      LinkedListStack() {
        _stackPeek = null;
      }

      /* Get the length of the stack */
      int size() {
        return _stkSize;
      }

      /* Check if the stack is empty */
      bool isEmpty() {
        return _stkSize == 0;
      }

      /* Push */
      void push(int _num) {
        final ListNode node = ListNode(_num);
        node.next = _stackPeek;
        _stackPeek = node;
        _stkSize++;
      }

      /* Pop */
      int pop() {
        final int _num = peek();
        _stackPeek = _stackPeek!.next;
        _stkSize--;
        return _num;
      }

      /* Return list for printing */
      int peek() {
        if (_stackPeek == null) {
          throw Exception("Stack is empty");
        }
        return _stackPeek!.val;
      }

      /* Convert linked list to List and return */
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
    /* Stack based on linked list implementation */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Use head node as stack top
        stk_size: usize,                              // Stack length
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* Get the length of the stack */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* Check if the stack is empty */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* Push */
        pub fn push(&mut self, num: T) {
            let node = ListNode::new(num);
            node.borrow_mut().next = self.stack_peek.take();
            self.stack_peek = Some(node);
            self.stk_size += 1;
        }

        /* Pop */
        pub fn pop(&mut self) -> Option<T> {
            self.stack_peek.take().map(|old_head| {
                self.stack_peek = old_head.borrow_mut().next.take();
                self.stk_size -= 1;

                old_head.borrow().val
            })
        }

        /* Return list for printing */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.stack_peek.as_ref()
        }

        /* Convert List to Array and return */
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
    /* Stack based on linked list implementation */
    typedef struct {
        ListNode *top; // Use head node as stack top
        int size;      // Stack length
    } LinkedListStack;

    /* Constructor */
    LinkedListStack *newLinkedListStack() {
        LinkedListStack *s = malloc(sizeof(LinkedListStack));
        s->top = NULL;
        s->size = 0;
        return s;
    }

    /* Destructor */
    void delLinkedListStack(LinkedListStack *s) {
        while (s->top) {
            ListNode *n = s->top->next;
            free(s->top);
            s->top = n;
        }
        free(s);
    }

    /* Get the length of the stack */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* Check if the stack is empty */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* Push */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // Update new node's pointer field
        node->val = num;     // Update new node's data field
        s->top = node;       // Update stack top
        s->size++;           // Update stack size
    }

    /* Return list for printing */
    int peek(LinkedListStack *s) {
        if (s->size == 0) {
            printf("Stack is empty\n");
            return INT_MAX;
        }
        return s->top->val;
    }

    /* Pop */
    int pop(LinkedListStack *s) {
        int val = peek(s);
        ListNode *tmp = s->top;
        s->top = s->top->next;
        // Free memory
        free(tmp);
        s->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_stack.kt"
    /* Stack based on linked list implementation */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // Use head node as stack top
        private var stkSize: Int = 0 // Stack length
    ) {

        /* Get the length of the stack */
        fun size(): Int {
            return stkSize
        }

        /* Check if the stack is empty */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Push */
        fun push(num: Int) {
            val node = ListNode(num)
            node.next = stackPeek
            stackPeek = node
            stkSize++
        }

        /* Pop */
        fun pop(): Int? {
            val num = peek()
            stackPeek = stackPeek?.next
            stkSize--
            return num
        }

        /* Return list for printing */
        fun peek(): Int? {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stackPeek?._val
        }

        /* Convert List to Array and return */
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
    ### Stack based on linked list ###
    class LinkedListStack
      attr_reader :size

      ### Constructor ###
      def initialize
        @size = 0
      end

      ### Check if stack is empty ###
      def is_empty?
        @peek.nil?
      end

      ### Push ###
      def push(val)
        node = ListNode.new(val)
        node.next = @peek
        @peek = node
        @size += 1
      end

      ### Pop ###
      def pop
        num = peek
        @peek = @peek.next
        @size -= 1
        num
      end

      ### Access top element ###
      def peek
        raise IndexError, 'Stack is empty' if is_empty?

        @peek.val
      end

      ### Convert linked list to Array and return ###
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

### 2. &nbsp; Array Implementation

When implementing a stack using an array, we can treat the end of the array as the top of the stack. As shown in Figure 5-3, push and pop operations correspond to adding and removing elements at the end of the array, both with a time complexity of $O(1)$.

=== "ArrayStack"
    ![Push and pop operations in array implementation of stack](stack.assets/array_stack_step1.png){ class="animation-figure" }

=== "push()"
    ![array_stack_push](stack.assets/array_stack_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> Figure 5-3 &nbsp; Push and pop operations in array implementation of stack </p>

Since elements pushed onto the stack may increase continuously, we can use a dynamic array, which eliminates the need to handle array expansion ourselves. Here is the sample code:

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """Stack based on array implementation"""

        def __init__(self):
            """Constructor"""
            self._stack: list[int] = []

        def size(self) -> int:
            """Get the length of the stack"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """Check if the stack is empty"""
            return self.size() == 0

        def push(self, item: int):
            """Push"""
            self._stack.append(item)

        def pop(self) -> int:
            """Pop"""
            if self.is_empty():
                raise IndexError("Stack is empty")
            return self._stack.pop()

        def peek(self) -> int:
            """Access top of the stack element"""
            if self.is_empty():
                raise IndexError("Stack is empty")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """Return list for printing"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* Stack based on array implementation */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* Get the length of the stack */
        int size() {
            return stack.size();
        }

        /* Check if the stack is empty */
        bool isEmpty() {
            return stack.size() == 0;
        }

        /* Push */
        void push(int num) {
            stack.push_back(num);
        }

        /* Pop */
        int pop() {
            int num = top();
            stack.pop_back();
            return num;
        }

        /* Return list for printing */
        int top() {
            if (isEmpty())
                throw out_of_range("Stack is empty");
            return stack.back();
        }

        /* Return Vector */
        vector<int> toVector() {
            return stack;
        }
    };
    ```

=== "Java"

    ```java title="array_stack.java"
    /* Stack based on array implementation */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // Initialize list (dynamic array)
            stack = new ArrayList<>();
        }

        /* Get the length of the stack */
        public int size() {
            return stack.size();
        }

        /* Check if the stack is empty */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Push */
        public void push(int num) {
            stack.add(num);
        }

        /* Pop */
        public int pop() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.remove(size() - 1);
        }

        /* Return list for printing */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.get(size() - 1);
        }

        /* Convert List to Array and return */
        public Object[] toArray() {
            return stack.toArray();
        }
    }
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* Stack based on array implementation */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // Initialize list (dynamic array)
            stack = [];
        }

        /* Get the length of the stack */
        public int Size() {
            return stack.Count;
        }

        /* Check if the stack is empty */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Push */
        public void Push(int num) {
            stack.Add(num);
        }

        /* Pop */
        public int Pop() {
            if (IsEmpty())
                throw new Exception();
            var val = Peek();
            stack.RemoveAt(Size() - 1);
            return val;
        }

        /* Return list for printing */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stack[Size() - 1];
        }

        /* Convert List to Array and return */
        public int[] ToArray() {
            return [.. stack];
        }
    }
    ```

=== "Go"

    ```go title="array_stack.go"
    /* Stack based on array implementation */
    type arrayStack struct {
        data []int // Data
    }

    /* Access top of the stack element */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // Set stack length to 0, capacity to 16
            data: make([]int, 0, 16),
        }
    }

    /* Stack length */
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    /* Is stack empty */
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    /* Push */
    func (s *arrayStack) push(v int) {
        // Slice will automatically expand
        s.data = append(s.data, v)
    }

    /* Pop */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* Get stack top element */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* Get Slice for printing */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* Stack based on array implementation */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // Initialize list (dynamic array)
            stack = []
        }

        /* Get the length of the stack */
        func size() -> Int {
            stack.count
        }

        /* Check if the stack is empty */
        func isEmpty() -> Bool {
            stack.isEmpty
        }

        /* Push */
        func push(num: Int) {
            stack.append(num)
        }

        /* Pop */
        @discardableResult
        func pop() -> Int {
            if isEmpty() {
                fatalError("Stack is empty")
            }
            return stack.removeLast()
        }

        /* Return list for printing */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Stack is empty")
            }
            return stack.last!
        }

        /* Convert List to Array and return */
        func toArray() -> [Int] {
            stack
        }
    }
    ```

=== "JS"

    ```javascript title="array_stack.js"
    /* Stack based on array implementation */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* Get the length of the stack */
        get size() {
            return this.#stack.length;
        }

        /* Check if the stack is empty */
        isEmpty() {
            return this.#stack.length === 0;
        }

        /* Push */
        push(num) {
            this.#stack.push(num);
        }

        /* Pop */
        pop() {
            if (this.isEmpty()) throw new Error('Stack is empty');
            return this.#stack.pop();
        }

        /* Return list for printing */
        top() {
            if (this.isEmpty()) throw new Error('Stack is empty');
            return this.#stack[this.#stack.length - 1];
        }

        /* Return Array */
        toArray() {
            return this.#stack;
        }
    }
    ```

=== "TS"

    ```typescript title="array_stack.ts"
    /* Stack based on array implementation */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* Get the length of the stack */
        get size(): number {
            return this.stack.length;
        }

        /* Check if the stack is empty */
        isEmpty(): boolean {
            return this.stack.length === 0;
        }

        /* Push */
        push(num: number): void {
            this.stack.push(num);
        }

        /* Pop */
        pop(): number | undefined {
            if (this.isEmpty()) throw new Error('Stack is empty');
            return this.stack.pop();
        }

        /* Return list for printing */
        top(): number | undefined {
            if (this.isEmpty()) throw new Error('Stack is empty');
            return this.stack[this.stack.length - 1];
        }

        /* Return Array */
        toArray() {
            return this.stack;
        }
    }
    ```

=== "Dart"

    ```dart title="array_stack.dart"
    /* Stack based on array implementation */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* Get the length of the stack */
      int size() {
        return _stack.length;
      }

      /* Check if the stack is empty */
      bool isEmpty() {
        return _stack.isEmpty;
      }

      /* Push */
      void push(int _num) {
        _stack.add(_num);
      }

      /* Pop */
      int pop() {
        if (isEmpty()) {
          throw Exception("Stack is empty");
        }
        return _stack.removeLast();
      }

      /* Return list for printing */
      int peek() {
        if (isEmpty()) {
          throw Exception("Stack is empty");
        }
        return _stack.last;
      }

      /* Convert stack to Array and return */
      List<int> toArray() => _stack;
    }
    ```

=== "Rust"

    ```rust title="array_stack.rs"
    /* Stack based on array implementation */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* Access top of the stack element */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* Get the length of the stack */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* Check if the stack is empty */
        fn is_empty(&self) -> bool {
            self.size() == 0
        }

        /* Push */
        fn push(&mut self, num: T) {
            self.stack.push(num);
        }

        /* Pop */
        fn pop(&mut self) -> Option<T> {
            self.stack.pop()
        }

        /* Return list for printing */
        fn peek(&self) -> Option<&T> {
            if self.is_empty() {
                panic!("Stack is empty")
            };
            self.stack.last()
        }

        /* Return &Vec */
        fn to_array(&self) -> &Vec<T> {
            &self.stack
        }
    }
    ```

=== "C"

    ```c title="array_stack.c"
    /* Stack based on array implementation */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* Constructor */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // Initialize with large capacity to avoid expansion
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* Destructor */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* Get the length of the stack */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* Check if the stack is empty */
    bool isEmpty(ArrayStack *stack) {
        return stack->size == 0;
    }

    /* Push */
    void push(ArrayStack *stack, int num) {
        if (stack->size == MAX_SIZE) {
            printf("Stack is full\n");
            return;
        }
        stack->data[stack->size] = num;
        stack->size++;
    }

    /* Return list for printing */
    int peek(ArrayStack *stack) {
        if (stack->size == 0) {
            printf("Stack is empty\n");
            return INT_MAX;
        }
        return stack->data[stack->size - 1];
    }

    /* Pop */
    int pop(ArrayStack *stack) {
        int val = peek(stack);
        stack->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_stack.kt"
    /* Stack based on array implementation */
    class ArrayStack {
        // Initialize list (dynamic array)
        private val stack = mutableListOf<Int>()

        /* Get the length of the stack */
        fun size(): Int {
            return stack.size
        }

        /* Check if the stack is empty */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Push */
        fun push(num: Int) {
            stack.add(num)
        }

        /* Pop */
        fun pop(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack.removeAt(size() - 1)
        }

        /* Return list for printing */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack[size() - 1]
        }

        /* Convert List to Array and return */
        fun toArray(): Array<Any> {
            return stack.toTypedArray()
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_stack.rb"
    ### Stack based on array ###
    class ArrayStack
      ### Constructor ###
      def initialize
        @stack = []
      end

      ### Get stack length ###
      def size
        @stack.length
      end

      ### Check if stack is empty ###
      def is_empty?
        @stack.empty?
      end

      ### Push ###
      def push(item)
        @stack << item
      end

      ### Pop ###
      def pop
        raise IndexError, 'Stack is empty' if is_empty?

        @stack.pop
      end

      ### Access top element ###
      def peek
        raise IndexError, 'Stack is empty' if is_empty?

        @stack.last
      end

      ### Return list for printing ###
      def to_array
        @stack
      end
    end
    ```

## 5.1.3 &nbsp; Comparison of the Two Implementations

**Supported Operations**

Both implementations support all operations defined by the stack. The array implementation additionally supports random access, but this goes beyond the stack definition and is generally not used.

**Time Efficiency**

In the array-based implementation, both push and pop operations occur in pre-allocated contiguous memory, which has good cache locality and is therefore more efficient. However, if pushing exceeds the array capacity, it triggers an expansion mechanism, causing the time complexity of that particular push operation to become $O(n)$.

In the linked list-based implementation, list expansion is very flexible, and there is no issue of reduced efficiency due to array expansion. However, the push operation requires initializing a node object and modifying pointers, so it is relatively less efficient. Nevertheless, if the pushed elements are already node objects, the initialization step can be omitted, thereby improving efficiency.

In summary, when the elements pushed and popped are basic data types such as `int` or `double`, we can draw the following conclusions:

- The array-based stack implementation has reduced efficiency when expansion is triggered, but since expansion is an infrequent operation, the average efficiency is higher.
- The linked list-based stack implementation can provide more stable efficiency performance.

**Space Efficiency**

When initializing a list, the system allocates an "initial capacity" that may exceed the actual need. Additionally, the expansion mechanism typically expands at a specific ratio (e.g., 2x), and the capacity after expansion may also exceed actual needs. Therefore, **the array-based stack implementation may cause some space wastage**.

However, since linked list nodes need to store additional pointers, **the space occupied by linked list nodes is relatively large**.

In summary, we cannot simply determine which implementation is more memory-efficient and need to analyze the specific situation.

## 5.1.4 &nbsp; Typical Applications of Stack

- **Back and forward in browsers, undo and redo in software**. Every time we open a new webpage, the browser pushes the previous page onto the stack, allowing us to return to the previous page via the back operation. The back operation is essentially performing a pop. To support both back and forward, two stacks are needed to work together.
- **Program memory management**. Each time a function is called, the system adds a stack frame to the top of the stack to record the function's context information. During recursion, the downward recursive phase continuously performs push operations, while the upward backtracking phase continuously performs pop operations.
