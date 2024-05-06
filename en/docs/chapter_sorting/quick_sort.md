---
comments: true
---

# 11.5 &nbsp; Quick sort

<u>Quick sort</u> is a sorting algorithm based on the divide and conquer strategy, known for its efficiency and wide application.

The core operation of quick sort is "pivot partitioning," aiming to: select an element from the array as the "pivot," move all elements smaller than the pivot to its left, and move elements greater than the pivot to its right. Specifically, the pivot partitioning process is illustrated in Figure 11-8.

1. Select the leftmost element of the array as the pivot, and initialize two pointers `i` and `j` at both ends of the array.
2. Set up a loop where each round uses `i` (`j`) to find the first element larger (smaller) than the pivot, then swap these two elements.
3. Repeat step `2.` until `i` and `j` meet, finally swap the pivot to the boundary between the two sub-arrays.

=== "<1>"
    ![Pivot division process](quick_sort.assets/pivot_division_step1.png){ class="animation-figure" }

=== "<2>"
    ![pivot_division_step2](quick_sort.assets/pivot_division_step2.png){ class="animation-figure" }

=== "<3>"
    ![pivot_division_step3](quick_sort.assets/pivot_division_step3.png){ class="animation-figure" }

=== "<4>"
    ![pivot_division_step4](quick_sort.assets/pivot_division_step4.png){ class="animation-figure" }

=== "<5>"
    ![pivot_division_step5](quick_sort.assets/pivot_division_step5.png){ class="animation-figure" }

=== "<6>"
    ![pivot_division_step6](quick_sort.assets/pivot_division_step6.png){ class="animation-figure" }

=== "<7>"
    ![pivot_division_step7](quick_sort.assets/pivot_division_step7.png){ class="animation-figure" }

=== "<8>"
    ![pivot_division_step8](quick_sort.assets/pivot_division_step8.png){ class="animation-figure" }

=== "<9>"
    ![pivot_division_step9](quick_sort.assets/pivot_division_step9.png){ class="animation-figure" }

<p align="center"> Figure 11-8 &nbsp; Pivot division process </p>

After the pivot partitioning, the original array is divided into three parts: left sub-array, pivot, and right sub-array, satisfying "any element in the left sub-array $\leq$ pivot $\leq$ any element in the right sub-array." Therefore, we only need to sort these two sub-arrays next.

!!! note "Quick sort's divide and conquer strategy"

    The essence of pivot partitioning is to simplify a longer array's sorting problem into two shorter arrays' sorting problems.

=== "Python"

    ```python title="quick_sort.py"
    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Search from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Search from left to right for the first element greater than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the index of the pivot
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Swap elements */
    void swap(vector<int> &nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition */
    int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i;            // Return the index of the pivot
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Swap elements */
    void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Partition */
    int partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i;             // Return the index of the pivot
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    [class]{quickSort}-[func]{Swap}

    [class]{quickSort}-[func]{Partition}
    ```

=== "Go"

    ```go title="quick_sort.go"
    [class]{quickSort}-[func]{partition}
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    [class]{}-[func]{partition}
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    [class]{QuickSort}-[func]{swap}

    [class]{QuickSort}-[func]{partition}
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    [class]{QuickSort}-[func]{swap}

    [class]{QuickSort}-[func]{partition}
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    [class]{QuickSort}-[func]{_swap}

    [class]{QuickSort}-[func]{_partition}
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    [class]{QuickSort}-[func]{partition}
    ```

=== "C"

    ```c title="quick_sort.c"
    [class]{}-[func]{swap}

    [class]{}-[func]{partition}
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    [class]{}-[func]{swap}

    [class]{}-[func]{partition}
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSort}-[func]{partition}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    [class]{QuickSort}-[func]{swap}

    [class]{QuickSort}-[func]{partition}
    ```

## 11.5.1 &nbsp; Algorithm process

The overall process of quick sort is shown in Figure 11-9.

1. First, perform a "pivot partitioning" on the original array to obtain the unsorted left and right sub-arrays.
2. Then, recursively perform "pivot partitioning" on both the left and right sub-arrays.
3. Continue recursively until the sub-array length reaches 1, thus completing the sorting of the entire array.

