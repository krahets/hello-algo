---
comments: true
---

# 5.2 &nbsp; Queues

A <u>queue</u> is a linear data structure that follows the first-in, first-out rule. Picture a line of people: newcomers join at the back, and people leave one at a time from the front.

The two ends of a queue are called the front and the rear, as shown below. Adding an element at the rear is called enqueueing, and removing the element at the front is called dequeueing.

![The first-in, first-out rule for queues](queue.assets/queue_operations.svg){ class="animation-figure" }

<p align="center"> Figure 5-4 &nbsp; The first-in, first-out rule for queues </p>

## 5.2.1 &nbsp; Common queue operations

Table 5-2 lists common queue operations. Method names vary across programming languages. Here we use the same names as for stacks.

<p align="center"> Table 5-2 &nbsp; Time complexity of queue operations </p>

<div class="center-table" markdown>

| Method name   | Description                         | Time complexity |
| -------- | ---------------------------- | ---------- |
| `push()` | Enqueue an element by adding it at the rear | $O(1)$     |
| `pop()`  | Dequeue the front element                 | $O(1)$     |
| `peek()` | Access the front element                 | $O(1)$     |

</div>

You can use the queue class your programming language provides:

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # Initialize the queue
    # In Python, the double-ended queue class deque is commonly used as a FIFO queue
    # queue.Queue() creates a dedicated queue, but it is less convenient here, so we do not recommend it
    que: deque[int] = deque()

    # Enqueue elements
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # Peek at the front element
    front: int = que[0]

    # Dequeue an element
    pop: int = que.popleft()

    # Get the queue size
    size: int = len(que)

    # Check whether the queue is empty
    is_empty: bool = len(que) == 0
    ```

=== "C++"

    ```cpp title="queue.cpp"
    /* Initialize the queue */
    queue<int> queue;

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Peek at the front element */
    int front = queue.front();

    /* Dequeue an element */
    queue.pop();

    /* Get the queue size */
    int size = queue.size();

    /* Check whether the queue is empty */
    bool empty = queue.empty();
    ```

=== "Java"

    ```java title="queue.java"
    /* Initialize the queue */
    Queue<Integer> queue = new LinkedList<>();

    /* Enqueue elements */
    queue.offer(1);
    queue.offer(3);
    queue.offer(2);
    queue.offer(5);
    queue.offer(4);

    /* Peek at the front element */
    int peek = queue.peek();

    /* Dequeue an element */
    int pop = queue.poll();

    /* Get the queue size */
    int size = queue.size();

    /* Check whether the queue is empty */
    boolean isEmpty = queue.isEmpty();
    ```

=== "C#"

    ```csharp title="queue.cs"
    /* Initialize the queue */
    Queue<int> queue = new();

    /* Enqueue elements */
    queue.Enqueue(1);
    queue.Enqueue(3);
    queue.Enqueue(2);
    queue.Enqueue(5);
    queue.Enqueue(4);

    /* Peek at the front element */
    int peek = queue.Peek();

    /* Dequeue an element */
    int pop = queue.Dequeue();

    /* Get the queue size */
    int size = queue.Count;

    /* Check whether the queue is empty */
    bool isEmpty = queue.Count == 0;
    ```

=== "Go"

    ```go title="queue_test.go"
    /* Initialize the queue */
    // Use Go's list.List as a queue
    queue := list.New()

    /* Enqueue elements */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)

    /* Peek at the front element */
    peek := queue.Front()

    /* Dequeue an element */
    pop := queue.Front()
    queue.Remove(pop)

    /* Get the queue size */
    size := queue.Len()

    /* Check whether the queue is empty */
    isEmpty := queue.Len() == 0
    ```

=== "Swift"

    ```swift title="queue.swift"
    /* Initialize the queue */
    // Swift has no built-in queue class, so use an Array as a queue
    var queue: [Int] = []

    /* Enqueue elements */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)

    /* Peek at the front element */
    let peek = queue.first!

    /* Dequeue an element */
    // With an Array, removeFirst takes O(n) time
    let pop = queue.removeFirst()

    /* Get the queue size */
    let size = queue.count

    /* Check whether the queue is empty */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* Initialize the queue */
    // JavaScript has no built-in queue, so use an Array as a queue
    const queue = [];

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Peek at the front element */
    const peek = queue[0];

    /* Dequeue an element */
    // shift() takes O(n) time because the queue uses an array
    const pop = queue.shift();

    /* Get the queue size */
    const size = queue.length;

    /* Check whether the queue is empty */
    const isEmpty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* Initialize the queue */
    // TypeScript has no built-in queue, so use an Array as a queue
    const queue: number[] = [];

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Peek at the front element */
    const peek = queue[0];

    /* Dequeue an element */
    // shift() takes O(n) time because the queue uses an array
    const pop = queue.shift();

    /* Get the queue size */
    const size = queue.length;

    /* Check whether the queue is empty */
    const isEmpty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* Initialize the queue */
    // In Dart, the double-ended Queue is commonly used as a queue
    final Queue<int> queue = Queue();

    /* Enqueue elements */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* Peek at the front element */
    final int peek = queue.first;

    /* Dequeue an element */
    final int pop = queue.removeFirst();

    /* Get the queue size */
    final int size = queue.length;

    /* Check whether the queue is empty */
    final bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"
    // Initialize the queue
    // In Rust, the double-ended VecDeque is commonly used as a queue
    let mut queue: VecDeque<i32> = VecDeque::new();

    // Enqueue elements
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);

    // Peek at the front element
    let peek = queue.front().unwrap();

    // Dequeue an element
    let pop = queue.pop_front().unwrap();

    // Get the queue size
    let size = queue.len();

    // Check whether the queue is empty
    let is_empty = queue.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // C has no built-in queue
    ```

=== "Kotlin"

    ```kotlin title="queue.kt"
    /* Initialize the queue */
    val queue = LinkedList<Int>()

    /* Enqueue elements */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)

    /* Peek at the front element */
    val peek = queue.peek()

    /* Dequeue an element */
    val pop = queue.poll()

    /* Get the queue size */
    val size = queue.size

    /* Check whether the queue is empty */
    val isEmpty = queue.isEmpty()
    ```

=== "Ruby"

    ```ruby title="queue.rb"
    # Initialize the queue
    # Ruby's built-in Thread::Queue has no methods for peeking or iterating, so use an Array as a queue
    queue = []

    # Enqueue elements
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)

    # Peek at the front element
    peek = queue.first

    # Dequeue an element
    # Array#shift takes O(n) time because the queue uses an array
    pop = queue.shift

    # Get the queue size
    size = queue.length

    # Check whether the queue is empty
    is_empty = queue.empty?
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20%23%20In%20Python,%20we%20commonly%20use%20the%20double-ended%20queue%20class%20deque%20as%20a%20queue%0A%20%20%20%20%23%20queue.Queue%28%29%20creates%20a%20dedicated%20queue,%20but%20it%20is%20less%20convenient%20to%20use%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22Queue%20%28que%29%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20Read%20the%20front%20element%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22Front%20element%20%28front%29%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22que%20after%20dequeue%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20length%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22Queue%20length%20%28size%29%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20%23%20In%20Python,%20we%20commonly%20use%20the%20double-ended%20queue%20class%20deque%20as%20a%20queue%0A%20%20%20%20%23%20queue.Queue%28%29%20creates%20a%20dedicated%20queue,%20but%20it%20is%20less%20convenient%20to%20use%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22Queue%20%28que%29%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20Read%20the%20front%20element%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22Front%20element%20%28front%29%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22que%20after%20dequeue%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20length%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22Queue%20length%20%28size%29%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 5.2.2 &nbsp; Implementing a queue

