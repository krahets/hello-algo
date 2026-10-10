# Classification of Data Structures

Common data structures include arrays, linked lists, stacks, queues, hash tables, trees, heaps, and graphs. They can be classified from two dimensions: "logical structure" and "physical structure".

## Logical Structure: Linear and Non-Linear

**Logical structure reveals the logical relationships between data elements**. In arrays and linked lists, data is arranged in a certain order, embodying linear relationships between elements; while in trees, data is arranged hierarchically from top to bottom, showing parent-descendant relationships; graphs are composed of nodes and edges, reflecting complex network relationships.

In this section, we classify logical structures as linear or non-linear according to whether their elements form a one-to-one sequence.

- **Linear data structures**: Arrays, linked lists, stacks, and queues, whose elements have a one-to-one sequential relationship.
- **Non-linear data structures**: Trees, heaps, graphs, and hash tables, whose elements need not form a linear sequence.

Common logical relationships in non-linear structures include the following.

- **Tree structures**: Trees and heaps, whose elements have a one-to-many relationship.
- **Network structures**: Graphs, whose elements have a many-to-many relationship.
- **Set structures**: Elements belong to the same collection without a prescribed sequence or hierarchy, as with the collection of key-value pairs in a hash table.

Here, we treat each key-value pair in a hash table as an element. Values are accessed by key, without requiring predecessor or successor relationships between pairs, so we classify the hash table as non-linear. Its use of arrays, linked lists, or trees is an implementation detail, separate from this logical classification. The figure below illustrates these structures.

![Linear and non-linear data structures](classification_of_data_structure.assets/classification_logic_structure.png)

## Physical Structure: Contiguous and Dispersed

**When an algorithm program runs, the data being processed is mainly stored in memory**. The figure below shows a computer memory stick, where each black square contains a memory space. We can imagine memory as a huge Excel spreadsheet, where each cell can store a certain amount of data.

**The system accesses data at the target location through memory addresses**. As shown in the figure below, the computer assigns a number to each cell in the spreadsheet according to specific rules, ensuring that each memory space has a unique memory address. With these addresses, the program can access data in memory.

![Memory stick, memory space, memory address](classification_of_data_structure.assets/computer_memory_location.png)

!!! tip

    It should be noted that comparing memory to an Excel spreadsheet is only a simplified analogy. The actual workings of memory are much more complex, involving concepts such as address space, memory management, cache mechanisms, virtual memory, and physical memory.

Memory is a shared resource for all programs. When a block of memory is occupied by a program, it usually cannot be used by other programs at the same time. **Therefore, in the design of data structures and algorithms, memory resources are an important consideration**. For example, the peak memory occupied by an algorithm should not exceed the remaining free memory of the system; if there is a lack of contiguous large memory blocks, then the data structure chosen must be able to be stored in dispersed memory spaces.

As shown in the figure below, **physical structure reflects the way data is stored in computer memory**. It can be divided into contiguous-space storage (arrays) and dispersed-space storage (linked lists). At a low level, physical structure determines how data is accessed, updated, inserted, and deleted. These two physical structures exhibit complementary characteristics in terms of time efficiency and space efficiency.

![Contiguous space storage and dispersed space storage](classification_of_data_structure.assets/classification_phisical_structure.png)

It is worth noting that **all data structures are implemented based on arrays, linked lists, or a combination of both**. For example, stacks and queues can be implemented using either arrays or linked lists; while the implementation of hash tables may include both arrays and linked lists.

- **Can be implemented based on arrays**: Stacks, queues, hash tables, trees, heaps, graphs, matrices, tensors (arrays with dimensions $\geq 3$), etc.
- **Can be implemented based on linked lists**: Stacks, queues, hash tables, trees, heaps, graphs, etc.

After initialization, linked lists can still adjust their length during program execution, so they are also called "dynamic data structures". After initialization, the length of arrays cannot be changed, so they are also called "static data structures". It is worth noting that arrays can change length by reallocating memory, thus retaining a limited degree of flexibility.

!!! tip

    If you find it difficult to understand physical structure, it is recommended to read the next chapter first, and then review this section.
