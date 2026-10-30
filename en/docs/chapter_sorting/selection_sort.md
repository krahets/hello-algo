---
comments: true
---

# 11.2 &nbsp; Selection sort

<u>Selection sort</u> works very simply: in each round, select the smallest element from the unsorted section and place it at the end of the sorted section.

For an array of length $n$, the algorithm proceeds as shown below.

1. Initially, all elements are unsorted, so the unsorted index interval is $[0, n-1]$.
2. Select the smallest element in $[0, n-1]$ and swap it with the element at index $0$. The first element is now sorted.
3. Select the smallest element in $[1, n-1]$ and swap it with the element at index $1$. The first two elements are now sorted.
4. Continue in this way. After $n - 1$ rounds of selection and swapping, the first $n - 1$ elements are sorted.
5. The remaining element must be the largest and needs no sorting. The array is now sorted.

=== "<1>"
    ![Steps of selection sort](selection_sort.assets/selection_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png){ class="animation-figure" }

<p align="center"> Figure 11-2 &nbsp; Steps of selection sort </p>

In the code, $k$ tracks the smallest element in the unsorted section:

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """Selection sort"""
        n = len(nums)
        # Outer loop: the unsorted range is [i, n-1]
        for i in range(n - 1):
            # Inner loop: find the smallest element in the unsorted range
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # Record the index of the smallest element
            # Swap the smallest element with the first element of the unsorted range
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    /* Selection sort */
    void selectionSort(vector<int> &nums) {
        int n = nums.size();
        // Outer loop: the unsorted range is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element in the unsorted range
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            swap(nums[i], nums[k]);
        }
    }
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* Selection sort */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // Outer loop: the unsorted range is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element in the unsorted range
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    /* Selection sort */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // Outer loop: the unsorted range is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element in the unsorted range
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }
    ```

=== "Go"

    ```go title="selection_sort.go"
    /* Selection sort */
    func selectionSort(nums []int) {
        n := len(nums)
        // Outer loop: the unsorted range is [i, n-1]
        for i := 0; i < n-1; i++ {
            // Inner loop: find the smallest element in the unsorted range
            k := i
            for j := i + 1; j < n; j++ {
                if nums[j] < nums[k] {
                    // Record the index of the smallest element
                    k = j
                }
            }
            // Swap the smallest element with the first element of the unsorted range
            nums[i], nums[k] = nums[k], nums[i]

        }
    }
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    /* Selection sort */
    func selectionSort(nums: inout [Int]) {
        // Outer loop: the unsorted range is [i, n-1]
        for i in nums.indices.dropLast() {
            // Inner loop: find the smallest element in the unsorted range
            var k = i
            for j in nums.indices.dropFirst(i + 1) {
                if nums[j] < nums[k] {
                    k = j // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted range
            nums.swapAt(i, k)
        }
    }
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    /* Selection sort */
    function selectionSort(nums) {
        let n = nums.length;
        // Outer loop: the unsorted range is [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element in the unsorted range
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted range
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    /* Selection sort */
    function selectionSort(nums: number[]): void {
        let n = nums.length;
        // Outer loop: the unsorted range is [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element in the unsorted range
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted range
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    /* Selection sort */
    void selectionSort(List<int> nums) {
      int n = nums.length;
      // Outer loop: the unsorted range is [i, n-1]
      for (int i = 0; i < n - 1; i++) {
        // Inner loop: find the smallest element in the unsorted range
        int k = i;
        for (int j = i + 1; j < n; j++) {
          if (nums[j] < nums[k]) k = j; // Record the index of the smallest element
        }
        // Swap the smallest element with the first element of the unsorted range
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
      }
    }
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    /* Selection sort */
    fn selection_sort(nums: &mut [i32]) {
        if nums.is_empty() {
            return;
        }
        let n = nums.len();
        // Outer loop: the unsorted range is [i, n-1]
        for i in 0..n - 1 {
            // Inner loop: find the smallest element in the unsorted range
            let mut k = i;
            for j in i + 1..n {
                if nums[j] < nums[k] {
                    k = j; // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted range
            nums.swap(i, k);
        }
    }
    ```

=== "C"

    ```c title="selection_sort.c"
    /* Selection sort */
    void selectionSort(int nums[], int n) {
        // Outer loop: the unsorted range is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element in the unsorted range
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="selection_sort.kt"
    /* Selection sort */
    fun selectionSort(nums: IntArray) {
        val n = nums.size
        // Outer loop: the unsorted range is [i, n-1]
        for (i in 0..<n - 1) {
            var k = i
            // Inner loop: find the smallest element in the unsorted range
            for (j in i + 1..<n) {
                if (nums[j] < nums[k])
                    k = j // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            val temp = nums[i]
            nums[i] = nums[k]
            nums[k] = temp
        }
    }
    ```

=== "Ruby"

    ```ruby title="selection_sort.rb"
    ### Selection sort ###
    def selection_sort(nums)
      n = nums.length
      # Outer loop: the unsorted range is [i, n-1]
      for i in 0...(n - 1)
        # Inner loop: find the smallest element in the unsorted range
        k = i
        for j in (i + 1)...n
          if nums[j] < nums[k]
            k = j # Record the index of the smallest element
          end
        end
        # Swap the smallest element with the first element of the unsorted range
        nums[i], nums[k] = nums[k], nums[i]
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Selection%20sort%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20find%20the%20smallest%20element%20in%20the%20unsorted%20range%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20Record%20the%20index%20of%20the%20smallest%20element%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20smallest%20element%20with%20the%20first%20element%20of%20the%20unsorted%20range%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22After%20selection%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Selection%20sort%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20find%20the%20smallest%20element%20in%20the%20unsorted%20range%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20Record%20the%20index%20of%20the%20smallest%20element%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20smallest%20element%20with%20the%20first%20element%20of%20the%20unsorted%20range%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22After%20selection%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.2.1 &nbsp; Algorithm properties

- **Time complexity: $O(n^2)$; not adaptive**. The outer loop runs $n - 1$ times. The inner loop runs $n - 1$ times in the first round and $1$ time in the last, giving successive counts of $n - 1$, $n - 2$, $\dots$, $2$, and $1$, which sum to $\frac{n(n - 1)}{2}$.
- **Space complexity: $O(1)$; in-place**. Pointers $i$ and $j$ use constant extra space.
- **Not stable**. As shown below, `nums[i]` may be swapped to the right of an equal element, changing their relative order.

![An example showing that selection sort is not stable](selection_sort.assets/selection_sort_instability.png){ class="animation-figure" }

<p align="center"> Figure 11-3 &nbsp; An example showing that selection sort is not stable </p>
