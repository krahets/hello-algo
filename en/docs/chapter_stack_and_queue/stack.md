---
comments: true
---

# 5.1 &nbsp; Stacks

A <u>stack</u> is a linear data structure that follows a last-in, first-out rule.

Think of a stack of plates on a table. If we can move only one plate at a time, reaching the bottom plate requires removing all the plates above it first. Replace the plates with elements such as integers, characters, or objects, and we have a stack.

As shown below, the upper end is the “top” of the stack and the lower end is the “bottom.” Adding an element to the top is called “pushing,” and removing the top element is called “popping.”

![The last-in, first-out rule of a stack](stack.assets/stack_operations.png){ class="animation-figure" }

<p align="center"> Figure 5-1 &nbsp; The last-in, first-out rule of a stack </p>

## 5.1.1 &nbsp; Common stack operations

Table 5-1 lists common operations. Actual method names depend on the programming language; here we use the familiar names `push()`, `pop()`, and `peek()`.

<p align="center"> Table 5-1 &nbsp; Efficiency of stack operations </p>

<div class="center-table" markdown>

| Method     | Description                   | Time complexity |
| -------- | ---------------------- | ---------- |
| `push()` | Push an element onto the top | $O(1)$     |
| `pop()`  | Remove the top element           | $O(1)$     |
| `peek()` | Access the top element           | $O(1)$     |

</div>

We can usually use a language's built-in stack class. If no dedicated class is provided, use an array or linked list as a stack and avoid operations unrelated to stack behavior.

=== "Python"

    ```python title="stack.py"
    # Initialize a stack
    # Python has no built-in stack class; use a list as a stack
    stack: list[int] = []

    # Push elements
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # Access the top element
    peek: int = stack[-1]

    # Pop an element
    pop: int = stack.pop()

    # Get the stack size
    size: int = len(stack)

    # Check whether the stack is empty
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* Initialize a stack */
    stack<int> stack;

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element */
    int top = stack.top();

    /* Pop an element */
    stack.pop(); // No return value

    /* Get the stack size */
    int size = stack.size();

    /* Check whether the stack is empty */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* Initialize a stack */
    Stack<Integer> stack = new Stack<>();

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element */
    int peek = stack.peek();

    /* Pop an element */
    int pop = stack.pop();

    /* Get the stack size */
    int size = stack.size();

    /* Check whether the stack is empty */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* Initialize a stack */
    Stack<int> stack = new();

    /* Push elements */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* Access the top element */
    int peek = stack.Peek();

    /* Pop an element */
    int pop = stack.Pop();

    /* Get the stack size */
    int size = stack.Count;

    /* Check whether the stack is empty */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* Initialize a stack */
    // In Go, a slice is recommended for use as a stack
    var stack []int

    /* Push elements */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* Access the top element */
    peek := stack[len(stack)-1]

    /* Pop an element */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* Get the stack size */
    size := len(stack)

    /* Check whether the stack is empty */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* Initialize a stack */
    // Swift has no built-in stack class; use an Array as a stack
    var stack: [Int] = []

    /* Push elements */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* Access the top element */
    let peek = stack.last!

    /* Pop an element */
    let pop = stack.removeLast()

    /* Get the stack size */
    let size = stack.count

    /* Check whether the stack is empty */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* Initialize a stack */
    // JavaScript has no built-in stack class; use an Array as a stack
    const stack = [];

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element */
    const peek = stack[stack.length-1];

    /* Pop an element */
    const pop = stack.pop();

    /* Get the stack size */
    const size = stack.length;

    /* Check whether the stack is empty */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* Initialize a stack */
    // TypeScript has no built-in stack class; use an Array as a stack
    const stack: number[] = [];

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element */
    const peek = stack[stack.length - 1];

    /* Pop an element */
    const pop = stack.pop();

    /* Get the stack size */
    const size = stack.length;

    /* Check whether the stack is empty */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* Initialize a stack */
    // Dart has no built-in stack class; use a List as a stack
    List<int> stack = [];

    /* Push elements */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* Access the top element */
    int peek = stack.last;

    /* Pop an element */
    int pop = stack.removeLast();

    /* Get the stack size */
    int size = stack.length;

    /* Check whether the stack is empty */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* Initialize a stack */
    // Use a Vec as a stack
    let mut stack: Vec<i32> = Vec::new();

    /* Push elements */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element */
    let top = stack.last().unwrap();

    /* Pop an element */
    let pop = stack.pop().unwrap();

    /* Get the stack size */
    let size = stack.len();

    /* Check whether the stack is empty */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C provides no built-in stack
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"
    /* Initialize a stack */
    val stack = Stack<Int>()

    /* Push elements */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)

    /* Access the top element */
    val peek = stack.peek()

    /* Pop an element */
    val pop = stack.pop()

    /* Get the stack size */
    val size = stack.size

    /* Check whether the stack is empty */
    val isEmpty = stack.isEmpty()
    ```

