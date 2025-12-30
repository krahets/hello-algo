# Summary

### Key Review

- Arrays and linked lists are two fundamental data structures, representing two different ways data can be stored in computer memory: contiguous memory storage and scattered memory storage. The characteristics of the two complement each other.
- Arrays support random access and use less memory; however, inserting and deleting elements is inefficient, and the length is immutable after initialization.
- Linked lists achieve efficient insertion and deletion of nodes by modifying references (pointers), and can flexibly adjust length; however, node access is inefficient and memory consumption is higher. Common linked list types include singly linked lists, circular linked lists, and doubly linked lists.
- A list is an ordered collection of elements that supports insertion, deletion, search, and modification, typically implemented based on dynamic arrays. It retains the advantages of arrays while allowing flexible adjustment of length.
- The emergence of lists has greatly improved the practicality of arrays, but may result in some wasted memory space.
- During program execution, data is primarily stored in memory. Arrays provide higher memory space efficiency, while linked lists offer greater flexibility in memory usage.
- Caches provide fast data access to the CPU through mechanisms such as cache lines, prefetching, and spatial and temporal locality, significantly improving program execution efficiency.
- Because arrays have higher cache hit rates, they are generally more efficient than linked lists. When choosing a data structure, appropriate selection should be made based on specific requirements and scenarios.

### Q & A

**Q**: Does storing an array on the stack versus on the heap affect time efficiency and space efficiency?

Arrays stored on the stack and on the heap are both stored in contiguous memory space, so data operation efficiency is basically the same. However, the stack and heap have their own characteristics, leading to the following differences.

1. Allocation and deallocation efficiency: The stack is a relatively small piece of memory, with allocation automatically handled by the compiler; the heap is relatively larger and can be dynamically allocated in code, more prone to fragmentation. Therefore, allocation and deallocation operations on the heap are usually slower than on the stack.
2. Size limitations: Stack memory is relatively small, and the heap size is generally limited by available memory. Therefore, the heap is more suitable for storing large arrays.
3. Flexibility: The size of an array on the stack must be determined at compile time, while the size of an array on the heap can be determined dynamically at runtime.

**Q**: Why do arrays require elements of the same type, while linked lists do not emphasize this requirement?

Linked lists are composed of nodes, with nodes connected through references (pointers), and each node can store different types of data, such as `int`, `double`, `string`, `object`, etc.

In contrast, array elements must be of the same type, so that the corresponding element position can be obtained by calculating the offset. For example, if an array contains both `int` and `long` types, with individual elements occupying 4 bytes and 8 bytes respectively, then the following formula cannot be used to calculate the offset, because the array contains two different "element lengths".

```shell
# Element Memory Address = Array Memory Address (first Element Memory address) + Element Length * Element Index
```

**Q**: After deleting node `P`, do we need to set `P.next` to `None`?

It is not necessary to modify `P.next`. From the perspective of the linked list, traversing from the head node to the tail node will no longer encounter `P`. This means that node `P` has been removed from the linked list, and it doesn't matter where node `P` points to at this time—it won't affect the linked list.

From a data structures and algorithms perspective (problem-solving), not disconnecting the pointer doesn't matter as long as the program logic is correct. From the perspective of standard libraries, disconnecting is safer and the logic is clearer. If not disconnected, assuming the deleted node is not properly reclaimed, it may affect the memory reclamation of its successor nodes.

**Q**: In a linked list, the time complexity of insertion and deletion operations is $O(1)$. However, both insertion and deletion require $O(n)$ time to find the element; why isn't the time complexity $O(n)$?

If the element is first found and then deleted, the time complexity is indeed $O(n)$. However, the advantage of $O(1)$ insertion and deletion in linked lists can be demonstrated in other applications. For example, a deque is well-suited for linked list implementation, where we maintain pointer variables always pointing to the head and tail nodes, with each insertion and deletion operation being $O(1)$.

**Q**: In the diagram "Linked List Definition and Storage Methods", does the light blue pointer node occupy a single memory address, or does it share equally with the node value?

This diagram is a qualitative representation; a quantitative representation requires analysis based on the specific situation.

- Different types of node values occupy different amounts of space, such as `int`, `long`, `double`, and instance objects, etc.
- The amount of memory space occupied by pointer variables depends on the operating system and compilation environment used, usually 8 bytes or 4 bytes.

**Q**: Is appending an element at the end of a list always $O(1)$?

If appending an element exceeds the list length, the list must first be expanded before adding. The system allocates a new block of memory and moves all elements from the original list to it, in which case the time complexity becomes $O(n)$.

**Q**: "The emergence of lists has greatly improved the practicality of arrays, but may result in some wasted memory space"—does this space waste refer to the memory occupied by additional variables such as capacity, length, and expansion factor?

This space waste mainly has two aspects: on one hand, lists typically set an initial length, which we may not need to fully utilize; on the other hand, to prevent frequent expansion, expansion generally multiplies by a coefficient, such as $\times 1.5$. As a result, there will be many empty positions that we typically cannot completely fill.

**Q**: In Python, after initializing `n = [1, 2, 3]`, the addresses of these 3 elements are contiguous, but initializing `m = [2, 1, 3]` reveals that each element's id is not continuous; rather, they are the same as those in `n`. Since the addresses of these elements are not contiguous, is `m` still an array?

If we replace list elements with linked list nodes `n = [n1, n2, n3, n4, n5]`, usually these 5 node objects are also scattered throughout memory. However, given a list index, we can still obtain the node memory address in $O(1)$ time, thereby accessing the corresponding node. This is because the array stores references to nodes, not the nodes themselves.

Unlike many languages, numbers in Python are wrapped as objects, and lists store not the numbers themselves, but references to the numbers. Therefore, we find that the same numbers in two arrays have the same id, and the memory addresses of these numbers need not be contiguous.

**Q**: C++ STL has `std::list` which has already implemented a doubly linked list, but it seems that some algorithm books don't use it directly. Is there a limitation?

On one hand, we often prefer to use arrays for implementing algorithms and only use linked lists when necessary, mainly for two reasons.

- Space overhead: Since each element requires two additional pointers (one for the previous element and one for the next element), `std::list` typically consumes more space than `std::vector`.
- Cache unfriendliness: Since data is not stored contiguously, `std::list` has lower cache utilization. In general, `std::vector` has better performance.

On the other hand, cases where linked lists are necessary mainly involve binary trees and graphs. Stacks and queues usually use the `stack` and `queue` provided by the programming language, rather than linked lists.

**Q**: Does the operation `res = [[0]] * n` create a 2D list where each `[0]` is independent?

No, they are not independent. In this 2D list, all the `[0]` are actually references to the same object. If we modify one element, we will find that all corresponding elements change accordingly.

If we want each `[0]` in the 2D list to be independent, we can use `res = [[0] for _ in range(n)]` to achieve this. The principle of this approach is to initialize $n$ independent `[0]` list objects.

**Q**: Does the operation `res = [0] * n` create a list where each integer 0 is independent?

In this list, all integer 0s are references to the same object. This is because Python uses a caching mechanism for small integers (typically -5 to 256) to maximize object reuse and improve performance.

Although they point to the same object, we can still independently modify each element in the list. This is because Python integers are "immutable objects". When we modify an element, we are actually switching to a reference of another object, rather than changing the original object itself.

However, when list elements are "mutable objects" (such as lists, dictionaries, or class instances), modifying an element directly changes the object itself, and all elements referencing that object will have the same change.
