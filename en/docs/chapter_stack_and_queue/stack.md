# Stack

A "Stack" is a linear data structure that follows the principle of Last-In-First-Out (LIFO).

We can compare a stack to a pile of plates on a table. To access the bottom plate, one must first remove the plates on top. By replacing the plates with various types of elements (such as integers, characters, objects, etc.), we obtain the data structure known as a stack.

As shown in the figure below, we refer to the top of the pile of elements as the "top of the stack" and the bottom as the "bottom of the stack." The operation of adding elements to the top of the stack is called "push," and the operation of removing the top element is called "pop."

![Stack's last-in-first-out rule](stack.assets/stack_operations.png)

## Common operations on stack

The common operations on a stack are shown in the table below. The specific method names depend on the programming language used. Here, we use `push()`, `pop()`, and `peek()` as examples.

<p align="center"> Table <id> &nbsp; Efficiency of stack operations </p>

| Method   | Description                                     | Time Complexity |
| -------- | ----------------------------------------------- | --------------- |
| `push()` | Push an element onto the stack (add to the top) | $O(1)$          |
| `pop()`  | Pop the top element from the stack              | $O(1)$          |
| `peek()` | Access the top element of the stack             | $O(1)$          |

Typically, we can directly use the stack class built into the programming language. However, some languages may not specifically provide a stack class. In these cases, we can use the language's "array" or "linked list" as a stack and ignore operations that are not related to stack logic in the program.

=== "Python"

    ```python title="stack.py"
    # Initialize the stack
    # Python does not have a built-in stack class, so a list can be used as a stack
    stack: list[int] = []

    # Push elements onto the stack
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # Access the top element of the stack
    peek: int = stack[-1]

    # Pop an element from the stack
    pop: int = stack.pop()

    # Get the length of the stack
    size: int = len(stack)

    # Check if the stack is empty
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* Initialize the stack */
    stack<int> stack;

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element of the stack */
    int top = stack.top();

    /* Pop an element from the stack */
    stack.pop(); // No return value

    /* Get the length of the stack */
    int size = stack.size();

    /* Check if the stack is empty */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* Initialize the stack */
    Stack<Integer> stack = new Stack<>();

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element of the stack */
    int peek = stack.peek();

    /* Pop an element from the stack */
    int pop = stack.pop();

    /* Get the length of the stack */
    int size = stack.size();

    /* Check if the stack is empty */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* Initialize the stack */
    Stack<int> stack = new();

    /* Push elements onto the stack */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* Access the top element of the stack */
    int peek = stack.Peek();

    /* Pop an element from the stack */
    int pop = stack.Pop();

    /* Get the length of the stack */
    int size = stack.Count;

    /* Check if the stack is empty */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* Initialize the stack */
    // In Go, it is recommended to use a Slice as a stack
    var stack []int

    /* Push elements onto the stack */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* Access the top element of the stack */
    peek := stack[len(stack)-1]

    /* Pop an element from the stack */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* Get the length of the stack */
    size := len(stack)

    /* Check if the stack is empty */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* Initialize the stack */
    // Swift does not have a built-in stack class, so Array can be used as a stack
    var stack: [Int] = []

    /* Push elements onto the stack */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* Access the top element of the stack */
    let peek = stack.last!

    /* Pop an element from the stack */
    let pop = stack.removeLast()

    /* Get the length of the stack */
    let size = stack.count

    /* Check if the stack is empty */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* Initialize the stack */
    // JavaScript does not have a built-in stack class, so Array can be used as a stack
    const stack = [];

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element of the stack */
    const peek = stack[stack.length-1];

    /* Pop an element from the stack */
    const pop = stack.pop();

    /* Get the length of the stack */
    const size = stack.length;

    /* Check if the stack is empty */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* Initialize the stack */
    // TypeScript does not have a built-in stack class, so Array can be used as a stack
    const stack: number[] = [];

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element of the stack */
    const peek = stack[stack.length - 1];

    /* Pop an element from the stack */
    const pop = stack.pop();

    /* Get the length of the stack */
    const size = stack.length;

    /* Check if the stack is empty */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* Initialize the stack */
    // Dart does not have a built-in stack class, so List can be used as a stack
    List<int> stack = [];

    /* Push elements onto the stack */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* Access the top element of the stack */
    int peek = stack.last;

    /* Pop an element from the stack */
    int pop = stack.removeLast();

    /* Get the length of the stack */
    int size = stack.length;

    /* Check if the stack is empty */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* Initialize the stack */
    // Use Vec as a stack
    let mut stack: Vec<i32> = Vec::new();

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Access the top element of the stack */
    let top = stack.last().unwrap();

    /* Pop an element from the stack */
    let pop = stack.pop().unwrap();

    /* Get the length of the stack */
    let size = stack.len();

    /* Check if the stack is empty */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C does not provide a built-in stack
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"

    ```

=== "Zig"

    ```zig title="stack.zig"

    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%88%0A%20%20%20%20%23%20Python%20%E6%B2%A1%E6%9C%89%E5%86%85%E7%BD%AE%E7%9A%84%E6%A0%88%E7%B1%BB%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E5%BD%93%E4%BD%9C%E6%A0%88%E6%9D%A5%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E6%A0%88%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E6%A0%88%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E6%A0%88%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%90%8E%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E6%A0%88%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Implementing a stack

To gain a deeper understanding of how a stack operates, let's try implementing a stack class ourselves.

A stack follows the principle of Last-In-First-Out, which means we can only add or remove elements at the top of the stack. However, both arrays and linked lists allow adding and removing elements at any position, **therefore a stack can be seen as a restricted array or linked list**. In other words, we can "shield" certain irrelevant operations of an array or linked list, aligning their external behavior with the characteristics of a stack.

### Implementation based on a linked list

When implementing a stack using a linked list, we can consider the head node of the list as the top of the stack and the tail node as the bottom of the stack.

As shown in the figure below, for the push operation, we simply insert elements at the head of the linked list. This method of node insertion is known as "head insertion." For the pop operation, we just need to remove the head node from the list.

=== "LinkedListStack"
    ![Implementing Stack with Linked List for Push and Pop Operations](stack.assets/linkedlist_stack_step1.png)

=== "push()"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png)

=== "pop()"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png)

Below is an example code for implementing a stack based on a linked list:

```src
[file]{linkedlist_stack}-[class]{linked_list_stack}-[func]{}
```

### Implementation based on an array

When implementing a stack using an array, we can consider the end of the array as the top of the stack. As shown in the figure below, push and pop operations correspond to adding and removing elements at the end of the array, respectively, both with a time complexity of $O(1)$.

=== "ArrayStack"
    ![Implementing Stack with Array for Push and Pop Operations](stack.assets/array_stack_step1.png)

=== "push()"
    ![array_stack_push](stack.assets/array_stack_step2_push.png)

=== "pop()"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png)

Since the elements to be pushed onto the stack may continuously increase, we can use a dynamic array, thus avoiding the need to handle array expansion ourselves. Here is an example code:

```src
[file]{array_stack}-[class]{array_stack}-[func]{}
```

## Comparison of the two implementations

**Supported Operations**

Both implementations support all the operations defined in a stack. The array implementation additionally supports random access, but this is beyond the scope of a stack definition and is generally not used.

**Time Efficiency**

In the array-based implementation, both push and pop operations occur in pre-allocated contiguous memory, which has good cache locality and therefore higher efficiency. However, if the push operation exceeds the array capacity, it triggers a resizing mechanism, making the time complexity of that push operation $O(n)$.

In the linked list implementation, list expansion is very flexible, and there is no efficiency decrease issue as in array expansion. However, the push operation requires initializing a node object and modifying pointers, so its efficiency is relatively lower. If the elements being pushed are already node objects, then the initialization step can be skipped, improving efficiency.

Thus, when the elements for push and pop operations are basic data types like `int` or `double`, we can draw the following conclusions:

- The array-based stack implementation's efficiency decreases during expansion, but since expansion is a low-frequency operation, its average efficiency is higher.
- The linked list-based stack implementation provides more stable efficiency performance.

**Space Efficiency**

When initializing a list, the system allocates an "initial capacity," which might exceed the actual need; moreover, the expansion mechanism usually increases capacity by a specific factor (like doubling), which may also exceed the actual need. Therefore, **the array-based stack might waste some space**.

However, since linked list nodes require extra space for storing pointers, **the space occupied by linked list nodes is relatively larger**.

In summary, we cannot simply determine which implementation is more memory-efficient. It requires analysis based on specific circumstances.

## Typical applications of stack

- **Back and forward in browsers, undo and redo in software**. Every time we open a new webpage, the browser pushes the previous page onto the stack, allowing us to go back to the previous page through the back operation, which is essentially a pop operation. To support both back and forward, two stacks are needed to work together.
- **Memory management in programs**. Each time a function is called, the system adds a stack frame at the top of the stack to record the function's context information. In recursive functions, the downward recursion phase keeps pushing onto the stack, while the upward backtracking phase keeps popping from the stack.
