# Double-Ended Queue

In a queue, we can only delete elements at the head or add elements at the tail. As shown in the figure below, a "double-ended queue" provides more flexibility by allowing the addition or deletion of elements at the head and tail.

![Operations on double-ended queues](deque.assets/deque_operations.png)

## Double-Ended Queue Common Operations

The common operations of double-ended queues are shown in the table below, and the specific method names need to be determined according to the programming language used.

<p align="center"> Table <id> &nbsp; Efficiency of double-ended queue operations </p>

| method name | description                           | time complexity |
| ----------- | ------------------------------------- | --------------- |
| pushFirst() | Add element to top of queue           | $O(1)$          |
| pushLast()  | Add element to end of queue           | $O(1)$          |
| popFirst()  | Delete the first element of the queue | $O(1)$          |
| popLast()   | Delete end-of-queue element           | $O(1)$          |
| peekFirst() | access the first element of the queue | $O(1)$          |
| peekLast()  | access the end-of-queue element       | $O(1)$          |

Similarly, we can directly use the double-ended queue class already implemented in the programming language.

=== "Python"

    ```python title="deque.py"
    # Initialize the double-ended queue
    deque: deque[int] = collections.deque()
   
    # Element in the queue
    deque.append(2)      # add to the end of the queue
    deque.append(5)
    deque.append(4)
    deque.appendleft(3)  # add to head of queue
    deque.appendleft(1)
   
    # Access to elements
    front: int = deque[0]  # head element of the queue
    rear: int = deque[-1]  # end of queue element
   
    # Element out of line
    pop_front: int = deque.popleft()  # head element out of queue
    pop_rear: int = deque.pop()       # end-of-queue element out of queue
   
    # Get the length of the double-ended queue
    size: int = len(deque)
   
    # Determine if the double-ended queue is empty
    is_empty: bool = len(deque) == 0
    ```

=== "C++"

    ```cpp title="deque.cpp"
    /* Initialize double-ended queue */
    deque<int> deque;
   
    /* Element in queue */
    deque.push_back(2);   // add to the end of the queue
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // add to the top of the queue
    deque.push_front(1);
   
    /* Access to elements */
    int front = deque.front(); // head element of the queue
    int back = deque.back();   // end of queue element
   
    /* Element out of line */
    deque.pop_front();  // the top element of the queue is out of the queue
    deque.pop_back();   // the last element of the queue is out of the queue
   
    /* Get the length of the double-ended queue */
    int size = deque.size();
   
    /* Determine if the double-ended queue is empty */
    bool empty = deque.empty();
    ```

