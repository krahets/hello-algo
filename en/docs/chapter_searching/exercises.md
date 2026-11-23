# Exercises

## Check your understanding

### How binary search narrows the search interval

Search for 16 in the sorted array `[2, 5, 8, 12, 16, 23, 38]`.
Use a closed interval `[i, j]` and the midpoint
$m=i+(j-i)/2$, rounded down.

For each iteration, write `(i, j, m)`, the midpoint element, and how the interval is narrowed next,
until the target is found.

??? success "Reference answer"

    The search proceeds as follows:

    | Iteration | `(i, j, m)` | Midpoint element | Next step |
    | --- | --- | --- | --- |
    | 1 | `(0, 6, 3)` | 12 | `12 < 16`, so set `i = 4` |
    | 2 | `(4, 6, 5)` | 23 | `23 > 16`, so set `j = 4` |
    | 3 | `(4, 4, 4)` | 16 | Target found; return index 4 |

    Since the array is sorted, when the midpoint value is below the target, we can exclude the midpoint and everything to its left.
    When it is above the target, we can exclude the midpoint and everything to its right.

### Left and right boundaries of repeated elements

Search for 2 in the array `[1, 2, 2, 2, 4, 6]`.
A student uses binary search, finds the target at index 2, and immediately returns, saying:
“Index 2 is the left boundary of the number 2.”

<!-- numbered-subquestions -->

1. Is the student correct? What are the left and right boundaries of 2? Explain.
2. When finding the left boundary, which side should we continue searching if the midpoint element equals the target?
3. Which side should we continue searching when finding the right boundary? State only the direction; you do not need to give the full search process.

??? success "Reference answer"

    1. The student is incorrect. Returning immediately upon finding a 2 guarantees only that some occurrence has been found, not the leftmost or rightmost one.
        Here, the left boundary is index 1 and the right boundary is index 3.

    2. When finding the left boundary, continue searching to the left even if the midpoint element equals 2.
        For example, with a closed interval, set `j = m - 1`.

    3. When finding the right boundary, continue searching to the right after the midpoint element equals 2.
        For example, set `i = m + 1`.

### Choosing a search method for different data

Choose a suitable method from linear search, binary search, and a hash table for each situation, and explain:

<!-- numbered-subquestions -->

1. Repeatedly searching $10^7$ integers that are already sorted and will not change, without building an additional data structure.
2. Repeatedly checking whether a key exists in a data set with frequent insertions and deletions, with no need to preserve order or perform range queries.
3. Searching for a value only once in an unsorted array.

??? success "Reference answer"

    1. Binary search: the data is sorted and static, giving $O(\log n)$ time without an additional data structure.
    2. A hash table: when the hash function distributes keys fairly evenly among buckets, insertion, deletion, and key lookup all have average time complexity $O(1)$.
    3. Scan directly from beginning to end. For a single search, sorting or building a hash table would first require processing the entire array,
        without reducing the total work for this task.

        The choice depends on whether the data is sorted, whether additional structures are allowed, how many queries there are, and which operations are needed.

## Programming exercises

### Binary search in a sorted array

Given an integer array `nums` in strictly increasing order and a target value `target`, find `target` using binary search. Return its array index if it exists, or -1 otherwise.

??? tip "Hints"

    1. The initial interval has left = 0 and right = n - 1; it is nonempty while left <= right.
    2. Calculate the midpoint with mid = left + (right - left) // 2.
    3. If `nums[mid]` is less than `target`, move the left boundary to `mid + 1`; if `nums[mid]` is greater than `target`, move the right boundary to `mid - 1`; return immediately if they are equal.

[LeetCode](https://leetcode.com/problems/binary-search/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Finding an insertion position in a sorted array

You are given an integer array `nums` in strictly increasing order and a target value `target`.

If `target` is already in the array, return its index. Otherwise, return the position at which `target` can be inserted while preserving strictly increasing order. The answer may be 0 or the array length. Use binary search.

??? tip "Hints"

    1. The answer may be 0 or the array length n.
    2. With a closed interval, if `nums[mid]` is greater than or equal to `target`, set `right = mid - 1` to keep checking farther left; otherwise, set `left = mid + 1`.
    3. When the loop ends, left is the insertion position.

[LeetCode](https://leetcode.com/problems/search-insert-position/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
