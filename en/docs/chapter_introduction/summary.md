# Summary

- Algorithms are ubiquitous in daily life and are not as inaccessible and complex as they might seem. In fact, we have already unconsciously learned many algorithms to solve various problems in life.
- The principle of looking up a word in a dictionary is consistent with the binary search algorithm. The binary search algorithm embodies the important algorithmic concept of divide and conquer.
- The process of organizing playing cards is very similar to the insertion sort algorithm. The insertion sort algorithm is suitable for sorting small datasets.
- The steps of making change in currency essentially follow the greedy algorithm, where each step involves making the best possible choice at the moment.
- An algorithm is a set of step-by-step instructions for solving a specific problem within a finite time, while a data structure defines how data is organized and stored in a computer.
- Data structures and algorithms are closely linked. Data structures are the foundation of algorithms, and algorithms are the stage to utilize the functions of data structures.
- We can compare data structures and algorithms to assembling building blocks. The blocks represent data, the shape and connection method of the blocks represent data structures, and the steps of assembling the blocks correspond to algorithms.

### Q & A

**Q**：As a programmer, I’ve rarely needed to implement algorithms manually in my daily work. Most commonly used algorithms are already built into programming languages and libraries, ready to use. Does this suggest that the problems we encounter in our work haven’t yet reached the level of complexity that demands custom algorithm design?

If specific work skills are like the "moves" in martial arts, then fundamental subjects are more like "internal strength".

I believe the significance of learning algorithms (and other fundamental subjects) isn’t necessarily to implement them from scratch at work, but to enable more professional decision-making and problem-solving based on a solid understanding of the concepts. This, in turn, raises the overall quality of our work. For example, every programming language provides a built-in sorting function:

- If we have not learned data structures and algorithms, then given any data, we might just give it to this sorting function. It runs smoothly, has good performance, and seems to have no problems.
- However, if we’ve studied algorithms, we understand that the time complexity of a built-in sorting function is typically $O(n \log n)$. Moreover, if the data consists of integers with a fixed number of digits (such as student IDs), we can apply a more efficient approach like radix sort, reducing the time complexity to  O(nk) , where  k  is the number of digits. When handling large volumes of data, the time saved can turn into significant value — lowering costs, improving user experience, and enhancing system performance.

In engineering, many problems are difficult to solve optimally; most are addressed with ‘near-optimal’ solutions. The difficulty of a problem depends not only on its inherent complexity but also on the knowledge and experience of the person tackling it. The deeper one’s expertise and experience, the more thorough the analysis, and the more elegantly the problem can be solved.
