---
comments: true
---

# 11.5 &nbsp; Quick Sort

<u>Quick sort (quick sort)</u> is a sorting algorithm based on the divide-and-conquer strategy, which operates efficiently and is widely applied.

The core operation of quick sort is "sentinel partitioning", which aims to: select a certain element in the array as the "pivot", move all elements smaller than the pivot to its left, and move elements larger than the pivot to its right. Specifically, the flow of sentinel partitioning is shown in Figure 11-8.

1. Select the leftmost element of the array as the pivot, and initialize two pointers `i` and `j` pointing to the two ends of the array.
2. Set up a loop in which `i` (`j`) is used in each round to find the first element larger (smaller) than the pivot, and then swap these two elements.
3. Loop through step `2.` until `i` and `j` meet, and finally swap the pivot to the boundary line of the two sub-arrays.

=== "<1>"
    ![Sentinel partitioning steps](quick_sort.assets/pivot_division_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-8 &nbsp; Sentinel partitioning steps </p>

After sentinel partitioning is complete, the original array is divided into three parts: left sub-array, pivot, right sub-array, satisfying "any element in left sub-array $\leq$ pivot $\leq$ any element in right sub-array". Therefore, we next only need to sort these two sub-arrays.

!!! note "Divide-and-conquer strategy of quick sort"

    The essence of sentinel partitioning is to simplify the sorting problem of a longer array into the sorting problems of two shorter arrays.

=== "Python"

    ```python title="quick_sort.py"
    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Sentinel partition"""
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
    /* Sentinel partition */
    int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Search from left to right for the first element greater than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot to the boundary between the two subarrays
        return i;                   // Return the index of the pivot
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

    /* Sentinel partition */
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
    /* Swap elements */
    void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Sentinel partition */
    int Partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i;             // Return the index of the pivot
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Sentinel partition */
    func (q *quickSort) partition(nums []int, left, right int) int {
        // Use nums[left] as the pivot
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // Search from right to left for the first element smaller than the pivot
            }
            for i < j && nums[i] <= nums[left] {
                i++ // Search from left to right for the first element greater than the pivot
            }
            // Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        }
        // Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i // Return the index of the pivot
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Sentinel partition */
    func partition(nums: inout [Int], left: Int, right: Int) -> Int {
        // Use nums[left] as the pivot
        var i = left
        var j = right
        while i < j {
            while i < j, nums[j] >= nums[left] {
                j -= 1 // Search from right to left for the first element smaller than the pivot
            }
            while i < j, nums[i] <= nums[left] {
                i += 1 // Search from left to right for the first element greater than the pivot
            }
            nums.swapAt(i, j) // Swap these two elements
        }
        nums.swapAt(i, left) // Swap the pivot to the boundary between the two subarrays
        return i // Return the index of the pivot
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Swap elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Sentinel partition */
    partition(nums, left, right) {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            // Swap elements
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Swap elements */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Sentinel partition */
    partition(nums: number[], left: number, right: number): number {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            // Swap elements
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Swap elements */
    void _swap(List<int> nums, int i, int j) {
      int tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;
    }

    /* Sentinel partition */
    int _partition(List<int> nums, int left, int right) {
      // Use nums[left] as the pivot
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
        _swap(nums, i, j); // Swap these two elements
      }
      _swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
      return i; // Return the index of the pivot
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Sentinel partition */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot to the boundary between the two subarrays
        i // Return the index of the pivot
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Swap elements */
    void swap(int nums[], int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Sentinel partition */
    int partition(int nums[], int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Search from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Search from left to right for the first element greater than the pivot
            }
            // Swap these two elements
            swap(nums, i, j);
        }
        // Swap the pivot to the boundary between the two subarrays
        swap(nums, i, left);
        // Return the index of the pivot
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Swap elements */
    fun swap(nums: IntArray, i: Int, j: Int) {
        val temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }

    /* Sentinel partition */
    fun partition(nums: IntArray, left: Int, right: Int): Int {
        // Use nums[left] as the pivot
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--           // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++           // Search from left to right for the first element greater than the pivot
            swap(nums, i, j)  // Swap these two elements
        }
        swap(nums, i, left)   // Swap the pivot to the boundary between the two subarrays
        return i              // Return the index of the pivot
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Sentinel partition ###
    def partition(nums, left, right)
      # Use nums[left] as the pivot
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Search from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Search from left to right for the first element greater than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot to the boundary between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the index of the pivot
    end
    ```

## 11.5.1 &nbsp; Algorithm Flow

The overall flow of quick sort is shown in Figure 11-9.

1. First, perform one "sentinel partitioning" on the original array to obtain the unsorted left sub-array and right sub-array.
2. Then, recursively perform "sentinel partitioning" on the left sub-array and right sub-array respectively.
3. Continue recursively until the sub-array length is 1, at which point sorting of the entire array is complete.

![Quick sort flow](quick_sort.assets/quick_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-9 &nbsp; Quick sort flow </p>

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Terminate recursion when subarray length is 1
        if left >= right:
            return
        # Sentinel partition
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
        // Sentinel partition
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
        // Sentinel partition
        int pivot = partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Quick sort */
    void QuickSort(int[] nums, int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right)
            return;
        // Sentinel partition
        int pivot = Partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Quick sort */
    func (q *quickSort) quickSort(nums []int, left, right int) {
        // Terminate recursion when subarray length is 1
        if left >= right {
            return
        }
        // Sentinel partition
        pivot := q.partition(nums, left, right)
        // Recursively process the left subarray and right subarray
        q.quickSort(nums, left, pivot-1)
        q.quickSort(nums, pivot+1, right)
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Quick sort */
    func quickSort(nums: inout [Int], left: Int, right: Int) {
        // Terminate recursion when subarray length is 1
        if left >= right {
            return
        }
        // Sentinel partition
        let pivot = partition(nums: &nums, left: left, right: right)
        // Recursively process the left subarray and right subarray
        quickSort(nums: &nums, left: left, right: pivot - 1)
        quickSort(nums: &nums, left: pivot + 1, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Quick sort */
    quickSort(nums, left, right) {
        // Terminate recursion when subarray length is 1
        if (left >= right) return;
        // Sentinel partition
        const pivot = this.partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Quick sort */
    quickSort(nums: number[], left: number, right: number): void {
        // Terminate recursion when subarray length is 1
        if (left >= right) {
            return;
        }
        // Sentinel partition
        const pivot = this.partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Quick sort */
    void quickSort(List<int> nums, int left, int right) {
      // Terminate recursion when subarray length is 1
      if (left >= right) return;
      // Sentinel partition
      int pivot = _partition(nums, left, right);
      // Recursively process the left subarray and right subarray
      quickSort(nums, left, pivot - 1);
      quickSort(nums, pivot + 1, right);
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Quick sort */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Terminate recursion when subarray length is 1
        if left >= right {
            return;
        }
        // Sentinel partition
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Recursively process the left subarray and right subarray
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Quick sort */
    void quickSort(int nums[], int left, int right) {
        // Terminate recursion when subarray length is 1
        if (left >= right) {
            return;
        }
        // Sentinel partition
        int pivot = partition(nums, left, right);
        // Recursively process the left subarray and right subarray
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Quick sort */
    fun quickSort(nums: IntArray, left: Int, right: Int) {
        // Terminate recursion when subarray length is 1
        if (left >= right) return
        // Sentinel partition
        val pivot = partition(nums, left, right)
        // Recursively process the left subarray and right subarray
        quickSort(nums, left, pivot - 1)
        quickSort(nums, pivot + 1, right)
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Quick sort class ###
    def quick_sort(nums, left, right)
      # Recurse when subarray length is not 1
      if left < right
        # Sentinel partition
        pivot = partition(nums, left, right)
        # Recursively process the left subarray and right subarray
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
    ```

## 11.5.2 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: In the average case, the number of recursive levels of sentinel partitioning is $\log n$, and the total number of loops at each level is $n$, using $O(n \log n)$ time overall. In the worst case, each round of sentinel partitioning divides an array of length $n$ into two sub-arrays of length $0$ and $n - 1$, at which point the number of recursive levels reaches $n$, the number of loops at each level is $n$, and the total time used is $O(n^2)$.
- **Space complexity of $O(n)$, in-place sorting**: In the case where the input array is completely reversed, the worst recursive depth reaches $n$, using $O(n)$ stack frame space. The sorting operation is performed on the original array without the aid of an additional array.
- **Non-stable sorting**: In the last step of sentinel partitioning, the pivot may be swapped to the right of equal elements.

## 11.5.3 &nbsp; Why Is Quick Sort Fast

From the name, we can see that quick sort should have certain advantages in terms of efficiency. Although the average time complexity of quick sort is the same as "merge sort" and "heap sort", quick sort is usually more efficient, mainly for the following reasons.

- **The probability of the worst case occurring is very low**: Although the worst-case time complexity of quick sort is $O(n^2)$, which is not as stable as merge sort, in the vast majority of cases, quick sort can run with a time complexity of $O(n \log n)$.
- **High cache utilization**: When performing sentinel partitioning operations, the system can load the entire sub-array into the cache, so element access efficiency is relatively high. Algorithms like "heap sort" require jump-style access to elements, thus lacking this characteristic.
- **Small constant coefficient of complexity**: Among the three algorithms mentioned above, quick sort has the smallest total number of operations such as comparisons, assignments, and swaps. This is similar to the reason why "insertion sort" is faster than "bubble sort".

## 11.5.4 &nbsp; Pivot Optimization

**Quick sort may have reduced time efficiency for certain inputs**. Take an extreme example: suppose the input array is completely reversed. Since we select the leftmost element as the pivot, after sentinel partitioning is complete, the pivot is swapped to the rightmost end of the array, causing the left sub-array length to be $n - 1$ and the right sub-array length to be $0$. If we recurse down like this, each round of sentinel partitioning will have a sub-array length of $0$, the divide-and-conquer strategy fails, and quick sort degrades to a form approximate to "bubble sort".

To avoid this situation as much as possible, **we can optimize the pivot selection strategy in sentinel partitioning**. For example, we can randomly select an element as the pivot. However, if luck is not good and we select a non-ideal pivot every time, efficiency is still not satisfactory.

It should be noted that programming languages usually generate "pseudo-random numbers". If we construct a specific test case for a pseudo-random number sequence, the efficiency of quick sort may still degrade.

For further improvement, we can select three candidate elements in the array (usually the first, last, and middle elements of the array), **and use the median of these three candidate elements as the pivot**. In this way, the probability that the pivot is "neither too small nor too large" will be greatly increased. Of course, we can also select more candidate elements to further improve the robustness of the algorithm. After adopting this method, the probability of time complexity degrading to $O(n^2)$ is greatly reduced.

Example code is as follows:

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
        """Sentinel partition (median of three)"""
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

    /* Sentinel partition (median of three) */
    int partition(vector<int> &nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        swap(nums[left], nums[med]);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Search from left to right for the first element greater than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot to the boundary between the two subarrays
        return i;                   // Return the index of the pivot
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

    /* Sentinel partition (median of three) */
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
    /* Select the median of three candidate elements */
    int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m is between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l is between m and r
        return right;
    }

    /* Sentinel partition (median of three) */
    int Partition(int[] nums, int left, int right) {
        // Select the median of three candidate elements
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        Swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Search from left to right for the first element greater than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot to the boundary between the two subarrays
        return i;             // Return the index of the pivot
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Select the median of three candidate elements */
    func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
        l, m, r := nums[left], nums[mid], nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m is between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l is between m and r
        }
        return right
    }

    /* Sentinel partition (median of three) */
    func (q *quickSortMedian) partition(nums []int, left, right int) int {
        // Use nums[left] as the pivot
        med := q.medianThree(nums, left, (left+right)/2, right)
        // Swap the median to the array's leftmost position
        nums[left], nums[med] = nums[med], nums[left]
        // Use nums[left] as the pivot
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // Search from right to left for the first element smaller than the pivot
            }
            for i < j && nums[i] <= nums[left] {
                i++ // Search from left to right for the first element greater than the pivot
            }
            // Swap elements
            nums[i], nums[j] = nums[j], nums[i]
        }
        // Swap the pivot to the boundary between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i // Return the index of the pivot
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Select the median of three candidate elements */
    func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
        let l = nums[left]
        let m = nums[mid]
        let r = nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m is between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l is between m and r
        }
        return right
    }

    /* Sentinel partition (median of three) */
    func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
        // Select the median of three candidate elements
        let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
        // Swap the median to the array's leftmost position
        nums.swapAt(left, med)
        return partition(nums: &nums, left: left, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Select the median of three candidate elements */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m is between l and r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l is between m and r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Sentinel partition (median of three) */
    partition(nums, left, right) {
        // Select the median of three candidate elements
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Swap the median to the array's leftmost position
        this.swap(nums, left, med);
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Select the median of three candidate elements */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m is between l and r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l is between m and r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Sentinel partition (median of three) */
    partition(nums: number[], left: number, right: number): number {
        // Select the median of three candidate elements
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Swap the median to the array's leftmost position
        this.swap(nums, left, med);
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Search from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Search from left to right for the first element greater than the pivot
            }
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
        return i; // Return the index of the pivot
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Select the median of three candidate elements */
    int _medianThree(List<int> nums, int left, int mid, int right) {
      int l = nums[left], m = nums[mid], r = nums[right];
      if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m is between l and r
      if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l is between m and r
      return right;
    }

    /* Sentinel partition (median of three) */
    int _partition(List<int> nums, int left, int right) {
      // Select the median of three candidate elements
      int med = _medianThree(nums, left, (left + right) ~/ 2, right);
      // Swap the median to the array's leftmost position
      _swap(nums, left, med);
      // Use nums[left] as the pivot
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
        _swap(nums, i, j); // Swap these two elements
      }
      _swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
      return i; // Return the index of the pivot
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Select the median of three candidate elements */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m is between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l is between m and r
        }
        right
    }

    /* Sentinel partition (median of three) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Select the median of three candidate elements
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        nums.swap(left, med);
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot to the boundary between the two subarrays
        i // Return the index of the pivot
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Select the median of three candidate elements */
    int medianThree(int nums[], int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m is between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l is between m and r
        return right;
    }

    /* Sentinel partition (median of three) */
    int partitionMedian(int nums[], int left, int right) {
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

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Select the median of three candidate elements */
    fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
        val l = nums[left]
        val m = nums[mid]
        val r = nums[right]
        if ((m in l..r) || (m in r..l))
            return mid  // m is between l and r
        if ((l in m..r) || (l in r..m))
            return left // l is between m and r
        return right
    }

    /* Sentinel partition (median of three) */
    fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
        // Select the median of three candidate elements
        val med = medianThree(nums, left, (left + right) / 2, right)
        // Swap the median to the array's leftmost position
        swap(nums, left, med)
        // Use nums[left] as the pivot
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--                      // Search from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++                      // Search from left to right for the first element greater than the pivot
            swap(nums, i, j)             // Swap these two elements
        }
        swap(nums, i, left)              // Swap the pivot to the boundary between the two subarrays
        return i                         // Return the index of the pivot
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Select median of three candidate elements ###
    def median_three(nums, left, mid, right)
      # Select the median of three candidate elements
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m is between l and r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l is between m and r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### Sentinel partition (median of three) ###
    def partition(nums, left, right)
      ### Use nums[left] as pivot
      med = median_three(nums, left, (left + right) / 2, right)
      # Swap median to leftmost position of array
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Search from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Search from left to right for the first element greater than the pivot
        end
        # Swap elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot to the boundary between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the index of the pivot
    end
    ```

## 11.5.5 &nbsp; Recursive Depth Optimization

**For certain inputs, quick sort may occupy more space**. Taking a completely ordered input array as an example, let the length of the sub-array in recursion be $m$. Each round of sentinel partitioning will produce a left sub-array of length $0$ and a right sub-array of length $m - 1$, which means that the problem scale reduced per recursive call is very small (only one element is reduced), and the height of the recursion tree will reach $n - 1$, at which point $O(n)$ size of stack frame space is required.

To prevent the accumulation of stack frame space, we can compare the lengths of the two sub-arrays after each round of sentinel sorting is complete, **and only recurse on the shorter sub-array**. Since the length of the shorter sub-array will not exceed $n / 2$, this method can ensure that the recursion depth does not exceed $\log n$, thus optimizing the worst-case space complexity to $O(\log n)$. The code is as follows:

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort (recursion depth optimization)"""
        # Terminate when subarray length is 1
        while left < right:
            # Sentinel partition operation
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
    /* Quick sort (recursion depth optimization) */
    void quickSort(vector<int> &nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
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
    /* Quick sort (recursion depth optimization) */
    void quickSort(int[] nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
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
    /* Quick sort (recursion depth optimization) */
    void QuickSort(int[] nums, int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
            int pivot = Partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Recursively sort the left subarray
                left = pivot + 1;  // Remaining unsorted interval is [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Quick sort (recursion depth optimization) */
    func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
        // Terminate when subarray length is 1
        for left < right {
            // Sentinel partition operation
            pivot := q.partition(nums, left, right)
            // Perform quick sort on the shorter of the two subarrays
            if pivot-left < right-pivot {
                q.quickSort(nums, left, pivot-1) // Recursively sort the left subarray
                left = pivot + 1                 // Remaining unsorted interval is [pivot + 1, right]
            } else {
                q.quickSort(nums, pivot+1, right) // Recursively sort the right subarray
                right = pivot - 1                 // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Quick sort (recursion depth optimization) */
    func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
        var left = left
        var right = right
        // Terminate when subarray length is 1
        while left < right {
            // Sentinel partition operation
            let pivot = partition(nums: &nums, left: left, right: right)
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left) < (right - pivot) {
                quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Recursively sort the left subarray
                left = pivot + 1 // Remaining unsorted interval is [pivot + 1, right]
            } else {
                quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Recursively sort the right subarray
                right = pivot - 1 // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Quick sort (recursion depth optimization) */
    quickSort(nums, left, right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
            let pivot = this.partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Quick sort (recursion depth optimization) */
    quickSort(nums: number[], left: number, right: number): void {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
            let pivot = this.partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Quick sort (recursion depth optimization) */
    void quickSort(List<int> nums, int left, int right) {
      // Terminate when subarray length is 1
      while (left < right) {
        // Sentinel partition operation
        int pivot = _partition(nums, left, right);
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

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Quick sort (recursion depth optimization) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Terminate when subarray length is 1
        while left < right {
            // Sentinel partition operation
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Perform quick sort on the shorter of the two subarrays
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Recursively sort the left subarray
                left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Quick sort (recursion depth optimization) */
    void quickSortTailCall(int nums[], int left, int right) {
        // Terminate when subarray length is 1
        while (left < right) {
            // Sentinel partition operation
            int pivot = partition(nums, left, right);
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                // Recursively sort the left subarray
                quickSortTailCall(nums, left, pivot - 1);
                // Remaining unsorted interval is [pivot + 1, right]
                left = pivot + 1;
            } else {
                // Recursively sort the right subarray
                quickSortTailCall(nums, pivot + 1, right);
                // Remaining unsorted interval is [left, pivot - 1]
                right = pivot - 1;
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Quick sort (recursion depth optimization) */
    fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
        // Terminate when subarray length is 1
        var l = left
        var r = right
        while (l < r) {
            // Sentinel partition operation
            val pivot = partition(nums, l, r)
            // Perform quick sort on the shorter of the two subarrays
            if (pivot - l < r - pivot) {
                quickSort(nums, l, pivot - 1) // Recursively sort the left subarray
                l = pivot + 1 // Remaining unsorted interval is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, r) // Recursively sort the right subarray
                r = pivot - 1 // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Quick sort (recursion depth optimization) ###
    def quick_sort(nums, left, right)
      # Recurse when subarray length is not 1
      while left < right
        # Sentinel partition
        pivot = partition(nums, left, right)
        # Perform quick sort on the shorter of the two subarrays
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # Remaining unsorted interval is [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # Remaining unsorted interval is [left, pivot - 1]
        end
      end
    end
    ```
