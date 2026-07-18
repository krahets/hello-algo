# Exercises

## Concept Review

### Data Relationships in Everyday Situations

Based on the relationships among the data, choose one of "linear structure," "tree structure," and "network structure" for each situation below, and explain why:

<!-- numbered-subquestions -->

1. Students stand in a line; we consider only each student's immediate neighbors in front of and behind them.
2. A school is organized in levels: "school → grade → class."
3. City roads connect many intersections. One intersection may lead to several others, and the roads may form cycles.

??? success "Answer"

    1. This is a linear structure. Except for the first and last students, each person is adjacent to exactly one person in front and one behind, so the relationships extend along a single line.

    2. This is a tree structure. Each class belongs to one grade, and each grade belongs to the school, so the relationships form levels from top to bottom.

    3. This is a network structure. An intersection can connect to several other intersections, and the routes can form cycles, so they cannot be arranged in a single order or a strict hierarchy.

        To identify a structure, first examine the relationships among the elements rather than how much space it uses in memory.

### Storing a Logical Order in Memory

Consider two simplified memory layouts for storing the logical order `A → B → C`:

- Layout A: `A, B, C` are stored in memory cells numbered `20, 21, 22`, respectively.
- Layout B: `A, B, C` are stored in memory cells numbered `20, 7, 31`, respectively. `A` records the location of `B`, and `B` records the location of `C`.

<!-- numbered-subquestions -->

1. Which layout uses contiguous-space storage, and which uses dispersed-space storage?
2. Which layout is more like an array, and which is more like a linked list?
3. The memory-cell numbers in Layout B are not in increasing order. Why can it still represent the logical order `A → B → C`?

??? success "Answer"

    1. Layout A uses consecutive memory cells, so it uses contiguous-space storage. The nodes in Layout B are scattered across different locations, so it uses dispersed-space storage.

    2. Layout A is more like an array, and Layout B is more like a linked list.

    3. The logical order is determined by the links recorded between nodes, not by the numerical order of the memory-cell numbers.
        The location stored by `A` leads to `B`, and the location stored by `B` then leads to `C`, so `A, B, C` can still be visited in order.

        This also shows that logical structure and physical structure are two different ways of viewing the same data.

### Data Types and Structures in Homework Records

A study group records, in seating order, whether each of four students submitted their homework:

`[true, false, true, true]`

<!-- numbered-subquestions -->

1. Which basic data type is suitable for each element?
2. The four elements are arranged in a line by seating order. What logical structure does this use?
3. Suppose the group later records each student's homework score as `[90, 0, 85, 100]`. Does this change the data's "content type" or its "organization"? Explain why.

??? success "Answer"

    1. Each element represents only "yes" or "no," so the Boolean type `bool` is suitable.

    2. The elements are arranged in seating order, forming a linear structure that can be stored in an array.

    3. The content type changes: the elements change from Boolean values to integers. The organization does not change.
        The data is still arranged in a line by seating order and can still be stored in an array, which is a linear structure.

        A basic data type describes "what is stored," while a data structure describes "how the data is organized."

## Programming Exercises

### Count the 1s in a Binary Representation

Given a non-negative integer `n`, count the number of 1s in its binary representation.

Use bitwise operations. Do not convert the binary representation to a string or use a built-in function that directly counts 1s.

??? tip "Hints"

    1. n & 1 extracts the rightmost bit of n, which tells you whether that bit is 1
    2. Shifting right by one discards the current rightmost bit; most languages use the operator >>
    3. After implementing the method that checks and shifts one bit at a time, observe that n & (n - 1) turns the rightmost 1 in n into 0

[LeetCode](https://leetcode.com/problems/number-of-1-bits/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