=== "Ruby"

    ```ruby title="stack.rb"
    # Initialize a stack
    # Ruby has no built-in stack class; use an Array as a stack
    stack = []

    # Push elements
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # Access the top element
    peek = stack.last

    # Pop an element
    pop = stack.pop

    # Get the stack size
    size = stack.length

    # Check whether the stack is empty
    is_empty = stack.empty?
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20stack%0A%20%20%20%20%23%20Python%20has%20no%20built-in%20stack%20class%3B%20use%20a%20list%20as%20a%20stack%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20Push%20elements%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22Stack%3A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22Top%20element%3A%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%3A%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22After%20popping%3A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22Stack%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20stack%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20stack%0A%20%20%20%20%23%20Python%20has%20no%20built-in%20stack%20class%3B%20use%20a%20list%20as%20a%20stack%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20Push%20elements%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22Stack%3A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22Top%20element%3A%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%3A%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22After%20popping%3A%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22Stack%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20stack%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 5.1.2 &nbsp; Implementing a stack

To understand how a stack works more deeply, let us implement a stack class ourselves.

A stack follows last-in, first-out order, so elements can be added or removed only at the top. Arrays and linked lists allow insertion and deletion at arbitrary positions, **so a stack can be viewed as a restricted array or linked list**. By hiding irrelevant operations, we make its public behavior conform to the stack's rules.

### 1. &nbsp; Implementation with a linked list

When implementing a stack with a linked list, treat the head as the top and the tail as the bottom.

As shown below, pushing simply inserts a node at the head, an operation called “head insertion.” Popping removes the head node.

=== "<1>"
    ![Push and pop in a linked-list stack](stack.assets/linkedlist_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> Figure 5-2 &nbsp; Push and pop in a linked-list stack </p>

Here is an implementation using a linked list:

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """Stack implemented with a linked list"""

        def __init__(self):
            """Constructor"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """Get the stack size"""
            return self._size

        def is_empty(self) -> bool:
            """Check whether the stack is empty"""
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
            """Access the top element"""
            if self.is_empty():
                raise IndexError("Stack is empty")
            return self._peek.val

        def to_list(self) -> list[int]:
            """Convert to a list for printing"""
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
    /* Stack implemented with a linked list */
    class LinkedListStack {
      private:
        ListNode *stackTop; // Use the head node as the stack top
        int stkSize;        // Stack size

      public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }

        ~LinkedListStack() {
            // Traverse the linked list and delete each node to free its memory
            freeMemoryLinkedList(stackTop);
        }

        /* Get the stack size */
        int size() {
            return stkSize;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        int top() {
            if (isEmpty())
                throw out_of_range("Stack is empty");
            return stackTop->val;
        }

        /* Convert the linked list to a vector and return it */
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
    /* Stack implemented with a linked list */
    class LinkedListStack {
        private ListNode stackPeek; // Use the head node as the stack top
        private int stkSize = 0; // Stack size

        public LinkedListStack() {
            stackPeek = null;
        }

        /* Get the stack size */
        public int size() {
            return stkSize;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stackPeek.val;
        }

        /* Convert the list to an array and return it */
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
    /* Stack implemented with a linked list */
    class LinkedListStack {
        ListNode? stackPeek;  // Use the head node as the stack top
        int stkSize = 0;   // Stack size

        public LinkedListStack() {
            stackPeek = null;
        }

        /* Get the stack size */
        public int Size() {
            return stkSize;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stackPeek!.val;
        }

        /* Convert the linked list to an array and return it */
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
    /* Stack implemented with a linked list */
    type linkedListStack struct {
        // Use the standard library list package to implement the stack
        data *list.List
    }

    /* Initialize the stack */
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

    /* Access the top element */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* Get the stack size */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* Check whether the stack is empty */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Get the list for printing */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* Stack implemented with a linked list */
    class LinkedListStack {
        private var _peek: ListNode? // Use the head node as the stack top
        private var _size: Int // Stack size

        init() {
            _size = 0
        }

        /* Get the stack size */
        func size() -> Int {
            _size
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Stack is empty")
            }
            return _peek!.val
        }

        /* Convert the linked list to an array and return it */
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
    /* Stack implemented with a linked list */
    class LinkedListStack {
        #stackPeek; // Use the head node as the stack top
        #stkSize = 0; // Stack size

        constructor() {
            this.#stackPeek = null;
        }

        /* Get the stack size */
        get size() {
            return this.#stkSize;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        peek() {
            if (!this.#stackPeek) throw new Error('Stack is empty');
            return this.#stackPeek.val;
        }

        /* Convert the linked list to an Array and return it */
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
    /* Stack implemented with a linked list */
    class LinkedListStack {
        private stackPeek: ListNode | null; // Use the head node as the stack top
        private stkSize: number = 0; // Stack size

        constructor() {
            this.stackPeek = null;
        }

        /* Get the stack size */
        get size(): number {
            return this.stkSize;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        peek(): number {
            if (!this.stackPeek) throw new Error('Stack is empty');
            return this.stackPeek.val;
        }

        /* Convert the linked list to an Array and return it */
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
    /* Stack implemented with a linked list */
    class LinkedListStack {
      ListNode? _stackPeek; // Use the head node as the stack top
      int _stkSize = 0; // Stack size

      LinkedListStack() {
        _stackPeek = null;
      }

      /* Get the stack size */
      int size() {
        return _stkSize;
      }

      /* Check whether the stack is empty */
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

      /* Access the top element */
      int peek() {
        if (_stackPeek == null) {
          throw Exception("Stack is empty");
        }
        return _stackPeek!.val;
      }

      /* Convert the linked list to a List and return it */
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
    /* Stack implemented with a linked list */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Use the head node as the stack top
        stk_size: usize,                              // Stack size
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* Get the stack size */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.stack_peek.as_ref()
        }

        /* Convert the linked list to a vector and return it */
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
    /* Stack implemented with a linked list */
    typedef struct {
        ListNode *top; // Use the head node as the stack top
        int size;      // Stack size
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

    /* Get the stack size */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* Check whether the stack is empty */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* Push */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // Set the new node's pointer field
        node->val = num;     // Set the new node's data field
        s->top = node;       // Update the stack top
        s->size++;           // Update the stack size
    }

    /* Access the top element */
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
    /* Stack implemented with a linked list */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // Use the head node as the stack top
        private var stkSize: Int = 0 // Stack size
    ) {

        /* Get the stack size */
        fun size(): Int {
            return stkSize
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        fun peek(): Int? {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stackPeek?._val
        }

        /* Convert the list to an array and return it */
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
    ### Stack implemented with a linked list ###
    class LinkedListStack
      attr_reader :size

      ### Constructor ###
      def initialize
        @size = 0
      end

      ### Check whether the stack is empty ###
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

      ### Access the top element ###
      def peek
        raise IndexError, 'Stack is empty' if is_empty?

        @peek.val
      end

      ### Convert the linked list to an Array and return it ###
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

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22Stack%20implemented%20with%20a%20linked%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20stack%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20stack%20is%20empty%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Push%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Pop%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Access%20the%20top%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Stack%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Convert%20to%20a%20list%20for%20printing%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20stack%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20Push%20elements%20onto%20the%20stack%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22Stack%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22Top%20element%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%20from%20the%20stack%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22After%20popping,%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22Stack%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20it%20is%20empty%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22Stack%20implemented%20with%20a%20linked%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20stack%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20stack%20is%20empty%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Push%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Pop%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Access%20the%20top%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Stack%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Convert%20to%20a%20list%20for%20printing%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20stack%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20Push%20elements%20onto%20the%20stack%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22Stack%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22Top%20element%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%20from%20the%20stack%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22After%20popping,%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22Stack%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20it%20is%20empty%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Implementation with an array

For an array-based stack, use the end of the array as the top. As shown below, pushing and popping correspond to adding and removing the last element, both taking $O(1)$ time.

=== "<1>"
    ![Push and pop in an array-based stack](stack.assets/array_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![array_stack_push](stack.assets/array_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> Figure 5-3 &nbsp; Push and pop in an array-based stack </p>

Since elements may keep arriving, use a dynamic array so that resizing is handled for us. An implementation follows:

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """Stack implemented with an array"""

        def __init__(self):
            """Constructor"""
            self._stack: list[int] = []

        def size(self) -> int:
            """Get the stack size"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """Check whether the stack is empty"""
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
            """Access the top element"""
            if self.is_empty():
                raise IndexError("Stack is empty")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """Return a list for printing"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* Stack implemented with an array */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* Get the stack size */
        int size() {
            return stack.size();
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        int top() {
            if (isEmpty())
                throw out_of_range("Stack is empty");
            return stack.back();
        }

        /* Return a vector */
        vector<int> toVector() {
            return stack;
        }
    };
    ```

