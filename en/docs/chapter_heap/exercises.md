# Exercises

## Concept Review

### How Does the Heap Change After Inserting 10?

The array `[9, 7, 8, 3, 5]` represents a max heap. Now insert the number 10.

<!-- numbered-subquestions -->

1. First append 10 to the end of the array. What is the value of its parent node?
2. Starting from the new node, perform bottom-to-top heapify and write the array after each swap.
3. What is the final top element of the heap? How many swaps occur in total?

??? success "Answer"

    1. After 10 is appended, its index is 5, so its parent's index is
        $\lfloor(5-1)/2\rfloor=2$. The parent node's value is 8.

    2. Since 10 is greater than 8, the array after the first swap is `[9, 7, 10, 3, 5, 8]`.
        Since 10 is also greater than its parent 9, the array after the second swap is `[10, 7, 9, 3, 5, 8]`.
        The value 10 has now reached the root node, so heapification is complete.

    3. The final top element is 10, and 2 swaps occur in total.

### Check Parent–Child Relationships in a Min Heap

The array `[1, 4, 3, 7, 6, 2]` represents a complete binary tree. In a min heap, every parent node must be no greater than its children.
For index $i$, the left and right child indices are $2i+1$ and $2i+2$, respectively.

<!-- numbered-subquestions -->

1. What are the indices and values of the children of index 2?
2. The node at index 2 has value 3. Does it violate the min-heap rule with its child? If so, which two elements should be swapped?
3. Based on your answer to Question 2, write the array after the swap if the rule is violated; otherwise, explain why no swap is needed. Finally, check the remaining parent–child relationships.

??? success "Answer"

    1. The left child of index 2 is at index 5 and has value 2. The right child's index is 6, but the array has length 6, so the right child does not exist.

    2. The parent value 3 is greater than the child value 2, violating the min-heap rule. The elements at indices 2 and 5 should be swapped.

    3. After the swap, the array is `[1, 4, 2, 7, 6, 3]`. Check each relationship:
        `1 ≤ 4`, `1 ≤ 2`; `4 ≤ 7`, `4 ≤ 6`; and `2 ≤ 3`.
        Every parent is now no greater than its children, so the min-heap rule is satisfied.

### Keep the Three Largest Numbers with a Min Heap

To keep the 3 largest numbers from the data stream `[4, 1, 7, 3, 8]`, maintain a min heap containing no more than 3 elements.

First insert the first 3 numbers into the min heap in order. Once the heap is full, for each new number:
if it is greater than the top element, remove the top and insert the new number; otherwise, leave the heap unchanged.

After each number is read, write the numbers kept in the heap and the top element.
Write the kept numbers as a set; you do not need to give their order in the heap array.

??? success "Answer"

    The result after each number is read is:

    | Number read | Numbers kept | Top |
    | --- | --- | --- |
    | 4 | `{4}` | 4 |
    | 1 | `{1, 4}` | 1 |
    | 7 | `{1, 4, 7}` | 1 |
    | 3 | `{3, 4, 7}` | 3 |
    | 8 | `{4, 7, 8}` | 4 |

    Once the heap is full, its top is the smallest of the numbers currently kept. A new number replaces the top only when it is greater than the top.
    The final set `{4, 7, 8}` contains exactly the 3 largest numbers.

## Programming Exercises

### Find the Kth Largest Element in an Array

Given an integer array `nums` and an integer $k$, where $1 \le k \le n$ and $n$ is the array's length, return the element that would appear at position $k$ if the array were arranged from largest to smallest.

Count duplicate elements separately. For example, the second-largest element of `[5, 5, 2]` is still 5. Use a min heap containing no more than $k$ elements.

??? tip "Hints"

    1. The kth largest element is the smallest among the k largest numbers
    2. Insert each number into the min heap, and remove the smallest value whenever the heap's size exceeds k
    3. After the traversal, the heap contains the k largest numbers, and its top is the answer

[LeetCode](https://leetcode.com/problems/kth-largest-element-in-an-array/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
