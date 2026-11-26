---
comments: true
---

# 11.12 &nbsp; Exercises

## 11.12.1 &nbsp; Check your understanding

### 1. &nbsp; The first few passes of selection sort and bubble sort

Use the array `[4, 2, 5, 1, 3]` for the following questions. Sort in ascending order throughout.

<!-- numbered-subquestions -->

1. Simulate the first two passes of selection sort. Write down the array after each pass and identify the positions that now hold their final values.
2. Simulate the first pass of bubble sort. Write down the resulting array and the number of swaps, and identify the position that now holds its final value.

??? success "Sample answer"

    1. The first two passes give the following results:

        | Pass | Array state | Explanation |
        | --- | --- | --- |
        | 1 | `[1, 2, 5, 4, 3]` | Swap the minimum, 1, with the first element |
        | 2 | `[1, 2, 5, 4, 3]` | The value 2 is already at index 1, so no swap is needed |

        The first two positions now hold their final values. Subsequent passes only need to select the minimum from `[5, 4, 3]`.

    2. Compare adjacent elements in order: swap 4 and 2, leave 4 and 5 in place, swap 5 and 1, and swap 5 and 3.
        This gives `[2, 4, 1, 3, 5]` after 3 swaps. The maximum, 5, has reached the end of the array, so the last position holds its final value.

### 2. &nbsp; Can equal elements change order?

In the array $[2_a, 2_b, 1]$, $2_a$ and $2_b$ have the same value. Their subscripts mark their original order.

<!-- numbered-subquestions -->

1. Write down the array after the first pass of selection sort. Has the relative order of $2_a$ and $2_b$ changed?
2. Write down the array after the first pass of bubble sort. Has the relative order of $2_a$ and $2_b$ changed?
3. Use your answers to explain how the two algorithms differ in their treatment of equal elements.

??? success "Sample answer"

    1. The first pass of selection sort finds the minimum, 1, and swaps it with the first element, $2_a$, giving
        $[1, 2_b, 2_a]$. The swap moves $2_a$ after $2_b$, reversing their relative order.

    2. Bubble sort first compares $2_a$ and $2_b$ and leaves them in place because they are equal. It then compares $2_b$ with 1 and swaps them.
        The first pass ends with $[2_a, 1, 2_b]$. The element $2_a$ still precedes $2_b$, so their relative order is unchanged.

    3. In this example, selection sort changes the original order of equal elements. Only when the left element is greater than the right
        does bubble sort swap the two neighbors. Equal elements never swap with each other, so they retain their original order.

### 3. &nbsp; Compare counting sort and radix sort

A school needs to sort a large collection of student IDs, each exactly 8 digits long. Answer the following questions.

<!-- numbered-subquestions -->

1. How many passes does radix sort need if it starts with the least significant digit?
2. If you use counting sort with each ID treated as a single integer, why will many entries in the count array go unused?
3. Based on your answers, would you choose counting sort or radix sort for a large collection of 8-digit student IDs? Why?

??? success "Sample answer"

    1. Each ID has 8 digits, so sorting from the least significant digit to the most significant takes 8 passes. Each pass groups the IDs by a digit from 0 to 9.

    2. Counting the IDs directly requires an entry for every possible 8-digit value, but the students use only a small fraction of those values.
        Most counts will stay at 0.

    3. Choose radix sort. Each ID has a fixed number of digits, and each digit has just 10 possible values, so 8 rounds of stable grouping suffice.
        Using each entire 8-digit ID as an integer index for counting sort would reserve count entries for many values that never occur.

## 11.12.2 &nbsp; Programming exercises

### 1. &nbsp; Sort an array using merge sort

Given an integer array `nums`, implement merge sort to arrange its elements in nondecreasing order and return the sorted array. Do not use a built-in sorting function.

??? tip "Hints"

    1. A range of length 0 or 1 is already sorted
    2. Split the range at the midpoint and recursively sort each half
    3. Merge the two sorted halves with two pointers, then write the result back to the original array

[LeetCode](https://leetcode.com/problems/sort-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Sort an integer array using counting sort

You are given an integer array `nums` and a nonnegative integer $K$. Every array element is between $0$ and $K$, inclusive.

Implement counting sort, write the result back to `nums` in nondecreasing order, and return `nums`.
Do not compare elements to determine their order or use a built-in sorting function.

??? tip "Hints"

    1. Each element is between 0 and K, so you can use its value as an index into the count array
    2. Scan nums once, adding 1 to the count at the corresponding index for each element
    3. Then scan the count array from 0 to K. For each value x, write as many consecutive copies of x to nums as its count indicates
