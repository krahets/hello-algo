# Exercises

## Concept Review

### When Is Dynamic Programming Appropriate?

A student says, "Whenever a recurrence can be written, dynamic programming should be used."
For each task below, decide whether dynamic programming, backtracking, or a loop or mathematical formula without a `dp` table is more appropriate. Give one key reason.

<!-- numbered-subquestions -->

1. Using coin denominations `[1, 3, 4]`, make an amount of 6 with the fewest coins. Each denomination may be used repeatedly.
2. Output all permutations of `[1, 2, 3]`.
3. Calculate $1 + 2 + \dots + n$.

    For the task you consider suitable for dynamic programming, also state what `dp[i]` represents.

??? success "Answer"

    1. Dynamic programming is suitable. Let `dp[i]` be the minimum number of coins needed to make amount `i`.
        For every coin `c` that does not exceed `i`, `dp[i-c] + 1` is a candidate answer,
        and the minimum of these candidates is chosen. Different choices repeatedly encounter the same amounts, and an optimal solution for a larger amount can be built from optimal solutions for smaller amounts.
        The answer for amount 6 is 2, using `3 + 3`.

    2. Backtracking is suitable. The task requires generating all 6 permutations one by one. Backtracking can systematically make a choice, continue searching,
        undo the choice, and then try another branch. Regardless of the method, actually outputting every permutation requires enumerating them.

    3. A loop or the arithmetic-series formula is sufficient. Although the recurrence `S(i) = S(i-1) + i` can be written, calculating `S(i)` depends on only one smaller value, `S(i-1)`.
        Each partial sum needs to be calculated only once, so there are no repeated subproblems and no need for a `dp` table. "A recurrence can be written" does not mean "dynamic programming is needed."

### Calculating One Cell in a Knapsack Table

Consider this 0-1 knapsack problem: item weights `wgt = [1, 2, 3]`, values `val = [5, 11, 15]`, and knapsack capacity 4.
`dp[i][c]` is the maximum value obtainable using only the first $i$ items with a knapsack capacity limit of $c$;
the knapsack does not have to be filled exactly.

Calculate only the state `dp[3][4]`. You are given `dp[2][4] = 16` and `dp[2][1] = 5`:

<!-- numbered-subquestions -->

1. If the third item is not selected, what is the candidate value?
2. If the third item is selected, how much capacity remains, and what is the candidate value?
3. What should `dp[3][4]` be? Which items does this value correspond to selecting?

??? success "Answer"

    1. If the third item is not selected, keep the result from the first two items. The candidate value is `dp[2][4] = 16`.

    2. The third item has weight 3, so capacity $4-3=1$ remains after it is placed in the knapsack. The candidate value is
        `dp[2][1] + 15 = 5 + 15 = 20`.

    3. Comparing 16 and 20 gives `dp[3][4] = 20`. This corresponds to selecting the first and third items,
        whose total weight is $1+3=4$ and total value is $5+15=20$.

        This state calculation demonstrates one "select or do not select" comparison in the 0-1 knapsack problem.

### In Which Order Should Knapsack Capacities Be Updated?

A 0-1 knapsack problem has only one item, with weight 2 and value 5, and the knapsack has capacity 4.
The item can be selected at most once. The initial one-dimensional array is `dp = [0, 0, 0, 0, 0]`.

A student processes the item by updating capacities from 2 to 4:

- After updating `dp[2]`, its value is 5.
- After updating `dp[3]`, its value is also 5.
- When updating `dp[4]`, the student uses the newly obtained `dp[2]`, producing `dp[4] = 10`.

<!-- numbered-subquestions -->

1. Is `dp[4] = 10` correct? Why or why not?
2. Given that each item may be selected at most once, what should `dp[4]` be?
3. When processing each item, should capacities be updated from largest to smallest or from smallest to largest? What problem does this avoid?

??? success "Answer"

    1. The result is incorrect. A value of 10 is equivalent to placing the item with value 5 into the knapsack twice,
        violating the condition that each item may be selected at most once.

    2. The knapsack can contain at most this one item, so the correct value of `dp[4]` is 5.

    3. Capacities should be updated from largest to smallest, in the order 4, 3, 2.
        Then, when calculating `dp[c]`, the value read from `dp[c-2]` still comes from before the current item was processed,
        preventing the current item from being reused during the same round.

## Programming Exercises

### Number of Ways to Climb Stairs

A staircase has `n` steps. Each move climbs either 1 or 2 steps, and you must land exactly on step `n`.
Calculate the number of distinct ways to reach the top. Assume `n >= 1`; ways are distinguished only by their sequence of 1-step and 2-step moves.
Use a one-dimensional dynamic programming array. For now, do not use the space optimization that keeps only two states.

??? tip "Hints"

    1. The last move to step i can cover only 1 or 2 steps
    2. Therefore, dp[i] = dp[i-1] + dp[i-2]
    3. Handle the cases where n is 1 or 2 first, then fill the table starting from step 3

[LeetCode](https://leetcode.com/problems/climbing-stairs/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 0-1 Knapsack

You are given equal-length arrays `wgt` and `val`. Item `i` has positive integer weight `wgt[i]` and non-negative integer value `val[i]`.
The knapsack capacity `cap` is a non-negative integer. Each item may be selected at most once. Find the maximum total value that can be placed in the knapsack
without exceeding `cap`. Use one-dimensional dynamic programming.

??? tip "Hints"

    1. Initialize an array dp of length cap + 1, where dp[c] is the maximum value for a capacity limit of c
    2. When processing item i, compare dp[c], which does not select it, with dp[c-wgt[i]] + val[i], which does
    3. Update capacities from largest to smallest to avoid selecting the current item repeatedly in the same round
