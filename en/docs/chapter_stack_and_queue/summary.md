# Summary

### Key Review

- A stack is a data structure that follows the LIFO principle and can be implemented using arrays or linked lists.
- In terms of time efficiency, the array implementation of a stack has higher average efficiency, but during expansion, the time complexity of a single push operation degrades to $O(n)$. In contrast, the linked-list implementation of a stack offers more stable performance.
- In terms of space efficiency, the array implementation of a stack may lead to some degree of space wastage. However, it should be noted that the memory space occupied by linked list nodes is larger than that of array elements.
- A queue is a data structure that follows the FIFO principle and can also be implemented using arrays or linked lists. The conclusions regarding time efficiency and space efficiency comparisons for queues are similar to those for stacks mentioned above.
- A deque is a queue with greater flexibility that allows adding and removing elements at both ends.

### Q & A

**Q**: Is the browser's forward and backward functionality implemented with a doubly linked list?

The browser's forward and backward behavior is essentially an application of a "stack." When a user visits a new page, that page is added to the top of the stack; when the user clicks the back button, that page is popped from the top of the stack. A deque can conveniently support some additional operations, as mentioned in the "Deque" section.

**Q**: After popping from the stack, do we need to free the memory of the popped node?

If the popped node will still be needed later, then memory does not need to be freed. If it won't be used afterward, languages like Java and Python have automatic garbage collection, so manual memory deallocation is not required; in C and C++, manual memory deallocation is necessary.

**Q**: A deque seems like two stacks joined together. What is its purpose?

A deque is like a combination of a stack and a queue, or two stacks joined together. It combines the logic of both, so it can support all applications of stacks and queues while offering greater flexibility.

**Q**: How are undo and redo specifically implemented?

Use two stacks: stack `A` for undo and stack `B` for redo.

1. Whenever the user performs an operation, push this operation onto stack `A` and clear stack `B`.
2. When the user performs "undo," pop the most recent operation from stack `A` and push it onto stack `B`.
3. When the user performs "redo," pop the most recent operation from stack `B` and push it onto stack `A`.
