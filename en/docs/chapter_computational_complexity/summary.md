# Summary

### Key review

**Algorithm Efficiency Assessment**

- Time efficiency and space efficiency are the two main criteria for assessing the merits of an algorithm.
- We can assess algorithm efficiency through actual testing, but it's challenging to eliminate the influence of the test environment, and it consumes substantial computational resources.
- Complexity analysis can overcome the disadvantages of actual testing. Its results are applicable across all operating platforms and can reveal the efficiency of algorithms at different data scales.

**Time Complexity**

- Time complexity measures the trend of an algorithm's running time with the increase in data volume, effectively assessing algorithm efficiency. However, it can fail in certain cases, such as with small input data volumes or when time complexities are the same, making it challenging to precisely compare the efficiency of algorithms.
- Worst-case time complexity is denoted using big O notation, representing the asymptotic upper bound, reflecting the growth level of the number of operations $T(n)$ as $n$ approaches infinity.
- Calculating time complexity involves two steps: first counting the number of operations, then determining the asymptotic upper bound.
- Common time complexities, arranged from low to high, include $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$, among others.
- The time complexity of some algorithms is not fixed and depends on the distribution of input data. Time complexities are divided into worst, best, and average cases. The best case is rarely used because input data generally needs to meet strict conditions to achieve the best case.
- Average time complexity reflects the efficiency of an algorithm under random data inputs, closely resembling the algorithm's performance in actual applications. Calculating average time complexity requires accounting for the distribution of input data and the subsequent mathematical expectation.

**Space Complexity**

- Space complexity, similar to time complexity, measures the trend of memory space occupied by an algorithm with the increase in data volume.
- The relevant memory space used during the algorithm's execution can be divided into input space, temporary space, and output space. Generally, input space is not included in space complexity calculations. Temporary space can be divided into temporary data, stack frame space, and instruction space, where stack frame space usually affects space complexity only in recursive functions.
- We usually focus only on the worst-case space complexity, which means calculating the space complexity of the algorithm under the worst input data and at the worst moment of operation.
- Common space complexities, arranged from low to high, include $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$, and $O(2^n)$, among others.

### Q & A

**Q**: Is the space complexity of tail recursion $O(1)$?

Theoretically, the space complexity of a tail-recursive function can be optimized to $O(1)$. However, most programming languages (such as Java, Python, C++, Go, C#) do not support automatic optimization of tail recursion, so it's generally considered to have a space complexity of $O(n)$.

**Q**: What is the difference between the terms "function" and "method"?

A "function" can be executed independently, with all parameters passed explicitly. A "method" is associated with an object and is implicitly passed to the object calling it, able to operate on the data contained within an instance of a class.

Here are some examples from common programming languages:

- C is a procedural programming language without object-oriented concepts, so it only has functions. However, we can simulate object-oriented programming by creating structures (struct), and functions associated with these structures are equivalent to methods in other programming languages.
- Java and C# are object-oriented programming languages where code blocks (methods) are typically part of a class. Static methods behave like functions because they are bound to the class and cannot access specific instance variables.
- C++ and Python support both procedural programming (functions) and object-oriented programming (methods).

**Q**: Does the "Common Types of Space Complexity" figure reflect the absolute size of occupied space?

No, the figure shows space complexities, which reflect growth trends, not the absolute size of the occupied space.

If you take $n = 8$, you might find that the values of each curve don't correspond to their functions. This is because each curve includes a constant term, intended to compress the value range into a visually comfortable range.

In practice, since we usually don't know the "constant term" complexity of each method, it's generally not possible to choose the best solution for $n = 8$ based solely on complexity. However, for $n = 8^5$, it's much easier to choose, as the growth trend becomes dominant.
