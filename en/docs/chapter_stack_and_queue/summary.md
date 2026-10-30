# Summary

### Key takeaways

- A stack follows last-in, first-out order and can be implemented with an array or linked list.
- An array-based stack offers higher average time efficiency, but a push that triggers expansion takes $O(n)$ time. A linked-list stack provides more consistent performance.
- An array-based stack may waste some space. However, linked-list nodes require more memory than individual array elements.
- A queue follows first-in, first-out order and can also be implemented with an array or linked list. Their time and space tradeoffs resemble those of stack implementations.
- A deque is a more flexible queue that allows insertion and removal at both ends.

### Q & A

**Q**: Are browser back and forward navigation implemented with a doubly linked list?

Browser navigation fundamentally reflects stack behavior. Visiting a new page adds it to the top of a stack; clicking Back removes it. A deque conveniently supports additional operations, as discussed in the deque section.

**Q**: After popping a node, do we need to free its memory?

If the node will still be used, do not free it. If it is no longer needed, languages such as `Java` and `Python` use automatic garbage collection, so manual deallocation is unnecessary. In `C` and `C++`, memory must be released manually.

**Q**: A deque looks like two stacks joined together. What is it useful for?

A deque resembles a combination of a stack and a queue, or two stacks joined together. It combines stack and queue behavior, supporting all their applications with greater flexibility.

**Q**: How exactly do undo and redo work?

Use two stacks: `A` for undo and `B` for redo.

1. Whenever the user performs an action, push it onto `A` and clear `B`.
2. To undo, pop the most recent action from `A` and push it onto `B`.
3. To redo, pop the most recent action from `B` and push it onto `A`.
