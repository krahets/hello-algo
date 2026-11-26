---
comments: true
---

# 13.6 &nbsp; Exercises

## 13.6.1 &nbsp; Check your understanding

### 1. &nbsp; Will this permutation algorithm miss any results?

A backtracking algorithm tries the numbers `1, 2, 3` in that order to generate all permutations. Each time it chooses a number `x`, it takes these steps:

1. Append `x` to the current path.
2. Mark `x` as used.
3. Recursively fill the next position.

When the recursive call returns, a student removes `x` from the end of the path and goes straight on to try the next number.

<!-- numbered-subquestions -->

1. Which permutation does the algorithm produce first? Can it still produce all six?
2. Before returning to the previous level, is it enough to remove the last number from the path? If not, what else must you do, and why?

??? success "Sample answer"

    1. The first permutation is `[1, 2, 3]`, but the algorithm misses the rest. Although the path gets shorter as the calls return,
        the numbers 1, 2, and 3 are all still marked as used, leaving no choices for later branches.

    2. No. After removing `x` from the end of the path, you must also mark `x` as unused.
        The path and the usage flags together describe the search state. A choice changes both, so backtracking must restore both
        to let other branches choose `x` again.

### 2. &nbsp; Does the order of the choices matter?

Given the sorted array `[2, 3, 5]` and a target of 5, you may choose each number more than once.
The algorithm requires the numbers on each search path to appear in nondecreasing order.

<!-- numbered-subquestions -->

1. Which distinct combinations can you obtain?
2. Why is there no need to search for the same combination in different orders? What does the ordering constraint accomplish?
3. Suppose the current path is `[3]`, you still need 2, and the next candidate is 3. Why can you stop checking candidates at this level?

??? success "Sample answer"

    1. The distinct combinations are `[2, 3]` and `[5]`.

    2. The problem treats `[2, 3]` and `[3, 2]` as the same combination. The order of selection does not count.
        Keeping the path in nondecreasing order lets the search skip duplicates such as `[3, 2]`.

    3. You still need 2, and the candidate 3 already exceeds 2. Because the array is sorted,
        every candidate after 3 is even larger. None can join the current combination, so you can stop checking at this level.

### 3. &nbsp; Where can the next queen go?

Place queens one row at a time on a `4 × 4` board, with row and column indices starting at 0.
Queens already occupy `(0, 1)` and `(1, 3)`. The next queen goes in row 2.

<!-- numbered-subquestions -->

1. Which columns already contain a queen and can be ruled out?
2. Of the remaining squares, which can you rule out because they share a diagonal with a queen?
3. Which squares in row 2 can you still try?

??? success "Sample answer"

    1. Columns 1 and 3 already contain queens, ruling out `(2, 1)` and `(2, 3)`.

    2. Among the remaining squares, `(2, 2)` shares a diagonal with `(1, 3)`, so you can rule it out as well.
        Square `(2, 0)` shares neither a column nor a diagonal with either queen.

    3. The only square you can try in row 2 is `(2, 0)`.

        This placement is valid so far. If you cannot complete the board later, you must still backtrack and try a different earlier choice.

## 13.6.2 &nbsp; Programming exercises

### 1. &nbsp; Permutations of distinct elements

The integer array `nums` contains at least one element, and all its elements are distinct.
Return every possible ordering as an array, using each element exactly once in each ordering.
The permutations may appear in any order in the result.
Use backtracking and a Boolean array to track whether the element at each index is already in the current permutation.

??? tip "Hints"

    1. The recursion depth tells you which position to fill
    2. At each level, try only unused elements
    3. When the path is as long as `nums`, add a copy to the result

[LeetCode](https://leetcode.com/problems/permutations/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
