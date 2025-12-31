---
comments: true
---

# 9.3 &nbsp; Graph Traversal

Trees represent "one-to-many" relationships, while graphs have a higher degree of freedom and can represent any "many-to-many" relationships. Therefore, we can view trees as a special case of graphs. Clearly, **tree traversal operations are also a special case of graph traversal operations**.

Both graphs and trees require the application of search algorithms to implement traversal operations. Graph traversal methods can also be divided into two types: <u>breadth-first traversal</u> and <u>depth-first traversal</u>.

## 9.3.1 &nbsp; Breadth-First Search

**Breadth-first search is a near-to-far traversal method that, starting from a certain node, always prioritizes visiting the nearest vertices and expands outward layer by layer**. As shown in Figure 9-9, starting from the top-left vertex, first traverse all adjacent vertices of that vertex, then traverse all adjacent vertices of the next vertex, and so on, until all vertices have been visited.

![Breadth-first search of a graph](graph_traversal.assets/graph_bfs.png){ class="animation-figure" }

<p align="center"> Figure 9-9 &nbsp; Breadth-first search of a graph </p>

### 1. &nbsp; Algorithm Implementation

BFS is typically implemented with the help of a queue, as shown in the code below. The queue has a "first in, first out" property, which aligns with the BFS idea of "near to far".

1. Add the starting vertex `startVet` to the queue and begin the loop.
2. In each iteration of the loop, pop the vertex at the front of the queue and record it as visited, then add all adjacent vertices of that vertex to the back of the queue.
3. Repeat step `2.` until all vertices have been visited.

To prevent revisiting vertices, we use a hash set `visited` to record which nodes have been visited.

