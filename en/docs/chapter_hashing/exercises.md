# Exercises

## Check your understanding

### Looking up an element after a hash collision

A hash table has 5 buckets and uses the hash function $h(x)=x \bmod 5$. When elements collide, append them to the list in that bucket in insertion order.
Insert the elements of `[1, 6, 11, 7]` in order.

<!-- numbered-subquestions -->

1. Write down the contents of buckets 0 through 4.
2. When looking up 6, which bucket do you visit first, and which elements do you check, in what order?
3. Look at the buckets you wrote down in part 1. Did any later insertion overwrite an earlier element? Explain how this collision resolution method accounts for your answer.

??? success "Sample answer"

    1. Since $1\bmod5=6\bmod5=11\bmod5=1$ and $7\bmod5=2$, the buckets contain the following elements:

        ```text
        0: []
        1: [1, 6, 11]
        2: [7]
        3: []
        4: []
        ```

    2. To find 6, go to bucket 1 and compare the target with 1, then 6. The second comparison finds a match.

    3. Equal hash values tell us only that the elements land in the same bucket. The elements themselves can differ. Chaining keeps all the colliding elements in the bucket
        and compares them one at a time during lookup, so 1, 6, and 11 do not overwrite one another.

### Where do elements go when a hash table grows?

A hash table that uses chaining starts with 5 buckets and the hash function $h(x)=x\bmod5$.
The keys `[1, 6, 11]` are all in bucket 1.

Now expand the table to 7 buckets and change the hash function accordingly to $h(x)=x\bmod7$.

<!-- numbered-subquestions -->

1. Calculate the new bucket numbers for 1, 6, and 11.
2. Which buckets contain elements after the table grows?
3. Can you copy the original list in bucket 1 directly into the new bucket 1? Use your results from parts 1 and 2 to explain.

??? success "Sample answer"

    1. The new bucket numbers are as follows:

        - $1\bmod7=1$,
        - $6\bmod7=6$,
        - $11\bmod7=4$.

    2. Bucket 1 holds 1, bucket 4 holds 11, and bucket 6 holds 6. The three keys no longer share a bucket.

    3. No. The bucket number is the remainder when the key is divided by the number of buckets. Increasing the number of buckets from 5 to 7 can change the bucket number for a given key,
        so you must recalculate each key’s position. If you copied the old bucket 1 as is, later lookups for 6 and 11 would use the new formula
        and go to buckets 6 and 4, respectively, where neither key would be found.

### Can you still find 11 after deleting 6?

A hash table has 5 slots indexed `0–4` and uses the hash function $h(x)=x\bmod5$.
When a collision occurs, start at the index given by the hash function and move right until you find an empty slot.

Insert the elements of `[1, 6, 11]` in order.

<!-- numbered-subquestions -->

1. At which index does each of the three numbers end up?
2. Which indices do you check, in order, when looking up 11?
3. Suppose that deleting 6 marks its slot as empty and never used, and that a lookup stops at an empty slot.
    What happens when you look up 11 again? Is the result correct? If there is a problem, how can you avoid it?

??? success "Sample answer"

    1. Place 1 at index 1. The number 6 also maps to index 1, so the collision sends it to index 2.
        The number 11 also starts at index 1. It skips occupied indices 1 and 2 in turn and ends up at index 3.

    2. To look up 11, check the indices in the order `1, 2, 3`. You find it at index 3.

    3. If you mark index 2 as empty and never used, a lookup for 11 checks index 1 and stops at index 2,
        incorrectly concluding that 11 is absent. Leave a “deleted” marker when removing an element:
        a lookup that encounters the marker continues to the next index (wrapping from index 4 to index 0), and a later insertion can reuse the slot.

## Programming exercises

### Comparing the letters in two strings

You are given two strings, `s` and `t`, that contain only lowercase English letters.
You may rearrange the characters in `s` in any order, but you cannot add, remove, or replace characters.

Can you obtain `t` this way? Return `true` if you can and `false` otherwise.
Use a hash table to count the occurrences of each letter without sorting the characters in either string.

??? tip "Hints"

    1. If the strings have different lengths, their letter counts cannot all match.
    2. Use a hash table to count each letter. As you scan s, add 1 to the count for each letter you encounter.
    3. As you scan t, subtract 1 from the corresponding count. The strings contain the same letters with the same frequencies only if all counts end at 0.

[LeetCode](https://leetcode.com/problems/valid-anagram/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
