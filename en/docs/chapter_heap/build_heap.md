---
comments: true
---

# 8.2 &nbsp; Building a heap

Sometimes we want to construct a heap from all the elements in a list. This process is called building a heap.

## 8.2.1 &nbsp; Building a heap by insertion

First create an empty heap. Traverse the list and push each element in turn: append the element to the end of the heap, then sift it up.

Each insertion increases the heap size by one. Because nodes are added to the binary tree in order from top to bottom, this method builds the heap from the top down.

For $n$ elements, each insertion takes $O(\log{n})$ time, so building a heap this way takes $O(n \log n)$ time.

## 8.2.2 &nbsp; Building a heap by sifting down

We can build the heap more efficiently in two steps.

1. Place all elements in the heap in their original order. The heap property may not yet hold.
2. Traverse the heap in reverse level order, sifting down from each non-leaf node in turn.

**After a node is sifted down, the subtree rooted at its original position is a valid heap**. Because we traverse in reverse order, the heap is built from the bottom up.

Reverse traversal ensures that the subtrees below the current node are already valid heaps. This is what makes sifting down from the current node effective.

**Leaves have no children, so they are already valid heaps and need no sifting**. As the code below shows, the last non-leaf node is the parent of the last node. Start there and work backward, sifting down at each position.

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """Constructor: build a heap from the input list"""
        # Copy the list elements into the heap in their original order
        self.max_heap = nums
        # Heapify all non-leaf nodes
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* Constructor: build a heap from the input list */
    MaxHeap(vector<int> nums) {
        // Copy the list elements into the heap in their original order
        maxHeap = nums;
        // Heapify all non-leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* Constructor: build a heap from the input list */
    MaxHeap(List<Integer> nums) {
        // Copy the list elements into the heap in their original order
        maxHeap = new ArrayList<>(nums);
        // Heapify all non-leaf nodes
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* Constructor: build a heap from the input list */
    MaxHeap(IEnumerable<int> nums) {
        // Copy the list elements into the heap in their original order
        maxHeap = new List<int>(nums);
        // Heapify all non-leaf nodes
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
        // Copy the list elements into the heap in their original order
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // Heapify all non-leaf nodes
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* Constructor: build a heap from the input list */
    init(nums: [Int]) {
        // Copy the list elements into the heap in their original order
        maxHeap = nums
        // Heapify all non-leaf nodes
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* Constructor: create an empty heap or build one from the input list */
    constructor(nums) {
        // Copy the list elements into the heap in their original order
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all non-leaf nodes
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* Constructor: create an empty heap or build one from the input list */
    constructor(nums?: number[]) {
        // Copy the list elements into the heap in their original order
        this.maxHeap = nums === undefined ? [] : [...nums];
        // Heapify all non-leaf nodes
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* Constructor: build a heap from the input list */
    MaxHeap(List<int> nums) {
      // Copy the list elements into the heap in their original order
      _maxHeap = nums;
      // Heapify all non-leaf nodes
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* Constructor: build a heap from the input list */
    fn new(nums: Vec<i32>) -> Self {
        // Copy the list elements into the heap in their original order
        let mut heap = MaxHeap { max_heap: nums };
        // Heapify all non-leaf nodes
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* Constructor: build a heap from a slice */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // Push all elements onto the heap
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // Heapify all non-leaf nodes
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* Max-heap */
    class MaxHeap(nums: MutableList<Int>?) {
        // Use a list instead of an array so it can grow as needed
        private val maxHeap = mutableListOf<Int>()

        /* Constructor: build a heap from the input list */
        init {
            // Copy the list elements into the heap in their original order
            maxHeap.addAll(nums!!)
            // Heapify all non-leaf nodes
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
            return (i - 1) / 2 // Floor division
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

        /* Peek at the root */
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

        /* Sift up from node i */
        private fun siftUp(it: Int) {
            // Kotlin function parameters are read-only, so create a temporary variable
            var i = it
            while (true) {
                // Get the parent of node i
                val p = parent(i)
                // Stop sifting at the root or when the node already satisfies the heap property
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
            // Swap the root and the rightmost leaf (the first and last elements)
            swap(0, size() - 1)
            // Remove the node
            val _val = maxHeap.removeAt(size() - 1)
            // Sift down
            siftDown(0)
            // Return the root element
            return _val
        }

        /* Sift down from node i */
        private fun siftDown(it: Int) {
            // Kotlin function parameters are read-only, so create a temporary variable
            var i = it
            while (true) {
                // Store the index of the largest of nodes i, l, and r in ma
                val l = left(i)
                val r = right(i)
                var ma = i
                if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
                if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
                // Stop if i is already largest or both child indices l and r are out of bounds
                if (ma == i) break
                // Swap the two nodes
                swap(i, ma)
                // Continue sifting down
                i = ma
            }
        }

        /* Print the heap as a binary tree */
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
      # Copy the list elements into the heap in their original order
      @max_heap = nums
      # Heapify all non-leaf nodes
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22Max-heap%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%3A%20build%20a%20heap%20from%20the%20input%20list%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Copy%20the%20list%20elements%20into%20the%20heap%20in%20their%20original%20order%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20Heapify%20all%20non-leaf%20nodes%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20left%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20right%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20parent%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20Floor%20division%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Swap%20elements%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20heap%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Sift%20down%20from%20node%20i%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Store%20the%20index%20of%20the%20largest%20of%20nodes%20i,%20l,%20and%20r%20in%20ma%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Stop%20if%20i%20is%20already%20largest%20or%20both%20child%20indices%20l%20and%20r%20are%20out%20of%20bounds%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20the%20two%20nodes%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Continue%20sifting%20down%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20max-heap%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22Max-heap%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%3A%20build%20a%20heap%20from%20the%20input%20list%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Copy%20the%20list%20elements%20into%20the%20heap%20in%20their%20original%20order%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20Heapify%20all%20non-leaf%20nodes%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20left%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20right%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20parent%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20Floor%20division%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Swap%20elements%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20heap%20size%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Sift%20down%20from%20node%20i%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Store%20the%20index%20of%20the%20largest%20of%20nodes%20i,%20l,%20and%20r%20in%20ma%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Stop%20if%20i%20is%20already%20largest%20or%20both%20child%20indices%20l%20and%20r%20are%20out%20of%20bounds%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20the%20two%20nodes%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Continue%20sifting%20down%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20max-heap%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 8.2.3 &nbsp; Complexity analysis

Let us derive the time complexity of the second method.

- A complete binary tree with $n$ nodes has $(n + 1) / 2$ leaves, where $/$ denotes floor division. The number of nodes that need sifting is therefore $n / 2$.
- A node can sift down no farther than a leaf, so the maximum number of iterations is the tree height $\log n$.

Multiplying these quantities gives a time bound of $O(n \log n)$ for building the heap. **This estimate is loose because it overlooks the fact that many more nodes are near the bottom of the tree than near the top**.

For a closer count, suppose we have a perfect binary tree with $n$ nodes and height $h$. This assumption simplifies the calculation without changing the resulting complexity.

![Number of nodes at each level of a perfect binary tree](build_heap.assets/heapify_operations_count.svg){ class="animation-figure" }

<p align="center"> Figure 8-5 &nbsp; Number of nodes at each level of a perfect binary tree </p>

As the figure shows, the maximum number of sift-down iterations for a node equals the distance from that node to a leaf, which is the node's height in this tree. Summing “number of nodes $\times$ node height” over all levels gives **the total number of heapify iterations in the worst case**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

We can simplify the expression using a familiar series calculation. First multiply $T(h)$ by $2$ to get

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

Shift and subtract: subtract the expression above, $T(h)$, from the following expression, $2 T(h)$, to obtain

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

The term $T(h)$ is a geometric series. Applying the sum formula gives the following time complexity:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

A perfect binary tree of height $h$ has $n = 2^{h+1} - 1$ nodes, so the complexity is $O(2^h) = O(n)$. Thus, **building a heap from an input list takes only $O(n)$ time**.
