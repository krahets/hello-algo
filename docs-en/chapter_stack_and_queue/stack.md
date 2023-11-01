# Stack

A "stack" is a linear data structure that follows a first-in, first-out logic.

We can analogize the stack to a stack of plates on a table, if we need to take out the bottom plate, we need to first remove the top plate in turn. We replace the plates with elements of various types (e.g., integers, characters, objects, etc.) to get the stack data structure.

As shown in the figure below, we call the top of the stack the "top of the stack" and the bottom the "bottom of the stack". The operation of adding an element to the top of the stack is called "Into the stack", and the operation of removing an element from the top of the stack is called "Out of the stack".

![First-in-first-out rule for stacks](stack.assets/stack_operations.png)

## Common Operations On Stacks

The common operations of the stack are shown in the table below, and the specific method names need to be determined according to the programming language used. Here, we take the common names `push()`, `pop()`, `peek()` as examples.

<p align="center"> Table <id> &nbsp; Efficiency of stack operations </p>

| Methods | Description                            | Time Complexity |
| ------- | -------------------------------------- | --------------- |
| push()  | element to stack (add to top of stack) | $O(1)$          |
| pop()   | top element of stack out               | $O(1)$          |
| peek()  | access top stack element               | $O(1)$          |

Usually, we can just use the built-in stack class of a programming language. However, some languages may not provide a stack class, so we can use the language's "arrays" or "linked lists" as stacks, and ignore stack-independent operations in the program logic.

=== "Python"

    ```python title="stack.py"
    # Initialize the stack
    # Python doesn't have a built-in stack class, so you can use List as a stack.
    stack: list[int] = []
   
    # Element on the stack
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
   
    # Access the top element of the stack
    peek: int = stack[-1]
   
    # Element out of the stack
    pop: int = stack.pop()
   
    # Get the length of the stack
    size: int = len(stack)
   
    # Determine if it's empty
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* Initialize the stack */
    stack<int> stack;
   
    /* Element on stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
   
    /* Accesses the top element of the stack */
    int top = stack.top();
   
    /* Element out of stack */
    stack.pop(); // no return value
   
    /* Get the length of the stack */
    int size = stack.size();
   
    /* Determine if it is empty */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* Initialize the stack */
    Stack<Integer> stack = new Stack<>();

    /* Element on stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Accesses the top element of the stack */
    int peek = stack.peek();

    /* Element out of stack */
    int pop = stack.pop();

    /* Get the length of the stack */
    int size = stack.size();

    /* Determine if it is empty */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* Initialize the stack */
    Stack<int> stack = new();
   
    /* Element on stack */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);
   
    /* Accesses the top element of the stack */
    int peek = stack.Peek();
   
    /* Element out of stack */
    int pop = stack.Pop();
   
    /* Get the length of the stack */
    int size = stack.Count;
   
    /* Determine if it is empty */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* Initialize the stack */
    // In Go, it is recommended to use Slice as a stack.
    var stack []int
   
    /* Element on stack */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)
   
    /* Accesses the top element of the stack */
    peek := stack[len(stack)-1]
   
    /* Element out of stack */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]
   
    /* Get the length of the stack */
    size := len(stack)
   
    /* Determine if it is empty */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* Initialize the stack */
    // Swift doesn't have a built-in stack class, so you can use Array as a stack.
    var stack: [Int] = []
   
    /* Element on stack */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
   
    /* Accesses the top element of the stack */
    let peek = stack.last!
   
    /* Element out of stack */
    let pop = stack.removeLast()
   
    /* Get the length of the stack */
    let size = stack.count
   
    /* Determine if it is empty */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* Initialize the stack */
    // JavaScript doesn't have a built-in stack class, you can use Array as a stack.
    const stack = [];
   
    /* Element on stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
   
    /* Accesses the top element of the stack */
    const peek = stack[stack.length-1];
   
    /* Element out of stack */
    const pop = stack.pop();
   
    /* Get the length of the stack */
    const size = stack.length;
   
    /* Determine if it is empty */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* Initialize the stack */
    // TypeScript doesn't have a built-in stack class, so you can use Array as a stack.
    const stack: number[] = [];
   
    /* Element on stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
   
    /* Accesses the top element of the stack */
    const peek = stack[stack.length - 1];
   
    /* Element out of stack */
    const pop = stack.pop();
   
    /* Get the length of the stack */
    const size = stack.length;
   
    /* Determine if it is empty */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* Initialize the stack */
    // Dart doesn't have a built-in stack class, so you can use List as a stack.
    List<int> stack = [];

    /* Element on stack */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* Accesses the top element of the stack */
    int peek = stack.last;

    /* Element out of stack */
    int pop = stack.removeLast();

    /* Get the length of the stack */
    int size = stack.length;

    /* Determine if it is empty */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* Initialize the stack */
    // Use the Vec as a stack.
    let mut stack: Vec<i32> = Vec::new();

    /* Element on stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Accesses the top element of the stack */
    let top = stack[stack.len() - 1];

    /* Element out of stack */
    let pop = stack.pop().unwrap();

    /* Get the length of the stack */
    let size = stack.len();

    /* Determine if it is empty */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C does not provide a built-in stack.
    ```

