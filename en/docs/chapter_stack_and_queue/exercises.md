# Exercises

## Check your understanding

### Which element comes out first in a stack or queue?

Start with an empty stack `S` and an empty queue `Q`. Perform the same operations on each:

Step 1: Add `A`.
Step 2: Add `B`.
Step 3: Remove and record one element.
Step 4: Add `C`.
Step 5: Keep removing and recording elements until the container is empty.

Write the order in which elements are removed from `S` and from `Q`. Explain the difference using last in, first out or first in, first out.

??? success "Reference answer"

    The removal order for stack `S` is `B, C, A`. After adding `A, B`, we first pop `B`, the most recently added element, and then add `C`.
    We then pop `C, A` in order. This is last in, first out.

    The removal order for queue `Q` is `A, B, C`. After adding `A, B`, we first remove `A`, the earliest element added.
    We then add `C` and remove `B, C` in order. This is first in, first out.

### What happens when the rear passes the end of the array?

A queue uses a circular array of length 5, with indices `0-4`.
Currently, `front = 3` and `size = 2`, with queue elements `A, B` at indices 3 and 4, respectively.

<!-- numbered-subquestions -->

1. When enqueueing `C`, at which index should `C` be placed? What is `size` afterward?
2. If we then dequeue once, which element is removed? What are the new values of `front` and `size`?
3. What is the logical order from front to rear now? Does dequeuing require moving the other array elements? Why?

??? success "Reference answer"

    1. The new element's position is
        `(front + size) % 5 = (3 + 2) % 5 = 0`,
        so `C` goes at index 0. After enqueueing, `size = 3`.

    2. Dequeueing removes the current front element, `A`. The new front index is
        `(3 + 1) % 5 = 4`, so `front = 4` and `size = 2`.

    3. The valid elements are logically ordered as `B, C`, with `B` at index 4 and `C` at index 0.
        Dequeueing only advances `front` and updates `size`. The circular array uses the remainder operation to wrap indices back to the beginning,
        so the other elements do not need to shift forward together.

### Operations at both ends of a deque

Here, `push_first` adds at the front, `push_last` adds at the rear,
`pop_first` removes from the front, and `pop_last` removes from the rear.

Starting with an empty deque `deq`, perform:

1. `push_last(A)`
2. `push_last(B)`
3. `push_first(C)`
4. `pop_last()`
5. `push_last(D)`
6. `pop_first()`

<!-- numbered-subquestions -->

1. Which elements are removed by the two pop operations?
2. Which elements remain, from front to rear, after all the operations?
3. Examine these six steps. Can a queue that allows additions only at the rear and removals only at the front perform them all? If not, identify the unsupported operations. Then explain whether a deque can perform them all, and why.

??? success "Reference answer"

    After the first three steps, the deque contains `[C, A, B]` from front to rear.

    <!-- numbered-subquestions -->

    1. `pop_last()` removes `B`. After adding `D`, the deque is `[C, A, D]`.
        Then `pop_first()` removes `C`.

    2. The remaining elements are `[A, D]`.

    3. A queue that allows additions only at the rear and removals only at the front cannot perform every operation:
        step 3, `push_first(C)`, adds at the front, and step 4, `pop_last()`, removes from the rear. Neither operation is supported by that queue.
        A deque supports additions and removals at both ends, so it can perform all six steps.

## Programming exercises

### Checking a bracket sequence

Given a string `s` containing only the three types of brackets `()`, `[]`, and `{}`, use a stack to determine whether it is valid.

A valid sequence must satisfy both conditions: each closing bracket matches the type of the most recent unmatched opening bracket,
and no unmatched opening brackets remain at the end. Return a Boolean result.

??? tip "Hints"

    1. You can map each closing bracket to its matching opening bracket.
    2. When you encounter a closing bracket, first check whether the stack is empty, then check whether its top matches.
    3. The stack must also be empty when the scan finishes.

[LeetCode](https://leetcode.com/problems/valid-parentheses/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
