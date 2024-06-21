# Summary

- Binary search depends on the order of data and performs the search by iteratively halving the search interval. It requires the input data to be sorted and is only applicable to arrays or array-based data structures.
- Brute force search locates data by traversing the data structure. Linear search is suitable for arrays and linked lists, while breadth-first search and depth-first search are suitable for graphs and trees. These algorithms are highly versatile, requiring no preprocessing of data, but have a higher time complexity of $O(n)$.
- Hash search, tree search, and binary search are efficient searching methods, capable of quickly locating target elements in specific data structures. These algorithms are highly efficient, with time complexities reaching $O(\log n)$ or even $O(1)$, but they usually require additional data structures.
- In practice, we need to analyze factors such as data volume, search performance requirements, data query and update frequencies, etc., to choose the appropriate search method.
- Linear search is suitable for small or frequently updated data; binary search is suitable for large, sorted data; hash search is suitable for scenarios requiring high query efficiency without the need for range queries; tree search is appropriate for large dynamic data that needs to maintain order and support range queries.
- Replacing linear search with hash search is a common strategy to optimize runtime, reducing the time complexity from $O(n)$ to $O(1)$.
