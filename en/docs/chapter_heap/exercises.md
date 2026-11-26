---
comments: true
---

# 8.5 &nbsp; Exercises

## 8.5.1 &nbsp; Check your understanding

### 1. &nbsp; How does the heap change after you push 10?

The array `[9, 7, 8, 3, 5]` represents a max-heap. Push 10 onto the heap.

<!-- numbered-subquestions -->

1. First append 10 to the array. What is the value of its parent?
2. Starting at the new node, sift up. Write the array after each swap.
3. Which element ends up at the root? How many swaps did you make?

??? success "Sample answer"

    1. After insertion, 10 is at index 5. Its parent is at index
        $\lfloor(5-1)/2\rfloor=2$ and has value 8.

    2. Since 10 is greater than 8, the first swap gives `[9, 7, 10, 3, 5, 8]`.
        Since 10 is also greater than its new parent, 9, the second swap gives `[10, 7, 9, 3, 5, 8]`.
        The value 10 has reached the root, so sifting ends.

    3. The root now holds 10, after a total of two swaps.

### 2. &nbsp; Check parent-child relationships in a min-heap

The array `[1, 4, 3, 7, 6, 2]` represents a complete binary tree. In a min-heap, each parent must be less than or equal to each of its children.
For index $i$, the left and right child indices are $2i+1$ and $2i+2$, respectively.

<!-- numbered-subquestions -->

1. What are the indices and values of the children of the node at index 2?
2. The node at index 2 has value 3. Does it violate the min-heap property with either child? If so, which two elements should you swap?
3. Using your answer to part 2, write the array after the swap if there is a violation, or explain why no swap is needed. Finally, check the remaining parent-child relationships.

??? success "Sample answer"

    1. The left child of the node at index 2 is at index 5 and has value 2. The right child would be at index 6, but the array has length 6, so there is no right child.

    2. The parent value 3 exceeds the child value 2, violating the min-heap property. Swap the elements at indices 2 and 5.

    3. The swap gives `[1, 4, 2, 7, 6, 3]`. Checking each relationship gives
        `1 ≤ 4` and `1 ≤ 2`, `4 ≤ 7` and `4 ≤ 6`, and `2 ≤ 3`.
        Every parent is now less than or equal to each of its children, so the min-heap property holds.

### 3. &nbsp; Keep the three largest numbers using a min-heap

To retain the three largest numbers in the stream `[4, 1, 7, 3, 8]`, maintain a min-heap of size at most three.

Push the first three numbers onto the min-heap in order. Once the heap is full, compare each new number with the root.
If the number exceeds the root, pop the root and push the new number. Otherwise, leave the heap unchanged.

After reading each number, list the numbers in the heap and identify the root.
Write the retained numbers as a set. You do not need to show their order in the heap array.

??? success "Sample answer"

    The results after reading each number are shown below.

    | Number read | Numbers retained | Heap root |
    | --- | --- | --- |
    | 4 | `{4}` | 4 |
    | 1 | `{1, 4}` | 1 |
    | 7 | `{1, 4, 7}` | 1 |
    | 3 | `{3, 4, 7}` | 3 |
    | 8 | `{4, 7, 8}` | 4 |

    Once the heap is full, the root holds the smallest number retained. Only when a new number exceeds the root
    do we replace the root with it. The final set, `{4, 7, 8}`, contains the three largest numbers.

## 8.5.2 &nbsp; Programming exercises

### 1. &nbsp; Find the kth largest element in an array

Given an integer array `nums` and an integer $k$, where $1 \le k \le n$ and $n$ is the array length, return the element in position $k$ when the array is ordered from largest to smallest.

Count repeated elements separately. For example, the second largest element of `[5, 5, 2]` is still 5. Use a min-heap of size at most $k$.

??? tip "Hints"

    1. The kth largest element is the smallest of the k largest elements.
    2. Push each number onto the min-heap. If the size exceeds k, pop the minimum.
    3. After the traversal, the heap contains the k largest numbers. The root holds the answer.

[LeetCode](https://leetcode.com/problems/kth-largest-element-in-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
