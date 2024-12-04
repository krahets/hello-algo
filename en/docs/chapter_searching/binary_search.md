---
comments: true
---

# 10.1 &nbsp; Binary search

<u>Binary search</u> is an efficient search algorithm that uses a divide-and-conquer strategy. It takes advantage of the sorted order of elements in an array by reducing the search interval by half in each iteration, continuing until either the target element is found or the search interval becomes empty.

!!! question

    Given an array `nums` of length $n$, where elements are arranged in ascending order without duplicates. Please find and return the index of element `target` in this array. If the array does not contain the element, return $-1$. An example is shown in Figure 10-1.

![Binary search example data](binary_search.assets/binary_search_example.png){ class="animation-figure" }

<p align="center"> Figure 10-1 &nbsp; Binary search example data </p>

As shown in Figure 10-2, we firstly initialize pointers with $i = 0$ and $j = n - 1$, pointing to the first and last element of the array respectively. They also represent the whole search interval $[0, n - 1]$. Please note that square brackets indicate a closed interval, which includes the boundary values themselves.

And then the following two steps may be performed in a loop.

1. Calculate the midpoint index $m = \lfloor {(i + j) / 2} \rfloor$, where $\lfloor \: \rfloor$ denotes the floor operation.
2. Based on the comparison between the value of `nums[m]` and `target`, one of the following three cases will be chosen to execute.
    1. If `nums[m] < target`, it indicates that `target` is in the interval $[m + 1, j]$, thus set $i = m + 1$.
    2. If `nums[m] > target`, it indicates that `target` is in the interval $[i, m - 1]$, thus set $j = m - 1$.
    3. If `nums[m] = target`, it indicates that `target` is found, thus return index $m$.

If the array does not contain the target element, the search interval will eventually reduce to empty, ending up returning $-1$.

=== "<1>"
    ![Binary search process](binary_search.assets/binary_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.png){ class="animation-figure" }

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.png){ class="animation-figure" }

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.png){ class="animation-figure" }

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.png){ class="animation-figure" }

<p align="center"> Figure 10-2 &nbsp; Binary search process </p>

It's worth noting that as $i$ and $j$ are both of type `int`, **$i + j$ might exceed the range of `int` type**. To avoid large number overflow, we usually use the formula $m = \lfloor {i + (j - i) / 2} \rfloor$ to calculate the midpoint.

The code is as follows:

=== "Python"

    ```python title="binary_search.py"
    def binary_search(nums: list[int], target: int) -> int:
        """Binary search (double closed interval)"""
        # Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
        i, j = 0, len(nums) - 1
        # Loop until the search interval is empty (when i > j, it is empty)
        while i <= j:
            # Theoretically, Python's numbers can be infinitely large (depending on memory size), so there is no need to consider large number overflow
            m = i + (j - i) // 2  # Calculate midpoint index m
            if nums[m] < target:
                i = m + 1  # This situation indicates that target is in the interval [m+1, j]
            elif nums[m] > target:
                j = m - 1  # This situation indicates that target is in the interval [i, m-1]
            else:
                return m  # Found the target element, thus return its index
        return -1  # Did not find the target element, thus return -1
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* Binary search (double closed interval) */
    int binarySearch(vector<int> &nums, int target) {
        // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
        int i = 0, j = nums.size() - 1;
        // Loop until the search interval is empty (when i > j, it is empty)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate midpoint index m
            if (nums[m] < target)    // This situation indicates that target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This situation indicates that target is in the interval [i, m-1]
                j = m - 1;
            else // Found the target element, thus return its index
                return m;
        }
        // Did not find the target element, thus return -1
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* Binary search (double closed interval) */
    int binarySearch(int[] nums, int target) {
        // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
        int i = 0, j = nums.length - 1;
        // Loop until the search interval is empty (when i > j, it is empty)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate midpoint index m
            if (nums[m] < target) // This situation indicates that target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This situation indicates that target is in the interval [i, m-1]
                j = m - 1;
            else // Found the target element, thus return its index
                return m;
        }
        // Did not find the target element, thus return -1
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    [class]{binary_search}-[func]{BinarySearch}
    ```

=== "Go"

    ```go title="binary_search.go"
    [class]{}-[func]{binarySearch}
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    [class]{}-[func]{binarySearch}
    ```

=== "JS"

    ```javascript title="binary_search.js"
    [class]{}-[func]{binarySearch}
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    [class]{}-[func]{binarySearch}
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    [class]{}-[func]{binarySearch}
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    [class]{}-[func]{binary_search}
    ```

=== "C"

    ```c title="binary_search.c"
    [class]{}-[func]{binarySearch}
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    [class]{}-[func]{binarySearch}
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    [class]{}-[func]{binary_search}
    ```

