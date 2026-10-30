---
comments: true
---

# 4.6 &nbsp; Exercises

## 4.6.1 &nbsp; Check your understanding

### 1. &nbsp; Finding elements in arrays and linked lists

An array and a singly linked list both store `[A, B, C, D, E]` in order. We want to read the fourth element, `D`:

<!-- numbered-subquestions -->

1. Which index can we use to access it directly in the array?
2. Starting at the head node `A`, which nodes must the singly linked list visit by following `next`?
3. As the requested element moves farther toward the end, how does the number of steps change for each structure? Which is better suited to repeated access by position, and why?

??? success "Reference answer"

    1. With zero-based indexing, the fourth element has index 3, so the array can read `arr[3]` directly.

    2. The singly linked list must start at the head and follow the path `A → B → C → D`, advancing along `next` three times.

    3. An array can locate an element directly from its starting address and the index, giving time complexity $O(1)$ for access by position.
        To access the $k$-th node of a singly linked list, we must start at the head and follow `next` $k-1$ times,
        taking $O(n)$ time in the worst case.

        This comparison concerns access by position only; it does not mean that linked lists are slower for every operation.

### 2. &nbsp; Inserting elements into arrays and linked lists

An array and a singly linked list both store `A, B, C, D`. We want to insert `X` after `B`:

- The array has capacity 5 and currently contains `[A, B, C, D, _]`.
- The linked list is `A → B → C → D`, and we already have a reference to node `B`.

<!-- numbered-subquestions -->

1. Which elements must the array move? Write out the array after insertion.
2. In what order should the linked list update `X.next` and `B.next`? Write out the resulting list.
3. Why must a comparison of insertion efficiency specify that we already have a reference to node B?

??? success "Reference answer"

    1. First move `D` one position to the right, then move `C` one position to the right, and finally put `X` at index 2.
        The result is `[A, B, X, C, D]`.

    2. Initially, `B.next` points to `C`. First set `X.next = B.next`, making `X` point to `C`.
        Then set `B.next = X`. The result is `A → B → X → C → D`.
        If we overwrite `B.next` first without saving the original link, we may lose access to `C`.

    3. Once the location of `B` is known, insertion into the linked list requires changing only two links and takes $O(1)$ time.
        If we first need to search for `B` from the head, that search itself may take $O(n)$ time.

### 3. &nbsp; How does a list's capacity grow?

An array-based list currently contains `[A, B, C]`, with length `size = 3` and capacity `capacity = 4`.
When capacity runs out, the new array is allocated with twice the previous capacity.

<!-- numbered-subquestions -->

1. After appending `D`, what are the list's length and capacity? Does it need to grow?
2. When `E` is appended next, what does the capacity become? How many existing elements must be copied?
3. If the length of the underlying array cannot change, why does the list's capacity appear to grow?

??? success "Reference answer"

    1. `D` fits in the last empty position. The contents become `[A, B, C, D]`,
        with `size = 4` and `capacity = 4`. No capacity increase is needed.

    2. Appending `E` finds no empty position, so a new array of capacity 8 is created.
        The four existing elements `A, B, C, D` are copied into it, and then `E` is added.
        The list now has `size = 5` and `capacity = 8`.

    3. The original array itself does not become longer. The list creates a larger array, copies the existing elements,
        and switches to using the new array for storage. From the user's perspective, its capacity has grown.

## 4.6.2 &nbsp; Programming exercises

### 1. &nbsp; Adding one to a large integer stored in an array

The array `digits` stores the digits of a nonnegative integer from left to right. For example, `[3, 0, 8]` represents 308.
Zero is represented by `[0]`; all other inputs have a nonzero first digit.

Simulate the usual digit-by-digit method for decimal addition to add 1 to this integer, and return the result in the same array format.
You may modify `digits` directly. If a carry creates a new leading digit, you may return a longer array.

??? tip "Hints"

    1. Start at the last digit of the array, just as you would when adding by hand.
    2. If the current digit is less than 9, increment it and return immediately.
    3. If the current digit is 9, change it to 0. If all digits are 9, add a leading 1.

[LeetCode](https://leetcode.com/problems/plus-one/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Reversing a singly linked list

You are given the head node `head` of a singly linked list. Each node contains a value and a `next` reference to the following node.

Use iteration to reverse every link between nodes, and return the new head.
Do not create any new linked-list nodes.

??? tip "Hints"

    1. First draw three connected nodes and the two pointers prev and cur on paper.
    2. Before changing cur.next, save the original next node in nxt.
    3. After reversing cur.next, set prev = cur and then cur = nxt to continue with the next node in the original list.

[LeetCode](https://leetcode.com/problems/reverse-linked-list/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
