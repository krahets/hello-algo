---
comments: true
---

# 8.3 &nbsp; Top-k problem

!!! question

    Given an unordered array `nums` of length $n$, return the largest $k$ elements in the array.

For this problem, we will first introduce two straightforward solutions, then explain a more efficient heap-based method.

## 8.3.1 &nbsp; Method 1: Iterative selection

We can perform $k$ rounds of iterations as shown in Figure 8-6, extracting the $1^{st}$, $2^{nd}$, $\dots$, $k^{th}$ largest elements in each round, with a time complexity of $O(nk)$.

This method is only suitable when $k \ll n$, as the time complexity approaches $O(n^2)$ when $k$ is close to $n$, which is very time-consuming.

![Iteratively finding the largest k elements](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> Figure 8-6 &nbsp; Iteratively finding the largest k elements </p>

!!! tip

    When $k = n$, we can obtain a complete ordered sequence, which is equivalent to the "selection sort" algorithm.

## 8.3.2 &nbsp; Method 2: Sorting

As shown in Figure 8-7, we can first sort the array `nums` and then return the last $k$ elements, with a time complexity of $O(n \log n)$.

Clearly, this method "overachieves" the task, as we only need to find the largest $k$ elements, without the need to sort the other elements.

![Sorting to find the largest k elements](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> Figure 8-7 &nbsp; Sorting to find the largest k elements </p>

## 8.3.3 &nbsp; Method 3: Heap

We can solve the Top-k problem more efficiently based on heaps, as shown in the following process.

1. Initialize a min heap, where the top element is the smallest.
2. First, insert the first $k$ elements of the array into the heap.
3. Starting from the $k + 1^{th}$ element, if the current element is greater than the top element of the heap, remove the top element of the heap and insert the current element into the heap.
4. After completing the traversal, the heap contains the largest $k$ elements.

=== "<1>"
    ![Find the largest k elements based on heap](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

=== "<2>"
    ![top_k_heap_step2](top_k.assets/top_k_heap_step2.png){ class="animation-figure" }

=== "<3>"
    ![top_k_heap_step3](top_k.assets/top_k_heap_step3.png){ class="animation-figure" }

=== "<4>"
    ![top_k_heap_step4](top_k.assets/top_k_heap_step4.png){ class="animation-figure" }

=== "<5>"
    ![top_k_heap_step5](top_k.assets/top_k_heap_step5.png){ class="animation-figure" }

=== "<6>"
    ![top_k_heap_step6](top_k.assets/top_k_heap_step6.png){ class="animation-figure" }

=== "<7>"
    ![top_k_heap_step7](top_k.assets/top_k_heap_step7.png){ class="animation-figure" }

=== "<8>"
    ![top_k_heap_step8](top_k.assets/top_k_heap_step8.png){ class="animation-figure" }

=== "<9>"
    ![top_k_heap_step9](top_k.assets/top_k_heap_step9.png){ class="animation-figure" }

<p align="center"> Figure 8-8 &nbsp; Find the largest k elements based on heap </p>

Example code is as follows:

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """Using heap to find the largest k elements in an array"""
        # Initialize min-heap
        heap = []
        # Enter the first k elements of the array into the heap
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # From the k+1th element, keep the heap length as k
        for i in range(k, len(nums)):
            # If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* Using heap to find the largest k elements in an array */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // Initialize min-heap
        priority_queue<int, vector<int>, greater<int>> heap;
        // Enter the first k elements of the array into the heap
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // From the k+1th element, keep the heap length as k
        for (int i = k; i < nums.size(); i++) {
            // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
            if (nums[i] > heap.top()) {
                heap.pop();
                heap.push(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Java"

    ```java title="top_k.java"
    /* Using heap to find the largest k elements in an array */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // Initialize min-heap
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Enter the first k elements of the array into the heap
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // From the k+1th element, keep the heap length as k
        for (int i = k; i < nums.length; i++) {
            // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
            if (nums[i] > heap.peek()) {
                heap.poll();
                heap.offer(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "C#"

    ```csharp title="top_k.cs"
    [class]{top_k}-[func]{TopKHeap}
    ```

=== "Go"

    ```go title="top_k.go"
    [class]{}-[func]{topKHeap}
    ```

=== "Swift"

    ```swift title="top_k.swift"
    [class]{}-[func]{topKHeap}
    ```

=== "JS"

    ```javascript title="top_k.js"
    [class]{}-[func]{pushMinHeap}

    [class]{}-[func]{popMinHeap}

    [class]{}-[func]{peekMinHeap}

    [class]{}-[func]{getMinHeap}

    [class]{}-[func]{topKHeap}
    ```

=== "TS"

    ```typescript title="top_k.ts"
    [class]{}-[func]{pushMinHeap}

    [class]{}-[func]{popMinHeap}

    [class]{}-[func]{peekMinHeap}

    [class]{}-[func]{getMinHeap}

    [class]{}-[func]{topKHeap}
    ```

=== "Dart"

    ```dart title="top_k.dart"
    [class]{}-[func]{topKHeap}
    ```

=== "Rust"

    ```rust title="top_k.rs"
    [class]{}-[func]{top_k_heap}
    ```

=== "C"

    ```c title="top_k.c"
    [class]{}-[func]{pushMinHeap}

    [class]{}-[func]{popMinHeap}

    [class]{}-[func]{peekMinHeap}

    [class]{}-[func]{getMinHeap}

    [class]{}-[func]{topKHeap}
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    [class]{}-[func]{topKHeap}
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    [class]{}-[func]{top_k_heap}
    ```

=== "Zig"

    ```zig title="top_k.zig"
    [class]{}-[func]{topKHeap}
    ```

A total of $n$ rounds of heap insertions and deletions are performed, with the maximum heap size being $k$, hence the time complexity is $O(n \log k)$. This method is very efficient; when $k$ is small, the time complexity tends towards $O(n)$; when $k$ is large, the time complexity will not exceed $O(n \log n)$.

Additionally, this method is suitable for scenarios with dynamic data streams. By continuously adding data, we can maintain the elements within the heap, thereby achieving dynamic updates of the largest $k$ elements.
