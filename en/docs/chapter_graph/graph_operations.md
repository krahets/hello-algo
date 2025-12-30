# Basic Operations on Graphs

Basic operations on graphs can be divided into operations on "edges" and operations on "vertices". Under the two representation methods of "adjacency matrix" and "adjacency list", the implementation methods differ.

## Implementation Based on Adjacency Matrix

Given an undirected graph with $n$ vertices, the various operations are implemented as shown in the figure below.

- **Adding or removing an edge**: Directly modify the specified edge in the adjacency matrix, using $O(1)$ time. Since it is an undirected graph, both directions of the edge need to be updated simultaneously.
- **Adding a vertex**: Add a row and a column at the end of the adjacency matrix and fill them all with $0$s, using $O(n)$ time.
- **Removing a vertex**: Delete a row and a column in the adjacency matrix. The worst case occurs when removing the first row and column, requiring $(n-1)^2$ elements to be "moved up and to the left", thus using $O(n^2)$ time.
- **Initialization**: Pass in $n$ vertices, initialize a vertex list `vertices` of length $n$, using $O(n)$ time; initialize an adjacency matrix `adjMat` of size $n \times n$, using $O(n^2)$ time.

=== "Initialize adjacency matrix"
    ![Initialization, adding and removing edges, adding and removing vertices in adjacency matrix](graph_operations.assets/adjacency_matrix_step1_initialization.png)

=== "Add an edge"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.png)

=== "Remove an edge"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.png)

=== "Add a vertex"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.png)

=== "Remove a vertex"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.png)

The following is the implementation code for graphs represented using an adjacency matrix:

```src
[file]{graph_adjacency_matrix}-[class]{graph_adj_mat}-[func]{}
```

## Implementation Based on Adjacency List

Given an undirected graph with a total of $n$ vertices and $m$ edges, the various operations can be implemented as shown in the figure below.

- **Adding an edge**: Add the edge at the end of the corresponding vertex's linked list, using $O(1)$ time. Since it is an undirected graph, edges in both directions need to be added simultaneously.
- **Removing an edge**: Find and remove the specified edge in the corresponding vertex's linked list, using $O(m)$ time. In an undirected graph, edges in both directions need to be removed simultaneously.
- **Adding a vertex**: Add a linked list in the adjacency list and set the new vertex as the head node of the list, using $O(1)$ time.
- **Removing a vertex**: Traverse the entire adjacency list and remove all edges containing the specified vertex, using $O(n + m)$ time.
- **Initialization**: Create $n$ vertices and $2m$ edges in the adjacency list, using $O(n + m)$ time.

=== "Initialize adjacency list"
    ![Initialization, adding and removing edges, adding and removing vertices in adjacency list](graph_operations.assets/adjacency_list_step1_initialization.png)

=== "Add an edge"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.png)

=== "Remove an edge"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.png)

=== "Add a vertex"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.png)

=== "Remove a vertex"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.png)

The following is the adjacency list code implementation. Compared to the figure above, the actual code has the following differences.

- For convenience in adding and removing vertices, and to simplify the code, we use lists (dynamic arrays) instead of linked lists.
- A hash table is used to store the adjacency list, where `key` is the vertex instance and `value` is the list (linked list) of adjacent vertices for that vertex.

Additionally, we use the `Vertex` class to represent vertices in the adjacency list. The reason for this is: if we used list indices to distinguish different vertices as with adjacency matrices, then to delete the vertex at index $i$, we would need to traverse the entire adjacency list and decrement all indices greater than $i$ by $1$, which is very inefficient. However, if each vertex is a unique `Vertex` instance, deleting a vertex does not require modifying other vertices.

```src
[file]{graph_adjacency_list}-[class]{graph_adj_list}-[func]{}
```

## Efficiency Comparison

Assuming the graph has $n$ vertices and $m$ edges, the table below compares the time efficiency and space efficiency of adjacency matrices and adjacency lists. Note that the adjacency list (linked list) corresponds to the implementation in this text, while the adjacency list (hash table) refers specifically to the implementation where all linked lists are replaced with hash tables.

<p align="center"> Table <id> &nbsp; Comparison of adjacency matrix and adjacency list </p>

|                        | Adjacency matrix | Adjacency list (linked list) | Adjacency list (hash table) |
| ---------------------- | ---------------- | ---------------------------- | --------------------------- |
| Determine adjacency    | $O(1)$           | $O(n)$                       | $O(1)$                      |
| Add an edge            | $O(1)$           | $O(1)$                       | $O(1)$                      |
| Remove an edge         | $O(1)$           | $O(n)$                       | $O(1)$                      |
| Add a vertex           | $O(n)$           | $O(1)$                       | $O(1)$                      |
| Remove a vertex        | $O(n^2)$         | $O(n + m)$                   | $O(n)$                      |
| Memory space usage     | $O(n^2)$         | $O(n + m)$                   | $O(n + m)$                  |

Observing the table above, it appears that the adjacency list (hash table) has the best time efficiency and space efficiency. However, in practice, operating on edges in the adjacency matrix is more efficient, requiring only a single array access or assignment operation. Overall, adjacency matrices embody the principle of "trading space for time", while adjacency lists embody "trading time for space".
