# Summary

### Highlights

- A stack is a data structure that follows the first-in-first-out principle and can be implemented as an array or a linked list.
- From a time efficiency perspective, array implementations of stacks have a high average efficiency, but the time complexity of a single stack entry operation deteriorates to $O(n)$ during the expansion process. In contrast, the linked list-based implementation of the stack has a more stable efficiency performance.
- In terms of space efficiency, an array implementation of a stack may result in a degree of space wastage. However, it should be noted that linked list nodes take up more memory space than array elements.
- A queue is a data structure that follows the first-in-first-out principle and can be implemented equally well with arrays or linked lists. The conclusions for queues are similar to the aforementioned conclusions for stacks in terms of the comparison of time efficiency and space efficiency.
- A double-ended queue is a type of queue with a higher degree of freedom that allows adding and removing operations of elements at both ends.

### Q & A

!!! question "Is the browser's forward and backward implemented as a two-way linked list?"

    The browser's forward and backward functions are essentially a manifestation of the "stack". When the user visits a new page, it is added to the top of the stack; when the user clicks the back button, the page is ejected from the top of the stack. Using a double-ended queue makes it easy to implement some additional operations, which are mentioned in the section on double-ended queues.

!!! question "Is it necessary to free the memory of the outgoing node after going out of the stack?"

    If the popup node is still needed later, it does not need to be freed. If you don't need it later, languages like `Java` and `Python` have automatic garbage collection mechanisms, so you don't need to free the memory manually; in `C` and `C++` you need to free the memory manually.

!!! Question "A double-ended queue looks like two stacks spliced together, what is its purpose?"

    A double-ended queue is like a combination of a stack and a queue, or two stacks put together. It shows the logic of the stack + queue, so it can realize all the applications of the stack and queue, and more flexible.

!!! question "How exactly is undo (undo) and reverse undo (redo) implemented?"

    Two stacks are used, stack `A` for undo and stack `B` for anti-undo.

    1. Whenever the user performs an operation, press this operation onto the stack `A` and empty the stack `B`.
    2. When the user executes "Undo", the most recent operation is popped from stack `A` and pressed into stack `B`.
    3. When the user performs an "anti-undo", the most recent operation is popped from stack `B` and pressed onto stack `A`.
