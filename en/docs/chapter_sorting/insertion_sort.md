---
comments: true
---

# 11.4 &nbsp; Insertion sort

<u>Insertion sort</u> is a simple sorting algorithm that works much like arranging a hand of playing cards.

Choose a base element from the unsorted section, compare it with the elements in the sorted section to its left, and insert it into the correct position.

Figure 11-6 shows how to insert an element into an array. Let the base element be `base`. Shift all elements between the target index and `base` one position to the right, then assign `base` to the target index.

![A single insertion operation](insertion_sort.assets/insertion_operation.png){ class="animation-figure" }

<p align="center"> Figure 11-6 &nbsp; A single insertion operation </p>

## 11.4.1 &nbsp; Algorithm steps

The overall insertion sort process is shown below.

1. Initially, the first element of the array is treated as sorted.
2. Select the second element as `base` and insert it into the correct position. **The first two elements are now sorted**.
3. Select the third element as `base` and insert it into the correct position. **The first three elements are now sorted**.
4. Continue in this way. In the final round, select the last element as `base` and insert it into the correct position. **All elements are now sorted**.

![The insertion sort process](insertion_sort.assets/insertion_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-7 &nbsp; The insertion sort process </p>

An implementation follows:

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
            // Inner loop: insert bas at the correct position in the sorted range [0, i-1]
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // Shift nums[j] one position to the right
                j--;
            }
            nums[j + 1] = bas;         // Place bas at the correct position
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
        //Outer loop: the sorted prefix grows to 1, 2, ..., n elements
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

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Insertion%20sort%22%22%22%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20sorted%20range%20is%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20insert%20base%20at%20the%20correct%20position%20in%20the%20sorted%20range%20%5B0,%20i-1%5D%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20Shift%20nums%5Bj%5D%20one%20position%20to%20the%20right%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20Place%20base%20at%20the%20correct%20position%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22After%20insertion%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Insertion%20sort%22%22%22%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20sorted%20range%20is%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20insert%20base%20at%20the%20correct%20position%20in%20the%20sorted%20range%20%5B0,%20i-1%5D%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20Shift%20nums%5Bj%5D%20one%20position%20to%20the%20right%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20Place%20base%20at%20the%20correct%20position%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22After%20insertion%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.4.2 &nbsp; Algorithm properties

- **Time complexity: $O(n^2)$; adaptive**. In the worst case, the insertion operations require $n - 1$, $n-2$, $\dots$, $2$, and $1$ iterations, totaling $(n - 1) n / 2$, so the time complexity is $O(n^2)$. For ordered data, an insertion can stop early. A fully sorted input achieves the best-case time complexity of $O(n)$.
- **Space complexity: $O(1)$; in-place**. Pointers $i$ and $j$ use constant extra space.
- **Stable**. Each element is inserted to the right of equal elements, preserving their order.

## 11.4.3 &nbsp; Why use insertion sort?

Insertion sort takes $O(n^2)$ time, while quick sort, which we will study shortly, takes $O(n \log n)$. Despite its higher time complexity, **insertion sort is usually faster for small datasets**.

This resembles the comparison between linear and binary search. Algorithms such as quick sort, with $O(n \log n)$ time complexity, use divide and conquer and tend to involve more elementary operations. When the dataset is small, $n^2$ and $n \log n$ are relatively close, so asymptotic complexity is not the dominant factor; the number of elementary operations per round matters more.

In fact, the built-in sorting functions of many programming languages, such as Java, use insertion sort. The general approach is to use a divide-and-conquer algorithm such as quick sort for long arrays and insertion sort directly for short ones.

Although bubble sort, selection sort, and insertion sort all take $O(n^2)$ time, **insertion sort is used much more often in practice**, mainly for the following reasons.

- Bubble sort swaps elements, using a temporary variable and three elementary operations. Insertion sort shifts elements by assignment, requiring just one operation. **Bubble sort therefore usually has higher computational overhead**.
- Selection sort takes $O(n^2)$ time in every case. **For partially sorted data, insertion sort is usually more efficient than selection sort**.
- Selection sort is not stable and therefore cannot be used for multilevel sorting.