=== "Java"

    ```java title="array_stack.java"
    /* Stack implemented with an array */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // Initialize the list (dynamic array)
            stack = new ArrayList<>();
        }

        /* Get the stack size */
        public int size() {
            return stack.size();
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.get(size() - 1);
        }

        /* Convert the list to an array and return it */
        public Object[] toArray() {
            return stack.toArray();
        }
    }
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* Stack implemented with an array */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // Initialize the list (dynamic array)
            stack = [];
        }

        /* Get the stack size */
        public int Size() {
            return stack.Count;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stack[Size() - 1];
        }

        /* Convert the list to an array and return it */
        public int[] ToArray() {
            return [.. stack];
        }
    }
    ```

=== "Go"

    ```go title="array_stack.go"
    /* Stack implemented with an array */
    type arrayStack struct {
        data []int // Data
    }

    /* Initialize the stack */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // Set the stack length to 0 and its capacity to 16
            data: make([]int, 0, 16),
        }
    }

    /* Stack size */
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    /* Check whether the stack is empty */
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    /* Push */
    func (s *arrayStack) push(v int) {
        // Appending grows the slice capacity automatically when needed
        s.data = append(s.data, v)
    }

    /* Pop */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* Get the top element */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* Get a slice for printing */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* Stack implemented with an array */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // Initialize the list (dynamic array)
            stack = []
        }

        /* Get the stack size */
        func size() -> Int {
            stack.count
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Stack is empty")
            }
            return stack.last!
        }

        /* Return the stack elements as an array */
        func toArray() -> [Int] {
            stack
        }
    }
    ```

