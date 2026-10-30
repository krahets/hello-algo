---
comments: true
---

# 8.3 &nbsp; The top-k problem

!!! question

    Given an unsorted array `nums` of length $n$, return its largest $k$ elements.

We first introduce two straightforward solutions, then a more efficient solution using a heap.

## 8.3.1 &nbsp; Method 1: Repeated selection

As shown below, scan the array $k$ times, selecting the $1$st, $2$nd, $\dots$, and $k$th largest elements in successive rounds. This takes $O(nk)$ time.

This method is suitable only when $k \ll n$. As $k$ approaches $n$, its time complexity approaches $O(n^2)$, making it very slow.

![Finding the largest k elements by repeated scans](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> Figure 8-6 &nbsp; Finding the largest k elements by repeated scans </p>

!!! tip

    When $k = n$, this produces a fully sorted sequence and is equivalent to selection sort.

## 8.3.2 &nbsp; Method 2: Sorting

As shown below, sort `nums` and return its rightmost $k$ elements. This takes $O(n \log n)$ time.

This method does more work than necessary: we need only the largest $k$ elements, not a sorted order for all the others.

![Finding the largest k elements by sorting](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> Figure 8-7 &nbsp; Finding the largest k elements by sorting </p>

## 8.3.3 &nbsp; Method 3: A heap

A heap solves the top-k problem more efficiently, following the steps below.

1. Initialize a min heap, whose root holds its smallest element.
2. Insert the first $k$ array elements into the heap one by one.
3. Starting with element $k + 1$, if the current element is larger than the root, remove the root and insert the current element.
4. After the traversal, the heap contains the largest $k$ elements.

=== "<1>"
    ![Finding the largest k elements with a heap](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 8-8 &nbsp; Finding the largest k elements with a heap </p>

An implementation follows:

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """Use a heap to find the k largest elements in an array"""
        # Initialize a min heap
        heap = []
        # Push the first k array elements onto the heap
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # Starting with element k+1, keep the heap size at k
        for i in range(k, len(nums)):
            # If the current element is larger than the heap top, pop the top element and push the current element
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* Use a heap to find the k largest elements in an array */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // Initialize a min heap
        priority_queue<int, vector<int>, greater<int>> heap;
        // Push the first k array elements onto the heap
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // Starting with element k+1, keep the heap size at k
        for (int i = k; i < nums.size(); i++) {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Use a heap to find the k largest elements in an array */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // Initialize a min heap
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Push the first k array elements onto the heap
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // Starting with element k+1, keep the heap size at k
        for (int i = k; i < nums.length; i++) {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Use a heap to find the k largest elements in an array */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Initialize a min heap
        PriorityQueue<int, int> heap = new();
        // Push the first k array elements onto the heap
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // Starting with element k+1, keep the heap size at k
        for (int i = k; i < nums.Length; i++) {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Use a heap to find the k largest elements in an array */
    func topKHeap(nums []int, k int) *minHeap {
        // Initialize a min heap
        h := &minHeap{}
        heap.Init(h)
        // Push the first k array elements onto the heap
        for i := 0; i < k; i++ {
            heap.Push(h, nums[i])
        }
        // Starting with element k+1, keep the heap size at k
        for i := k; i < len(nums); i++ {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Use a heap to find the k largest elements in an array */
    func topKHeap(nums: [Int], k: Int) -> [Int] {
        // Build a heap from the first k elements and use it as a min heap
        var heap = Heap(nums.prefix(k))
        // Starting with element k+1, keep the heap size at k
        for i in nums.indices.dropFirst(k) {
            // If the current element exceeds the heap minimum, remove the minimum and insert the current element
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
    /* Push an element onto the heap */
    function pushMinHeap(maxHeap, val) {
        // Negate the value
        maxHeap.push(-val);
    }

    /* Pop an element from the heap */
    function popMinHeap(maxHeap) {
        // Negate the value
        return -maxHeap.pop();
    }

    /* Access the top element of the heap */
    function peekMinHeap(maxHeap) {
        // Negate the value
        return -maxHeap.peek();
    }

    /* Get the elements in the heap */
    function getMinHeap(maxHeap) {
        // Negate the value
        return maxHeap.getMaxHeap().map((num) => -num);
    }

    /* Use a heap to find the k largest elements in an array */
    function topKHeap(nums, k) {
        // Initialize a min heap
        // Note: negate all values in the heap to simulate a min heap with a max heap
        const maxHeap = new MaxHeap([]);
        // Push the first k array elements onto the heap
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Starting with element k+1, keep the heap size at k
        for (let i = k; i < nums.length; i++) {
            // If the current element is larger than the heap top, pop the top element and push the current element
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // Return the elements in the heap
        return getMinHeap(maxHeap);
    }
    ```

=== "TS"

    ```typescript title="top_k.ts"
    /* Push an element onto the heap */
    function pushMinHeap(maxHeap: MaxHeap, val: number): void {
        // Negate the value
        maxHeap.push(-val);
    }

    /* Pop an element from the heap */
    function popMinHeap(maxHeap: MaxHeap): number {
        // Negate the value
        return -maxHeap.pop();
    }

    /* Access the top element of the heap */
    function peekMinHeap(maxHeap: MaxHeap): number {
        // Negate the value
        return -maxHeap.peek();
    }

    /* Get the elements in the heap */
    function getMinHeap(maxHeap: MaxHeap): number[] {
        // Negate the value
        return maxHeap.getMaxHeap().map((num: number) => -num);
    }

    /* Use a heap to find the k largest elements in an array */
    function topKHeap(nums: number[], k: number): number[] {
        // Initialize a min heap
        // Note: negate all values in the heap to simulate a min heap with a max heap
        const maxHeap = new MaxHeap([]);
        // Push the first k array elements onto the heap
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Starting with element k+1, keep the heap size at k
        for (let i = k; i < nums.length; i++) {
            // If the current element is larger than the heap top, pop the top element and push the current element
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // Return the elements in the heap
        return getMinHeap(maxHeap);
    }
    ```

=== "Dart"

    ```dart title="top_k.dart"
    /* Use a heap to find the k largest elements in an array */
    MinHeap topKHeap(List<int> nums, int k) {
      // Initialize a min heap with the first k elements of the array
      MinHeap heap = MinHeap(nums.sublist(0, k));
      // Starting with element k+1, keep the heap size at k
      for (int i = k; i < nums.length; i++) {
        // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Use a heap to find the k largest elements in an array */
    fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
        // BinaryHeap is a max heap; Reverse reverses the comparison order to implement a min heap
        let mut heap = BinaryHeap::<Reverse<i32>>::new();
        // Push the first k array elements onto the heap
        for &num in nums.iter().take(k) {
            heap.push(Reverse(num));
        }
        // Starting with element k+1, keep the heap size at k
        for &num in nums.iter().skip(k) {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Push an element onto the heap */
    void pushMinHeap(MaxHeap *maxHeap, int val) {
        // Negate the element
        push(maxHeap, -val);
    }

    /* Pop an element from the heap */
    int popMinHeap(MaxHeap *maxHeap) {
        // Negate the element
        return -pop(maxHeap);
    }

    /* Access the top element of the heap */
    int peekMinHeap(MaxHeap *maxHeap) {
        // Negate the element
        return -peek(maxHeap);
    }

    /* Get the elements in the heap */
    int *getMinHeap(MaxHeap *maxHeap) {
        // Negate every element in the heap and store the results in array res
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    /* Get the elements in the heap */
    int *getMinHeap(MaxHeap *maxHeap) {
        // Negate every element in the heap and store the results in array res
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    // Use a heap to find the k largest elements in an array
    int *topKHeap(int *nums, int sizeNums, int k) {
        // Initialize a min heap
        // Note: negate every element to simulate a min heap with a max heap
        int *empty = (int *)malloc(0);
        MaxHeap *maxHeap = newMaxHeap(empty, 0);
        // Push the first k array elements onto the heap
        for (int i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Starting with element k+1, keep the heap size at k
        for (int i = k; i < sizeNums; i++) {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    /* Use a heap to find the k largest elements in an array */
    fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
        // Initialize a min heap
        val heap = PriorityQueue<Int>()
        // Push the first k array elements onto the heap
        for (i in 0..<k) {
            heap.offer(nums[i])
        }
        // Starting with element k+1, keep the heap size at k
        for (i in k..<nums.size) {
            // If the current element is larger than the heap top, pop the top element and push the current element
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
    ### Use a heap to find the k largest elements in an array ###
    def top_k_heap(nums, k)
      # Initialize a min heap
      # Note: negate all values in the heap to simulate a min heap with a max heap
      max_heap = MaxHeap.new([])

      # Push the first k array elements onto the heap
      for i in 0...k
        push_min_heap(max_heap, nums[i])
      end

      # Starting with element k+1, keep the heap size at k
      for i in k...nums.length
        # If the current element is larger than the heap top, pop the top element and push the current element
        if nums[i] > peek_min_heap(max_heap)
          pop_min_heap(max_heap)
          push_min_heap(max_heap, nums[i])
        end
      end

      get_min_heap(max_heap)
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22Use%20a%20heap%20to%20find%20the%20k%20largest%20elements%20in%20an%20array%22%22%22%0A%20%20%20%20%23%20Initialize%20a%20min%20heap%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20Push%20the%20first%20k%20array%20elements%20onto%20the%20heap%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20Starting%20with%20element%20k%2B1,%20keep%20the%20heap%20size%20at%20k%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20If%20the%20current%20element%20is%20larger%20than%20the%20heap%20top,%20pop%20the%20top%20element%20and%20push%20the%20current%20element%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22Use%20a%20heap%20to%20find%20the%20k%20largest%20elements%20in%20an%20array%22%22%22%0A%20%20%20%20%23%20Initialize%20a%20min%20heap%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20Push%20the%20first%20k%20array%20elements%20onto%20the%20heap%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20Starting%20with%20element%20k%2B1,%20keep%20the%20heap%20size%20at%20k%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20If%20the%20current%20element%20is%20larger%20than%20the%20heap%20top,%20pop%20the%20top%20element%20and%20push%20the%20current%20element%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

There are $n$ rounds of heap insertion and removal to consider, and the heap has at most $k$ elements, so the time complexity is $O(n \log k)$. This is highly efficient: when $k$ is small, the complexity approaches $O(n)$; when $k$ is large, it does not exceed $O(n \log n)$.

This approach also suits dynamic data streams. As new data arrives, we can maintain the heap to update the largest $k$ elements continuously.
