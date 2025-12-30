# Searching Algorithms Revisited

<u>Searching algorithms</u> are used to search for one or a group of elements that meet specific conditions in data structures (such as arrays, linked lists, trees, or graphs).

Searching algorithms can be divided into the following two categories based on their implementation approach:

- **Locating target elements by traversing the data structure**, such as traversing arrays, linked lists, trees, and graphs.
- **Achieving efficient element search by utilizing data organization structure or prior information contained in the data**, such as binary search, hash-based search, and binary search tree search.

It's not hard to see that these topics have all been covered in previous chapters, so searching algorithms are not unfamiliar to us. In this section, we will approach from a more systematic perspective and re-examine searching algorithms.

## Brute-Force Search

Brute-force search locates target elements by traversing each element of the data structure.

- "Linear search" is applicable to linear data structures such as arrays and linked lists. It starts from one end of the data structure and accesses elements one by one until the target element is found or the other end is reached without finding the target element.
- "Breadth-first search" and "depth-first search" are two traversal strategies for graphs and trees. Breadth-first search starts from the initial node and searches layer by layer, visiting nodes from near to far. Depth-first search starts from the initial node, follows a path to the end, then backtracks and tries other paths until the entire data structure is traversed.

The advantage of brute-force search is that it is simple and has good generality, **requiring no data preprocessing or additional data structures**.

However, **the time complexity of such algorithms is $O(n)$**, where $n$ is the number of elements, so performance is poor when dealing with large amounts of data.

## Adaptive Search

Adaptive search utilizes the unique properties of data (such as orderliness) to optimize the search process, thereby locating target elements more efficiently.

- "Binary search" uses the orderliness of data to achieve efficient searching, applicable only to arrays.
- "Hash-based search" uses hash tables to establish key-value pair mappings between search data and target data, thereby achieving query operations.
- "Tree search" in specific tree structures (such as binary search trees), quickly eliminates nodes based on comparing node values to locate target elements.

The advantage of such algorithms is high efficiency, **with time complexity reaching $O(\log n)$ or even $O(1)$**.

However, **using these algorithms often requires data preprocessing**. For example, binary search requires pre-sorting the array, while hash-based search and tree search both require additional data structures, and maintaining these data structures also requires extra time and space overhead.

!!! tip

    Adaptive search algorithms are often called lookup algorithms, **mainly used to quickly retrieve target elements in specific data structures**.

## Search Method Selection

Given a dataset of size $n$, we can use linear search, binary search, tree search, hash-based search, and other methods to search for the target element. The working principles of each method are shown in the figure below.

![Multiple search strategies](searching_algorithm_revisited.assets/searching_algorithms.png)

The operational efficiency and characteristics of the above methods are as follows:

<p align="center"> Table <id> &nbsp; Comparison of search algorithm efficiency </p>

|                    | Linear search | Binary search         | Tree search                 | Hash-based search          |
| ------------------ | ------------- | --------------------- | --------------------------- | -------------------------- |
| Search element     | $O(n)$        | $O(\log n)$           | $O(\log n)$                 | $O(1)$                     |
| Insert element     | $O(1)$        | $O(n)$                | $O(\log n)$                 | $O(1)$                     |
| Delete element     | $O(n)$        | $O(n)$                | $O(\log n)$                 | $O(1)$                     |
| Extra space        | $O(1)$        | $O(1)$                | $O(n)$                      | $O(n)$                     |
| Data preprocessing | /             | Sorting $O(n \log n)$ | Tree building $O(n \log n)$ | Hash table building $O(n)$ |
| Data ordered       | Unordered     | Ordered               | Ordered                     | Unordered                  |

The choice of search algorithm also depends on data volume, search performance requirements, data query and update frequency, etc.

**Linear search**

- Good generality, requiring no data preprocessing operations. If we only need to query the data once, the data preprocessing time for the other three methods would be longer than linear search.
- Suitable for small data volumes, where time complexity has less impact on efficiency.
- Suitable for scenarios with high data update frequency, as this method does not require any additional data maintenance.

**Binary search**

- Suitable for large data volumes with stable efficiency performance, worst-case time complexity of $O(\log n)$.
- Data volume cannot be too large, as storing arrays requires contiguous memory space.
- Not suitable for scenarios with frequent data insertion and deletion, as maintaining a sorted array has high overhead.

**Hash-based search**

- Suitable for scenarios with high query performance requirements, with an average time complexity of $O(1)$.
- Not suitable for scenarios requiring ordered data or range searches, as hash tables cannot maintain data orderliness.
- High dependence on hash functions and hash collision handling strategies, with significant risk of performance degradation.
- Not suitable for excessively large data volumes, as hash tables require extra space to minimize collisions and thus provide good query performance.

**Tree search**

- Suitable for massive data, as tree nodes are stored dispersedly in memory.
- Suitable for scenarios requiring maintained ordered data or range searches.
- During continuous node insertion and deletion, binary search trees may become skewed, degrading time complexity to $O(n)$.
- If using AVL trees or red-black trees, all operations can run stably at $O(\log n)$ efficiency, but operations to maintain tree balance add extra overhead.
