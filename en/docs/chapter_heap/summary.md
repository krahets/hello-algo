# Summary

### Key Review

- A heap is a complete binary tree that can be categorized as a max heap or min heap based on its property. The heap top element of a max heap (min heap) is the largest (smallest).
- A priority queue is defined as a queue with priority sorting, typically implemented using heaps.
- Common heap operations and their corresponding time complexities include: element insertion $O(\log n)$, heap top element removal $O(\log n)$, and accessing the heap top element $O(1)$.
- Complete binary trees are well-suited for array representation, so we typically use arrays to store heaps.
- Heapify operations are used to maintain the heap property and are employed in both element insertion and removal operations.
- The time complexity of building a heap with $n$ input elements can be optimized to $O(n)$, which is highly efficient.
- Top-k is a classic algorithm problem that can be efficiently solved using the heap data structure, with a time complexity of $O(n \log k)$.

### Q & A

**Q**: Are the "heap" in data structures and the "heap" in memory management the same concept?

The two are not the same concept; they just happen to share the name "heap." The heap in computer system memory is part of dynamic memory allocation, where programs can use it to store data during runtime. Programs can request a certain amount of heap memory to store complex structures such as objects and arrays. When this data is no longer needed, the program needs to release this memory to prevent memory leaks. Compared to stack memory, heap memory management and usage require more caution, as improper use can lead to issues such as memory leaks and dangling pointers.
