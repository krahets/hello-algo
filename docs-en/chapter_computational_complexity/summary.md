# Summary

### Highlights

**Evaluation of the algorithm efficiency**

- Time and space efficiency are the two leading evaluation indicators to measure an algorithm.
- We can evaluate the efficiency of an algorithm through real-world testing. Still, it isn't easy to eliminate the side effects from the testing environment, and it consumes a lot of computational resources.
- Complexity analysis overcomes the drawbacks of real-world testing. The analysis results can apply to all operating platforms and reveal the algorithm's efficiency with different data sizes.

**Time complexity**

- Time complexity is used to measure the trend of the algorithm's running time with data volume growth, which can effectively evaluate the algorithm's efficiency. However, it may fail in some cases, such as when the input volume is small or the time complexities are similar, making it hard to compare the algorithm's efficiency accurately.
- The worst time complexity is denoted by big $O$ notation, which corresponds to the asymptotic upper bound of the function, reflecting the growth rate in the number of operations $T(n)$ as $n$ tends to positive infinity.
- The time complexity can be determined in two steps: first, counting the number of operations, then selecting the asymptotic upper bound.
- Common time complexities, from better efficiency to less efficiency, are $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$.
- The time complexity of some algorithms is not fixed and depends on the distribution of the input data. The time complexity can be categorized into worst, best, and average. The best time complexity is not commonly used because the input data must meet strict conditions to achieve the best case.
- The average time complexity reflects the efficiency of an algorithm with random data inputs, which is closest to the performance of algorithms in real-world scenarios. Calculating the average time complexity requires statistical analysis of input data and a synthesized mathematical expectation.

**space complexity**

- Space complexity serves similarly to time complexity and is used to measure the trend of the space occupied by an algorithm as the data volume increases.
- The memory space associated with the operation of an algorithm can be categorized into input space, staging space, and output space. Normally, the input space is not considered in the calculation of space complexity. The transient space can be classified into instruction space, data space, and stack frame space, and the stack frame space usually only affects the space complexity for recursion functions.
- We mainly focus on the worst-case space complexity, i.e., computing the space complexity with the worst input data and runtime.
- Common space complexities are $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$ and $O(2^n)$ from better to worse.

### Q & A

!!! question "Is the space complexity of tail recursion $O(1)$?"

    Theoretically, the space complexity of a tail recursion function can be optimized to $O(1)$. However, most programming languages (e.g., Java, Python, C++, Go, C#, etc.) do not support auto-optimization for tail recursion, so the space complexity is usually considered as $O(n)$.

!!! question "What is the difference between the terms function and method?"

    A *function* can be executed independently, and all arguments are passed explicitly. On the other hand, A *method* is associated with an object and is implicitly passed to the object that calls it, and can operate data contained in instances of the class.

    Let's illustrate with a few common programming languages.

    - C is a procedural programming language without object-oriented concepts, so it has only functions. However, we can simulate object-oriented programming by creating structures(struct), and the functions associated with structures are equivalent to methods in other languages.
    - Java and C# are object-oriented programming languages, and blocks of code (methods) are typically part of a class. Static methods behave like a function because it is bound to the class and cannot access specific instance variables.
    - C++ and Python support both procedural programming (functions) and object-oriented programming (methods).

!!! question "Does the figure "Common Types of Space Complexity" reflect the absolute size of the occupied space?"

    No, that figure shows the space complexity, which reflects the growth trend, not the absolute size of the space occupied.
   
    For example, if you take $n = 8$ , the values of each curve do not align with the function because each curve contains a constant term used to compress the range of values to a visually comfortable range.

    Since we usually don't know each method's "constant term" complexity, it is generally impossible to choose the optimal solution for $n = 8$ based on complexity alone. But it's easier to choose for $n = 8^5$ as the growth trend is already dominant.
