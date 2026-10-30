---
comments: true
---

# 10.1 &nbsp; Binary search

<u>Binary search</u> is an efficient search algorithm based on divide and conquer. It uses the sorted order of the data to halve the search range each round, continuing until it finds the target element or the search interval becomes empty.

!!! question

    Given an array `nums` of length $n$, with distinct elements arranged in ascending order, find and return the index of `target`. If the array does not contain this element, return $-1$. An example is shown below.

![Example data for binary search](binary_search.assets/binary_search_example.png){ class="animation-figure" }

<p align="center"> Figure 10-1 &nbsp; Example data for binary search </p>

As shown below, initialize pointers $i = 0$ and $j = n - 1$ to the first and last elements, respectively. They represent the search interval $[0, n - 1]$. Square brackets denote a closed interval, which includes its endpoints.

Next, repeat the following two steps.

1. Calculate the midpoint index $m = \lfloor {(i + j) / 2} \rfloor$, where $\lfloor \: \rfloor$ denotes rounding down.
2. Compare `nums[m]` with `target`. There are three cases.
    1. If `nums[m] < target`, then `target` lies in $[m + 1, j]$, so set $i = m + 1$.
    2. If `nums[m] > target`, then `target` lies in $[i, m - 1]$, so set $j = m - 1$.
    3. If `nums[m] = target`, we have found `target`, so return index $m$.

If the array does not contain the target, the search interval eventually becomes empty. Return $-1$ in this case.

