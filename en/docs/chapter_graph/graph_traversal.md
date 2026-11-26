---
comments: true
---

# 9.3 &nbsp; Graph traversal

A tree describes one-to-many relationships. A graph allows more flexible connections and can represent arbitrary many-to-many relationships. We can therefore view a tree as a special case of a graph. For the same reason, **tree traversal is a special case of graph traversal**.

Both trees and graphs use search algorithms for traversal. Graph traversal also has two main approaches: <u>breadth-first traversal</u> and <u>depth-first traversal</u>.

## 9.3.1 &nbsp; Breadth-first traversal

**Breadth-first traversal starts at a vertex and visits the nearest vertices first, expanding outward one layer at a time**. In Figure 9-9, we start at the upper-left vertex and visit all its neighbors. We then visit the neighbors of the next vertex and continue until every vertex has been visited.

![Breadth-first traversal of a graph](graph_traversal.assets/graph_bfs.svg){ class="animation-figure" }

<p align="center"> Figure 9-9 &nbsp; Breadth-first traversal of a graph </p>

### 1. &nbsp; Implementation

BFS usually uses a queue, as in the code below. Its first-in, first-out order fits the way BFS visits nearby vertices before more distant ones.

1. Enqueue the starting vertex `startVet` and begin the loop.
2. On each iteration, dequeue the front vertex and record the visit, then add its unvisited neighbors to the back of the queue.
3. Repeat step `2.` until all vertices have been visited.

To avoid repeated visits, use a hash set `visited` to record which vertices have already been visited.

