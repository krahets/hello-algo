---
comments: true
---

# 9.3 &nbsp; Graph traversal

Trees represent a "one-to-many" relationship, while graphs have a higher degree of freedom and can represent any "many-to-many" relationship. Therefore, we can consider trees as a special case of graphs. Clearly, **tree traversal operations are also a special case of graph traversal operations**.

Both graphs and trees require the application of search algorithms to implement traversal operations. Graph traversal can be divided into two types: <u>Breadth-First Search (BFS)</u> and <u>Depth-First Search (DFS)</u>.

## 9.3.1 &nbsp; Breadth-first search

**Breadth-first search is a near-to-far traversal method, starting from a certain node, always prioritizing the visit to the nearest vertices and expanding outwards layer by layer**. As shown in Figure 9-9, starting from the top left vertex, first traverse all adjacent vertices of that vertex, then traverse all adjacent vertices of the next vertex, and so on, until all vertices have been visited.

![Breadth-first traversal of a graph](graph_traversal.assets/graph_bfs.png){ class="animation-figure" }

<p align="center"> Figure 9-9 &nbsp; Breadth-first traversal of a graph </p>

### 1. &nbsp; Algorithm implementation

BFS is usually implemented with the help of a queue, as shown in the code below. The queue has a "first in, first out" property, which aligns with the BFS idea of traversing "from near to far".

1. Add the starting vertex `startVet` to the queue and start the loop.
2. In each iteration of the loop, pop the vertex at the front of the queue and record it as visited, then add all adjacent vertices of that vertex to the back of the queue.
3. Repeat step `2.` until all vertices have been visited.

