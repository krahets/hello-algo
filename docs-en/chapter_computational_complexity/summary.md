# Summary

### Highlights

**Evaluation of the efficiency of the algorithm**

- Time efficiency and space efficiency are the two main evaluation metrics for measuring the merit of an algorithm.
- We can evaluate the efficiency of the algorithm through real-world testing, but it is difficult to eliminate the effect of the testing environment and it consumes a lot of computational resources.
- Complexity analysis overcomes the drawbacks of real-world testing, the results of the analysis are applicable to all operating platforms and reveal the efficiency of the algorithm at different data sizes.

**Time complexity**

- Time complexity is used to measure the trend of the algorithm's running time with the growth of data volume, which can effectively evaluate the efficiency of the algorithm, but it may fail in some cases, such as when the input data volume is small or the time complexity is the same, it is not possible to accurately compare the advantages and disadvantages of the efficiency of the algorithm.
- The worst time complexity is denoted by a large $O$ symbol, which corresponds to the asymptotic upper bound of the function, reflecting the level of growth in the number of operations $T(n)$ as $n$ tends to positive infinity.
- Extrapolating the time complexity is done in two steps, first counting the number of operations and then determining the asymptotic upper bound.
- Common time complexities are $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$, and $O(n!)$, etc., in order of their degree.
- The time complexity of certain algorithms is non-fixed and is related to the distribution of the input data. The time complexity is categorized into worst, best, and average time complexity, with the best time complexity hardly ever being used because the input data generally needs to satisfy stringent conditions to achieve the best case.
- The average time complexity reflects the efficiency of an algorithm's operation under random data inputs, and is closest to the performance of algorithms in real-world applications. Calculating the average time complexity requires a statistical input data distribution as well as a synthesized mathematical expectation.

**space complexity**

- Space complexity acts similarly to time complexity and is used to measure the tendency of an algorithm's space occupation to grow with the amount of data.
- The memory space associated with the operation of an algorithm can be categorized into input space, staging space, and output space. Normally, the input space is not counted in the space complexity calculation. The transient space can be divided into instruction space, data space, and stack frame space, of which the stack frame space usually affects the space complexity only in the recursion function.
- We usually focus only on the worst-case space complexity, i.e., the space complexity of the statistical algorithm with the worst-case input data and the worst-case running time complexity.
- Common space complexities are $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$ and $O(2^n)$ in descending order.

### Q & A

!!! question "Is the space complexity of tail recursion $O(1)$?"

    Theoretically, the space complexity of a tail recursion function can be optimized to $O(1)$ . However, most programming languages (e.g. Java, Python, C++, Go, C#, etc.) do not support automatic optimization of tail recursion, so the space complexity is usually considered to be $O(n)$ .

!!! question "What is the difference between the terms function and method?"

    A function can be executed independently and all arguments are passed explicitly. A method is associated with an object, is implicitly passed to the object that calls it, and can manipulate data contained in instances of the class.

    Here are a few common programming languages to illustrate.

    - C is a procedural programming language and has no object-oriented concepts, so it has only functions. However, we can simulate object-oriented programming by creating structures, and the functions associated with structures are equivalent to methods in other languages.
    - Java and C# are object-oriented programming languages, and blocks of code (methods) are usually included as part of a class. A static method behaves like a function because it is bound to the class and cannot access specific instance variables.
    - C++ and Python support both procedural programming (functions) and object-oriented programming (methods).

!!! question "Does the figure "Common Types of Space Complexity" reflect the absolute size of the occupied space?"

    No, that figure shows the space complexity, which reflects the growth trend, not the absolute size of the space occupied.
   
    Suppose you take $n = 8$ , you may find that the values of each curve do not correspond to the function. This is because each curve contains a constant term that is used to compress the range of values to a visually comfortable range.

    In practice, since we usually don't know what the "constant term" complexity of each method is, it is generally impossible to choose the optimal solution for $n = 8$ based on complexity alone. But for $n = 8^5$ it's a good choice, when the growth trend is already dominant.
