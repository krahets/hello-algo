# Summary

### Highlights

- A heap is a complete binary tree that can be categorized into a max heap and a min heap based on the establishment conditions. The top element of the heap of a big (small) top heap is the largest (smallest).
- A priority queue is defined as a queue with an outgoing priority, usually implemented using a heap.
- The common operations of heap and their corresponding time complexity include: elements into the heap $O(\log n)$, elements out of the top of the heap $O(\log n)$ and access to the top of the heap $O(1)$, and so on.
- Complete binary trees are well suited for representation in arrays, so we usually use arrays to store heaps.
- The heapify operation is used to maintain the properties of the heap and is used in both in-heap and out-heap operations.
- The time complexity of inputting $n$ elements and building a heap can be optimized to $O(n)$ , which is very efficient.
- Top-K is a classical algorithmic problem that can be solved efficiently using a heap data structure with a time complexity of $O(n \log k)$ .

### Q & A

!!! Question "Is the "heap" of data structure the same concept as the "heap" of memory management?"

    The two are not the same concept, they just happen to both be called heaps. The heap in a computer system's memory is part of a dynamic memory allocation that a program can use to store data at runtime. Programs can request a certain amount of heap memory for storing complex structures such as objects and arrays. When this data is no longer needed, the program needs to free this memory to prevent memory leaks. Compared to stack memory, heap memory needs to be managed and used more carefully, and improper use can lead to problems such as memory leaks and wild pointers.
