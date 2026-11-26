---
comments: true
---

# 4.5 &nbsp; Summary

### 1. &nbsp; Chapter review

- Arrays and linked lists are two fundamental data structures. They represent two ways to store data in memory, contiguous and noncontiguous storage, and their strengths complement each other.
- Arrays support random access and use relatively little memory, but insertion and removal are inefficient, and the length is fixed after initialization.
- A linked list supports efficient insertion and removal by changing references (pointers), and its length is flexible. However, accessing nodes by position is inefficient, and nodes use more memory. Common types include singly linked, circular, and doubly linked lists.
- A list is an ordered collection that supports insertion, removal, lookup, and updates. It is usually backed by a dynamic array, preserving the advantages of an array while allowing its length to change.
- Lists make arrays much more practical but can leave some memory unused.
- While a program is running, its data is stored mainly in main memory. Arrays can use memory more efficiently, while linked lists offer greater flexibility in how memory is allocated.
- Cache lines, prefetching, and the use of spatial and temporal locality give the CPU fast access to data and significantly improve execution speed.
- Arrays generally have higher cache hit rates and are therefore usually more efficient than linked lists. Choose the structure that fits the particular requirements and situation.

### 2. &nbsp; Q & A

**Q**: Does storing an array on the stack or on the heap affect its time or space efficiency?

Arrays occupy contiguous memory on both the stack and the heap, so operations on their data have essentially the same efficiency. The stack and heap differ in other respects, however.

1. Allocation and deallocation: The stack is a relatively small region of memory where the compiler manages allocation automatically. The heap is larger, supports dynamic allocation in code, and is more prone to fragmentation. Allocating and freeing heap memory are therefore usually slower than the corresponding stack operations.
2. Size limits: Stack space is relatively small, while heap size is generally limited by available memory. The heap is therefore better suited to large arrays.
3. Flexibility: The size of a stack array must be determined at compile time, while a heap array's size can be determined dynamically at runtime.

**Q**: Why do we say array elements must have the same type without imposing the same requirement on linked lists?

A linked list consists of nodes connected by references (pointers). Individual nodes can store different types of data, such as `int`, `double`, `string`, or `object`.

Array elements, on the other hand, must have the same type so we can locate an element by calculating its offset. Suppose an array contained both `int` and `long` elements, occupying 4 and 8 bytes, respectively. With two different element sizes, the following formula would no longer give the correct offset.

```shell
# Element address = array address (address of the first element) + element size * element index
```

**Q**: After removing node `P`, do we need to set `P.next` to `None`?

You can leave `P.next` as it is. Traversing the list from head to tail will no longer encounter `P`. Node `P` has therefore been removed, and where `P` points no longer affects this list.

For an algorithm exercise, leaving the link intact is fine as long as the program's logic is correct. In a standard library, severing it is safer and makes the intent clearer. If a removed node is not reclaimed properly, its outgoing link can interfere with reclaiming its successor.

**Q**: Inserting or removing a node in a linked list takes $O(1)$ time. If finding the element first takes $O(n)$ time, why isn't the complexity $O(n)$?

If you first search for an element and then remove it, the time is indeed $O(n)$. The advantage of $O(1)$ insertion and removal shows up in other uses. A linked list is a good fit for a deque, for example: keep pointers to the head and tail, and each insertion or removal takes $O(1)$ time.

**Q**: In “A linked list and its memory layout,” does the light blue cell for the node pointer take up one memory location, or do the pointer and value each occupy half of the node?

The diagram is qualitative. The actual sizes depend on the circumstances.

- Node values occupy different amounts of space depending on their type, such as `int`, `long`, `double`, or a class instance.
- The space occupied by a pointer depends on the operating system and compilation environment. It is typically 8 or 4 bytes.

**Q**: Does appending an element to a list always take $O(1)$ time?

If the new element will not fit, the list must grow before the element can be added. The system allocates a new block of memory and moves all existing elements into it. In this case the operation takes $O(n)$ time.

**Q**: When we say “Lists make arrays much more practical but can leave some memory unused,” does the wasted space refer to variables added for capacity, length, and growth factor?

The unused space comes mainly from two sources. First, a list has an initial allocation that we may not need in full. Second, to avoid frequent resizing, the capacity usually grows by a factor such as $\times 1.5$. This can leave many empty slots that we typically do not fill.

**Q**: After I initialize `n = [1, 2, 3]` in Python, the three elements appear to have consecutive addresses. But after I initialize `m = [2, 1, 3]`, their IDs are no longer consecutive and instead match the corresponding IDs in `n`. If the elements have nonconsecutive addresses, is `m` still an array?

Consider a list of linked list nodes, `n = [n1, n2, n3, n4, n5]`. The five node objects will usually be scattered throughout memory. Yet given a list index, we can still retrieve the address of the corresponding node in $O(1)$ time and access it. The array stores references to the nodes rather than the nodes themselves.

Unlike many languages, Python represents numbers as objects too. A list stores references to those objects rather than the numbers themselves. This explains why the same numbers in these two arrays have the same IDs and why the number objects need not occupy consecutive addresses.

**Q**: The C++ STL provides a doubly linked list, `std::list`. Why do some algorithm books rarely use it directly? Does it have limitations?

For one thing, we usually prefer to implement algorithms with arrays and use linked lists only when needed, for two main reasons.

- Space overhead: Each element needs two extra pointers, one to the previous element and one to the next, so `std::list` usually takes up more space than `std::vector`.
- Poor cache locality: Because the data is not contiguous, `std::list` makes less efficient use of the cache. In general, `std::vector` performs better.

For another, the main uses that call for linked nodes are binary trees and graphs. For stacks and queues, programmers often use the language's `stack` and `queue` types instead of a linked list.

**Q**: When `res = [[0]] * n` creates a two-dimensional list, is each `[0]` independent?

No. Every `[0]` in this two-dimensional list refers to the same object. If you change one element, you will see all the corresponding elements change along with it.

To give each `[0]` its own object, use `res = [[0] for _ in range(n)]`. This initializes $n$ independent `[0]` list objects.

**Q**: When `res = [0] * n` creates a list, is each integer 0 independent?

All the zeros in this list refer to the same object. Python caches small integers (typically −5 through 256) so that objects can be reused as much as possible, improving performance.

Although the elements refer to the same object, we can still update each list entry independently because Python integers are immutable. Assigning a new value to an entry redirects its reference to another object and leaves the original object unchanged.

When the elements refer to a mutable object, such as a list, dictionary, or class instance, modifying the object through one entry changes the object itself. Every entry referring to it then reflects the same change.