=== "Zig"

    ```zig title="stack.zig"

    ```

## Stack Implementation

In order to get a deeper understanding of how stacks work, let's try to implement a stack class ourselves.

A stack follows the first-in-first-out principle, so we can only add or remove elements at the top of the stack. However, arrays and linked lists can add and remove elements anywhere, **so the stack can be thought of as a restricted array or linked list**. In other words, we can "mask" some of the extraneous operations of arrays or linked lists so that their external logic conforms to the properties of a stack.

### A Linked List Based Implementation

When using a linked list to implement a stack, we can consider the head node of the linked list as the top of the stack and the tail node as the bottom of the stack.

As shown in the figure below, for the stack operation, we only need to insert the element into the head of the linked list node insertion method is called "head insertion method". For stack out operation, we just need to remove the head node from the linked list.

=== "LinkedListStack"
    ![Implementing stack-in-stack-out operations based on linked lists](stack.assets/linkedlist_stack.png)

=== "push()"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_push.png)

=== "pop()"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_pop.png)

The following is sample code for implementing a stack based on a linked list.

```src
[file]{linkedlist_stack}-[class]{linked_list_stack}-[func]{}
```

### An Array-Based Implementation

When using an array to implement a stack, we can use the tail of the array as the top of the stack. As shown in the figure below, the stack-in and stack-out operations correspond to adding and removing elements to the tail of the array, respectively, both with a time complexity of $O(1)$ .

=== "ArrayStack"
    ![Implementing stack in/out operations based on arrays](stack.assets/array_stack.png)

=== "push()"
    ![array_stack_push](stack.assets/array_stack_push.png)

=== "pop()"
    ![array_stack_pop](stack.assets/array_stack_pop.png)

Since the elements of the stack may be constantly increasing, we can use dynamic arrays so that we do not have to deal with the array expansion problem. Here is the sample code.

```src
[file]{array_stack}-[class]{array_stack}-[func]{}
```

## Comparison Of Two Implementations

**Support Operations**

Both implementations support the operations in the stack definition. The array implementation additionally supports random access, but this is beyond the scope of the stack definition, so it is generally not used.

**Time Efficiency**

In array-based implementations, both the stack-in and stack-out operations are performed in pre-allocated contiguous memory with good cache locality, and thus are more efficient. However, if the stack entry exceeds the capacity of the array, the expansion mechanism is triggered, causing the time complexity of that stack entry operation to become $O(n)$ .

In the linked list implementation, the expansion of linked lists is very flexible and does not suffer from the efficiency degradation when expanding arrays as described above. However, the stack entry operation requires initialization of the node object and modification of the pointer, and is therefore relatively inefficient. However, if the stacked element is itself a node object, then the initialization step can be omitted, thus improving efficiency.

In summary, when the elements of the in-stack and out-stack operations are basic data types, such as `int` or `double` , we can conclude the following.

- Stacks implemented based on arrays are less efficient when expanding is triggered, but are more efficient on average because expanding is a low-frequency operation.
- Stacks implemented based on linked lists provide a more consistent performance in terms of efficiency.

**Space efficiency**

When initializing a list, the system assigns an "initial capacity" to the list, which may exceed the actual demand. Moreover, the expansion mechanism is usually based on a specific multiplier (e.g., 2x), and the expanded capacity may also exceed the actual demand. As a result, **stacks implemented based on arrays may cause a certain amount of wasted space**.

However, since linked lists nodes require additional storage of pointers, **therefore linked nodes take up a relatively large amount of space**.

In summary, we cannot simply determine which implementation is more memory-efficient; we need to analyze the situation on a case-by-case basis.

## Typical Applications Of Stacks

- **Backward and Forward in Browsers, Undo and Undoverse in Software**. Whenever we open a new web page, the browser executes the previous page into the stack so that we can go back to the previous page with the backward operation. The backward operation actually executes out of the stack. If we want to support both backward and forward, then we need two stacks to implement it together.
- **Program memory management**. Each time a function is called, the system adds a stack frame to the top of the stack to record the context information of the function. In a recursion function, the downward recursion phase performs constant in-stack operations, while the upward backward phase performs out-stack operations.
