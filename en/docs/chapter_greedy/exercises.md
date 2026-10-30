---
comments: true
---

# 15.6 &nbsp; Exercises

## 15.6.1 &nbsp; Check your understanding

### 1. &nbsp; Is choosing the largest coin always best?

The coin denominations are `[1, 7, 10]`, and the target amount is 14.

<!-- numbered-subquestions -->

1. Follow the rule “always take the largest denomination that does not exceed the remaining amount,” and list the coins chosen.
2. Is there a way to use fewer coins? If so, give one; if not, explain why.
3. Can you conclude that this greedy strategy is correct for any set of coin denominations?

??? success "Reference answer"

    1. The greedy strategy chooses `10 + 1 + 1 + 1 + 1`, using 5 coins in total.

    2. There is a solution with fewer coins: `7 + 7`, which uses only 2.

    3. No. This counterexample shows that choosing the largest available denomination at each step does not always minimize the number of coins for arbitrary denominations.
        The largest immediate choice can rule out a better combination later.

### 2. &nbsp; Which item should go into the knapsack first?

A knapsack with a capacity of 4 kg can hold the following items. You may take part of an item,
and the value obtained is proportional to the weight taken.

- Item A weighs 4 kg and has a value of 20.
- Item B weighs 3 kg and has a value of 18.

<!-- numbered-subquestions -->

1. What is each item's value per kilogram? Which item should you take first?
2. If you fill the knapsack using the greedy strategy for fractional knapsack, what is the final value?
3. When items can be divided and the knapsack limits total weight, should you compare total value or value per kilogram? Why?

??? success "Reference answer"

    1. A's value per kilogram is `20 ÷ 4 = 5`, and B's is `18 ÷ 3 = 6`.
        Take B first because it has the higher value per unit of weight.

    2. Take all of B first, using 3 kg of capacity and gaining a value of 18. With 1 kg of capacity left,
        take 1 kg of A for a value of 5. The final value is `18 + 5 = 23`.

    3. The knapsack limits total weight, and items can be divided, so compare value per unit of weight.
        Although A has a higher total value, its value per kilogram is lower than B's. Taking all of A first would give a value of only 20.

### 3. &nbsp; Which pointer should move next?

The wall heights are `[1, 8, 6, 2, 5]`. Use two pointers, initially at opposite ends, to find the maximum container capacity.
Capacity equals the height of the shorter of the two walls multiplied by the difference between their indices.

<!-- numbered-subquestions -->

1. Initially, the left pointer is at index 0 and the right pointer is at index 4. What is the current capacity? Which pointer should move next?
2. After making the move you chose in question 1, what are the two pointer indices? What is the capacity now, and which pointer should move next?
3. For the current pair of walls, you could move the pointer at the shorter wall or the pointer at the taller wall. Which move still has a chance of producing a larger capacity? Why?

??? success "Reference answer"

    1. The current capacity is `min(1, 5) × (4 - 0) = 4`. The left wall is shorter, so move the left pointer.

    2. After moving the left pointer, the pointers are at indices 1 and 4. The current capacity is
        `min(8, 5) × (4 - 1) = 15`. The right wall is shorter, so move the right pointer next.

    3. Only moving the pointer at the shorter wall can still produce a larger capacity. Moving the pointer at the taller wall reduces the distance between the walls, while the container's height remains limited by the shorter wall that has not moved.
        That height can only stay the same or decrease, so the capacity cannot exceed its previous value. Moving the pointer at the shorter wall is the only way to have a chance of finding a taller wall.

## 15.6.2 &nbsp; Programming exercises

### 1. &nbsp; Fractional knapsack

You are given arrays `wgt` and `val` of equal length, where `wgt[i] > 0` and `val[i] >= 0`, and a knapsack capacity `cap >= 0`.
There is one of each item, but you may take just part of it.
The value obtained is proportional to the fraction of the item's total weight that you take. Use a greedy algorithm
to return the maximum total value the knapsack can hold, as a real number.

??? tip "Hints"

    1. First calculate each item's value per unit of weight, val[i] / wgt[i]. Preserve the fractional part of the division result.
    2. Take items with a higher value per unit of weight first.
    3. If the remaining capacity is less than the current item's weight, take just enough of the item to fill the knapsack, then stop.
