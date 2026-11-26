---
comments: true
---

# 9.4 &nbsp; Summary

### 1. &nbsp; Key points

- A graph consists of vertices and edges and can be represented by a set of vertices and a set of edges.
- A network (graph) allows more flexible connections than a linear structure (linked list) or a branching, divide-and-conquer structure (tree), which makes it more complex.
- Edges in a directed graph have a direction. In a connected graph, every vertex is reachable from every other vertex. Every edge in a weighted graph carries a weight.
- An adjacency matrix represents a graph with one row and column per vertex. Entries represent edges, with $1$ or $0$ indicating whether two vertices are connected by an edge. Adding, removing, looking up, and updating edges are efficient, but the matrix takes considerable space.
- An adjacency list represents a graph with multiple linked lists. List $i$ stores all neighbors of vertex $i$. An adjacency list uses less space than an adjacency matrix, but finding an edge requires scanning a list, so lookups take longer.
- If a linked list in an adjacency list becomes too long, replacing it with a red-black tree or hash table can speed up lookups.
- An adjacency matrix trades space for time, while an adjacency list trades time for space.
- Graphs can model real-world systems such as social networks and subway networks.
- A tree is a special case of a graph, and tree traversal is a special case of graph traversal.
- Breadth-first traversal searches a graph from near to far, expanding one layer at a time. It usually uses a queue.
- Depth-first traversal searches a graph by following a path as far as possible, then backtracking. It is often implemented recursively.

### 2. &nbsp; Q & A

**Q**: Is a path defined as a sequence of vertices or a sequence of edges?

Different language editions of Wikipedia give different definitions. The English edition describes a path as a sequence of edges, while the Chinese edition describes it as a sequence of vertices. The English text reads: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.

Here we treat a path as a sequence of edges rather than a sequence of vertices. Two vertices can be joined by multiple edges, in which case each edge gives a distinct path.

**Q**: Can some vertices be unreachable when traversing a disconnected graph?

In a disconnected graph, at least one vertex is unreachable from a given starting vertex. To visit every connected component, start traversals from multiple vertices.

**Q**: In an adjacency list, must the neighbors of a vertex appear in a particular order?

Any order is valid. In practice, you might sort the neighbors by a rule, such as the order in which the vertices were added or the values of the vertices. This can make it easier to find a vertex with a particular extreme value.
