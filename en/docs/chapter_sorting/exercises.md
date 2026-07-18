# Exercises

## Concept Review

### The First Few Rounds of Selection Sort and Bubble Sort

Given the array `[4, 2, 5, 1, 3]`, sort it in ascending order in both parts below.

<!-- numbered-subquestions -->

1. Simulate the first two rounds of selection sort. Write the array after each round and identify which positions are now fixed.
2. Simulate the first round of bubble sort. Write the resulting array and the number of swaps, and identify which position is now fixed.

??? success "Answer"

    1. The first two rounds are:

        | Round | Array | Explanation |
        | --- | --- | --- |
        | 1 | `[1, 2, 5, 4, 3]` | The smallest element, 1, is swapped with the first element |
        | 2 | `[1, 2, 5, 4, 3]` | The value 2 is already at index 1, so no swap is needed |

        The first two positions are now fixed. Later rounds need to find the smallest element only within `[5, 4, 3]`.

    2. Compare adjacent elements in order: swap 4 and 2; do not swap 4 and 5; swap 5 and 1; then swap 5 and 3.
        The result is `[2, 4, 1, 3, 5]`, after 3 swaps. The largest element, 5, has moved to the end of the array, so the last position is now fixed.

### Can Equal Elements Change Their Relative Order?

In the array $[2_a, 2_b, 1]$, $2_a$ and $2_b$ have equal values, but their subscripts mark their original order.

<!-- numbered-subquestions -->

1. Write the array after the first round of selection sort. Has the relative order of $2_a$ and $2_b$ changed?
2. Write the array after the first round of bubble sort. Has the relative order of $2_a$ and $2_b$ changed?
3. Based on the first two questions, explain how the two sorting algorithms differ in preserving the original order of equal elements.

??? success "Answer"

    1. In its first round, selection sort selects the smallest element, 1, and swaps it with the first element, $2_a$, producing
        $[1, 2_b, 2_a]$. The relative order has changed because $2_a$ has moved behind $2_b$.

    2. Bubble sort first compares $2_a$ and $2_b$. Because they are equal, it does not swap them. It then compares $2_b$ and 1 and swaps them,
        producing $[2_a, 1, 2_b]$ after the first round. $2_a$ is still before $2_b$, so their relative order has not changed.

    3. In this example, selection sort changes the original order of equal elements. Bubble sort swaps adjacent elements only when the left element is greater than the right one.
        Equal elements are not swapped, so their original relative order is preserved.

### Compare Counting Sort and Radix Sort

A school needs to sort many student ID numbers, each exactly 8 digits long. Answer the following questions:

<!-- numbered-subquestions -->

1. How many rounds does radix sort need when it starts with the least significant digit?
2. If the student IDs are treated directly as integers for counting sort, why would the count array need many entries that are never used?
3. Based on the first two questions, which would you choose for sorting many fixed-length 8-digit student IDs: counting sort or radix sort? Why?

??? success "Answer"

    1. A student ID has 8 digits, so 8 rounds are needed from the least significant to the most significant digit. Each round groups values only by 0–9.

    2. Direct counting would require an entry for every possible 8-digit value, but only a small fraction of those values are actually assigned to students.
        Most entries in the count array would remain 0.

    3. Radix sort is the better choice. It uses the facts that the length is fixed and each digit has only 10 possible values, requiring only 8 rounds of stable grouping.
        Counting sort, if it used the entire 8-digit ID as an integer index, would require count-array entries for many values that never occur.

## Programming Exercises

### Sort an Array with Merge Sort

Given an integer array `nums`, implement merge sort yourself, arrange its elements in nondecreasing order, and return the result. Do not call the language's built-in sorting function.

??? tip "Hints"

    1. An interval of length at most 1 is already sorted
    2. Divide the interval in half at its midpoint and recursively sort both halves
    3. Use two pointers to merge the two sorted halves, then write the result back into the original array

[LeetCode](https://leetcode.com/problems/sort-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Sort an Integer Array with Counting Sort

You are given an integer array `nums` and a non-negative integer $K$. Every element of the array is between $0$ and $K$.

Implement counting sort, write the result back into `nums` in nondecreasing order, and return `nums`.
Do not determine the order by comparing elements, and do not call the language's built-in sorting function.

??? tip "Hints"

    1. Because every element is between 0 and K, use each element's value directly as an index in the counting array
    2. Scan nums once and increment the count at the corresponding position
    3. Then scan the counting array from 0 to K; if the value x occurs a certain number of times, write x into nums that many consecutive times
