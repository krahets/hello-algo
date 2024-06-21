# Algorithm efficiency assessment

In algorithm design, we pursue the following two objectives in sequence.

1. **Finding a Solution to the Problem**: The algorithm should reliably find the correct solution within the stipulated range of inputs.
2. **Seeking the Optimal Solution**: For the same problem, multiple solutions might exist, and we aim to find the most efficient algorithm possible.

In other words, under the premise of being able to solve the problem, algorithm efficiency has become the main criterion for evaluating the merits of an algorithm, which includes the following two dimensions.

- **Time efficiency**: The speed at which an algorithm runs.
- **Space efficiency**: The size of the memory space occupied by an algorithm.

In short, **our goal is to design data structures and algorithms that are both fast and memory-efficient**. Effectively assessing algorithm efficiency is crucial because only then can we compare various algorithms and guide the process of algorithm design and optimization.

There are mainly two methods of efficiency assessment: actual testing and theoretical estimation.

## Actual testing

Suppose we have algorithms `A` and `B`, both capable of solving the same problem, and we need to compare their efficiencies. The most direct method is to use a computer to run these two algorithms and monitor and record their runtime and memory usage. This assessment method reflects the actual situation but has significant limitations.

On one hand, **it's difficult to eliminate interference from the testing environment**. Hardware configurations can affect algorithm performance. For example, algorithm `A` might run faster than `B` on one computer, but the opposite result may occur on another computer with different configurations. This means we would need to test on a variety of machines to calculate average efficiency, which is impractical.

On the other hand, **conducting a full test is very resource-intensive**. As the volume of input data changes, the efficiency of the algorithms may vary. For example, with smaller data volumes, algorithm `A` might run faster than `B`, but the opposite might be true with larger data volumes. Therefore, to draw convincing conclusions, we need to test a wide range of input data sizes, which requires significant computational resources.

## Theoretical estimation

Due to the significant limitations of actual testing, we can consider evaluating algorithm efficiency solely through calculations. This estimation method is known as <u>asymptotic complexity analysis</u>, or simply <u>complexity analysis</u>.

Complexity analysis reflects the relationship between the time and space resources required for algorithm execution and the size of the input data. **It describes the trend of growth in the time and space required by the algorithm as the size of the input data increases**. This definition might sound complex, but we can break it down into three key points to understand it better.

- "Time and space resources" correspond to <u>time complexity</u> and <u>space complexity</u>, respectively.
- "As the size of input data increases" means that complexity reflects the relationship between algorithm efficiency and the volume of input data.
- "The trend of growth in time and space" indicates that complexity analysis focuses not on the specific values of runtime or space occupied but on the "rate" at which time or space grows.

**Complexity analysis overcomes the disadvantages of actual testing methods**, reflected in the following aspects:

- It is independent of the testing environment and applicable to all operating platforms.
- It can reflect algorithm efficiency under different data volumes, especially in the performance of algorithms with large data volumes.

!!! tip

    If you're still confused about the concept of complexity, don't worry. We will introduce it in detail in subsequent chapters.

Complexity analysis provides us with a "ruler" to measure the time and space resources needed to execute an algorithm and compare the efficiency between different algorithms.

Complexity is a mathematical concept and may be abstract and challenging for beginners. From this perspective, complexity analysis might not be the best content to introduce first. However, when discussing the characteristics of a particular data structure or algorithm, it's hard to avoid analyzing its speed and space usage.

In summary, it's recommended that you establish a preliminary understanding of complexity analysis before diving deep into data structures and algorithms, **so that you can carry out simple complexity analyses of algorithms**.
