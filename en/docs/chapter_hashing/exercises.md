# Exercises

## Check your understanding

### Searching after a hash collision

A hash table has five buckets and uses the hash function $h(x)=x \bmod 5$. When elements collide, they are added in order to the list in that bucket.
Insert `[1, 6, 11, 7]` in sequence:

<!-- numbered-subquestions -->

1. Write out the contents of buckets 0 through 4.
2. When searching for 6, which bucket is visited first, and which elements are checked in order?
3. Based on the bucket contents from question 1, did later elements overwrite earlier ones? Explain using this collision-handling method.

??? success "Reference answer"

    1. Since $1\bmod5=6\bmod5=11\bmod5=1$ and $7\bmod5=2$, the buckets contain:

        ```text
        0: []
        1: [1, 6, 11]
        2: [7]
        3: []
        4: []
        ```

    2. Searching for 6 first visits bucket 1 and compares against 1 and then 6, finding the target on the second comparison.

    3. Equal hash values mean only that the elements land in the same bucket, not that the elements themselves are equal. Separate chaining keeps all colliding elements in the bucket
        and compares them one by one during a search, so 1, 6, and 11 do not overwrite one another.

### Where do elements go when a hash table grows?

A hash table using separate chaining initially has five buckets and the hash function $h(x)=x\bmod5$.
The keys `[1, 6, 11]` are all in bucket 1.

The table is now expanded to seven buckets, and the hash function becomes $h(x)=x\bmod7$:

<!-- numbered-subquestions -->

1. Calculate the new bucket number for each of 1, 6, and 11.
2. Which buckets contain elements after the expansion?
3. Can the list in the old bucket 1 simply be copied unchanged into the new bucket 1? Explain using your results from questions 1 and 2.

??? success "Reference answer"

    1. The new bucket numbers are:

        - $1\bmod7=1$;
        - $6\bmod7=6$;
        - $11\bmod7=4$.

    2. Bucket 1 holds 1, bucket 4 holds 11, and bucket 6 holds 6. The three keys no longer share one bucket.

    3. The list cannot simply be copied unchanged. A bucket number is the remainder of the key divided by the number of buckets. When that number changes from 5 to 7, a key's bucket may change,
        so every key's position must be recalculated. If we copied the old bucket 1 unchanged, subsequent searches for 6 and 11 using the new formula
        would visit buckets 6 and 4, respectively, and fail to find them.

### Can we still find 11 after deleting 6?

A hash table has five positions with indices `0-4` and uses the hash function $h(x)=x\bmod5$.
When a collision occurs, it starts at the computed index and searches to the right for the first empty position.

Insert `[1, 6, 11]` in order:

<!-- numbered-subquestions -->

1. At which index is each number ultimately stored?
2. Which indices are checked, in order, when searching for 11?
3. Suppose deleting 6 marks its position as an empty slot that has never been used, and a search stops on reaching an empty slot.
    What happens when we search for 11 again? Is the result correct? If not, how can we avoid the problem?

??? success "Reference answer"

    1. The number 1 is stored at index 1. The number 6 also maps to index 1, so after the collision it is stored at index 2.
        The number 11 likewise starts at index 1, skips occupied indices 1 and 2, and is finally stored at index 3.

    2. Searching for 11 checks indices `1, 2, 3` in order and finds it at index 3.

    3. If index 2 is marked as an empty slot that has never been used, a search for 11 checks index 1 and then stops at index 2,
        incorrectly concluding that 11 is absent. Deletion should leave a deleted marker instead:
        a search continues to the next index when it encounters this marker, wrapping from index 4 to index 0. Later insertions can still reuse the position.

## Programming exercises

### Comparing the characters in two strings

Given two strings `s` and `t` containing only lowercase English letters,
you may rearrange the characters in `s` freely, but may not add, delete, or replace any characters.

Determine whether the rearrangement can produce `t`. Return `true` if it can, or `false` otherwise.
Use a hash table to record the frequency of each letter; do not sort the characters in either string.

??? tip "Hints"

    1. Strings of different lengths cannot contain the same characters with the same frequencies.
    2. Use a hash table to record each letter's count; increment the appropriate count by 1 while scanning s.
    3. Decrement the appropriate count by 1 while scanning t. The character frequencies match only if all counts end at 0.

[LeetCode](https://leetcode.com/problems/valid-anagram/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
