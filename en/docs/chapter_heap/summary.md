# Summary

### Key review

- A heap is a complete binary tree that can be categorized as either a max heap or a min heap based on its building property, where the top element of a max heap is the largest and the top element of a min heap is the smallest.
- A priority queue is defined as a queue with dequeue priority, usually implemented using a heap.
- Common operations of a heap and their corresponding time complexities include: element insertion into the heap $O(\log n)$, removing the top element from the heap $O(\log n)$, and accessing the top element of the heap $O(1)$.
- A complete binary tree is well-suited to be represented by an array, thus heaps are commonly stored using arrays.
- Heapify operations are used to maintain the properties of the heap and are used in both heap insertion and removal operations.
- The time complexity of building a heap given an input of $n$ elements can be optimized to $O(n)$, which is highly efficient.
- Top-k is a classic algorithm problem that can be efficiently solved using the heap data structure, with a time complexity of $O(n \log k)$.

### Q & A

**Q**: Is the "heap" in data structures the same concept as the "heap" in memory management?

The two are not the same concept, even though they are both referred to as "heap". The heap in computer system memory is part of dynamic memory allocation, where the program can use it to store data during execution. The program can request a certain amount of heap memory to store complex structures like objects and arrays. When the allocated data is no longer needed, the program needs to release this memory to prevent memory leaks. Compared to stack memory, the management and usage of heap memory demands more caution, as improper use may lead to memory leaks and dangling pointers.
