# Heap Building Operations

In some cases, we want to use all the elements of a list to build a heap, a process known as "heap building".

## Implemented With The Help Of Heap Operations.

We first create an empty heap, then traverse the list, performing "heap operations" on each element in turn, i.e., adding the element to the end of the heap, and then heapifying the element "from bottom to top".

Every time an element is added to the heap, the length of the heap is increased by one. Since nodes are added to the binary tree in order from top to bottom, the heap is built "top-down".

Let the number of elements be $n$ and the heap operation for each element uses $O(\log{n})$ time, so the time complexity of this heap building method is $O(n \log n)$ .

## Implemented By Traversing Heapify

In fact, we can implement a more efficient method of building heaps in two steps.

1. Add all elements of the list as is to the heap, at which point the properties of the heap have not been satisfied.
2. Traverse the heap in reverse order (i.e., reverse order of level-order traversal), performing "top-to-bottom heapify" on each non-leaf node in turn.

**Whenever a node is heaped, the subtrees with that node as root node form a legal subheap**. The heap is constructed "bottom-up" because of the inverse traversal.

The reason for choosing an inverted traversal is that this ensures that the subtree below the current node is already a legal subheap, so that heapifying the current node is valid.

It is worth stating that **leaf nodes have no children and are naturally legal child heaps, so there is no need to heapify**. As shown in the following code, the last non-leaf node is the parent node of the last node, and we start traversing in reverse order from it and perform heapify.

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## Complexity Analysis

In the following, let's try to derive the time complexity of the second method of building heaps.

- Assuming that the number of nodes in a complete binary tree is $n$ , the number of leaf nodes is $(n + 1) / 2$ , where $/$ is a downward integer. Therefore the number of nodes to be heapified is $(n - 1) / 2$ .
- During top-to-bottom heapification, each node is heapified up to the leaf node, so the maximum number of iterations is the height of the binary tree $\log n$ .

Multiplying the above two, we can get the time complexity of the heap building process as $O(n \log n)$ . **However, this estimation is not accurate because we have not taken into account the property that the number of nodes at the bottom level of the binary tree is much more than the number of nodes at the top level**.

Next, let's do a more accurate calculation. In order to minimize the difficulty of the calculation, we assume that we are given a perfect binary tree with the number of nodes $n$ and the height $h$, and this assumption will not affect the correctness of the result.

![Number of nodes at each level of the perfect binary tree](build_heap.assets/heapify_operations_count.png)

As shown in the figure above, the maximum number of iterations for a node to be heaped from top to bottom is equal to the distance from the node to the leaf node, which is the "node height". Therefore, **we can sum up the "number of nodes $\times$ node height" of each level to get the total number of heapification iterations of all nodes**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

To simplify the above equation, you need to use your secondary school knowledge of series, first multiply $T(h)$ by $2$ to get:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

Using the staggered subtraction method, subtract the following equation $2 T(h)$ from the above equation $T(h)$ , which can be obtained:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

Observing the above equation, it is found that $T(h)$ is an isoperimetric series, which can be directly used in the summation formula to get the time complexity as:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

Further, the number of nodes of a perfect binary tree with height $h$ is $n = 2^{h+1} - 1$ , with an easily obtained complexity of $O(2^h) = O(n)$ . The above projection shows that **the time complexity of input list and building heap is $O(n)$** , which is very efficient.
