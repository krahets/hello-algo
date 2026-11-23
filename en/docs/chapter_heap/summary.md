# Summary

### Key takeaways

- A heap is a complete binary tree. Depending on its ordering condition, it is either a max heap or a min heap. The root holds the largest or smallest element, respectively.
- A priority queue removes elements according to their priority and is usually implemented with a heap.
- Common heap operations and their time complexities include insertion in $O(\log n)$, removing the root in $O(\log n)$, and accessing the root in $O(1)$.
- Complete binary trees are well suited to array representation, so heaps are usually stored in arrays.
- Sifting restores the heap property and is used during both insertion and removal.
- Building a heap from $n$ input elements can be optimized to $O(n)$ time.
- Top-k is a classic algorithm problem that a heap can solve efficiently in $O(n \log k)$ time.

### Q & A

**Q**: Is the heap data structure the same concept as the heap in memory management?

No; they simply share a name. In computer memory, the heap is used for dynamic memory allocation, allowing a running program to store data. A program can request heap memory for structures such as objects and arrays. When that data is no longer needed, the memory must be released to prevent leaks. Compared with stack memory, heap memory requires more careful management; misuse can lead to memory leaks, dangling pointers, and other problems.
