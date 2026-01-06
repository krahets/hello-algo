# Algorithm Efficiency Evaluation

In algorithm design, we pursue the following two levels of objectives sequentially.

1. **Finding a solution to the problem**: The algorithm must reliably obtain the correct solution within the specified input range.
2. **Seeking the optimal solution**: Multiple solutions may exist for the same problem, and we hope to find an algorithm that is as efficient as possible.

In other words, under the premise of being able to solve the problem, algorithm efficiency has become the primary evaluation criterion for measuring the quality of algorithms. It includes the following two dimensions.

- **Time efficiency**: The length of time the algorithm runs.
- **Space efficiency**: The size of memory space the algorithm occupies.

In short, **our goal is to design data structures and algorithms that are "both fast and memory-efficient"**. Effectively evaluating algorithm efficiency is crucial, because only in this way can we compare various algorithms and guide the algorithm design and optimization process.

Efficiency evaluation methods are mainly divided into two types: actual testing and theoretical estimation.

## Actual Testing

Suppose we now have algorithm `A` and algorithm `B`, both of which can solve the same problem, and we need to compare the efficiency of these two algorithms. The most direct method is to find a computer, run these two algorithms, and monitor and record their running time and memory usage. This evaluation approach can reflect the real situation, but it also has considerable limitations.

On one hand, **it is difficult to eliminate interference factors from the testing environment**. Hardware configuration affects the performance of algorithms. For example, if an algorithm has a high degree of parallelism, it is more suitable for running on multi-core CPUs; if an algorithm has intensive memory operations, it will perform better on high-performance memory. In other words, the test results of an algorithm on different machines may be inconsistent. This means we need to test on various machines and calculate average efficiency, which is impractical.

On the other hand, **conducting complete testing is very resource-intensive**. As the input data volume changes, the algorithm will exhibit different efficiencies. For example, when the input data volume is small, the running time of algorithm `A` is shorter than algorithm `B`; but when the input data volume is large, the test results may be exactly the opposite. Therefore, to obtain convincing conclusions, we need to test input data of various scales, which requires a large amount of computational resources.

## Theoretical Estimation

Since actual testing has considerable limitations, we can consider evaluating algorithm efficiency through calculations alone. This estimation method is called <u>asymptotic complexity analysis</u>, or <u>complexity analysis</u> for short.

Complexity analysis can reflect the relationship between the time and space resources required for algorithm execution and the input data scale. **It describes the growth trend of the time and space required for algorithm execution as the input data scale increases**. This definition is somewhat convoluted, so we can break it down into three key points to understand.

- "Time and space resources" correspond to <u>time complexity</u> and <u>space complexity</u>, respectively.
- "As the input data scale increases" means that complexity reflects the relationship between algorithm running efficiency and input data scale.
- "Growth trend of time and space" indicates that complexity analysis focuses not on the specific values of running time or occupied space, but on how "fast" time or space grows.

**Complexity analysis overcomes the drawbacks of the actual testing method**, reflected in the following aspects.

- It does not need to actually run the code, making it more environmentally friendly and energy-efficient.
- It is independent of the testing environment, and the analysis results are applicable to all running platforms.
- It can reflect algorithm efficiency at different data volumes, especially algorithm performance at large data volumes.

!!! tip

    If you are still confused about the concept of complexity, don't worry—we will introduce it in detail in subsequent chapters.

Complexity analysis provides us with a "ruler" for evaluating algorithm efficiency, allowing us to measure the time and space resources required to execute a certain algorithm and compare the efficiency between different algorithms.

Complexity is a mathematical concept that may be relatively abstract for beginners, with a relatively high learning difficulty. From this perspective, complexity analysis may not be very suitable as the first content to be introduced. However, when we discuss the characteristics of a certain data structure or algorithm, it is difficult to avoid analyzing its running speed and space usage.

In summary, it is recommended that before diving deep into data structures and algorithms, **you first establish a preliminary understanding of complexity analysis so that you can complete complexity analysis of simple algorithms**.
