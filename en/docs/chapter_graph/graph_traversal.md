# Graph traversal

A tree represents one-to-many relationships, whereas a graph allows more freedom and can represent arbitrary many-to-many relationships. We can therefore view a tree as a special case of a graph. Accordingly, **tree traversal is also a special case of graph traversal**.

Both graphs and trees use search algorithms for traversal. Graph traversal can likewise be divided into two types: <u>breadth-first traversal</u> and <u>depth-first traversal</u>.

## Breadth-first traversal

**Breadth-first traversal visits vertices from near to far. Starting from a vertex, it always visits the nearest vertices first and expands outward layer by layer**. In the figure below, we start at the top-left vertex and visit all its adjacent vertices, then visit all the adjacent vertices of the next vertex, and so on until every vertex has been visited.

![Breadth-first traversal of a graph](graph_traversal.assets/graph_bfs.png)

### Algorithm implementation

BFS is usually implemented with a queue, as shown in the code below. A queue's first-in, first-out behavior fits the near-to-far order of BFS.

1. Enqueue the starting vertex `startVet` and begin the loop.
2. In each iteration, dequeue the vertex at the front and record the visit, then enqueue all its adjacent vertices at the rear.
3. Repeat step `2.` until every vertex has been visited.

To avoid visiting a vertex more than once, we use a hash set `visited` to track which vertices have already been visited.

!!! tip

    A hash set can be viewed as a hash table that stores only `key` entries, with no `value` entries. Adding, removing, looking up, and modifying a `key` take $O(1)$ time. Because every `key` is unique, hash sets are commonly used to remove duplicate data.

```src
[file]{graph_bfs}-[class]{}-[func]{graph_bfs}
```

The code is fairly abstract; compare it with the figure below to build your understanding.

=== "<1>"
    ![Steps in breadth-first traversal of a graph](graph_traversal.assets/graph_bfs_step1.png)

=== "<2>"
    ![graph_bfs_step2](graph_traversal.assets/graph_bfs_step2.png)

=== "<3>"
    ![graph_bfs_step3](graph_traversal.assets/graph_bfs_step3.png)

=== "<4>"
    ![graph_bfs_step4](graph_traversal.assets/graph_bfs_step4.png)

=== "<5>"
    ![graph_bfs_step5](graph_traversal.assets/graph_bfs_step5.png)

=== "<6>"
    ![graph_bfs_step6](graph_traversal.assets/graph_bfs_step6.png)

=== "<7>"
    ![graph_bfs_step7](graph_traversal.assets/graph_bfs_step7.png)

=== "<8>"
    ![graph_bfs_step8](graph_traversal.assets/graph_bfs_step8.png)

=== "<9>"
    ![graph_bfs_step9](graph_traversal.assets/graph_bfs_step9.png)

=== "<10>"
    ![graph_bfs_step10](graph_traversal.assets/graph_bfs_step10.png)

=== "<11>"
    ![graph_bfs_step11](graph_traversal.assets/graph_bfs_step11.png)

!!! question "Is the breadth-first traversal order unique?"

    No. Breadth-first traversal only requires vertices to be visited from near to far; **vertices at the same distance may be visited in any order**. In the figure above, vertices $1$ and $3$ can be visited in either order, and vertices $2$, $4$, and $6$ can also be visited in any order.

### Complexity analysis

**Time complexity**: Every vertex is enqueued and dequeued once, taking $O(|V|)$ time. While traversing adjacent vertices, every edge is visited $2$ times because the graph is undirected, taking $O(2|E|)$ time. The total time is $O(|V| + |E|)$.

**Space complexity**: The list `res`, hash set `visited`, and queue `que` each contain at most $|V|$ vertices, requiring $O(|V|)$ space.

## Depth-first traversal

**Depth-first traversal follows a path as far as possible and returns when it can go no farther**. In the figure below, we start at the top-left vertex and move to an adjacent vertex of the current vertex, continuing until we reach a dead end. We then return and explore another path as far as possible, repeating this process until every vertex has been visited.

![Depth-first traversal of a graph](graph_traversal.assets/graph_dfs.png)

### Algorithm implementation

This pattern of going as far as possible and then returning is usually implemented with recursion. As with breadth-first traversal, we use a hash set `visited` to track visited vertices and avoid visiting them again.

```src
[file]{graph_dfs}-[class]{}-[func]{graph_dfs}
```

The figure below shows the steps of depth-first traversal.

- **Straight dashed lines show recursive descent**, where a new recursive call begins to visit another vertex.
- **Curved dashed lines show backtracking**, where a recursive call has returned to the point from which it was made.

To deepen your understanding, follow the figure below alongside the code and mentally simulate (or draw on paper) the entire DFS process, including when each recursive call begins and returns.

=== "<1>"
    ![Steps in depth-first traversal of a graph](graph_traversal.assets/graph_dfs_step1.png)

=== "<2>"
    ![graph_dfs_step2](graph_traversal.assets/graph_dfs_step2.png)

=== "<3>"
    ![graph_dfs_step3](graph_traversal.assets/graph_dfs_step3.png)

=== "<4>"
    ![graph_dfs_step4](graph_traversal.assets/graph_dfs_step4.png)

=== "<5>"
    ![graph_dfs_step5](graph_traversal.assets/graph_dfs_step5.png)

=== "<6>"
    ![graph_dfs_step6](graph_traversal.assets/graph_dfs_step6.png)

=== "<7>"
    ![graph_dfs_step7](graph_traversal.assets/graph_dfs_step7.png)

=== "<8>"
    ![graph_dfs_step8](graph_traversal.assets/graph_dfs_step8.png)

=== "<9>"
    ![graph_dfs_step9](graph_traversal.assets/graph_dfs_step9.png)

=== "<10>"
    ![graph_dfs_step10](graph_traversal.assets/graph_dfs_step10.png)

=== "<11>"
    ![graph_dfs_step11](graph_traversal.assets/graph_dfs_step11.png)

!!! question "Is the depth-first traversal order unique?"

    Like breadth-first traversal, depth-first traversal does not have a unique order. From any vertex, we can explore in any direction first: rearranging the order of adjacent vertices still produces a depth-first traversal.
    
    For example, in tree traversal, "root $\rightarrow$ left $\rightarrow$ right", "left $\rightarrow$ root $\rightarrow$ right", and "left $\rightarrow$ right $\rightarrow$ root" correspond to preorder, inorder, and postorder traversal. They use three different visiting priorities, yet all are depth-first traversals.

### Complexity analysis

**Time complexity**: Every vertex is visited $1$ time, taking $O(|V|)$ time, and every edge is visited $2$ times, taking $O(2|E|)$ time. The total time is $O(|V| + |E|)$.

**Space complexity**: The list `res` and hash set `visited` each contain at most $|V|$ vertices, and the maximum recursion depth is $|V|$, so the space complexity is $O(|V|)$.
