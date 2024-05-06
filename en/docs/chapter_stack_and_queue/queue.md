---
comments: true
---

# 5.2 &nbsp; Queue

A <u>queue</u> is a linear data structure that follows the First-In-First-Out (FIFO) rule. As the name suggests, a queue simulates the phenomenon of lining up, where newcomers join the queue at the rear, and the person at the front leaves the queue first.

As shown in Figure 5-4, we call the front of the queue the "head" and the back the "tail." The operation of adding elements to the rear of the queue is termed "enqueue," and the operation of removing elements from the front is termed "dequeue."

![Queue's first-in-first-out rule](queue.assets/queue_operations.png){ class="animation-figure" }

<p align="center"> Figure 5-4 &nbsp; Queue's first-in-first-out rule </p>

## 5.2.1 &nbsp; Common operations on queue

The common operations on a queue are shown in Table 5-2. Note that method names may vary across different programming languages. Here, we use the same naming convention as that used for stacks.

<p align="center"> Table 5-2 &nbsp; Efficiency of queue operations </p>

<div class="center-table" markdown>

| Method Name | Description                            | Time Complexity |
| ----------- | -------------------------------------- | --------------- |
| `push()`    | Enqueue an element, add it to the tail | $O(1)$          |
| `pop()`     | Dequeue the head element               | $O(1)$          |
| `peek()`    | Access the head element                | $O(1)$          |

</div>

We can directly use the ready-made queue classes in programming languages:

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # Initialize the queue
    # In Python, we generally use the deque class as a queue
    # Although queue.Queue() is a pure queue class, it's not very user-friendly, so it's not recommended
    que: deque[int] = deque()

    # Enqueue elements
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # Access the first element
    front: int = que[0]

    # Dequeue an element
    pop: int = que.popleft()

    # Get the length of the queue
    size: int = len(que)

    # Check if the queue is empty
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

    /* Access the first element*/
    int front = queue.front();

    /* Dequeue an element */
    queue.pop();

    /* Get the length of the queue */
    int size = queue.size();

    /* Check if the queue is empty */
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

    /* Access the first element */
    int peek = queue.peek();

    /* Dequeue an element */
    int pop = queue.poll();

    /* Get the length of the queue */
    int size = queue.size();

    /* Check if the queue is empty */
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

    /* Access the first element */
    int peek = queue.Peek();

    /* Dequeue an element */
    int pop = queue.Dequeue();

    /* Get the length of the queue */
    int size = queue.Count;

    /* Check if the queue is empty */
    bool isEmpty = queue.Count == 0;
    ```

=== "Go"

    ```go title="queue_test.go"
    /* Initialize the queue */
    // In Go, use list as a queue
    queue := list.New()

    /* Enqueue elements */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)

    /* Access the first element */
    peek := queue.Front()

    /* Dequeue an element */
    pop := queue.Front()
    queue.Remove(pop)

    /* Get the length of the queue */
    size := queue.Len()

    /* Check if the queue is empty */
    isEmpty := queue.Len() == 0
    ```

=== "Swift"

    ```swift title="queue.swift"
    /* Initialize the queue */
    // Swift does not have a built-in queue class, so Array can be used as a queue
    var queue: [Int] = []

    /* Enqueue elements */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)

    /* Access the first element */
    let peek = queue.first!

    /* Dequeue an element */
    // Since it's an array, removeFirst has a complexity of O(n)
    let pool = queue.removeFirst()

    /* Get the length of the queue */
    let size = queue.count

    /* Check if the queue is empty */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* Initialize the queue */
    // JavaScript does not have a built-in queue, so Array can be used as a queue
    const queue = [];

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Access the first element */
    const peek = queue[0];

    /* Dequeue an element */
    // Since the underlying structure is an array, shift() method has a time complexity of O(n)
    const pop = queue.shift();

    /* Get the length of the queue */
    const size = queue.length;

    /* Check if the queue is empty */
    const empty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* Initialize the queue */
    // TypeScript does not have a built-in queue, so Array can be used as a queue 
    const queue: number[] = [];

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Access the first element */
    const peek = queue[0];

    /* Dequeue an element */
    // Since the underlying structure is an array, shift() method has a time complexity of O(n)
    const pop = queue.shift();

    /* Get the length of the queue */
    const size = queue.length;

    /* Check if the queue is empty */
    const empty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* Initialize the queue */
    // In Dart, the Queue class is a double-ended queue but can be used as a queue
    Queue<int> queue = Queue();

    /* Enqueue elements */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* Access the first element */
    int peek = queue.first;

    /* Dequeue an element */
    int pop = queue.removeFirst();

    /* Get the length of the queue */
    int size = queue.length;

    /* Check if the queue is empty */
    bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"
    /* Initialize the double-ended queue */
    // In Rust, use a double-ended queue as a regular queue
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Enqueue elements */
    deque.push_back(1);
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);

    /* Access the first element */
    if let Some(front) = deque.front() {
    }

    /* Dequeue an element */
    if let Some(pop) = deque.pop_front() {
    }

    /* Get the length of the queue */
    let size = deque.len();

    /* Check if the queue is empty */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // C does not provide a built-in queue
    ```

=== "Kotlin"

    ```kotlin title="queue.kt"

    ```

=== "Zig"

    ```zig title="queue.zig"

    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%98%9F%E5%88%97%0A%20%20%20%20%23%20%E5%9C%A8%20Python%20%E4%B8%AD%EF%BC%8C%E6%88%91%E4%BB%AC%E4%B8%80%E8%88%AC%E5%B0%86%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%B1%BB%20deque%20%E7%9C%8B%E4%BD%9C%E9%98%9F%E5%88%97%E4%BD%BF%E7%94%A8%0A%20%20%20%20%23%20%E8%99%BD%E7%84%B6%20queue.Queue%28%29%20%E6%98%AF%E7%BA%AF%E6%AD%A3%E7%9A%84%E9%98%9F%E5%88%97%E7%B1%BB%EF%BC%8C%E4%BD%86%E4%B8%8D%E5%A4%AA%E5%A5%BD%E7%94%A8%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E9%98%9F%E5%90%8E%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%98%9F%E5%88%97%0A%20%20%20%20%23%20%E5%9C%A8%20Python%20%E4%B8%AD%EF%BC%8C%E6%88%91%E4%BB%AC%E4%B8%80%E8%88%AC%E5%B0%86%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%B1%BB%20deque%20%E7%9C%8B%E4%BD%9C%E9%98%9F%E5%88%97%E4%BD%BF%E7%94%A8%0A%20%20%20%20%23%20%E8%99%BD%E7%84%B6%20queue.Queue%28%29%20%E6%98%AF%E7%BA%AF%E6%AD%A3%E7%9A%84%E9%98%9F%E5%88%97%E7%B1%BB%EF%BC%8C%E4%BD%86%E4%B8%8D%E5%A4%AA%E5%A5%BD%E7%94%A8%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E9%98%9F%E5%90%8E%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 5.2.2 &nbsp; Implementing a queue

