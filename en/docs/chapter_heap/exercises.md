---
comments: true
---

# 8.5 &nbsp; Exercises

## 8.5.1 &nbsp; Check your understanding

### 1. &nbsp; Restoring the heap after inserting 10

The array `[9, 7, 8, 3, 5]` represents a max heap. Insert the number 10.

<!-- numbered-subquestions -->

1. After appending 10 to the array, what is its parent's value?
2. Sift up from the new node. Write the array after each swap.
3. What is the final root element? How many swaps were made?

??? success "Reference answer"

    1. The appended 10 has index 5, so its parent's index is
        $\lfloor(5-1)/2\rfloor=2$, and its parent's value is 8.

    2. Since 10 is greater than 8, the first swap produces `[9, 7, 10, 3, 5, 8]`.
        Since 10 is also greater than its new parent, 9, the second swap produces `[10, 7, 9, 3, 5, 8]`.
        The value 10 has now reached the root, so sifting stops.

    3. The final root is 10, and there were two swaps.

### 2. &nbsp; Checking parent-child relationships in a min heap

The array `[1, 4, 3, 7, 6, 2]` represents a complete binary tree. A min heap requires each parent to be no greater than its children.
For index $i$, the left and right child indices are $2i+1$ and $2i+2$, respectively.

<!-- numbered-subquestions -->

1. What are the indices and values of the children of index 2?
2. The node at index 2 has value 3. Does its relationship with its children violate the min-heap property? If so, which two elements should be swapped?
3. Based on your answer to question 2, write the array after the swap if one is needed, or explain why no swap is necessary. Finally, check the other parent-child relationships.

??? success "Reference answer"

    1. The left child of index 2 is at index 5 and has value 2. Its right child would be at index 6, but the array has length 6, so that child does not exist.

    2. The parent value 3 exceeds the child value 2, violating the min-heap property. Swap the elements at indices 2 and 5.

    3. The resulting array is `[1, 4, 2, 7, 6, 3]`. Checking each relationship gives:
        `1 ≤ 4`, `1 ≤ 2`; `4 ≤ 7`, `4 ≤ 6`; `2 ≤ 3`.
        Every parent is no greater than its children, so the min-heap property now holds.

### 3. &nbsp; Keeping the three largest numbers with a min heap

To keep the three largest numbers from the stream `[4, 1, 7, 3, 8]`, maintain a min heap of at most three elements.

Insert the first three numbers in order. Once the heap is full, for each new number:
if it is greater than the root, remove the root and insert the new number; otherwise, leave the heap unchanged.

After reading each number, write the numbers retained in the heap and the root value.
You need only give the retained numbers as a set, not their arrangement in the heap array.

??? success "Reference answer"

    The results after each number are:

    | Number read | Retained numbers | Root |
    | --- | --- | --- |
    | 4 | `{4}` | 4 |
    | 1 | `{1, 4}` | 1 |
    | 7 | `{1, 4, 7}` | 1 |
    | 3 | `{3, 4, 7}` | 3 |
    | 8 | `{4, 7, 8}` | 4 |

    Once the heap is full, its root is the smallest retained number. Replace the root with the new number
    only when the new number is larger. The final set `{4, 7, 8}` contains exactly the three largest numbers.

## 8.5.2 &nbsp; Programming exercises

### 1. &nbsp; Finding the kth largest element in an array

Given an integer array `nums` and an integer $k$, where $1 \le k \le n$ and $n$ is the array length, return the element in position $k$ when the array is ordered from largest to smallest.

Count duplicate elements separately. For example, the second largest element of `[5, 5, 2]` is still 5. Use a min heap of at most $k$ elements.

??? tip "Hints"

    1. The kth largest element is the smallest of the k largest numbers.
    2. Insert each number into the min heap; if its size exceeds k, remove the minimum.
    3. When the traversal ends, the heap retains the k largest numbers, and its root is the answer.

[LeetCode](https://leetcode.com/problems/kth-largest-element-in-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