![Quick sort process](quick_sort.assets/quick_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-9 &nbsp; Quick sort process </p>

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Terminate recursion when subarray length is 1
        if left >= right:
            return
        # Partition
        pivot = self.partition(nums, left, right)
        # Recursively process the left subarray and right subarray
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Quick sort */
    void quickSort(vector<int> &nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Partition
        int pivot = partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Quick sort */
    void quickSort(int[] nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Partition
        int pivot = partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    [class]{quickSort}-[func]{QuickSort}
    ```

=== "Go"

    ```go title="quick_sort.go"
    [class]{quickSort}-[func]{quickSort}
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    [class]{}-[func]{quickSort}
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    [class]{QuickSort}-[func]{quickSort}
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    [class]{QuickSort}-[func]{quickSort}
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    [class]{QuickSort}-[func]{quickSort}
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    [class]{QuickSort}-[func]{quick_sort}
    ```

=== "C"

    ```c title="quick_sort.c"
    [class]{}-[func]{quickSort}
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    [class]{}-[func]{quickSort}
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSort}-[func]{quick_sort}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    [class]{QuickSort}-[func]{quickSort}
    ```

## 11.5.2 &nbsp; Algorithm features

- **Time complexity of $O(n \log n)$, adaptive sorting**: In average cases, the recursive levels of pivot partitioning are $\log n$, and the total number of loops per level is $n$, using $O(n \log n)$ time overall. In the worst case, each round of pivot partitioning divides an array of length $n$ into two sub-arrays of lengths $0$ and $n - 1$, reaching $n$ recursive levels, and using $O(n^2)$ time overall.
- **Space complexity of $O(n)$, in-place sorting**: In completely reversed input arrays, reaching the worst recursion depth of $n$, using $O(n)$ stack frame space. The sorting operation is performed on the original array without the aid of additional arrays.
- **Non-stable sorting**: In the final step of pivot partitioning, the pivot may be swapped to the right of equal elements.

## 11.5.3 &nbsp; Why is quick sort fast

From its name, it is apparent that quick sort should have certain efficiency advantages. Although the average time complexity of quick sort is the same as "merge sort" and "heap sort," quick sort is generally more efficient, mainly for the following reasons.

- **Low probability of worst-case scenarios**: Although the worst time complexity of quick sort is $O(n^2)$, less stable than merge sort, in most cases, quick sort can operate under a time complexity of $O(n \log n)$.
- **High cache usage efficiency**: During the pivot partitioning operation, the system can load the entire sub-array into the cache, thus accessing elements more efficiently. In contrast, algorithms like "heap sort" need to access elements in a jumping manner, lacking this feature.
- **Small constant coefficient of complexity**: Among the mentioned algorithms, quick sort has the fewest total number of comparisons, assignments, and swaps. This is similar to why "insertion sort" is faster than "bubble sort."

## 11.5.4 &nbsp; Pivot optimization

**Quick sort's time efficiency may decrease under certain inputs**. For example, if the input array is completely reversed, since we select the leftmost element as the pivot, after the pivot partitioning, the pivot is swapped to the array's right end, causing the left sub-array length to be $n - 1$ and the right sub-array length to be $0$. If this recursion continues, each round of pivot partitioning will have a sub-array length of $0$, and the divide and conquer strategy fails, degrading quick sort to a form similar to "bubble sort."

To avoid this situation, **we can optimize the strategy for selecting the pivot in the pivot partitioning**. For instance, we can randomly select an element as the pivot. However, if luck is not on our side, and we keep selecting suboptimal pivots, the efficiency is still not satisfactory.

It's important to note that programming languages usually generate "pseudo-random numbers". If we construct a specific test case for a pseudo-random number sequence, the efficiency of quick sort may still degrade.

For further improvement, we can select three candidate elements (usually the first, last, and midpoint elements of the array), **and use the median of these three candidate elements as the pivot**. This significantly increases the probability that the pivot is "neither too small nor too large". Of course, we can also select more candidate elements to further enhance the algorithm's robustness. Using this method significantly reduces the probability of time complexity degradation to $O(n^2)$.

Sample code is as follows:

=== "Python"

    ```python title="quick_sort.py"
    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Select the median of three candidate elements"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m is between l and r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l is between m and r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Partition (median of three)"""
        # Use nums[left] as the pivot
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Swap the median to the array's leftmost position
        nums[left], nums[med] = nums[med], nums[left]
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Search from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Search from left to right for the first element greater than the pivot
            # Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the index of the pivot
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Select the median of three candidate elements */
    int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m is between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l is between m and r
        return right;
    }

    /* Partition (median of three) */
    int partition(vector<int> &nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i;            // Return the index of the pivot
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Select the median of three candidate elements */
    int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m is between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l is between m and r
        return right;
    }

    /* Partition (median of three) */
    int partition(int[] nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i;             // Return the index of the pivot
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    [class]{QuickSortMedian}-[func]{MedianThree}

    [class]{QuickSortMedian}-[func]{Partition}
    ```

=== "Go"

    ```go title="quick_sort.go"
    [class]{quickSortMedian}-[func]{medianThree}

    [class]{quickSortMedian}-[func]{partition}
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    [class]{}-[func]{medianThree}

    [class]{}-[func]{partitionMedian}
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    [class]{QuickSortMedian}-[func]{medianThree}

    [class]{QuickSortMedian}-[func]{partition}
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    [class]{QuickSortMedian}-[func]{medianThree}

    [class]{QuickSortMedian}-[func]{partition}
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    [class]{QuickSortMedian}-[func]{_medianThree}

    [class]{QuickSortMedian}-[func]{_partition}
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    [class]{QuickSortMedian}-[func]{median_three}

    [class]{QuickSortMedian}-[func]{partition}
    ```

=== "C"

    ```c title="quick_sort.c"
    [class]{}-[func]{medianThree}

    [class]{}-[func]{partitionMedian}
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    [class]{}-[func]{medianThree}

    [class]{}-[func]{partitionMedian}
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSortMedian}-[func]{median_three}

    [class]{QuickSortMedian}-[func]{partition}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    [class]{QuickSortMedian}-[func]{medianThree}

    [class]{QuickSortMedian}-[func]{partition}
    ```

## 11.5.5 &nbsp; Tail recursion optimization

**Under certain inputs, quick sort may occupy more space**. For a completely ordered input array, assume the sub-array length in recursion is $m$, each round of pivot partitioning produces a left sub-array of length $0$ and a right sub-array of length $m - 1$, meaning the problem size reduced per recursive call is very small (only one element), and the height of the recursion tree can reach $n - 1$, requiring $O(n)$ stack frame space.

To prevent the accumulation of stack frame space, we can compare the lengths of the two sub-arrays after each round of pivot sorting, **and only recursively sort the shorter sub-array**. Since the length of the shorter sub-array will not exceed $n / 2$, this method ensures that the recursion depth does not exceed $\log n$, thus optimizing the worst space complexity to $O(\log n)$. The code is as follows:

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort (tail recursion optimization)"""
        # Terminate when subarray length is 1
        while left < right:
            # Partition operation
            pivot = self.partition(nums, left, right)
            # Perform quick sort on the shorter of the two subarrays
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Recursively sort the left subarray
                left = pivot + 1  # Remaining unsorted interval is [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Recursively sort the right subarray
                right = pivot - 1  # Remaining unsorted interval is [left, pivot - 1]
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Quick sort (tail recursion optimization) */
    void quickSort(vector<int> &nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Partition operation
            int pivot = partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1;                 // Remaining unsorted interval is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1;                 // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Quick sort (tail recursion optimization) */
    void quickSort(int[] nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Partition operation
            int pivot = partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    [class]{QuickSortTailCall}-[func]{QuickSort}
    ```

=== "Go"

    ```go title="quick_sort.go"
    [class]{quickSortTailCall}-[func]{quickSort}
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    [class]{}-[func]{quickSortTailCall}
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    [class]{QuickSortTailCall}-[func]{quickSort}
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    [class]{QuickSortTailCall}-[func]{quickSort}
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    [class]{QuickSortTailCall}-[func]{quickSort}
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    [class]{QuickSortTailCall}-[func]{quick_sort}
    ```

=== "C"

    ```c title="quick_sort.c"
    [class]{}-[func]{quickSortTailCall}
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    [class]{}-[func]{quickSortTailCall}
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    [class]{QuickSortTailCall}-[func]{quick_sort}
    ```

=== "Zig"

    ```zig title="quick_sort.zig"
    [class]{QuickSortTailCall}-[func]{quickSort}
    ```
