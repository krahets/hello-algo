---
comments: true
---

# 11.4 &nbsp; Insertion sort

<u>Insertion sort</u> is a simple algorithm that works much like arranging a hand of playing cards.

Choose an element from the unsorted range, compare it with elements in the sorted range to its left one at a time, and insert it at the correct position.

Figure 11-6 shows how to insert an element into an array. Call the element `base`. Shift all elements from the target index up to, but excluding, `base` one position to the right. Then write `base` at the target index.

![A single insertion](insertion_sort.assets/insertion_operation.svg){ class="animation-figure" }

<p align="center"> Figure 11-6 &nbsp; A single insertion </p>

## 11.4.1 &nbsp; How the algorithm works

Figure 11-7 shows the full insertion sort procedure.

1. Initially, the first element of the array is already sorted.
2. Choose the second element as `base` and insert it at the correct position. **The first two elements are now sorted**.
3. Choose the third element as `base` and insert it at the correct position. **The first three elements are now sorted**.
4. Continue in the same way. In the final pass, choose the last element as `base` and insert it at the correct position. **All elements are now sorted**.

![Insertion sort procedure](insertion_sort.assets/insertion_sort_overview.svg){ class="animation-figure" }

<p align="center"> Figure 11-7 &nbsp; Insertion sort procedure </p>

Here is an implementation:

=== "Python"

    ```python title="insertion_sort.py"
    def insertion_sort(nums: list[int]):
        """Insertion sort"""
        # Outer loop: the sorted range is [0, i-1]
        for i in range(1, len(nums)):
            base = nums[i]
            j = i - 1
            # Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while j >= 0 and nums[j] > base:
                nums[j + 1] = nums[j]  # Shift nums[j] one position to the right
                j -= 1
            nums[j + 1] = base  # Place base at the correct position
    ```

=== "C++"

    ```cpp title="insertion_sort.cpp"
    /* Insertion sort */
    void insertionSort(vector<int> &nums) {
        // Outer loop: the sorted range is [0, i-1]
        for (int i = 1; i < nums.size(); i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
                j--;
            }
            nums[j + 1] = base; // Place base at the correct position
        }
    }
    ```

=== "Java"

    ```java title="insertion_sort.java"
    /* Insertion sort */
    void insertionSort(int[] nums) {
        // Outer loop: the sorted range is [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
                j--;
            }
            nums[j + 1] = base;        // Place base at the correct position
        }
    }
    ```

=== "C#"

    ```csharp title="insertion_sort.cs"
    /* Insertion sort */
    void InsertionSort(int[] nums) {
        // Outer loop: the sorted range is [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
                j--;
            }
            nums[j + 1] = bas;         // Place base at the correct position
        }
    }
    ```

=== "Go"

    ```go title="insertion_sort.go"
    /* Insertion sort */
    func insertionSort(nums []int) {
        // Outer loop: the sorted range is [0, i-1]
        for i := 1; i < len(nums); i++ {
            base := nums[i]
            j := i - 1
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            for j >= 0 && nums[j] > base {
                nums[j+1] = nums[j] // Shift nums[j] one position to the right
                j--
            }
            nums[j+1] = base // Place base at the correct position
        }
    }
    ```

=== "Swift"

    ```swift title="insertion_sort.swift"
    /* Insertion sort */
    func insertionSort(nums: inout [Int]) {
        // Outer loop: the sorted range is [0, i-1]
        for i in nums.indices.dropFirst() {
            let base = nums[i]
            var j = i - 1
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while j >= 0, nums[j] > base {
                nums[j + 1] = nums[j] // Shift nums[j] one position to the right
                j -= 1
            }
            nums[j + 1] = base // Place base at the correct position
        }
    }
    ```

=== "JS"

    ```javascript title="insertion_sort.js"
    /* Insertion sort */
    function insertionSort(nums) {
        // Outer loop: the sorted range is [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            let base = nums[i],
                j = i - 1;
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
                j--;
            }
            nums[j + 1] = base; // Place base at the correct position
        }
    }
    ```

=== "TS"

    ```typescript title="insertion_sort.ts"
    /* Insertion sort */
    function insertionSort(nums: number[]): void {
        // Outer loop: the sorted range is [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            const base = nums[i];
            let j = i - 1;
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
                j--;
            }
            nums[j + 1] = base; // Place base at the correct position
        }
    }
    ```

=== "Dart"

    ```dart title="insertion_sort.dart"
    /* Insertion sort */
    void insertionSort(List<int> nums) {
      // Outer loop: the sorted range is [0, i-1]
      for (int i = 1; i < nums.length; i++) {
        int base = nums[i], j = i - 1;
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while (j >= 0 && nums[j] > base) {
          nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
          j--;
        }
        nums[j + 1] = base; // Place base at the correct position
      }
    }
    ```

