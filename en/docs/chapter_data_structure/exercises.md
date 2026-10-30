# Exercises

## Check your understanding

### Relationships between data in everyday situations

For each situation below, choose a linear, tree, or network structure based on the relationships between the data, and explain your choice:

<!-- numbered-subquestions -->

1. Students stand in a line, each concerned only with the people immediately in front of and behind them.
2. A school is organized in a hierarchy: school → grade → class.
3. City roads connect intersections. An intersection can lead to several others, and the roads may form cycles.

??? success "Reference answer"

    1. A linear structure. Apart from the first and last people, each person has exactly one neighbor in front and one behind, forming a line of relationships.

    2. A tree structure. Each class belongs to a grade, and each grade belongs to the school, forming a hierarchy from top to bottom.

    3. A network structure. An intersection can connect to several others, and routes can form cycles. These relationships cannot be arranged in a single sequence or a strict hierarchy.

        To identify a structure, first examine the relationships between its elements, rather than how much memory it occupies.

### Storing a logical sequence in memory

Consider two simplified memory layouts for storing the logical sequence `A → B → C`:

- Layout A: `A, B, C` are stored in memory cells numbered `20, 21, 22`, respectively.
- Layout B: `A, B, C` are stored in cells numbered `20, 7, 31`, respectively. `A` records the location of `B`, and `B` records the location of `C`.

<!-- numbered-subquestions -->

1. Which layout uses contiguous storage, and which uses noncontiguous storage?
2. Which layout is more like an array, and which is more like a linked list?
3. The cell numbers in layout B are not in ascending order. Why can it still represent the logical sequence `A → B → C`?

??? success "Reference answer"

    1. Layout A uses consecutive memory cells, so its storage is contiguous. In layout B, nodes occupy separate locations, so its storage is noncontiguous.

    2. Layout A is more like an array; layout B is more like a linked list.

    3. The logical order is determined by the links recorded between nodes, not by the numerical order of their memory cell numbers.
        The location stored in `A` leads to `B`, and the location stored in `B` leads to `C`, so we can still visit `A, B, C` in sequence.

        This also shows that logical and physical structure are two ways of looking at the same data.

### Data types and structures in homework records

A study group records whether four students have submitted their homework, in seating order:

`[true, false, true, true]`

<!-- numbered-subquestions -->

1. Which basic data type is suitable for each element?
2. These four elements form a sequence in seating order. What logical structure does this use?
3. If the group later records homework scores instead, as `[90, 0, 85, 100]`, has the type of content changed, or the way it is organized? Explain.

??? success "Reference answer"

    1. Each element represents only yes or no, so the Boolean type `bool` is appropriate.

    2. The elements form a linear structure in seating order and can be stored in an array.

    3. The content type has changed: the elements are now integers instead of Boolean values. Their organization has not changed.
        The data still forms a sequence in seating order and can still use the linear structure of an array.

        A basic data type describes what is stored; a data structure describes how the data is organized.

## Programming exercises

### Counting ones in a binary representation

Given a nonnegative integer `n`, count the ones in its binary representation.

Use bitwise operations. Do not convert the binary representation to a string or use a built-in function that counts the ones directly.

??? tip "Hints"

    1. n & 1 extracts the rightmost bit of n, allowing you to check whether it is 1.
    2. Shifting right by one bit discards the current rightmost bit; most languages use the >> operator.
    3. After implementing the method that checks each bit and shifts right, observe that n & (n - 1) changes the rightmost 1 in n to 0.

[LeetCode](https://leetcode.com/problems/number-of-1-bits/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
