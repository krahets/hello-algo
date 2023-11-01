# Summary

### Highlights

- A graph consists of vertices and edges and can be represented as a set consisting of a set of vertices and a set of edges.
- Compared to linear relationships (linked lists) and divide and conquer relationships (trees), network relationships (graphs) have a higher degree of freedom and are therefore more complex.
- The edges of a directed graph are directional, any vertex in the connected graph is reachable, and each edge of a weighted graph contains weight variables.
- An adjacency matrix uses a matrix to represent a graph, where each row (column) represents a vertex and the matrix elements represent edges, using $1$ or $0$ to indicate that there is an edge or no edge between two vertices. Adjacency matrix is very efficient in addition, deletion, and checking operations, but it takes up more space.
- An adjacency table uses multiple linked lists to represent a graph, with the $i$th linked list corresponding to vertex $i$, which stores all the neighboring vertices of that vertex. Adjacency lists are more space-efficient compared to adjacency matrices, but are less time-efficient due to the need to traverse the linked lists to find edges.
- When the linked list in the adjacency list is too long, it can be converted to a red-black tree or hash table to improve query efficiency.
- From the point of view of algorithmic thinking, the adjacency matrix embodies "space for time", and the adjacency list embodies "time for space".
- Graphs can be used to model all kinds of real-world systems, such as social networks and subway lines.
- Trees are a special case of graphs, and tree traversal is a special case of graph traversal.
- Breadth-first traversal of a graph is a search that expands from near to far, level by level, usually implemented with the help of a queue.
- Depth-first traversal of a graph is a search that prioritizes going to the bottom and backtracking when there is no way out, often based on recursion.

### Q & A

!!! question "Is a path defined as a sequence of vertices or a sequence of edges?"

    Wikipedia has inconsistent definitions in different languages: the English version says "a path is a sequence of edges", while the Chinese version says "a path is a sequence of vertices". Here is the original English version: In graph theory, a path in a graph is a finite or infinite sequence of edges which joins a sequence of vertices.
    In this paper, a path is considered to be a sequence of edges rather than a sequence of vertices. This is because there may be multiple edges connected between two vertices, when each edge corresponds to a path.

!!! Question "Are there points in a disconnected graph that cannot be traversed?"

    In a disconnected graph, at least one vertex is unreachable from some vertex. Traversing a disconnected graph requires setting up multiple starting points to traverse to all connected components of the graph.

!!! question "In the adjacency list, is there a requirement for the vertex order of "all vertices connected to this vertex"?"

    It can be any order. However, in practice, it may be necessary to sort by a specified rule, such as the order in which the vertices are added, or the order in which the values of the vertices are large or small, etc., which will help to quickly find vertices "with some extreme values".
