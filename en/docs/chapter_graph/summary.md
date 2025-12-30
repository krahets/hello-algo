# Summary

### Key Review

- Graphs consist of vertices and edges and can be represented as a set of vertices and a set of edges.
- Compared to linear relationships (linked lists) and divide-and-conquer relationships (trees), network relationships (graphs) have a higher degree of freedom and are therefore more complex.
- Directed graphs have edges with directionality, connected graphs have all vertices reachable from any vertex, and weighted graphs have edges that each contain a weight variable.
- Adjacency matrices use matrices to represent graphs, where each row (column) represents a vertex, and matrix elements represent edges, using $1$ or $0$ to indicate whether two vertices have an edge or not. Adjacency matrices are highly efficient for addition, deletion, lookup, and modification operations, but consume significant space.
- Adjacency lists use multiple linked lists to represent graphs, where the $i$-th linked list corresponds to vertex $i$ and stores all adjacent vertices of that vertex. Adjacency lists are more space-efficient than adjacency matrices, but have lower time efficiency because they require traversing linked lists to find edges.
- When linked lists in adjacency lists become too long, they can be converted to red-black trees or hash tables, thereby improving lookup efficiency.
- From an algorithmic perspective, adjacency matrices embody "trading space for time", while adjacency lists embody "trading time for space".
- Graphs can be used to model various real-world systems, such as social networks and subway lines.
- Trees are a special case of graphs, and tree traversal is a special case of graph traversal.
- Breadth-first search of graphs is a near-to-far, layer-by-layer expansion search method, typically implemented using a queue.
- Depth-first search of graphs is a search method that prioritizes going as far as possible and backtracks when no path remains, commonly implemented using recursion.

### Q & A

**Q**: Is a path defined as a sequence of vertices or a sequence of edges?

The definitions in different language versions of Wikipedia are inconsistent: the English version states "a path is a sequence of edges", while the Chinese version states "a path is a sequence of vertices". The following is the original English text: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

In this text, a path is viewed as a sequence of edges, not a sequence of vertices. This is because there may be multiple edges connecting two vertices, in which case each edge corresponds to a path.

**Q**: In a disconnected graph, will there be unreachable vertices?

In a disconnected graph, starting from a certain vertex, at least one vertex cannot be reached. Traversing a disconnected graph requires setting multiple starting points to traverse all connected components of the graph.

**Q**: In an adjacency list, is there a requirement for the order of "all vertices connected to that vertex"?

It can be in any order. However, in practical applications, it may be necessary to sort according to specified rules, such as the order in which vertices were added, or the order of vertex values, which helps quickly find vertices "with certain extreme values".
