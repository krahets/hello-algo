# Classifying data structures

Common data structures include arrays, linked lists, stacks, queues, hash tables, trees, heaps, and graphs. They can be classified by their logical structure and physical structure.

## Logical structure: linear and nonlinear

**Logical structure describes the relationships between data elements**. Arrays and linked lists arrange data in sequence, expressing linear relationships. Trees arrange data hierarchically from top to bottom, expressing ancestry and descent. Graphs consist of vertices and edges that express complex network relationships.

As shown in the figure below, logical structures fall into two broad categories: linear and nonlinear. A linear structure arranges data in a logical sequence; a nonlinear structure does not.

- **Linear data structures**: Arrays, linked lists, stacks, queues, and hash tables. Elements have one-to-one sequential relationships.
- **Nonlinear data structures**: Trees, heaps, graphs, and hash tables.

Nonlinear data structures can be divided further into tree and network structures.

- **Tree structures**: Trees, heaps, and hash tables, with one-to-many relationships.
- **Network structures**: Graphs, with many-to-many relationships.

![Linear and nonlinear data structures](classification_of_data_structure.assets/classification_logic_structure.png)

## Physical structure: contiguous and scattered storage

**While an algorithm runs, the data it processes is mainly stored in memory**. The figure below shows a memory module, with each black chip containing storage space. We can imagine memory as a huge Excel spreadsheet, where each cell holds a certain amount of data.

**The system uses memory addresses to access data at particular locations**. As shown in the figure below, the computer assigns each cell a number according to specific rules, giving every memory location a unique address. Programs use these addresses to access data.

![Memory module, storage space, and memory addresses](classification_of_data_structure.assets/computer_memory_location.png)

!!! tip

    The Excel spreadsheet analogy is a simplification. Real memory is more complex and involves address spaces, memory management, caching, virtual memory, and physical memory.

Memory is a resource used by all programs. When a program occupies a region of memory, other programs usually cannot use that region at the same time. **Memory resources are therefore an important consideration when designing data structures and algorithms**. For example, an algorithm's peak memory usage should not exceed the system's available memory. If no large contiguous region is available, the chosen data structure must support scattered storage.

As shown in the figure below, **physical structure describes how data is stored in computer memory**: either contiguously (arrays) or in scattered locations (linked lists). It determines how data can be accessed, updated, inserted, and deleted. The two storage forms have complementary strengths in time and space efficiency.

![Contiguous and scattered storage](classification_of_data_structure.assets/classification_phisical_structure.png)

**All data structures are implemented using arrays, linked lists, or a combination of the two**. For example, stacks and queues can use either arrays or linked lists, while hash tables may use both.

- **Array-based implementations**: Stacks, queues, hash tables, trees, heaps, graphs, matrices, tensors (arrays with dimension $\geq 3$), and more.
- **Linked-list-based implementations**: Stacks, queues, hash tables, trees, heaps, graphs, and more.

A linked list can change length during execution after initialization, so it is called a dynamic data structure. An array's length is fixed after initialization, so it is called a static data structure. However, reallocating memory can change an array's length, providing a degree of dynamic behavior.

!!! tip

    If physical structure feels difficult to understand, read the next chapter first and then return to this section.
