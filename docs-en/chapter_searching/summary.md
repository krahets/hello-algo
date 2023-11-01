# Summary

- Binary search relies on the orderliness of the data and is achieved by gradually reducing the search interval by half through a loop. It requires ordered input data and only works with arrays or data structures implemented based on arrays.
- Brute-force search locates data by traversing data structures. Linear search is applicable to arrays and linked lists, breadth-first search and depth-first search are applicable to graphs and trees. These algorithms are generalizable and do not require data preprocessing, but have high time complexity $O(n)$.
- Hash lookups, tree lookups and binary searches are efficient search methods that can quickly locate a target element in a particular data structure. These algorithms are efficient, with a time complexity of $O(\log n)$ or even $O(1)$, but usually require the use of additional data structures.
- In practice, we need to specifically analyze factors such as data volume, search performance requirements, data query and update frequency, so as to choose a suitable search method.
- Linear search is suitable for small or frequently updated data; binary search is suitable for large, sorted data; hash search is suitable for data that requires high query efficiency and does not require a range query; tree search is suitable for large, dynamic data that requires maintenance of order and support for range queries.
- Replacing linear lookups with hash lookups is a commonly used strategy to optimize runtime, reducing the time complexity from $O(n)$ to $O(1)$ .