=== "Java"

    ```java title="deque.java"
    /* Initialize double-ended queue */
    Deque<Integer> deque = new LinkedList<>();
   
    /* Element in queue */
    deque.offerLast(2);   // add to the end of the queue
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);  // add to the top of the queue
    deque.offerFirst(1);
   
    /* Access to elements */
    int peekFirst = deque.peekFirst();  // first element of the queue
    int peekLast = deque.peekLast();    // the last element of the queue
   
    /* Element out of line */
    int popFirst = deque.pollFirst();  // first element out of queue
    int popLast = deque.pollLast();    // end of queue out of queue
   
    /* Get the length of the double-ended queue */
    int size = deque.size();
   
    /* Determine if the double-ended queue is empty */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* Initialize double-ended queue */
    // In C#, think of a linked list, a LinkedList, as a double-ended queue.
    LinkedList<int> deque = new();
   
    /* Element in queue */
    deque.AddLast(2);   // add to the end of the queue
    deque.AddLast(5);
    deque.AddLast(4);
    deque.AddFirst(3);  // add to the top of the queue
    deque.AddFirst(1);
   
    /* Access to elements */
    int peekFirst = deque.First.Value;  // first element of the queue
    int peekLast = deque.Last.Value;    // the last element of the queue
   
    /* Element out of line */
    deque.RemoveFirst();  // the first element of the queue is out of the queue
    deque.RemoveLast();   // the end of the queue is out of the queue
   
    /* Get the length of the double-ended queue */
    int size = deque.Count;
   
    /* Determine if the double-ended queue is empty */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* Initialize double-ended queue */
    // Use lists as double-ended queues in Go.
    deque := list.New()
   
    /* Element in queue */
    deque.PushBack(2)      // add to the end of the queue
    deque.PushBack(5)
    deque.PushBack(4)
    deque.PushFront(3)     // add to the top of the queue
    deque.PushFront(1)
   
    /* Access to elements */
    front := deque.Front() // head element of the queue
    rear := deque.Back()   // the end element of the queue
   
    /* Element out of line */
    deque.Remove(front)    // head element out of queue
    deque.Remove(rear)     // the end of the queue is out of the queue
   
    /* Get the length of the double-ended queue */
    size := deque.Len()
   
    /* Determine if the double-ended queue is empty */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* Initialize double-ended queue */
    // Swift doesn't have a built-in double-ended queue class, so you can use Array as a double-ended queue.
    var deque: [Int] = []

    /* Element in queue */
    deque.append(2) // add to the end of the queue
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // add to top of queue
    deque.insert(1, at: 0)

    /* Access to elements */
    let peekFirst = deque.first! // The first element of the queue.
    let peekLast = deque.last! // The last element of the queue.

    /* Element out of line */
    // The complexity of popFirst is O(n) when simulating with Array.
    let popFirst = deque.removeFirst() // the first element of the queue is out of the queue
    let popLast = deque.removeLast() // the last element of the queue is out of the queue

    /* Get the length of the double-ended queue */
    let size = deque.count

    /* Determine if the double-ended queue is empty */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* Initialize double-ended queue */
    // JavaScript doesn't have a built-in double-ended queue, you can only use Array as a double-ended queue.
    const deque = [];

    /* Element in queue */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Note that the unshift() method has a time complexity of O(n) because it is an array.
    deque.unshift(3);
    deque.unshift(1);
    console.log("Double-ended queue dequeue = ", deque);

    /* Access to elements */
    const peekFirst = deque[0];
    console.log("Team head element peekFirst = " + peekFirst);
    const peekLast = deque[deque.length - 1];
    console.log("Last element of queue peekLast = " + peekLast);

    /* Element out of line */
    // Note that the shift() method has a time complexity of O(n) because it's an array.
    const popFront = deque.shift();
    console.log("First element out of the queue popFront = " + popFront + ", first out of the queue after deque = " + deque);
    const popBack = deque.pop();
    console.log("End-of-queue out element popBack = " + popBack + ", end-of-queue out after deque = " + deque);

    /* Get the length of the double-ended queue */
    const size = deque.length;
    console.log("Double-ended queue length size = " + size);

    /* Determine if the double-ended queue is empty */
    const isEmpty = size === 0;
    console.log("Whether double-ended queue is empty = " + isEmpty);
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* Initialize double-ended queue */
    // TypeScript doesn't have a built-in double-ended queue; you can only use Array as a double-ended queue.
    const deque: number[] = [];

    /* Element in queue */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Note that the unshift() method has a time complexity of O(n) because it is an array.
    deque.unshift(3);
    deque.unshift(1);
    console.log("Double-ended queue dequeue = ", deque);

    /* Access to elements */
    const peekFirst: number = deque[0];
    console.log("Team head element peekFirst = " + peekFirst);
    const peekLast: number = deque[deque.length - 1];
    console.log("Last element of queue peekLast = " + peekLast);

    /* Element out of line */
    // Note that the shift() method has a time complexity of O(n) because it's an array.
    const popFront: number = deque.shift() as number;
    console.log("First element out of the queue popFront = " + popFront + ", first out of the queue after deque = " + deque);
    const popBack: number = deque.pop() as number;
    console.log("End-of-queue out element popBack = " + popBack + ", end-of-queue out after deque = " + deque);

    /* Get the length of the double-ended queue */
    const size: number = deque.length;
    console.log("length of double-ended queue size = " + size);

    /* Determine if the double-ended queue is empty */
    const isEmpty: boolean = size === 0;
    console.log("Whether double-ended queue is empty = " + isEmpty);
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* Initialize double-ended queue */
    // In Dart, Queues are defined as double-ended queues.
    Queue<int> deque = Queue<int>();

    /* Element in queue */
    deque.addLast(2);  // add to the end of the queue
    deque.addLast(5);
    deque.addLast(4);
    deque.addFirst(3); // add to the top of the queue
    deque.addFirst(1);

    /* Access to elements */
    int peekFirst = deque.first; // first element of the queue
    int peekLast = deque.last;   // the last element of the queue

    /* Element out of line */
    int popFirst = deque.removeFirst(); // first element out of queue
    int popLast = deque.removeLast();   // the last element out of the queue

    /* Get the length of the double-ended queue */
    int size = deque.length;

    /* Determine if the double-ended queue is empty */
    bool isEmpty = deque.isEmpty;W
    ```

