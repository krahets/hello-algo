# Summary

### Key review

- A heap is a complete binary tree, which can be divided into a max heap and a min heap based on its property. The top element of a max (min) heap is the largest (smallest).
- A priority queue is defined as a queue with dequeue priority, usually implemented using a heap.
- Common operations of a heap and their corresponding time complexities include: element insertion into the heap $O(\log n)$, removing the top element from the heap $O(\log n)$, and accessing the top element of the heap $O(1)$.
- A complete binary tree is well-suited to be represented by an array, thus heaps are commonly stored using arrays.
- Heapify operations are used to maintain the properties of the heap and are used in both heap insertion and removal operations.
- The time complexity of inserting $n$ elements into a heap and building the heap can be optimized to $O(n)$, which is highly efficient.
- Top-k is a classic algorithm problem that can be efficiently solved using the heap data structure, with a time complexity of $O(n \log k)$.

### Q & A

**Q**: Is the "heap" in data structures the same concept as the "heap" in memory management?

The two are not the same concept, even though they are both referred to as "heap". The heap in computer system memory is part of dynamic memory allocation, where the program can use it to store data during execution. The program can request a certain amount of heap memory to store complex structures like objects and arrays. When these data are no longer needed, the program needs to release this memory to prevent memory leaks. Compared to stack memory, the management and usage of heap memory need to be more cautious, as improper use may lead to memory leaks and dangling pointers.