!!! tip

    A hash set can be viewed as a hash table that stores only `key` without storing `value`. It can perform addition, deletion, lookup, and modification operations on `key` in $O(1)$ time complexity. Based on the uniqueness of `key`, hash sets are typically used for data deduplication and similar scenarios.

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Breadth-first traversal"""
        # Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
        # Vertex traversal sequence
        res = []
        # Hash set for recording vertices that have been visited
        visited = set[Vertex]([start_vet])
        # Queue used to implement BFS
        que = deque[Vertex]([start_vet])
        # Starting from vertex vet, loop until all vertices are visited
        while len(que) > 0:
            vet = que.popleft()  # Dequeue the front vertex
            res.append(vet)  # Record visited vertex
            # Traverse all adjacent vertices of this vertex
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # Skip vertices that have been visited
                que.append(adj_vet)  # Only enqueue unvisited vertices
                visited.add(adj_vet)  # Mark this vertex as visited
        # Return vertex traversal sequence
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // Vertex traversal sequence
        vector<Vertex *> res;
        // Hash set for recording vertices that have been visited
        unordered_set<Vertex *> visited = {startVet};
        // Queue used to implement BFS
        queue<Vertex *> que;
        que.push(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // Dequeue the front vertex
            res.push_back(vet); // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // Skip vertices that have been visited
                que.push(adjVet);        // Only enqueue unvisited vertices
                visited.emplace(adjVet); // Mark this vertex as visited
            }
        }
        // Return vertex traversal sequence
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set for recording vertices that have been visited
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Queue used to implement BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Dequeue the front vertex
            res.add(vet);            // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Skip vertices that have been visited
                que.offer(adjVet);   // Only enqueue unvisited vertices
                visited.add(adjVet); // Mark this vertex as visited
            }
        }
        // Return vertex traversal sequence
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = [];
        // Hash set for recording vertices that have been visited
        HashSet<Vertex> visited = [startVet];
        // Queue used to implement BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Dequeue the front vertex
            res.Add(vet);               // Record visited vertex
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Skip vertices that have been visited
                }
                que.Enqueue(adjVet);   // Only enqueue unvisited vertices
                visited.Add(adjVet);   // Mark this vertex as visited
            }
        }

        // Return vertex traversal sequence
        return res;
    }
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
        // Vertex traversal sequence
        res := make([]Vertex, 0)
        // Hash set for recording vertices that have been visited
        visited := make(map[Vertex]struct{})
        visited[startVet] = struct{}{}
        // Queue used to implement BFS, using slice to simulate queue
        queue := make([]Vertex, 0)
        queue = append(queue, startVet)
        // Starting from vertex vet, loop until all vertices are visited
        for len(queue) > 0 {
            // Dequeue the front vertex
            vet := queue[0]
            queue = queue[1:]
            // Record visited vertex
            res = append(res, vet)
            // Traverse all adjacent vertices of this vertex
            for _, adjVet := range g.adjList[vet] {
                _, isExist := visited[adjVet]
                // Only enqueue unvisited vertices
                if !isExist {
                    queue = append(queue, adjVet)
                    visited[adjVet] = struct{}{}
                }
            }
        }
        // Return vertex traversal sequence
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // Vertex traversal sequence
        var res: [Vertex] = []
        // Hash set for recording vertices that have been visited
        var visited: Set<Vertex> = [startVet]
        // Queue used to implement BFS
        var que: [Vertex] = [startVet]
        // Starting from vertex vet, loop until all vertices are visited
        while !que.isEmpty {
            let vet = que.removeFirst() // Dequeue the front vertex
            res.append(vet) // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            for adjVet in graph.adjList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue // Skip vertices that have been visited
                }
                que.append(adjVet) // Only enqueue unvisited vertices
                visited.insert(adjVet) // Mark this vertex as visited
            }
        }
        // Return vertex traversal sequence
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    function graphBFS(graph, startVet) {
        // Vertex traversal sequence
        const res = [];
        // Hash set for recording vertices that have been visited
        const visited = new Set();
        visited.add(startVet);
        // Queue used to implement BFS
        const que = [startVet];
        // Starting from vertex vet, loop until all vertices are visited
        while (que.length) {
            const vet = que.shift(); // Dequeue the front vertex
            res.push(vet); // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // Skip vertices that have been visited
                }
                que.push(adjVet); // Only enqueue unvisited vertices
                visited.add(adjVet); // Mark this vertex as visited
            }
        }
        // Return vertex traversal sequence
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // Vertex traversal sequence
        const res: Vertex[] = [];
        // Hash set for recording vertices that have been visited
        const visited: Set<Vertex> = new Set();
        visited.add(startVet);
        // Queue used to implement BFS
        const que = [startVet];
        // Starting from vertex vet, loop until all vertices are visited
        while (que.length) {
            const vet = que.shift(); // Dequeue the front vertex
            res.push(vet); // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // Skip vertices that have been visited
                }
                que.push(adjVet); // Only enqueue unvisited
                visited.add(adjVet); // Mark this vertex as visited
            }
        }
        // Return vertex traversal sequence
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    /* Breadth-first traversal */
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
      // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
      // Vertex traversal sequence
      List<Vertex> res = [];
      // Hash set for recording vertices that have been visited
      Set<Vertex> visited = {};
      visited.add(startVet);
      // Queue used to implement BFS
      Queue<Vertex> que = Queue();
      que.add(startVet);
      // Starting from vertex vet, loop until all vertices are visited
      while (que.isNotEmpty) {
        Vertex vet = que.removeFirst(); // Dequeue the front vertex
        res.add(vet); // Record visited vertex
        // Traverse all adjacent vertices of this vertex
        for (Vertex adjVet in graph.adjList[vet]!) {
          if (visited.contains(adjVet)) {
            continue; // Skip vertices that have been visited
          }
          que.add(adjVet); // Only enqueue unvisited vertices
          visited.add(adjVet); // Mark this vertex as visited
        }
      }
      // Return vertex traversal sequence
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // Vertex traversal sequence
        let mut res = vec![];
        // Hash set for recording vertices that have been visited
        let mut visited = HashSet::new();
        visited.insert(start_vet);
        // Queue used to implement BFS
        let mut que = VecDeque::new();
        que.push_back(start_vet);
        // Starting from vertex vet, loop until all vertices are visited
        while let Some(vet) = que.pop_front() {
            res.push(vet); // Record visited vertex

            // Traverse all adjacent vertices of this vertex
            if let Some(adj_vets) = graph.adj_list.get(&vet) {
                for &adj_vet in adj_vets {
                    if visited.contains(&adj_vet) {
                        continue; // Skip vertices that have been visited
                    }
                    que.push_back(adj_vet); // Only enqueue unvisited vertices
                    visited.insert(adj_vet); // Mark this vertex as visited
                }
            }
        }
        // Return vertex traversal sequence
        res
    }
    ```

=== "C"

    ```c title="graph_bfs.c"
    /* Node queue structure */
    typedef struct {
        Vertex *vertices[MAX_SIZE];
        int front, rear, size;
    } Queue;

    /* Constructor */
    Queue *newQueue() {
        Queue *q = (Queue *)malloc(sizeof(Queue));
        q->front = q->rear = q->size = 0;
        return q;
    }

    /* Check if the queue is empty */
    int isEmpty(Queue *q) {
        return q->size == 0;
    }

    /* Enqueue operation */
    void enqueue(Queue *q, Vertex *vet) {
        q->vertices[q->rear] = vet;
        q->rear = (q->rear + 1) % MAX_SIZE;
        q->size++;
    }

    /* Dequeue operation */
    Vertex *dequeue(Queue *q) {
        Vertex *vet = q->vertices[q->front];
        q->front = (q->front + 1) % MAX_SIZE;
        q->size--;
        return vet;
    }

    /* Check if vertex has been visited */
    int isVisited(Vertex **visited, int size, Vertex *vet) {
        // Traverse to find node using O(n) time
        for (int i = 0; i < size; i++) {
            if (visited[i] == vet)
                return 1;
        }
        return 0;
    }

    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
        // Queue used to implement BFS
        Queue *queue = newQueue();
        enqueue(queue, startVet);
        visited[(*visitedSize)++] = startVet;
        // Starting from vertex vet, loop until all vertices are visited
        while (!isEmpty(queue)) {
            Vertex *vet = dequeue(queue); // Dequeue the front vertex
            res[(*resSize)++] = vet;      // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            AdjListNode *node = findNode(graph, vet);
            while (node != NULL) {
                // Skip vertices that have been visited
                if (!isVisited(visited, *visitedSize, node->vertex)) {
                    enqueue(queue, node->vertex);             // Only enqueue unvisited vertices
                    visited[(*visitedSize)++] = node->vertex; // Mark this vertex as visited
                }
                node = node->next;
            }
        }
        // Free memory
        free(queue);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_bfs.kt"
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
        // Vertex traversal sequence
        val res = mutableListOf<Vertex?>()
        // Hash set for recording vertices that have been visited
        val visited = HashSet<Vertex>()
        visited.add(startVet)
        // Queue used to implement BFS
        val que = LinkedList<Vertex>()
        que.offer(startVet)
        // Starting from vertex vet, loop until all vertices are visited
        while (!que.isEmpty()) {
            val vet = que.poll() // Dequeue the front vertex
            res.add(vet)         // Record visited vertex
            // Traverse all adjacent vertices of this vertex
            for (adjVet in graph.adjList[vet]!!) {
                if (visited.contains(adjVet))
                    continue        // Skip vertices that have been visited
                que.offer(adjVet)   // Only enqueue unvisited vertices
                visited.add(adjVet) // Mark this vertex as visited
            }
        }
        // Return vertex traversal sequence
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_bfs.rb"
    ### Breadth-first traversal ###
    def graph_bfs(graph, start_vet)
      # Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
      # Vertex traversal sequence
      res = []
      # Hash set for recording vertices that have been visited
      visited = Set.new([start_vet])
      # Queue used to implement BFS
      que = [start_vet]
      # Starting from vertex vet, loop until all vertices are visited
      while que.length > 0
        vet = que.shift # Dequeue the front vertex
        res << vet # Record visited vertex
        # Traverse all adjacent vertices of this vertex
        for adj_vet in graph.adj_list[vet]
          next if visited.include?(adj_vet) # Skip vertices that have been visited
          que << adj_vet # Only enqueue unvisited vertices
          visited.add(adj_vet) # Mark this vertex as visited
        end
      end
      # Return vertex traversal sequence
      res
    end
    ```

The code is relatively abstract; it is recommended to refer to Figure 9-10 to deepen understanding.

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

!!! question "Is the breadth-first traversal sequence unique?"

    Not unique. Breadth-first search only requires traversing in a "near to far" order, **and the traversal order of vertices at the same distance can be arbitrarily shuffled**. Taking Figure 9-10 as an example, the visit order of vertices $1$ and $3$ can be swapped, as can the visit order of vertices $2$, $4$, and $6$.

### 2. &nbsp; Complexity Analysis

**Time complexity**: All vertices will be enqueued and dequeued once, using $O(|V|)$ time; in the process of traversing adjacent vertices, since it is an undirected graph, all edges will be visited $2$ times, using $O(2|E|)$ time; overall using $O(|V| + |E|)$ time.

**Space complexity**: The list `res`, hash set `visited`, and queue `que` can contain at most $|V|$ vertices, using $O(|V|)$ space.

## 9.3.2 &nbsp; Depth-First Search

**Depth-first search is a traversal method that prioritizes going as far as possible, then backtracks when no path remains**. As shown in Figure 9-11, starting from the top-left vertex, visit an adjacent vertex of the current vertex, continuing until reaching a dead end, then return and continue going as far as possible before returning again, and so on, until all vertices have been traversed.

![Depth-first search of a graph](graph_traversal.assets/graph_dfs.png){ class="animation-figure" }

<p align="center"> Figure 9-11 &nbsp; Depth-first search of a graph </p>

### 1. &nbsp; Algorithm Implementation

This "go as far as possible then return" algorithm paradigm is typically implemented using recursion. Similar to breadth-first search, in depth-first search we also need a hash set `visited` to record visited vertices and avoid revisiting.

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """Depth-first traversal helper function"""
        res.append(vet)  # Record visited vertex
        visited.add(vet)  # Mark this vertex as visited
        # Traverse all adjacent vertices of this vertex
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # Skip vertices that have been visited
            # Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Depth-first traversal"""
        # Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
        # Vertex traversal sequence
        res = []
        # Hash set for recording vertices that have been visited
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* Depth-first traversal helper function */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // Record visited vertex
        visited.emplace(vet); // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // Skip vertices that have been visited
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // Vertex traversal sequence
        vector<Vertex *> res;
        // Hash set for recording vertices that have been visited
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
        visited.add(vet); // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Skip vertices that have been visited
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set for recording vertices that have been visited
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    /* Depth-first traversal helper function */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Record visited vertex
        visited.Add(vet); // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Skip vertices that have been visited
            }
            // Recursively visit adjacent vertices
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = [];
        // Hash set for recording vertices that have been visited
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* Depth-first traversal helper function */
    func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
        // append operation returns a new reference, must reassign original reference to new slice's reference
        *res = append(*res, vet)
        visited[vet] = struct{}{}
        // Traverse all adjacent vertices of this vertex
        for _, adjVet := range g.adjList[vet] {
            _, isExist := visited[adjVet]
            // Recursively visit adjacent vertices
            if !isExist {
                dfs(g, visited, res, adjVet)
            }
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
        // Vertex traversal sequence
        res := make([]Vertex, 0)
        // Hash set for recording vertices that have been visited
        visited := make(map[Vertex]struct{})
        dfs(g, visited, &res, startVet)
        // Return vertex traversal sequence
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* Depth-first traversal helper function */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // Record visited vertex
        visited.insert(vet) // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Skip vertices that have been visited
            }
            // Recursively visit adjacent vertices
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // Vertex traversal sequence
        var res: [Vertex] = []
        // Hash set for recording vertices that have been visited
        var visited: Set<Vertex> = []
        dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    function dfs(graph, visited, res, vet) {
        res.push(vet); // Record visited vertex
        visited.add(vet); // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // Skip vertices that have been visited
            }
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    function graphDFS(graph, startVet) {
        // Vertex traversal sequence
        const res = [];
        // Hash set for recording vertices that have been visited
        const visited = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_dfs.ts"
    /* Depth-first traversal helper function */
    function dfs(
        graph: GraphAdjList,
        visited: Set<Vertex>,
        res: Vertex[],
        vet: Vertex
    ): void {
        res.push(vet); // Record visited vertex
        visited.add(vet); // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // Skip vertices that have been visited
            }
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // Vertex traversal sequence
        const res: Vertex[] = [];
        // Hash set for recording vertices that have been visited
        const visited: Set<Vertex> = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_dfs.dart"
    /* Depth-first traversal helper function */
    void dfs(
      GraphAdjList graph,
      Set<Vertex> visited,
      List<Vertex> res,
      Vertex vet,
    ) {
      res.add(vet); // Record visited vertex
      visited.add(vet); // Mark this vertex as visited
      // Traverse all adjacent vertices of this vertex
      for (Vertex adjVet in graph.adjList[vet]!) {
        if (visited.contains(adjVet)) {
          continue; // Skip vertices that have been visited
        }
        // Recursively visit adjacent vertices
        dfs(graph, visited, res, adjVet);
      }
    }

    /* Depth-first traversal */
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
      // Vertex traversal sequence
      List<Vertex> res = [];
      // Hash set for recording vertices that have been visited
      Set<Vertex> visited = {};
      dfs(graph, visited, res, startVet);
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    /* Depth-first traversal helper function */
    fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
        res.push(vet); // Record visited vertex
        visited.insert(vet); // Mark this vertex as visited
                             // Traverse all adjacent vertices of this vertex
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // Skip vertices that have been visited
                }
                // Recursively visit adjacent vertices
                dfs(graph, visited, res, adj_vet);
            }
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // Vertex traversal sequence
        let mut res = vec![];
        // Hash set for recording vertices that have been visited
        let mut visited = HashSet::new();
        dfs(&graph, &mut visited, &mut res, start_vet);

        res
    }
    ```

=== "C"

    ```c title="graph_dfs.c"
    /* Check if vertex has been visited */
    int isVisited(Vertex **res, int size, Vertex *vet) {
        // Traverse to find node using O(n) time
        for (int i = 0; i < size; i++) {
            if (res[i] == vet) {
                return 1;
            }
        }
        return 0;
    }

    /* Depth-first traversal helper function */
    void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
        // Record visited vertex
        res[(*resSize)++] = vet;
        // Traverse all adjacent vertices of this vertex
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // Skip vertices that have been visited
            if (!isVisited(res, *resSize, node->vertex)) {
                // Recursively visit adjacent vertices
                dfs(graph, res, resSize, node->vertex);
            }
            node = node->next;
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
        dfs(graph, res, resSize, startVet);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_dfs.kt"
    /* Depth-first traversal helper function */
    fun dfs(
        graph: GraphAdjList,
        visited: MutableSet<Vertex?>,
        res: MutableList<Vertex?>,
        vet: Vertex?
    ) {
        res.add(vet)     // Record visited vertex
        visited.add(vet) // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue  // Skip vertices that have been visited
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet)
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
        // Vertex traversal sequence
        val res = mutableListOf<Vertex?>()
        // Hash set for recording vertices that have been visited
        val visited = HashSet<Vertex?>()
        dfs(graph, visited, res, startVet)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_dfs.rb"
    ### Depth-first traversal helper function ###
    def dfs(graph, visited, res, vet)
      res << vet # Record visited vertex
      visited.add(vet) # Mark this vertex as visited
      # Traverse all adjacent vertices of this vertex
      for adj_vet in graph.adj_list[vet]
        next if visited.include?(adj_vet) # Skip vertices that have been visited
        # Recursively visit adjacent vertices
        dfs(graph, visited, res, adj_vet)
      end
    end

    ### Depth-first traversal ###
    def graph_dfs(graph, start_vet)
      # Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
      # Vertex traversal sequence
      res = []
      # Hash set for recording vertices that have been visited
      visited = Set.new
      dfs(graph, visited, res, start_vet)
      res
    end
    ```

The algorithm flow of depth-first search is shown in Figure 9-12.

- **Straight dashed lines represent downward recursion**, indicating that a new recursive method has been initiated to visit a new vertex.
- **Curved dashed lines represent upward backtracking**, indicating that this recursive method has returned to the position where it was initiated.

To deepen understanding, it is recommended to combine Figure 9-12 with the code to mentally simulate (or draw out) the entire DFS process, including when each recursive method is initiated and when it returns.

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

!!! question "Is the depth-first traversal sequence unique?"

    Similar to breadth-first search, the order of depth-first traversal sequences is also not unique. Given a certain vertex, exploring in any direction first is valid, meaning the order of adjacent vertices can be arbitrarily shuffled, all being depth-first search.

    Taking tree traversal as an example, "root $\rightarrow$ left $\rightarrow$ right", "left $\rightarrow$ root $\rightarrow$ right", and "left $\rightarrow$ right $\rightarrow$ root" correspond to pre-order, in-order, and post-order traversals, respectively. They represent three different traversal priorities, yet all three belong to depth-first search.

### 2. &nbsp; Complexity Analysis

**Time complexity**: All vertices will be visited $1$ time, using $O(|V|)$ time; all edges will be visited $2$ times, using $O(2|E|)$ time; overall using $O(|V| + |E|)$ time.

**Space complexity**: The list `res` and hash set `visited` can contain at most $|V|$ vertices, and the maximum recursion depth is $|V|$, therefore using $O(|V|)$ space.
