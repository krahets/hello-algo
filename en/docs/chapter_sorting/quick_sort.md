---
comments: true
---

# 11.5 &nbsp; Quick sort

<u>Quick sort</u> is an efficient, widely used sorting algorithm based on divide and conquer.

Its core operation is “partitioning”: choose an array element as the “pivot,” move all smaller elements to its left, and move all larger elements to its right. The partitioning process is shown below.

1. Choose the leftmost element as the pivot and initialize pointers `i` and `j` at the two ends of the array.
2. In a loop, use `i` to find the first element greater than the pivot and `j` to find the first element smaller than it, then swap those elements.
3. Repeat step `2.` until `i` and `j` meet. Finally, swap the pivot into the boundary between the two subarrays.

=== "<1>"
    ![Steps of partitioning](quick_sort.assets/pivot_division_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-8 &nbsp; Steps of partitioning </p>

After partitioning, the original array has three parts: the left subarray, the pivot, and the right subarray. Every element in the left subarray is $\leq$ the pivot, which is $\leq$ every element in the right subarray. We now need only sort the two subarrays.

!!! note "Quick sort's divide-and-conquer strategy"

    Partitioning reduces the problem of sorting one long array to sorting two shorter arrays.

=== "Python"

    ```python title="quick_sort.py"
    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Two-pointer partitioning"""
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Two-pointer partitioning */
    int partition(vector<int> &nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Scan from left to right for the first element larger than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot into the boundary position between the two subarrays
        return i;                   // Return the pivot index
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Swap the elements */
    void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Two-pointer partitioning */
    int partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i;             // Return the pivot index
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Swap the elements */
    void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Two-pointer partitioning */
    int Partition(int[] nums, int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i;             // Return the pivot index
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Two-pointer partitioning */
    func (q *quickSort) partition(nums []int, left, right int) int {
        // Use nums[left] as the pivot
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // Scan from right to left for the first element smaller than the pivot
            }
            for i < j && nums[i] <= nums[left] {
                i++ // Scan from left to right for the first element larger than the pivot
            }
            // Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        }
        // Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i // Return the pivot index
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Two-pointer partitioning */
    func partition(nums: inout [Int], left: Int, right: Int) -> Int {
        // Use nums[left] as the pivot
        var i = left
        var j = right
        while i < j {
            while i < j, nums[j] >= nums[left] {
                j -= 1 // Scan from right to left for the first element smaller than the pivot
            }
            while i < j, nums[i] <= nums[left] {
                i += 1 // Scan from left to right for the first element larger than the pivot
            }
            nums.swapAt(i, j) // Swap these two elements
        }
        nums.swapAt(i, left) // Swap the pivot into the boundary position between the two subarrays
        return i // Return the pivot index
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Swap the elements */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Two-pointer partitioning */
    partition(nums, left, right) {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            // Swap the elements
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
        return i; // Return the pivot index
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Swap the elements */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Two-pointer partitioning */
    partition(nums: number[], left: number, right: number): number {
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            // Swap the elements
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
        return i; // Return the pivot index
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Swap the elements */
    void _swap(List<int> nums, int i, int j) {
      int tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;
    }

    /* Two-pointer partitioning */
    int _partition(List<int> nums, int left, int right) {
      // Use nums[left] as the pivot
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // Scan from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left]) i++; // Scan from left to right for the first element larger than the pivot
        _swap(nums, i, j); // Swap these two elements
      }
      _swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
      return i; // Return the pivot index
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Two-pointer partitioning */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot into the boundary position between the two subarrays
        i // Return the pivot index
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Swap the elements */
    void swap(int nums[], int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Two-pointer partitioning */
    int partition(int nums[], int left, int right) {
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Scan from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Scan from left to right for the first element larger than the pivot
            }
            // Swap these two elements
            swap(nums, i, j);
        }
        // Swap the pivot into the boundary position between the two subarrays
        swap(nums, i, left);
        // Return the pivot index
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Swap the elements */
    fun swap(nums: IntArray, i: Int, j: Int) {
        val temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }

    /* Two-pointer partitioning */
    fun partition(nums: IntArray, left: Int, right: Int): Int {
        // Use nums[left] as the pivot
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--           // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++           // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j)  // Swap these two elements
        }
        swap(nums, i, left)   // Swap the pivot into the boundary position between the two subarrays
        return i              // Return the pivot index
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Two-pointer partitioning ###
    def partition(nums, left, right)
      # Use nums[left] as the pivot
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Scan from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Scan from left to right for the first element larger than the pivot
        end
        # Swap the elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot into the boundary position between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the pivot index
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20two-pointer%20partitioning,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20two-pointer%20partitioning,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.5.1 &nbsp; Algorithm steps

The overall quick sort process is shown below.

1. Partition the original array to obtain unsorted left and right subarrays.
2. Recursively partition the left and right subarrays.
3. Continue until each subarray has length 1, completing the sort.

![The quick sort process](quick_sort.assets/quick_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-9 &nbsp; The quick sort process </p>

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort"""
        # Stop recursing when the subarray has at most one element
        if left >= right:
            return
        # Two-pointer partitioning
        pivot = self.partition(nums, left, right)
        # Recurse on the left and right subarrays
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Quick sort */
    void quickSort(vector<int> &nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Quick sort */
    void quickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Quick sort */
    void QuickSort(int[] nums, int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right)
            return;
        // Two-pointer partitioning
        int pivot = Partition(nums, left, right);
        // Recurse on the left and right subarrays
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Quick sort */
    func (q *quickSort) quickSort(nums []int, left, right int) {
        // Stop recursing when the subarray has at most one element
        if left >= right {
            return
        }
        // Two-pointer partitioning
        pivot := q.partition(nums, left, right)
        // Recurse on the left and right subarrays
        q.quickSort(nums, left, pivot-1)
        q.quickSort(nums, pivot+1, right)
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Quick sort */
    func quickSort(nums: inout [Int], left: Int, right: Int) {
        // Stop recursing when the subarray has at most one element
        if left >= right {
            return
        }
        // Two-pointer partitioning
        let pivot = partition(nums: &nums, left: left, right: right)
        // Recurse on the left and right subarrays
        quickSort(nums: &nums, left: left, right: pivot - 1)
        quickSort(nums: &nums, left: pivot + 1, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Quick sort */
    quickSort(nums, left, right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right) return;
        // Two-pointer partitioning
        const pivot = this.partition(nums, left, right);
        // Recurse on the left and right subarrays
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Quick sort */
    quickSort(nums: number[], left: number, right: number): void {
        // Stop recursing when the subarray has zero or one element
        if (left >= right) {
            return;
        }
        // Two-pointer partitioning
        const pivot = this.partition(nums, left, right);
        // Recurse on the left and right subarrays
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Quick sort */
    void quickSort(List<int> nums, int left, int right) {
      // Stop recursing when the subarray has at most one element
      if (left >= right) return;
      // Two-pointer partitioning
      int pivot = _partition(nums, left, right);
      // Recurse on the left and right subarrays
      quickSort(nums, left, pivot - 1);
      quickSort(nums, pivot + 1, right);
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Quick sort */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Stop recursing when the subarray has at most one element
        if left >= right {
            return;
        }
        // Two-pointer partitioning
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Recurse on the left and right subarrays
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Quick sort */
    void quickSort(int nums[], int left, int right) {
        // Stop recursing when the subarray has at most one element
        if (left >= right) {
            return;
        }
        // Two-pointer partitioning
        int pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Quick sort */
    fun quickSort(nums: IntArray, left: Int, right: Int) {
        // Stop recursing when the subarray has at most one element
        if (left >= right) return
        // Two-pointer partitioning
        val pivot = partition(nums, left, right)
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1)
        quickSort(nums, pivot + 1, right)
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Quick sort ###
    def quick_sort(nums, left, right)
      # Continue while the subarray contains more than one element
      if left < right
        # Two-pointer partitioning
        pivot = partition(nums, left, right)
        # Recurse on the left and right subarrays
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22Quick%20sort%22%22%22%0A%20%20%20%20%23%20Stop%20recursing%20when%20the%20subarray%20has%20at%20most%20one%20element%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Two-pointer%20partitioning%0A%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%23%20Recurse%20on%20the%20left%20and%20right%20subarrays%0A%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Quick%20sort%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20quick%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22Quick%20sort%22%22%22%0A%20%20%20%20%23%20Stop%20recursing%20when%20the%20subarray%20has%20at%20most%20one%20element%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Two-pointer%20partitioning%0A%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%23%20Recurse%20on%20the%20left%20and%20right%20subarrays%0A%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Quick%20sort%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20quick%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.5.2 &nbsp; Algorithm properties

- **Time complexity: $O(n \log n)$; not adaptive**. On average, partitioning produces $\log n$ recursive levels, with $n$ loop iterations in total at each level, giving $O(n \log n)$ time. In the worst case, each partition splits an array of length $n$ into subarrays of lengths $0$ and $n - 1$. The recursion reaches $n$ levels, each involving up to $n$ iterations, for $O(n^2)$ time overall.
- **Space complexity: $O(n)$; in-place**. A fully reverse-sorted input reaches the worst-case recursion depth of $n$, requiring $O(n)$ space for stack frames. Sorting takes place in the original array without an auxiliary array.
- **Not stable**. In the final partitioning step, the pivot may be swapped to the right of an equal element.

## 11.5.3 &nbsp; Why is quick sort quick?

As its name suggests, quick sort has an efficiency advantage. Although its average time complexity matches that of merge sort and heap sort, it is usually faster, mainly for the following reasons.

- **The worst case is unlikely**. Quick sort's worst-case time complexity is $O(n^2)$, making its performance less predictable than merge sort's, but it runs in $O(n \log n)$ time in the vast majority of cases.
- **Efficient cache use**. During partitioning, the system can load the whole subarray into cache, making element access efficient. Algorithms such as heap sort jump between elements and do not share this advantage.
- **Small constant factors**. Of these three algorithms, quick sort performs the fewest comparisons, assignments, swaps, and similar operations overall. This resembles the reason insertion sort is faster than bubble sort.

## 11.5.4 &nbsp; Improving pivot selection

**Quick sort can become slower on certain inputs**. Consider a fully reverse-sorted array. Because the leftmost element is chosen as the pivot, partitioning moves it to the far right, leaving subarrays of lengths $n - 1$ and $0$. Continuing recursively produces a subarray of length $0$ after every partition. Divide and conquer becomes ineffective, and quick sort degenerates into a process resembling bubble sort.

To reduce this risk, **we can improve how the pivot is selected**. For example, choose a random element as the pivot. With bad luck, however, every pivot may still be poor, leading to disappointing performance.

Programming languages generally produce pseudorandom numbers. A test case constructed specifically for a pseudorandom sequence can still degrade quick sort's performance.

For further improvement, choose three candidate elements, usually the first, last, and middle elements, **and use their median as the pivot**. This greatly increases the chance that the pivot is neither too small nor too large. We can use more candidates to improve robustness further. This approach greatly reduces the likelihood of degradation to $O(n^2)$.

An implementation follows:

=== "Python"

    ```python title="quick_sort.py"
    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Select the median of three candidate elements"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m lies between l and r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l lies between m and r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Two-pointer partitioning (median of three)"""
        # Select the median of the leftmost, middle, and rightmost elements as the pivot
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Swap the median into the leftmost position of the current subarray
        nums[left], nums[med] = nums[med], nums[left]
        # Use nums[left] as the pivot
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Scan from right to left for the first element smaller than the pivot
            while i < j and nums[i] <= nums[left]:
                i += 1  # Scan from left to right for the first element larger than the pivot
            # Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        # Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Return the pivot index
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Select the median of three candidate elements */
    int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    int partition(vector<int> &nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        swap(nums[left], nums[med]);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;                // Scan from left to right for the first element larger than the pivot
            swap(nums[i], nums[j]); // Swap these two elements
        }
        swap(nums[i], nums[left]);  // Swap the pivot into the boundary position between the two subarrays
        return i;                   // Return the pivot index
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Select the median of three candidate elements */
    int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    int partition(int[] nums, int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i;             // Return the pivot index
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Select the median of three candidate elements */
    int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    int Partition(int[] nums, int left, int right) {
        // Select the median of three candidate elements
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        Swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            Swap(nums, i, j); // Swap these two elements
        }
        Swap(nums, i, left);  // Swap the pivot into the boundary position between the two subarrays
        return i;             // Return the pivot index
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Select the median of three candidate elements */
    func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
        l, m, r := nums[left], nums[mid], nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m lies between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l lies between m and r
        }
        return right
    }

    /* Two-pointer partitioning (median of three)*/
    func (q *quickSortMedian) partition(nums []int, left, right int) int {
        // Select the median of the left, middle, and right elements as the pivot
        med := q.medianThree(nums, left, (left+right)/2, right)
        // Swap the median into the leftmost position of the current subarray
        nums[left], nums[med] = nums[med], nums[left]
        // Use nums[left] as the pivot
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- //Scan from right to left for the first element smaller than the pivot
            }
            for i < j && nums[i] <= nums[left] {
                i++ //Scan from left to right for the first element larger than the pivot
            }
            //Swap the elements
            nums[i], nums[j] = nums[j], nums[i]
        }
        //Swap the pivot into the boundary position between the two subarrays
        nums[i], nums[left] = nums[left], nums[i]
        return i //Return the pivot index
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
            return mid // m lies between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l lies between m and r
        }
        return right
    }

    /* Two-pointer partitioning (median of three) */
    func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
        // Select the median of three candidate elements
        let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
        // Swap the median into the leftmost position of the current subarray
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
        // m lies between l and r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l lies between m and r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    partition(nums, left, right) {
        // Select the median of three candidate elements
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Swap the median into the leftmost position of the current subarray
        this.swap(nums, left, med);
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left]) i++; // Scan from left to right for the first element larger than the pivot
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
        return i; // Return the pivot index
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
        // m lies between l and r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l lies between m and r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    partition(nums: number[], left: number, right: number): number {
        // Select the median of three candidate elements
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Swap the median into the leftmost position of the current subarray
        this.swap(nums, left, med);
        // Use nums[left] as the pivot
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Scan from right to left for the first element smaller than the pivot
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Scan from left to right for the first element larger than the pivot
            }
            this.swap(nums, i, j); // Swap these two elements
        }
        this.swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
        return i; // Return the pivot index
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Select the median of three candidate elements */
    int _medianThree(List<int> nums, int left, int mid, int right) {
      int l = nums[left], m = nums[mid], r = nums[right];
      if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m lies between l and r
      if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l lies between m and r
      return right;
    }

    /* Two-pointer partitioning (median of three) */
    int _partition(List<int> nums, int left, int right) {
      // Select the median of three candidate elements
      int med = _medianThree(nums, left, (left + right) ~/ 2, right);
      // Swap the median into the leftmost position of the current subarray
      _swap(nums, left, med);
      // Use nums[left] as the pivot
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // Scan from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left]) i++; // Scan from left to right for the first element larger than the pivot
        _swap(nums, i, j); // Swap these two elements
      }
      _swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
      return i; // Return the pivot index
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Select the median of three candidate elements */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m lies between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l lies between m and r
        }
        right
    }

    /* Two-pointer partitioning (median of three) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Select the median of three candidate elements
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        nums.swap(left, med);
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot into the boundary position between the two subarrays
        i // Return the pivot index
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Select the median of three candidate elements */
    int medianThree(int nums[], int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    /* Two-pointer partitioning (median of three) */
    int partitionMedian(int nums[], int left, int right) {
        // Select the median of three candidate elements
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the array
        swap(nums, left, med);
        // Use nums[left] as the pivot
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++;          // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j); // Swap these two elements
        }
        swap(nums, i, left); // Swap the pivot into the boundary position between the two subarrays
        return i;            // Return the pivot index
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
            return mid  // m lies between l and r
        if ((l in m..r) || (l in r..m))
            return left // l lies between m and r
        return right
    }

    /* Two-pointer partitioning (median of three) */
    fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
        // Select the median of three candidate elements
        val med = medianThree(nums, left, (left + right) / 2, right)
        // Swap the median into the leftmost position of the current subarray
        swap(nums, left, med)
        // Use nums[left] as the pivot
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--                      // Scan from right to left for the first element smaller than the pivot
            while (i < j && nums[i] <= nums[left])
                i++                      // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j)             // Swap these two elements
        }
        swap(nums, i, left)              // Swap the pivot into the boundary position between the two subarrays
        return i                         // Return the pivot index
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Select the median of three candidate elements ###
    def median_three(nums, left, mid, right)
      # Select the median of three candidate elements
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # _m lies between _l and _r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # _l lies between _m and _r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### Two-pointer partitioning (median of three)###
    def partition(nums, left, right)
      ### Use nums[left] as the pivot
      med = median_three(nums, left, (left + right) / 2, right)
      # Swap the median into the leftmost position of the current subarray
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Scan from right to left for the first element smaller than the pivot
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Scan from left to right for the first element larger than the pivot
        end
        # Swap the elements
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Swap the pivot into the boundary position between the two subarrays
      nums[i], nums[left] = nums[left], nums[i]
      i # Return the pivot index
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Select%20the%20median%20of%20three%20candidate%20elements%22%22%22%0A%20%20%20%20l,%20m,%20r%20%3D%20nums%5Bleft%5D,%20nums%5Bmid%5D,%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%20lies%20between%20l%20and%20r%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%20lies%20between%20m%20and%20r%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%20%28median%20of%20three%29%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20med%20%3D%20median_three%28nums,%20left,%20%28left%20%2B%20right%29%20//%202,%20right%29%0A%20%20%20%20%23%20Swap%20the%20median%20into%20the%20leftmost%20position%20of%20the%20current%20subarray%0A%20%20%20%20nums%5Bleft%5D,%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D,%20nums%5Bleft%5D%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Median-of-three%20pivot%20optimization%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20partitioning%20with%20a%20median-of-three%20pivot,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Select%20the%20median%20of%20three%20candidate%20elements%22%22%22%0A%20%20%20%20l,%20m,%20r%20%3D%20nums%5Bleft%5D,%20nums%5Bmid%5D,%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%20lies%20between%20l%20and%20r%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%20lies%20between%20m%20and%20r%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%20%28median%20of%20three%29%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20med%20%3D%20median_three%28nums,%20left,%20%28left%20%2B%20right%29%20//%202,%20right%29%0A%20%20%20%20%23%20Swap%20the%20median%20into%20the%20leftmost%20position%20of%20the%20current%20subarray%0A%20%20%20%20nums%5Bleft%5D,%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D,%20nums%5Bleft%5D%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Median-of-three%20pivot%20optimization%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20partition%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20partitioning%20with%20a%20median-of-three%20pivot,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.5.5 &nbsp; Reducing recursion depth