To prevent revisiting vertices, we use a hash set `visited` to record which nodes have been visited.

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Breadth-first traversal"""
        # Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
        # Vertex traversal sequence
        res = []
        # Hash set, used to record visited vertices
        visited = set[Vertex]([start_vet])
        # Queue used to implement BFS
        que = deque[Vertex]([start_vet])
        # Starting from vertex vet, loop until all vertices are visited
        while len(que) > 0:
            vet = que.popleft()  # Dequeue the vertex at the head of the queue
            res.append(vet)  # Record visited vertex
            # Traverse all adjacent vertices of that vertex
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # Skip already visited vertices
                que.append(adj_vet)  # Only enqueue unvisited vertices
                visited.add(adj_vet)  # Mark the vertex as visited
        # Return the vertex traversal sequence
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // Vertex traversal sequence
        vector<Vertex *> res;
        // Hash set, used to record visited vertices
        unordered_set<Vertex *> visited = {startVet};
        // Queue used to implement BFS
        queue<Vertex *> que;
        que.push(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // Dequeue the vertex at the head of the queue
            res.push_back(vet); // Record visited vertex
            // Traverse all adjacent vertices of that vertex
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // Skip already visited vertices
                que.push(adjVet);        // Only enqueue unvisited vertices
                visited.emplace(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal sequence
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set, used to record visited vertices
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Queue used to implement BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Dequeue the vertex at the head of the queue
            res.add(vet);            // Record visited vertex
            // Traverse all adjacent vertices of that vertex
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Skip already visited vertices
                que.offer(adjVet);   // Only enqueue unvisited vertices
                visited.add(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal sequence
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    [class]{graph_bfs}-[func]{GraphBFS}
    ```

=== "Go"

    ```go title="graph_bfs.go"
    [class]{}-[func]{graphBFS}
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    [class]{}-[func]{graphBFS}
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    [class]{}-[func]{graphBFS}
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    [class]{}-[func]{graphBFS}
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    [class]{}-[func]{graphBFS}
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    [class]{}-[func]{graph_bfs}
    ```

=== "C"

    ```c title="graph_bfs.c"
    [class]{Queue}-[func]{}

    [class]{}-[func]{isVisited}

    [class]{}-[func]{graphBFS}
    ```

=== "Kotlin"

    ```kotlin title="graph_bfs.kt"
    [class]{}-[func]{graphBFS}
    ```

=== "Ruby"

    ```ruby title="graph_bfs.rb"
    [class]{}-[func]{graph_bfs}
    ```

=== "Zig"

    ```zig title="graph_bfs.zig"
    [class]{}-[func]{graphBFS}
    ```

The code is relatively abstract, it is suggested to compare with Figure 9-10 to deepen the understanding.

=== "<1>"
    ![Steps of breadth-first search of a graph](graph_traversal.assets/graph_bfs_step1.png){ class="animation-figure" }

=== "<2>"
    ![graph_bfs_step2](graph_traversal.assets/graph_bfs_step2.png){ class="animation-figure" }

=== "<3>"
    ![graph_bfs_step3](graph_traversal.assets/graph_bfs_step3.png){ class="animation-figure" }

=== "<4>"
    ![graph_bfs_step4](graph_traversal.assets/graph_bfs_step4.png){ class="animation-figure" }

=== "<5>"
    ![graph_bfs_step5](graph_traversal.assets/graph_bfs_step5.png){ class="animation-figure" }

=== "<6>"
    ![graph_bfs_step6](graph_traversal.assets/graph_bfs_step6.png){ class="animation-figure" }

=== "<7>"
    ![graph_bfs_step7](graph_traversal.assets/graph_bfs_step7.png){ class="animation-figure" }

=== "<8>"
    ![graph_bfs_step8](graph_traversal.assets/graph_bfs_step8.png){ class="animation-figure" }

=== "<9>"
    ![graph_bfs_step9](graph_traversal.assets/graph_bfs_step9.png){ class="animation-figure" }

=== "<10>"
    ![graph_bfs_step10](graph_traversal.assets/graph_bfs_step10.png){ class="animation-figure" }

=== "<11>"
    ![graph_bfs_step11](graph_traversal.assets/graph_bfs_step11.png){ class="animation-figure" }

<p align="center"> Figure 9-10 &nbsp; Steps of breadth-first search of a graph </p>

!!! question "Is the sequence of breadth-first traversal unique?"

    Not unique. Breadth-first traversal only requires traversing in a "from near to far" order, **and the traversal order of multiple vertices at the same distance can be arbitrarily shuffled**. For example, in Figure 9-10, the visitation order of vertices $1$ and $3$ can be switched, as can the order of vertices $2$, $4$, and $6$.

### 2. &nbsp; Complexity analysis

**Time complexity**: All vertices will be enqueued and dequeued once, using $O(|V|)$ time; in the process of traversing adjacent vertices, since it is an undirected graph, all edges will be visited $2$ times, using $O(2|E|)$ time; overall using $O(|V| + |E|)$ time.

**Space complexity**: The maximum number of vertices in list `res`, hash set `visited`, and queue `que` is $|V|$, using $O(|V|)$ space.

## 9.3.2 &nbsp; Depth-first search

**Depth-first search is a traversal method that prioritizes going as far as possible and then backtracks when no further paths are available**. As shown in Figure 9-11, starting from the top left vertex, visit some adjacent vertex of the current vertex until no further path is available, then return and continue until all vertices are traversed.

![Depth-first traversal of a graph](graph_traversal.assets/graph_dfs.png){ class="animation-figure" }

<p align="center"> Figure 9-11 &nbsp; Depth-first traversal of a graph </p>

### 1. &nbsp; Algorithm implementation

This "go as far as possible and then return" algorithm paradigm is usually implemented based on recursion. Similar to breadth-first search, in depth-first search, we also need the help of a hash set `visited` to record the visited vertices to avoid revisiting.

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """Depth-first traversal helper function"""
        res.append(vet)  # Record visited vertex
        visited.add(vet)  # Mark the vertex as visited
        # Traverse all adjacent vertices of that vertex
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # Skip already visited vertices
            # Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Depth-first traversal"""
        # Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
        # Vertex traversal sequence
        res = []
        # Hash set, used to record visited vertices
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* Depth-first traversal helper function */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // Record visited vertex
        visited.emplace(vet); // Mark the vertex as visited
        // Traverse all adjacent vertices of that vertex
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // Skip already visited vertices
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // Vertex traversal sequence
        vector<Vertex *> res;
        // Hash set, used to record visited vertices
        unordered_set<Vertex *> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Java"

    ```java title="graph_dfs.java"
    /* Depth-first traversal helper function */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // Record visited vertex
        visited.add(vet); // Mark the vertex as visited
        // Traverse all adjacent vertices of that vertex
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Skip already visited vertices
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set, used to record visited vertices
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    [class]{graph_dfs}-[func]{DFS}

    [class]{graph_dfs}-[func]{GraphDFS}
    ```

