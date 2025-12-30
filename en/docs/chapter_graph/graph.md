# Graph

A <u>graph</u> is a nonlinear data structure consisting of <u>vertices</u> and <u>edges</u>. We can abstractly represent a graph $G$ as a set of vertices $V$ and a set of edges $E$. The following example shows a graph containing 5 vertices and 7 edges.

$$
\begin{aligned}
V & = \{ 1, 2, 3, 4, 5 \} \newline
E & = \{ (1,2), (1,3), (1,5), (2,3), (2,4), (2,5), (4,5) \} \newline
G & = \{ V, E \} \newline
\end{aligned}
$$

If we view vertices as nodes and edges as references (pointers) connecting the nodes, we can see graphs as a data structure extended from linked lists. As shown in the figure below, **compared to linear relationships (linked lists) and divide-and-conquer relationships (trees), network relationships (graphs) have a higher degree of freedom and are therefore more complex**.

![Relationships among linked lists, trees, and graphs](graph.assets/linkedlist_tree_graph.png)

## Common Types and Terminology of Graphs

Graphs can be divided into <u>undirected graphs</u> and <u>directed graphs</u> based on whether edges have direction, as shown in the figure below.

- In undirected graphs, edges represent a "bidirectional" connection between two vertices, such as the "friend relationship" on WeChat or QQ.
- In directed graphs, edges have directionality, meaning edges $A \rightarrow B$ and $A \leftarrow B$ are independent of each other, such as the "follow" and "be followed" relationships on Weibo or TikTok.

![Directed and undirected graphs](graph.assets/directed_graph.png)

Graphs can be divided into <u>connected graphs</u> and <u>disconnected graphs</u> based on whether all vertices are connected, as shown in the figure below.

- For connected graphs, starting from any vertex, all other vertices can be reached.
- For disconnected graphs, starting from a certain vertex, at least one vertex cannot be reached.

![Connected and disconnected graphs](graph.assets/connected_graph.png)

We can also add a "weight" variable to edges, resulting in <u>weighted graphs</u> as shown in the figure below. For example, in mobile games like "Honor of Kings", the system calculates the "intimacy" between players based on their shared game time, and such intimacy networks can be represented using weighted graphs.

![Weighted and unweighted graphs](graph.assets/weighted_graph.png)

Graph data structures include the following commonly used terms.

- <u>Adjacency</u>: When two vertices are connected by an edge, these two vertices are said to be "adjacent". In the figure above, the adjacent vertices of vertex 1 are vertices 2, 3, and 5.
- <u>Path</u>: The sequence of edges from vertex A to vertex B is called a "path" from A to B. In the figure above, the edge sequence 1-5-2-4 is a path from vertex 1 to vertex 4.
- <u>Degree</u>: The number of edges a vertex has. For directed graphs, <u>in-degree</u> indicates how many edges point to the vertex, and <u>out-degree</u> indicates how many edges point out from the vertex.

## Representation of Graphs

Common representations of graphs include "adjacency matrices" and "adjacency lists". The following uses undirected graphs as examples.

### Adjacency Matrix

Given a graph with $n$ vertices, an <u>adjacency matrix</u> uses an $n \times n$ matrix to represent the graph, where each row (column) represents a vertex, and matrix elements represent edges, using $1$ or $0$ to indicate whether an edge exists between two vertices.

As shown in the figure below, let the adjacency matrix be $M$ and the vertex list be $V$. Then matrix element $M[i, j] = 1$ indicates that an edge exists between vertex $V[i]$ and vertex $V[j]$, whereas $M[i, j] = 0$ indicates no edge between the two vertices.

![Adjacency matrix representation of a graph](graph.assets/adjacency_matrix.png)

Adjacency matrices have the following properties.

- In simple graphs, vertices cannot connect to themselves, so the elements on the main diagonal of the adjacency matrix are meaningless.
- For undirected graphs, edges in both directions are equivalent, so the adjacency matrix is symmetric about the main diagonal.
- Replacing the elements of the adjacency matrix from $1$ and $0$ to weights allows representation of weighted graphs.

When using adjacency matrices to represent graphs, we can directly access matrix elements to obtain edges, resulting in highly efficient addition, deletion, lookup, and modification operations, all with a time complexity of $O(1)$. However, the space complexity of the matrix is $O(n^2)$, which consumes significant memory.

### Adjacency List

An <u>adjacency list</u> uses $n$ linked lists to represent a graph, with linked list nodes representing vertices. The $i$-th linked list corresponds to vertex $i$ and stores all adjacent vertices of that vertex (vertices connected to that vertex). The figure below shows an example of a graph stored using an adjacency list.

![Adjacency list representation of a graph](graph.assets/adjacency_list.png)

Adjacency lists only store edges that actually exist, and the total number of edges is typically much less than $n^2$, making them more space-efficient. However, finding edges in an adjacency list requires traversing the linked list, so its time efficiency is inferior to that of adjacency matrices.

Observing the figure above, **the structure of adjacency lists is very similar to "chaining" in hash tables, so we can adopt similar methods to optimize efficiency**. For example, when linked lists are long, they can be converted to AVL trees or red-black trees, thereby optimizing time efficiency from $O(n)$ to $O(\log n)$; linked lists can also be converted to hash tables, thereby reducing time complexity to $O(1)$.

## Common Applications of Graphs

As shown in the table below, many real-world systems can be modeled using graphs, and corresponding problems can be reduced to graph computation problems.

<p align="center"> Table <id> &nbsp; Common graphs in real life </p>

|                | Vertices        | Edges                                  | Graph Computation Problem     |
| -------------- | --------------- | -------------------------------------- | ----------------------------- |
| Social network | Users           | Friend relationships                   | Potential friend recommendation |
| Subway lines   | Stations        | Connectivity between stations          | Shortest route recommendation |
| Solar system   | Celestial bodies | Gravitational forces between celestial bodies | Planetary orbit calculation   |
