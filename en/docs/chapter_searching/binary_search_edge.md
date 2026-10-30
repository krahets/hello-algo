# Finding boundaries with binary search

## Finding the left boundary

!!! question

    Given a sorted array `nums` of length $n$ that may contain duplicate elements, return the index of the leftmost occurrence of `target`. If the array does not contain this element, return $-1$.

Recall the method for finding an insertion point with binary search: when the search finishes, $i$ points to the leftmost `target`. **Finding the insertion point therefore amounts to finding the index of the leftmost `target`**.

We can use the insertion-point function to find the left boundary. However, `target` may be absent from the array, leading to either of the following outcomes.

- The insertion index $i$ is out of bounds.
- `nums[i]` is not equal to `target`.

In either case, simply return $-1$. The code is as follows:

```src
[file]{binary_search_edge}-[class]{}-[func]{binary_search_left_edge}
```

## Finding the right boundary

How can we find the rightmost `target`? The most direct approach is to modify the pointer update for `nums[m] == target`. We omit the code here; interested readers can implement it themselves.

Here are two shortcuts.

### Reusing the left-boundary search

We can use the function for finding the leftmost element to find the rightmost one: **turn the search for the rightmost `target` into a search for the leftmost `target + 1`**.

As shown below, when the search finishes, pointer $i$ points to the leftmost `target + 1`, if it exists, while $j$ points to the rightmost `target`. **We therefore return $j$**.

![Turning a right-boundary search into a left-boundary search](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png)

The returned insertion point is $i$, so subtract $1$ to obtain $j$:

```src
[file]{binary_search_edge}-[class]{}-[func]{binary_search_right_edge}
```

### Turning a boundary search into an element search

When the array does not contain `target`, $i$ ultimately points to the first element greater than `target`, while $j$ points to the rightmost element smaller than `target`.

As shown below, we can therefore construct a value absent from the array and use it to find the left and right boundaries.

- To find the leftmost `target`, search for `target - 0.5` and return pointer $i$.
- To find the rightmost `target`, search for `target + 0.5` and return pointer $j$.

![Turning a boundary search into an element search](binary_search_edge.assets/binary_search_edge_by_element.png)

The code is omitted here, but keep two points in mind.

- The given array contains no fractional values, so we do not need to handle equality.
- Since this method introduces fractional values, change the function's `target` variable to a floating-point type. No change is needed in Python.
