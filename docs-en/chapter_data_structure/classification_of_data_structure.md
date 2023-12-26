# Classification of Data Structures

Common data structures include arrays, linked lists, stacks, queues, hash tables, trees, heaps, and graphs. They can be classified into two dimensions: "Logical Structure" and "Physical Structure".

## Logical Structure: Linear and Non-Linear

**The logical structure reveals the logical relationships between data elements**. In arrays and linked lists, data is arranged in a certain order, reflecting a linear relationship between them. In trees, data is arranged from top to bottom in layers, showing a "ancestor-descendant" hierarchical relationship. Graphs, consisting of nodes and edges, represent complex network relationships.

As shown in the figure below, logical structures can be divided into two major categories: "Linear" and "Non-linear". Linear structures are more intuitive, indicating data is arranged linearly in logical relationships; non-linear structures, conversely, are arranged non-linearly.

- **Linear Data Structures**: Arrays, Linked Lists, Stacks, Queues, Hash Tables.
- **Non-Linear Data Structures**: Trees, Heaps, Graphs, Hash Tables.

![Linear and Non-Linear Data Structures](classification_of_data_structure.assets/classification_logic_structure.png)

Non-linear data structures can be further divided into tree structures and network structures.

- **Tree Structures**: Trees, Heaps, Hash Tables, where elements have one-to-many relationships.
- **Network Structures**: Graphs, where elements have many-to-many relationships.

## Physical Structure: Contiguous and Dispersed

**When an algorithm program runs, the data being processed is mainly stored in memory**. The following figure shows a computer memory stick, each black block containing a memory space. We can imagine memory as a huge Excel spreadsheet, where each cell can store a certain amount of data.

**The system accesses data at the target location through memory addresses**. As shown in the figure below, the computer allocates numbers to each cell in the table according to specific rules, ensuring each memory space has a unique memory address. With these addresses, programs can access data in memory.

![Memory Stick, Memory Spaces, Memory Addresses](classification_of_data_structure.assets/computer_memory_location.png)

!!! tip

    It's worth noting that comparing memory to an Excel spreadsheet is a simplified analogy. The actual working mechanism of memory is more complex, involving concepts like address space, memory management, cache mechanisms, virtual memory, and physical memory.

Memory is a shared resource for all programs. When a block of memory is occupied by one program, it cannot be used by others simultaneously. **Therefore, memory resources are an important consideration in the design of data structures and algorithms**. For example, the peak memory usage of an algorithm should not exceed the system's remaining free memory. If there is a lack of contiguous large memory spaces, the chosen data structure must be able to store data in dispersed memory spaces.

As shown in the figure below, **the physical structure reflects how data is stored in computer memory**, which can be divided into contiguous space storage (arrays) and dispersed space storage (linked lists). The physical structure determines from the bottom level how data is accessed, updated, added, or deleted. Both types of physical structures exhibit complementary characteristics in terms of time efficiency and space efficiency.

![Contiguous Space Storage and Dispersed Space Storage](classification_of_data_structure.assets/classification_phisical_structure.png)

It's important to note that **all data structures are implemented based on arrays, linked lists, or a combination of both**. For example, stacks and queues can be implemented using either arrays or linked lists; while hash tables may include both arrays and linked lists.

- **Array-based Implementations**: Stacks, Queues, Hash Tables, Trees, Heaps, Graphs, Matrices, Tensors (arrays with dimensions $\geq 3$).
- **Linked List-based Implementations**: Stacks, Queues, Hash Tables, Trees, Heaps, Graphs, etc.

Data structures implemented based on arrays are also called “Static Data Structures,” meaning their length cannot be changed after initialization. Conversely, those based on linked lists are called “Dynamic Data Structures,” which can still adjust their size during program execution.

!!! tip

    If you find it difficult to understand the physical structure, it's recommended to read the next chapter first and then revisit this section.
