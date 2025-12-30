# Heap Construction Operation

In some cases, we want to build a heap using all elements of a list, and this process is called "heap construction operation."

## Implementing with Element Insertion

We first create an empty heap, then iterate through the list, performing the "element insertion operation" on each element in sequence. This means adding the element to the bottom of the heap and then performing "bottom-to-top" heapify on that element.

Each time an element is inserted into the heap, the heap's length increases by one. Since nodes are added to the binary tree sequentially from top to bottom, the heap is constructed "from top to bottom."

Given $n$ elements, each element's insertion operation takes $O(\log{n})$ time, so the time complexity of this heap construction method is $O(n \log n)$.

## Implementing Through Heapify Traversal

In fact, we can implement a more efficient heap construction method in two steps.

1. Add all elements of the list as-is to the heap, at which point the heap property is not yet satisfied.
2. Traverse the heap in reverse order (reverse of level-order traversal), performing "top-to-bottom heapify" on each non-leaf node in sequence.

**After heapifying a node, the subtree rooted at that node becomes a valid sub-heap**. Since we traverse in reverse order, the heap is constructed "from bottom to top."

The reason for choosing reverse order traversal is that it ensures the subtree below the current node is already a valid sub-heap, making the heapification of the current node effective.

It's worth noting that **since leaf nodes have no children, they are naturally valid sub-heaps and do not require heapification**. As shown in the code below, the last non-leaf node is the parent of the last node; we start from it and traverse in reverse order to perform heapification:

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## Complexity Analysis

Next, let's attempt to derive the time complexity of this second heap construction method.

- Assuming the complete binary tree has $n$ nodes, then the number of leaf nodes is $(n + 1) / 2$, where $/$ is floor division. Therefore, the number of nodes that need heapification is $(n - 1) / 2$.
- In the top-to-bottom heapify process, each node is heapified at most to the leaf nodes, so the maximum number of iterations is the binary tree height $\log n$.

Multiplying these two together, we get a time complexity of $O(n \log n)$ for the heap construction process. **However, this estimate is not accurate because it doesn't account for the property that binary trees have far more nodes at lower levels than at upper levels**.

Let's perform a more accurate calculation. To reduce calculation difficulty, assume a "perfect binary tree" with $n$ nodes and height $h$; this assumption does not affect the correctness of the result.

![Node count at each level of a perfect binary tree](build_heap.assets/heapify_operations_count.png)

As shown in the figure above, the maximum number of iterations for a node's "top-to-bottom heapify" equals the distance from that node to the leaf nodes, which is precisely the "node height." Therefore, we can sum the "number of nodes $\times$ node height" at each level to **obtain the total number of heapify iterations for all nodes**.

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
