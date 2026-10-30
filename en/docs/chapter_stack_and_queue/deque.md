# Deques

A queue allows removal only at the front and insertion only at the rear. As shown below, a <u>double-ended queue</u>, or deque, is more flexible: elements can be added or removed at either end.

![Deque operations](deque.assets/deque_operations.png)

## Common deque operations

The table below lists common operations. Actual method names depend on the programming language.

<p align="center"> Table <id> &nbsp; Efficiency of deque operations </p>

| Method         | Description             | Time complexity |
| -------------- | ---------------- | ---------- |
| `push_first()` | Add an element at the front | $O(1)$     |
| `push_last()`  | Add an element at the rear | $O(1)$     |
| `pop_first()`  | Remove the front element     | $O(1)$     |
| `pop_last()`   | Remove the rear element     | $O(1)$     |
| `peek_first()` | Access the front element     | $O(1)$     |
| `peek_last()`  | Access the rear element     | $O(1)$     |

Again, we can use a deque class already provided by the programming language:

=== "Python"

    ```python title="deque.py"
    from collections import deque

    # Initialize a deque
    deq: deque[int] = deque()

    # Enqueue elements
    deq.append(2)      # Add at the rear
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Add at the front
    deq.appendleft(1)

    # Access elements
    front: int = deq[0]  # Front element
    rear: int = deq[-1]  # Rear element

    # Dequeue elements
    pop_front: int = deq.popleft()  # Remove the front element
    pop_rear: int = deq.pop()       # Remove the rear element

    # Get the deque size
    size: int = len(deq)

    # Check whether the deque is empty
    is_empty: bool = len(deq) == 0
    ```

=== "C++"

    ```cpp title="deque.cpp"
    /* Initialize a deque */
    deque<int> deque;

    /* Enqueue elements */
    deque.push_back(2);   // Add at the rear
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // Add at the front
    deque.push_front(1);

    /* Access elements */
    int front = deque.front(); // Front element
    int back = deque.back();   // Rear element

    /* Dequeue elements */
    deque.pop_front();  // Remove the front element
    deque.pop_back();   // Remove the rear element

    /* Get the deque size */
    int size = deque.size();

    /* Check whether the deque is empty */
    bool empty = deque.empty();
    ```

