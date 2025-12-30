# What Is an Algorithm

## Algorithm Definition

An <u>algorithm</u> is a set of instructions or operational steps that solves a specific problem within a finite amount of time. It has the following characteristics.

- The problem is well-defined, with clear input and output definitions.
- It is feasible and can be completed within a finite number of steps, time, and memory space.
- Each step has a definite meaning, and under the same input and operating conditions, the output is always the same.

## Data Structure Definition

A <u>data structure</u> is a way of organizing and storing data, covering the data content, relationships between data, and methods for data operations. It has the following design objectives.

- Occupy as little space as possible to save computer memory.
- Data operations should be as fast as possible, covering data access, addition, deletion, update, etc.
- Provide a concise data representation and logical information so that algorithms can run efficiently.

**Data structure design is a process full of trade-offs**. If we want to achieve improvements in one aspect, we often need to make compromises in another aspect. Here are two examples.

- Compared to arrays, linked lists are more convenient for data addition and deletion operations but sacrifice data access speed.
- Compared to linked lists, graphs provide richer logical information but require larger memory space.

## The Relationship Between Data Structures and Algorithms

As shown in the figure below, data structures and algorithms are highly related and tightly coupled, specifically manifested in the following three aspects.

- Data structures are the foundation of algorithms. Data structures provide algorithms with structured storage of data and methods for operating on data.
- Algorithms breathe life into data structures. Data structures themselves only store data information; combined with algorithms, they can solve specific problems.
- Algorithms can usually be implemented based on different data structures, but execution efficiency may vary greatly. Choosing the appropriate data structure is key.

![The relationship between data structures and algorithms](what_is_dsa.assets/relationship_between_data_structure_and_algorithm.png)

Data structures and algorithms are like assembling building blocks as shown in the figure below. A set of building blocks, in addition to containing many parts, also comes with detailed assembly instructions. By following the instructions step by step, we can assemble an exquisite building block model.

![Assembling blocks](what_is_dsa.assets/assembling_blocks.png)

The detailed correspondence between the two is shown in the table below.

<p align="center"> Table <id> &nbsp; Comparing data structures and algorithms to assembling building blocks </p>

| Data structures and algorithms | Assembling building blocks                                        |
| ------------------------------ | ------------------------------------------------------------------ |
| Input data                     | Unassembled building blocks                                        |
| Data structure                 | Organization form of building blocks, including shape, size, connection method, etc. |
| Algorithm                      | A series of operational steps to assemble the blocks into the target form |
| Output data                    | Building block model                                               |

It is worth noting that data structures and algorithms are independent of programming languages. For this reason, this book is able to provide implementations based on multiple programming languages.

!!! tip "Conventional abbreviation"

    In actual discussions, we usually abbreviate "data structures and algorithms" as "algorithms". For example, the well-known LeetCode algorithm problems actually examine knowledge of both data structures and algorithms.