=== "Zig"

    ```zig title="binary_search.zig"
    [class]{}-[func]{binarySearch}
    ```

**Time complexity is $O(\log n)$** : In the binary loop, the interval decreases by half each round, hence the number of iterations is $\log_2 n$.

**Space complexity is $O(1)$** : Pointers $i$ and $j$ occupies constant size of space.

## 10.1.1 &nbsp; Interval representation methods

Besides the above closed interval, another common interval representation is the "left-closed right-open" interval, defined as $[0, n)$, where the left boundary includes itself, and the right boundary does not. In this representation, the interval $[i, j)$ is empty when $i = j$.

We can implement a binary search algorithm with the same functionality based on this representation:

=== "Python"

    ```python title="binary_search.py"
    def binary_search_lcro(nums: list[int], target: int) -> int:
        """Binary search (left closed right open interval)"""
        # Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
        i, j = 0, len(nums)
        # Loop until the search interval is empty (when i = j, it is empty)
        while i < j:
            m = i + (j - i) // 2  # Calculate midpoint index m
            if nums[m] < target:
                i = m + 1  # This situation indicates that target is in the interval [m+1, j)
            elif nums[m] > target:
                j = m  # This situation indicates that target is in the interval [i, m)
            else:
                return m  # Found the target element, thus return its index
        return -1  # Did not find the target element, thus return -1
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* Binary search (left closed right open interval) */
    int binarySearchLCRO(vector<int> &nums, int target) {
        // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
        int i = 0, j = nums.size();
        // Loop until the search interval is empty (when i = j, it is empty)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate midpoint index m
            if (nums[m] < target)    // This situation indicates that target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This situation indicates that target is in the interval [i, m)
                j = m;
            else // Found the target element, thus return its index
                return m;
        }
        // Did not find the target element, thus return -1
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* Binary search (left closed right open interval) */
    int binarySearchLCRO(int[] nums, int target) {
        // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
        int i = 0, j = nums.length;
        // Loop until the search interval is empty (when i = j, it is empty)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate midpoint index m
            if (nums[m] < target) // This situation indicates that target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This situation indicates that target is in the interval [i, m)
                j = m;
            else // Found the target element, thus return its index
                return m;
        }
        // Did not find the target element, thus return -1
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    [class]{binary_search}-[func]{BinarySearchLCRO}
    ```

=== "Go"

    ```go title="binary_search.go"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "JS"

    ```javascript title="binary_search.js"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    [class]{}-[func]{binary_search_lcro}
    ```

=== "C"

    ```c title="binary_search.c"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    [class]{}-[func]{binarySearchLCRO}
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    [class]{}-[func]{binary_search_lcro}
    ```

=== "Zig"

    ```zig title="binary_search.zig"
    [class]{}-[func]{binarySearchLCRO}
    ```

As shown in Figure 10-3, under the two types of interval representations, the initialization, loop condition, and narrowing interval operation of the binary search algorithm differ.

Since both boundaries in the "closed interval" representation are inclusive, the operations to narrow the interval through pointers $i$ and $j$ are also symmetrical. This makes it less prone to errors, **therefore, it is generally recommended to use the "closed interval" approach**.

![Two types of interval definitions](binary_search.assets/binary_search_ranges.png){ class="animation-figure" }

<p align="center"> Figure 10-3 &nbsp; Two types of interval definitions </p>

## 10.1.2 &nbsp; Advantages and limitations

Binary search performs well in both time and space aspects.

- Binary search is time-efficient. With large dataset, the logarithmic time complexity offers a major advantage. For instance, given a dataset with size $n = 2^{20}$, linear search requires $2^{20} = 1048576$ iterations, while binary search only demands $\log_2 2^{20} = 20$ loops.
- Binary search does not need extra space. Compared to search algorithms that rely on additional space (like hash search), binary search is more space-efficient.

However, binary search may not be suitable for all scenarios due to the following concerns.

- Binary search can only be applied to sorted data. Unsorted data must be sorted before applying binary search, which may not be worthwhile as sorting algorithm typically has a time complexity of $O(n \log n)$. Such cost is even higher than linear search, not to mention binary search itself. For scenarios with frequent insertion, the cost of remaining the array in order is pretty high as the time complexity of inserting new elements into specific positions is $O(n)$.
- Binary search may use array only. Binary search requires non-continuous (jumping) element access, which is inefficient in linked list. As a result, linked list or data structures based on linked list may not be suitable for this algorithm.
- Linear search performs better on small dataset. In linear search, only 1 decision operation is required for each iteration; whereas in binary search, it involves 1 addition, 1 division, 1 to 3 decision operations, 1 addition (subtraction), totaling 4 to 6 operations. Therefore, if data size $n$ is small, linear search is faster than binary search.