=== "Java"

    ```java title="deque.java"
    /* Initialize a deque */
    Deque<Integer> deque = new LinkedList<>();

    /* Enqueue elements */
    deque.offerLast(2);   // Add at the rear
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);  // Add at the front
    deque.offerFirst(1);

    /* Access elements */
    int peekFirst = deque.peekFirst();  // Front element
    int peekLast = deque.peekLast();    // Rear element

    /* Dequeue elements */
    int popFirst = deque.pollFirst();  // Remove the front element
    int popLast = deque.pollLast();    // Remove the rear element

    /* Get the deque size */
    int size = deque.size();

    /* Check whether the deque is empty */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* Initialize a deque */
    // In C#, use a LinkedList as a deque
    LinkedList<int> deque = new();

    /* Enqueue elements */
    deque.AddLast(2);   // Add at the rear
    deque.AddLast(5);
    deque.AddLast(4);
    deque.AddFirst(3);  // Add at the front
    deque.AddFirst(1);

    /* Access elements */
    int peekFirst = deque.First.Value;  // Front element
    int peekLast = deque.Last.Value;    // Rear element

    /* Dequeue elements */
    deque.RemoveFirst();  // Remove the front element
    deque.RemoveLast();   // Remove the rear element

    /* Get the deque size */
    int size = deque.Count;

    /* Check whether the deque is empty */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* Initialize a deque */
    // In Go, use a list as a deque
    deque := list.New()

    /* Enqueue elements */
    deque.PushBack(2)      // Add at the rear
    deque.PushBack(5)
    deque.PushBack(4)
    deque.PushFront(3)     // Add at the front
    deque.PushFront(1)

    /* Access elements */
    front := deque.Front() // Front element
    rear := deque.Back()   // Rear element

    /* Dequeue elements */
    deque.Remove(front)    // Remove the front element
    deque.Remove(rear)     // Remove the rear element

    /* Get the deque size */
    size := deque.Len()

    /* Check whether the deque is empty */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* Initialize a deque */
    // Swift has no built-in deque class; use an Array as a deque
    var deque: [Int] = []

    /* Enqueue elements */
    deque.append(2) // Add at the rear
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // Add at the front
    deque.insert(1, at: 0)

    /* Access elements */
    let peekFirst = deque.first! // Front element
    let peekLast = deque.last! // Rear element

    /* Dequeue elements */
    // When using an Array, popFirst takes O(n) time
    let popFirst = deque.removeFirst() // Remove the front element
    let popLast = deque.removeLast() // Remove the rear element

    /* Get the deque size */
    let size = deque.count

    /* Check whether the deque is empty */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* Initialize a deque */
    // JavaScript has no built-in deque; use an Array instead
    const deque = [];

    /* Enqueue elements */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Note that this is an array, so unshift() takes O(n) time
    deque.unshift(3);
    deque.unshift(1);

    /* Access elements */
    const peekFirst = deque[0];
    const peekLast = deque[deque.length - 1];

    /* Dequeue elements */
    // Note that this is an array, so shift() takes O(n) time
    const popFront = deque.shift();
    const popBack = deque.pop();

    /* Get the deque size */
    const size = deque.length;

    /* Check whether the deque is empty */
    const isEmpty = size === 0;
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* Initialize a deque */
    // TypeScript has no built-in deque; use an Array instead
    const deque: number[] = [];

    /* Enqueue elements */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Note that this is an array, so unshift() takes O(n) time
    deque.unshift(3);
    deque.unshift(1);

    /* Access elements */
    const peekFirst: number = deque[0];
    const peekLast: number = deque[deque.length - 1];

    /* Dequeue elements */
    // Note that this is an array, so shift() takes O(n) time
    const popFront: number = deque.shift() as number;
    const popBack: number = deque.pop() as number;

    /* Get the deque size */
    const size: number = deque.length;

    /* Check whether the deque is empty */
    const isEmpty: boolean = size === 0;
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* Initialize a deque */
    // In Dart, Queue is defined as a deque
    Queue<int> deque = Queue<int>();

    /* Enqueue elements */
    deque.addLast(2);  // Add at the rear
    deque.addLast(5);
    deque.addLast(4);
    deque.addFirst(3); // Add at the front
    deque.addFirst(1);

    /* Access elements */
    int peekFirst = deque.first; // Front element
    int peekLast = deque.last;   // Rear element

    /* Dequeue elements */
    int popFirst = deque.removeFirst(); // Remove the front element
    int popLast = deque.removeLast();   // Remove the rear element

    /* Get the deque size */
    int size = deque.length;

    /* Check whether the deque is empty */
    bool isEmpty = deque.isEmpty;
    ```

=== "Rust"

    ```rust title="deque.rs"
    /* Initialize a deque */
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Enqueue elements */
    deque.push_back(2);  // Add at the rear
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Add at the front
    deque.push_front(1);

    /* Access elements */
    if let Some(front) = deque.front() { // Front element
    }
    if let Some(rear) = deque.back() {   // Rear element
    }

    /* Dequeue elements */
    if let Some(pop_front) = deque.pop_front() { // Remove the front element
    }
    if let Some(pop_rear) = deque.pop_back() {   // Remove the rear element
    }

    /* Get the deque size */
    let size = deque.len();

    /* Check whether the deque is empty */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // C provides no built-in deque
    ```

=== "Kotlin"

    ```kotlin title="deque.kt"
    /* Initialize a deque */
    val deque = LinkedList<Int>()

    /* Enqueue elements */
    deque.offerLast(2)  // Add at the rear
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // Add at the front
    deque.offerFirst(1)

    /* Access elements */
    val peekFirst = deque.peekFirst() // Front element
    val peekLast = deque.peekLast()   // Rear element

    /* Dequeue elements */
    val popFirst = deque.pollFirst() // Remove the front element
    val popLast = deque.pollLast()   // Remove the rear element

    /* Get the deque size */
    val size = deque.size

    /* Check whether the deque is empty */
    val isEmpty = deque.isEmpty()
    ```

