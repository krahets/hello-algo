# What is an Algorithm

## Definition of Algorithm

An "algorithm" is a set of instructions or steps to solve a specific problem within a finite amount of time. It has the following characteristics:

- The problem is clearly defined, including clear definitions of input and output.
- It is feasible, meaning it can be completed within a finite number of steps, time, and memory space.
- Each step has a definite meaning, and with the same input and running conditions, the output is always the same.

## Definition of Data Structure

A "data structure" is a way of organizing and storing data in a computer, with the following design goals:

- Minimize space occupancy to save computer memory.
- Make data operations as fast as possible, covering data access, addition, deletion, updating, etc.
- Provide concise data representation and logical information to enable efficient algorithm execution.

**Designing a data structure is a process full of trade-offs**. If you want to improve in one aspect, you often need to compromise in another. Here are two examples:

- Compared to arrays, linked lists offer more convenience in data addition and deletion but sacrifice data access speed.
- Graphs, compared to linked lists, provide richer logical information but require more memory space.

## Relationship Between Data Structures and Algorithms

As shown in the diagram below, data structures and algorithms are highly related and closely integrated, specifically in the following three aspects:

- Data structures are the foundation of algorithms. They provide structured data storage and methods for manipulating data for algorithms.
- Algorithms are the stage where data structures come into play. Data structures only store data information; they solve specific problems when combined with algorithms.
- Algorithms can often be implemented based on different data structures, but their execution efficiency can vary greatly. Choosing the right data structure is key.

![Relationship between data structure and algorithm](what_is_dsa.assets/relationship_between_data_structure_and_algorithm.png)

Data structures and algorithms are like the assembling blocks shown in the picture below. A set of blocks, in addition to many parts, also comes with detailed assembly instructions. By following these instructions step by step, you can assemble a beautiful block model.

![Assembling blocks](what_is_dsa.assets/assembling_blocks.jpg)

The detailed correspondence between the two is shown in the table below.

<p align="center"> Table <id> &nbsp; Comparing Data Structures and Algorithms to Building Blocks </p>

| Data Structures and Algorithms | Building Blocks                                                        |
| ------------------------------ | ---------------------------------------------------------------------- |
| Input data                     | Unassembled blocks                                                     |
| Data structure                 | Organization of blocks, including shape, size, connection methods, etc |
| Algorithm                      | A series of steps to assemble the blocks into the target shape         |
| Output data                    | Block model                                                            |

It's worth noting that data structures and algorithms are independent of programming languages. For this reason, this book is able to provide implementations in multiple programming languages.

!!! tip "Conventional Abbreviation"

    In practical discussions, we often refer to "Data Structures and Algorithms" simply as "Algorithms". For example, the well-known LeetCode algorithm problems actually test both data structure and algorithm knowledge.
