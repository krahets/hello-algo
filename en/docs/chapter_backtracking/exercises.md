# Exercises

## Concept Review

### Will This Permutation Algorithm Miss Results?

A backtracking algorithm tries to generate all permutations using `1, 2, 3` in that order. Each time it chooses a number `x`, it:

1. Appends `x` to the current path.
2. Marks `x` as "used."
3. Recursively fills the next position.

When the recursive call returns, the student removes only `x` from the end of the path and then tries the next number.

<!-- numbered-subquestions -->

1. Which permutation does the algorithm generate first? Can it still generate all 6 permutations?
2. Before returning to the previous level, is removing only the last number from the path enough? If not, what else must be done? Explain why.

??? success "Answer"

    1. It first generates `[1, 2, 3]`, but it cannot generate all the permutations. Although the path becomes shorter when calls return,
        the markers for 1, 2, and 3 all remain "used," leaving no available number for later branches.

    2. It is not enough. After removing `x` from the end of the path, the algorithm must also mark `x` as "unused" again.
        The current path and the used markers together describe the search state. A choice changes both of them, so backtracking must restore both
        before another branch can choose `x` again.

### Does the Order of Choosing Numbers Matter?

You are given the sorted array `[2, 3, 5]` and target value 5. Each number may be chosen repeatedly.
The algorithm requires the numbers along each search path to appear only in nondecreasing order.

<!-- numbered-subquestions -->

1. Which distinct combinations can be found?
2. Why is there no need to search for the same group of numbers in different orders? What does the nondecreasing-order restriction accomplish?
3. Suppose the current path is `[3]`, the remaining amount is 2, and the next candidate is 3. Why can the algorithm stop checking all later candidates at this level?

??? success "Answer"

    1. The distinct combinations are `[2, 3]` and `[5]`.

    2. This exercise treats `[2, 3]` and `[3, 2]` as the same combination; the order in which numbers are selected does not create a different answer.
        Requiring numbers in a path to appear in nondecreasing order lets the search skip duplicate arrangements such as `[3, 2]`.

    3. The remaining amount is 2, while candidate 3 is already greater than 2. Because the array is sorted,
        all later candidates are even larger and cannot be added to the current combination, so the algorithm can stop checking this level immediately.

### Where Can the Next Queen Be Placed?

Place queens row by row on a `4 × 4` chessboard, with both row and column indices starting at 0.
Queens have already been placed at `(0, 1)` and `(1, 3)`. The next queen must be placed in row 2.

<!-- numbered-subquestions -->

1. Which columns are ruled out because they already contain a queen?
2. Among the remaining columns, which positions are ruled out because they share a diagonal with an existing queen?
3. Which positions in row 2 remain available to try?

??? success "Answer"

    1. Columns 1 and 3 already contain queens, so positions `(2, 1)` and `(2, 3)` are ruled out.

    2. Among the remaining positions, `(2, 2)` lies on the same diagonal as `(1, 3)`, so it is also ruled out.
        Position `(2, 0)` shares neither a column nor a diagonal with either existing queen.

    3. The only position to try in row 2 is `(2, 0)`.

        This step shows only that the current placement is valid. If the board cannot be completed later, the algorithm must still backtrack and try an earlier alternative.

## Programming Exercises

### Permutations of Distinct Elements

The integer array `nums` contains at least one element, and all its elements are distinct.
List every possible order formed by using each element exactly once, and return each order as an array.
The permutations may appear in any order in the result.
Use backtracking, with a Boolean array recording whether the element at each position has already been selected for the current permutation.

??? tip "Hints"

    1. The recursion depth indicates which position of the permutation is currently being filled
    2. At each level, try only elements that have not yet been used
    3. When the path's length equals the length of `nums`, add a copy of the path to the answer

[LeetCode](https://leetcode.com/problems/permutations/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