=== "Rust"

    ```rust title="deque.rs"
    /* Initialize double-ended queue */
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Element in queue */
    deque.push_back(2);  // add to the end of the queue
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // add to the top of the queue
    deque.push_front(1);

    /* Access to elements */
    if let Some(front) = deque.front() { // the first element of the queue
    }
    if let Some(rear) = deque.back() {   // end-of-queue element
    }

    /* Element out of line */
    if let Some(pop_front) = deque.pop_front() { // the top element of the queue is out of the queue
    }
    if let Some(pop_rear) = deque.pop_back() {   // end-of-queue element out of queue
    }

    /* Get the length of the double-ended queue */
    let size = deque.len();

    /* Determine if the double-ended queue is empty */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // C does not provide a built-in double-ended queue
    ```

=== "Zig"

    ```zig title="deque.zig"

    ```

## Double-Ended Queue Implementation

The implementation of a double-ended queue is similar to a queue, and you can choose either a linked list or an array as the underlying data structure.

### Implementation Based On Bi-Directional Linked Lists

Recall from the previous section that we used an ordinary unidirectional linked list to implement the queue because it makes it easy to delete the head node (corresponding to an out-of-queue operation) and add a new node after the tail node (corresponding to an in-queue operation).

For a double-ended queue, both the head and the tail can perform in-queue and out-queue operations. In other words, a double-ended queue needs to realize another symmetric direction. For this reason, we use a "bidirectional linked list" as the underlying data structure of a double-ended queue.

As shown in the figure below, we consider the head and tail nodes of a double-ended queue as the head and tail of the double-ended queue, and realize the function of adding and deleting nodes at both ends at the same time.

=== "LinkedListDeque"
    ![Implementing in-queue and out-queue operations for double-ended queues based on linked lists](deque.assets/linkedlist_deque.png)

=== "pushLast()"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_push_last.png)

=== "pushFirst()"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_push_first.png)

=== "popLast()"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_pop_last.png)

=== "popFirst()"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_pop_first.png)

The implementation code is shown below.

```src
[file]{linkedlist_deque}-[class]{linked_list_deque}-[func]{}
```

### An Array-Based Implementation

As shown in the figure below, similar to implementing queues based on arrays, we can also implement double-ended queues using ring arrays.

=== "ArrayDeque"
    ![Implementing in-queue and out-queue operations for double-ended queues based on arrays](deque.assets/array_deque.png)

=== "pushLast()"
    ![array_deque_push_last](deque.assets/array_deque_push_last.png)

=== "pushFirst()"
    ![array_deque_push_first](deque.assets/array_deque_push_first.png)

=== "popLast()"
    ![array_deque_pop_last](deque.assets/array_deque_pop_last.png)

=== "popFirst()"
    ![array_deque_pop_first](deque.assets/array_deque_pop_first.png)

On the basis of the queue implementation, only need to add the "queue head into the queue" and "queue tail out of the queue" method.

```src
[file]{array_deque}-[class]{array_deque}-[func]{}
```

## Double-Ended Queue Application

A double-ended queue combines the logic of both stacks and queues, **so it can realize all the application scenarios of both, while providing a higher degree of freedom**.

As we know, the "undo" function of software is usually realized by using a stack: the system `push` each change operation to the stack, and then `pop` to realize the undo. However, software usually limits the number of undo steps (e.g. only $50$ steps are allowed to be saved) due to the limitation of system resources. When the length of the stack exceeds $50$, the software needs to perform a delete operation at the bottom of the stack (i.e., the head of the queue). **However, the stack is unable to fulfill this function, and then a double-ended queue needs to be used instead of the stack**. Note that the core logic of "undo" still follows the stack's first-in, first-out principle, but the double-ended queue is able to implement some additional logic more flexibly.
