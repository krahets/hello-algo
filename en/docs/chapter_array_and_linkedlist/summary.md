# Summary

### Key takeaways

- Arrays and linked lists are fundamental structures representing contiguous and scattered memory storage. Their strengths are complementary.
- Arrays support random access and use less memory, but insertion and deletion are slow, and their length is fixed after initialization.
- Linked lists efficiently insert and remove nodes by changing references (pointers), and their length is flexible. However, accessing nodes is slow and they use more memory. Common forms include singly linked, circular, and doubly linked lists.
- A list is an ordered collection supporting insertion, removal, access, and modification. It is usually implemented as a dynamic array, retaining array advantages while allowing its length to change.
- Lists make arrays much more practical, though they may waste some memory.
- During execution, data is mainly stored in RAM. Arrays use memory more efficiently, while linked lists offer more flexible allocation.
- Cache lines, prefetching, spatial locality, and temporal locality provide fast CPU access to data, substantially improving execution speed.
- Arrays usually outperform linked lists because of higher cache hit rates. Choose a structure according to the actual requirements and setting.

### Q & A

**Q**: Does storing an array on the stack or heap affect time and space efficiency?

Both use contiguous memory, so data operations have essentially the same efficiency. However, the stack and heap differ in these ways.

1. Allocation and deallocation: Stack memory is relatively small and allocated automatically by the compiler. The heap is larger, supports dynamic allocation in code, and is more prone to fragmentation. Heap allocation and deallocation are therefore usually slower.
2. Size limits: Stack space is relatively small, while the heap is generally limited by available memory, making it better suited to large arrays.
3. Flexibility: Stack array sizes must be known at compile time, while heap array sizes can be determined at runtime.

**Q**: Why must array elements have the same type, while this requirement is not emphasized for linked lists?

Linked lists consist of nodes connected by references (pointers). Different nodes can hold different types, such as `int`, `double`, `string`, and `object`.

Array elements must have the same type so that their positions can be calculated from offsets. If an array contained both `int` and `long`, occupying 4 and 8 bytes respectively, the following formula would not work because there would be two element sizes.

```shell
# Element address = array address (first element's address) + element size * element index
```

**Q**: After removing node `P`, must we set `P.next` to `None`?

Leaving `P.next` unchanged is acceptable. A traversal from the list's head to its tail no longer encounters `P`, so it has been removed. Whatever `P` points to no longer affects the list.

For algorithm exercises, leaving it connected is fine as long as the logic is correct. For a standard library, disconnecting it is safer and clearer: if the removed node is not reclaimed properly, its reference may prevent its successor from being reclaimed.

**Q**: Insertion and deletion in a linked list take $O(1)$ time, but locating the element first takes $O(n)$. Why is the overall complexity not $O(n)$?

Finding an element and then deleting it does take $O(n)$ time. However, $O(1)$ insertion and deletion are useful in other settings. A deque, for example, can use a linked list with pointers maintained at the head and tail, giving $O(1)$ operations.

**Q**: In the linked list storage diagram, does the light-blue pointer occupy a separate memory location, or share half the node's space with its value?

The diagram is qualitative. Exact sizes depend on the circumstances.

- Node values of different types, such as `int`, `long`, `double`, and objects, occupy different amounts of space.
- A pointer's size depends on the operating system and compilation environment, and is usually 8 or 4 bytes.

**Q**: Does appending to a list always take $O(1)$ time?

If appending exceeds the available capacity, the list must first expand. The system allocates new memory and copies all existing elements, making that operation $O(n)$.

**Q**: When lists waste memory, does this mean the extra variables for capacity, length, and growth factor?

The main waste has two sources. First, the initial allocation may exceed what we need. Second, to avoid frequent resizing, capacity usually grows by a factor such as $\times 1.5$, leaving empty slots that may never all be filled.

**Q**: In Python, after `n = [1, 2, 3]`, the three elements seem to have consecutive addresses. But in `m = [2, 1, 3]`, their IDs are not consecutive and match those in `n`. Is `m` still an array?

Consider storing linked list nodes instead: `n = [n1, n2, n3, n4, n5]`. These five objects are usually scattered in memory, yet an index still gives a node's address in $O(1)$ time. The array stores references to the nodes, not the nodes themselves.

Unlike many languages, Python also wraps numbers in objects. A list stores references to those objects rather than the numbers themselves. Thus, the same numbers in the two arrays can have the same IDs, and their addresses need not be contiguous.

**Q**: C++ STL's `std::list` already implements a doubly linked list. Why do algorithm books rarely use it directly? Does it have limitations?

First, we often favor arrays and use linked lists only when needed, mainly for two reasons.

- Space overhead: Each element needs two extra pointers, to its predecessor and successor, so `std::list` usually consumes more space than `std::vector`.
- Poor cache locality: Its data is not contiguous, making cache use less efficient. In general, `std::vector` performs better.

Second, linked structures are mainly needed for binary trees and graphs. For stacks and queues, we usually use the language's provided `stack` and `queue` rather than a linked list directly.

**Q**: Does `res = [[0]] * n` create a two-dimensional list with independent `[0]` entries?

No. Every `[0]` is a reference to the same object. Modifying an element through one reference changes the corresponding element seen through all the others.

To create independent `[0]` lists, use `res = [[0] for _ in range(n)]`. This initializes $n$ separate list objects.

**Q**: Does `res = [0] * n` create independent integer zeros?

All zeros in the list refer to the same object. Python caches small integers, usually -5 through 256, to maximize reuse and improve performance.

Even so, each list entry can be changed independently because Python integers are immutable. Assigning a new value switches the entry to a different object reference instead of modifying the original object.

When an element is mutable, such as a list, dictionary, or class instance, modifying the object itself is visible through every reference to it.
