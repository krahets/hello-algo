---
comments: true
---

# 10.6 &nbsp; Summary

### 1. &nbsp; Key takeaways

- Binary search uses the sorted order of the data to halve the search interval at each iteration. It requires sorted input and works only on arrays or array-based data structures.
- Brute-force search locates data by traversing a data structure. Linear search works on arrays and linked lists. Breadth-first and depth-first search work on graphs and trees. These algorithms are broadly applicable and need no preprocessing, but their $O(n)$ time complexity is relatively high.
- Hash lookup, tree search, and binary search can quickly locate a target in a suitable data structure. Their time complexity can be as low as $O(\log n)$ or even $O(1)$, though they generally rely on auxiliary data structures.
- In practice, choose a search method based on the size of the dataset, the search performance you need, and how often you query and update the data.
- Linear search suits small or frequently updated datasets. Binary search works well on large, sorted datasets. Hash lookup suits workloads that require fast lookups and no range queries. Tree search suits large, changing datasets that must remain ordered and support range queries.
- Replacing a linear search with a hash lookup is a common way to speed up an algorithm. It can reduce the time complexity of a lookup from $O(n)$ to $O(1)$.
