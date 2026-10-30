# Insertion sort

<u>Insertion sort</u> is a simple sorting algorithm that works much like arranging a hand of playing cards.

Choose a base element from the unsorted section, compare it with the elements in the sorted section to its left, and insert it into the correct position.

The figure below shows how to insert an element into an array. Let the base element be `base`. Shift all elements between the target index and `base` one position to the right, then assign `base` to the target index.

![A single insertion operation](insertion_sort.assets/insertion_operation.png)

## Algorithm steps

The overall insertion sort process is shown below.

1. Initially, the first element of the array is treated as sorted.
2. Select the second element as `base` and insert it into the correct position. **The first two elements are now sorted**.
3. Select the third element as `base` and insert it into the correct position. **The first three elements are now sorted**.
4. Continue in this way. In the final round, select the last element as `base` and insert it into the correct position. **All elements are now sorted**.

![The insertion sort process](insertion_sort.assets/insertion_sort_overview.png)

An implementation follows:

```src
[file]{insertion_sort}-[class]{}-[func]{insertion_sort}
```

## Algorithm properties

- **Time complexity: $O(n^2)$; adaptive**. In the worst case, the insertion operations require $n - 1$, $n-2$, $\dots$, $2$, and $1$ iterations, totaling $(n - 1) n / 2$, so the time complexity is $O(n^2)$. For ordered data, an insertion can stop early. A fully sorted input achieves the best-case time complexity of $O(n)$.
- **Space complexity: $O(1)$; in-place**. Pointers $i$ and $j$ use constant extra space.
- **Stable**. Each element is inserted to the right of equal elements, preserving their order.

## Why use insertion sort?

Insertion sort takes $O(n^2)$ time, while quick sort, which we will study shortly, takes $O(n \log n)$. Despite its higher time complexity, **insertion sort is usually faster for small datasets**.

This resembles the comparison between linear and binary search. Algorithms such as quick sort, with $O(n \log n)$ time complexity, use divide and conquer and tend to involve more elementary operations. When the dataset is small, $n^2$ and $n \log n$ are relatively close, so asymptotic complexity is not the dominant factor; the number of elementary operations per round matters more.

In fact, the built-in sorting functions of many programming languages, such as Java, use insertion sort. The general approach is to use a divide-and-conquer algorithm such as quick sort for long arrays and insertion sort directly for short ones.

Although bubble sort, selection sort, and insertion sort all take $O(n^2)$ time, **insertion sort is used much more often in practice**, mainly for the following reasons.

- Bubble sort swaps elements, using a temporary variable and three elementary operations. Insertion sort shifts elements by assignment, requiring just one operation. **Bubble sort therefore usually has higher computational overhead**.
- Selection sort takes $O(n^2)$ time in every case. **For partially sorted data, insertion sort is usually more efficient than selection sort**.
- Selection sort is not stable and therefore cannot be used for multilevel sorting.
