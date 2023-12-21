---
comments: true
---

# 2.5 &nbsp; Summary

### 1. &nbsp; Highlights

**Evaluation of Algorithm Efficiency**

- Time and space efficiency are the two leading evaluation indicators to measure an algorithm.
- We can evaluate the efficiency of an algorithm through real-world testing. Still, it isn't easy to eliminate the side effects from the testing environment, and it consumes a lot of computational resources.
- Complexity analysis overcomes the drawbacks of real-world testing. The analysis results can apply to all operating platforms and reveal the algorithm's efficiency under variant data scales.

**Time Complexity**

- Time complexity is used to measure the trend of algorithm running time as the data size grows., which can effectively evaluate the algorithm's efficiency. However, it may fail in some cases, such as when the input volume is small or the time complexities are similar, making it difficult to precisely compare the efficiency of algorithms.
- The worst time complexity is denoted by big $O$ notation, which corresponds to the asymptotic upper bound of the function, reflecting the growth rate in the number of operations $T(n)$ as $n$ tends to positive infinity.
- The estimation of time complexity involves two steps: first, counting the number of operations, and then determining the asymptotic upper bound.
- Common time complexities, from lowest to highest, are $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$.
- The time complexity of certain algorithms is not fixed and depends on the distribution of the input data. The time complexity can be categorized into worst-case, best-case, and average. The best-case time complexity is rarely used because the input data must meet strict conditions to achieve the best-case.
- The average time complexity reflects the efficiency of an algorithm with random data inputs, which is closest to the performance of algorithms in real-world scenarios. Calculating the average time complexity requires statistical analysis of input data and a synthesized mathematical expectation.

**Space Complexity**

- Space complexity serves a similar purpose to time complexity and is used to measure the trend of space occupied by an algorithm as the data volume increases.
- The memory space associated with the operation of an algorithm can be categorized into input space, temporary space, and output space. Normally, the input space is not considered when determining space complexity. The temporary space can be classified into instruction space, data space, and stack frame space, and the stack frame space usually only affects the space complexity for recursion functions.
- We mainly focus on the worst-case space complexity, which refers to the measurement of an algorithm's space usage when given the worst-case input data and during the worst-case execution scenario.
- Common space complexities are $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$ and $O(2^n)$ from lowest to highest.

### 2. &nbsp; Q & A

!!! question "Is the space complexity of tail recursion $O(1)$?"

    Theoretically, the space complexity of a tail recursion function can be optimized to $O(1)$. However, most programming languages (e.g., Java, Python, C++, Go, C#, etc.) do not support auto-optimization for tail recursion, so the space complexity is usually considered as $O(n)$.

!!! question "What is the difference between the terms function and method?"

    A *function* can be executed independently, and all arguments are passed explicitly. A *method* is associated with an object and is implicitly passed to the object that calls it, allowing it to operate on the data contained within an instance of a class.

    Let's illustrate with a few common programming languages.

    - C is a procedural programming language without object-oriented concepts, so it has only functions. However, we can simulate object-oriented programming by creating structures (struct), and the functions associated with structures are equivalent to methods in other languages.
    - Java and C# are object-oriented programming languages, and blocks of code (methods) are typically part of a class. Static methods behave like a function because it is bound to the class and cannot access specific instance variables.
    - Both C++ and Python support both procedural programming (functions) and object-oriented programming (methods).

!!! question "Does the figure "Common Types of Space Complexity" reflect the absolute size of the occupied space?"

    No, that figure shows the space complexity, which reflects the growth trend, not the absolute size of the space occupied.
   
    For example, if you take $n = 8$ , the values of each curve do not align with the function because each curve contains a constant term used to compress the range of values to a visually comfortable range.

    In practice, since we usually don't know each method's "constant term" complexity, it is generally impossible to choose the optimal solution for $n = 8$ based on complexity alone. But it's easier to choose for $n = 8^5$ as the growth trend is already dominant.
