---
comments: true
---

# 11.12 &nbsp; Exercises

## 11.12.1 &nbsp; Check your understanding

### 1. &nbsp; The first passes of selection sort and bubble sort

Given the array `[4, 2, 5, 1, 3]`, sort in ascending order throughout this exercise.

<!-- numbered-subquestions -->

1. Simulate the first two passes of selection sort. Write the array after each pass and identify the positions whose final values are now fixed.
2. Simulate the first pass of bubble sort. Write the array and the number of swaps, and identify the position whose final value is now fixed.

??? success "Reference answer"

    1. The first two passes are:

        | Pass | Array | Explanation |
        | --- | --- | --- |
        | 1 | `[1, 2, 5, 4, 3]` | Swap the minimum element, 1, with the first element |
        | 2 | `[1, 2, 5, 4, 3]` | The value 2 is already at index 1, so no swap is needed |

        The first two positions are now fixed. Subsequent passes need only continue selecting the minimum from `[5, 4, 3]`.

    2. Compare adjacent elements in order: swap 4 and 2, leave 4 and 5 unchanged, swap 5 and 1, then swap 5 and 3.
        The result is `[2, 4, 1, 3, 5]`, with three swaps. The maximum element, 5, has moved to the end, fixing the last position.

### 2. &nbsp; Does the order of equal elements change?

In the array $[2_a, 2_b, 1]$, $2_a$ and $2_b$ have equal values; the subscripts mark their original order.

<!-- numbered-subquestions -->

1. Write the array after the first pass of selection sort. Has the relative order of $2_a$ and $2_b$ changed?
2. Write the array after the first pass of bubble sort. Has the relative order of $2_a$ and $2_b$ changed?
3. Based on your answers, explain how the two algorithms differ in preserving the original order of equal elements.

??? success "Reference answer"

    1. The first pass of selection sort selects the minimum element, 1, and swaps it with the first element, $2_a$, producing
        $[1, 2_b, 2_a]$. The swap moves $2_a$ after $2_b$, changing their relative order.

    2. Bubble sort first compares $2_a$ with $2_b$ and does not swap them because they are equal. It then compares and swaps $2_b$ and 1.
        After the first pass, the array is $[2_a, 1, 2_b]$. Since $2_a$ still precedes $2_b$, their relative order is unchanged.

    3. In this example, selection sort changes the original order of equal elements. Bubble sort swaps adjacent elements only when the left element
        is greater than the right one. Equal elements are never swapped with each other, so their original order is preserved.

### 3. &nbsp; Comparing counting sort and radix sort

A school needs to sort many student IDs, each exactly eight digits long. Answer the following:

<!-- numbered-subquestions -->

1. How many passes does radix sort need when starting with the least significant digit?
2. If counting sort treats each student ID directly as an integer, why would many counting entries go unused?
3. Based on your answers, which would you choose for sorting many eight-digit student IDs: counting sort or radix sort? Why?

??? success "Reference answer"

    1. Each ID has eight digits, so there are eight passes, from the least to the most significant digit. Each pass groups digits only by values 0 through 9.

    2. Direct counting reserves an entry for every possible eight-digit value, but actual students use only a small fraction of them.
        Most counts would remain 0.

    3. Choose radix sort. It uses the fixed number of digits and the ten possible values per digit, requiring only eight stable grouping passes.
        Counting sort using each entire eight-digit ID as an integer index would reserve entries for many values that never occur.

## 11.12.2 &nbsp; Programming exercises

### 1. &nbsp; Sorting an array with merge sort

Given an integer array `nums`, implement merge sort yourself to arrange its elements in nondecreasing order and return the result. Do not call the language's built-in sorting function.

??? tip "Hints"

    1. An interval of length at most 1 is already sorted.
    2. Split the interval in half at the midpoint and recursively sort each half.
    3. Use two pointers to merge the sorted halves, then write the result back to the original array.

[LeetCode](https://leetcode.com/problems/sort-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Sorting an integer array with counting sort

You are given an integer array `nums` and a nonnegative integer $K$. Every element lies between $0$ and $K$.

Implement counting sort, write the elements back into `nums` in nondecreasing order, and return `nums`.
Do not determine the order by comparing elements with one another, and do not use the language's built-in sorting function.

??? tip "Hints"

    1. Since every element is between 0 and K, its value can directly index the counting array.
    2. First scan nums, incrementing the count at the corresponding position by 1.
    3. Then scan the counting array from 0 through K. If x occurs a given number of times, write that many consecutive copies of x into nums.
