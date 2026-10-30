---
comments: true
---

# 8.2 &nbsp; Building a heap

Sometimes we want to construct a heap from all the elements of a list. This process is called “building a heap.”

## 8.2.1 &nbsp; Building through insertion

First create an empty heap, then traverse the list and insert each element: append it to the end of the heap, then sift it upward.

Each insertion increases the heap's length by one. Since nodes are added to the binary tree from the top down, this constructs the heap “top down.”

For $n$ elements, each insertion takes $O(\log{n})$ time, so this method takes $O(n \log n)$ overall.

## 8.2.2 &nbsp; Building by sifting nodes down

We can build a heap more efficiently in two steps.

1. Copy all list elements into the heap without changing their order. The heap property may not yet hold.
2. Traverse the heap in reverse level order, sifting down each non-leaf node.

**After a node is sifted down, the subtree rooted at that node is a valid heap**. Since the traversal is reversed, the heap is built “bottom up.”

Reverse traversal ensures that the subtrees below the current node are already valid heaps, which is necessary for sifting down the current node to work correctly.

**Leaf nodes have no children and are already valid heaps, so they need no sifting**. As the code below shows, the last non-leaf node is the parent of the last node. Start there and traverse backward, sifting each node down:

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """Constructor: build a heap from the input list"""
        # Place the list elements in the heap without changing their order
        self.max_heap = nums
        # Sift down from every non-leaf node
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* Constructor: build a heap from the input list */
    MaxHeap(vector<int> nums) {
        // Place the list elements in the heap without changing their order
        maxHeap = nums;
        // Sift down from every non-leaf node
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* Constructor: build a heap from the input list */
    MaxHeap(List<Integer> nums) {
        // Place the list elements in the heap without changing their order
        maxHeap = new ArrayList<>(nums);
        // Sift down from every non-leaf node
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* Constructor: build a heap from an input list */
    MaxHeap(IEnumerable<int> nums) {
        // Place the list elements in the heap without changing their order
        maxHeap = new List<int>(nums);
        // Sift down from every non-leaf node
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* Constructor: build a heap from a slice */
    func newMaxHeap(nums []any) *maxHeap {
        // Place the list elements in the heap without changing their order
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // Sift down from every non-leaf node
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* Constructor: build a heap from the input list */
    init(nums: [Int]) {
        // Place the list elements in the heap without changing their order
        maxHeap = nums
        // Sift down from every non-leaf node
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* Constructor: create an empty heap or build a heap from the input list */
    constructor(nums) {
        // Place the list elements in the heap without changing their order
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Sift down from every non-leaf node
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* Constructor: create an empty heap or build a heap from the input list */
    constructor(nums?: number[]) {
        // Place the list elements in the heap without changing their order
        this.maxHeap = nums === undefined ? [] : [...nums];
        // Sift down from every non-leaf node
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* Constructor: build a heap from the input list */
    MaxHeap(List<int> nums) {
      // Place the list elements in the heap without changing their order
      _maxHeap = nums;
      // Sift down from every non-leaf node
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* Constructor: build a heap from the input list */
    fn new(nums: Vec<i32>) -> Self {
        // Place the list elements in the heap without changing their order
        let mut heap = MaxHeap { max_heap: nums };
        // Sift down from every non-leaf node
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* Constructor: build a heap from the input array */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // Place all elements in the heap
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // Sift down from every non-leaf node
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* Max heap */
    class MaxHeap(nums: MutableList<Int>?) {
        // Use a resizable list instead of an array to avoid managing capacity growth
        private val maxHeap = mutableListOf<Int>()

        /* Constructor: build a heap from the input list */
        init {
            // Place the list elements in the heap without changing their order
            maxHeap.addAll(nums!!)
            // Sift down from every non-leaf node
            for (i in parent(size() - 1) downTo 0) {
                siftDown(i)
            }
        }

        /* Get the left child index */
        private fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* Get the right child index */
        private fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* Get the parent index */
        private fun parent(i: Int): Int {
            return (i - 1) / 2 // Integer division (truncates toward zero in Kotlin)
        }

        /* Swap elements */
        private fun swap(i: Int, j: Int) {
            val temp = maxHeap[i]
            maxHeap[i] = maxHeap[j]
            maxHeap[j] = temp
        }

        /* Get the heap size */
        fun size(): Int {
            return maxHeap.size
        }

        /* Check whether the heap is empty */
        fun isEmpty(): Boolean {
            /* Check whether the heap is empty */
            return size() == 0
        }

        /* Access the top element of the heap */
        fun peek(): Int {
            return maxHeap[0]
        }

        /* Push an element onto the heap */
        fun push(_val: Int) {
            // Add a node
            maxHeap.add(_val)
            // Sift up
            siftUp(size() - 1)
        }

        /* Sift up starting from node i */
        private fun siftUp(it: Int) {
            // Kotlin function parameters are immutable, so create a temporary variable
            var i = it
            while (true) {
                // Get the parent of node i
                val p = parent(i)
                // Stop sifting when the root has been passed or the node needs no repair
                if (p < 0 || maxHeap[i] <= maxHeap[p]) break
                // Swap the two nodes
                swap(i, p)
                // Continue sifting up
                i = p
            }
        }

        /* Pop an element from the heap */
        fun pop(): Int {
            // Handle an empty heap
            if (isEmpty()) throw IndexOutOfBoundsException()
            // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
            swap(0, size() - 1)
            // Remove a node
            val _val = maxHeap.removeAt(size() - 1)
            // Sift down
            siftDown(0)
            // Return the top element of the heap
            return _val
        }

        /* Sift down starting from node i */
        private fun siftDown(it: Int) {
            // Kotlin function parameters are immutable, so create a temporary variable
            var i = it
            while (true) {
                // Find the node with the largest value among i, l, and r, and store its index in ma
                val l = left(i)
                val r = right(i)
                var ma = i
                if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
                if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
                // Stop if node i is largest or both child indices l and r are out of bounds
                if (ma == i) break
                // Swap the two nodes
                swap(i, ma)
                // Continue sifting down
                i = ma
            }
        }

        /* Print the heap (binary tree) */
        fun print() {
            val queue = PriorityQueue { a: Int, b: Int -> b - a }
            queue.addAll(maxHeap)
            printHeap(queue)
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### Constructor: build a heap from the input list ###
    def initialize(nums)
      # Place the list elements in the heap without changing their order
      @max_heap = nums
      # Sift down from every non-leaf node
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22Max%20heap%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%3A%20build%20a%20heap%20from%20the%20input%20list%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Place%20the%20list%20elements%20in%20the%20heap%20without%20changing%20their%20order%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20Sift%20down%20from%20every%20non-leaf%20node%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20left%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20right%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20parent%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20Floor%20division%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Swap%20elements%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20heap%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Sift%20down%20starting%20from%20node%20i%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Find%20the%20node%20with%20the%20largest%20value%20among%20i,%20l,%20and%20r,%20and%20store%20its%20index%20in%20ma%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Stop%20if%20node%20i%20is%20largest%20or%20both%20child%20indices%20l%20and%20r%20are%20out%20of%20bounds%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20the%20two%20nodes%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Continue%20sifting%20down%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20max%20heap%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22Max%20heap%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%3A%20build%20a%20heap%20from%20the%20input%20list%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Place%20the%20list%20elements%20in%20the%20heap%20without%20changing%20their%20order%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20Sift%20down%20from%20every%20non-leaf%20node%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20left%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20right%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20parent%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20Floor%20division%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Swap%20elements%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20heap%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Sift%20down%20starting%20from%20node%20i%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Find%20the%20node%20with%20the%20largest%20value%20among%20i,%20l,%20and%20r,%20and%20store%20its%20index%20in%20ma%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Stop%20if%20node%20i%20is%20largest%20or%20both%20child%20indices%20l%20and%20r%20are%20out%20of%20bounds%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20the%20two%20nodes%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Continue%20sifting%20down%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20max%20heap%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 8.2.3 &nbsp; Complexity analysis

Let us derive the time complexity of the second method.

- A complete binary tree with $n$ nodes has $(n + 1) / 2$ leaves, where $/$ denotes integer division rounded down. Therefore, $n / 2$ nodes need sifting.
- A node can move at most as far as a leaf during sifting, so the maximum number of iterations is the tree height, $\log n$.

Multiplying these gives a time complexity of $O(n \log n)$. **However, this estimate is not tight, because it ignores the fact that there are far more nodes near the bottom of the tree than near the top**.

For a more accurate calculation, assume a perfect binary tree with $n$ nodes and height $h$. This simplifies the calculation without affecting the validity of the result.

![Number of nodes at each level of a perfect binary tree](build_heap.assets/heapify_operations_count.png){ class="animation-figure" }

<p align="center"> Figure 8-5 &nbsp; Number of nodes at each level of a perfect binary tree </p>

As shown above, the maximum number of sift-down iterations for a node equals its distance to a leaf, which is its height. Summing “number of nodes $\times$ node height” over all levels therefore gives **the total number of sifting iterations across all nodes**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

To simplify this expression, use a standard series technique. First multiply $T(h)$ by $2$:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

Subtract the first expression, $T(h)$, from the shifted expression, $2 T(h)$:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

The powers of two in $T(h)$ form a geometric series. Applying the sum formula gives:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

A perfect binary tree of height $h$ has $n = 2^{h+1} - 1$ nodes, so $O(2^h) = O(n)$. This shows that **building a heap from an input list takes $O(n)$ time and is highly efficient**.