A queue needs a data structure that lets us add elements at one end and remove them from the other. Both linked lists and arrays meet this requirement.

### 1. &nbsp; Linked list implementation

As shown below, we can use the head of a linked list as the front of the queue and the tail as the rear. We add nodes only at the rear and remove them only from the front.

=== "<1>"
    ![Enqueueing and dequeueing with a linked list](queue.assets/linkedlist_queue_step1.svg){ class="animation-figure" }

=== "<2>"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.svg){ class="animation-figure" }

=== "<3>"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.svg){ class="animation-figure" }

<p align="center"> Figure 5-5 &nbsp; Enqueueing and dequeueing with a linked list </p>

The following code implements a queue with a linked list:

=== "Python"

    ```python title="linkedlist_queue.py"
    class LinkedListQueue:
        """Queue backed by a linked list."""

        def __init__(self):
            """Initialize the queue."""
            self._front: ListNode | None = None  # Head node (_front)
            self._rear: ListNode | None = None  # Tail node (_rear)
            self._size: int = 0

        def size(self) -> int:
            """Get the queue size."""
            return self._size

        def is_empty(self) -> bool:
            """Check whether the queue is empty."""
            return self._size == 0

        def push(self, num: int):
            """Enqueue an element."""
            # Add a node containing num after the tail
            node = ListNode(num)
            # If the queue is empty, point both the head and tail at the new node
            if self._front is None:
                self._front = node
                self._rear = node
            # If the queue has elements, link the new node after the tail
            else:
                self._rear.next = node
                self._rear = node
            self._size += 1

        def pop(self) -> int:
            """Remove and return the front element."""
            num = self.peek()
            # Remove the head node
            self._front = self._front.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """Peek at the front element."""
            if self.is_empty():
                raise IndexError("Queue is empty")
            return self._front.val

        def to_list(self) -> list[int]:
            """Convert to a list for printing."""
            queue = []
            temp = self._front
            while temp:
                queue.append(temp.val)
                temp = temp.next
            return queue
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    /* Queue backed by a linked list */
    class LinkedListQueue {
      private:
        ListNode *front, *rear; // front points to the head node and rear to the tail node
        int queSize;

      public:
        LinkedListQueue() {
            front = nullptr;
            rear = nullptr;
            queSize = 0;
        }

        ~LinkedListQueue() {
            // Walk the list and delete each node to free its memory
            freeMemoryLinkedList(front);
        }

        /* Get the queue size */
        int size() {
            return queSize;
        }

        /* Check whether the queue is empty */
        bool isEmpty() {
            return queSize == 0;
        }

        /* Enqueue an element */
        void push(int num) {
            // Add a node containing num after the tail
            ListNode *node = new ListNode(num);
            // If the queue is empty, point both the head and tail at the new node
            if (front == nullptr) {
                front = node;
                rear = node;
            }
            // If the queue has elements, link the new node after the tail
            else {
                rear->next = node;
                rear = node;
            }
            queSize++;
        }

        /* Remove and return the front element */
        int pop() {
            int num = peek();
            // Remove the head node
            ListNode *tmp = front;
            front = front->next;
            // Free the allocated memory
            delete tmp;
            queSize--;
            return num;
        }

        /* Peek at the front element */
        int peek() {
            if (size() == 0)
                throw out_of_range("Queue is empty");
            return front->val;
        }

        /* Return the linked list elements as a vector */
        vector<int> toVector() {
            ListNode *node = front;
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

    ```java title="linkedlist_queue.java"
    /* Queue backed by a linked list */
    class LinkedListQueue {
        private ListNode front, rear; // front points to the head node and rear to the tail node
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Get the queue size */
        public int size() {
            return queSize;
        }

        /* Check whether the queue is empty */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Enqueue an element */
        public void push(int num) {
            // Add a node containing num after the tail
            ListNode node = new ListNode(num);
            // If the queue is empty, point both the head and tail at the new node
            if (front == null) {
                front = node;
                rear = node;
            // If the queue has elements, link the new node after the tail
            } else {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Remove and return the front element */
        public int pop() {
            int num = peek();
            // Remove the head node
            front = front.next;
            queSize--;
            return num;
        }

        /* Peek at the front element */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* Return the linked list elements as an array */
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

    ```csharp title="linkedlist_queue.cs"
    /* Queue backed by a linked list */
    class LinkedListQueue {
        ListNode? front, rear;  // front points to the head node and rear to the tail node 
        int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Get the queue size */
        public int Size() {
            return queSize;
        }

        /* Check whether the queue is empty */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Enqueue an element */
        public void Push(int num) {
            // Add a node containing num after the tail
            ListNode node = new(num);
            // If the queue is empty, point both the head and tail at the new node
            if (front == null) {
                front = node;
                rear = node;
                // If the queue has elements, link the new node after the tail
            } else if (rear != null) {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Remove and return the front element */
        public int Pop() {
            int num = Peek();
            // Remove the head node
            front = front?.next;
            queSize--;
            return num;
        }

        /* Peek at the front element */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return front!.val;
        }

        /* Return the linked list elements as an array */
        public int[] ToArray() {
            if (front == null)
                return [];

            ListNode? node = front;
            int[] res = new int[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node!.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    /* Queue backed by a linked list */
    type linkedListQueue struct {
        // Use the standard list package to implement the queue
        data *list.List
    }

    /* Initialize the queue */
    func newLinkedListQueue() *linkedListQueue {
        return &linkedListQueue{
            data: list.New(),
        }
    }

    /* Enqueue an element */
    func (s *linkedListQueue) push(value any) {
        s.data.PushBack(value)
    }

    /* Remove and return the front element */
    func (s *linkedListQueue) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* Peek at the front element */
    func (s *linkedListQueue) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* Get the queue size */
    func (s *linkedListQueue) size() int {
        return s.data.Len()
    }

    /* Check whether the queue is empty */
    func (s *linkedListQueue) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Return the list for printing */
    func (s *linkedListQueue) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    /* Queue backed by a linked list */
    class LinkedListQueue {
        private var front: ListNode? // Head node
        private var rear: ListNode? // Tail node
        private var _size: Int

        init() {
            _size = 0
        }

        /* Get the queue size */
        func size() -> Int {
            _size
        }

        /* Check whether the queue is empty */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Enqueue an element */
        func push(num: Int) {
            // Add a node containing num after the tail
            let node = ListNode(x: num)
            // If the queue is empty, point both the head and tail at the new node
            if front == nil {
                front = node
                rear = node
            }
            // If the queue has elements, link the new node after the tail
            else {
                rear?.next = node
                rear = node
            }
            _size += 1
        }

        /* Remove and return the front element */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // Remove the head node
            front = front?.next
            _size -= 1
            return num
        }

        /* Peek at the front element */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Queue is empty")
            }
            return front!.val
        }

        /* Return the linked list elements as an array */
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

    ```javascript title="linkedlist_queue.js"
    /* Queue backed by a linked list */
    class LinkedListQueue {
        #front; // Head node (#front)
        #rear; // Tail node (#rear)
        #queSize = 0;

        constructor() {
            this.#front = null;
            this.#rear = null;
        }

        /* Get the queue size */
        get size() {
            return this.#queSize;
        }

        /* Check whether the queue is empty */
        isEmpty() {
            return this.size === 0;
        }

        /* Enqueue an element */
        push(num) {
            // Add a node containing num after the tail
            const node = new ListNode(num);
            // If the queue is empty, point both the head and tail at the new node
            if (!this.#front) {
                this.#front = node;
                this.#rear = node;
                // If the queue has elements, link the new node after the tail
            } else {
                this.#rear.next = node;
                this.#rear = node;
            }
            this.#queSize++;
        }

        /* Remove and return the front element */
        pop() {
            const num = this.peek();
            // Remove the head node
            this.#front = this.#front.next;
            this.#queSize--;
            return num;
        }

        /* Peek at the front element */
        peek() {
            if (this.size === 0) throw new Error('Queue is empty');
            return this.#front.val;
        }

        /* Return the linked list elements as an array */
        toArray() {
            let node = this.#front;
            const res = new Array(this.size);
            for (let i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_queue.ts"
    /* Queue backed by a linked list */
    class LinkedListQueue {
        private front: ListNode | null; // Head node (front)
        private rear: ListNode | null; // Tail node (rear)
        private queSize: number = 0;

        constructor() {
            this.front = null;
            this.rear = null;
        }

        /* Get the queue size */
        get size(): number {
            return this.queSize;
        }

        /* Check whether the queue is empty */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* Enqueue an element */
        push(num: number): void {
            // Add a node containing num after the tail
            const node = new ListNode(num);
            // If the queue is empty, point both the head and tail at the new node
            if (!this.front) {
                this.front = node;
                this.rear = node;
                // If the queue has elements, link the new node after the tail
            } else {
                this.rear!.next = node;
                this.rear = node;
            }
            this.queSize++;
        }

        /* Remove and return the front element */
        pop(): number {
            const num = this.peek();
            if (!this.front) throw new Error('Queue is empty');
            // Remove the head node
            this.front = this.front.next;
            this.queSize--;
            return num;
        }

        /* Peek at the front element */
        peek(): number {
            if (this.size === 0) throw new Error('Queue is empty');
            return this.front!.val;
        }

        /* Return the linked list elements as an array */
        toArray(): number[] {
            let node = this.front;
            const res = new Array<number>(this.size);
            for (let i = 0; i < res.length; i++) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_queue.dart"
    /* Queue backed by a linked list */
    class LinkedListQueue {
      ListNode? _front; // Head node (_front)
      ListNode? _rear; // Tail node (_rear)
      int _queSize = 0; // Queue size

      LinkedListQueue() {
        _front = null;
        _rear = null;
      }

      /* Get the queue size */
      int size() {
        return _queSize;
      }

      /* Check whether the queue is empty */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Enqueue an element */
      void push(int _num) {
        // Add a node containing _num after the tail
        final node = ListNode(_num);
        // If the queue is empty, point both the head and tail at the new node
        if (_front == null) {
          _front = node;
          _rear = node;
        } else {
          // If the queue has elements, link the new node after the tail
          _rear!.next = node;
          _rear = node;
        }
        _queSize++;
      }

      /* Remove and return the front element */
      int pop() {
        final int _num = peek();
        // Remove the head node
        _front = _front!.next;
        _queSize--;
        return _num;
      }

      /* Peek at the front element */
      int peek() {
        if (_queSize == 0) {
          throw Exception('Queue is empty');
        }
        return _front!.val;
      }

      /* Return the linked list values as a List */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> queue = [];
        while (node != null) {
          queue.add(node.val);
          node = node.next;
        }
        return queue;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_queue.rs"
    /* Queue backed by a linked list */
    #[allow(dead_code)]
    pub struct LinkedListQueue<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>, // Head node (front)
        rear: Option<Rc<RefCell<ListNode<T>>>>,  // Tail node (rear)
        que_size: usize,                         // Queue size
    }

    impl<T: Copy> LinkedListQueue<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0,
            }
        }

        /* Get the queue size */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* Check whether the queue is empty */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* Enqueue an element */
        pub fn push(&mut self, num: T) {
            // Add a node containing num after the tail
            let new_rear = ListNode::new(num);
            match self.rear.take() {
                // If the queue has elements, link the new node after the tail
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
                // If the queue is empty, point both the head and tail at the new node
                None => {
                    self.front = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
            }
            self.que_size += 1;
        }

        /* Remove and return the front element */
        pub fn pop(&mut self) -> Option<T> {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        self.front = Some(new_front);
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1;
                old_front.borrow().val
            })
        }

        /* Get a reference to the front node */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* Return the linked list elements as a vector */
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

    ```c title="linkedlist_queue.c"
    /* Queue backed by a linked list */
    typedef struct {
        ListNode *front, *rear;
        int queSize;
    } LinkedListQueue;

    /* Constructor */
    LinkedListQueue *newLinkedListQueue() {
        LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
        queue->front = NULL;
        queue->rear = NULL;
        queue->queSize = 0;
        return queue;
    }

    /* Destructor */
    void delLinkedListQueue(LinkedListQueue *queue) {
        // Free all the nodes
        while (queue->front != NULL) {
            ListNode *tmp = queue->front;
            queue->front = queue->front->next;
            free(tmp);
        }
        // Free the queue structure
        free(queue);
    }

    /* Get the queue size */
    int size(LinkedListQueue *queue) {
        return queue->queSize;
    }

    /* Check whether the queue is empty */
    bool empty(LinkedListQueue *queue) {
        return (size(queue) == 0);
    }

    /* Enqueue an element */
    void push(LinkedListQueue *queue, int num) {
        // Add node at the tail
        ListNode *node = newListNode(num);
        // If the queue is empty, point both the head and tail at the new node
        if (queue->front == NULL) {
            queue->front = node;
            queue->rear = node;
        }
        // If the queue has elements, link the new node after the tail
        else {
            queue->rear->next = node;
            queue->rear = node;
        }
        queue->queSize++;
    }

    /* Peek at the front element */
    int peek(LinkedListQueue *queue) {
        assert(size(queue) && queue->front);
        return queue->front->val;
    }

    /* Remove and return the front element */
    int pop(LinkedListQueue *queue) {
        int num = peek(queue);
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
        queue->queSize--;
        return num;
    }

    /* Print the queue */
    void printLinkedListQueue(LinkedListQueue *queue) {
        int *arr = malloc(sizeof(int) * queue->queSize);
        // Copy the values from the linked list into an array
        int i;
        ListNode *node;
        for (i = 0, node = queue->front; i < queue->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, queue->queSize);
        free(arr);
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_queue.kt"
    /* Queue backed by a linked list */
    class LinkedListQueue(
        // front points to the head node and rear to the tail node
        private var front: ListNode? = null,
        private var rear: ListNode? = null,
        private var queSize: Int = 0
    ) {

        /* Get the queue size */
        fun size(): Int {
            return queSize
        }

        /* Check whether the queue is empty */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Enqueue an element */
        fun push(num: Int) {
            // Add a node containing num after the tail
            val node = ListNode(num)
            // If the queue is empty, point both the head and tail at the new node
            if (front == null) {
                front = node
                rear = node
                // If the queue has elements, link the new node after the tail
            } else {
                rear?.next = node
                rear = node
            }
            queSize++
        }

        /* Remove and return the front element */
        fun pop(): Int {
            val num = peek()
            // Remove the head node
            front = front?.next
            queSize--
            return num
        }

        /* Peek at the front element */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* Return the linked list elements as an array */
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

    ```ruby title="linkedlist_queue.rb"
    ### Queue backed by a linked list ###
    class LinkedListQueue
      ### Get the queue size ###
      attr_reader :size

      ### Constructor ###
      def initialize
        @front = nil  # Head node (@front)
        @rear = nil   # Tail node (@rear)
        @size = 0
      end

      ### Check whether the queue is empty ###
      def is_empty?
        @front.nil?
      end

      ### Enqueue an element ###
      def push(num)
        # Add a node containing num after the tail
        node = ListNode.new(num)

        # If the queue is empty, point both the head and tail at the new node
        if @front.nil?
          @front = node
          @rear = node
        # If the queue has elements, link the new node after the tail
        else
          @rear.next = node
          @rear = node
        end

        @size += 1
      end

      ### Remove and return the front element ###
      def pop
        num = peek
        # Remove the head node
        @front = @front.next
        @size -= 1
        num
      end

      ### Peek at the front element ###
      def peek
        raise IndexError, 'Queue is empty' if is_empty?

        @front.val
      end

      ### Return the linked list elements as an array ###
      def to_array
        queue = []
        temp = @front
        while temp
          queue << temp.val
          temp = temp.next
        end
        queue
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node.%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%0Aclass%20LinkedListQueue%3A%0A%20%20%20%20%22%22%22Queue%20backed%20by%20a%20linked%20list.%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Initialize%20the%20queue.%22%22%22%0A%20%20%20%20%20%20%20%20self._front%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Head%20node%20%28_front%29%0A%20%20%20%20%20%20%20%20self._rear%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Tail%20node%20%28_rear%29%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20queue%20size.%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20queue%20is%20empty.%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._front%0A%0A%20%20%20%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Enqueue%20an%20element.%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20node%20containing%20num%20after%20the%20tail%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28num%29%0A%20%20%20%20%20%20%20%20%23%20If%20the%20queue%20is%20empty,%20point%20both%20the%20head%20and%20tail%20at%20the%20new%20node%0A%20%20%20%20%20%20%20%20if%20self._front%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._front%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20%23%20If%20the%20queue%20has%20elements,%20link%20the%20new%20node%20after%20the%20tail%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear.next%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20and%20return%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20the%20head%20node%0A%20%20%20%20%20%20%20%20self._front%20%3D%20self._front.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Peek%20at%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Queue%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._front.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Convert%20to%20a%20list%20for%20printing.%22%22%22%0A%20%20%20%20%20%20%20%20queue%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20temp%20%3D%20self._front%0A%20%20%20%20%20%20%20%20while%20temp%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28temp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20temp.next%0A%20%20%20%20%20%20%20%20return%20queue%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20queue%20%3D%20LinkedListQueue%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%20%20%20%20print%28%22queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%20%20%20%23%20Peek%20at%20the%20front%20element%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%22Front%20element%20%28front%29%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop_front%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22After%20removal,%20queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%22Queue%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node.%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%0Aclass%20LinkedListQueue%3A%0A%20%20%20%20%22%22%22Queue%20backed%20by%20a%20linked%20list.%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Initialize%20the%20queue.%22%22%22%0A%20%20%20%20%20%20%20%20self._front%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Head%20node%20%28_front%29%0A%20%20%20%20%20%20%20%20self._rear%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Tail%20node%20%28_rear%29%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20queue%20size.%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20queue%20is%20empty.%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._front%0A%0A%20%20%20%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Enqueue%20an%20element.%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20node%20containing%20num%20after%20the%20tail%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28num%29%0A%20%20%20%20%20%20%20%20%23%20If%20the%20queue%20is%20empty,%20point%20both%20the%20head%20and%20tail%20at%20the%20new%20node%0A%20%20%20%20%20%20%20%20if%20self._front%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._front%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20%23%20If%20the%20queue%20has%20elements,%20link%20the%20new%20node%20after%20the%20tail%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear.next%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20and%20return%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20the%20head%20node%0A%20%20%20%20%20%20%20%20self._front%20%3D%20self._front.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Peek%20at%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Queue%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._front.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Convert%20to%20a%20list%20for%20printing.%22%22%22%0A%20%20%20%20%20%20%20%20queue%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20temp%20%3D%20self._front%0A%20%20%20%20%20%20%20%20while%20temp%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28temp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20temp.next%0A%20%20%20%20%20%20%20%20return%20queue%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20queue%20%3D%20LinkedListQueue%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%20%20%20%20print%28%22queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%20%20%20%23%20Peek%20at%20the%20front%20element%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%22Front%20element%20%28front%29%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop_front%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22After%20removal,%20queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%22Queue%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Array implementation

Removing the first element of an array takes $O(n)$ time, which would make dequeueing inefficient. We can avoid this cost by changing how we keep track of the front.

Let `front` hold the index of the front element and `size` track the number of elements in the queue. With `rear = front + size`, the resulting index `rear` points one slot past the last element.

With this design, **the queue elements occupy the closed interval `[front, rear - 1]` in the array**. Figure 5-6 shows how the operations work.

- To enqueue, store the new element at index `rear` and increase `size` by 1.
- To dequeue, simply increase `front` by 1 and decrease `size` by 1.

Enqueueing and dequeueing each take a fixed number of steps without shifting any elements, so both run in $O(1)$ time.

=== "<1>"
    ![Enqueueing and dequeueing with an array](queue.assets/array_queue_step1.svg){ class="animation-figure" }

=== "<2>"
    ![array_queue_push](queue.assets/array_queue_step2_push.svg){ class="animation-figure" }

=== "<3>"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.svg){ class="animation-figure" }

<p align="center"> Figure 5-6 &nbsp; Enqueueing and dequeueing with an array </p>

There is a catch. As we repeatedly enqueue and dequeue, `front` and `rear` move to the right. **Once they reach the end of the array, they can go no farther**. To solve this problem, we can treat the array as a circular array whose ends connect.

In a circular array, whenever `front` or `rear` goes past the end, it wraps around to the beginning and continues from there. The following code uses the remainder operation to implement this wraparound:

=== "Python"

    ```python title="array_queue.py"
    class ArrayQueue:
        """Queue backed by a circular array."""

        def __init__(self, size: int):
            """Initialize the queue."""
            self._nums: list[int] = [0] * size  # Array that stores the queue elements
            self._front: int = 0  # Index of the front element
            self._size: int = 0  # Queue size

        def capacity(self) -> int:
            """Get the queue capacity."""
            return len(self._nums)

        def size(self) -> int:
            """Get the queue size."""
            return self._size

        def is_empty(self) -> bool:
            """Check whether the queue is empty."""
            return self._size == 0

        def push(self, num: int):
            """Enqueue an element."""
            if self._size == self.capacity():
                raise IndexError("Queue is full")
            # Compute the index one slot past the rear element
            # Use the remainder to wrap rear back to the start of the array
            rear: int = (self._front + self._size) % self.capacity()
            # Add num at the rear
            self._nums[rear] = num
            self._size += 1

        def pop(self) -> int:
            """Remove and return the front element."""
            num: int = self.peek()
            # Advance the front index by one, wrapping to the start if it passes the end
            self._front = (self._front + 1) % self.capacity()
            self._size -= 1
            return num

        def peek(self) -> int:
            """Peek at the front element."""
            if self.is_empty():
                raise IndexError("Queue is empty")
            return self._nums[self._front]

        def to_list(self) -> list[int]:
            """Return a list for printing."""
            res = [0] * self.size()
            j: int = self._front
            for i in range(self.size()):
                res[i] = self._nums[(j % self.capacity())]
                j += 1
            return res
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    /* Queue backed by a circular array */
    class ArrayQueue {
      private:
        int *nums;       // Array that stores the queue elements
        int front;       // Index of the front element
        int queSize;     // Queue size
        int queCapacity; // Queue capacity

      public:
        ArrayQueue(int capacity) {
            // Initialize the array
            nums = new int[capacity];
            queCapacity = capacity;
            front = queSize = 0;
        }

        ~ArrayQueue() {
            delete[] nums;
        }

        /* Get the queue capacity */
        int capacity() {
            return queCapacity;
        }

        /* Get the queue size */
        int size() {
            return queSize;
        }

        /* Check whether the queue is empty */
        bool isEmpty() {
            return size() == 0;
        }

        /* Enqueue an element */
        void push(int num) {
            if (queSize == queCapacity) {
                cout << "Queue is full" << endl;
                return;
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            int rear = (front + queSize) % queCapacity;
            // Add num at the rear
            nums[rear] = num;
            queSize++;
        }

        /* Remove and return the front element */
        int pop() {
            int num = peek();
            // Advance the front index by one, wrapping to the start if it passes the end
            front = (front + 1) % queCapacity;
            queSize--;
            return num;
        }

        /* Peek at the front element */
        int peek() {
            if (isEmpty())
                throw out_of_range("Queue is empty");
            return nums[front];
        }

        /* Return the array elements as a vector */
        vector<int> toVector() {
            // Copy only the elements currently in the queue
            vector<int> arr(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                arr[i] = nums[j % queCapacity];
            }
            return arr;
        }
    };
    ```

=== "Java"

    ```java title="array_queue.java"
    /* Queue backed by a circular array */
    class ArrayQueue {
        private int[] nums; // Array that stores the queue elements
        private int front; // Index of the front element
        private int queSize; // Queue size

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Get the queue capacity */
        public int capacity() {
            return nums.length;
        }

        /* Get the queue size */
        public int size() {
            return queSize;
        }

        /* Check whether the queue is empty */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* Enqueue an element */
        public void push(int num) {
            if (queSize == capacity()) {
                System.out.println("Queue is full");
                return;
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            int rear = (front + queSize) % capacity();
            // Add num at the rear
            nums[rear] = num;
            queSize++;
        }

        /* Remove and return the front element */
        public int pop() {
            int num = peek();
            // Advance the front index by one, wrapping to the start if it passes the end
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* Peek at the front element */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* Return the queue elements as an array */
        public int[] toArray() {
            // Copy only the elements currently in the queue
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % capacity()];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_queue.cs"
    /* Queue backed by a circular array */
    class ArrayQueue {
        int[] nums;  // Array that stores the queue elements
        int front;   // Index of the front element
        int queSize; // Queue size

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Get the queue capacity */
        int Capacity() {
            return nums.Length;
        }

        /* Get the queue size */
        public int Size() {
            return queSize;
        }

        /* Check whether the queue is empty */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* Enqueue an element */
        public void Push(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("Queue is full");
                return;
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            int rear = (front + queSize) % Capacity();
            // Add num at the rear
            nums[rear] = num;
            queSize++;
        }

        /* Remove and return the front element */
        public int Pop() {
            int num = Peek();
            // Advance the front index by one, wrapping to the start if it passes the end
            front = (front + 1) % Capacity();
            queSize--;
            return num;
        }

        /* Peek at the front element */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return nums[front];
        }

        /* Return the queue elements as an array */
        public int[] ToArray() {
            // Copy only the elements currently in the queue
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % this.Capacity()];
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_queue.go"
    /* Queue backed by a circular array */
    type arrayQueue struct {
        nums        []int // Array that stores the queue elements
        front       int   // Index of the front element
        queSize     int   // Queue size
        queCapacity int   // Queue capacity (the maximum number of elements it can hold)
    }

    /* Initialize the queue */
    func newArrayQueue(queCapacity int) *arrayQueue {
        return &arrayQueue{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* Get the queue size */
    func (q *arrayQueue) size() int {
        return q.queSize
    }

    /* Check whether the queue is empty */
    func (q *arrayQueue) isEmpty() bool {
        return q.queSize == 0
    }

    /* Enqueue an element */
    func (q *arrayQueue) push(num int) {
        // The queue is full when queSize == queCapacity
        if q.queSize == q.queCapacity {
            return
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        rear := (q.front + q.queSize) % q.queCapacity
        // Add num at the rear
        q.nums[rear] = num
        q.queSize++
    }

    /* Remove and return the front element */
    func (q *arrayQueue) pop() any {
        num := q.peek()
        if num == nil {
            return nil
        }

        // Advance the front index by one, wrapping to the start if it passes the end
        q.front = (q.front + 1) % q.queCapacity
        q.queSize--
        return num
    }

    /* Peek at the front element */
    func (q *arrayQueue) peek() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* Return a slice for printing */
    func (q *arrayQueue) toSlice() []int {
        rear := (q.front + q.queSize)
        if rear >= q.queCapacity {
            rear %= q.queCapacity
            return append(q.nums[q.front:], q.nums[:rear]...)
        }
        return q.nums[q.front:rear]
    }
    ```

=== "Swift"

    ```swift title="array_queue.swift"
    /* Queue backed by a circular array */
    class ArrayQueue {
        private var nums: [Int] // Array that stores the queue elements
        private var front: Int // Index of the front element
        private var _size: Int // Queue size

        init(capacity: Int) {
            // Initialize the array
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* Get the queue capacity */
        func capacity() -> Int {
            nums.count
        }

        /* Get the queue size */
        func size() -> Int {
            _size
        }

        /* Check whether the queue is empty */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Enqueue an element */
        func push(num: Int) {
            if size() == capacity() {
                print("Queue is full")
                return
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            let rear = (front + size()) % capacity()
            // Add num at the rear
            nums[rear] = num
            _size += 1
        }

        /* Remove and return the front element */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // Advance the front index by one, wrapping to the start if it passes the end
            front = (front + 1) % capacity()
            _size -= 1
            return num
        }

        /* Peek at the front element */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Queue is empty")
            }
            return nums[front]
        }

        /* Return the queue elements as an array */
        func toArray() -> [Int] {
            // Copy only the elements currently in the queue
            (front ..< front + size()).map { nums[$0 % capacity()] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_queue.js"
    /* Queue backed by a circular array */
    class ArrayQueue {
        #nums; // Array that stores the queue elements
        #front = 0; // Index of the front element
        #queSize = 0; // Queue size

        constructor(capacity) {
            this.#nums = new Array(capacity);
        }

        /* Get the queue capacity */
        get capacity() {
            return this.#nums.length;
        }

        /* Get the queue size */
        get size() {
            return this.#queSize;
        }

        /* Check whether the queue is empty */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* Enqueue an element */
        push(num) {
            if (this.size === this.capacity) {
                console.log('Queue is full');
                return;
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            const rear = (this.#front + this.size) % this.capacity;
            // Add num at the rear
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* Remove and return the front element */
        pop() {
            const num = this.peek();
            // Advance the front index by one, wrapping to the start if it passes the end
            this.#front = (this.#front + 1) % this.capacity;
            this.#queSize--;
            return num;
        }

        /* Peek at the front element */
        peek() {
            if (this.isEmpty()) throw new Error('Queue is empty');
            return this.#nums[this.#front];
        }

        /* Return the elements as an array */
        toArray() {
            // Copy only the elements currently in the queue
            const arr = new Array(this.size);
            for (let i = 0, j = this.#front; i < this.size; i++, j++) {
                arr[i] = this.#nums[j % this.capacity];
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="array_queue.ts"
    /* Queue backed by a circular array */
    class ArrayQueue {
        private nums: number[]; // Array that stores the queue elements
        private front: number; // Index of the front element
        private queSize: number; // Queue size

        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = this.queSize = 0;
        }

        /* Get the queue capacity */
        get capacity(): number {
            return this.nums.length;
        }

        /* Get the queue size */
        get size(): number {
            return this.queSize;
        }

        /* Check whether the queue is empty */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* Enqueue an element */
        push(num: number): void {
            if (this.size === this.capacity) {
                console.log('Queue is full');
                return;
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            const rear = (this.front + this.queSize) % this.capacity;
            // Add num at the rear
            this.nums[rear] = num;
            this.queSize++;
        }

        /* Remove and return the front element */
        pop(): number {
            const num = this.peek();
            // Advance the front index by one, wrapping to the start if it passes the end
            this.front = (this.front + 1) % this.capacity;
            this.queSize--;
            return num;
        }

        /* Peek at the front element */
        peek(): number {
            if (this.isEmpty()) throw new Error('Queue is empty');
            return this.nums[this.front];
        }

        /* Return the elements as an array */
        toArray(): number[] {
            // Copy only the elements currently in the queue
            const arr = new Array(this.size);
            for (let i = 0, j = this.front; i < this.size; i++, j++) {
                arr[i] = this.nums[j % this.capacity];
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="array_queue.dart"
    /* Queue backed by a circular array */
    class ArrayQueue {
      late List<int> _nums; // Array that stores the queue elements
      late int _front; // Index of the front element
      late int _queSize; // Queue size

      ArrayQueue(int capacity) {
        _nums = List.filled(capacity, 0);
        _front = _queSize = 0;
      }

      /* Get the queue capacity */
      int capaCity() {
        return _nums.length;
      }

      /* Get the queue size */
      int size() {
        return _queSize;
      }

      /* Check whether the queue is empty */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Enqueue an element */
      void push(int _num) {
        if (_queSize == capaCity()) {
          throw Exception("Queue is full");
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        int rear = (_front + _queSize) % capaCity();
        // Add _num at the rear
        _nums[rear] = _num;
        _queSize++;
      }

      /* Remove and return the front element */
      int pop() {
        int _num = peek();
        // Advance the front index by one, wrapping to the start if it passes the end
        _front = (_front + 1) % capaCity();
        _queSize--;
        return _num;
      }

      /* Peek at the front element */
      int peek() {
        if (isEmpty()) {
          throw Exception("Queue is empty");
        }
        return _nums[_front];
      }

      /* Return the queue elements as a List */
      List<int> toArray() {
        // Copy only the elements currently in the queue
        final List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[j % capaCity()];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_queue.rs"
    /* Queue backed by a circular array */
    struct ArrayQueue<T> {
        nums: Vec<T>,      // Array that stores the queue elements
        front: i32,        // Index of the front element
        que_size: i32,     // Queue size
        que_capacity: i32, // Queue capacity
    }

    impl<T: Copy + Default> ArrayQueue<T> {
        /* Constructor */
        fn new(capacity: i32) -> ArrayQueue<T> {
            ArrayQueue {
                nums: vec![T::default(); capacity as usize],
                front: 0,
                que_size: 0,
                que_capacity: capacity,
            }
        }

        /* Get the queue capacity */
        fn capacity(&self) -> i32 {
            self.que_capacity
        }

        /* Get the queue size */
        fn size(&self) -> i32 {
            self.que_size
        }

        /* Check whether the queue is empty */
        fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* Enqueue an element */
        fn push(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("Queue is full");
                return;
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            let rear = (self.front + self.que_size) % self.que_capacity;
            // Add num at the rear
            self.nums[rear as usize] = num;
            self.que_size += 1;
        }

        /* Remove and return the front element */
        fn pop(&mut self) -> T {
            let num = self.peek();
            // Advance the front index by one, wrapping to the start if it passes the end
            self.front = (self.front + 1) % self.que_capacity;
            self.que_size -= 1;
            num
        }

        /* Peek at the front element */
        fn peek(&self) -> T {
            if self.is_empty() {
                panic!("index out of bounds");
            }
            self.nums[self.front as usize]
        }

        /* Return a vector containing the queue elements */
        fn to_vector(&self) -> Vec<T> {
            let cap = self.que_capacity;
            let mut j = self.front;
            let mut arr = vec![T::default(); cap as usize];
            for i in 0..self.que_size {
                arr[i as usize] = self.nums[(j % cap) as usize];
                j += 1;
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="array_queue.c"
    /* Queue backed by a circular array */
    typedef struct {
        int *nums;       // Array that stores the queue elements
        int front;       // Index of the front element
        int queSize;     // Number of elements currently in the queue
        int queCapacity; // Queue capacity
    } ArrayQueue;

    /* Constructor */
    ArrayQueue *newArrayQueue(int capacity) {
        ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
        // Initialize the array
        queue->queCapacity = capacity;
        queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
        queue->front = queue->queSize = 0;
        return queue;
    }

    /* Destructor */
    void delArrayQueue(ArrayQueue *queue) {
        free(queue->nums);
        free(queue);
    }

    /* Get the queue capacity */
    int capacity(ArrayQueue *queue) {
        return queue->queCapacity;
    }

    /* Get the queue size */
    int size(ArrayQueue *queue) {
        return queue->queSize;
    }

    /* Check whether the queue is empty */
    bool empty(ArrayQueue *queue) {
        return queue->queSize == 0;
    }

    /* Peek at the front element */
    int peek(ArrayQueue *queue) {
        assert(size(queue) != 0);
        return queue->nums[queue->front];
    }

    /* Enqueue an element */
    void push(ArrayQueue *queue, int num) {
        if (size(queue) == capacity(queue)) {
            printf("Queue is full\r\n");
            return;
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        int rear = (queue->front + queue->queSize) % queue->queCapacity;
        // Add num at the rear
        queue->nums[rear] = num;
        queue->queSize++;
    }

    /* Remove and return the front element */
    int pop(ArrayQueue *queue) {
        int num = peek(queue);
        // Advance the front index by one, wrapping to the start if it passes the end
        queue->front = (queue->front + 1) % queue->queCapacity;
        queue->queSize--;
        return num;
    }

    /* Return an array for printing */
    int *toArray(ArrayQueue *queue, int *queSize) {
        *queSize = queue->queSize;
        int *res = (int *)calloc(queue->queSize, sizeof(int));
        int j = queue->front;
        for (int i = 0; i < queue->queSize; i++) {
            res[i] = queue->nums[j % queue->queCapacity];
            j++;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_queue.kt"
    /* Queue backed by a circular array */
    class ArrayQueue(capacity: Int) {
        private val nums: IntArray = IntArray(capacity) // Array that stores the queue elements
        private var front: Int = 0 // Index of the front element
        private var queSize: Int = 0 // Queue size

        /* Get the queue capacity */
        fun capacity(): Int {
            return nums.size
        }

        /* Get the queue size */
        fun size(): Int {
            return queSize
        }

        /* Check whether the queue is empty */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* Enqueue an element */
        fun push(num: Int) {
            if (queSize == capacity()) {
                println("Queue is full")
                return
            }
            // Compute the index one slot past the rear element
            // Use the remainder to wrap rear back to the start of the array
            val rear = (front + queSize) % capacity()
            // Add num at the rear
            nums[rear] = num
            queSize++
        }

        /* Remove and return the front element */
        fun pop(): Int {
            val num = peek()
            // Advance the front index by one, wrapping to the start if it passes the end
            front = (front + 1) % capacity()
            queSize--
            return num
        }

        /* Peek at the front element */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* Return the queue elements as an array */
        fun toArray(): IntArray {
            // Copy only the elements currently in the queue
            val res = IntArray(queSize)
            var i = 0
            var j = front
            while (i < queSize) {
                res[i] = nums[j % capacity()]
                i++
                j++
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_queue.rb"
    ### Queue backed by a circular array ###
    class ArrayQueue
      ### Get the queue size ###
      attr_reader :size

      ### Constructor ###
      def initialize(size)
        @nums = Array.new(size, 0) # Array that stores the queue elements
        @front = 0 # Index of the front element
        @size = 0 # Queue size
      end

      ### Get the queue capacity ###
      def capacity
        @nums.length
      end

      ### Check whether the queue is empty ###
      def is_empty?
        size.zero?
      end

      ### Enqueue an element ###
      def push(num)
        raise IndexError, 'Queue is full' if size == capacity

        # Compute the index one slot past the rear element
        # Use the remainder to wrap rear back to the start of the array
        rear = (@front + size) % capacity
        # Add num at the rear
        @nums[rear] = num
        @size += 1
      end

      ### Remove and return the front element ###
      def pop
        num = peek
        # Advance the front index by one, wrapping to the start if it passes the end
        @front = (@front + 1) % capacity
        @size -= 1
        num
      end

      ### Peek at the front element ###
      def peek
        raise IndexError, 'Queue is empty' if is_empty?

        @nums[@front]
      end

      ### Return an array for printing ###
      def to_array
        res = Array.new(size, 0)
        j = @front

        for i in 0...size
          res[i] = @nums[j % capacity]
          j += 1
        end

        res
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayQueue%3A%0A%20%20%20%20%22%22%22Queue%20backed%20by%20a%20circular%20array.%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20size%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Initialize%20the%20queue.%22%22%22%0A%20%20%20%20%20%20%20%20self._nums%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20size%20%20%23%20Array%20that%20stores%20the%20queue%20elements%0A%20%20%20%20%20%20%20%20self._front%3A%20int%20%3D%200%20%20%23%20Index%20of%20the%20front%20element%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%20%20%23%20Queue%20size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20queue%20capacity.%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._nums%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20queue%20size.%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20queue%20is%20empty.%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Enqueue%20an%20element.%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._size%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Queue%20is%20full%22%29%0A%20%20%20%20%20%20%20%20%23%20Compute%20the%20index%20one%20slot%20past%20the%20rear%20element%0A%20%20%20%20%20%20%20%20%23%20Use%20the%20remainder%20to%20wrap%20rear%20back%20to%20the%20start%20of%20the%20array%0A%20%20%20%20%20%20%20%20rear%3A%20int%20%3D%20%28self._front%20%2B%20self._size%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20Add%20num%20at%20the%20rear%0A%20%20%20%20%20%20%20%20self._nums%5Brear%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20and%20return%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20num%3A%20int%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20%23%20Advance%20the%20front%20index%20by%20one,%20wrapping%20to%20the%20start%20if%20it%20passes%20the%20end%0A%20%20%20%20%20%20%20%20self._front%20%3D%20%28self._front%20%2B%201%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Peek%20at%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Queue%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._nums%5Bself._front%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Return%20a%20list%20for%20printing.%22%22%22%0A%20%20%20%20%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20self.size%28%29%0A%20%20%20%20%20%20%20%20j%3A%20int%20%3D%20self._front%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20self._nums%5B%28j%20%25%20self.capacity%28%29%29%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20queue%20%3D%20ArrayQueue%2810%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%0A%20%20%20%20%23%20Peek%20at%20the%20front%20element%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%22Front%20element%20%28peek%29%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%22Queue%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayQueue%3A%0A%20%20%20%20%22%22%22Queue%20backed%20by%20a%20circular%20array.%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20size%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Initialize%20the%20queue.%22%22%22%0A%20%20%20%20%20%20%20%20self._nums%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20size%20%20%23%20Array%20that%20stores%20the%20queue%20elements%0A%20%20%20%20%20%20%20%20self._front%3A%20int%20%3D%200%20%20%23%20Index%20of%20the%20front%20element%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%20%20%23%20Queue%20size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20queue%20capacity.%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._nums%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20queue%20size.%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22Check%20whether%20the%20queue%20is%20empty.%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Enqueue%20an%20element.%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._size%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Queue%20is%20full%22%29%0A%20%20%20%20%20%20%20%20%23%20Compute%20the%20index%20one%20slot%20past%20the%20rear%20element%0A%20%20%20%20%20%20%20%20%23%20Use%20the%20remainder%20to%20wrap%20rear%20back%20to%20the%20start%20of%20the%20array%0A%20%20%20%20%20%20%20%20rear%3A%20int%20%3D%20%28self._front%20%2B%20self._size%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20%23%20Add%20num%20at%20the%20rear%0A%20%20%20%20%20%20%20%20self._nums%5Brear%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20and%20return%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20num%3A%20int%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20%23%20Advance%20the%20front%20index%20by%20one,%20wrapping%20to%20the%20start%20if%20it%20passes%20the%20end%0A%20%20%20%20%20%20%20%20self._front%20%3D%20%28self._front%20%2B%201%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Peek%20at%20the%20front%20element.%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22Queue%20is%20empty%22%29%0A%20%20%20%20%20%20%20%20return%20self._nums%5Bself._front%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Return%20a%20list%20for%20printing.%22%22%22%0A%20%20%20%20%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20self.size%28%29%0A%20%20%20%20%20%20%20%20j%3A%20int%20%3D%20self._front%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20self._nums%5B%28j%20%25%20self.capacity%28%29%29%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20queue%0A%20%20%20%20queue%20%3D%20ArrayQueue%2810%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%0A%20%20%20%20%23%20Peek%20at%20the%20front%20element%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%22Front%20element%20%28peek%29%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%22Dequeued%20element%20%28pop%29%20%3D%22,%20pop%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%22Queue%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%22Queue%20is%20empty%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

This queue still has a fixed capacity. We can let it grow by replacing the underlying array with a dynamic array. If you’re interested, try implementing this yourself.

The trade-offs between these two implementations are the same as for stacks.

## 5.2.3 &nbsp; Common uses of queues

- **Orders on Taobao**. When a shopper places an order, it joins a queue. The system then processes orders in the order they arrived. During the Singles’ Day shopping festival, huge numbers of orders arrive in a short time, making high concurrency a major challenge for engineers.
- **Tasks waiting their turn**. A queue keeps tasks in order wherever they need to be handled on a first-come, first-served basis. Examples include print jobs and orders waiting to be served at a restaurant.
