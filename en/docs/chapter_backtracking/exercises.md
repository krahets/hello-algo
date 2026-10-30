---
comments: true
---

# 13.6 &nbsp; Exercises

## 13.6.1 &nbsp; Check your understanding

### 1. &nbsp; Will this permutation algorithm miss results?

A backtracking algorithm tries the numbers `1, 2, 3` in order to generate all permutations. Whenever it chooses a number `x`, it:

1. Appends `x` to the current path.
2. Marks `x` as used.
3. Recursively fills the next position.

After the recursive call returns, the student removes only `x` from the end of the path, then continues trying the next number.

<!-- numbered-subquestions -->

1. Which permutation does the algorithm produce first? Can it still produce all six permutations?
2. Before returning to the previous recursion level, is removing the last number from the path enough? If not, what else is needed? Explain.

??? success "Reference answer"

    1. It first produces `[1, 2, 3]`, but cannot generate every permutation. Although the path becomes shorter as calls return,
        the numbers 1, 2, and 3 remain marked as used, leaving later branches with no available numbers.

    2. No. After removing `x` from the end of the path, we must also mark `x` as unused again.
        The current path and the used markers together describe the search state. Choosing a number changes both, so backtracking must restore both
        to allow other branches to choose `x` again.

### 2. &nbsp; Does the order of choosing numbers matter?

Given the sorted array `[2, 3, 5]` and target value 5, each number may be chosen repeatedly.
The algorithm requires the numbers along each search path to appear in nondecreasing order.

<!-- numbered-subquestions -->

1. Which distinct combinations can be obtained?
2. Why is it unnecessary to search the same set of numbers in different orders? What does the nondecreasing-order restriction achieve?
3. The current path is `[3]`, the remaining sum is 2, and the next candidate is 3. Why can we stop checking all further candidates at this level?

??? success "Reference answer"

    1. The distinct combinations are `[2, 3]` and `[5]`.

    2. This problem treats `[2, 3]` and `[3, 2]` as the same combination: selection order does not distinguish answers.
        Requiring the path's numbers to appear in nondecreasing order lets the search skip duplicate combinations such as `[3, 2]` directly.

    3. The remaining sum is 2, and candidate 3 already exceeds it. Since the array is sorted,
        all candidates after 3 are larger still and cannot join the current combination. We can therefore stop checking this level.

### 3. &nbsp; Where can the next queen be placed?

Place queens row by row on a `4 × 4` board, with both row and column indices starting at 0.
Queens are already at `(0, 1)` and `(1, 3)`. The next queen must be placed in row 2.

<!-- numbered-subquestions -->

1. Which columns are ruled out because they already contain a queen?
2. Among the remaining columns, which positions are ruled out by sharing a diagonal with a queen?
3. Which positions in row 2 remain available to try?

??? success "Reference answer"

    1. Columns 1 and 3 already contain queens, ruling out positions `(2, 1)` and `(2, 3)`.

    2. Of the remaining positions, `(2, 2)` shares a diagonal with `(1, 3)`, so it is also ruled out.
        Position `(2, 0)` shares neither a column nor a diagonal with either existing queen.

    3. The only position to try in row 2 is `(2, 0)`.

        This step establishes only that the current placement is valid. If the board cannot be completed later, we must still backtrack and try other earlier choices.

## 13.6.2 &nbsp; Programming exercises

### 1. &nbsp; All permutations of distinct elements

The integer array `nums` contains at least one element, and all its elements are distinct.
List every possible ordering that uses each element exactly once, returning each ordering as an array.
The permutations may appear in any order in the result.
Use backtracking and a Boolean array to record whether the element at each position is already included in the current permutation.

??? tip "Hints"

    1. The recursion depth indicates which position in the permutation is being filled.
    2. At each level, try only unused elements.
    3. When the path length reaches the length of `nums`, add a copy of the path to the answer.

[LeetCode](https://leetcode.com/problems/permutations/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
