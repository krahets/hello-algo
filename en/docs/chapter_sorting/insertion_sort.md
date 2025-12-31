---
comments: true
---

# 11.4 &nbsp; Insertion Sort

<u>Insertion sort (insertion sort)</u> is a simple sorting algorithm that works very similarly to the process of manually organizing a deck of cards.

Specifically, we select a base element from the unsorted interval, compare the element with elements in the sorted interval to its left one by one, and insert the element into the correct position.

Figure 11-6 shows the operation flow of inserting an element into the array. Let the base element be `base`. We need to move all elements from the target index to `base` one position to the right, and then assign `base` to the target index.

![Single insertion operation](insertion_sort.assets/insertion_operation.png){ class="animation-figure" }

<p align="center"> Figure 11-6 &nbsp; Single insertion operation </p>

## 11.4.1 &nbsp; Algorithm Flow

The overall flow of insertion sort is shown in Figure 11-7.

1. Initially, the first element of the array has completed sorting.
2. Select the second element of the array as `base`, and after inserting it into the correct position, **the first 2 elements of the array are sorted**.
3. Select the third element as `base`, and after inserting it into the correct position, **the first 3 elements of the array are sorted**.
4. And so on. In the last round, select the last element as `base`, and after inserting it into the correct position, **all elements are sorted**.

