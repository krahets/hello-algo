# Evaluation Of Algorithm Efficiency

In the algorithm design, we pursue the following two levels successively.

1. **Finding the solution to the problem**: the algorithm needs to reliably find the correct solution to the problem within a specified input range.
2. **Seek optimal solutions**: there may be multiple solutions to the same problem and we want to find the most efficient algorithm possible.

That is to say, under the premise of being able to solve the problem, algorithm efficiency has become the main evaluation index for measuring the merits of algorithms, which includes the following two dimensions.

- **Time efficiency**: how fast or slow the algorithm runs.
- **Space efficiency**: the amount of memory space occupied by the algorithm.

In short, our goal is to design data structures and algorithms that are "fast and frugal". Evaluating the efficiency of algorithms effectively is crucial because only then can we compare various algorithms to guide the algorithm design and optimization process.

There are two main types of efficiency assessment methods: practical testing, and theoretical estimation.

## Practical Tests

Suppose we now have algorithm `A` and algorithm `B` , both of which solve the same problem, and we now need to compare the efficiency of these two algorithms. The most direct way is to find a computer, run these two algorithms, and monitor and record their running time and memory usage. This type of evaluation reflects the real situation, but also has major limitations.

On the one hand, **it is difficult to exclude disturbing factors in the test environment**. Hardware configuration affects the performance of algorithms. For example, in a certain computer, the running time of algorithm `A` is shorter than that of algorithm `B`; however, in another computer with a different configuration, we may get the opposite test results. This means that we need to test on a variety of machines and count the average efficiency, which is unrealistic.

On the other hand, **it is very resource-consuming to carry out a full test**. As the amount of input data varies, the algorithms show different efficiencies. For example, when the amount of input data is small, the running time of algorithm `A` is less than that of algorithm `B`; while the test results may be opposite when the amount of input data is large. Therefore, in order to obtain convincing conclusions, we need to test various sizes of input data, which requires a lot of computational resources.

## Theoretical Estimates

Since practical tests have large limitations, we can consider evaluating the efficiency of an algorithm by only a few calculations. This estimation method is called "asymptotic complexity analysis", or "complexity analysis" for short.

The complexity analysis reflects the relationship between the time (space) resources required to run the algorithm and the size of the input data. **It describes the growing trend in the time and space required for the execution of an algorithm as the size of the input data increases**. This definition is a bit of a mouthful, and we can understand it by dividing it into three key points.

- The terms "time and space resources" correspond to "time complexity" and "space complexity" respectively.
- "As the size of the input data increases" means that the complexity reflects the relationship between the efficiency of the algorithm operation and the volume of the input data.
- "Trends in the growth of time and space" means that the analysis of complexity is not concerned with specific values of running time or occupied space, but rather with the "speed" of the growth of time or space.

**Complexity analysis overcomes the drawbacks of practical testing methods in two ways**.

- It is independent of the test environment and the analysis results are applicable to all operating platforms.
- It can reflect the efficiency of algorithms under different data volumes, especially the performance of algorithms under large data volumes.

!!! tip

    If you're still confused about the concept of complexity, don't worry, we'll cover it in detail in subsequent chapters.

Complexity analysis provides a "yardstick" for evaluating the efficiency of an algorithm, allowing us to measure the time and space resources required to execute an algorithm and to compare the efficiency of different algorithms.

Complexity is a mathematical concept that may be abstract and relatively difficult for beginners to learn. From this point of view, complexity analysis may not be very suitable as the first introduction. However, when we discuss the characteristics of a particular data structure or algorithm, it is difficult to avoid analyzing its running speed and space usage.

To summarize, it is recommended that you build a preliminary understanding of complexity analysis before you dive into data structures and algorithms **to be able to complete complexity analysis of simple algorithms**.
