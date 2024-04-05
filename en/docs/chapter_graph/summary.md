# Summary

### Key review

- A graph consists of vertices and edges and can be represented as a set comprising a group of vertices and a group of edges.
- Compared to linear relationships (linked lists) and divide-and-conquer relationships (trees), network relationships (graphs) have a higher degree of freedom and are therefore more complex.
- The edges of a directed graph have directionality, any vertex in a connected graph is reachable, and each edge in a weighted graph contains a weight variable.
- Adjacency matrices use matrices to represent graphs, with each row (column) representing a vertex and matrix elements representing edges, using $1$ or $0$ to indicate the presence or absence of an edge between two vertices. Adjacency matrices are highly efficient for add, delete, find, and modify operations, but they consume more space.
- Adjacency lists use multiple linked lists to represent graphs, with the $i^{th}$ list corresponding to vertex $i$, containing all its adjacent vertices. Adjacency lists save more space compared to adjacency matrices, but since it is necessary to traverse the list to find edges, their time efficiency is lower.
- When the linked lists in the adjacency list are too long, they can be converted into red-black trees or hash tables to improve query efficiency.
- From the perspective of algorithmic thinking, adjacency matrices embody the principle of "space for time," while adjacency lists embody "time for space."
- Graphs can be used to model various real systems, such as social networks, subway routes, etc.
- A tree is a special case of a graph, and tree traversal is also a special case of graph traversal.
- Breadth-first traversal of a graph is a search method that expands layer by layer from near to far, usually implemented with a queue.
- Depth-first traversal of a graph is a search method that prefers to go as deep as possible and backtracks when no further paths are available, often based on recursion.

### Q & A

**Q**: Is a path defined as a sequence of vertices or a sequence of edges?

Definitions vary between different language versions on Wikipedia: the English version defines a path as "a sequence of edges," while the Chinese version defines it as "a sequence of vertices." Here is the original text from the English version: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

In this document, a path is considered a sequence of edges, rather than a sequence of vertices. This is because there might be multiple edges connecting two vertices, in which case each edge corresponds to a path.

**Q**: In a disconnected graph, are there points that cannot be traversed to?

In a disconnected graph, starting from a certain vertex, there is at least one vertex that cannot be reached. Traversing a disconnected graph requires setting multiple starting points to traverse all connected components of the graph.

**Q**: In an adjacency list, does the order of "all vertices connected to that vertex" matter?

It can be in any order. However, in practical applications, it might be necessary to sort according to certain rules, such as the order in which vertices are added, or the order of vertex values, etc., to facilitate the quick search for vertices with certain extremal values.
