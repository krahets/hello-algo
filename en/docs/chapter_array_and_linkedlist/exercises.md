# Exercises

## Concept Review

### How Arrays and Linked Lists Find an Element

An array and a singly linked list both store `[A, B, C, D, E]` in order. You now need to access the fourth element, `D`:

<!-- numbered-subquestions -->

1. Which index can the array use directly?
2. Starting from the head node `A`, which nodes are visited in order as you follow `next`?
3. As the requested element moves farther toward the end, how does the number of steps change for each structure? Which structure is better for repeated access by position, and why?

??? success "Answer"

    1. With zero-based indexing, the fourth element has index 3, so the array can access `arr[3]` directly.

    2. The singly linked list must start at the head. Its access path is `A → B → C → D`, requiring three moves through `next`.

    3. An array can locate an element directly from its starting address and index, so access by position has a time complexity of $O(1)$.
        To access the $k$th node, a singly linked list must start at the head node and follow `next` $k-1$ times,
        which takes $O(n)$ time in the worst case.

        This comparison concerns only access by position; it does not mean that linked lists are slower for every operation.

### How Arrays and Linked Lists Insert an Element

An array and a singly linked list both store `A, B, C, D`. You now need to insert `X` after `B`:

- The array has capacity 5 and is currently `[A, B, C, D, _]`.
- The linked list is `A → B → C → D`, and you already have a reference to node `B`.

<!-- numbered-subquestions -->

1. Which elements must the array move? Write the array after insertion.
2. In what order should the linked list update `X.next` and `B.next`? Write the linked list after insertion.
3. When comparing insertion efficiency, why is it important to state that "you already have a reference to node B"?

??? success "Answer"

    1. The array first moves `D` one position to the right, then moves `C` one position to the right, and finally places `X` at index 2,
        producing `[A, B, X, C, D]`.

    2. `B.next` originally points to `C`. First set `X.next = B.next`, making `X` point to `C`;
        then set `B.next = X`. The result is `A → B → X → C → D`.
        If `B.next` is overwritten first without saving the original link, `C` may become unreachable.

    3. Once the location of `B` is known, insertion into the linked list only changes two links and takes $O(1)$ time.
        If `B` must first be found from the head, that search alone may take $O(n)$ time.

### How a List's Capacity Grows

An array-based list currently contains `[A, B, C]`, with length `size = 3` and capacity `capacity = 4`.
When there is not enough capacity, a new array with twice the old capacity is created.

<!-- numbered-subquestions -->

1. After appending `D`, what are the list's length and capacity? Is capacity expansion needed?
2. When `E` is appended next, what does the capacity become? How many existing elements must be copied?
3. The length of the underlying array cannot change. Why does the list's capacity nevertheless appear able to grow?

??? success "Answer"

    1. `D` fits in the last empty position. The contents are now `[A, B, C, D]`,
        with `size = 4` and `capacity = 4`, so no capacity expansion is needed.

    2. There is no empty position when `E` is appended, so a new array with capacity 8 must be created.
        The four existing elements `A, B, C, D` are copied into it before `E` is added.
        The result is `size = 5` and `capacity = 8`.

    3. The original array itself does not grow. The list creates a larger new array, copies the existing elements,
        and then uses the new array as its underlying storage. From the user's perspective, the capacity has grown.

## Programming Exercises

### Add One to a Large Integer Stored as an Array

The array `digits` stores the decimal digits of a non-negative integer from left to right. For example, `[3, 0, 8]` represents 308.
The number 0 is represented by `[0]`; for every other input, the first digit is not 0.

Simulate decimal column addition to add 1 to this integer, and return the result in the same array format.
You may modify `digits` directly. If a new carry appears at the front, you may return a longer array.

??? tip "Hints"

    1. Start with the last digit of the array, just as in ordinary column addition
    2. If the current digit is less than 9, add one and return immediately
    3. If the current digit is 9, change it to 0; if every digit is 9, place a 1 at the front

[LeetCode](https://leetcode.com/problems/plus-one/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Reverse a Singly Linked List

You are given the head node `head` of a singly linked list. Each node contains a value and a `next` reference to the following node.

Use an iterative approach to reverse all links between the nodes, and return the new head node.
Do not create any new linked list nodes.

??? tip "Hints"

    1. First draw three connected nodes and the two pointers prev and cur on paper
    2. Before changing cur.next, save the original next node in nxt
    3. After reversing cur.next, set prev = cur and then cur = nxt to continue with the next node in the original list

[LeetCode](https://leetcode.com/problems/reverse-linked-list/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
