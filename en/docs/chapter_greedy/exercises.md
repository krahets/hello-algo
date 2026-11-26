# Exercises

## Check your understanding

### Is taking the largest coin always best?

The coin denominations are `[1, 7, 10]` and the target amount is 14.

<!-- numbered-subquestions -->

1. Write down the coins you take if you always choose the largest denomination that does not exceed the remaining amount.
2. Can you make the same amount with fewer coins? Give one way if you can, or explain why you cannot.
3. Does this show that the greedy strategy works for every set of denominations?

??? success "Sample answer"

    1. The greedy strategy chooses `10 + 1 + 1 + 1 + 1` in that order, for a total of 5 coins.

    2. Yes. The combination `7 + 7` uses only 2 coins.

    3. No. This counterexample shows that choosing the largest coin you can take at each step does not always minimize the number of coins for an arbitrary set of denominations.
        Taking the largest coin now can rule out a better combination later.

### Which item goes into the knapsack first?

A knapsack can carry 4 kg. You may take any fraction of the following items,
and the value you receive is proportional to the weight you take.

- Item A weighs 4 kg and has a value of 20.
- Item B weighs 3 kg and has a value of 18.

<!-- numbered-subquestions -->

1. What is the value per kilogram of each item? Which should you take first?
2. What total value do you get when you fill the knapsack using the greedy strategy for fractional knapsack?
3. When you can divide items and the knapsack limits total weight, should you compare total values or values per kilogram? Why?

??? success "Sample answer"

    1. A's value per kilogram is `20 ÷ 4 = 5` and B's is `18 ÷ 3 = 6`,
        so take B first because it has the higher value per kilogram.

    2. Take all of B first. This uses 3 kg of capacity and gives a value of 18. With 1 kg of capacity left,
        take 1 kg of A for a value of 5. The final value is `18 + 5 = 23`.

    3. The knapsack limits total weight, and the items are divisible, so compare values per unit of weight.
        A has a higher total value but a lower value per kilogram than B. Filling the knapsack with A first would give a value of only 20.

### Which pointer should move next?

The board heights are `[1, 8, 6, 2, 5]`. Use two pointers starting at opposite ends to find the maximum capacity.
Capacity equals the height of the shorter board times the distance between the two board indices.

<!-- numbered-subquestions -->

1. Initially, the left pointer is at index 0 and the right pointer is at index 4. What is the current capacity? Which pointer should move next?
2. After the move you chose in part 1, what are the two pointer indices? What is the capacity now, and which pointer should move next?
3. For the current pair of boards, you could move the pointer at the shorter board or the one at the taller board. Which move could still give you a larger capacity? Why?

??? success "Sample answer"

    1. The current capacity is `min(1, 5) × (4 - 0) = 4`. The left board is shorter, so move the left pointer.

    2. After the left pointer moves, the pointers are at indices 1 and 4. The current capacity is
        `min(8, 5) × (4 - 1) = 15`. The right board is shorter, so move the right pointer next.

    3. Only moving the pointer at the shorter board can lead to a larger capacity. Moving the pointer at the taller board reduces the distance between the boards, and the shorter board that stays in place still limits the height of the container.
        That height can only stay the same or decrease, so the capacity cannot exceed its previous value. Only by moving away from the shorter board do we get a chance to replace it with a taller one.

## Programming exercises

### Fractional knapsack

You are given two arrays of equal length, `wgt` and `val`, with `wgt[i] > 0` and `val[i] >= 0`, and a knapsack of capacity `cap >= 0`.
There is one of each item, and you may take a fraction of it.
The value you receive is proportional to the fraction of the item's weight you take. Use a greedy algorithm
to find the maximum total value the knapsack can hold and return it as a real number.

??? tip "Hints"

    1. First compute each item's value per unit of weight, val[i] / wgt[i]. Keep the fractional part of the quotient.
    2. Take items with higher value per unit of weight first.
    3. If the remaining capacity is less than the weight of the current item, take just enough of it to fill the knapsack and stop.