![Insertion sort flow](insertion_sort.assets/insertion_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-7 &nbsp; Insertion sort flow </p>

Example code is as follows:

=== "Python"

    ```python title="insertion_sort.py"
    def insertion_sort(nums: list[int]):
        """Insertion sort"""
        # Outer loop: sorted interval is [0, i-1]
        for i in range(1, len(nums)):
            base = nums[i]
            j = i - 1
            # Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while j >= 0 and nums[j] > base:
                nums[j + 1] = nums[j]  # Move nums[j] to the right by one position
                j -= 1
            nums[j + 1] = base  # Assign base to the correct position
    ```

=== "C++"

    ```cpp title="insertion_sort.cpp"
    /* Insertion sort */
    void insertionSort(vector<int> &nums) {
        // Outer loop: sorted interval is [0, i-1]
        for (int i = 1; i < nums.size(); i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = base; // Assign base to the correct position
        }
    }
    ```

=== "Java"

    ```java title="insertion_sort.java"
    /* Insertion sort */
    void insertionSort(int[] nums) {
        // Outer loop: sorted interval is [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = base;        // Assign base to the correct position
        }
    }
    ```

=== "C#"

    ```csharp title="insertion_sort.cs"
    /* Insertion sort */
    void InsertionSort(int[] nums) {
        // Outer loop: sorted interval is [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = bas;         // Assign base to the correct position
        }
    }
    ```

=== "Go"

    ```go title="insertion_sort.go"
    /* Insertion sort */
    func insertionSort(nums []int) {
        // Outer loop: sorted interval is [0, i-1]
        for i := 1; i < len(nums); i++ {
            base := nums[i]
            j := i - 1
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            for j >= 0 && nums[j] > base {
                nums[j+1] = nums[j] // Move nums[j] to the right by one position
                j--
            }
            nums[j+1] = base // Assign base to the correct position
        }
    }
    ```

=== "Swift"

    ```swift title="insertion_sort.swift"
    /* Insertion sort */
    func insertionSort(nums: inout [Int]) {
        // Outer loop: sorted interval is [0, i-1]
        for i in nums.indices.dropFirst() {
            let base = nums[i]
            var j = i - 1
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while j >= 0, nums[j] > base {
                nums[j + 1] = nums[j] // Move nums[j] to the right by one position
                j -= 1
            }
            nums[j + 1] = base // Assign base to the correct position
        }
    }
    ```

=== "JS"

    ```javascript title="insertion_sort.js"
    /* Insertion sort */
    function insertionSort(nums) {
        // Outer loop: sorted interval is [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            let base = nums[i],
                j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = base; // Assign base to the correct position
        }
    }
    ```

=== "TS"

    ```typescript title="insertion_sort.ts"
    /* Insertion sort */
    function insertionSort(nums: number[]): void {
        // Outer loop: sorted interval is [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            const base = nums[i];
            let j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = base; // Assign base to the correct position
        }
    }
    ```

=== "Dart"

    ```dart title="insertion_sort.dart"
    /* Insertion sort */
    void insertionSort(List<int> nums) {
      // Outer loop: sorted interval is [0, i-1]
      for (int i = 1; i < nums.length; i++) {
        int base = nums[i], j = i - 1;
        // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
        while (j >= 0 && nums[j] > base) {
          nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
          j--;
        }
        nums[j + 1] = base; // Assign base to the correct position
      }
    }
    ```

=== "Rust"

    ```rust title="insertion_sort.rs"
    /* Insertion sort */
    fn insertion_sort(nums: &mut [i32]) {
        // Outer loop: sorted interval is [0, i-1]
        for i in 1..nums.len() {
            let (base, mut j) = (nums[i], (i - 1) as i32);
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while j >= 0 && nums[j as usize] > base {
                nums[(j + 1) as usize] = nums[j as usize]; // Move nums[j] to the right by one position
                j -= 1;
            }
            nums[(j + 1) as usize] = base; // Assign base to the correct position
        }
    }
    ```

=== "C"

    ```c title="insertion_sort.c"
    /* Insertion sort */
    void insertionSort(int nums[], int size) {
        // Outer loop: sorted interval is [0, i-1]
        for (int i = 1; i < size; i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > base) {
                // Move nums[j] to the right by one position
                nums[j + 1] = nums[j];
                j--;
            }
            // Assign base to the correct position
            nums[j + 1] = base;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="insertion_sort.kt"
    /* Insertion sort */
    fun insertionSort(nums: IntArray) {
        // Outer loop: sorted elements are 1, 2, ..., n
        for (i in nums.indices) {
            val base = nums[i]
            var j = i - 1
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j] // Move nums[j] to the right by one position
                j--
            }
            nums[j + 1] = base        // Assign base to the correct position
        }
    }
    ```

=== "Ruby"

    ```ruby title="insertion_sort.rb"
    ### Insertion sort ###
    def insertion_sort(nums)
      n = nums.length
      # Outer loop: sorted interval is [0, i-1]
      for i in 1...n
        base = nums[i]
        j = i - 1
        # Inner loop: insert base into the correct position within the sorted interval [0, i-1]
        while j >= 0 && nums[j] > base
          nums[j + 1] = nums[j] # Move nums[j] to the right by one position
          j -= 1
        end
        nums[j + 1] = base # Assign base to the correct position
      end
    end
    ```

## 11.4.2 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n^2)$, adaptive sorting**: In the worst case, each insertion operation requires loops of $n - 1$, $n-2$, $\dots$, $2$, $1$, summing to $(n - 1) n / 2$, so the time complexity is $O(n^2)$. When encountering ordered data, the insertion operation will terminate early. When the input array is completely ordered, insertion sort achieves the best-case time complexity of $O(n)$.
- **Space complexity of $O(1)$, in-place sorting**: Pointers $i$ and $j$ use a constant amount of extra space.
- **Stable sorting**: During the insertion operation process, we insert elements to the right of equal elements, without changing their order.

## 11.4.3 &nbsp; Advantages of Insertion Sort

The time complexity of insertion sort is $O(n^2)$, while the time complexity of quick sort, which we will learn about next, is $O(n \log n)$. Although insertion sort has a higher time complexity, **insertion sort is usually faster for smaller data volumes**.

This conclusion is similar to the applicable situations of linear search and binary search. Algorithms like quick sort with $O(n \log n)$ complexity are sorting algorithms based on divide-and-conquer strategy and often contain more unit computation operations. When the data volume is small, $n^2$ and $n \log n$ are numerically close, and complexity does not dominate; the number of unit operations per round plays a decisive role.

In fact, the built-in sorting functions in many programming languages (such as Java) adopt insertion sort. The general approach is: for long arrays, use sorting algorithms based on divide-and-conquer strategy, such as quick sort; for short arrays, directly use insertion sort.

Although bubble sort, selection sort, and insertion sort all have a time complexity of $O(n^2)$, in actual situations, **insertion sort is used significantly more frequently than bubble sort and selection sort**, mainly for the following reasons.

- Bubble sort is based on element swapping, requiring the use of a temporary variable, involving 3 unit operations; insertion sort is based on element assignment, requiring only 1 unit operation. Therefore, **the computational overhead of bubble sort is usually higher than that of insertion sort**.
- Selection sort has a time complexity of $O(n^2)$ in any case. **If given a set of partially ordered data, insertion sort is usually more efficient than selection sort**.
- Selection sort is unstable and cannot be applied to multi-level sorting.