=== "<1>"
    ![The binary search process](binary_search.assets/binary_search_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 10-2 &nbsp; The binary search process </p>

Because $i$ and $j$ are both of type `int`, **$i + j$ may exceed the range of `int`**. To avoid integer overflow, we usually calculate the midpoint using $m = \lfloor {i + (j - i) / 2} \rfloor$.

The implementation is shown below:

=== "Python"

    ```python title="binary_search.py"
    def binary_search(nums: list[int], target: int) -> int:
        """Binary search (closed interval)"""
        # Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        i, j = 0, len(nums) - 1
        # Loop until the search interval is empty (when i > j)
        while i <= j:
            # Python integers can grow arbitrarily large, subject to available memory, so integer overflow is not a concern
            m = (i + j) // 2  # Calculate the midpoint index m
            if nums[m] < target:
                i = m + 1  # In this case, target must be in [m+1, j] if it exists
            elif nums[m] > target:
                j = m - 1  # In this case, target must be in [i, m-1] if it exists
            else:
                return m  # The target element was found; return its index
        return -1  # The target element was not found; return -1
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* Binary search (closed interval) */
    int binarySearch(vector<int> &nums, int target) {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        int i = 0, j = nums.size() - 1;
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            else // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* Binary search (closed interval) */
    int binarySearch(int[] nums, int target) {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        int i = 0, j = nums.length - 1;
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            else // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* Binary search (closed interval) */
    int BinarySearch(int[] nums, int target) {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        int i = 0, j = nums.Length - 1;
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2;   // Calculate the midpoint index m
            if (nums[m] < target)      // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            else                       // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* Binary search (closed interval) */
    func binarySearch(nums []int, target int) int {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        i, j := 0, len(nums)-1
        // Loop until the search interval is empty (when i > j)
        for i <= j {
            m := i + (j-i)/2      // Calculate the midpoint index m
            if nums[m] < target { // In this case, target must be in [m+1, j] if it exists
                i = m + 1
            } else if nums[m] > target { // In this case, target must be in [i, m-1] if it exists
                j = m - 1
            } else { // The target element was found; return its index
                return m
            }
        }
        // The target element was not found; return -1
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* Binary search (closed interval) */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        var i = nums.startIndex
        var j = nums.endIndex - 1
        // Loop until the search interval is empty (when i > j)
        while i <= j {
            let m = i + (j - i) / 2 // Calculate the midpoint index m
            if nums[m] < target { // In this case, target must be in [m+1, j] if it exists
                i = m + 1
            } else if nums[m] > target { // In this case, target must be in [i, m-1] if it exists
                j = m - 1
            } else { // The target element was found; return its index
                return m
            }
        }
        // The target element was not found; return -1
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* Binary search (closed interval) */
    function binarySearch(nums, target) {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        let i = 0,
            j = nums.length - 1;
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            // Calculate midpoint index m, using parseInt() to round down
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            else if (nums[m] > target)
                // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            else return m; // The target element was found; return its index
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* Binary search (closed interval) */
    function binarySearch(nums: number[], target: number): number {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        let i = 0,
            j = nums.length - 1;
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            // Calculate the midpoint index m
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            } else if (nums[m] > target) {
                // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            } else {
                // The target element was found; return its index
                return m;
            }
        }
        return -1; // The target element was not found; return -1
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* Binary search (closed interval) */
    int binarySearch(List<int> nums, int target) {
      // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
      int i = 0, j = nums.length - 1;
      // Loop until the search interval is empty (when i > j)
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // Calculate the midpoint index m
        if (nums[m] < target) {
          // In this case, target must be in [m+1, j] if it exists
          i = m + 1;
        } else if (nums[m] > target) {
          // In this case, target must be in [i, m-1] if it exists
          j = m - 1;
        } else {
          // The target element was found; return its index
          return m;
        }
      }
      // The target element was not found; return -1
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* Binary search (closed interval) */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        let mut i = 0;
        let mut j = nums.len() as i32 - 1;
        // Loop until the search interval is empty (when i > j)
        while i <= j {
            let m = i + (j - i) / 2; // Calculate the midpoint index m
            if nums[m as usize] < target {
                // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            } else if nums[m as usize] > target {
                // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            } else {
                // The target element was found; return its index
                return m;
            }
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* Binary search (closed interval) */
    int binarySearch(int *nums, int len, int target) {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        int i = 0, j = len - 1;
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // In this case, target must be in [m+1, j] if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
                j = m - 1;
            else // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* Binary search (closed interval) */
    fun binarySearch(nums: IntArray, target: Int): Int {
        // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
        var i = 0
        var j = nums.size - 1
        // Loop until the search interval is empty (when i > j)
        while (i <= j) {
            val m = i + (j - i) / 2 // Calculate the midpoint index m
            if (nums[m] < target) // In this case, target must be in [m+1, j] if it exists
                i = m + 1
            else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
                j = m - 1
            else  // The target element was found; return its index
                return m
        }
        // The target element was not found; return -1
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### Binary search (closed interval) ###
    def binary_search(nums, target)
      # Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
      i, j = 0, nums.length - 1

      # Loop until the search interval is empty (when i > j)
      while i <= j
        # Ruby integers can grow arbitrarily large, limited by available memory, so integer overflow is not a concern here
        m = (i + j) / 2   # Calculate the midpoint index m
      
        if nums[m] < target
          i = m + 1 # In this case, target must be in [m+1, j] if it exists
        elsif nums[m] > target
          j = m - 1 # In this case, target must be in [i, m-1] if it exists
        else
          return m  # The target element was found; return its index
        end
      end

      -1  # The target element was not found; return -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Binary%20search%20%28closed%20interval%29%22%22%22%0A%20%20%20%20%23%20Initialize%20the%20closed%20interval%20%5B0,%20n-1%5D,%20with%20i%20and%20j%20pointing%20to%20the%20first%20and%20last%20elements%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%0A%20%20%20%20%23%20Loop%20until%20the%20search%20interval%20is%20empty%20%28when%20i%20%3E%20j%29%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20Python%20integers%20can%20grow%20arbitrarily%20large,%20subject%20to%20available%20memory,%20so%20integer%20overflow%20is%20not%20a%20concern%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bm%2B1,%20j%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bi,%20m-1%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20The%20target%20element%20was%20found%3B%20return%20its%20index%0A%20%20%20%20return%20-1%20%20%23%20The%20target%20element%20was%20not%20found%3B%20return%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20Binary%20search%20%28closed%20interval%29%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22Index%20of%20target%20element%206%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Binary%20search%20%28closed%20interval%29%22%22%22%0A%20%20%20%20%23%20Initialize%20the%20closed%20interval%20%5B0,%20n-1%5D,%20with%20i%20and%20j%20pointing%20to%20the%20first%20and%20last%20elements%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%0A%20%20%20%20%23%20Loop%20until%20the%20search%20interval%20is%20empty%20%28when%20i%20%3E%20j%29%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20%23%20Python%20integers%20can%20grow%20arbitrarily%20large,%20subject%20to%20available%20memory,%20so%20integer%20overflow%20is%20not%20a%20concern%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bm%2B1,%20j%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bi,%20m-1%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20The%20target%20element%20was%20found%3B%20return%20its%20index%0A%20%20%20%20return%20-1%20%20%23%20The%20target%20element%20was%20not%20found%3B%20return%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20Binary%20search%20%28closed%20interval%29%0A%20%20%20%20index%20%3D%20binary_search%28nums,%20target%29%0A%20%20%20%20print%28%22Index%20of%20target%20element%206%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

**Time complexity is $O(\log n)$**: the search interval is halved each round, so the loop runs $\log_2 n$ times.

**Space complexity is $O(1)$**: pointers $i$ and $j$ use constant space.

## 10.1.1 &nbsp; Ways to represent the interval

Besides the closed interval above, another common representation is a “left-closed, right-open” interval, written $[0, n)$. It includes the left endpoint but excludes the right endpoint. With this representation, $[i, j)$ is empty when $i = j$.

We can implement an equivalent binary search algorithm using this representation:

=== "Python"

    ```python title="binary_search.py"
    def binary_search_lcro(nums: list[int], target: int) -> int:
        """Binary search (left-closed, right-open interval)"""
        # Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        i, j = 0, len(nums)
        # Loop until the search interval is empty (when i = j)
        while i < j:
            m = (i + j) // 2  # Calculate the midpoint index m
            if nums[m] < target:
                i = m + 1  # In this case, target must be in [m+1, j) if it exists
            elif nums[m] > target:
                j = m  # In this case, target must be in [i, m) if it exists
            else:
                return m  # The target element was found; return its index
        return -1  # The target element was not found; return -1
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* Binary search (left-closed, right-open interval) */
    int binarySearchLCRO(vector<int> &nums, int target) {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        int i = 0, j = nums.size();
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
                j = m;
            else // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* Binary search (left-closed, right-open interval) */
    int binarySearchLCRO(int[] nums, int target) {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        int i = 0, j = nums.length;
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
                j = m;
            else // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* Binary search (left-closed, right-open interval) */
    int BinarySearchLCRO(int[] nums, int target) {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        int i = 0, j = nums.Length;
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            int m = i + (j - i) / 2;   // Calculate the midpoint index m
            if (nums[m] < target)      // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
                j = m;
            else                       // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* Binary search (left-closed, right-open interval) */
    func binarySearchLCRO(nums []int, target int) int {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        i, j := 0, len(nums)
        // Loop until the search interval is empty (when i = j)
        for i < j {
            m := i + (j-i)/2      // Calculate the midpoint index m
            if nums[m] < target { // In this case, target must be in [m+1, j) if it exists
                i = m + 1
            } else if nums[m] > target { // In this case, target must be in [i, m) if it exists
                j = m
            } else { // The target element was found; return its index
                return m
            }
        }
        // The target element was not found; return -1
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* Binary search (left-closed, right-open interval) */
    func binarySearchLCRO(nums: [Int], target: Int) -> Int {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        var i = nums.startIndex
        var j = nums.endIndex
        // Loop until the search interval is empty (when i = j)
        while i < j {
            let m = i + (j - i) / 2 // Calculate the midpoint index m
            if nums[m] < target { // In this case, target must be in [m+1, j) if it exists
                i = m + 1
            } else if nums[m] > target { // In this case, target must be in [i, m) if it exists
                j = m
            } else { // The target element was found; return its index
                return m
            }
        }
        // The target element was not found; return -1
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* Binary search (left-closed, right-open interval) */
    function binarySearchLCRO(nums, target) {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        let i = 0,
            j = nums.length;
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            // Calculate midpoint index m, using parseInt() to round down
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            else if (nums[m] > target)
                // In this case, target must be in [i, m) if it exists
                j = m;
            // The target element was found; return its index
            else return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* Binary search (left-closed, right-open interval) */
    function binarySearchLCRO(nums: number[], target: number): number {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        let i = 0,
            j = nums.length;
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            // Calculate the midpoint index m
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            } else if (nums[m] > target) {
                // In this case, target must be in [i, m) if it exists
                j = m;
            } else {
                // The target element was found; return its index
                return m;
            }
        }
        return -1; // The target element was not found; return -1
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* Binary search (left-closed, right-open interval) */
    int binarySearchLCRO(List<int> nums, int target) {
      // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
      int i = 0, j = nums.length;
      // Loop until the search interval is empty (when i = j)
      while (i < j) {
        int m = i + (j - i) ~/ 2; // Calculate the midpoint index m
        if (nums[m] < target) {
          // In this case, target must be in [m+1, j) if it exists
          i = m + 1;
        } else if (nums[m] > target) {
          // In this case, target must be in [i, m) if it exists
          j = m;
        } else {
          // The target element was found; return its index
          return m;
        }
      }
      // The target element was not found; return -1
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* Binary search (left-closed, right-open interval) */
    fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        let mut i = 0;
        let mut j = nums.len() as i32;
        // Loop until the search interval is empty (when i = j)
        while i < j {
            let m = i + (j - i) / 2; // Calculate the midpoint index m
            if nums[m as usize] < target {
                // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            } else if nums[m as usize] > target {
                // In this case, target must be in [i, m) if it exists
                j = m;
            } else {
                // The target element was found; return its index
                return m;
            }
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* Binary search (left-closed, right-open interval) */
    int binarySearchLCRO(int *nums, int len, int target) {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        int i = 0, j = len;
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // In this case, target must be in [m+1, j) if it exists
                i = m + 1;
            else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
                j = m;
            else // The target element was found; return its index
                return m;
        }
        // The target element was not found; return -1
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* Binary search (left-closed, right-open interval) */
    fun binarySearchLCRO(nums: IntArray, target: Int): Int {
        // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
        var i = 0
        var j = nums.size
        // Loop until the search interval is empty (when i = j)
        while (i < j) {
            val m = i + (j - i) / 2 // Calculate the midpoint index m
            if (nums[m] < target) // In this case, target must be in [m+1, j) if it exists
                i = m + 1
            else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
                j = m
            else  // The target element was found; return its index
                return m
        }
        // The target element was not found; return -1
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### Binary search (left-closed, right-open interval) ###
    def binary_search_lcro(nums, target)
      # Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
      i, j = 0, nums.length

      # Loop until the search interval is empty (when i = j)
      while i < j
        # Calculate the midpoint index m
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # In this case, target must be in [m+1, j) if it exists
        elsif nums[m] > target
          j = m - 1 # In this case, target must be in [i, m) if it exists
        else
          return m  # The target element was found; return its index
        end
      end

      -1  # The target element was not found; return -1
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Binary%20search%20%28left-closed,%20right-open%20interval%29%22%22%22%0A%20%20%20%20%23%20Initialize%20the%20left-closed,%20right-open%20interval%20%5B0,%20n%29,%20with%20i%20at%20the%20first%20element%20and%20j%20one%20past%20the%20last%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%0A%20%20%20%20%23%20Loop%20until%20the%20search%20interval%20is%20empty%20%28when%20i%20%3D%20j%29%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bm%2B1,%20j%29%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bi,%20m%29%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20The%20target%20element%20was%20found%3B%20return%20its%20index%0A%20%20%20%20return%20-1%20%20%23%20The%20target%20element%20was%20not%20found%3B%20return%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20Binary%20search%20%28left-closed,%20right-open%20interval%29%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums,%20target%29%0A%20%20%20%20print%28%22Index%20of%20target%20element%206%20%3D%20%22,%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_lcro%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Binary%20search%20%28left-closed,%20right-open%20interval%29%22%22%22%0A%20%20%20%20%23%20Initialize%20the%20left-closed,%20right-open%20interval%20%5B0,%20n%29,%20with%20i%20at%20the%20first%20element%20and%20j%20one%20past%20the%20last%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%0A%20%20%20%20%23%20Loop%20until%20the%20search%20interval%20is%20empty%20%28when%20i%20%3D%20j%29%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bm%2B1,%20j%29%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20%20%23%20In%20this%20case,%20target%20must%20be%20in%20%5Bi,%20m%29%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20The%20target%20element%20was%20found%3B%20return%20its%20index%0A%20%20%20%20return%20-1%20%20%23%20The%20target%20element%20was%20not%20found%3B%20return%20-1%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%208,%2012,%2015,%2023,%2026,%2031,%2035%5D%0A%0A%20%20%20%20%23%20Binary%20search%20%28left-closed,%20right-open%20interval%29%0A%20%20%20%20index%20%3D%20binary_search_lcro%28nums,%20target%29%0A%20%20%20%20print%28%22Index%20of%20target%20element%206%20%3D%20%22,%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

As shown below, the two interval representations require different initialization, loop conditions, and operations for narrowing the interval.

Since a closed interval includes both endpoints, the operations that narrow the interval through pointers $i$ and $j$ are symmetric. This makes mistakes less likely, **so we generally recommend the closed-interval version**.

![Two ways to define the interval](binary_search.assets/binary_search_ranges.png){ class="animation-figure" }

<p align="center"> Figure 10-3 &nbsp; Two ways to define the interval </p>

## 10.1.2 &nbsp; Strengths and limitations

Binary search performs well in both time and space.

- Binary search is time-efficient. Its logarithmic time complexity offers a significant advantage for large datasets. For example, when $n = 2^{20}$, linear search requires $2^{20} = 1048576$ iterations, whereas binary search needs only $\log_2 2^{20} = 20$.
- Binary search requires no extra storage. It uses less space than search algorithms that rely on additional storage, such as hash lookup.

However, binary search is not suitable in every situation, mainly for the following reasons.

- Binary search requires sorted data. Sorting unsorted input solely to perform a binary search is not worthwhile, because sorting usually takes $O(n \log n)$ time, more than either linear or binary search. When insertions are frequent, preserving the array's order requires inserting each element at a specific position, an expensive $O(n)$ operation.
- Binary search is suitable only for arrays. It needs to jump between nonadjacent elements, which is inefficient in a linked list. It is therefore unsuitable for linked lists and data structures based on them.
- Linear search performs better on small datasets. Each iteration of linear search needs only one comparison. Binary search needs one addition, one division, 1–3 comparisons, and one more addition or subtraction, totaling 4–6 elementary operations. When $n$ is small, linear search can therefore be faster.
