---
comments: true
---

# 10.7 &nbsp; Exercises

## 10.7.1 &nbsp; Check your understanding

### 1. &nbsp; How binary search narrows the search interval

Search for 16 in the sorted array `[2, 5, 8, 12, 16, 23, 38]`.
Use the closed interval `[i, j]` and compute the midpoint as
$m=i+(j-i)/2$ (round down).

For each iteration, give `(i, j, m)`, the element at the midpoint, and how you narrow the interval next.
Continue until you find the target.

??? success "Sample answer"

    The search proceeds as follows:

    | Iteration | `(i, j, m)` | Midpoint element | Next step |
    | --- | --- | --- | --- |
    | 1 | `(0, 6, 3)` | 12 | Since `12 < 16`, set `i = 4` |
    | 2 | `(4, 6, 5)` | 23 | Since `23 > 16`, set `j = 4` |
    | 3 | `(4, 4, 4)` | 16 | Found the target. Return index 4 |

    Because the array is sorted, if the midpoint value is less than the target, you can rule out the midpoint and everything to its left.
    If the midpoint value is greater than the target, you can rule out the midpoint and everything to its right.

### 2. &nbsp; Left and right boundaries of a repeated value

Search for the number 2 in the array `[1, 2, 2, 2, 4, 6]`.
A student uses binary search, finds the target at index 2, and returns immediately, saying,
“Index 2 is the left boundary of the value 2.”

<!-- numbered-subquestions -->

1. Is the student correct? What are the left and right boundaries of the value 2? Explain your reasoning.
2. When searching for the left boundary, which side should you search next if the midpoint element equals the target?
3. Which side should you search for the right boundary? Just give the directions. You do not need to trace the entire search.

??? success "Sample answer"

    1. The student is incorrect. Returning as soon as you find a 2 guarantees only that you have found one occurrence. It may be neither the leftmost nor the rightmost.
        Here the left boundary is index 1, and the right boundary is index 3.

    2. To find the left boundary, keep searching to the left even if the midpoint element equals 2.
        For example, with a closed interval, set `j = m - 1`.

    3. To find the right boundary, keep searching to the right when the midpoint element equals 2.
        For example, set `i = m + 1`.

### 3. &nbsp; Choosing a search method

For each of the following scenarios, choose linear search, binary search, or a hash table. Explain your choice.

<!-- numbered-subquestions -->

1. Search repeatedly among $10^7$ sorted integers that will never change, without building an additional data structure.
2. Repeatedly check whether a key exists in a dataset with frequent insertions and deletions. You do not need to keep the data sorted or perform range searches.
3. Search for a value just once in an unsorted array.

??? success "Sample answer"

    1. Binary search. The data is sorted and static, so a search takes $O(\log n)$ time and needs no additional storage for the data.
    2. Hash table. When the hash function distributes keys fairly evenly across buckets, insertion, deletion, and lookup by key all take $O(1)$ time on average.
    3. Scan the array from start to finish. For a single search, sorting or building a hash table requires processing the entire array first,
        so neither reduces the total work for this task.

        The choice depends on whether the data is sorted, whether you can build an additional structure, how many queries you expect, and which operations you need.

## 10.7.2 &nbsp; Programming exercises

### 1. &nbsp; Binary search in a sorted array

Given a strictly increasing array of integers `nums` and a target value `target`, use binary search to find `target`. Return its index if it is present or -1 if it is absent.

??? tip "Hints"

    1. Start with left = 0 and right = n - 1. The interval is nonempty as long as left <= right.
    2. Compute the midpoint with mid = left + (right - left) // 2.
    3. If `nums[mid]` is less than `target`, move the left boundary to `mid + 1`. If `nums[mid]` is greater than `target`, move the right boundary to `mid - 1`. Return immediately on a match.

[LeetCode](https://leetcode.com/problems/binary-search/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; Finding an insertion point in a sorted array

You are given a strictly increasing array of integers `nums` and a target value `target`.

If `target` is already in the array, return its index. Otherwise, return the position where you could insert `target` and keep the array strictly increasing. The answer can range from 0 to the length of the array, inclusive. Use binary search.

??? tip "Hints"

    1. The answer can be 0 or the array length n.
    2. With a closed interval, if `nums[mid]` is greater than or equal to `target`, set `right = mid - 1` to keep checking positions to the left. Otherwise, set `left = mid + 1`.
    3. When the loop ends, left is the insertion point.

[LeetCode](https://leetcode.com/problems/search-insert-position/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
