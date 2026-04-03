---
comments: true
---

# 9.4 &nbsp; Summary

### 1. &nbsp; Key Review

- Graphs consist of vertices and edges and can be represented as a set of vertices and a set of edges.
- Compared with the linear relationships modeled by linked lists and the divide-and-conquer relationships modeled by trees, the network relationships modeled by graphs offer much greater flexibility and are therefore more complex.
- In directed graphs, edges have direction; in connected graphs, every vertex is reachable from any other vertex; and in weighted graphs, each edge carries a weight.
- Adjacency matrices use matrices to represent graphs, where each row (column) represents a vertex, and matrix elements represent edges, using $1$ or $0$ to indicate whether two vertices have an edge or not. Adjacency matrices are highly efficient for addition, deletion, lookup, and modification operations, but consume significant space.
- Adjacency lists use multiple linked lists to represent a graph: the $i$-th linked list corresponds to vertex $i$ and stores all vertices adjacent to it. Compared with adjacency matrices, adjacency lists use less space, but edge lookups are less efficient because the linked list must be traversed.
- When linked lists in adjacency lists become too long, they can be converted to red-black trees or hash tables, thereby improving lookup efficiency.
- From an algorithmic perspective, adjacency matrices embody "trading space for time", while adjacency lists embody "trading time for space".
- Graphs can be used to model various real-world systems, such as social networks and subway lines.
- Trees are a special case of graphs, and tree traversal is a special case of graph traversal.
- Breadth-first search in graphs explores from near to far, expanding layer by layer, and is typically implemented with a queue.
- Depth-first search in graphs follows a path as deep as possible and backtracks when it can go no farther, and is commonly implemented with recursion.

### 2. &nbsp; Q & A

**Q**: Is a path defined as a sequence of vertices or a sequence of edges?

The definitions in different language versions of Wikipedia are inconsistent: the English version states "a path is a sequence of edges", while the Chinese version states "a path is a sequence of vertices". The following is the original English text: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

In this text, a path is viewed as a sequence of edges, not a sequence of vertices. This is because there may be multiple edges connecting two vertices, in which case each edge corresponds to a path.

**Q**: In a disconnected graph, will there be unreachable vertices?

In a disconnected graph, if you start from one vertex, at least one other vertex will be unreachable. To traverse a disconnected graph, you need multiple starting points so that all connected components are covered.

**Q**: In an adjacency list, is there any required ordering for the vertices adjacent to a given vertex?

They can appear in any order. In practice, however, they may need to be sorted according to specific rules, such as the order in which vertices were added or the order of vertex values, which helps when quickly finding a vertex with some extreme value.
