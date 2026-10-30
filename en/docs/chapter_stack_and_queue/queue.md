# Queues

A <u>queue</u> is a linear data structure that follows a first-in, first-out rule. It models a line of people: newcomers join at the back, while those at the front leave one by one.

As shown below, the two ends are called the “front” and the “rear.” Adding an element at the rear is called “enqueueing,” and removing an element from the front is called “dequeueing.”

![The first-in, first-out rule of a queue](queue.assets/queue_operations.png)

## Common queue operations

The table below lists common operations. Method names vary between programming languages; here we use the same names as for stacks.

<p align="center"> Table <id> &nbsp; Efficiency of queue operations </p>

| Method   | Description                         | Time complexity |
| -------- | ---------------------------- | ---------- |
| `push()` | Enqueue an element at the rear | $O(1)$     |
| `pop()`  | Dequeue the front element                 | $O(1)$     |
| `peek()` | Access the front element                 | $O(1)$     |

We can use a queue class already provided by the programming language:

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # Initialize a queue
    # In Python, we usually use the deque class as a queue
    # Although queue.Queue() is a dedicated queue class, it is less convenient and is not recommended here
    que: deque[int] = deque()

    # Enqueue elements
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # Access the front element
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
    /* Initialize a queue */
    queue<int> queue;

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Access the front element */
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
    /* Initialize a queue */
    Queue<Integer> queue = new LinkedList<>();

    /* Enqueue elements */
    queue.offer(1);
    queue.offer(3);
    queue.offer(2);
    queue.offer(5);
    queue.offer(4);

    /* Access the front element */
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
    /* Initialize a queue */
    Queue<int> queue = new();

    /* Enqueue elements */
    queue.Enqueue(1);
    queue.Enqueue(3);
    queue.Enqueue(2);
    queue.Enqueue(5);
    queue.Enqueue(4);

    /* Access the front element */
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
    /* Initialize a queue */
    // In Go, use a list as a queue
    queue := list.New()

    /* Enqueue elements */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)

    /* Access the front element */
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
    /* Initialize a queue */
    // Swift has no built-in queue class; use an Array as a queue
    var queue: [Int] = []

    /* Enqueue elements */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)

    /* Access the front element */
    let peek = queue.first!

    /* Dequeue an element */
    // Because this is an array, removeFirst takes O(n) time
    let pop = queue.removeFirst()

    /* Get the queue size */
    let size = queue.count

    /* Check whether the queue is empty */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* Initialize a queue */
    // JavaScript has no built-in queue; use an Array as a queue
    const queue = [];

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Access the front element */
    const peek = queue[0];

    /* Dequeue an element */
    // The underlying structure is an array, so shift() takes O(n) time
    const pop = queue.shift();

    /* Get the queue size */
    const size = queue.length;

    /* Check whether the queue is empty */
    const empty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* Initialize a queue */
    // TypeScript has no built-in queue; use an Array as a queue
    const queue: number[] = [];

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Access the front element */
    const peek = queue[0];

    /* Dequeue an element */
    // The underlying structure is an array, so shift() takes O(n) time
    const pop = queue.shift();

    /* Get the queue size */
    const size = queue.length;

    /* Check whether the queue is empty */
    const empty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* Initialize a queue */
    // In Dart, Queue is a deque and can also be used as a queue
    Queue<int> queue = Queue();

    /* Enqueue elements */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* Access the front element */
    int peek = queue.first;

    /* Dequeue an element */
    int pop = queue.removeFirst();

    /* Get the queue size */
    int size = queue.length;

    /* Check whether the queue is empty */
    bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"
    /* Initialize a deque */
    // In Rust, use a deque as an ordinary queue
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Enqueue elements */
    deque.push_back(1);
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);

    /* Access the front element */
    if let Some(front) = deque.front() {
    }

    /* Dequeue an element */
    if let Some(pop) = deque.pop_front() {
    }

    /* Get the queue size */
    let size = deque.len();

    /* Check whether the queue is empty */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // C provides no built-in queue
    ```

=== "Kotlin"

    ```kotlin title="queue.kt"
    /* Initialize a queue */
    val queue = LinkedList<Int>()

    /* Enqueue elements */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)

    /* Access the front element */
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
    # Initialize a queue
    # Ruby's built-in Thread::Queue has no peek or traversal methods; use an Array as a queue
    queue = []

    # Enqueue elements
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)

    # Access the front element of the queue
    peek = queue.first

    # Dequeue an element
    # Note that this is an array, so Array#shift takes O(n) time
    pop = queue.shift

    # Get the queue size
    size = queue.length

    # Check whether the queue is empty
    is_empty = queue.empty?
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20queue%0A%20%20%20%20%23%20In%20Python%2C%20we%20usually%20use%20the%20deque%20class%20as%20a%20queue%0A%20%20%20%20%23%20Although%20queue.Queue%28%29%20is%20a%20dedicated%20queue%20class%2C%20it%20is%20less%20convenient%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22Queue%3A%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20Access%20the%20front%20element%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22Front%20element%3A%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22Dequeued%20element%3A%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22After%20dequeuing%3A%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22Queue%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20queue%20empty%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Implementing a queue

A queue needs a data structure that allows insertion at one end and deletion at the other. Both linked lists and arrays can meet this requirement.

### Implementation with a linked list

As shown below, treat the linked list's head and tail as the queue's front and rear. Nodes may be added only at the rear and removed only from the front.

=== "<1>"
    ![Enqueue and dequeue in a linked-list queue](queue.assets/linkedlist_queue_step1.png)

=== "<2>"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.png)

=== "<3>"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.png)

Here is an implementation using a linked list:

```src
[file]{linkedlist_queue}-[class]{linked_list_queue}-[func]{}
```

### Implementation with an array

Removing the first element of an array takes $O(n)$ time, which would make dequeueing inefficient. A useful technique avoids this problem.

Use a variable `front` for the index of the front element and a variable `size` for the queue's length. Define `rear = front + size`, so `rear` points to the position immediately after the last element.

With this design, **the occupied interval is `[front, rear - 1]`**. Operations work as shown below.

- Enqueue: assign the new element to index `rear` and increase `size` by 1.
- Dequeue: increase `front` by 1 and decrease `size` by 1.

Both operations require only a constant amount of work and take $O(1)$ time.

=== "<1>"
    ![Enqueue and dequeue in an array-based queue](queue.assets/array_queue_step1.png)

=== "<2>"
    ![array_queue_push](queue.assets/array_queue_step2_push.png)

=== "<3>"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.png)

There is a problem: repeated enqueueing and dequeueing move both `front` and `rear` to the right, **and they cannot continue once they reach the end of the array**. To solve this, treat the array as circular, with its end connected to its beginning.

When `front` or `rear` passes the array's end, wrap it back to the beginning. The remainder operation implements this cyclic behavior:

```src
[file]{array_queue}-[class]{array_queue}-[func]{}
```

This queue still has a limitation: its capacity is fixed. We can address it by replacing the array with a dynamic array and adding resizing. Interested readers can try implementing this themselves.

The comparison between these two implementations is the same as for stacks, so we will not repeat it here.

## Typical applications

- **Taobao orders**. When a shopper places an order, it enters a queue, and the system processes orders in sequence. During the Singles' Day shopping festival, enormous numbers of orders arrive in a short time, making high concurrency a major engineering challenge.
- **Tasks awaiting processing**. Queues preserve processing order wherever first-come, first-served behavior is needed, such as printer jobs or restaurant orders.
