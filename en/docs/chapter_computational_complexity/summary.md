# Summary

### Key points

**Evaluating algorithm efficiency**

- Time efficiency and space efficiency are the two main measures of algorithm efficiency.
- We can test efficiency by running an algorithm, but it is hard to eliminate the effects of the test environment, and testing consumes considerable computing resources.
- Complexity analysis avoids these drawbacks of empirical testing. Its results apply across platforms and describe efficiency at different input sizes.

**Time complexity**

- Time complexity describes how running time grows with input size. It is an effective measure of efficiency, but it has limits. For example, it cannot precisely rank algorithms when the input is small or the algorithms have the same time complexity.
- We express worst-case time complexity in big-$O$ notation. It gives an asymptotic upper bound on the operation count $T(n)$ and describes its order of growth as $n$ tends to positive infinity.
- Estimating time complexity takes two steps: count the operations, then determine an asymptotic upper bound.
- Common time complexities, in increasing order, include $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$.
- For some algorithms, time complexity varies with the input distribution. We distinguish worst-case, best-case, and average-case time complexity. Best-case complexity is rarely used because the input generally has to satisfy strict conditions to achieve it.
- Average-case time complexity describes efficiency on random inputs and comes closest to performance in practice. To compute it, we need the distribution of inputs and the mathematical expectation over that distribution.

**Space complexity**

- Much like time complexity, space complexity describes growth, in this case how an algorithm's memory requirements grow with input size.
- Memory used during execution comprises input space, temporary space, and output space. We usually exclude input space when calculating space complexity. Temporary space comprises temporary data, stack frames, and instructions. Stack frames usually affect the order of space complexity only in recursive functions.
- We usually focus on worst-case space complexity, taking peak memory use during execution for the most demanding input.
- Common space complexities, in increasing order, include $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$, and $O(2^n)$.

### Q & A

**Q**: Does tail recursion have space complexity $O(1)$?

In theory, tail recursion can be optimized to use $O(1)$ space. However, most programming languages, including Java, Python, C++, Go, and C#, do not automatically optimize tail recursion as a general rule, so we usually assume $O(n)$ space.

**Q**: What is the difference between a function and a method?

A <u>function</u> can run independently, with all its arguments passed explicitly. A <u>method</u> is associated with an object. The object on which it is called is passed implicitly, allowing the method to operate on data in that instance.

Here are examples from several common programming languages.

- C is a procedural language with no built-in notion of object-oriented programming, so it has only functions. We can emulate object-oriented programming with structures (structs). A function associated with a struct plays the role of a method in other languages.
- Java and C# are object-oriented languages. Blocks of code called methods usually belong to a class. A static method behaves much like a function: it belongs to the class and has no direct access to a particular instance's variables.
- C++ and Python support both procedural programming with functions and object-oriented programming with methods.

**Q**: Does the chart of common space complexities show the actual amount of memory used?

No. It shows space complexity, which describes a growth trend rather than an absolute amount of memory.

Try $n = 8$. You may find that the plotted values do not match the corresponding functions. Each curve includes a constant to bring its values into a range that is easy to display.

In practice, we usually don't know each method's constant factors. Complexity alone therefore seldom tells us which approach is best at $n = 8$. The choice is much easier at $n = 8^5$, where the growth rate dominates.

**Q**: Do we ever deliberately trade time or space for the other when designing an algorithm for a particular application?

In practice, we usually trade space for time. For example, a database often uses a B+ tree or hash index. These indexes consume considerable memory in exchange for efficient queries taking $O(\log n)$ or even $O(1)$ time.

When memory is scarce, we may make the opposite trade. In embedded development, for example, engineers working with limited device memory may choose a sequential search through an array instead of a hash table. The lookup takes longer but uses less memory.
