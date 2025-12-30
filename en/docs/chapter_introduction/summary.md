# Summary

### Key Review

- Algorithms are ubiquitous in daily life and are not distant, esoteric knowledge. In fact, we have already learned many algorithms unconsciously and use them to solve problems big and small in life.
- The principle of looking up a dictionary is consistent with the binary search algorithm. Binary search embodies the important algorithmic idea of divide and conquer.
- The process of organizing playing cards is very similar to the insertion sort algorithm. Insertion sort is suitable for sorting small datasets.
- The steps of making change are essentially a greedy algorithm, where the best choice is made at each step based on the current situation.
- An algorithm is a set of instructions or operational steps that solves a specific problem within a finite amount of time, while a data structure is the way computers organize and store data.
- Data structures and algorithms are closely connected. Data structures are the foundation of algorithms, and algorithms breathe life into data structures.
- We can compare data structures and algorithms to assembling building blocks. The blocks represent data, the shape and connection method of the blocks represent the data structure, and the steps to assemble the blocks correspond to the algorithm.

### Q & A

**Q**: As a programmer, I have never used algorithms to solve problems in my daily work. Common algorithms are already encapsulated by programming languages and can be used directly. Does this mean that the problems in our work have not yet reached the level where algorithms are needed?

If we compare specific work skills to "techniques" in martial arts, then fundamental subjects should be more like "internal skills".

I believe the significance of learning algorithms (and other fundamental subjects) is not to implement them from scratch at work, but rather to be able to make professional reactions and judgments when solving problems based on the knowledge learned, thereby improving the overall quality of work. Here is a simple example. Every programming language has a built-in sorting function:

- If we have not studied data structures and algorithms, we might simply feed any given data to this sorting function. It runs smoothly with good performance, and there doesn't seem to be any problem.
- But if we have studied algorithms, we would know that the time complexity of the built-in sorting function is $O(n \log n)$. However, if the given data consists of integers with a fixed number of digits (such as student IDs), we can use the more efficient "radix sort", reducing the time complexity to $O(nk)$, where $k$ is the number of digits. When the data volume is very large, the saved running time can create significant value (reduced costs, improved experience, etc.).

In the field of engineering, a large number of problems are difficult to reach optimal solutions, and many problems are only solved "approximately". The difficulty of a problem depends on one hand on the nature of the problem itself, and on the other hand on the knowledge reserve of the person observing the problem. The more complete a person's knowledge and the more experience they have, the deeper their analysis of the problem will be, and the more elegantly the problem can be solved.
