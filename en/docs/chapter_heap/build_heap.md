---
comments: true
---

# 8.2 &nbsp; Heap Construction Operation

In some cases, we want to build a heap using all elements of a list, and this process is called "heap construction operation."

## 8.2.1 &nbsp; Implementing with Element Insertion

We first create an empty heap, then iterate through the list, performing the "element insertion operation" on each element in sequence. This means adding the element to the bottom of the heap and then performing "bottom-to-top" heapify on that element.

Each time an element is inserted into the heap, the heap's length increases by one. Since nodes are added to the binary tree sequentially from top to bottom, the heap is constructed "from top to bottom."

Given $n$ elements, each element's insertion operation takes $O(\log{n})$ time, so the time complexity of this heap construction method is $O(n \log n)$.

## 8.2.2 &nbsp; Implementing Through Heapify Traversal

In fact, we can implement a more efficient heap construction method in two steps.

1. Add all elements of the list as-is to the heap, at which point the heap property is not yet satisfied.
2. Traverse the heap in reverse order (reverse of level-order traversal), performing "top-to-bottom heapify" on each non-leaf node in sequence.

**After heapifying a node, the subtree rooted at that node becomes a valid sub-heap**. Since we traverse in reverse order, the heap is constructed "from bottom to top."

The reason for choosing reverse order traversal is that it ensures the subtree below the current node is already a valid sub-heap, making the heapification of the current node effective.