=== "Go"

    ```go title="graph_dfs.go"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "TS"

    ```typescript title="graph_dfs.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "Dart"

    ```dart title="graph_dfs.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graph_dfs}
    ```

=== "C"

    ```c title="graph_dfs.c"
    [class]{}-[func]{isVisited}

    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "Kotlin"

    ```kotlin title="graph_dfs.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "Ruby"

    ```ruby title="graph_dfs.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graph_dfs}
    ```

=== "Zig"

    ```zig title="graph_dfs.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

The algorithm process of depth-first search is shown in Figure 9-12.

- **Dashed lines represent downward recursion**, indicating that a new recursive method has been initiated to visit a new vertex.
- **Curved dashed lines represent upward backtracking**, indicating that this recursive method has returned to the position where this method was initiated.

To deepen the understanding, it is suggested to combine Figure 9-12 with the code to simulate (or draw) the entire DFS process in your mind, including when each recursive method is initiated and when it returns.

=== "<1>"
    ![Steps of depth-first search of a graph](graph_traversal.assets/graph_dfs_step1.png){ class="animation-figure" }

=== "<2>"
    ![graph_dfs_step2](graph_traversal.assets/graph_dfs_step2.png){ class="animation-figure" }

=== "<3>"
    ![graph_dfs_step3](graph_traversal.assets/graph_dfs_step3.png){ class="animation-figure" }

=== "<4>"
    ![graph_dfs_step4](graph_traversal.assets/graph_dfs_step4.png){ class="animation-figure" }

=== "<5>"
    ![graph_dfs_step5](graph_traversal.assets/graph_dfs_step5.png){ class="animation-figure" }

=== "<6>"
    ![graph_dfs_step6](graph_traversal.assets/graph_dfs_step6.png){ class="animation-figure" }

=== "<7>"
    ![graph_dfs_step7](graph_traversal.assets/graph_dfs_step7.png){ class="animation-figure" }

=== "<8>"
    ![graph_dfs_step8](graph_traversal.assets/graph_dfs_step8.png){ class="animation-figure" }

=== "<9>"
    ![graph_dfs_step9](graph_traversal.assets/graph_dfs_step9.png){ class="animation-figure" }

=== "<10>"
    ![graph_dfs_step10](graph_traversal.assets/graph_dfs_step10.png){ class="animation-figure" }

=== "<11>"
    ![graph_dfs_step11](graph_traversal.assets/graph_dfs_step11.png){ class="animation-figure" }

<p align="center"> Figure 9-12 &nbsp; Steps of depth-first search of a graph </p>

!!! question "Is the sequence of depth-first traversal unique?"

    Similar to breadth-first traversal, the order of the depth-first traversal sequence is also not unique. Given a certain vertex, exploring in any direction first is possible, that is, the order of adjacent vertices can be arbitrarily shuffled, all being part of depth-first traversal.

    Taking tree traversal as an example, "root $\rightarrow$ left $\rightarrow$ right", "left $\rightarrow$ root $\rightarrow$ right", "left $\rightarrow$ right $\rightarrow$ root" correspond to pre-order, in-order, and post-order traversals, respectively. They showcase three types of traversal priorities, yet all three are considered depth-first traversal.

### 2. &nbsp; Complexity analysis

**Time complexity**: All vertices will be visited once, using $O(|V|)$ time; all edges will be visited twice, using $O(2|E|)$ time; overall using $O(|V| + |E|)$ time.

**Space complexity**: The maximum number of vertices in list `res`, hash set `visited` is $|V|$, and the maximum recursion depth is $|V|$, therefore using $O(|V|)$ space.