=== "JS"

    ```javascript title="array_stack.js"
    /* Stack implemented with an array */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* Get the stack size */
        get size() {
            return this.#stack.length;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        top() {
            if (this.isEmpty()) throw new Error('Stack is empty');
            return this.#stack[this.#stack.length - 1];
        }

        /* Return an Array */
        toArray() {
            return this.#stack;
        }
    }
    ```

=== "TS"

    ```typescript title="array_stack.ts"
    /* Stack implemented with an array */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* Get the stack size */
        get size(): number {
            return this.stack.length;
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        top(): number | undefined {
            if (this.isEmpty()) throw new Error('Stack is empty');
            return this.stack[this.stack.length - 1];
        }

        /* Return an Array */
        toArray() {
            return this.stack;
        }
    }
    ```

=== "Dart"

    ```dart title="array_stack.dart"
    /* Stack implemented with an array */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* Get the stack size */
      int size() {
        return _stack.length;
      }

      /* Check whether the stack is empty */
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

      /* Access the top element */
      int peek() {
        if (isEmpty()) {
          throw Exception("Stack is empty");
        }
        return _stack.last;
      }

      /* Return the underlying stack array */
      List<int> toArray() => _stack;
    }
    ```

=== "Rust"

    ```rust title="array_stack.rs"
    /* Stack implemented with an array */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* Initialize the stack */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* Get the stack size */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        fn peek(&self) -> Option<&T> {
            if self.is_empty() {
                panic!("Stack is empty")
            };
            self.stack.last()
        }

        /* Return a reference to the vector */
        fn to_array(&self) -> &Vec<T> {
            &self.stack
        }
    }
    ```

