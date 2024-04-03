# Heap construction operation

In some cases, we want to build a heap using all elements of a list, and this process is known as "heap construction operation."

## Implementing with heap insertion operation

First, we create an empty heap and then iterate through the list, performing the "heap insertion operation" on each element in turn. This means adding the element to the end of the heap and then "heapifying" it from bottom to top.

Each time an element is added to the heap, the length of the heap increases by one. Since nodes are added to the binary tree from top to bottom, the heap is constructed "from top to bottom."

Let the number of elements be $n$, and each element's insertion operation takes $O(\log{n})$ time, thus the time complexity of this heap construction method is $O(n \log n)$.

## Implementing by heapifying through traversal

In fact, we can implement a more efficient method of heap construction in two steps.

1. Add all elements of the list as they are into the heap, at this point the properties of the heap are not yet satisfied.
2. Traverse the heap in reverse order (reverse of level-order traversal), and perform "top to bottom heapify" on each non-leaf node.

**After heapifying a node, the subtree with that node as the root becomes a valid sub-heap**. Since the traversal is in reverse order, the heap is built "from bottom to top."

The reason for choosing reverse traversal is that it ensures the subtree below the current node is already a valid sub-heap, making the heapification of the current node effective.

It's worth mentioning that **since leaf nodes have no children, they naturally form valid sub-heaps and do not need to be heapified**. As shown in the following code, the last non-leaf node is the parent of the last node; we start from it and traverse in reverse order to perform heapification:

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## Complexity analysis

Next, let's attempt to calculate the time complexity of this second method of heap construction.

- Assuming the number of nodes in the complete binary tree is $n$, then the number of leaf nodes is $(n + 1) / 2$, where $/$ is integer division. Therefore, the number of nodes that need to be heapified is $(n - 1) / 2$.
- In the process of "top to bottom heapification," each node is heapified to the leaf nodes at most, so the maximum number of iterations is the height of the binary tree $\log n$.

Multiplying the two, we get the time complexity of the heap construction process as $O(n \log n)$. **But this estimate is not accurate, because it does not take into account the nature of the binary tree having far more nodes at the lower levels than at the top.**

Let's perform a more accurate calculation. To simplify the calculation, assume a "perfect binary tree" with $n$ nodes and height $h$; this assumption does not affect the correctness of the result.

![Node counts at each level of a perfect binary tree](build_heap.assets/heapify_operations_count.png)

As shown in the figure above, the maximum number of iterations for a node "to be heapified from top to bottom" is equal to the distance from that node to the leaf nodes, which is precisely "node height." Therefore, we can sum the "number of nodes $\times$ node height" at each level, **to get the total number of heapification iterations for all nodes**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

To simplify the above equation, we need to use knowledge of sequences from high school, first multiply $T(h)$ by $2$, to get:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^h\times1 \newline
\end{aligned}
$$

By subtracting $T(h)$ from $2T(h)$ using the method of displacement, we get:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

Observing the equation, $T(h)$ is an geometric series, which can be directly calculated using the sum formula, resulting in a time complexity of:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

Further, a perfect binary tree with height $h$ has $n = 2^{h+1} - 1$ nodes, thus the complexity is $O(2^h) = O(n)$. This calculation shows that **the time complexity of inputting a list and constructing a heap is $O(n)$, which is very efficient**.
