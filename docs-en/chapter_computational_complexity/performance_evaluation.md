# Evaluation Of Algorithm Efficiency

In algorithm design, we aim to achieve two goals in succession:

1. **Finding a Solution to the Problem**: The algorithm needs to reliably find the correct solution within the specified input range. This is our initial, more straightforward objective.
2. **Seeking the Optimal Solution**: There may be multiple ways to solve the same problem, and our goal is to find the most efficient algorithm possible. This is the more advanced and challenging goal.

In other words, once the ability to solve the problem is established, the efficiency of the algorithm emerges as the main benchmark for assessing its quality, which includes the following two aspects.

- **Time Efficiency**: The speed at which an algorithm runs.
- **Space Efficiency**: The amount of memory space the algorithm consumes.

In short, our goal is to design data structures and algorithms that are both "fast and economical". Effectively evaluating algorithm efficiency is crucial, as it allows for the comparison of different algorithms and guides the design and optimization process.

There are mainly two approaches for assessing efficiency: practical testing and theoretical estimation.

## Practical Testing

Let's consider a scenario where we have two algorithms, `A` and `B`, both capable of solving the same problem. To compare their efficiency, the most direct method is to use a computer to run both algorithms while monitoring and recording their execution time and memory usage. This approach provides a realistic assessment of their performance, but it also has significant limitations.

On one hand, it's challenging to eliminate the interference of the test environment. Hardware configurations can significantly affect the performance of algorithms. For instance, on one computer, Algorithm `A` might run faster than Algorithm `B`, but the results could be the opposite on another computer with different specifications. This means we would need to conduct tests on a variety of machines and calculate an average efficiency, which is impractical.

On the other hand, conducting comprehensive tests is resource-intensive. The efficiency of algorithms can vary with different volumes of input data. For example, with smaller data sets, Algorithm A might run faster than Algorithm B; however, this could change with larger data sets. Therefore, to reach a convincing conclusion, it's necessary to test a range of data sizes, which requires significant computational resources.

## Theoretical Estimation

Given the significant limitations of practical testing, we can consider assessing algorithm efficiency solely through calculations. This method of estimation is known as 'asymptotic complexity analysis,' often simply referred to as 'complexity analysis.

Complexity analysis illustrates the relationship between the time (and space) resources required by an algorithm and the size of its input data. **It describes the growing trend in the time and space required for the execution of an algorithm as the size of the input data increases**. This definition might sound a bit complex, so let's break it down into three key points for easier understanding.

- In complexity analysis, 'time and space' directly relate to 'time complexity' and 'space complexity,' respectively.
- The statement "as the size of the input data increases" highlights that complexity analysis examines the interplay between the size of the input data and the algorithm's efficiency.
- Lastly, the phrase "the growing trend in time and space required" emphasizes that the focus of complexity analysis is not on the specific values of running time or space occupied, but on the rate at which these requirements increase with larger input sizes.

**Complexity analysis overcomes the drawbacks of practical testing methods in two key ways:**.

- It is independent of the testing environment, meaning the analysis results are applicable across all operating platforms.
- It effectively demonstrates the efficiency of algorithms with varying data volumes, particularly highlighting performance in large-scale data scenarios.

!!! tip

    If you're still finding the concept of complexity confusing, don't worry. We will cover it in more detail in the subsequent chapters.

Complexity analysis provides us with a 'ruler' for evaluating the efficiency of algorithms, enabling us to measure the time and space resources required to execute a given algorithm and to compare the efficiency of different algorithms.

Complexity is a mathematical concept that might seem abstract and somewhat challenging for beginners. From this perspective, introducing complexity analysis at the very beginning may not be the most suitable approach. However, when discussing the characteristics of a particular data structure or algorithm, analyzing its operational speed and space usage is often unavoidable.

Therefore, it is recommended that before diving deeply into data structures and algorithms, **one should first gain a basic understanding of complexity analysis. This foundational knowledge will facilitate the complexity analysis of simple algorithms.**