=== "C"

    ```c title="array_stack.c"
    /* Stack implemented with an array */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* Constructor */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // Initialize with a large capacity to avoid resizing
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* Destructor */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* Get the stack size */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* Check whether the stack is empty */
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

    /* Access the top element */
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
    /* Stack implemented with an array */
    class ArrayStack {
        // Initialize the list (dynamic array)
        private val stack = mutableListOf<Int>()

        /* Get the stack size */
        fun size(): Int {
            return stack.size
        }

        /* Check whether the stack is empty */
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

        /* Access the top element */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack[size() - 1]
        }

        /* Convert the list to an array and return it */
        fun toArray(): Array<Any> {
            return stack.toTypedArray()
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_stack.rb"
    ### Stack implemented with an array ###
    class ArrayStack
      ### Constructor ###
      def initialize
        @stack = []
      end

      ### Get the stack size ###
      def size
        @stack.length
      end

      ### Check whether the stack is empty ###
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

      ### Access the top element ###
      def peek
        raise IndexError, 'Stack is empty' if is_empty?

        @stack.last
      end

      ### Return a list for printing ###
      def to_array
        @stack
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22Stack%20implemented%20with%20an%20array%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20stack%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20stack%20is%20empty%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Push%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Pop%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Stack%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Access%20the%20top%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Stack%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Return%20a%20list%20for%20printing%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20stack%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20Push%20elements%20onto%20the%20stack%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22Stack%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22Top%20element%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%20from%20the%20stack%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22After%20popping,%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22Stack%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20it%20is%20empty%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22Stack%20implemented%20with%20an%20array%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20stack%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20stack%20is%20empty%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Push%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Pop%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Stack%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Access%20the%20top%20element%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Stack%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Return%20a%20list%20for%20printing%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20stack%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20Push%20elements%20onto%20the%20stack%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22Stack%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Access%20the%20top%20element%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22Top%20element%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Pop%20an%20element%20from%20the%20stack%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22Popped%20element%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22After%20popping,%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20Get%20the%20stack%20size%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22Stack%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20it%20is%20empty%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22Is%20the%20stack%20empty%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 5.1.3 &nbsp; Comparing the implementations

**Supported operations**

Both implementations support all stack operations. An array also allows random access, but that is outside the stack abstraction and is generally not used.

**Time efficiency**

In an array-based stack, pushes and pops operate in preallocated contiguous memory, giving good cache locality and high efficiency. However, a push that exceeds the array's capacity triggers expansion, making that particular push an $O(n)$ operation.

A linked list grows flexibly and avoids the slowdown associated with array expansion. However, pushing requires creating a node object and updating pointers, so it is relatively slower. If the element is already a node object, the creation step can be skipped to improve efficiency.

For elements of primitive types such as `int` or `double`, we can therefore draw the following conclusions.

- An array-based stack slows down when expansion is triggered, but expansion is infrequent, so average efficiency is higher.
- A linked-list stack provides more consistent performance.

**Space efficiency**

When a dynamic array is initialized, its initial capacity may exceed actual needs. Expansion typically multiplies the capacity by a fixed factor, such as 2, which may again leave excess space. **An array-based stack can therefore waste some space**.

However, linked-list nodes also store pointers, **so each node occupies relatively more space**.

We cannot say universally which implementation uses less memory; the answer depends on the situation.

## 5.1.4 &nbsp; Typical applications

- **Browser back and forward navigation, and software undo and redo**. When a new web page is opened, the browser pushes the previous page onto a stack. Going back pops that page. Supporting both back and forward requires two stacks working together.
- **Program memory management**. Each function call adds a stack frame containing the function's context. During recursion, frames are pushed as calls descend and popped as they return.
