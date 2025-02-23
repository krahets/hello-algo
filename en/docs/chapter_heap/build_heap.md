# Heap construction

In certain cases, we need to construct a heap using all elements of a list. This process is known as **heap construction**.

## Implementing with heap insertion

We first create an empty heap and then iterate through the list, performing **heap insertion** on each element sequentially. This involves adding the element to the end of the heap and then applying a **bottom-up heapification** process.

Each time an element is inserted, the heap size increases by one. Since nodes are added to the binary tree in **top-to-bottom order**, the heap is constructed **top-down**.

Let the number of elements be $n$. Each insertion operation takes $O(\log{n})$ time, so the overall time complexity of this heap construction method is $O(n \log n)$.

## Implementing via heapification traversal

In practice, we can implement a more efficient heap construction method in two steps:

1. Insert all elements of the list into the heap without modification. At this stage, the heap properties are not yet satisfied.
2. Traverse the heap in reverse order (i.e., the reverse of level-order traversal) and apply **top-down heapification** to each non-leaf node.

**Once a node is heapified, the subtree rooted at that node becomes a valid sub-heap.** Since the traversal is performed in reverse order, the heap is constructed **bottom-up**.

The reason for using reverse traversal is that it ensures the subtree beneath the current node is already a valid sub-heap, making the heapification process effective.

It is important to note that **since leaf nodes have no children, they are inherently valid sub-heaps and do not require heapification**. As shown in the following code, the last non-leaf node is the parent of the last node; we begin the reverse traversal from this node and perform heapification.

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## Complexity analysis

Next, we attempt to derive the time complexity of this second heap construction method.

- Assuming the complete binary tree has $n$ nodes, the number of leaf nodes is $(n + 1) / 2$, where $/$ represents integer division. Therefore, the number of nodes that require heapification is $(n - 1) / 2$.
- During **top-down heapification**, each node can be heapified at most down to a leaf node, meaning the maximum number of iterations is the height of the binary tree $\log n$.

Multiplying these two terms, we obtain a time complexity of $O(n \log n)$ for the heap construction process. **However, this estimate is not entirely accurate, as it does not account for the fact that the lower levels of the binary tree contain considerably more nodes than the upper levels.**

To perform a more precise analysis, we simplify the calculation by assuming a **perfect binary tree** with $n$ nodes and height $h$. This assumption does not affect the correctness of the result.

![Node counts at each level of a perfect binary tree](build_heap.assets/heapify_operations_count.png)

As shown in the figure above, the maximum number of iterations for a node to be **heapified top-down** is equal to its distance from the leaf nodes, which corresponds to its **height**. Therefore, by summing the product of “node count $\times$ node height” at each level, we obtain **the total number of heapification iterations for all nodes**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

To simplify the equation above, we need to apply high school sequence knowledge. First, we multiply $T(h)$ by $2$ to obtain:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^h\times1 \newline
\end{aligned}
$$

By applying the method of staggered subtraction, we subtract $T(h)$ from $2T(h)$ to obtain:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

By examining the equation, we observe that $T(h)$ forms a geometric series, which can be directly summed using the geometric series formula, yielding a time complexity of:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

Further, a perfect binary tree of height $h$ contains $n = 2^{h+1} - 1$ nodes, leading to a complexity of $O(2^h) = O(n)$. This derivation shows that **the time complexity of inserting a list and performing heapification is $O(n)$, making it highly efficient**.
