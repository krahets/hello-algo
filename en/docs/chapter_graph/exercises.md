# Exercises

## Concept Review

### Represent the Same Graph in Two Ways

An undirected graph has four vertices, `A, B, C, D`, and the edges
`A-B, A-C, B-C, C-D`.

<!-- numbered-subquestions -->

1. Write its adjacency list.
2. Fill in its adjacency matrix using only 0s and 1s.
3. To determine whether `A` and `D` are directly connected, which graph representation requires checking only one stored entry?
4. If a graph has many vertices but few edges, which representation usually uses less space?

??? success "Answer"

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

    3. In an adjacency matrix, you can directly check row `A`, column `D`, making it well suited to determining whether any two vertices are directly connected.

    4. When a graph has many vertices but few edges, an adjacency list records only the edges that actually exist. It usually uses less space than an adjacency matrix, which reserves a position for every pair of vertices.

### Breadth-First and Depth-First Traversal Orders

An undirected graph has vertices `A, B, C, D, E` and edges
`A-B, A-C, B-D, C-D, D-E`.

Start at A. Whenever there are several unvisited adjacent vertices, choose them in alphabetical order:

<!-- numbered-subquestions -->

1. Write the visit order of breadth-first traversal (BFS).
2. Write the visit order of recursive depth-first traversal (DFS).
3. Why must both traversals record which vertices have already been visited?

??? success "Answer"

    1. The BFS visit order is `A, B, C, D, E`. It first visits B and C, which are one edge away from A,
        and then visits the more distant D and E.

    2. The DFS visit order is `A, B, D, C, E`. It repeatedly enters an unvisited adjacent vertex,
        first following `A → B → D → C`. When C has no new adjacent vertex, it returns to D and then visits E.

    3. The graph contains a cycle, such as `A-B-D-C-A`. Without recording visited vertices,
        a traversal could repeatedly visit the same vertices around the cycle and fail to terminate normally.

### Can One BFS Visit the Entire Graph?

An undirected graph has vertices `A, B, C, D, E, F` and only the edges
`A-B, B-C, D-E`.

<!-- numbered-subquestions -->

1. Which vertices can one BFS starting at A visit?
2. Based on Question 1, has this BFS visited every vertex in the graph? Why or why not?
3. Suppose you scan all vertices in alphabetical order and start a new BFS whenever you reach an unvisited vertex.
    What is the starting vertex of each BFS? Into how many mutually disconnected parts (connected components) is the graph divided?

??? success "Answer"

    1. Starting from A, the traversal can visit only `A, B, C`.

    2. It has not visited every vertex. `D, E` form another connected part, while F is an isolated vertex.
        None of them has a path to A, so they cannot be reached from A.

    3. The three BFS traversals start at `A, D, F`, and visit
        `{A, B, C}`, `{D, E}`, and `{F}`, respectively. Therefore, the graph has 3 connected components.

## Programming Exercises

### Determine Whether a Path Exists in an Undirected Graph

You are given an undirected graph with $n$ vertices numbered from $0$ to $n-1$. Each entry `[u, v]` in the array `edges` represents an undirected edge between vertices `u` and `v`.

You are also given a starting vertex `source` and a destination vertex `destination`. First build an adjacency list from `edges`, then use BFS or DFS
to determine whether a path exists from `source` to `destination`. Return `true` if one exists and `false` otherwise.
The graph may contain cycles and may be disconnected.

??? tip "Hints"

    1. Add every undirected edge in both directions
    2. The graph may contain cycles, so you must record which vertices have already been visited
    3. Starting from source, return true if you encounter destination; if the traversal ends without reaching it, return false

[LeetCode](https://leetcode.com/problems/find-if-path-exists-in-graph/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
