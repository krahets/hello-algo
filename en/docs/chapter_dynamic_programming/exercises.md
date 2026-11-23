# Exercises

## Check your understanding

### When is dynamic programming a good fit?

A student says, “Whenever you can write a recurrence relation, you should use dynamic programming.”
For each task below, decide whether dynamic programming, backtracking, or a loop or mathematical formula without a `dp` table is the best fit. Give one key reason for each choice.

<!-- numbered-subquestions -->

1. Find the minimum number of coins needed to make an amount of 6 using denominations `[1, 3, 4]`. Each denomination can be used any number of times.
2. Output all permutations of `[1, 2, 3]`.
3. Calculate $1 + 2 + \dots + n$.

    For the task you consider suitable for dynamic programming, also explain what `dp[i]` represents.

??? success "Reference answer"

    1. Dynamic programming is a good fit. Let `dp[i]` be the minimum number of coins needed to make an amount of `i`.
        For each coin `c` whose denomination does not exceed `i`, consider `dp[i-c] + 1` as a candidate answer,
        then take the minimum of these candidates. Different choices repeatedly lead to the same amounts, and an optimal solution for a larger amount can be built from optimal solutions for smaller amounts.
        The answer for an amount of 6 is 2: `3 + 3`.

    2. Use backtracking. The task requires generating all 6 permutations individually. Backtracking systematically makes a choice, continues the search,
        then undoes the choice and explores other branches. Whatever method you use, outputting all the permutations requires enumerating them.

    3. A loop or the formula for an arithmetic series is sufficient. Although you can write `S(i) = S(i-1) + i`, calculating `S(i)` depends on just one smaller value, `S(i-1)`.
        Each partial sum needs to be calculated only once, so there are no overlapping subproblems and no need for a `dp` table. Being able to write a recurrence does not mean you need dynamic programming.

### How do you calculate a cell in the knapsack table?

Consider a 0-1 knapsack problem with item weights `wgt = [1, 2, 3]`, values `val = [5, 11, 15]`, and a knapsack capacity of 4.
Here, `dp[i][c]` is the maximum value obtainable using only the first $i$ items with a capacity limit of $c$.
The knapsack does not have to be filled exactly.

Calculate just the state `dp[3][4]`. You are given `dp[2][4] = 16` and `dp[2][1] = 5`.

<!-- numbered-subquestions -->

1. What is the candidate value if you do not take item 3?
2. If you take item 3, how much capacity remains, and what is the candidate value?
3. What should `dp[3][4]` be? Which items does this solution take?

??? success "Reference answer"

    1. If you do not take item 3, use the result for the first two items. The candidate value is `dp[2][4] = 16`.

    2. Item 3 weighs 3, so taking it leaves a capacity of $4-3=1$. The candidate value is
        `dp[2][1] + 15 = 5 + 15 = 20`.

    3. Comparing 16 and 20 gives `dp[3][4] = 20`. This solution takes items 1 and 3,
        with a total weight of $1+3=4$ and a total value of $5+15=20$.

        Calculating this state illustrates a single “take it or leave it” comparison in the 0-1 knapsack problem.

### In what order should knapsack capacities be updated?

A 0-1 knapsack problem has just one item, with weight 2 and value 5. The knapsack capacity is 4.
Each item can be taken at most once, and the initial one-dimensional array is `dp = [0, 0, 0, 0, 0]`.

A student processes this item by updating capacities from 2 to 4:

- Updating `dp[2]` gives 5.
- Updating `dp[3]` also gives 5.
- When updating `dp[4]`, the student uses the newly computed `dp[2]`, obtaining `dp[4] = 10`.

<!-- numbered-subquestions -->

1. Is `dp[4] = 10` correct? Why or why not?
2. Given that each item can be taken at most once, what should `dp[4]` be?
3. When processing each item, should capacities be updated from largest to smallest or from smallest to largest? What problem does this prevent?

??? success "Reference answer"

    1. The result is incorrect. A value of 10 means taking the item worth 5 twice,
        which violates the condition that each item can be taken at most once.

    2. The knapsack can contain only this one item, so the correct value of `dp[4]` is 5.

    3. Update capacities from largest to smallest: 4, then 3, then 2.
        This ensures that when calculating `dp[c]`, the value read from `dp[c-2]` is still the result from before the current item was processed.
        The current item therefore cannot be used more than once in the same round of updates.

## Programming exercises

### Counting ways to climb stairs

A staircase has `n` steps. You can climb either 1 or 2 steps at a time and must land exactly on step `n`.
Calculate the number of different ways to climb the staircase. Assume `n >= 1`; two ways differ only in their sequence of 1-step and 2-step moves.
Use a one-dimensional dynamic programming array. For now, do not use the space optimization that retains only two states.

??? tip "Hints"

    1. The final move to step i must be either a 1-step or a 2-step move.
    2. This gives dp[i] = dp[i-1] + dp[i-2].
    3. Handle n = 1 and n = 2 first, then fill the table starting at step 3.

[LeetCode](https://leetcode.com/problems/climbing-stairs/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 0-1 knapsack

You are given arrays `wgt` and `val` of equal length. Item `i` has a positive integer weight `wgt[i]` and a nonnegative integer value `val[i]`.
The knapsack capacity `cap` is a nonnegative integer. Each item can be taken at most once. Find the maximum total value
that fits in the knapsack without exceeding `cap` in total weight. Use one-dimensional dynamic programming.

??? tip "Hints"

    1. Initialize an array dp of length cap + 1, where dp[c] is the maximum value obtainable with a capacity limit of c.
    2. When processing item i, compare dp[c] for leaving it out with dp[c-wgt[i]] + val[i] for taking it.
    3. Update capacities from largest to smallest to avoid taking the current item more than once in the same round.