!!! tip

    Think of a hash set as a hash table that stores only a `key`, without an associated `value`. Adding, removing, looking up, or updating a `key` takes $O(1)$ time. Since each `key` is unique, hash sets are often used to remove duplicates.

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Breadth-first traversal"""
        # Represent the graph with an adjacency list to look up all neighbors of a given vertex
        # Vertex traversal order
        res = []
        # Use a hash set to track visited vertices
        visited = set[Vertex]([start_vet])
        # Use a queue for BFS
        que = deque[Vertex]([start_vet])
        # Starting at vertex vet, loop until all reachable vertices have been visited
        while len(que) > 0:
            vet = que.popleft()  # Dequeue the front vertex
            res.append(vet)  # Record the visited vertex
            # Iterate over all neighbors of this vertex
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # Skip visited vertices
                que.append(adj_vet)  # Enqueue only unvisited vertices
                visited.add(adj_vet)  # Mark the vertex as visited
        # Return the vertex traversal order
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // Vertex traversal order
        vector<Vertex *> res;
        // Use a hash set to track visited vertices
        unordered_set<Vertex *> visited = {startVet};
        // Use a queue for BFS
        queue<Vertex *> que;
        que.push(startVet);
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // Dequeue the front vertex
            res.push_back(vet); // Record the visited vertex
            // Iterate over all neighbors of this vertex
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // Skip visited vertices
                que.push(adjVet);        // Enqueue only unvisited vertices
                visited.emplace(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal order
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = new ArrayList<>();
        // Use a hash set to track visited vertices
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Use a queue for BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Dequeue the front vertex
            res.add(vet);            // Record the visited vertex
            // Iterate over all neighbors of this vertex
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Skip visited vertices
                que.offer(adjVet);   // Enqueue only unvisited vertices
                visited.add(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal order
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = [];
        // Use a hash set to track visited vertices
        HashSet<Vertex> visited = [startVet];
        // Use a queue for BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Dequeue the front vertex
            res.Add(vet);               // Record the visited vertex
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Skip visited vertices
                }
                que.Enqueue(adjVet);   // Enqueue only unvisited vertices
                visited.Add(adjVet);   // Mark the vertex as visited
            }
        }

        // Return the vertex traversal order
        return res;
    }
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
        // Vertex traversal order
        res := make([]Vertex, 0)
        // Use a hash set to track visited vertices
        visited := make(map[Vertex]struct{})
        visited[startVet] = struct{}{}
        // Use a slice as the BFS queue
        queue := make([]Vertex, 0)
        queue = append(queue, startVet)
        // Starting at vertex vet, loop until all reachable vertices have been visited
        for len(queue) > 0 {
            // Dequeue the front vertex
            vet := queue[0]
            queue = queue[1:]
            // Record the visited vertex
            res = append(res, vet)
            // Iterate over all neighbors of this vertex
            for _, adjVet := range g.adjList[vet] {
                _, isExist := visited[adjVet]
                // Enqueue only unvisited vertices
                if !isExist {
                    queue = append(queue, adjVet)
                    visited[adjVet] = struct{}{}
                }
            }
        }
        // Return the vertex traversal order
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // Vertex traversal order
        var res: [Vertex] = []
        // Use a hash set to track visited vertices
        var visited: Set<Vertex> = [startVet]
        // Use a queue for BFS
        var que: [Vertex] = [startVet]
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while !que.isEmpty {
            let vet = que.removeFirst() // Dequeue the front vertex
            res.append(vet) // Record the visited vertex
            // Iterate over all neighbors of this vertex
            for adjVet in graph.adjList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue // Skip visited vertices
                }
                que.append(adjVet) // Enqueue only unvisited vertices
                visited.insert(adjVet) // Mark the vertex as visited
            }
        }
        // Return the vertex traversal order
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    function graphBFS(graph, startVet) {
        // Vertex traversal order
        const res = [];
        // Use a hash set to track visited vertices
        const visited = new Set();
        visited.add(startVet);
        // Use a queue for BFS
        const que = [startVet];
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (que.length) {
            const vet = que.shift(); // Dequeue the front vertex
            res.push(vet); // Record the visited vertex
            // Iterate over all neighbors of this vertex
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // Skip visited vertices
                }
                que.push(adjVet); // Enqueue only unvisited vertices
                visited.add(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal order
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // Vertex traversal order
        const res: Vertex[] = [];
        // Use a hash set to track visited vertices
        const visited: Set<Vertex> = new Set();
        visited.add(startVet);
        // Use a queue for BFS
        const que = [startVet];
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (que.length) {
            const vet = que.shift(); // Dequeue the front vertex
            res.push(vet); // Record the visited vertex
            // Iterate over all neighbors of this vertex
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // Skip visited vertices
                }
                que.push(adjVet); // Enqueue only unvisited vertices
                visited.add(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal order
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    /* Breadth-first traversal */
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
      // Represent the graph with an adjacency list to look up all neighbors of a given vertex
      // Vertex traversal order
      List<Vertex> res = [];
      // Use a hash set to track visited vertices
      Set<Vertex> visited = {};
      visited.add(startVet);
      // Use a queue for BFS
      Queue<Vertex> que = Queue();
      que.add(startVet);
      // Starting at vertex vet, loop until all reachable vertices have been visited
      while (que.isNotEmpty) {
        Vertex vet = que.removeFirst(); // Dequeue the front vertex
        res.add(vet); // Record the visited vertex
        // Iterate over all neighbors of this vertex
        for (Vertex adjVet in graph.adjList[vet]!) {
          if (visited.contains(adjVet)) {
            continue; // Skip visited vertices
          }
          que.add(adjVet); // Enqueue only unvisited vertices
          visited.add(adjVet); // Mark the vertex as visited
        }
      }
      // Return the vertex traversal order
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // Vertex traversal order
        let mut res = vec![];
        // Use a hash set to track visited vertices
        let mut visited = HashSet::new();
        visited.insert(start_vet);
        // Use a queue for BFS
        let mut que = VecDeque::new();
        que.push_back(start_vet);
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while let Some(vet) = que.pop_front() {
            res.push(vet); // Record the visited vertex

            // Iterate over all neighbors of this vertex
            if let Some(adj_vets) = graph.adj_list.get(&vet) {
                for &adj_vet in adj_vets {
                    if visited.contains(&adj_vet) {
                        continue; // Skip visited vertices
                    }
                    que.push_back(adj_vet); // Enqueue only unvisited vertices
                    visited.insert(adj_vet); // Mark the vertex as visited
                }
            }
        }
        // Return the vertex traversal order
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

    /* Check whether the queue is empty */
    int isEmpty(Queue *q) {
        return q->size == 0;
    }

    /* Enqueue */
    void enqueue(Queue *q, Vertex *vet) {
        q->vertices[q->rear] = vet;
        q->rear = (q->rear + 1) % MAX_SIZE;
        q->size++;
    }

    /* Dequeue */
    Vertex *dequeue(Queue *q) {
        Vertex *vet = q->vertices[q->front];
        q->front = (q->front + 1) % MAX_SIZE;
        q->size--;
        return vet;
    }

    /* Check whether a vertex has been visited */
    int isVisited(Vertex **visited, int size, Vertex *vet) {
        // Scan for the node in O(n) time
        for (int i = 0; i < size; i++) {
            if (visited[i] == vet)
                return 1;
        }
        return 0;
    }

    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
        // Use a queue for BFS
        Queue *queue = newQueue();
        enqueue(queue, startVet);
        visited[(*visitedSize)++] = startVet;
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (!isEmpty(queue)) {
            Vertex *vet = dequeue(queue); // Dequeue the front vertex
            res[(*resSize)++] = vet;      // Record the visited vertex
            // Iterate over all neighbors of this vertex
            AdjListNode *node = findNode(graph, vet);
            while (node != NULL) {
                // Skip visited vertices
                if (!isVisited(visited, *visitedSize, node->vertex)) {
                    enqueue(queue, node->vertex);             // Enqueue only unvisited vertices
                    visited[(*visitedSize)++] = node->vertex; // Mark the vertex as visited
                }
                node = node->next;
            }
        }
        // Free the memory
        free(queue);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_bfs.kt"
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
        // Vertex traversal order
        val res = mutableListOf<Vertex?>()
        // Use a hash set to track visited vertices
        val visited = HashSet<Vertex>()
        visited.add(startVet)
        // Use a queue for BFS
        val que = LinkedList<Vertex>()
        que.offer(startVet)
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (!que.isEmpty()) {
            val vet = que.poll() // Dequeue the front vertex
            res.add(vet)         // Record the visited vertex
            // Iterate over all neighbors of this vertex
            for (adjVet in graph.adjList[vet]!!) {
                if (visited.contains(adjVet))
                    continue        // Skip visited vertices
                que.offer(adjVet)   // Enqueue only unvisited vertices
                visited.add(adjVet) // Mark the vertex as visited
            }
        }
        // Return the vertex traversal order
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_bfs.rb"
    ### Breadth-first traversal ###
    def graph_bfs(graph, start_vet)
      # Represent the graph with an adjacency list to look up all neighbors of a given vertex
      # Vertex traversal order
      res = []
      # Use a hash set to track visited vertices
      visited = Set.new([start_vet])
      # Use a queue for BFS
      que = [start_vet]
      # Starting at vertex vet, loop until all reachable vertices have been visited
      while que.length > 0
        vet = que.shift # Dequeue the front vertex
        res << vet # Record the visited vertex
        # Iterate over all neighbors of this vertex
        for adj_vet in graph.adj_list[vet]
          next if visited.include?(adj_vet) # Skip visited vertices
          que << adj_vet # Enqueue only unvisited vertices
          visited.add(adj_vet) # Mark the vertex as visited
        end
      end
      # Return the vertex traversal order
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%20%20%22%22%22Vertex%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22Convert%20the%20list%20of%20values%20vals%20to%20a%20list%20of%20vertices%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20represented%20by%20an%20adjacency%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22Breadth-first%20traversal%22%22%22%0A%20%20%20%20%23%20Vertex%20traversal%20order%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20Use%20a%20hash%20table%20to%20track%20visited%20vertices%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20Use%20a%20queue%20for%20BFS%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20Starting%20at%20vertex%20vet,%20loop%20until%20all%20reachable%20vertices%20have%20been%20visited%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20Dequeue%20the%20front%20vertex%0A%20%20%20%20%20%20%20%20res.append%28vet%29%20%20%23%20Record%20the%20visited%20vertex%0A%20%20%20%20%20%20%20%20%23%20Iterate%20over%20all%20neighbors%20of%20this%20vertex%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20Skip%20visited%20vertices%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20Enqueue%20only%20unvisited%20vertices%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20Mark%20the%20vertex%20as%20visited%0A%20%20%20%20%23%20Return%20the%20vertex%20traversal%20order%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20an%20undirected%20graph%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20Breadth-first%20traversal%0A%20%20%20%20res%20%3D%20graph_bfs%28graph,%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%20%20%22%22%22Vertex%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22Convert%20the%20list%20of%20values%20vals%20to%20a%20list%20of%20vertices%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20represented%20by%20an%20adjacency%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22Breadth-first%20traversal%22%22%22%0A%20%20%20%20%23%20Vertex%20traversal%20order%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20Use%20a%20hash%20table%20to%20track%20visited%20vertices%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20Use%20a%20queue%20for%20BFS%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20Starting%20at%20vertex%20vet,%20loop%20until%20all%20reachable%20vertices%20have%20been%20visited%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20Dequeue%20the%20front%20vertex%0A%20%20%20%20%20%20%20%20res.append%28vet%29%20%20%23%20Record%20the%20visited%20vertex%0A%20%20%20%20%20%20%20%20%23%20Iterate%20over%20all%20neighbors%20of%20this%20vertex%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20Skip%20visited%20vertices%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20Enqueue%20only%20unvisited%20vertices%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20Mark%20the%20vertex%20as%20visited%0A%20%20%20%20%23%20Return%20the%20vertex%20traversal%20order%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20an%20undirected%20graph%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20Breadth-first%20traversal%0A%20%20%20%20res%20%3D%20graph_bfs%28graph,%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Follow the code alongside Figure 9-10 to see how each step changes the traversal state.

=== "<1>"
    ![Steps in breadth-first traversal of a graph](graph_traversal.assets/graph_bfs_step1.svg){ class="animation-figure" }

=== "<2>"
    ![graph_bfs_step2](graph_traversal.assets/graph_bfs_step2.svg){ class="animation-figure" }

=== "<3>"
    ![graph_bfs_step3](graph_traversal.assets/graph_bfs_step3.svg){ class="animation-figure" }

=== "<4>"
    ![graph_bfs_step4](graph_traversal.assets/graph_bfs_step4.svg){ class="animation-figure" }

=== "<5>"
    ![graph_bfs_step5](graph_traversal.assets/graph_bfs_step5.svg){ class="animation-figure" }

=== "<6>"
    ![graph_bfs_step6](graph_traversal.assets/graph_bfs_step6.svg){ class="animation-figure" }

=== "<7>"
    ![graph_bfs_step7](graph_traversal.assets/graph_bfs_step7.svg){ class="animation-figure" }

=== "<8>"
    ![graph_bfs_step8](graph_traversal.assets/graph_bfs_step8.svg){ class="animation-figure" }

=== "<9>"
    ![graph_bfs_step9](graph_traversal.assets/graph_bfs_step9.svg){ class="animation-figure" }

=== "<10>"
    ![graph_bfs_step10](graph_traversal.assets/graph_bfs_step10.svg){ class="animation-figure" }

=== "<11>"
    ![graph_bfs_step11](graph_traversal.assets/graph_bfs_step11.svg){ class="animation-figure" }

<p align="center"> Figure 9-10 &nbsp; Steps in breadth-first traversal of a graph </p>

!!! question "Is the breadth-first traversal order unique?"

    No. Breadth-first traversal requires only that nearer vertices be visited before farther ones. **Vertices at the same distance can be visited in any order**. In Figure 9-10, vertices $1$ and $3$ can switch places, and vertices $2$, $4$, and $6$ can also be reordered.

### 2. &nbsp; Complexity analysis

**Time complexity**: Each vertex enters and leaves the queue once, taking $O(|V|)$ time in total. When checking neighbors in an undirected graph, we examine every edge $2$ times, taking $O(2|E|)$ time. The total is $O(|V| + |E|)$.

**Space complexity**: The list `res`, hash set `visited`, and queue `que` each hold at most $|V|$ vertices, so the space complexity is $O(|V|)$.

## 9.3.2 &nbsp; Depth-first traversal

**Depth-first traversal follows a path as far as it can before backtracking**. In Figure 9-11, we start at the upper-left vertex and follow a neighbor of the current vertex. When we reach a dead end, we return and follow another branch as far as possible. We repeat this process until every vertex has been visited.

![Depth-first traversal of a graph](graph_traversal.assets/graph_dfs.svg){ class="animation-figure" }

<p align="center"> Figure 9-11 &nbsp; Depth-first traversal of a graph </p>

### 1. &nbsp; Implementation

Recursion is a natural way to explore a path to its end and then return. As in breadth-first traversal, we use a hash set `visited` to record visited vertices and avoid revisiting them.

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """Helper for depth-first traversal"""
        res.append(vet)  # Record the visited vertex
        visited.add(vet)  # Mark the vertex as visited
        # Iterate over all neighbors of this vertex
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # Skip visited vertices
            # Visit neighbors recursively
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Depth-first traversal"""
        # Represent the graph with an adjacency list to look up all neighbors of a given vertex
        # Vertex traversal order
        res = []
        # Use a hash set to track visited vertices
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* Helper for depth-first traversal */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // Record the visited vertex
        visited.emplace(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // Skip visited vertices
            // Visit neighbors recursively
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // Vertex traversal order
        vector<Vertex *> res;
        // Use a hash set to track visited vertices
        unordered_set<Vertex *> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Java"

    ```java title="graph_dfs.java"
    /* Helper for depth-first traversal */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // Record the visited vertex
        visited.add(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Skip visited vertices
            // Visit neighbors recursively
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = new ArrayList<>();
        // Use a hash set to track visited vertices
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    /* Helper for depth-first traversal */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Record the visited vertex
        visited.Add(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Skip visited vertices                             
            }
            // Visit neighbors recursively
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = [];
        // Use a hash set to track visited vertices
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* Helper for depth-first traversal */
    func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
        // append returns a new slice reference, so assign it back to the original variable
        *res = append(*res, vet)
        visited[vet] = struct{}{}
        // Iterate over all neighbors of this vertex
        for _, adjVet := range g.adjList[vet] {
            _, isExist := visited[adjVet]
            // Visit neighbors recursively
            if !isExist {
                dfs(g, visited, res, adjVet)
            }
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
        // Vertex traversal order
        res := make([]Vertex, 0)
        // Use a hash set to track visited vertices
        visited := make(map[Vertex]struct{})
        dfs(g, visited, &res, startVet)
        // Return the vertex traversal order
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* Helper for depth-first traversal */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // Record the visited vertex
        visited.insert(vet) // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Skip visited vertices
            }
            // Visit neighbors recursively
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // Vertex traversal order
        var res: [Vertex] = []
        // Use a hash set to track visited vertices
        var visited: Set<Vertex> = []
        dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    function dfs(graph, visited, res, vet) {
        res.push(vet); // Record the visited vertex
        visited.add(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // Skip visited vertices
            }
            // Visit neighbors recursively
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    function graphDFS(graph, startVet) {
        // Vertex traversal order
        const res = [];
        // Use a hash set to track visited vertices
        const visited = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_dfs.ts"
    /* Helper for depth-first traversal */
    function dfs(
        graph: GraphAdjList,
        visited: Set<Vertex>,
        res: Vertex[],
        vet: Vertex
    ): void {
        res.push(vet); // Record the visited vertex
        visited.add(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // Skip visited vertices
            }
            // Visit neighbors recursively
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // Vertex traversal order
        const res: Vertex[] = [];
        // Use a hash set to track visited vertices
        const visited: Set<Vertex> = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_dfs.dart"
    /* Helper for depth-first traversal */
    void dfs(
      GraphAdjList graph,
      Set<Vertex> visited,
      List<Vertex> res,
      Vertex vet,
    ) {
      res.add(vet); // Record the visited vertex
      visited.add(vet); // Mark the vertex as visited
      // Iterate over all neighbors of this vertex
      for (Vertex adjVet in graph.adjList[vet]!) {
        if (visited.contains(adjVet)) {
          continue; // Skip visited vertices
        }
        // Visit neighbors recursively
        dfs(graph, visited, res, adjVet);
      }
    }

    /* Depth-first traversal */
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
      // Vertex traversal order
      List<Vertex> res = [];
      // Use a hash set to track visited vertices
      Set<Vertex> visited = {};
      dfs(graph, visited, res, startVet);
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    /* Helper for depth-first traversal */
    fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
        res.push(vet); // Record the visited vertex
        visited.insert(vet); // Mark the vertex as visited
                             // Iterate over all neighbors of this vertex
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // Skip visited vertices
                }
                // Visit neighbors recursively
                dfs(graph, visited, res, adj_vet);
            }
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // Vertex traversal order
        let mut res = vec![];
        // Use a hash set to track visited vertices
        let mut visited = HashSet::new();
        dfs(&graph, &mut visited, &mut res, start_vet);

        res
    }
    ```

=== "C"

    ```c title="graph_dfs.c"
    /* Check whether a vertex has been visited */
    int isVisited(Vertex **res, int size, Vertex *vet) {
        // Scan for the node in O(n) time
        for (int i = 0; i < size; i++) {
            if (res[i] == vet) {
                return 1;
            }
        }
        return 0;
    }

    /* Helper for depth-first traversal */
    void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
        // Record the visited vertex
        res[(*resSize)++] = vet;
        // Iterate over all neighbors of this vertex
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // Skip visited vertices
            if (!isVisited(res, *resSize, node->vertex)) {
                // Visit neighbors recursively
                dfs(graph, res, resSize, node->vertex);
            }
            node = node->next;
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
        dfs(graph, res, resSize, startVet);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_dfs.kt"
    /* Helper for depth-first traversal */
    fun dfs(
        graph: GraphAdjList,
        visited: MutableSet<Vertex?>,
        res: MutableList<Vertex?>,
        vet: Vertex?
    ) {
        res.add(vet)     // Record the visited vertex
        visited.add(vet) // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue  // Skip visited vertices
            // Visit neighbors recursively
            dfs(graph, visited, res, adjVet)
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
        // Vertex traversal order
        val res = mutableListOf<Vertex?>()
        // Use a hash set to track visited vertices
        val visited = HashSet<Vertex?>()
        dfs(graph, visited, res, startVet)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_dfs.rb"
    ### Helper for depth-first traversal ###
    def dfs(graph, visited, res, vet)
      res << vet # Record the visited vertex
      visited.add(vet) # Mark the vertex as visited
      # Iterate over all neighbors of this vertex
      for adj_vet in graph.adj_list[vet]
        next if visited.include?(adj_vet) # Skip visited vertices
        # Visit neighbors recursively
        dfs(graph, visited, res, adj_vet)
      end
    end

    ### Depth-first traversal ###
    def graph_dfs(graph, start_vet)
      # Represent the graph with an adjacency list to look up all neighbors of a given vertex
      # Vertex traversal order
      res = []
      # Use a hash set to track visited vertices
      visited = Set.new
      dfs(graph, visited, res, start_vet)
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22Vertex%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22Convert%20the%20list%20of%20values%20vals%20to%20a%20list%20of%20vertices%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20represented%20by%20an%20adjacency%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList,%20visited%3A%20set%5BVertex%5D,%20res%3A%20list%5BVertex%5D,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22Helper%20for%20depth-first%20traversal%22%22%22%0A%20%20%20%20res.append%28vet%29%20%20%23%20Record%20the%20visited%20vertex%0A%20%20%20%20visited.add%28vet%29%20%20%23%20Mark%20the%20vertex%20as%20visited%0A%20%20%20%20%23%20Iterate%20over%20all%20neighbors%20of%20this%20vertex%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20Skip%20visited%20vertices%0A%20%20%20%20%20%20%20%20%23%20Visit%20neighbors%20recursively%0A%20%20%20%20%20%20%20%20dfs%28graph,%20visited,%20res,%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22Depth-first%20traversal%22%22%22%0A%20%20%20%20%23%20Represent%20the%20graph%20with%20an%20adjacency%20list%20to%20look%20up%20all%20neighbors%20of%20a%20given%20vertex%0A%20%20%20%20%23%20Vertex%20traversal%20order%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20Use%20a%20hash%20table%20to%20track%20visited%20vertices%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph,%20visited,%20res,%20start_vet%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20an%20undirected%20graph%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%20%20%23%20Depth-first%20traversal%0A%20%20%20%20res%20%3D%20graph_dfs%28graph,%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22Vertex%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22Convert%20the%20list%20of%20values%20vals%20to%20a%20list%20of%20vertices%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20represented%20by%20an%20adjacency%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList,%20visited%3A%20set%5BVertex%5D,%20res%3A%20list%5BVertex%5D,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22Helper%20for%20depth-first%20traversal%22%22%22%0A%20%20%20%20res.append%28vet%29%20%20%23%20Record%20the%20visited%20vertex%0A%20%20%20%20visited.add%28vet%29%20%20%23%20Mark%20the%20vertex%20as%20visited%0A%20%20%20%20%23%20Iterate%20over%20all%20neighbors%20of%20this%20vertex%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20Skip%20visited%20vertices%0A%20%20%20%20%20%20%20%20%23%20Visit%20neighbors%20recursively%0A%20%20%20%20%20%20%20%20dfs%28graph,%20visited,%20res,%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22Depth-first%20traversal%22%22%22%0A%20%20%20%20%23%20Represent%20the%20graph%20with%20an%20adjacency%20list%20to%20look%20up%20all%20neighbors%20of%20a%20given%20vertex%0A%20%20%20%20%23%20Vertex%20traversal%20order%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20Use%20a%20hash%20table%20to%20track%20visited%20vertices%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph,%20visited,%20res,%20start_vet%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20an%20undirected%20graph%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%20%20%23%20Depth-first%20traversal%0A%20%20%20%20res%20%3D%20graph_dfs%28graph,%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 9-12 shows the steps of depth-first traversal.

- **A straight dashed line represents a recursive descent**. A new recursive call begins to visit a new vertex.
- **A curved dashed line represents backtracking**. The recursive call has returned to the point where it was made.

Trace Figure 9-12 alongside the code, either mentally or on paper. Follow the entire DFS and note when each call begins and when it returns.

=== "<1>"
    ![Steps in depth-first traversal of a graph](graph_traversal.assets/graph_dfs_step1.svg){ class="animation-figure" }

=== "<2>"
    ![graph_dfs_step2](graph_traversal.assets/graph_dfs_step2.svg){ class="animation-figure" }

=== "<3>"
    ![graph_dfs_step3](graph_traversal.assets/graph_dfs_step3.svg){ class="animation-figure" }

=== "<4>"
    ![graph_dfs_step4](graph_traversal.assets/graph_dfs_step4.svg){ class="animation-figure" }

=== "<5>"
    ![graph_dfs_step5](graph_traversal.assets/graph_dfs_step5.svg){ class="animation-figure" }

=== "<6>"
    ![graph_dfs_step6](graph_traversal.assets/graph_dfs_step6.svg){ class="animation-figure" }

=== "<7>"
    ![graph_dfs_step7](graph_traversal.assets/graph_dfs_step7.svg){ class="animation-figure" }

=== "<8>"
    ![graph_dfs_step8](graph_traversal.assets/graph_dfs_step8.svg){ class="animation-figure" }

=== "<9>"
    ![graph_dfs_step9](graph_traversal.assets/graph_dfs_step9.svg){ class="animation-figure" }

=== "<10>"
    ![graph_dfs_step10](graph_traversal.assets/graph_dfs_step10.svg){ class="animation-figure" }

=== "<11>"
    ![graph_dfs_step11](graph_traversal.assets/graph_dfs_step11.svg){ class="animation-figure" }

<p align="center"> Figure 9-12 &nbsp; Steps in depth-first traversal of a graph </p>

!!! question "Is the depth-first traversal order unique?"

    As with breadth-first traversal, there is more than one valid depth-first order. At any vertex, we can choose which direction to explore first. Reordering the neighbors still gives a depth-first traversal.
    
    For example, the tree traversals “root $\rightarrow$ left $\rightarrow$ right,” “left $\rightarrow$ root $\rightarrow$ right,” and “left $\rightarrow$ right $\rightarrow$ root” are preorder, inorder, and postorder, respectively. They give different priorities to the visits, yet all three are depth-first traversals.

### 2. &nbsp; Complexity analysis

**Time complexity**: Each vertex is visited exactly $1$ time, taking $O(|V|)$ time overall. Each edge is examined $2$ times, taking $O(2|E|)$ time overall. The total is $O(|V| + |E|)$.

**Space complexity**: The list `res` and hash set `visited` each hold at most $|V|$ vertices, and the recursion depth is at most $|V|$, giving $O(|V|)$ space.
