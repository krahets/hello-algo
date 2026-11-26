---
comments: true
---

# 9.5 &nbsp; Exercises

## 9.5.1 &nbsp; Check your understanding

### 1. &nbsp; Two ways to represent the same graph {#1-representing-the-same-graph-in-two-ways}

An undirected graph has four vertices `A, B, C, D` and edges
`A-B, A-C, B-C, C-D`.

<!-- numbered-subquestions -->

1. Write the adjacency list for the graph.
2. Fill in the adjacency matrix using only 0s and 1s.
3. Which representation lets you tell whether `A` and `D` are directly connected by checking a single entry?
4. If the graph has many vertices but few edges, which representation usually takes up less space?

??? success "Sample answer"

    1. The adjacency list is shown below.

        ```text
        A: B, C
        B: A, C
        C: A, B, D
        D: C
        ```

    2. The adjacency matrix is shown below.

        | | A | B | C | D |
        | --- | --- | --- | --- | --- |
        | A | 0 | 1 | 1 | 0 |
        | B | 1 | 0 | 1 | 0 |
        | C | 1 | 1 | 0 | 1 |
        | D | 0 | 0 | 1 | 0 |

    3. In the adjacency matrix, you can look up the entry in row `A` and column `D` directly. This makes it easy to check whether any two vertices share an edge.

    4. When a graph has many vertices but few edges, an adjacency list usually takes up less space. It stores only the edges that exist, while an adjacency matrix reserves an entry for every pair of vertices.

### 2. &nbsp; Vertex order in breadth-first and depth-first traversal {#2-breadth-first-and-depth-first-traversal-orders}

An undirected graph has vertices `A, B, C, D, E` and edges
`A-B, A-C, B-D, C-D, D-E`.

Start at A. Whenever there is more than one unvisited neighbor to choose from, choose in alphabetical order.

<!-- numbered-subquestions -->

1. List the vertices in the order a breadth-first search (BFS) visits them.
2. List the vertices in the order a recursive depth-first search (DFS) visits them.
3. Why do both traversals need to keep track of the vertices they have already visited?

??? success "Sample answer"

    1. BFS visits the vertices in the order `A, B, C, D, E`. It visits B and C, which are one edge away from A,
        before visiting D and E, which are farther away.

    2. DFS visits the vertices in the order `A, B, D, C, E`. At each vertex, it explores one unvisited neighbor at a time,
        so it first follows `A → B → D → C`. When C has no unvisited neighbors left, the search returns to D and then visits E.

    3. The graph contains a cycle, such as `A-B-D-C-A`. Without a record of visited vertices,
        a traversal could keep following the cycle and visiting the same vertices indefinitely.

### 3. &nbsp; Can a single BFS visit the entire graph? {#3-can-one-bfs-visit-the-entire-graph}

An undirected graph has vertices `A, B, C, D, E, F`. Its only edges are
`A-B, B-C, D-E`.

<!-- numbered-subquestions -->

1. Which vertices can a single BFS visit if it starts at A?
2. Based on your answer to question 1, does this BFS visit every vertex in the graph? Why or why not?
3. Suppose you scan all the vertices in alphabetical order and start a new BFS whenever you encounter an unvisited vertex.
    Where does each BFS start? How many separate parts (connected components) does the graph have?

??? success "Sample answer"

    1. Starting at A, BFS can visit only the vertices `A, B, C`.

    2. No. The vertices `D, E` form a separate connected component, and F is an isolated vertex.
        There is no path from A to any of these three vertices, so a search starting at A cannot reach them.

    3. The three searches start at `A, D, F` in that order. The sets of vertices they visit are
        `{A, B, C}`, `{D, E}`, and `{F}`, respectively. The graph therefore has three connected components.

## 9.5.2 &nbsp; Programming exercises

### 1. &nbsp; Determine whether a path exists in an undirected graph

An undirected graph has $n$ vertices numbered from $0$ to $n-1$. Each entry `[u, v]` in the array `edges` represents an undirected edge between vertices `u` and `v`.

You are also given a start vertex `source` and an end vertex `destination`. First build an adjacency list from `edges`, then use BFS or DFS
to determine whether a path leads from `source` to `destination`. Return `true` if a path exists and `false` otherwise.
The graph may contain cycles and may be disconnected.

??? tip "Hints"

    1. Add each undirected edge in both directions.
    2. The graph may contain cycles, so keep track of the vertices you have visited.
    3. Start at source. Return true if you reach destination, or false if the traversal ends before you reach it.

[LeetCode](https://leetcode.com/problems/find-if-path-exists-in-graph/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
