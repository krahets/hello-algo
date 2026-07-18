# Exercises

## Concept Review

### Is Choosing the Largest Coin Always Best?

The coin denominations are `[1, 7, 10]`, and the target amount is 14.

<!-- numbered-subquestions -->

1. Follow the rule "always choose the largest denomination that does not exceed the remaining amount," and write the coins selected.
2. Is there a solution using fewer coins? If so, give one; otherwise, explain why not.
3. Does this example show that the greedy strategy is correct for every set of coin denominations?

??? success "Answer"

    1. The greedy strategy selects `10 + 1 + 1 + 1 + 1`, using 5 coins in total.

    2. There is a solution using fewer coins: `7 + 7`, which uses only 2 coins.

    3. No. This counterexample shows that, for arbitrary coin denominations, repeatedly choosing the largest currently available denomination does not necessarily minimize the number of coins.
        The largest immediate choice may prevent a better combination later.

### Which Item Should Go into the Knapsack First?

A knapsack with a capacity of 4 kilograms can hold the following items. A fraction of an item may be taken,
and the value obtained is proportional to its weight:

- Item A: weight 4 kilograms, value 20.
- Item B: weight 3 kilograms, value 18.

<!-- numbered-subquestions -->

1. What is the value per kilogram of each item? Which item should be placed in the knapsack first?
2. Fill the knapsack using the greedy strategy for the fractional knapsack problem. What is the final value?
3. When items can be divided and the knapsack limits total weight, should items be compared by total value or by value per kilogram? Why?

??? success "Answer"

    1. A has value `20 ÷ 4 = 5` per kilogram, while B has value `18 ÷ 3 = 6` per kilogram,
        so B, with the higher value per unit weight, should be placed in the knapsack first.

    2. First take all of B, using 3 kilograms of capacity and gaining a value of 18. With 1 kilogram of capacity remaining,
        take 1 kilogram of A, gaining a value of 5. The final value is `18 + 5 = 23`.

    3. The knapsack limits total weight, and items can be divided, so they should be compared by value per unit weight.
        Although A has a higher total value, its value per kilogram is lower than B's. Filling the knapsack with A first would yield only a value of 20.

### Which Pointer Should Move Next?

The partition heights are `[1, 8, 6, 2, 5]`. Use two pointers, one at each end, to find the maximum capacity.
The capacity equals "the height of the shorter partition × the distance between the partitions' indices."

<!-- numbered-subquestions -->

1. Initially, the left pointer is at index 0 and the right pointer is at index 4. What is the current capacity? Which pointer should move next?
2. After making the move chosen in Question 1, at which indices are the two pointers? What is the capacity now? Which pointer should move next?
3. For the current pair of partitions, you could move either the pointer at the shorter partition or the pointer at the taller partition. Which move could still produce a greater capacity, and why?

??? success "Answer"

    1. The current capacity is `min(1, 5) × (4 - 0) = 4`. The left partition is shorter, so move the left pointer.

    2. After the left pointer moves, the pointers are at indices 1 and 4. The current capacity is
        `min(8, 5) × (4 - 1) = 15`. The right partition is shorter, so move the right pointer next.

    3. Moving the pointer at the shorter partition is the only move that could still produce a greater capacity. If the taller partition's pointer moves, the distance certainly decreases while the height remains limited by the unmoved shorter partition,
        so the capacity can only stay the same or decrease. Only by moving the shorter partition can a taller partition possibly be found.

## Programming Exercises

### Fractional Knapsack

You are given equal-length arrays `wgt` and `val`, where `wgt[i] > 0` and `val[i] >= 0`. The knapsack has capacity `cap >= 0`.
There is only one of each item, but any fraction of an item may be placed in the knapsack.
The value obtained is proportional to the fraction of the item's total weight that is included. Use a greedy algorithm
and return the maximum total value the knapsack can hold as a real number.

??? tip "Hints"

    1. First calculate each item's value per unit weight as val[i] / wgt[i], keeping the fractional part of the division
    2. Place items with higher value per unit weight into the knapsack first
    3. If the remaining capacity is less than the current item's weight, take exactly the fraction that fills the knapsack and stop
