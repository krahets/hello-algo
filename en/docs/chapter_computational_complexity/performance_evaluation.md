---
comments: true
---

# 2.1 &nbsp; Evaluating algorithm efficiency

Algorithm design pursues two goals in sequence.

1. **Find a solution**: The algorithm must reliably produce correct results across the specified input range.
2. **Find the best solution**: When several approaches exist, we want the most efficient algorithm possible.

Once correctness is established, efficiency becomes a primary measure of an algorithm's quality. It has two dimensions.

- **Time efficiency**: How long the algorithm takes to run.
- **Space efficiency**: How much memory it uses.

**Our goal is to design data structures and algorithms that are both fast and economical with memory**. Evaluating efficiency effectively lets us compare algorithms and guide their design and optimization.

There are two main evaluation methods: practical testing and theoretical estimation.

## 2.1.1 &nbsp; Practical testing

Suppose algorithms `A` and `B` solve the same problem. The most direct comparison is to run both on a computer and measure runtime and memory use. This reflects actual behavior, but has substantial limitations.

First, **it is difficult to remove the influence of the test environment**. Hardware affects performance: a highly parallel algorithm benefits from a multicore CPU, while a memory-intensive algorithm benefits from faster RAM. Results may differ across machines, so a fair average would require testing on many kinds of hardware, which is impractical.

Second, **comprehensive testing consumes substantial resources**. Efficiency changes with input size. Algorithm `A` may be faster than `B` for small inputs, while the reverse holds for large inputs. A convincing conclusion requires testing many input sizes, consuming considerable computing resources.

## 2.1.2 &nbsp; Theoretical estimation

Given these limitations, we can estimate efficiency through calculation alone. This is called <u>asymptotic complexity analysis</u>, or simply <u>complexity analysis</u>.

Complexity analysis relates an algorithm's time and space requirements to its input size. **It describes how runtime and memory use grow as the input gets larger**. We can unpack this definition into three points.

- Time and space resources correspond to <u>time complexity</u> and <u>space complexity</u>.
- Growth in input size means complexity relates efficiency to the amount of input data.
- Growth trends mean we study how quickly time or space increases, rather than its exact value.

**Complexity analysis overcomes limitations of practical testing** in several ways.

- It does not require running code, saving energy and computing resources.
- It is independent of the test environment, so its conclusions apply across platforms.
- It reveals efficiency at different input sizes, especially for large inputs.

!!! tip

    If complexity still feels unclear, do not worry. The following sections will explain it in detail.

Complexity analysis gives us a yardstick for evaluating the time and space an algorithm needs and comparing different algorithms.

As a mathematical concept, complexity can be abstract and challenging for beginners. This makes it a difficult topic to introduce first. Yet discussing a data structure or algorithm's properties inevitably involves runtime and memory use.

Before studying data structures and algorithms in depth, **build an initial understanding of complexity analysis so that you can analyze simple algorithms**.
