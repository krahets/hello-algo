# Summary

### Key review

- Stack is a data structure that follows the Last-In-First-Out (LIFO) principle and can be implemented using arrays or linked lists.
- In terms of time efficiency, the array implementation of the stack has a higher average efficiency. However, during expansion, the time complexity for a single push operation can degrade to $O(n)$. In contrast, the linked list implementation of a stack offers more stable efficiency.
- Regarding space efficiency, the array implementation of the stack may lead to a certain degree of space wastage. However, it's important to note that the memory space occupied by nodes in a linked list is generally larger than that for elements in an array.
- A queue is a data structure that follows the First-In-First-Out (FIFO) principle, and it can also be implemented using arrays or linked lists. The conclusions regarding time and space efficiency for queues are similar to those for stacks.
- A double-ended queue (deque) is a more flexible type of queue that allows adding and removing elements at both ends.

### Q & A

**Q**: Is the browser's forward and backward functionality implemented with a doubly linked list?

A browser's forward and backward navigation is essentially a manifestation of the "stack" concept. When a user visits a new page, the page is added to the top of the stack; when they click the back button, the page is popped from the top of the stack. A double-ended queue (deque) can conveniently implement some additional operations, as mentioned in the "Double-Ended Queue" section.

**Q**: After popping from a stack, is it necessary to free the memory of the popped node?

If the popped node will still be used later, it's not necessary to free its memory. In languages like Java and Python that have automatic garbage collection, manual memory release is not necessary; in C and C++, manual memory release is required.

**Q**: A double-ended queue seems like two stacks joined together. What are its uses?

A double-ended queue, which is a combination of a stack and a queue or two stacks joined together, exhibits both stack and queue logic. Thus, it can implement all applications of stacks and queues while offering more flexibility.

**Q**: How exactly are undo and redo implemented?

Undo and redo operations are implemented using two stacks: Stack `A` for undo and Stack `B` for redo.

1. Each time a user performs an operation, it is pushed onto Stack `A`, and Stack `B` is cleared.
2. When the user executes an "undo", the most recent operation is popped from Stack `A` and pushed onto Stack `B`.
3. When the user executes a "redo", the most recent operation is popped from Stack `B` and pushed back onto Stack `A`.
