# Summary

### Key takeaways

- A graph consists of vertices and edges and can be represented using a vertex set and an edge set.
- Network relationships (graphs) allow more freedom than linear relationships (linked lists) or divide-and-conquer relationships (trees), making them more complex.
- Edges in a directed graph have a direction; all vertices in a connected graph are reachable; and each edge in a weighted graph has a weight.
- An adjacency matrix represents a graph with a matrix. Each row (or column) represents a vertex, and entries represent edges, with $1$ or $0$ indicating whether an edge exists between two vertices. Adding, removing, looking up, and modifying edges are efficient, but the matrix uses substantial space.
- An adjacency list represents a graph with multiple linked lists. The $i$-th linked list corresponds to vertex $i$ and stores all of its adjacent vertices. It uses less space than an adjacency matrix, but finding an edge requires traversing a linked list, making lookups slower.
- A long linked list in an adjacency list can be replaced with a red-black tree or a hash table to speed up lookups.
- In terms of algorithm design, an adjacency matrix trades space for time, while an adjacency list trades time for space.
- Graphs can model many real-world systems, such as social networks and subway networks.
- A tree is a special case of a graph, and tree traversal is a special case of graph traversal.
- Breadth-first graph traversal searches from near to far, expanding layer by layer. It is usually implemented with a queue.
- Depth-first graph traversal follows a path as far as possible and backtracks when it can go no farther. It is often implemented with recursion.

### Q & A

**Q**: Is a path defined as a sequence of vertices or a sequence of edges?

Wikipedia's language editions give different definitions: the English edition defines a path as a sequence of edges, while the Chinese edition defines it as a sequence of vertices. The English wording is: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

In this book, a path is treated as a sequence of edges rather than vertices. This is because multiple edges can connect the same two vertices, in which case each edge corresponds to a path.

**Q**: Can some vertices in a disconnected graph remain unvisited?

In a disconnected graph, at least one vertex cannot be reached from a given starting vertex. Traversing the entire graph requires multiple starting points so that all connected components are visited.

**Q**: Must the adjacent vertices in an adjacency list appear in a particular order?

They may appear in any order. In practice, however, it can be useful to sort them by a specific rule, such as the order in which vertices were added or their values. This helps us quickly find a vertex with a particular extreme value.
