---
comments: true
---

# 8.4 &nbsp; Summary

### 1. &nbsp; Key points

- A heap is a complete binary tree. Its ordering rule makes it either a max-heap, whose root holds the maximum, or a min-heap, whose root holds the minimum.
- A priority queue removes elements in priority order. A heap is a common implementation.
- Common heap operations include pushing an element in $O(\log n)$ time, popping the root in $O(\log n)$ time, and accessing the root in $O(1)$ time.
- Arrays are well suited to complete binary trees, so heaps are usually stored in arrays.
- Heapifying maintains the heap property and is used both when pushing and when popping.
- Building a heap from $n$ input elements can take as little as $O(n)$ time.
- The top-k problem is a classic algorithm problem that a heap can solve efficiently in $O(n \log k)$ time.

### 2. &nbsp; Q & A

**Q**: Is the heap data structure the same as the heap used in memory management?

The two concepts just happen to share a name. In a computer system, heap memory supports dynamic allocation: a running program can request space for data such as objects and arrays. When the data is no longer needed, the allocated memory must be released to prevent leaks. Heap memory requires more care to manage and use than stack memory. Misuse can lead to memory leaks and dangling pointers.
