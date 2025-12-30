# Summary

### Key Review

**Algorithm Efficiency Assessment**

- Time efficiency and space efficiency are the two primary evaluation metrics for measuring algorithm performance.
- We can evaluate algorithm efficiency through actual testing, but it is difficult to eliminate the influence of the testing environment, and it consumes substantial computational resources.
- Complexity analysis can eliminate the drawbacks of actual testing, with results applicable to all running platforms, and it can reveal algorithm efficiency under different data scales.

**Time Complexity**

- Time complexity is used to measure the trend of algorithm runtime as data volume increases. It can effectively evaluate algorithm efficiency, but may fail in certain situations, such as when the input data volume is small or when time complexities are identical, making it impossible to precisely compare algorithm efficiency.
- Worst-case time complexity is represented using Big $O$ notation, corresponding to the asymptotic upper bound of a function, reflecting the growth level of the number of operations $T(n)$ as $n$ approaches positive infinity.
- Deriving time complexity involves two steps: first, counting the number of operations, then determining the asymptotic upper bound.
- Common time complexities arranged from low to high include $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$.
- The time complexity of some algorithms is not fixed, but rather depends on the distribution of input data. Time complexity is divided into worst-case, best-case, and average-case time complexity. Best-case time complexity is rarely used because input data generally needs to satisfy strict conditions to achieve the best case.
- Average time complexity reflects the algorithm's runtime efficiency under random data input, and is closest to the algorithm's performance in practical applications. Calculating average time complexity requires statistical analysis of input data distribution and the combined mathematical expectation.

**Space Complexity**

- Space complexity serves a similar purpose to time complexity, used to measure the trend of algorithm memory usage as data volume increases.
- The memory space related to algorithm execution can be divided into input space, temporary space, and output space. Typically, input space is not included in space complexity calculations. Temporary space can be divided into temporary data, stack frame space, and instruction space, where stack frame space usually affects space complexity only in recursive functions.
- We typically only focus on worst-case space complexity, which is the space complexity of an algorithm under worst-case input data and worst-case runtime.
- Common space complexities arranged from low to high include $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$, and $O(2^n)$.

### Q & A

**Q**: Is the space complexity of tail recursion $O(1)$?

Theoretically, the space complexity of tail recursive functions can be optimized to $O(1)$. However, most programming languages (such as Java, Python, C++, Go, C#, etc.) do not support automatic tail recursion optimization, so the space complexity is generally considered to be $O(n)$.

**Q**: What is the difference between the terms function and method?

A <u>function</u> can be executed independently, with all parameters passed explicitly. A <u>method</u> is associated with an object, is implicitly passed to the object that invokes it, and can operate on data contained in class instances.

The following examples use several common programming languages for illustration.

- C is a procedural programming language without object-oriented concepts, so it only has functions. However, we can simulate object-oriented programming by creating structures (struct), and functions associated with structures are equivalent to methods in other programming languages.
- Java and C# are object-oriented programming languages where code blocks (methods) are typically part of a class. Static methods behave like functions because they are bound to the class and cannot access specific instance variables.
- C++ and Python support both procedural programming (functions) and object-oriented programming (methods).

**Q**: Does the diagram for "common space complexity types" reflect the absolute size of occupied space?

No, the diagram shows space complexity, which reflects growth trends rather than the absolute size of occupied space.

Assuming $n = 8$, you might find that the values of each curve do not correspond to the functions. This is because each curve contains a constant term used to compress the value range into a visually comfortable range.

In practice, because we generally do not know what the "constant term" complexity of each method is, we usually cannot select the optimal solution for $n = 8$ based on complexity alone. But for $n = 8^5$, the choice is straightforward, as the growth trend already dominates.

**Q**: Are there situations where algorithms are designed to sacrifice time (or space) based on actual use cases?

In practical applications, most situations choose to sacrifice space for time. For example, with database indexes, we typically choose to build B+ trees or hash indexes, occupying substantial memory space in exchange for efficient queries of $O(\log n)$ or even $O(1)$.

In scenarios where space resources are precious, time may be sacrificed for space. For example, in embedded development, device memory is precious, and engineers may forgo using hash tables and choose to use array sequential search to save memory usage, at the cost of slower searches.
