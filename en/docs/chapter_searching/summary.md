# Summary

### Key Review

- Binary search relies on ordered data and searches by repeatedly halving the search interval. It requires the input data to be sorted and applies only to arrays or array-based data structures.
- Brute-force search locates data by traversing the data structure. Linear search applies to arrays and linked lists, while breadth-first search and depth-first search apply to graphs and trees. These algorithms are broadly applicable and require no data preprocessing, but their relatively high time complexity is $O(n)$.
- Hash-based search, tree search, and binary search are efficient search methods that can quickly locate target elements in specific data structures. Such algorithms are highly efficient with time complexity reaching $O(\log n)$ or even $O(1)$, but typically require additional data structures.
- In practice, we need to analyze factors such as data scale, search performance requirements, and data query and update frequency to choose the appropriate search method.
- Linear search is suitable for small datasets or data that is updated frequently; binary search is suitable for large sorted datasets; hash-based search is suitable when high query efficiency is required and range queries are unnecessary; tree search is suitable for large dynamic datasets that must maintain order and support range queries.
- Replacing linear search with hash-based search is a commonly used strategy to optimize runtime, reducing time complexity from $O(n)$ to $O(1)$.
