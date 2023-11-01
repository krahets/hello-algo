# Summary

### Highlights

- Arrays and linked lists are two basic data structures that represent two ways of storing data in computer memory: continuous space storage and decentralized space storage, respectively. The characteristics of the two present complementary properties.
- Arrays support random access and take up less memory; however, inserting and deleting elements is inefficient and the length is immutable after initialization.
- The linked list achieves efficient node insertion and deletion by changing references (pointers) and can flexibly adjust its length; however, node access is inefficient and occupies more memory.
- Common types of linked lists include unidirectional linked lists, circular linked lists, and bidirectional linked lists, which have their own application scenarios.
- A list is an ordered collection of elements that supports adding, deleting, checking and changing, usually based on a dynamic array, which retains the advantages of arrays and can be flexibly adjusted in length.
- The advent of lists has dramatically increased the utility of arrays, but may result in some wasted memory space.

### Q & A

!!! Question "Does storing an array on the stack versus storing it on the heap have an effect on time efficiency and space efficiency?"

    Arrays stored on both the stack and the heap are stored in contiguous memory space, and the efficiency of data manipulation is essentially the same. However, the stack and heap have their own characteristics that lead to the following differences.

    1. Allocation and release efficiency: the stack is a smaller piece of memory, and allocation is done automatically by the compiler; whereas heap memory is relatively larger, can be allocated dynamically in code, and is more prone to fragmentation. As a result, allocation and release operations on the heap are usually slower than on the stack.
    2. Size Limit: The stack memory is relatively small, and the size of the heap is generally limited by the available memory. Therefore heap is more suitable for storing large arrays.
    3. Flexibility: the size of an array on the stack needs to be determined at compile time, while the size of an array on the heap can be determined dynamically at runtime.

!!! question "Why do arrays require elements of the same type, but in linked lists the same type is not emphasized?"

    A linked list consists of nodes, which are connected to each other by references (pointers), and each node can store different types of data, such as int, double, string, object, and so on.

    In contrast, the elements of an array must be of the same type so that the offset can be calculated to obtain the corresponding element position. For example, if the array contains both int and long types, and a single element occupies 4 bytes and 8 bytes respectively, then the following formula cannot be used to calculate the offset, because the array contains elements of both lengths.

    ```shell
    # Element memory address = array memory address + element length * element index
    ```

!!! question "Do I need to set `P.next` to $\text{None}$ after deleting a node?"

    It is possible to leave `P.next` unchanged. From the point of view of the linked list, traversing from the head node to the tail node no longer encounters `P`. This means that the node `P` has been deleted from the linked list, and the node `P` will not be affected by where it points.

    From a garbage collection point of view, for languages like Java, Python, Go, etc. that have automatic garbage collection, whether or not a node `P` is reclaimed depends on whether or not a reference to it still exists, not on the value of `P.next`. In languages like C and C++, we need to manually free node memory.

!!! question "The time complexity of insertion and deletion operations in a linked list is $O(1)$ . But before adding and deleting, you need to $O(n)$ find the element, so why is the time complexity not $O(n)$?"

    It is true that it is $O(n)$ if the elements are looked up first and then deleted. However, the advantage of $O(1)$ addition and deletion of linked lists can be realized in other applications. For example, a double-ended queue is suitable for implementation using a linked list, where we maintain a pointer variable always pointing to the head node, the tail node, and each insertion and deletion operation is $O(1)$ .

!!! question "In the figure "Definition and storage of a linked list", does the light blue pointer to the storage node take up a block of memory? Or does it take up half of the memory address and half of the node value?"

    The graphs in the text are only qualitative representations; quantitative representations need to be analyzed on a case-by-case basis.

    - Different types of node values take up different amounts of space, such as int, long, double, and instance objects.
    - The amount of memory space occupied by pointer variables depends on the operating system and compilation environment used, mostly 8 bytes or 4 bytes.

!!! question "Is adding an element to the end of the list $O(1)$ at all times?"

    If you add an element beyond the length of the list, you need to expand the list before adding it. The system will request a new block of memory and carry over all the elements of the original list, at which point the time complexity will be $O(n)$ .

!!! question ""The advent of lists greatly enhances the utility of arrays, but the side effect is that they cause some memory space to be wasted", where space wasted is the memory taken up by extra added variables such as capacity, length, and expansion multiplier?"

    There are two main implications of wasted space here: on the one hand, lists are set to an initial length, and we don't necessarily need to use that much. On the other hand, in order to prevent frequent expansions, expansions are usually multiplied by a factor, like $\times 1.5$ . This also leaves a lot of empty spaces, and we usually can't fill them completely.

!!! question "After initializing `n = [1, 2, 3]` in Python, the addresses of these 3 elements are linked, but initializing `m = [2, 1, 3]` reveals that the ids of each of these elements are not contiguous, but are the same as those in `n`. These elements are not contiguous, so is `m` still an array?"

    If we replace the list elements with linked list nodes `n = [n1, n2, n3, n4, n5]` , normally these five node objects are also scattered in memory. However, given a list index, we can still get the node memory address in $O(1)$ time to access the corresponding node. This is because the references to the nodes are stored in the array, not the nodes themselves.

    Unlike many languages, in Python numbers are also wrapped as objects, and what is stored in the list is not the number itself, but a reference to the number. As a result, you'll find two arrays of identical numbers with the same id, and the memory addresses of those numbers are needlessly contiguous.

!!! question "C++ STL inside `std::list` already implements bi-directional linked lists, but it seems that some algorithm books don't really use this directly, is there some limitation?"

    On the one hand, we tend to favor the use of arrays for implementing algorithms and use linked lists only when necessary for two main reasons.
   
    - Space overhead: `std::list` usually takes more space than `std::vector` since each element requires two extra pointers (one for the previous element and one for the next).
    - Cache-unfriendly: `std::list` has a low utilization of cache because the data is not stored continuously. In general, `std::vector` has better performance.

    On the other hand, the cases where it is necessary to use linked lists are mainly binary trees and graphs. Stacks and queues tend to use the `stack` and `queue` provided by the programming language rather than linked lists.

!!! question "Does the initialize list `res = [0] * self.size()` operation cause each element of `res` to reference the same address?"

    It won't. But two-dimensional arrays can have this problem, for example initializing a two-dimensional list `res = [[0] * self.size()]` references the same list `[0]` multiple times.

!!! question "In deleting a node, is it necessary to break the reference pointing between that node and its successor?"

    From a data structure and algorithm (do-it-yourself) point of view, it doesn't matter if you don't disconnect, as long as you make sure the logic of the program is correct. From the point of view of the standard library, it is safer and more logical to disconnect. If you don't disconnect, assuming that the deleted node is not properly reclaimed, then it will also affect the memory reclamation of the succeeding node.