It's worth noting that **since leaf nodes have no children, they are naturally valid sub-heaps and do not require heapification**. As shown in the code below, the last non-leaf node is the parent of the last node; we start from it and traverse in reverse order to perform heapification:

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """Constructor, build heap based on input list"""
        # Add list elements to heap as is
        self.max_heap = nums
        # Heapify all nodes except leaf nodes
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* Constructor, build heap based on input list */
    MaxHeap(vector<int> nums) {
        // Add list elements to heap as is
        maxHeap = nums;
        // Heapify all nodes except leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* Constructor, build heap based on input list */
    MaxHeap(List<Integer> nums) {
        // Add list elements to heap as is
        maxHeap = new ArrayList<>(nums);
        // Heapify all nodes except leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* Constructor, build heap from input list */
    MaxHeap(IEnumerable<int> nums) {
        // Add list elements to heap as is
        maxHeap = new List<int>(nums);
        // Heapify all nodes except leaf nodes
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* Constructor, build heap from slice */
    func newMaxHeap(nums []any) *maxHeap {
        // Add list elements to heap as is
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // Heapify all nodes except leaf nodes
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* Constructor, build heap based on input list */
    init(nums: [Int]) {
        // Add list elements to heap as is
        maxHeap = nums
        // Heapify all nodes except leaf nodes
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* Constructor, build empty heap or build heap from input list */
    constructor(nums) {
        // Add list elements to heap as is
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all nodes except leaf nodes
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* Constructor, build empty heap or build heap from input list */
    constructor(nums?: number[]) {
        // Add list elements to heap as is
        this.maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all nodes except leaf nodes
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* Constructor, build heap based on input list */
    MaxHeap(List<int> nums) {
      // Add list elements to heap as is
      _maxHeap = nums;
      // Heapify all nodes except leaf nodes
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* Constructor, build heap based on input list */
    fn new(nums: Vec<i32>) -> Self {
        // Add list elements to heap as is
        let mut heap = MaxHeap { max_heap: nums };
        // Heapify all nodes except leaf nodes
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* Constructor, build heap from slice */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // Push all elements to heap
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // Heapify all nodes except leaf nodes
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* Max heap */
    class MaxHeap(nums: MutableList<Int>?) {
        // Use list instead of array, no need to consider capacity expansion
        private val maxHeap = mutableListOf<Int>()

        /* Constructor, build heap based on input list */
        init {
            // Add list elements to heap as is
            maxHeap.addAll(nums!!)
            // Heapify all nodes except leaf nodes
            for (i in parent(size() - 1) downTo 0) {
                siftDown(i)
            }
        }

        /* Get index of left child node */
        private fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* Get index of right child node */
        private fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* Get index of parent node */
        private fun parent(i: Int): Int {
            return (i - 1) / 2 // Floor division
        }

        /* Swap elements */
        private fun swap(i: Int, j: Int) {
            val temp = maxHeap[i]
            maxHeap[i] = maxHeap[j]
            maxHeap[j] = temp
        }

        /* Get heap size */
        fun size(): Int {
            return maxHeap.size
        }

        /* Check if heap is empty */
        fun isEmpty(): Boolean {
            /* Check if heap is empty */
            return size() == 0
        }

        /* Access top element */
        fun peek(): Int {
            return maxHeap[0]
        }

        /* Element enters heap */
        fun push(_val: Int) {
            // Add node
            maxHeap.add(_val)
            // Heapify from bottom to top
            siftUp(size() - 1)
        }

        /* Starting from node i, heapify from bottom to top */
        private fun siftUp(it: Int) {
            // Kotlin function parameters are immutable, so create temporary variable
            var i = it
            while (true) {
                // Get parent node of node i
                val p = parent(i)
                // When "crossing root node" or "node needs no repair", end heapify
                if (p < 0 || maxHeap[i] <= maxHeap[p]) break
                // Swap two nodes
                swap(i, p)
                // Loop upward heapify
                i = p
            }
        }

        /* Element exits heap */
        fun pop(): Int {
            // Handle empty case
            if (isEmpty()) throw IndexOutOfBoundsException()
            // Delete node
            swap(0, size() - 1)
            // Remove node
            val _val = maxHeap.removeAt(size() - 1)
            // Return top element
            siftDown(0)
            // Return heap top element
            return _val
        }

        /* Starting from node i, heapify from top to bottom */
        private fun siftDown(it: Int) {
            // Kotlin function parameters are immutable, so create temporary variable
            var i = it
            while (true) {
                // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
                val l = left(i)
                val r = right(i)
                var ma = i
                if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
                if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
                // Swap two nodes
                if (ma == i) break
                // Swap two nodes
                swap(i, ma)
                // Loop downwards heapification
                i = ma
            }
        }

        /* Driver Code */
        fun print() {
            val queue = PriorityQueue { a: Int, b: Int -> b - a }
            queue.addAll(maxHeap)
            printHeap(queue)
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### Constructor, build heap from input list ###
    def initialize(nums)
      # Add list elements to heap as is
      @max_heap = nums
      # Heapify all nodes except leaf nodes
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

## 8.2.3 &nbsp; Complexity Analysis

Next, let's attempt to derive the time complexity of this second heap construction method.

- Assuming the complete binary tree has $n$ nodes, then the number of leaf nodes is $(n + 1) / 2$, where $/$ is floor division. Therefore, the number of nodes that need heapification is $(n - 1) / 2$.
- In the top-to-bottom heapify process, each node is heapified at most to the leaf nodes, so the maximum number of iterations is the binary tree height $\log n$.

Multiplying these two together, we get a time complexity of $O(n \log n)$ for the heap construction process. **However, this estimate is not accurate because it doesn't account for the property that binary trees have far more nodes at lower levels than at upper levels**.

Let's perform a more accurate calculation. To reduce calculation difficulty, assume a "perfect binary tree" with $n$ nodes and height $h$; this assumption does not affect the correctness of the result.

![Node count at each level of a perfect binary tree](build_heap.assets/heapify_operations_count.png){ class="animation-figure" }

<p align="center"> Figure 8-5 &nbsp; Node count at each level of a perfect binary tree </p>

As shown in Figure 8-5, the maximum number of iterations for a node's "top-to-bottom heapify" equals the distance from that node to the leaf nodes, which is precisely the "node height." Therefore, we can sum the "number of nodes $\times$ node height" at each level to **obtain the total number of heapify iterations for all nodes**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

To simplify the above expression, we need to use sequence knowledge from high school. First, multiply $T(h)$ by $2$ to get:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

Using the method of differences, subtract the first equation $T(h)$ from the second equation $2 T(h)$ to get:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

Observing the above expression, we find that $T(h)$ is a geometric series, which can be calculated directly using the sum formula, yielding a time complexity of:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

Furthermore, a perfect binary tree with height $h$ has $n = 2^{h+1} - 1$ nodes, so the complexity is $O(2^h) = O(n)$. This derivation shows that **the time complexity of building a heap from an input list is $O(n)$, which is highly efficient**.
