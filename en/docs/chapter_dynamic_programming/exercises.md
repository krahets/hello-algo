---
comments: true
---

# 14.8 &nbsp; Exercises

## 14.8.1 &nbsp; Check your understanding

### 1. &nbsp; When should you use dynamic programming?

A student says, “Whenever you can write a recurrence, you should use dynamic programming.”
For each task below, decide whether to use dynamic programming, backtracking, or a loop or mathematical formula without a `dp` table. Give one key reason for each choice.

<!-- numbered-subquestions -->

1. Find the fewest coins needed to make 6 using denominations `[1, 3, 4]`. You can reuse each denomination.
2. List all permutations of `[1, 2, 3]`.
3. Calculate $1 + 2 + \dots + n$.

    For any task where you chose dynamic programming, also explain what `dp[i]` represents.

??? success "Sample answer"

    1. Use dynamic programming. Let `dp[i]` be the fewest coins needed to make amount `i`.
        For each coin of value `c` no greater than `i`, consider `dp[i-c] + 1` as a candidate,
        then take the minimum of these candidates. Different choices lead back to the same amounts, and an optimal solution for a larger amount can be built from optimal solutions for smaller amounts.
        For amount 6, the answer is 2 coins: `3 + 3`.

    2. Use backtracking. The task asks for all 6 permutations, one by one. Backtracking systematically makes a choice, continues the search,
        then undoes the choice and explores another branch. Any method that outputs the permutations has to enumerate them.

    3. Use a loop or the arithmetic series formula. Although we can write `S(i) = S(i-1) + i`, the calculation of `S(i)` depends on just one smaller sum, `S(i-1)`.
        Each partial sum is computed only once. There are no overlapping subproblems, so we do not need a `dp` table. A recurrence alone does not mean dynamic programming is necessary.

### 2. &nbsp; How do you calculate one cell in the knapsack table?

In a 0-1 knapsack problem, the item weights are `wgt = [1, 2, 3]`, their values are `val = [5, 11, 15]`, and the knapsack capacity is 4.
`dp[i][c]` denotes the maximum value achievable using only the first $i$ items with a capacity limit of $c$.
You do not need to fill the knapsack exactly.

Calculate just the state `dp[3][4]`. You know that `dp[2][4] = 16` and `dp[2][1] = 5`.

<!-- numbered-subquestions -->

1. If you skip item 3, what value do you get?
2. If you take item 3, how much capacity remains, and what value do you get?
3. What should `dp[3][4]` be? Which items give that value?

??? success "Sample answer"

    1. If you skip item 3, keep the result for the first two items. The candidate value is `dp[2][4] = 16`.

    2. Item 3 weighs 3. Taking it leaves capacity $4-3=1$, so the candidate value is
        `dp[2][1] + 15 = 5 + 15 = 20`.

    3. Comparing 16 and 20 gives `dp[3][4] = 20`. This corresponds to taking items 1 and 3,
        with total weight $1+3=4$ and total value $5+15=20$.

        Calculating this state illustrates one take-or-skip decision in the 0-1 knapsack problem.

### 3. &nbsp; In what order should you update knapsack capacities?

A 0-1 knapsack problem has just one item, with weight 2 and value 5. The knapsack capacity is 4.
You can take each item at most once. The one-dimensional array starts at `dp = [0, 0, 0, 0, 0]`.

A student processes this item by updating capacities from 2 to 4 in order:

- Updating `dp[2]` gives 5.
- Updating `dp[3]` also gives 5.
- To update `dp[4]`, the student uses the newly computed `dp[2]`, giving `dp[4] = 10`.

<!-- numbered-subquestions -->

1. Is `dp[4] = 10` correct? Why or why not?
2. Given that you can take each item at most once, what should `dp[4]` be?
3. When processing each item, should you update capacities in descending or ascending order? What problem does that prevent?

??? success "Sample answer"

    1. The result is incorrect. A value of 10 means taking the item worth 5 twice,
        which violates the rule that each item can be taken at most once.

    2. The knapsack can hold at most the one available item, so the correct value of `dp[4]` is 5.

    3. Update capacities in descending order: 4, then 3, then 2.
        That way, when calculating `dp[c]`, you read the value of `dp[c-2]` from before you processed the current item,
        so you cannot reuse that item in the same round.

## 14.8.2 &nbsp; Programming exercises

### 1. &nbsp; Counting ways to climb stairs

A staircase has `n` stairs. Each move takes you up either 1 or 2 stairs, and you must land exactly on stair `n`.
How many different ways can you climb the staircase? Assume `n >= 1`. Two ways differ only in their sequence of one- and two-stair moves.
Use a one-dimensional dynamic programming array. For this exercise, keep the full array before trying the space optimization that retains just two states.

??? tip "Hints"

    1. The last move to stair i must cover either 1 or 2 stairs
    2. This gives dp[i] = dp[i-1] + dp[i-2]
    3. Handle n = 1 and n = 2 first, then fill the table starting at stair 3

[LeetCode](https://leetcode.com/problems/climbing-stairs/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; 0-1 knapsack

Given arrays `wgt` and `val` of equal length, item `i` has positive integer weight `wgt[i]` and nonnegative integer value `val[i]`.
The knapsack capacity `cap` is a nonnegative integer. You can take each item at most once. With the total weight limited to `cap`,
find the maximum total value you can pack. Use one-dimensional dynamic programming.

??? tip "Hints"

    1. Initialize an array dp of length cap + 1, where dp[c] is the maximum value for a capacity limit of c
    2. When processing item i, compare dp[c] for skipping it with dp[c-wgt[i]] + val[i] for taking it
    3. Update capacities from largest to smallest to avoid taking the current item repeatedly in the same round
