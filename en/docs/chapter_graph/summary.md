# Summary

### Key review

- A graph is made up of vertices and edges. It can be described as a set of vertices and a set of edges.
- Compared to linear relationships (like linked lists) and hierarchical relationships (like trees), network relationships (graphs) offer greater flexibility, making them more complex.
- In a directed graph, edges have directions. In a connected graph, any vertex can be reached from any other vertex. In a weighted graph, each edge has an associated weight variable.
- An adjacency matrix is a way to represent a graph using matrix (2D array). The rows and columns represent the vertices. The matrix element value indicates whether there is an edge between two vertices, using $1$ for an edge or $0$ for no edge. Adjacency matrices are highly efficient for operations like adding, deleting, or checking edges, but they require more space.
- An adjacency list is another common way to represent a graph using a collection of linked lists. Each vertex in the graph has a list that contains all its adjacent vertices. The $i^{th}$ list represents vertex $i$. Adjacency lists use less space compared to adjacency matrices. However, since it requires traversing the list to find edges, the time efficiency is lower.
- When the linked lists in an adjacency list are long enough, they can be converted into red-black trees or hash tables to improve lookup efficiency.
- From the perspective of algorithmic design, an adjacency matrix reflects the concept of "trading space for time", whereas an adjacency list reflects "trading time for space".
- Graphs can be used to model various real-world systems, such as social networks, subway routes.
- A tree is a special case of a graph, and tree traversal is also a special case of graph traversal.
- Breadth-first traversal of a graph is a search method that expands layer by layer from near to far, typically using a queue.
- Depth-first traversal of a graph is a search method that prioritizes reaching the end before backtracking when no further path is available. It is often implemented using recursion.

### Q & A

**Q**: Is a path defined as a sequence of vertices or a sequence of edges?

In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

In this document, a path is considered a sequence of edges, rather than a sequence of vertices. This is because there might be multiple edges connecting two vertices, in which case each edge corresponds to a path.

**Q**: In a disconnected graph, are there points that cannot be traversed?

In a disconnected graph, there is at least one vertex that cannot be reached from a specific point. To traverse a disconnected graph, you need to set multiple starting points to traverse all the connected components of the graph.

**Q**: In an adjacency list, does the order of "all vertices connected to that vertex" matter?

It can be in any order. However, in real-world applications, it might be necessary to sort them according to certain rules, such as the order in which vertices are added, or the order of vertex values. This can help find vertices quickly with certain extreme values.
