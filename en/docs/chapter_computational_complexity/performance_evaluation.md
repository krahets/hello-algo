# Evaluating algorithm efficiency

When designing an algorithm, we pursue two goals in sequence.

1. **Find a solution**. The algorithm must reliably give the correct answer for inputs throughout the specified range.
2. **Look for the best solution**. A problem may admit several solutions, and we want an algorithm that is as efficient as possible.

Once an algorithm solves the problem correctly, efficiency becomes a primary measure of its quality. Efficiency has two dimensions.

- **Time efficiency** measures how long the algorithm takes to run.
- **Space efficiency** measures how much memory the algorithm uses.

In short, **we want data structures and algorithms that are both fast and economical with memory**. We need an effective way to measure efficiency so that we can compare algorithms and use the results to guide design and optimization.

There are two main ways to evaluate efficiency: empirical testing and theoretical estimation.

## Empirical testing

Suppose algorithms `A` and `B` solve the same problem. The most direct way to compare them is to run both on a computer and record their running times and memory use. This measures real performance, but it has significant limitations.

First, **the test environment is hard to control for**. Hardware affects performance. An algorithm that can do much of its work in parallel is better suited to a multicore CPU, while a memory-intensive algorithm benefits from high-performance memory. Results can therefore differ across machines. To average out those effects, we would have to test on many different machines, which is impractical.

Second, **comprehensive testing takes considerable resources**. Relative performance can change with input size. For example, algorithm `A` may run faster than algorithm `B` on small inputs, yet the order may reverse on large inputs. A convincing comparison would require testing a range of input sizes, at considerable computational cost.

## Theoretical estimation

Given these limitations, can we estimate efficiency with a calculation alone? This approach is called <u>asymptotic complexity analysis</u>, or <u>complexity analysis</u> for short.

Complexity analysis relates the time and space an algorithm needs to the size of its input. **It describes how the algorithm's time and space requirements grow as the input gets larger**. Let's break that definition into three parts.

- Time and space requirements correspond to <u>time complexity</u> and <u>space complexity</u>, respectively.
- “As the input gets larger” means that complexity relates an algorithm's efficiency to its input size.
- “How the requirements grow” refers to the rate at which time or space increases, rather than a specific running time or amount of memory.

**Complexity analysis overcomes limitations of empirical testing** in several ways.

- It requires no code execution, so it saves energy.
- It is independent of the test environment, so its results apply across platforms.
- It describes efficiency across input sizes and is especially informative for large inputs.

!!! tip

    If complexity still feels unfamiliar, don't worry. We'll explore it in detail in the sections ahead.

Complexity analysis gives us a common scale for estimating the time and space an algorithm needs and comparing its efficiency with that of other algorithms.

As a mathematical concept, complexity can feel abstract and challenging at first. In that sense, it may seem an unlikely place to start. Yet it is hard to discuss a data structure or algorithm without asking how fast it runs and how much space it uses.

Before studying data structures and algorithms in depth, **build enough familiarity with complexity analysis to analyze simple algorithms**.