**Quick sort may use considerable space on certain inputs**. For a fully sorted input, let the current subarray have length $m$. Each partition produces a left subarray of length $0$ and a right subarray of length $m - 1$. Each recursive call therefore reduces the problem size by only one element, producing a recursion tree of height $n - 1$ and requiring $O(n)$ space for stack frames.

To prevent stack frames from accumulating, compare the two subarray lengths after each partition and **recurse only on the shorter one**. Since that subarray has length at most $n / 2$, the recursion depth is at most $\log n$, reducing the worst-case space complexity to $O(\log n)$. The code is as follows:

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Quick sort (recursion depth optimization)"""
        # Stop when the subarray has at most one element
        while left < right:
            # Perform two-pointer partitioning
            pivot = self.partition(nums, left, right)
            # Apply quick sort to the shorter of the two subarrays
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Recursively sort the left subarray
                left = pivot + 1  # The remaining unsorted range is [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Recursively sort the right subarray
                right = pivot - 1  # The remaining unsorted range is [left, pivot - 1]
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Quick sort (recursion depth optimization) */
    void quickSort(vector<int> &nums, int left, int right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            int pivot = partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1;                 // The remaining unsorted range is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1;                 // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Quick sort (recursion depth optimization) */
    void quickSort(int[] nums, int left, int right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            int pivot = partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Quick sort (recursion depth optimization) */
    void QuickSort(int[] nums, int left, int right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            int pivot = Partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Recursively sort the left subarray
                left = pivot + 1;  // The remaining unsorted range is [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Quick sort (recursion depth optimization)*/
    func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
        // Stop when the subarray has at most one element
        for left < right {
            // Perform two-pointer partitioning
            pivot := q.partition(nums, left, right)
            // Apply quick sort to the shorter of the two subarrays
            if pivot-left < right-pivot {
                q.quickSort(nums, left, pivot-1) // Recursively sort the left subarray
                left = pivot + 1                 // The remaining unsorted range is [pivot + 1, right]
            } else {
                q.quickSort(nums, pivot+1, right) // Recursively sort the right subarray
                right = pivot - 1                 // The remaining unsorted range is [left, pivot - 1]
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
        // Stop when the subarray has at most one element
        while left < right {
            // Perform two-pointer partitioning
            let pivot = partition(nums: &nums, left: left, right: right)
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left) < (right - pivot) {
                quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Recursively sort the left subarray
                left = pivot + 1 // The remaining unsorted range is [pivot + 1, right]
            } else {
                quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Recursively sort the right subarray
                right = pivot - 1 // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Quick sort (recursion depth optimization) */
    quickSort(nums, left, right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            let pivot = this.partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Quick sort (recursion depth optimization) */
    quickSort(nums: number[], left: number, right: number): void {
        // Stop when the subarray has zero or one element
        while (left < right) {
            // Perform two-pointer partitioning
            let pivot = this.partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Quick sort (recursion depth optimization) */
    void quickSort(List<int> nums, int left, int right) {
      // Stop when the subarray has at most one element
      while (left < right) {
        // Perform two-pointer partitioning
        int pivot = _partition(nums, left, right);
        // Apply quick sort to the shorter of the two subarrays
        if (pivot - left < right - pivot) {
          quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
          left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
        } else {
          quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
          right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
        }
      }
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Quick sort (recursion depth optimization) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Stop when the subarray has at most one element
        while left < right {
            // Perform two-pointer partitioning
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Apply quick sort to the shorter of the two subarrays
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Quick sort (recursion depth optimization) */
    void quickSortTailCall(int nums[], int left, int right) {
        // Stop when the subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            int pivot = partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                // Recursively sort the left subarray
                quickSortTailCall(nums, left, pivot - 1);
                // The remaining unsorted range is [pivot + 1, right]
                left = pivot + 1;
            } else {
                // Recursively sort the right subarray
                quickSortTailCall(nums, pivot + 1, right);
                // The remaining unsorted range is [left, pivot - 1]
                right = pivot - 1;
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Quick sort (recursion depth optimization) */
    fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
        // Stop when the subarray has at most one element
        var l = left
        var r = right
        while (l < r) {
            // Perform two-pointer partitioning
            val pivot = partition(nums, l, r)
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - l < r - pivot) {
                quickSort(nums, l, pivot - 1) // Recursively sort the left subarray
                l = pivot + 1 // The remaining unsorted range is [pivot + 1, r]
            } else {
                quickSort(nums, pivot + 1, r) // Recursively sort the right subarray
                r = pivot - 1 // The remaining unsorted range is [l, pivot - 1]
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
    ### Quick sort (recursion depth optimization)###
    def quick_sort(nums, left, right)
      # Continue while the subarray contains more than one element
      while left < right
        # Two-pointer partitioning
        pivot = partition(nums, left, right)
        # Apply quick sort to the shorter of the two subarrays
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # The remaining unsorted range is [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # The remaining unsorted range is [left, pivot - 1]
        end
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22Quick%20sort%20%28recursion%20depth%20optimization%29%22%22%22%0A%20%20%20%20%23%20Stop%20when%20the%20subarray%20has%20at%20most%20one%20element%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20%23%20Perform%20two-pointer%20partitioning%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%20%20%20%20%23%20Apply%20quick%20sort%20to%20the%20shorter%20of%20the%20two%20subarrays%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%20%20%23%20Recursively%20sort%20the%20left%20subarray%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%20%20%23%20The%20remaining%20unsorted%20range%20is%20%5Bpivot%20%2B%201,%20right%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%20%20%23%20Recursively%20sort%20the%20right%20subarray%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%20%20%23%20The%20remaining%20unsorted%20range%20is%20%5Bleft,%20pivot%20-%201%5D%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Quick%20sort%20%28recursion%20depth%20optimization%29%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20quick%20sort%20with%20recursion%20depth%20optimization,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Two-pointer%20partitioning%22%22%22%0A%20%20%20%20%23%20Partition%20using%20the%20pivot%20stored%20at%20nums%5Bleft%5D%0A%20%20%20%20i,%20j%20%3D%20left,%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20Scan%20from%20right%20to%20left%20for%20the%20first%20element%20smaller%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20Scan%20from%20left%20to%20right%20for%20the%20first%20element%20larger%20than%20the%20pivot%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20elements%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bj%5D%20%3D%20nums%5Bj%5D,%20nums%5Bi%5D%0A%20%20%20%20%23%20Swap%20the%20pivot%20into%20the%20boundary%20position%20between%20the%20two%20subarrays%0A%20%20%20%20nums%5Bi%5D,%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D,%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20Return%20the%20pivot%20index%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22Quick%20sort%20%28recursion%20depth%20optimization%29%22%22%22%0A%20%20%20%20%23%20Stop%20when%20the%20subarray%20has%20at%20most%20one%20element%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20%23%20Perform%20two-pointer%20partitioning%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums,%20left,%20right%29%0A%20%20%20%20%20%20%20%20%23%20Apply%20quick%20sort%20to%20the%20shorter%20of%20the%20two%20subarrays%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20left,%20pivot%20-%201%29%20%20%23%20Recursively%20sort%20the%20left%20subarray%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%20%20%23%20The%20remaining%20unsorted%20range%20is%20%5Bpivot%20%2B%201,%20right%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums,%20pivot%20%2B%201,%20right%29%20%20%23%20Recursively%20sort%20the%20right%20subarray%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%20%20%23%20The%20remaining%20unsorted%20range%20is%20%5Bleft,%20pivot%20-%201%5D%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Quick%20sort%20%28recursion%20depth%20optimization%29%0A%20%20%20%20nums%20%3D%20%5B2,%204,%201,%200,%203,%205%5D%0A%20%20%20%20quick_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22After%20quick%20sort%20with%20recursion%20depth%20optimization,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>
