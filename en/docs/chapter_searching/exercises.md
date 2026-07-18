# Exercises

## Concept Review

### How Binary Search Narrows the Search Interval

Search for 16 in the sorted array `[2, 5, 8, 12, 16, 23, 38]`.
Use the closed interval `[i, j]` and calculate the midpoint as
$m=i+(j-i)/2$, rounded down.

For each round, write `(i, j, m)`, the middle element, and how the interval is narrowed next,
until the target is found.

??? success "Answer"

    The search proceeds as follows:

    | Round | `(i, j, m)` | Middle element | Next step |
    | --- | --- | --- | --- |
    | 1 | `(0, 6, 3)` | 12 | `12 < 16`, set `i = 4` |
    | 2 | `(4, 6, 5)` | 23 | `23 > 16`, set `j = 4` |
    | 3 | `(4, 4, 4)` | 16 | Target found; return index 4 |

    Because the array is sorted, when the middle value is smaller than the target, the middle and everything to its left can be excluded.
    When the middle value is greater than the target, the middle and everything to its right can be excluded.

### Left and Right Boundaries of Duplicate Elements

Search for the number 2 in the array `[1, 2, 2, 2, 4, 6]`.
A student uses binary search, returns immediately after finding the target at index 2, and says,
"Index 2 is the left boundary of the number 2."

<!-- numbered-subquestions -->

1. Is the student's statement correct? What are the left and right boundaries of 2? Explain why.
2. When searching for the left boundary, if the middle element equals the target, which side should be searched next?
3. When searching for the right boundary, which side should be searched next? State only the direction; you do not need to write the complete search process.

??? success "Answer"

    1. The student's statement is incorrect. Returning as soon as a 2 is found guarantees only that some occurrence of 2 was found, not the leftmost or rightmost one.
        Here, the left boundary is index 1 and the right boundary is index 3.

    2. When searching for the left boundary, continue searching on the left even if the middle element equals 2.
        For example, with a closed interval, set `j = m - 1`.

    3. When searching for the right boundary, continue searching on the right after the middle element equals 2.
        For example, set `i = m + 1`.

### Choosing a Search Method for Different Data

For each situation below, choose an appropriate method from "linear search," "binary search," and "hash table," and explain why:

<!-- numbered-subquestions -->

1. Repeatedly search among $10^7$ integers that are already sorted and never change, without building any additional data structure.
2. Repeatedly test whether a key exists in a collection with frequent insertions and deletions. The collection need not remain sorted, and no range searches are needed.
3. Search an unsorted array for a value only once.

??? success "Answer"

    1. Binary search: the data is sorted and static, so searching takes $O(\log n)$ time without extra space.
    2. Hash table: when the hash function distributes keys fairly evenly among the buckets, insertion, deletion, and lookup by key all take $O(1)$ time on average.
    3. Scan directly from beginning to end. When searching only once, sorting the array or building a hash table still requires processing the entire array first,
        so neither reduces the total work for this single task.

        The choice depends on whether the data is sorted, whether an additional structure is allowed, how many searches are needed, and which operations must be supported.

## Programming Exercises

### Binary Search in a Sorted Array

Given an integer array `nums` in strictly increasing order and a target value `target`, use binary search to find `target`. If it exists, return its array index; otherwise, return -1.

??? tip "Hints"

    1. The initial interval is left = 0 and right = n - 1; it is nonempty while left <= right
    2. Calculate the midpoint with mid = left + (right - left) // 2
    3. If `nums[mid]` is less than `target`, move the left boundary to `mid + 1`; if `nums[mid]` is greater than `target`, move the right boundary to `mid - 1`; if they are equal, return immediately

[LeetCode](https://leetcode.com/problems/binary-search/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Insertion Point in a Sorted Array

You are given an integer array `nums` in strictly increasing order and a target value `target`.

Return the index of `target` if it is already in the array. Otherwise, return the insertion point at which `target` can be inserted while keeping the array in strictly increasing order.
The insertion point may be 0 or may equal the array's length. Use binary search.

??? tip "Hints"

    1. The answer may be 0 or the array length n
    2. With a closed interval, if `nums[mid]` is greater than or equal to `target`, set `right = mid - 1` and continue checking farther left; otherwise, set `left = mid + 1`
    3. When the loop ends, left is the insertion point

[LeetCode](https://leetcode.com/problems/search-insert-position/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
