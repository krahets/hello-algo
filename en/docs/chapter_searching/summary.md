# Summary

### Key Review

- Binary search relies on data orderliness and progressively reduces the search interval by half through loops. It requires input data to be sorted and is only applicable to arrays or data structures based on array implementations.
- Brute-force search locates data by traversing the data structure. Linear search is applicable to arrays and linked lists, while breadth-first search and depth-first search are applicable to graphs and trees. Such algorithms have good generality and require no data preprocessing, but have a relatively high time complexity of $O(n)$.
- Hash-based search, tree search, and binary search are efficient search methods that can quickly locate target elements in specific data structures. Such algorithms are highly efficient with time complexity reaching $O(\log n)$ or even $O(1)$, but typically require additional data structures.
- In practice, we need to analyze factors such as data scale, search performance requirements, and data query and update frequency to choose the appropriate search method.
- Linear search is suitable for small-scale or frequently updated data; binary search is suitable for large-scale, sorted data; hash-based search is suitable for data with high query efficiency requirements and no need for range queries; tree search is suitable for large-scale dynamic data that needs to maintain order and support range queries.
- Replacing linear search with hash-based search is a commonly used strategy to optimize runtime, reducing time complexity from $O(n)$ to $O(1)$.
