# Sorting algorithms

A <u>sorting algorithm</u> arranges a dataset in a specified order. Sorting is widely used because ordered data is often easier to search, analyze, and process efficiently.

As shown below, the data may consist of integers, floating-point numbers, characters, strings, and other types. The ordering rule can be chosen as needed: numerical magnitude, ASCII character order, or a custom rule.

![Examples of data types and ordering rules](sorting_algorithm.assets/sorting_examples.png)

## Evaluation criteria

**Efficiency**: We want low time complexity and few operations overall, corresponding to smaller constant factors in the complexity. Efficiency is especially important for large datasets.

**In-place operation**: An <u>in-place sort</u> works directly on the original array without an auxiliary array, saving memory. It usually moves data fewer times and runs faster as well.

**Stability**: A <u>stable sort</u> preserves the relative order of equal elements in the array.

Stable sorting is necessary for multilevel sorting. Suppose a table stores student names in its first column and ages in its second. An <u>unstable sort</u> may destroy the input's existing order:

```shell
# The input is already sorted by name
# (name, age)
  ('A', 19)
  ('B', 18)
  ('C', 21)
  ('D', 19)
  ('E', 23)

# Suppose an unstable algorithm sorts the list by age.
# The relative positions of ('D', 19) and ('A', 19) change,
# so the original ordering by name is lost
  ('B', 18)
  ('D', 19)
  ('A', 19)
  ('C', 21)
  ('E', 23)
```

**Adaptiveness**: An <u>adaptive sort</u> uses ordering already present in the input to reduce computation and improve efficiency. Its best-case time complexity is usually better than its average complexity.

**Comparison-based or not**: A <u>comparison-based sort</u> uses comparison operators ($<$, $=$, $>$) to determine the relative order of elements and sort the array. Its worst-case time complexity has a lower bound of $\Omega(n \log n)$. A <u>non-comparison sort</u> does not use comparison operators and can achieve $O(n)$ time, but is less broadly applicable.

## The ideal sorting algorithm

**Fast, in-place, stable, adaptive, and broadly applicable**. No sorting algorithm with all these properties has yet been found. We must therefore choose according to the characteristics of the data and the requirements of the problem.

Next, we will study different sorting algorithms and analyze their strengths and weaknesses using these criteria.
