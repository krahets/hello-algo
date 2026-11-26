# Exercises

## Check your understanding

### Which element comes out first in a stack or a queue?

Start with an empty stack `S` and an empty queue `Q`. Perform the same steps on each.

Step 1. Add `A`.
Step 2. Add `B`.
Step 3. Remove one element and record it.
Step 4. Add `C`.
Step 5. Keep removing elements and recording each one until the container is empty.

Write down the removal order for `S` and for `Q`. Explain the difference using “last in, first out” or “first in, first out” as appropriate.

??? success "Sample answer"

    The elements come off stack `S` in the order `B, C, A`. After pushing the elements `A, B` in that order, pop `B` first because it was added last. Then push `C`.
    The next two pops return `C, A` in that order. This is last in, first out.

    The elements leave queue `Q` in the order `A, B, C`. After enqueuing the elements `A, B` in that order, dequeue `A` first because it was added first.
    Then enqueue `C`. The next two dequeues return `B, C` in that order. This is first in, first out.

### What happens when the rear of a queue passes the end of the array?

A queue uses a circular array of length 5 with indices in the range `0–4`.
Currently, `front = 3` and `size = 2`. The queue elements `A, B` are at indices 3 and 4, respectively.

<!-- numbered-subquestions -->

1. When you enqueue `C`, at which index should you store `C`? What is the value of `size` afterward?
2. Next, dequeue one element. Which element comes out, and what are the new values of `front` and `size`?
3. What is the logical order of the elements from front to rear now? Does dequeuing require moving any other elements in the array? Why or why not?

??? success "Sample answer"

    1. The index for the new element is
        `(front + size) % 5 = (3 + 2) % 5 = 0`,
        so `C` goes at index 0. After the enqueue operation, `size = 3`.

    2. Dequeuing removes `A`, the element currently at the front. The new front index is
        `(3 + 1) % 5 = 4`, so `front = 4` and `size = 2`.

    3. The remaining elements are in the logical order `B, C`, with `B` at index 4 and `C` at index 0.
        To dequeue, you only need to advance `front` and update `size`. The modulo operation lets the index wrap back to the beginning of the array,
        so there is no need to shift the other elements forward.

### Operations at both ends of a deque

Here, `push_first` inserts at the front and `push_last` inserts at the rear.
Likewise, `pop_first` removes from the front and `pop_last` removes from the rear.

Starting with an empty deque `deq`, perform the following operations in order.

1. `push_last(A)`
2. `push_last(B)`
3. `push_first(C)`
4. `pop_last()`
5. `push_last(D)`
6. `pop_first()`

<!-- numbered-subquestions -->

1. Which element does each of the two removals return?
2. Which elements remain, from front to rear, after all the operations?
3. Look at the six steps. Can a queue that only inserts at the rear and removes from the front perform all six? If it cannot, identify the operations it cannot perform. Then explain whether a deque can perform all six and why.

??? success "Sample answer"

    After the first three steps, the deque contains `[C, A, B]` from front to rear.

    <!-- numbered-subquestions -->

    1. `pop_last()` removes `B`. Adding `D` leaves the deque in the state `[C, A, D]`.
        Then `pop_first()` removes `C`.

    2. The remaining elements are `[A, D]`.

    3. A queue that only inserts at the rear and removes from the front cannot perform all six operations.
        Step 3, `push_first(C)`, requires insertion at the front. Step 4, `pop_last()`, requires removal from the rear. Both are outside the range of operations this queue supports.
        A deque supports insertion and removal at both ends, so it can perform all six steps.

## Programming exercises

### Check a sequence of brackets

Given a string `s` containing only the three types of brackets `()`, `[]`, and `{}`, use a stack to determine whether the sequence is valid.

For a sequence to be valid, each closing bracket must match the type of the most recent unmatched opening bracket,
and no opening brackets may remain unmatched at the end of the scan. Return a Boolean indicating whether the sequence is valid.

??? tip "Hints"

    1. Consider mapping each closing bracket to its corresponding opening bracket.
    2. When you encounter a closing bracket, first check whether the stack is empty. Then check whether the top element matches.
    3. The stack must also be empty at the end of the scan.

[LeetCode](https://leetcode.com/problems/valid-parentheses/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
