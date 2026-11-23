# Summary

### Key takeaways

- Binary search relies on sorted data and repeatedly halves the search interval. It requires ordered input and applies only to arrays or data structures based on arrays.
- Brute-force search locates data by traversing a data structure. Linear search suits arrays and linked lists; breadth-first and depth-first search suit graphs and trees. These algorithms are broadly applicable and require no preprocessing, but their $O(n)$ time complexity is relatively high.
- Hash lookup, tree search, and binary search efficiently locate targets in particular data structures. Their time complexities can be $O(\log n)$ or even $O(1)$, but they usually rely on additional data structures.
- In practice, choose a search method by considering dataset size, required search performance, query frequency, update frequency, and related factors.
- Linear search suits small or frequently updated datasets; binary search suits large, sorted datasets; hash lookup suits fast queries without range-query requirements; tree search suits large, dynamic datasets that need ordering and range queries.
- Replacing linear search with hash lookup is a common optimization that reduces lookup time from $O(n)$ to $O(1)$.
