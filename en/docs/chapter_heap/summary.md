# Summary

### Key Review

- A heap is a complete binary tree. Depending on the property it satisfies, it can be classified as either a max heap or a min heap. The top element of a max heap (min heap) is the largest (smallest) element.
- A priority queue is a queue in which elements are dequeued according to priority, and it is typically implemented using a heap.
- Common heap operations and their corresponding time complexities include inserting an element $O(\log n)$, removing the top element $O(\log n)$, and accessing the top element $O(1)$.
- Complete binary trees are well-suited for array representation, so we typically use arrays to store heaps.
- Heapify operations are used to maintain the heap property and are employed in both element insertion and removal operations.
- Building a heap from $n$ input elements can be optimized to $O(n)$, which is highly efficient.
- Top-k is a classic algorithmic problem that can be solved efficiently using a heap, with a time complexity of $O(n \log k)$.

### Q & A

**Q**: Does the term "heap" in data structures mean the same thing as "heap" in memory management?

They are not the same concept; they simply share the same name. In computer systems, the heap is part of dynamic memory allocation, and programs can use it to store data at runtime. A program can request a certain amount of heap memory to store complex structures such as objects and arrays. When the data is no longer needed, the program must release that memory to prevent memory leaks. Compared with stack memory, heap memory requires more careful management and use; improper handling can lead to problems such as memory leaks and dangling pointers.
