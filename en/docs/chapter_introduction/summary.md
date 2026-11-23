# Summary

### Key takeaways

- Algorithms are everywhere in daily life; they are not remote, inaccessible knowledge. In fact, we have already learned many algorithms without realizing it and use them to solve problems large and small.
- Looking up a word in a dictionary follows the same principle as binary search. Binary search illustrates the important algorithmic idea of divide and conquer.
- Arranging playing cards closely resembles insertion sort. Insertion sort is well suited to small datasets.
- Making change is essentially a greedy algorithm: at each step, make the choice that looks best at the moment.
- An algorithm is a set of instructions or steps that solves a specific problem within a finite time. A data structure is a way of organizing and storing data in a computer.
- Data structures and algorithms are closely connected. Data structures provide the foundation for algorithms, while algorithms bring data structures to life.
- We can compare data structures and algorithms to assembling building blocks: the blocks represent data; their shapes and connections represent data structures; and the assembly steps represent algorithms.

### Q & A

**Q**: As a programmer, I have never used algorithms to solve problems in my daily work. Common algorithms are already built into programming languages, so I can simply use them. Does this mean the problems we encounter at work are not difficult enough to require algorithms?

If specific job skills are like the techniques of a martial art, foundational subjects are more like the underlying strength that makes those techniques effective.

I believe the purpose of learning algorithms—and other foundational subjects—is not to implement them from scratch at work. It is to use what we have learned to respond and make judgments professionally when solving problems, improving the overall quality of our work. For a simple example, every programming language has a built-in sorting function:

- Without studying data structures and algorithms, we might pass any dataset to this sorting function. It runs smoothly and performs reasonably well, so nothing seems wrong.
- After studying algorithms, however, we know that the built-in sorting function has a time complexity of $O(n \log n)$. If the data consists of integers with a fixed number of digits, such as student IDs, we can use the more efficient “radix sort” to reduce the time complexity to $O(nk)$, where $k$ is the number of digits. For large datasets, the time saved can create considerable value through lower costs, a better user experience, and so on.

In engineering, optimal solutions are difficult to reach for many problems, and many others are solved only “well enough.” How difficult a problem appears depends both on its nature and on the knowledge of the person examining it. The more knowledge and experience we have, the more deeply we can analyze a problem and the more elegantly we can solve it.

**Q**: Now that AI agents write almost all our code, do we still need to learn algorithms?

To quote Mu Li: “An agent is an ability multiplier: it multiplies your ability by 10. It is not an adder that adds 10 to your ability.”

If AI multiplies our ability, then that starting ability matters too. I think two kinds of ability are especially worth developing. The first is communication, particularly collaboration with AI: state the goal clearly, supply the necessary context, and correct the course promptly. Explaining a problem to AI also helps us clarify it for ourselves. The second is foundational knowledge. AI can fill in the details, but we need to understand the basic concepts ourselves to ask relevant questions, judge what is correct, and turn its output into useful results.

One distinctive feature of AI is that, unlike earlier tools, it has no clear boundaries to its functionality. It is a little like water, taking different shapes in different people's hands. The stronger a person's abilities and the better their taste, the more pronounced AI's multiplying effect becomes.
