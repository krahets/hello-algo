# Exercises

## Concept Review

### Searching After a Hash Collision

A hash table has 5 buckets and uses the hash function $h(x)=x \bmod 5$. When a collision occurs, elements are placed one after another in a list within that bucket.
Insert `[1, 6, 11, 7]` in order:

<!-- numbered-subquestions -->

1. Write the contents of buckets 0–4.
2. When searching for 6, which bucket is checked first, and which elements are examined in order?
3. Based on the bucket contents from Question 1, do later insertions overwrite earlier ones? Explain using this collision-resolution method.

??? success "Answer"

    1. Because $1\bmod5=6\bmod5=11\bmod5=1$, while $7\bmod5=2$, the buckets are:

        ```text
        0: []
        1: [1, 6, 11]
        2: [7]
        3: []
        4: []
        ```

    2. A search for 6 first goes to bucket 1, then compares 1 and 6 in order. The target is found on the second comparison.

    3. Equal hash values mean only that the elements go into the same bucket, not that the elements are equal. Separate chaining keeps all colliding elements in the bucket
        and compares them one at a time during a search, so 1, 6, and 11 do not overwrite one another.

### Where Do Elements Go After a Hash Table Expands?

A hash table using separate chaining originally has 5 buckets and the hash function $h(x)=x\bmod5$.
The keys `[1, 6, 11]` are all in bucket 1.

The table is now expanded to 7 buckets, and the hash function becomes $h(x)=x\bmod7$:

<!-- numbered-subquestions -->

1. Calculate the new bucket number for 1, 6, and 11.
2. Which buckets contain elements after the expansion?
3. During the expansion, can the list from the old bucket 1 simply be copied into the new bucket 1? Explain using the results from Questions 1 and 2.

??? success "Answer"

    1. The new bucket numbers are:

        - $1\bmod7=1$;
        - $6\bmod7=6$;
        - $11\bmod7=4$.

    2. Bucket 1 stores 1, bucket 4 stores 11, and bucket 6 stores 6. The three keys are no longer crowded into the same bucket.

    3. The list cannot be copied as is. A bucket number is calculated by taking the key modulo the number of buckets. When the bucket count changes from 5 to 7, a key's bucket number may change,
        so the position of every key must be recalculated. If the old bucket 1 were copied unchanged, later searches using the new formula would go to bucket 6 for 6 and bucket 4 for 11
        and would fail to find them.

### Can 11 Still Be Found After Deleting 6?

A hash table has 5 positions with indices `0–4` and uses the hash function $h(x)=x\bmod5$.
When a collision occurs, it searches to the right from the index produced by the hash function for the first empty position.

Insert `[1, 6, 11]` in order:

<!-- numbered-subquestions -->

1. At which index is each number ultimately stored?
2. When searching for 11, which indices are examined in order?
3. Suppose deleting 6 changes its position directly to an "unused empty position," and a search stops whenever it reaches an empty position.
    What happens when searching for 11 afterward? Is this search result correct? If there is a problem, how can it be avoided?

??? success "Answer"

    1. The number 1 is stored at index 1. The number 6 also maps to index 1, so after the collision it is stored at index 2.
        The number 11 also starts at index 1, skips the occupied indices 1 and 2, and is ultimately stored at index 3.

    2. A search for 11 examines indices `1, 2, 3` in order and finds it at index 3.

    3. If index 2 is changed to mean "never used," a search for 11 checks index 1 and then stops at index 2,
        incorrectly concluding that 11 is absent. Deletion should leave a "deleted" marker.
        A search that reaches this marker continues to the next index (wrapping from index 4 to index 0), while a later insertion may still reuse the position.

## Programming Exercises

### Compare the Character Counts of Two Strings

Given two strings `s` and `t` containing only lowercase English letters,
you may rearrange the characters in `s` in any order, but you may not add, remove, or replace characters.

Determine whether the rearranged string can form `t`. Return `true` if it can and `false` otherwise.
Use a hash table to record how many times each letter occurs. Do not sort the characters in the strings.

??? tip "Hints"

    1. If the two strings have different lengths, they cannot contain each character the same number of times
    2. Use a hash table to record the count of each letter; increment the corresponding count while scanning s
    3. Decrement the corresponding count while scanning t; the strings contain each character the same number of times only if every count is 0 at the end

[LeetCode](https://leetcode.com/problems/valid-anagram/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
