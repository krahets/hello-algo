---
comments: true
---

# 5.4 &nbsp; Summary

### 1. &nbsp; Key takeaways

- A stack follows the last-in, first-out rule. You can implement one with an array or a linked list.
- An array-based stack is faster on average, but a single push takes $O(n)$ time when the array needs to grow. A linked-list stack has more consistent operation times.
- An array-based stack may leave some memory unused. On the other hand, a linked list node takes up more memory than an array element.
- A queue follows the first-in, first-out rule. Like a stack, it can use either an array or a linked list, with similar trade-offs in time and space.
- A deque offers more flexibility than an ordinary queue because it allows insertion and removal at either end.

### 2. &nbsp; Q & A

**Q**: Does a browser use a doubly linked list for back and forward navigation?

A browser’s back and forward navigation follows the logic of a stack. When you visit a new page, the browser pushes it onto the stack. When you click Back, the browser pops the current page off the stack. As the section on deques explains, using a deque makes it easy to support some additional operations.

**Q**: After popping a node, do I need to free its memory?

If you still need the node, keep its memory allocated. Once you no longer need it, languages such as `Java` and `Python` use automatic garbage collection, so you do not have to free the memory yourself. In `C` and `C++`, you must free it manually.

**Q**: A deque looks like two stacks joined together. What is it used for?

You can think of a deque as a stack and a queue combined, or as two stacks joined together. It supports both stack and queue operations, so it can serve all the same purposes and offers more flexibility.

**Q**: How do undo and redo work?

Use two stacks, `A` for undo and `B` for redo.

1. Whenever the user performs a new action, push it onto stack `A` and clear stack `B`.
2. When the user selects Undo, pop the most recent action from stack `A` and push it onto stack `B`.
3. When the user selects Redo, pop the most recent action from stack `B` and push it onto stack `A`.
