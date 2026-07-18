# Exercises

## Concept Review

### Which Element Leaves a Stack or Queue First?

Prepare an empty stack `S` and an empty queue `Q`. Perform the same sequence of operations on each one:

Step 1: Add `A`.
Step 2: Add `B`.
Step 3: Remove and record one element.
Step 4: Add `C`.
Step 5: Keep removing and recording elements until the container is empty.

Write the order in which elements are removed from `S` and from `Q`. Explain the difference using "last-in-first-out" or "first-in-first-out."

??? success "Answer"

    The removal order for stack `S` is `B, C, A`. After the elements `A, B` are added, the most recently added element, `B`, is popped first. After `C` is added,
    `C, A` are popped in that order. This is "last-in-first-out."

    The removal order for queue `Q` is `A, B, C`. After the elements `A, B` are added, the earliest added element, `A`, is removed first.
    After `C` is added, `B, C` are removed in that order. This is "first-in-first-out."

### What Happens When the Rear Passes the End of the Array?

A queue is implemented with a circular array of length 5, whose indices are `0–4`.
Currently, `front = 3` and `size = 2`; `A, B` are stored at indices 3 and 4, respectively.

<!-- numbered-subquestions -->

1. When `C` is enqueued, at which index should `C` be stored? What is `size` after the enqueue?
2. Next, dequeue once. Which element is removed? What are the new values of `front` and `size`?
3. What is the logical order from the front to the rear now? Does dequeuing require moving the other elements in the array? Why or why not?

??? success "Answer"

    1. The new element's position is
        `(front + size) % 5 = (3 + 2) % 5 = 0`,
        so `C` is stored at index 0. After the enqueue, `size = 3`.

    2. Dequeuing removes the current front element, `A`. The new front index is
        `(3 + 1) % 5 = 4`, so `front = 4` and `size = 2`.

    3. The logical order of valid elements is `B, C`, with `B` at index 4 and `C` at index 0.
        Dequeuing requires only changing `front` and `size`. The circular array uses the remainder operation to wrap the index back to the beginning,
        so there is no need to shift all the other elements forward.

### Operations at Both Ends of a Deque

Here, `push_first` adds an element at the front, `push_last` adds one at the rear,
`pop_first` removes one from the front, and `pop_last` removes one from the rear.

Perform the following operations on an empty deque `deq`:

1. `push_last(A)`
2. `push_last(B)`
3. `push_first(C)`
4. `pop_last()`
5. `push_last(D)`
6. `pop_first()`

<!-- numbered-subquestions -->

1. Which elements are returned by the two pop operations?
2. After all operations are complete, which elements remain from front to rear?
3. Examine the six operations. Can a queue that allows insertion only at the rear and removal only at the front perform all of them? If not, identify the operations it cannot perform. Then state whether a deque can perform them and explain why.

??? success "Answer"

    After the first three steps, the deque from front to rear is `[C, A, B]`.

    <!-- numbered-subquestions -->

    1. `pop_last()` removes `B`. After `D` is added, the deque is `[C, A, D]`,
        and `pop_first()` then removes `C`.

    2. `[A, D]` remains.

    3. A queue that permits insertion only at the rear and removal only at the front cannot perform all the operations.
        Step 3, `push_first(C)`, requires insertion at the front, and Step 4, `pop_last()`, requires removal at the rear. Both are outside the operations supported by such a queue.
        A deque permits insertion and removal at both ends, so it can perform all six operations.

## Programming Exercises

### Check a Bracket Sequence

Given a string `s` containing only the three types of brackets `()`, `[]`, and `{}`, use a stack to determine whether the string is valid.

A valid sequence must satisfy both conditions: every closing bracket matches the type of the most recent unmatched opening bracket,
and no unmatched opening bracket remains after the traversal. Return a Boolean value for the result.

??? tip "Hints"

    1. You can create a mapping from each closing bracket to its matching opening bracket
    2. When you encounter a closing bracket, first check whether the stack is empty, and then check whether the top matches
    3. The stack must also be empty after the traversal

[LeetCode](https://leetcode.com/problems/valid-parentheses/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
