---
comments: true
---

# 4.6 &nbsp; Exercises

## 4.6.1 &nbsp; Check your understanding

### 1. &nbsp; How do arrays and linked lists locate elements?

An array and a singly linked list each store `[A, B, C, D, E]` in that order. You want to read the fourth element, `D`.

<!-- numbered-subquestions -->

1. Which index can you use to read the element directly from the array?
2. Starting at the head node `A`, which nodes do you visit in order as you follow `next` in the singly linked list?
3. How does the number of steps change in each structure as the desired position moves farther from the start? Which structure is better suited to repeated reads by position, and why?

??? success "Sample answer"

    1. With indexing from 0, the fourth element has index 3, so you can read `arr[3]` directly.

    2. In the singly linked list, you must start at the head. The path is `A → B → C → D`, which requires following `next` three times.

    3. An array can locate an element directly from the base address and index, so access by position takes $O(1)$ time.
        To reach the $k$-th node in a singly linked list, start at the head and follow `next` a total of $k-1$ times.
        In the worst case this takes $O(n)$ time.

        This comparison applies only to reading by position. A linked list need not be slower for every operation.

### 2. &nbsp; How do arrays and linked lists insert elements?

An array and a singly linked list each contain `A, B, C, D`. You want to insert `X` after `B`.

- The array has capacity 5 and currently contains `[A, B, C, D, _]`.
- The linked list is `A → B → C → D`, and you already have a reference to node `B`.

<!-- numbered-subquestions -->

1. Which array elements must move? Write out the array after insertion.
2. In what order should you update `X.next` and `B.next`? Write out the linked list after insertion.
3. Why does it matter for the efficiency comparison that you already have a reference to node B?

??? success "Sample answer"

    1. First move `D` one place to the right, then move `C` one place to the right, and finally put `X` at index 2.
        The resulting array is `[A, B, X, C, D]`.

    2. Initially, `B.next` points to `C`. First set `X.next = B.next` so that `X` points to `C`.
        Then set `B.next = X`. The result is `A → B → X → C → D`.
        If you overwrite `B.next` first without saving the original link, you may lose track of `C`.

    3. Once you have located `B`, insertion in the linked list changes just two links and takes $O(1)$ time.
        If you have to find `B` by searching from the head, the search itself can take $O(n)$ time.

### 3. &nbsp; How does list capacity grow?

An array-backed list contains `[A, B, C]`, with `size = 3` and `capacity = 4`.
When there is no room for another element, the new array has twice the capacity of the old one.

<!-- numbered-subquestions -->

1. After you append `D`, what are the length and capacity of the list? Does the capacity need to grow?
2. When you then append `E`, what is the new capacity? How many existing elements must you copy?
3. The underlying array has a fixed length. Why, then, does the capacity of the list appear to grow?

??? success "Sample answer"

    1. `D` fits in the last available slot. The list now contains `[A, B, C, D]`,
        with `size = 4` and `capacity = 4`. No increase in capacity is needed.

    2. When you append `E` next, there are no slots left. Create a new array with capacity 8,
        copy all four existing elements (`A, B, C, D`) into it, and then append `E`.
        The list now has `size = 5` and `capacity = 8`.

    3. The original array keeps its length. The list creates a larger array, copies the existing elements into it,
        and uses it as the new underlying storage. From the user's perspective, the capacity has grown.

## 4.6.2 &nbsp; Programming exercises

### 1. &nbsp; Add one to a large integer represented by an array

The array `digits` stores the digits of a nonnegative integer from left to right. For example, `[3, 0, 8]` represents 308.
Zero is represented by `[0]`. Every other input starts with a nonzero digit.

Add 1 to the integer as you would by hand in base ten. Return the result in the same array format.
You may modify `digits` directly. If there is a carry past the first digit, you may return a longer array.

??? tip "Hints"

    1. Start at the last digit, just as you would when adding by hand.
    2. If the current digit is less than 9, increment it and return immediately.
    3. If the current digit is 9, change it to 0. If every digit is 9, insert a 1 at the front.

[LeetCode](https://leetcode.com/problems/plus-one/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Reverse a singly linked list

You are given the head node `head` of a singly linked list. Each node has a value and a `next` reference to the next node.

Use iteration to reverse all the links between nodes and return the new head.
Do not create any new list nodes.

??? tip "Hints"

    1. On paper, draw three linked nodes and two pointers, prev and cur.
    2. Before overwriting cur.next, save the original next node in nxt.
    3. After reversing cur.next, set prev = cur and then cur = nxt to continue with the next node in the original list.

[LeetCode](https://leetcode.com/problems/reverse-linked-list/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