=== "Ruby"

    ```ruby title="deque.rb"
    # Initialize a deque
    # Ruby has no built-in deque; use an Array instead
    deque = []

    # Enqueue elements
    deque << 2
    deque << 5
    deque << 4
    # Note that this is an array, so Array#unshift takes O(n) time
    deque.unshift(3)
    deque.unshift(1)

    # Access elements
    peek_first = deque.first
    peek_last = deque.last

    # Dequeue elements
    # Note that this is an array, so Array#shift takes O(n) time
    pop_front = deque.shift
    pop_back = deque.pop

    # Get the deque size
    size = deque.length

    # Check whether the deque is empty
    is_empty = size.zero?
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20deque%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20deq.append%282%29%20%20%23%20Add%20at%20the%20rear%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20Add%20at%20the%20front%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22Deque%3A%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20Access%20elements%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20Front%20element%0A%20%20%20%20print%28%22Front%20element%3A%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20Rear%20element%0A%20%20%20%20print%28%22Rear%20element%3A%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20Dequeue%20elements%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20Remove%20the%20front%20element%0A%20%20%20%20print%28%22Element%20removed%20from%20the%20front%3A%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22After%20removing%20from%20the%20front%3A%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20Remove%20the%20rear%20element%0A%20%20%20%20print%28%22Element%20removed%20from%20the%20rear%3A%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22After%20removing%20from%20the%20rear%3A%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20Get%20the%20deque%20size%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22Deque%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20deque%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20deque%20empty%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Implementing a deque *

A deque is implemented much like a queue, using either a linked list or an array as the underlying structure.

### Implementation with a doubly linked list

In the previous section, we used a singly linked list for a queue because it easily supports removing the head for dequeueing and adding after the tail for enqueueing.

A deque supports both insertion and removal at both ends. It therefore needs the symmetric operations in the other direction as well. For this reason, we use a doubly linked list.

As shown below, treat the list's head and tail as the deque's front and rear, and support adding and removing nodes at both ends.

=== "<1>"
    ![Insertion and removal in a linked-list deque](deque.assets/linkedlist_deque_step1.png)

=== "<2>"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_step2_push_last.png)

=== "<3>"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_step3_push_first.png)

=== "<4>"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_step4_pop_last.png)

=== "<5>"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_step5_pop_first.png)

The implementation is as follows:

```src
[file]{linkedlist_deque}-[class]{linked_list_deque}-[func]{}
```

### Implementation with an array

As with an array-based queue, we can use a circular array to implement a deque, as shown below.

=== "<1>"
    ![Insertion and removal in an array-based deque](deque.assets/array_deque_step1.png)

=== "<2>"
    ![array_deque_push_last](deque.assets/array_deque_step2_push_last.png)

=== "<3>"
    ![array_deque_push_first](deque.assets/array_deque_step3_push_first.png)

=== "<4>"
    ![array_deque_pop_last](deque.assets/array_deque_step4_pop_last.png)

=== "<5>"
    ![array_deque_pop_first](deque.assets/array_deque_step5_pop_first.png)

Starting with the queue implementation, we need only add methods for insertion at the front and removal at the rear:

```src
[file]{array_deque}-[class]{array_deque}-[func]{}
```

## Applications

A deque combines stack and queue behavior, **so it supports all their applications while offering greater flexibility**.

Software undo is usually implemented with a stack: the system uses `push` to record each change and `pop` to undo it. Because resources are limited, software often restricts the history to a fixed number of steps, such as $50$. When the stack grows beyond $50$, the oldest entry must be removed from the bottom, the front of the deque. **A stack cannot provide this operation, so a deque is needed instead**. The core undo behavior still follows last-in, first-out order; the deque simply provides flexibility for the additional logic.