To implement a queue, we need a data structure that allows adding elements at one end and removing them at the other. Both linked lists and arrays meet this requirement.

### 1. &nbsp; Implementation based on a linked list

As shown in Figure 5-5, we can consider the "head node" and "tail node" of a linked list as the "front" and "rear" of the queue, respectively. It is stipulated that nodes can only be added at the rear and removed at the front.

=== "LinkedListQueue"
    ![Implementing Queue with Linked List for Enqueue and Dequeue Operations](queue.assets/linkedlist_queue_step1.png){ class="animation-figure" }

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.png){ class="animation-figure" }

<p align="center"> Figure 5-5 &nbsp; Implementing Queue with Linked List for Enqueue and Dequeue Operations </p>

Below is the code for implementing a queue using a linked list:

=== "Python"

    ```python title="linkedlist_queue.py"
    class LinkedListQueue:
        """Queue class based on linked list"""

        def __init__(self):
            """Constructor"""
            self._front: ListNode | None = None  # Head node front
            self._rear: ListNode | None = None  # Tail node rear
            self._size: int = 0

        def size(self) -> int:
            """Get the length of the queue"""
            return self._size

        def is_empty(self) -> bool:
            """Determine if the queue is empty"""
            return self._size == 0

        def push(self, num: int):
            """Enqueue"""
            # Add num behind the tail node
            node = ListNode(num)
            # If the queue is empty, make the head and tail nodes both point to that node
            if self._front is None:
                self._front = node
                self._rear = node
            # If the queue is not empty, add that node behind the tail node
            else:
                self._rear.next = node
                self._rear = node
            self._size += 1

        def pop(self) -> int:
            """Dequeue"""
            num = self.peek()
            # Remove head node
            self._front = self._front.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """Access front element"""
            if self.is_empty():
                raise IndexError("Queue is empty")
            return self._front.val

        def to_list(self) -> list[int]:
            """Convert to a list for printing"""
            queue = []
            temp = self._front
            while temp:
                queue.append(temp.val)
                temp = temp.next
            return queue
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    /* Queue class based on linked list */
    class LinkedListQueue {
      private:
        ListNode *front, *rear; // Front node front, back node rear
        int queSize;

      public:
        LinkedListQueue() {
            front = nullptr;
            rear = nullptr;
            queSize = 0;
        }

        ~LinkedListQueue() {
            // Traverse the linked list, remove nodes, free memory
            freeMemoryLinkedList(front);
        }

        /* Get the length of the queue */
        int size() {
            return queSize;
        }

        /* Determine if the queue is empty */
        bool isEmpty() {
            return queSize == 0;
        }

        /* Enqueue */
        void push(int num) {
            // Add num behind the tail node
            ListNode *node = new ListNode(num);
            // If the queue is empty, make the head and tail nodes both point to that node
            if (front == nullptr) {
                front = node;
                rear = node;
            }
            // If the queue is not empty, add that node behind the tail node
            else {
                rear->next = node;
                rear = node;
            }
            queSize++;
        }

        /* Dequeue */
        int pop() {
            int num = peek();
            // Remove head node
            ListNode *tmp = front;
            front = front->next;
            // Free memory
            delete tmp;
            queSize--;
            return num;
        }

        /* Access front element */
        int peek() {
            if (size() == 0)
                throw out_of_range("Queue is empty");
            return front->val;
        }

        /* Convert the linked list to Vector and return */
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
    /* Queue class based on linked list */
    class LinkedListQueue {
        private ListNode front, rear; // Front node front, back node rear
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Get the length of the queue */
        public int size() {
            return queSize;
        }

        /* Determine if the queue is empty */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Enqueue */
        public void push(int num) {
            // Add num behind the tail node
            ListNode node = new ListNode(num);
            // If the queue is empty, make the head and tail nodes both point to that node
            if (front == null) {
                front = node;
                rear = node;
            // If the queue is not empty, add that node behind the tail node
            } else {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Dequeue */
        public int pop() {
            int num = peek();
            // Remove head node
            front = front.next;
            queSize--;
            return num;
        }

        /* Access front element */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* Convert the linked list to Array and return */
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
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    [class]{linkedListQueue}-[func]{}
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "JS"

    ```javascript title="linkedlist_queue.js"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "TS"

    ```typescript title="linkedlist_queue.ts"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Dart"

    ```dart title="linkedlist_queue.dart"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Rust"

    ```rust title="linkedlist_queue.rs"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "C"

    ```c title="linkedlist_queue.c"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_queue.kt"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Ruby"

    ```ruby title="linkedlist_queue.rb"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Zig"

    ```zig title="linkedlist_queue.zig"
    [class]{LinkedListQueue}-[func]{}
    ```

### 2. &nbsp; Implementation based on an array

Deleting the first element in an array has a time complexity of $O(n)$, which would make the dequeue operation inefficient. However, this problem can be cleverly avoided as follows.

We use a variable `front` to indicate the index of the front element and maintain a variable `size` to record the queue's length. Define `rear = front + size`, which points to the position immediately following the tail element.

With this design, **the effective interval of elements in the array is `[front, rear - 1]`**. The implementation methods for various operations are shown in Figure 5-6.

- Enqueue operation: Assign the input element to the `rear` index and increase `size` by 1.
- Dequeue operation: Simply increase `front` by 1 and decrease `size` by 1.

Both enqueue and dequeue operations only require a single operation, each with a time complexity of $O(1)$.

=== "ArrayQueue"
    ![Implementing Queue with Array for Enqueue and Dequeue Operations](queue.assets/array_queue_step1.png){ class="animation-figure" }

=== "push()"
    ![array_queue_push](queue.assets/array_queue_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.png){ class="animation-figure" }

<p align="center"> Figure 5-6 &nbsp; Implementing Queue with Array for Enqueue and Dequeue Operations </p>

You might notice a problem: as enqueue and dequeue operations are continuously performed, both `front` and `rear` move to the right and **will eventually reach the end of the array and can't move further**. To resolve this, we can treat the array as a "circular array" where connecting the end of the array back to its beginning.

In a circular array, `front` or `rear` needs to loop back to the start of the array upon reaching the end. This cyclical pattern can be achieved with a "modulo operation" as shown in the code below:

=== "Python"

    ```python title="array_queue.py"
    class ArrayQueue:
        """Queue class based on circular array"""

        def __init__(self, size: int):
            """Constructor"""
            self._nums: list[int] = [0] * size  # Array for storing queue elements
            self._front: int = 0  # Front pointer, pointing to the front element
            self._size: int = 0  # Queue length

        def capacity(self) -> int:
            """Get the capacity of the queue"""
            return len(self._nums)

        def size(self) -> int:
            """Get the length of the queue"""
            return self._size

        def is_empty(self) -> bool:
            """Determine if the queue is empty"""
            return self._size == 0

        def push(self, num: int):
            """Enqueue"""
            if self._size == self.capacity():
                raise IndexError("Queue is full")
            # Calculate rear pointer, pointing to rear index + 1
            # Use modulo operation to wrap the rear pointer from the end of the array back to the start
            rear: int = (self._front + self._size) % self.capacity()
            # Add num to the rear
            self._nums[rear] = num
            self._size += 1

        def pop(self) -> int:
            """Dequeue"""
            num: int = self.peek()
            # Move front pointer one position backward, returning to the head of the array if it exceeds the tail
            self._front = (self._front + 1) % self.capacity()
            self._size -= 1
            return num

        def peek(self) -> int:
            """Access front element"""
            if self.is_empty():
                raise IndexError("Queue is empty")
            return self._nums[self._front]

        def to_list(self) -> list[int]:
            """Return array for printing"""
            res = [0] * self.size()
            j: int = self._front
            for i in range(self.size()):
                res[i] = self._nums[(j % self.capacity())]
                j += 1
            return res
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    /* Queue class based on circular array */
    class ArrayQueue {
      private:
        int *nums;       // Array for storing queue elements
        int front;       // Front pointer, pointing to the front element
        int queSize;     // Queue length
        int queCapacity; // Queue capacity

      public:
        ArrayQueue(int capacity) {
            // Initialize an array
            nums = new int[capacity];
            queCapacity = capacity;
            front = queSize = 0;
        }

        ~ArrayQueue() {
            delete[] nums;
        }

        /* Get the capacity of the queue */
        int capacity() {
            return queCapacity;
        }

        /* Get the length of the queue */
        int size() {
            return queSize;
        }

        /* Determine if the queue is empty */
        bool isEmpty() {
            return size() == 0;
        }

        /* Enqueue */
        void push(int num) {
            if (queSize == queCapacity) {
                cout << "Queue is full" << endl;
                return;
            }
            // Calculate rear pointer, pointing to rear index + 1
            // Use modulo operation to wrap the rear pointer from the end of the array back to the start
            int rear = (front + queSize) % queCapacity;
            // Add num to the rear
            nums[rear] = num;
            queSize++;
        }

        /* Dequeue */
        int pop() {
            int num = peek();
            // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
            front = (front + 1) % queCapacity;
            queSize--;
            return num;
        }

        /* Access front element */
        int peek() {
            if (isEmpty())
                throw out_of_range("Queue is empty");
            return nums[front];
        }

        /* Convert array to Vector and return */
        vector<int> toVector() {
            // Only convert elements within valid length range
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
    /* Queue class based on circular array */
    class ArrayQueue {
        private int[] nums; // Array for storing queue elements
        private int front; // Front pointer, pointing to the front element
        private int queSize; // Queue length

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Get the capacity of the queue */
        public int capacity() {
            return nums.length;
        }

        /* Get the length of the queue */
        public int size() {
            return queSize;
        }

        /* Determine if the queue is empty */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* Enqueue */
        public void push(int num) {
            if (queSize == capacity()) {
                System.out.println("Queue is full");
                return;
            }
            // Calculate rear pointer, pointing to rear index + 1
            // Use modulo operation to wrap the rear pointer from the end of the array back to the start
            int rear = (front + queSize) % capacity();
            // Add num to the rear
            nums[rear] = num;
            queSize++;
        }

        /* Dequeue */
        public int pop() {
            int num = peek();
            // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* Access front element */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* Return array */
        public int[] toArray() {
            // Only convert elements within valid length range
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
    [class]{ArrayQueue}-[func]{}
    ```

=== "Go"

    ```go title="array_queue.go"
    [class]{arrayQueue}-[func]{}
    ```

=== "Swift"

    ```swift title="array_queue.swift"
    [class]{ArrayQueue}-[func]{}
    ```

=== "JS"

    ```javascript title="array_queue.js"
    [class]{ArrayQueue}-[func]{}
    ```

=== "TS"

    ```typescript title="array_queue.ts"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Dart"

    ```dart title="array_queue.dart"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Rust"

    ```rust title="array_queue.rs"
    [class]{ArrayQueue}-[func]{}
    ```

=== "C"

    ```c title="array_queue.c"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="array_queue.kt"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Ruby"

    ```ruby title="array_queue.rb"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Zig"

    ```zig title="array_queue.zig"
    [class]{ArrayQueue}-[func]{}
    ```

The above implementation of the queue still has its limitations: its length is fixed. However, this issue is not difficult to resolve. We can replace the array with a dynamic array that can expand itself if needed. Interested readers can try to implement this themselves.

The comparison of the two implementations is consistent with that of the stack and is not repeated here.

## 5.2.3 &nbsp; Typical applications of queue

- **Amazon orders**: After shoppers place orders, these orders join a queue, and the system processes them in order. During events like Singles' Day, a massive number of orders are generated in a short time, making high concurrency a key challenge for engineers.
- **Various to-do lists**: Any scenario requiring a "first-come, first-served" functionality, such as a printer's task queue or a restaurant's food delivery queue, can effectively maintain the order of processing with a queue.