=== "Rust"

    ```rust title="insertion_sort.rs"
    /* Insertion sort */
    fn insertion_sort(nums: &mut [i32]) {
        // Outer loop: the sorted range is [0, i-1]
        for i in 1..nums.len() {
            let (base, mut j) = (nums[i], (i - 1) as i32);
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while j >= 0 && nums[j as usize] > base {
                nums[(j + 1) as usize] = nums[j as usize]; // Shift nums[j] one position to the right
                j -= 1;
            }
            nums[(j + 1) as usize] = base; // Place base at the correct position
        }
    }
    ```

=== "C"

    ```c title="insertion_sort.c"
    /* Insertion sort */
    void insertionSort(int nums[], int size) {
        // Outer loop: the sorted range is [0, i-1]
        for (int i = 1; i < size; i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                // Shift nums[j] one position to the right
                nums[j + 1] = nums[j];
                j--;
            }
            // Place base at the correct position
            nums[j + 1] = base;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="insertion_sort.kt"
    /* Insertion sort */
    fun insertionSort(nums: IntArray) {
        //Outer loop: the number of sorted elements runs from 1 through n
        for (i in nums.indices) {
            val base = nums[i]
            var j = i - 1
            // Inner loop: insert base at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j] // Shift nums[j] one position to the right
                j--
            }
            nums[j + 1] = base        // Place base at the correct position
        }
    }
    ```

=== "Ruby"

    ```ruby title="insertion_sort.rb"
    ### Insertion sort ###
    def insertion_sort(nums)
      n = nums.length
      # Outer loop: the sorted range is [0, i-1]
      for i in 1...n
        base = nums[i]
        j = i - 1
        # Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while j >= 0 && nums[j] > base
          nums[j + 1] = nums[j] # Shift nums[j] one position to the right
          j -= 1
        end
        nums[j + 1] = base # Place base at the correct position
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Insertion%20sort%22%22%22%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20sorted%20range%20is%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20insert%20base%20at%20the%20correct%20position%20in%20the%20sorted%20range%20%5B0,%20i-1%5D%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20Shift%20nums%5Bj%5D%20one%20position%20to%20the%20right%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20Place%20base%20at%20the%20correct%20position%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22After%20insertion%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Insertion%20sort%22%22%22%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20sorted%20range%20is%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20insert%20base%20at%20the%20correct%20position%20in%20the%20sorted%20range%20%5B0,%20i-1%5D%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20Shift%20nums%5Bj%5D%20one%20position%20to%20the%20right%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20Place%20base%20at%20the%20correct%20position%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22After%20insertion%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.4.2 &nbsp; Algorithm properties

- **Time complexity: $O(n^2)$, adaptive**. In the worst case, the insertions require $n - 1$, $n-2$, $\dots$, $2$, and $1$ iterations, respectively, adding up to $(n - 1) n / 2$. The time complexity is therefore $O(n^2)$. On ordered data, the insertion loop stops early. A fully sorted array achieves the best-case time complexity of $O(n)$.
- **Space complexity: $O(1)$, in-place**. The two indices $i$ and $j$ use a constant amount of extra space.
- **Stable**. Each insertion places the new element to the right of any equal elements, preserving their relative order.

## 11.4.3 &nbsp; Advantages of insertion sort

Insertion sort has time complexity $O(n^2)$, whereas quicksort, which we will study shortly, has time complexity $O(n \log n)$. Despite its higher time complexity, **insertion sort is usually faster on small inputs**.

This is similar to the trade-off between linear and binary search. Algorithms such as quicksort achieve $O(n \log n)$ time using divide and conquer, which often involves more elementary operations per round. For small inputs, the values of $n^2$ and $n \log n$ are close. The number of operations per round then matters more than the asymptotic growth rate.

In fact, the built-in sorts in many languages, including Java, use insertion sort. The general idea is to use a divide-and-conquer sort such as quicksort for long arrays and insertion sort directly for short arrays.

Bubble sort, selection sort, and insertion sort all have time complexity $O(n^2)$. In practice, however, **insertion sort is used far more often than either bubble sort or selection sort**, mainly for the following reasons.

- Bubble sort moves elements by swapping them. A swap with a temporary variable takes three elementary operations. Insertion sort shifts an element with a single assignment. As a result, **bubble sort usually requires more work than insertion sort**.
- Selection sort takes $O(n^2)$ time in all cases. **On partially sorted data, insertion sort is usually more efficient than selection sort**.
- Selection sort is unstable, so it cannot be used for successive sorts by different keys that must preserve earlier ordering.
