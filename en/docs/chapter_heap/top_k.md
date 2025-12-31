---
comments: true
---

# 8.3 &nbsp; Top-K Problem

!!! question

    Given an unordered array `nums` of length $n$, return the largest $k$ elements in the array.

For this problem, we'll first introduce two solutions with relatively straightforward approaches, then introduce a more efficient heap-based solution.

## 8.3.1 &nbsp; Method 1: Iterative Selection

We can perform $k$ rounds of traversal as shown in Figure 8-6, extracting the $1^{st}$, $2^{nd}$, $\dots$, $k^{th}$ largest elements in each round, with a time complexity of $O(nk)$.

This method is only suitable when $k \ll n$, because when $k$ is close to $n$, the time complexity approaches $O(n^2)$, which is very time-consuming.

![Traversing to find the largest k elements](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> Figure 8-6 &nbsp; Traversing to find the largest k elements </p>

!!! tip

    When $k = n$, we can obtain a complete sorted sequence, which is equivalent to the "selection sort" algorithm.

## 8.3.2 &nbsp; Method 2: Sorting

As shown in Figure 8-7, we can first sort the array `nums`, then return the rightmost $k$ elements, with a time complexity of $O(n \log n)$.

Clearly, this method "overachieves" the task, as we only need to find the largest $k$ elements, without needing to sort the other elements.

![Sorting to find the largest k elements](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> Figure 8-7 &nbsp; Sorting to find the largest k elements </p>

## 8.3.3 &nbsp; Method 3: Heap

We can solve the Top-k problem more efficiently using heaps, with the process shown in Figure 8-8.

1. Initialize a min heap, where the heap top element is the smallest.
2. First, insert the first $k$ elements of the array into the heap in sequence.
3. Starting from the $(k + 1)^{th}$ element, if the current element is greater than the heap top element, remove the heap top element and insert the current element into the heap.
4. After traversal is complete, the heap contains the largest $k$ elements.

=== "<1>"
    ![Finding the largest k elements using a heap](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 8-8 &nbsp; Finding the largest k elements using a heap </p>

Example code is as follows:

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """Find the largest k elements in array based on heap"""
        # Initialize min heap
        heap = []
        # Enter the first k elements of array into heap
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # Starting from the (k+1)th element, maintain heap length as k
        for i in range(k, len(nums)):
            # If current element is greater than top element, top element exits heap, current element enters heap
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* Find the largest k elements in array based on heap */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // Python's heapq module implements min heap by default
        priority_queue<int, vector<int>, greater<int>> heap;
        // Enter the first k elements of array into heap
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (int i = k; i < nums.size(); i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
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
    /* Find the largest k elements in array based on heap */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // Python's heapq module implements min heap by default
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Enter the first k elements of array into heap
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (int i = k; i < nums.length; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
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
    /* Find the largest k elements in array based on heap */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Python's heapq module implements min heap by default
        PriorityQueue<int, int> heap = new();
        // Enter the first k elements of array into heap
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (int i = k; i < nums.Length; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if (nums[i] > heap.Peek()) {
                heap.Dequeue();
                heap.Enqueue(nums[i], nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Go"

    ```go title="top_k.go"
    /* Find the largest k elements in array based on heap */
    func topKHeap(nums []int, k int) *minHeap {
        // Python's heapq module implements min heap by default
        h := &minHeap{}
        heap.Init(h)
        // Enter the first k elements of array into heap
        for i := 0; i < k; i++ {
            heap.Push(h, nums[i])
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for i := k; i < len(nums); i++ {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if nums[i] > h.Top().(int) {
                heap.Pop(h)
                heap.Push(h, nums[i])
            }
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="top_k.swift"
    /* Find the largest k elements in array based on heap */
    func topKHeap(nums: [Int], k: Int) -> [Int] {
        // Initialize min heap and build heap with first k elements
        var heap = Heap(nums.prefix(k))
        // Starting from the (k+1)th element, maintain heap length as k
        for i in nums.indices.dropFirst(k) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if nums[i] > heap.min()! {
                _ = heap.removeMin()
                heap.insert(nums[i])
            }
        }
        return heap.unordered
    }
    ```

=== "JS"

    ```javascript title="top_k.js"
    /* Element enters heap */
    function pushMinHeap(maxHeap, val) {
        // Negate element
        maxHeap.push(-val);
    }

    /* Element exits heap */
    function popMinHeap(maxHeap) {
        // Negate element
        return -maxHeap.pop();
    }

    /* Access top element */
    function peekMinHeap(maxHeap) {
        // Negate element
        return -maxHeap.peek();
    }

    /* Extract elements from heap */
    function getMinHeap(maxHeap) {
        // Negate element
        return maxHeap.getMaxHeap().map((num) => -num);
    }

    /* Find the largest k elements in array based on heap */
    function topKHeap(nums, k) {
        // Python's heapq module implements min heap by default
        // Note: We negate all heap elements to simulate min heap using max heap
        const maxHeap = new MaxHeap([]);
        // Enter the first k elements of array into heap
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (let i = k; i < nums.length; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // Return elements in heap
        return getMinHeap(maxHeap);
    }
    ```

=== "TS"

    ```typescript title="top_k.ts"
    /* Element enters heap */
    function pushMinHeap(maxHeap: MaxHeap, val: number): void {
        // Negate element
        maxHeap.push(-val);
    }

    /* Element exits heap */
    function popMinHeap(maxHeap: MaxHeap): number {
        // Negate element
        return -maxHeap.pop();
    }

    /* Access top element */
    function peekMinHeap(maxHeap: MaxHeap): number {
        // Negate element
        return -maxHeap.peek();
    }

    /* Extract elements from heap */
    function getMinHeap(maxHeap: MaxHeap): number[] {
        // Negate element
        return maxHeap.getMaxHeap().map((num: number) => -num);
    }

    /* Find the largest k elements in array based on heap */
    function topKHeap(nums: number[], k: number): number[] {
        // Python's heapq module implements min heap by default
        // Note: We negate all heap elements to simulate min heap using max heap
        const maxHeap = new MaxHeap([]);
        // Enter the first k elements of array into heap
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (let i = k; i < nums.length; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // Return elements in heap
        return getMinHeap(maxHeap);
    }
    ```

=== "Dart"

    ```dart title="top_k.dart"
    /* Find the largest k elements in array based on heap */
    MinHeap topKHeap(List<int> nums, int k) {
      // Initialize min heap, push first k elements of array to heap
      MinHeap heap = MinHeap(nums.sublist(0, k));
      // Starting from the (k+1)th element, maintain heap length as k
      for (int i = k; i < nums.length; i++) {
        // If current element is greater than top element, top element exits heap, current element enters heap
        if (nums[i] > heap.peek()) {
          heap.pop();
          heap.push(nums[i]);
        }
      }
      return heap;
    }
    ```

=== "Rust"

    ```rust title="top_k.rs"
    /* Find the largest k elements in array based on heap */
    fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
        // BinaryHeap is a max heap, use Reverse to negate elements to implement min heap
        let mut heap = BinaryHeap::<Reverse<i32>>::new();
        // Enter the first k elements of array into heap
        for &num in nums.iter().take(k) {
            heap.push(Reverse(num));
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for &num in nums.iter().skip(k) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if num > heap.peek().unwrap().0 {
                heap.pop();
                heap.push(Reverse(num));
            }
        }
        heap
    }
    ```

=== "C"

    ```c title="top_k.c"
    /* Element enters heap */
    void pushMinHeap(MaxHeap *maxHeap, int val) {
        // Negate element
        push(maxHeap, -val);
    }

    /* Element exits heap */
    int popMinHeap(MaxHeap *maxHeap) {
        // Negate element
        return -pop(maxHeap);
    }

    /* Access top element */
    int peekMinHeap(MaxHeap *maxHeap) {
        // Negate element
        return -peek(maxHeap);
    }

    /* Extract elements from heap */
    int *getMinHeap(MaxHeap *maxHeap) {
        // Negate all heap elements and store in res array
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    /* Extract elements from heap */
    int *getMinHeap(MaxHeap *maxHeap) {
        // Negate all heap elements and store in res array
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    // Function to find k largest elements in array using heap
    int *topKHeap(int *nums, int sizeNums, int k) {
        // Python's heapq module implements min heap by default
        // Note: We negate all heap elements to simulate min heap using max heap
        int *empty = (int *)malloc(0);
        MaxHeap *maxHeap = newMaxHeap(empty, 0);
        // Enter the first k elements of array into heap
        for (int i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (int i = k; i < sizeNums; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        int *res = getMinHeap(maxHeap);
        // Free memory
        delMaxHeap(maxHeap);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    /* Find the largest k elements in array based on heap */
    fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
        // Python's heapq module implements min heap by default
        val heap = PriorityQueue<Int>()
        // Enter the first k elements of array into heap
        for (i in 0..<k) {
            heap.offer(nums[i])
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (i in k..<nums.size) {
            // If current element is greater than top element, top element exits heap, current element enters heap
            if (nums[i] > heap.peek()) {
                heap.poll()
                heap.offer(nums[i])
            }
        }
        return heap
    }
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    ### Find largest k elements in array using heap ###
    def top_k_heap(nums, k)
      # Python's heapq module implements min heap by default
      # Note: We negate all heap elements to simulate min heap using max heap
      max_heap = MaxHeap.new([])

      # Enter the first k elements of array into heap
      for i in 0...k
        push_min_heap(max_heap, nums[i])
      end

      # Starting from the (k+1)th element, maintain heap length as k
      for i in k...nums.length
        # If current element is greater than top element, top element exits heap, current element enters heap
        if nums[i] > peek_min_heap(max_heap)
          pop_min_heap(max_heap)
          push_min_heap(max_heap, nums[i])
        end
      end

      get_min_heap(max_heap)
    end
    ```

A total of $n$ rounds of heap insertions and removals are performed, with the heap's maximum length being $k$, so the time complexity is $O(n \log k)$. This method is very efficient; when $k$ is small, the time complexity approaches $O(n)$; when $k$ is large, the time complexity does not exceed $O(n \log n)$.

Additionally, this method is suitable for dynamic data stream scenarios. By continuously adding data, we can maintain the elements in the heap, thus achieving dynamic updates of the largest $k$ elements.
