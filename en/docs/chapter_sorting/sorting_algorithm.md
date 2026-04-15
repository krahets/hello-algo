# Sorting Algorithm

A <u>sorting algorithm</u> arranges a set of data in a specific order. Sorting algorithms have extensive applications because ordered data can usually be searched, analyzed, and processed more efficiently.

As shown in the figure below, the data being sorted can be integers, floating-point numbers, characters, strings, and so on. The sorting rule can be defined as needed, such as numerical order, ASCII order, or a custom rule.

![Data type and criterion examples](sorting_algorithm.assets/sorting_examples.png)

## Evaluation Dimensions

**Execution efficiency**: We expect the time complexity of sorting algorithms to be as low as possible, with a smaller total number of operations (reducing the constant factor in time complexity). For large data volumes, execution efficiency is particularly important.

**In-place property**: As the name implies, <u>in-place sorting</u> achieves sorting by operating directly on the original array without requiring additional auxiliary arrays, thus saving memory. Typically, in-place sorting involves fewer data movement operations and runs faster.

**Stability**: <u>Stable sorting</u> ensures that the relative order of equal elements in the array does not change after sorting is completed.

Stable sorting is a necessary condition for multi-level sorting scenarios. Suppose we have a table storing student information, where column 1 and column 2 are name and age, respectively. In this case, <u>unstable sorting</u> may cause the ordered nature of the input data to be lost:

```shell
# The input data is sorted by name
# (name, age)
  ('A', 19)
  ('B', 18)
  ('C', 21)
  ('D', 19)
  ('E', 23)

# Suppose we use an unstable sorting algorithm to sort the list by age.
# In the result, the relative positions of ('D', 19) and ('A', 19) change,
# so the property that the input data is sorted by name is lost.
  ('B', 18)
  ('D', 19)
  ('A', 19)
  ('C', 21)
  ('E', 23)
```

**Adaptability**: <u>Adaptive sorting</u> can utilize the existing order information in the input data to reduce the amount of computation, achieving better time efficiency. The best-case time complexity of adaptive sorting algorithms is typically better than the average time complexity.

**Comparison-based or non-comparison**: <u>Comparison-based sorting</u> relies on comparison operators ($<$, $=$, $>$) to determine the relative order of elements, thereby sorting the entire array, with a theoretical optimal time complexity of $O(n \log n)$. <u>Non-comparison sorting</u> does not use comparison operators and can achieve a time complexity of $O(n)$, but its versatility is relatively limited.

## Ideal Sorting Algorithm

**Fast, in-place, stable, adaptive, and broadly applicable**. Clearly, no sorting algorithm has been discovered to date that combines all of these characteristics. Therefore, when selecting a sorting algorithm, it is necessary to decide based on the specific characteristics of the data and the requirements of the problem.

Next, we will examine various sorting algorithms and analyze their advantages and disadvantages based on the evaluation dimensions above.
