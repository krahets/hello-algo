# Exercises

## Check your understanding

### Representing the same graph in two ways

An undirected graph has four vertices `A, B, C, D` and edges
`A-B, A-C, B-C, C-D`.

<!-- numbered-subquestions -->

1. Write its adjacency list.
2. Fill in its adjacency matrix using only 0 and 1.
3. Which representation lets us determine whether `A` and `D` are directly connected by inspecting just one stored entry?
4. If a graph has many vertices but few edges, which representation usually uses less space?

??? success "Reference answer"

    1. The adjacency list is:

        ```text
        A: B, C
        B: A, C
        C: A, B, D
        D: C
        ```

    2. The adjacency matrix is:

        | | A | B | C | D |
        | --- | --- | --- | --- | --- |
        | A | 0 | 1 | 1 | 0 |
        | B | 1 | 0 | 1 | 0 |
        | C | 1 | 1 | 0 | 1 |
        | D | 0 | 0 | 1 | 0 |

    3. In the adjacency matrix, we can inspect row `A`, column `D` directly. This makes it well suited to checking whether any two vertices are directly connected.

    4. When there are many vertices but few edges, an adjacency list records only existing edges. It usually uses less space than an adjacency matrix, which reserves an entry for every pair of vertices.

### Breadth-first and depth-first traversal orders

An undirected graph has vertices `A, B, C, D, E` and edges
`A-B, A-C, B-D, C-D, D-E`.

Start at A. Whenever several unvisited neighbors are available, choose them in alphabetical order:

<!-- numbered-subquestions -->

1. Write the breadth-first traversal (BFS) order.
2. Write the recursive depth-first traversal (DFS) order.
3. Why must both traversals keep track of vertices already visited?

??? success "Reference answer"

    1. The BFS order is `A, B, C, D, E`. It first visits B and C, which are one edge away from A,
        and then the more distant D and E.

    2. The DFS order is `A, B, D, C, E`. It proceeds into an unvisited neighbor of the current vertex,
        first following `A → B → D → C`. When C has no new neighbors to visit, it returns to D and then visits E.

    3. The graph contains cycles, such as `A-B-D-C-A`. Without recording visited vertices,
        traversal could repeatedly follow a cycle through the same vertices and fail to terminate.

### Can one BFS visit the entire graph?

An undirected graph has vertices `A, B, C, D, E, F` and only the edges
`A-B, B-C, D-E`.

<!-- numbered-subquestions -->

1. Which vertices can a single BFS starting from A visit?
2. Based on your answer, has this BFS visited every vertex in the graph? Why?
3. Suppose we scan all vertices alphabetically and start a new BFS whenever we encounter an unvisited vertex.
    What are the starting vertices of these searches? How many separate connected parts, or connected components, does the graph have?

??? success "Reference answer"

    1. Starting from A reaches only `A, B, C`.

    2. Not every vertex is visited. `D, E` form another connected part, and F is an isolated vertex.
        None has a path to A, so they cannot be reached from A.

    3. The three BFS starting vertices are `A, D, F`, in order, visiting
        `{A, B, C}`, `{D, E}`, and `{F}`, respectively. Thus, the graph has three connected components.

## Programming exercises

### Checking for a path in an undirected graph

You are given an undirected graph with $n$ vertices numbered from $0$ to $n-1$. Each entry `[u, v]` in the array `edges` represents an undirected edge between vertices `u` and `v`.

You are also given a starting vertex `source` and an ending vertex `destination`. First build an adjacency list from `edges`, then use BFS or DFS
to determine whether a path exists from `source` to `destination`. Return `true` if it does, or `false` otherwise.
The graph may contain cycles and may be disconnected.

??? tip "Hints"

    1. Add each undirected edge in both directions.
    2. The graph may contain cycles, so keep track of vertices already visited.
    3. Starting from source, return true if you reach destination. Return false if traversal ends without reaching it.

[LeetCode](https://leetcode.com/problems/find-if-path-exists-in-graph/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
