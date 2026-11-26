# Exercises

## Check your understanding

### Data relationships in everyday situations

For each scenario, examine the relationships between elements. Choose a linear, tree, or network structure and explain your reasoning.

<!-- numbered-subquestions -->

1. Students stand in a single line. Each student cares only about the people immediately in front of and behind them.
2. A school is organized into levels: school → grade → class.
3. City streets connect intersections. One intersection can lead to several others, and routes may form cycles.

??? success "Sample answer"

    1. The line is a linear structure. Except at the two ends, each student has one neighbor in front and one behind, so the relationships form a single sequence.

    2. The school has a tree structure. Each class belongs to one grade, and each grade belongs to the school, forming a hierarchy from top to bottom.

    3. The streets form a network. An intersection can connect to several others, and routes can form cycles, so the relationships do not fit a single sequence or a strict hierarchy.

        To identify a structure, first examine how the elements relate to one another. How much memory they occupy is a separate question.

### How is logical order represented in memory?

Consider two simplified memory layouts that represent the logical order `A → B → C`.

- Layout A stores `A, B, C` in memory cells `20, 21, 22`, respectively.
- Layout B stores `A, B, C` in memory cells `20, 7, 31`, respectively. In addition, `A` records the location of `B`, and `B` records the location of `C`.

<!-- numbered-subquestions -->

1. Which layout uses contiguous storage? Which uses noncontiguous storage?
2. Which layout more closely resembles an array, and which a linked list?
3. The memory cell numbers in layout B are out of order. How can they still represent the logical order `A → B → C`?

??? success "Sample answer"

    1. Layout A uses consecutive memory cells, so its storage is contiguous. The nodes in layout B occupy scattered locations, so its storage is noncontiguous.

    2. Layout A more closely resembles an array, and layout B a linked list.

    3. The links recorded between nodes determine their logical order, regardless of the numerical order of the memory cells.
        The location stored in `A` leads to `B`, and the location stored in `B` leads to `C`. You can therefore still visit `A, B, C` in order.

        Logical and physical structure thus describe two different aspects of the same data.

### Data types and structures in a homework record

A study group records whether four students turned in their homework, in seating order, and obtains the following:

`[true, false, true, true]`

<!-- numbered-subquestions -->

1. Which basic data type suits each element?
2. What logical structure do the four elements form when arranged in seating order?
3. Suppose the group switches to recording each student's homework score, `[90, 0, 85, 100]`. Does this change the type of data or the way it is organized? Explain.

??? success "Sample answer"

    1. Each element represents only yes or no, so the Boolean type `bool` is a good fit.

    2. The elements form a linear structure in seating order and can be stored in an array.

    3. The type of data changes from Boolean values to integers. The organization stays the same:
        the values still form a sequence in seating order, so an array is still a suitable linear structure.

        A basic data type describes what is stored. A data structure describes how the data is organized.

## Programming exercises

### Count the ones in a binary representation

Given a nonnegative integer `n`, count the ones in its binary representation.

Use bitwise operations. Do not convert the number to a binary string or use a built-in function that counts ones directly.

??? tip "Hints"

    1. Use n & 1 to extract the rightmost bit of n and check whether it is 1.
    2. Shifting right by one discards the current rightmost bit. Most languages use the >> operator.
    3. After implementing the method that checks each bit and shifts right, observe what n & (n - 1) does: it clears the rightmost 1 in n.

[LeetCode](https://leetcode.com/problems/number-of-1-bits/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
