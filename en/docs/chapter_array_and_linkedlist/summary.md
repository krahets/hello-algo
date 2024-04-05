# Summary

### Key review

- Arrays and linked lists are two basic data structures, representing two storage methods in computer memory: contiguous space storage and non-contiguous space storage. Their characteristics complement each other.
- Arrays support random access and use less memory; however, they are inefficient in inserting and deleting elements and have a fixed length after initialization.
- Linked lists implement efficient node insertion and deletion through changing references (pointers) and can flexibly adjust their length; however, they have lower node access efficiency and consume more memory.
- Common types of linked lists include singly linked lists, circular linked lists, and doubly linked lists, each with its own application scenarios.
- Lists are ordered collections of elements that support addition, deletion, and modification, typically implemented based on dynamic arrays, retaining the advantages of arrays while allowing flexible length adjustment.
- The advent of lists significantly enhanced the practicality of arrays but may lead to some memory space wastage.
- During program execution, data is mainly stored in memory. Arrays provide higher memory space efficiency, while linked lists are more flexible in memory usage.
- Caches provide fast data access to CPUs through mechanisms like cache lines, prefetching, spatial locality, and temporal locality, significantly enhancing program execution efficiency.
- Due to higher cache hit rates, arrays are generally more efficient than linked lists. When choosing a data structure, the appropriate choice should be made based on specific needs and scenarios.

### Q & A

**Q**: Does storing arrays on the stack versus the heap affect time and space efficiency?

Arrays stored on both the stack and heap are stored in contiguous memory spaces, and data operation efficiency is essentially the same. However, stacks and heaps have their own characteristics, leading to the following differences.

1. Allocation and release efficiency: The stack is a smaller memory block, allocated automatically by the compiler; the heap memory is relatively larger and can be dynamically allocated in the code, more prone to fragmentation. Therefore, allocation and release operations on the heap are generally slower than on the stack.
2. Size limitation: Stack memory is relatively small, while the heap size is generally limited by available memory. Therefore, the heap is more suitable for storing large arrays.
3. Flexibility: The size of arrays on the stack needs to be determined at compile-time, while the size of arrays on the heap can be dynamically determined at runtime.

**Q**: Why do arrays require elements of the same type, while linked lists do not emphasize same-type elements?

Linked lists consist of nodes connected by references (pointers), and each node can store data of different types, such as int, double, string, object, etc.

In contrast, array elements must be of the same type, allowing the calculation of offsets to access the corresponding element positions. For example, an array containing both int and long types, with single elements occupying 4 bytes and 8 bytes respectively, cannot use the following formula to calculate offsets, as the array contains elements of two different lengths.

```shell
# Element memory address = array memory address + element length * element index
```

**Q**: After deleting a node, is it necessary to set `P.next` to `None`?

Not modifying `P.next` is also acceptable. From the perspective of the linked list, traversing from the head node to the tail node will no longer encounter `P`. This means that node `P` has been effectively removed from the list, and where `P` points no longer affects the list.

From a garbage collection perspective, for languages with automatic garbage collection mechanisms like Java, Python, and Go, whether node `P` is collected depends on whether there are still references pointing to it, not on the value of `P.next`. In languages like C and C++, we need to manually free the node's memory.

**Q**: In linked lists, the time complexity for insertion and deletion operations is `O(1)`. But searching for the element before insertion or deletion takes `O(n)` time, so why isn't the time complexity `O(n)`?

If an element is searched first and then deleted, the time complexity is indeed `O(n)`. However, the `O(1)` advantage of linked lists in insertion and deletion can be realized in other applications. For example, in the implementation of double-ended queues using linked lists, we maintain pointers always pointing to the head and tail nodes, making each insertion and deletion operation `O(1)`.

**Q**: In the image "Linked List Definition and Storage Method", do the light blue storage nodes occupy a single memory address, or do they share half with the node value?

The diagram is just a qualitative representation; quantitative analysis depends on specific situations.

- Different types of node values occupy different amounts of space, such as int, long, double, and object instances.
- The memory space occupied by pointer variables depends on the operating system and compilation environment used, usually 8 bytes or 4 bytes.

**Q**: Is adding elements to the end of a list always `O(1)`?

If adding an element exceeds the list length, the list needs to be expanded first. The system will request a new memory block and move all elements of the original list over, in which case the time complexity becomes `O(n)`.

**Q**: The statement "The emergence of lists greatly improves the practicality of arrays, but may lead to some memory space wastage" - does this refer to the memory occupied by additional variables like capacity, length, and expansion multiplier?

The space wastage here mainly refers to two aspects: on the one hand, lists are set with an initial length, which we may not always need; on the other hand, to prevent frequent expansion, expansion usually multiplies by a coefficient, such as $\times 1.5$. This results in many empty slots, which we typically cannot fully fill.

**Q**: In Python, after initializing `n = [1, 2, 3]`, the addresses of these 3 elements are contiguous, but initializing `m = [2, 1, 3]` shows that each element's `id` is not consecutive but identical to those in `n`. If the addresses of these elements are not contiguous, is `m` still an array?

If we replace list elements with linked list nodes `n = [n1, n2, n3, n4, n5]`, these 5 node objects are also typically dispersed throughout memory. However, given a list index, we can still access the node's memory address in `O(1)` time, thereby accessing the corresponding node. This is because the array stores references to the nodes, not the nodes themselves.

Unlike many languages, in Python, numbers are also wrapped as objects, and lists store references to these numbers, not the numbers themselves. Therefore, we find that the same number in two arrays has the same `id`, and these numbers' memory addresses need not be contiguous.

**Q**: The `std::list` in C++ STL has already implemented a doubly linked list, but it seems that some algorithm books don't directly use it. Is there any limitation?

On the one hand, we often prefer to use arrays to implement algorithms, only using linked lists when necessary, mainly for two reasons.

- Space overhead: Since each element requires two additional pointers (one for the previous element and one for the next), `std::list` usually occupies more space than `std::vector`.
- Cache unfriendly: As the data is not stored continuously, `std::list` has a lower cache utilization rate. Generally, `std::vector` performs better.

On the other hand, linked lists are primarily necessary for binary trees and graphs. Stacks and queues are often implemented using the programming language's `stack` and `queue` classes, rather than linked lists.

**Q**: Does initializing a list `res = [0] * self.size()` result in each element of `res` referencing the same address?

No. However, this issue arises with two-dimensional arrays, for example, initializing a two-dimensional list `res = [[0] * self.size()]` would reference the same list `[0]` multiple times.

**Q**: In deleting a node, is it necessary to break the reference to its successor node?

From the perspective of data structures and algorithms (problem-solving), it's okay not to break the link, as long as the program's logic is correct. From the perspective of standard libraries, breaking the link is safer and more logically clear. If the link is not broken, and the deleted node is not properly recycled, it could affect the recycling of the successor node's memory.
