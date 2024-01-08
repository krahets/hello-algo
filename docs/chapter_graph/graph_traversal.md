---
comments: true
---

# 9.3 &nbsp; 图的遍历

树代表的是“一对多”的关系，而图则具有更高的自由度，可以表示任意的“多对多”关系。因此，我们可以把树看作图的一种特例。显然，**树的遍历操作也是图的遍历操作的一种特例**。

图和树都需要应用搜索算法来实现遍历操作。图的遍历方式也可分为两种：「广度优先遍历」和「深度优先遍历」。

## 9.3.1 &nbsp; 广度优先遍历

**广度优先遍历是一种由近及远的遍历方式，从某个节点出发，始终优先访问距离最近的顶点，并一层层向外扩张**。如图 9-9 所示，从左上角顶点出发，首先遍历该顶点的所有邻接顶点，然后遍历下一个顶点的所有邻接顶点，以此类推，直至所有顶点访问完毕。

![图的广度优先遍历](graph_traversal.assets/graph_bfs.png){ class="animation-figure" }

<p align="center"> 图 9-9 &nbsp; 图的广度优先遍历 </p>

### 1. &nbsp; 算法实现

BFS 通常借助队列来实现，代码如下所示。队列具有“先入先出”的性质，这与 BFS 的“由近及远”的思想异曲同工。

1. 将遍历起始顶点 `startVet` 加入队列，并开启循环。
2. 在循环的每轮迭代中，弹出队首顶点并记录访问，然后将该顶点的所有邻接顶点加入到队列尾部。
3. 循环步骤 `2.` ，直到所有顶点被访问完毕后结束。

为了防止重复遍历顶点，我们需要借助一个哈希表 `visited` 来记录哪些节点已被访问。

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """广度优先遍历"""
        # 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
        # 顶点遍历序列
        res = []
        # 哈希表，用于记录已被访问过的顶点
        visited = set[Vertex]([start_vet])
        # 队列用于实现 BFS
        que = deque[Vertex]([start_vet])
        # 以顶点 vet 为起点，循环直至访问完所有顶点
        while len(que) > 0:
            vet = que.popleft()  # 队首顶点出队
            res.append(vet)  # 记录访问顶点
            # 遍历该顶点的所有邻接顶点
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # 跳过已被访问的顶点
                que.append(adj_vet)  # 只入队未访问的顶点
                visited.add(adj_vet)  # 标记该顶点已被访问
        # 返回顶点遍历序列
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // 顶点遍历序列
        vector<Vertex *> res;
        // 哈希表，用于记录已被访问过的顶点
        unordered_set<Vertex *> visited = {startVet};
        // 队列用于实现 BFS
        queue<Vertex *> que;
        que.push(startVet);
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // 队首顶点出队
            res.push_back(vet); // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // 跳过已被访问的顶点
                que.push(adjVet);        // 只入队未访问的顶点
                visited.emplace(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = new ArrayList<>();
        // 哈希表，用于记录已被访问过的顶点
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // 队列用于实现 BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 队首顶点出队
            res.add(vet);            // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 跳过已被访问的顶点
                que.offer(adjVet);   // 只入队未访问的顶点
                visited.add(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = [];
        // 哈希表，用于记录已被访问过的顶点
        HashSet<Vertex> visited = [startVet];
        // 队列用于实现 BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 队首顶点出队
            res.Add(vet);               // 记录访问顶点
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 跳过已被访问的顶点
                }
                que.Enqueue(adjVet);   // 只入队未访问的顶点
                visited.Add(adjVet);   // 标记该顶点已被访问
            }
        }

        // 返回顶点遍历序列
        return res;
    }
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
        // 顶点遍历序列
        res := make([]Vertex, 0)
        // 哈希表，用于记录已被访问过的顶点
        visited := make(map[Vertex]struct{})
        visited[startVet] = struct{}{}
        // 队列用于实现 BFS, 使用切片模拟队列
        queue := make([]Vertex, 0)
        queue = append(queue, startVet)
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        for len(queue) > 0 {
            // 队首顶点出队
            vet := queue[0]
            queue = queue[1:]
            // 记录访问顶点
            res = append(res, vet)
            // 遍历该顶点的所有邻接顶点
            for _, adjVet := range g.adjList[vet] {
                _, isExist := visited[adjVet]
                // 只入队未访问的顶点
                if !isExist {
                    queue = append(queue, adjVet)
                    visited[adjVet] = struct{}{}
                }
            }
        }
        // 返回顶点遍历序列
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // 顶点遍历序列
        var res: [Vertex] = []
        // 哈希表，用于记录已被访问过的顶点
        var visited: Set<Vertex> = [startVet]
        // 队列用于实现 BFS
        var que: [Vertex] = [startVet]
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while !que.isEmpty {
            let vet = que.removeFirst() // 队首顶点出队
            res.append(vet) // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for adjVet in graph.adjList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue // 跳过已被访问的顶点
                }
                que.append(adjVet) // 只入队未访问的顶点
                visited.insert(adjVet) // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    function graphBFS(graph, startVet) {
        // 顶点遍历序列
        const res = [];
        // 哈希表，用于记录已被访问过的顶点
        const visited = new Set();
        visited.add(startVet);
        // 队列用于实现 BFS
        const que = [startVet];
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (que.length) {
            const vet = que.shift(); // 队首顶点出队
            res.push(vet); // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // 跳过已被访问的顶点
                }
                que.push(adjVet); // 只入队未访问的顶点
                visited.add(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // 顶点遍历序列
        const res: Vertex[] = [];
        // 哈希表，用于记录已被访问过的顶点
        const visited: Set<Vertex> = new Set();
        visited.add(startVet);
        // 队列用于实现 BFS
        const que = [startVet];
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (que.length) {
            const vet = que.shift(); // 队首顶点出队
            res.push(vet); // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // 跳过已被访问的顶点
                }
                que.push(adjVet); // 只入队未访问
                visited.add(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    /* 广度优先遍历 */
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
      // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
      // 顶点遍历序列
      List<Vertex> res = [];
      // 哈希表，用于记录已被访问过的顶点
      Set<Vertex> visited = {};
      visited.add(startVet);
      // 队列用于实现 BFS
      Queue<Vertex> que = Queue();
      que.add(startVet);
      // 以顶点 vet 为起点，循环直至访问完所有顶点
      while (que.isNotEmpty) {
        Vertex vet = que.removeFirst(); // 队首顶点出队
        res.add(vet); // 记录访问顶点
        // 遍历该顶点的所有邻接顶点
        for (Vertex adjVet in graph.adjList[vet]!) {
          if (visited.contains(adjVet)) {
            continue; // 跳过已被访问的顶点
          }
          que.add(adjVet); // 只入队未访问的顶点
          visited.add(adjVet); // 标记该顶点已被访问
        }
      }
      // 返回顶点遍历序列
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // 顶点遍历序列
        let mut res = vec![];
        // 哈希表，用于记录已被访问过的顶点
        let mut visited = HashSet::new();
        visited.insert(start_vet);
        // 队列用于实现 BFS
        let mut que = VecDeque::new();
        que.push_back(start_vet);
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while !que.is_empty() {
            let vet = que.pop_front().unwrap(); // 队首顶点出队
            res.push(vet); // 记录访问顶点
                        // 遍历该顶点的所有邻接顶点
            if let Some(adj_vets) = graph.adj_list.get(&vet) {
                for &adj_vet in adj_vets {
                    if visited.contains(&adj_vet) {
                        continue; // 跳过已被访问的顶点
                    }
                    que.push_back(adj_vet); // 只入队未访问的顶点
                    visited.insert(adj_vet); // 标记该顶点已被访问
                }
            }
        }
        // 返回顶点遍历序列
        res
    }
    ```

=== "C"

    ```c title="graph_bfs.c"
    /* 节点队列结构体 */
    typedef struct {
        Vertex *vertices[MAX_SIZE];
        int front, rear, size;
    } Queue;

    /* 构造函数 */
    Queue *newQueue() {
        Queue *q = (Queue *)malloc(sizeof(Queue));
        q->front = q->rear = q->size = 0;
        return q;
    }

    /* 判断队列是否为空 */
    int isEmpty(Queue *q) {
        return q->size == 0;
    }

    /* 入队操作 */
    void enqueue(Queue *q, Vertex *vet) {
        q->vertices[q->rear] = vet;
        q->rear = (q->rear + 1) % MAX_SIZE;
        q->size++;
    }

    /* 出队操作 */
    Vertex *dequeue(Queue *q) {
        Vertex *vet = q->vertices[q->front];
        q->front = (q->front + 1) % MAX_SIZE;
        q->size--;
        return vet;
    }

    /* 检查顶点是否已被访问 */
    int isVisited(Vertex **visited, int size, Vertex *vet) {
        // 遍历查找节点，使用 O(n) 时间
        for (int i = 0; i < size; i++) {
            if (visited[i] == vet)
                return 1;
        }
        return 0;
    }

    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
        // 队列用于实现 BFS
        Queue *queue = newQueue();
        enqueue(queue, startVet);
        visited[(*visitedSize)++] = startVet;
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (!isEmpty(queue)) {
            Vertex *vet = dequeue(queue); // 队首顶点出队
            res[(*resSize)++] = vet;      // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            AdjListNode *node = findNode(graph, vet);
            while (node != NULL) {
                // 跳过已被访问的顶点
                if (!isVisited(visited, *visitedSize, node->vertex)) {
                    enqueue(queue, node->vertex);             // 只入队未访问的顶点
                    visited[(*visitedSize)++] = node->vertex; // 标记该顶点已被访问
                }
                node = node->next;
            }
        }
        // 释放内存
        free(queue);
    }
    ```

=== "Zig"

    ```zig title="graph_bfs.zig"
    [class]{}-[func]{graphBFS}
    ```

??? pythontutor "可视化运行"

    <div style="height: 560px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A1%B6%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BE%93%E5%85%A5%E5%80%BC%E5%88%97%E8%A1%A8%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E8%A1%A8%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E5%B9%BF%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%E9%81%8D%E5%8E%86%E5%BA%8F%E5%88%97%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E8%BF%87%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20%E9%98%9F%E5%88%97%E7%94%A8%E4%BA%8E%E5%AE%9E%E7%8E%B0%20BFS%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20%E4%BB%A5%E9%A1%B6%E7%82%B9%20vet%20%E4%B8%BA%E8%B5%B7%E7%82%B9%EF%BC%8C%E5%BE%AA%E7%8E%AF%E7%9B%B4%E8%87%B3%E8%AE%BF%E9%97%AE%E5%AE%8C%E6%89%80%E6%9C%89%E9%A1%B6%E7%82%B9%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20%E9%98%9F%E9%A6%96%E9%A1%B6%E7%82%B9%E5%87%BA%E9%98%9F%0A%20%20%20%20%20%20%20%20res.append%28vet%29%20%20%23%20%E8%AE%B0%E5%BD%95%E8%AE%BF%E9%97%AE%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E8%AF%A5%E9%A1%B6%E7%82%B9%E7%9A%84%E6%89%80%E6%9C%89%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%B7%B3%E8%BF%87%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20%E5%8F%AA%E5%85%A5%E9%98%9F%E6%9C%AA%E8%AE%BF%E9%97%AE%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20%E6%A0%87%E8%AE%B0%E8%AF%A5%E9%A1%B6%E7%82%B9%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E9%81%8D%E5%8E%86%E5%BA%8F%E5%88%97%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E5%B9%BF%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%0A%20%20%20%20res%20%3D%20graph_bfs%28graph,%20v%5B0%5D%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A1%B6%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BE%93%E5%85%A5%E5%80%BC%E5%88%97%E8%A1%A8%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E8%A1%A8%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E5%B9%BF%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%E9%81%8D%E5%8E%86%E5%BA%8F%E5%88%97%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E8%BF%87%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20%E9%98%9F%E5%88%97%E7%94%A8%E4%BA%8E%E5%AE%9E%E7%8E%B0%20BFS%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20%E4%BB%A5%E9%A1%B6%E7%82%B9%20vet%20%E4%B8%BA%E8%B5%B7%E7%82%B9%EF%BC%8C%E5%BE%AA%E7%8E%AF%E7%9B%B4%E8%87%B3%E8%AE%BF%E9%97%AE%E5%AE%8C%E6%89%80%E6%9C%89%E9%A1%B6%E7%82%B9%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20%E9%98%9F%E9%A6%96%E9%A1%B6%E7%82%B9%E5%87%BA%E9%98%9F%0A%20%20%20%20%20%20%20%20res.append%28vet%29%20%20%23%20%E8%AE%B0%E5%BD%95%E8%AE%BF%E9%97%AE%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E8%AF%A5%E9%A1%B6%E7%82%B9%E7%9A%84%E6%89%80%E6%9C%89%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%B7%B3%E8%BF%87%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20%E5%8F%AA%E5%85%A5%E9%98%9F%E6%9C%AA%E8%AE%BF%E9%97%AE%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20%E6%A0%87%E8%AE%B0%E8%AF%A5%E9%A1%B6%E7%82%B9%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E9%81%8D%E5%8E%86%E5%BA%8F%E5%88%97%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E5%B9%BF%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%0A%20%20%20%20res%20%3D%20graph_bfs%28graph,%20v%5B0%5D%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a>

代码相对抽象，建议对照图 9-10 来加深理解。

=== "<1>"
    ![图的广度优先遍历步骤](graph_traversal.assets/graph_bfs_step1.png){ class="animation-figure" }

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

<p align="center"> 图 9-10 &nbsp; 图的广度优先遍历步骤 </p>

!!! question "广度优先遍历的序列是否唯一？"

    不唯一。广度优先遍历只要求按“由近及远”的顺序遍历，**而多个相同距离的顶点的遍历顺序允许被任意打乱**。以图 9-10 为例，顶点 $1$、$3$ 的访问顺序可以交换，顶点 $2$、$4$、$6$ 的访问顺序也可以任意交换。

### 2. &nbsp; 复杂度分析

**时间复杂度**：所有顶点都会入队并出队一次，使用 $O(|V|)$ 时间；在遍历邻接顶点的过程中，由于是无向图，因此所有边都会被访问 $2$ 次，使用 $O(2|E|)$ 时间；总体使用 $O(|V| + |E|)$ 时间。

**空间复杂度**：列表 `res` ，哈希表 `visited` ，队列 `que` 中的顶点数量最多为 $|V|$ ，使用 $O(|V|)$ 空间。

## 9.3.2 &nbsp; 深度优先遍历

**深度优先遍历是一种优先走到底、无路可走再回头的遍历方式**。如图 9-11 所示，从左上角顶点出发，访问当前顶点的某个邻接顶点，直到走到尽头时返回，再继续走到尽头并返回，以此类推，直至所有顶点遍历完成。

![图的深度优先遍历](graph_traversal.assets/graph_dfs.png){ class="animation-figure" }

<p align="center"> 图 9-11 &nbsp; 图的深度优先遍历 </p>

### 1. &nbsp; 算法实现

这种“走到尽头再返回”的算法范式通常基于递归来实现。与广度优先遍历类似，在深度优先遍历中，我们也需要借助一个哈希表 `visited` 来记录已被访问的顶点，以避免重复访问顶点。

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """深度优先遍历辅助函数"""
        res.append(vet)  # 记录访问顶点
        visited.add(vet)  # 标记该顶点已被访问
        # 遍历该顶点的所有邻接顶点
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # 跳过已被访问的顶点
            # 递归访问邻接顶点
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """深度优先遍历"""
        # 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
        # 顶点遍历序列
        res = []
        # 哈希表，用于记录已被访问过的顶点
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* 深度优先遍历辅助函数 */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // 记录访问顶点
        visited.emplace(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // 跳过已被访问的顶点
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // 顶点遍历序列
        vector<Vertex *> res;
        // 哈希表，用于记录已被访问过的顶点
        unordered_set<Vertex *> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Java"

    ```java title="graph_dfs.java"
    /* 深度优先遍历辅助函数 */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 记录访问顶点
        visited.add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 跳过已被访问的顶点
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = new ArrayList<>();
        // 哈希表，用于记录已被访问过的顶点
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    /* 深度优先遍历辅助函数 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 记录访问顶点
        visited.Add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 跳过已被访问的顶点                             
            }
            // 递归访问邻接顶点
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = [];
        // 哈希表，用于记录已被访问过的顶点
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* 深度优先遍历辅助函数 */
    func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
        // append 操作会返回新的的引用，必须让原引用重新赋值为新slice的引用
        *res = append(*res, vet)
        visited[vet] = struct{}{}
        // 遍历该顶点的所有邻接顶点
        for _, adjVet := range g.adjList[vet] {
            _, isExist := visited[adjVet]
            // 递归访问邻接顶点
            if !isExist {
                dfs(g, visited, res, adjVet)
            }
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
        // 顶点遍历序列
        res := make([]Vertex, 0)
        // 哈希表，用于记录已被访问过的顶点
        visited := make(map[Vertex]struct{})
        dfs(g, visited, &res, startVet)
        // 返回顶点遍历序列
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* 深度优先遍历辅助函数 */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // 记录访问顶点
        visited.insert(vet) // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 跳过已被访问的顶点
            }
            // 递归访问邻接顶点
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // 顶点遍历序列
        var res: [Vertex] = []
        // 哈希表，用于记录已被访问过的顶点
        var visited: Set<Vertex> = []
        dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    function dfs(graph, visited, res, vet) {
        res.push(vet); // 记录访问顶点
        visited.add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 跳过已被访问的顶点
            }
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    function graphDFS(graph, startVet) {
        // 顶点遍历序列
        const res = [];
        // 哈希表，用于记录已被访问过的顶点
        const visited = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_dfs.ts"
    /* 深度优先遍历辅助函数 */
    function dfs(
        graph: GraphAdjList,
        visited: Set<Vertex>,
        res: Vertex[],
        vet: Vertex
    ): void {
        res.push(vet); // 记录访问顶点
        visited.add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 跳过已被访问的顶点
            }
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // 顶点遍历序列
        const res: Vertex[] = [];
        // 哈希表，用于记录已被访问过的顶点
        const visited: Set<Vertex> = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_dfs.dart"
    /* 深度优先遍历辅助函数 */
    void dfs(
      GraphAdjList graph,
      Set<Vertex> visited,
      List<Vertex> res,
      Vertex vet,
    ) {
      res.add(vet); // 记录访问顶点
      visited.add(vet); // 标记该顶点已被访问
      // 遍历该顶点的所有邻接顶点
      for (Vertex adjVet in graph.adjList[vet]!) {
        if (visited.contains(adjVet)) {
          continue; // 跳过已被访问的顶点
        }
        // 递归访问邻接顶点
        dfs(graph, visited, res, adjVet);
      }
    }

    /* 深度优先遍历 */
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
      // 顶点遍历序列
      List<Vertex> res = [];
      // 哈希表，用于记录已被访问过的顶点
      Set<Vertex> visited = {};
      dfs(graph, visited, res, startVet);
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    /* 深度优先遍历辅助函数 */
    fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
        res.push(vet); // 记录访问顶点
        visited.insert(vet); // 标记该顶点已被访问
                             // 遍历该顶点的所有邻接顶点
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 跳过已被访问的顶点
                }
                // 递归访问邻接顶点
                dfs(graph, visited, res, adj_vet);
            }
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // 顶点遍历序列
        let mut res = vec![];
        // 哈希表，用于记录已被访问过的顶点
        let mut visited = HashSet::new();
        dfs(&graph, &mut visited, &mut res, start_vet);

        res
    }
    ```

=== "C"

    ```c title="graph_dfs.c"
    /* 检查顶点是否已被访问 */
    int isVisited(Vertex **res, int size, Vertex *vet) {
        // 遍历查找节点，使用 O(n) 时间
        for (int i = 0; i < size; i++) {
            if (res[i] == vet) {
                return 1;
            }
        }
        return 0;
    }

    /* 深度优先遍历辅助函数 */
    void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
        // 记录访问顶点
        res[(*resSize)++] = vet;
        // 遍历该顶点的所有邻接顶点
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 跳过已被访问的顶点
            if (!isVisited(res, *resSize, node->vertex)) {
                // 递归访问邻接顶点
                dfs(graph, res, resSize, node->vertex);
            }
            node = node->next;
        }
    }

    /* 深度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
        dfs(graph, res, resSize, startVet);
    }
    ```

=== "Zig"

    ```zig title="graph_dfs.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

??? pythontutor "可视化运行"

    <div style="height: 560px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A1%B6%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BE%93%E5%85%A5%E5%80%BC%E5%88%97%E8%A1%A8%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E8%A1%A8%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList,%20visited%3A%20set%5BVertex%5D,%20res%3A%20list%5BVertex%5D,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%E8%BE%85%E5%8A%A9%E5%87%BD%E6%95%B0%22%22%22%0A%20%20%20%20res.append%28vet%29%20%20%23%20%E8%AE%B0%E5%BD%95%E8%AE%BF%E9%97%AE%E9%A1%B6%E7%82%B9%0A%20%20%20%20visited.add%28vet%29%20%20%23%20%E6%A0%87%E8%AE%B0%E8%AF%A5%E9%A1%B6%E7%82%B9%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E8%AF%A5%E9%A1%B6%E7%82%B9%E7%9A%84%E6%89%80%E6%9C%89%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%B7%B3%E8%BF%87%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E8%AE%BF%E9%97%AE%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20dfs%28graph,%20visited,%20res,%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E9%82%BB%E6%8E%A5%E8%A1%A8%E6%9D%A5%E8%A1%A8%E7%A4%BA%E5%9B%BE%EF%BC%8C%E4%BB%A5%E4%BE%BF%E8%8E%B7%E5%8F%96%E6%8C%87%E5%AE%9A%E9%A1%B6%E7%82%B9%E7%9A%84%E6%89%80%E6%9C%89%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%E9%81%8D%E5%8E%86%E5%BA%8F%E5%88%97%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E8%BF%87%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph,%20visited,%20res,%20start_vet%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%20%20%23%20%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%0A%20%20%20%20res%20%3D%20graph_dfs%28graph,%20v%5B0%5D%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A1%B6%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BE%93%E5%85%A5%E5%80%BC%E5%88%97%E8%A1%A8%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E8%A1%A8%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList,%20visited%3A%20set%5BVertex%5D,%20res%3A%20list%5BVertex%5D,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%E8%BE%85%E5%8A%A9%E5%87%BD%E6%95%B0%22%22%22%0A%20%20%20%20res.append%28vet%29%20%20%23%20%E8%AE%B0%E5%BD%95%E8%AE%BF%E9%97%AE%E9%A1%B6%E7%82%B9%0A%20%20%20%20visited.add%28vet%29%20%20%23%20%E6%A0%87%E8%AE%B0%E8%AF%A5%E9%A1%B6%E7%82%B9%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E8%AF%A5%E9%A1%B6%E7%82%B9%E7%9A%84%E6%89%80%E6%9C%89%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%B7%B3%E8%BF%87%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E8%AE%BF%E9%97%AE%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20dfs%28graph,%20visited,%20res,%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E9%82%BB%E6%8E%A5%E8%A1%A8%E6%9D%A5%E8%A1%A8%E7%A4%BA%E5%9B%BE%EF%BC%8C%E4%BB%A5%E4%BE%BF%E8%8E%B7%E5%8F%96%E6%8C%87%E5%AE%9A%E9%A1%B6%E7%82%B9%E7%9A%84%E6%89%80%E6%9C%89%E9%82%BB%E6%8E%A5%E9%A1%B6%E7%82%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%E9%81%8D%E5%8E%86%E5%BA%8F%E5%88%97%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E5%B7%B2%E8%A2%AB%E8%AE%BF%E9%97%AE%E8%BF%87%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph,%20visited,%20res,%20start_vet%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%20%20%23%20%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%0A%20%20%20%20res%20%3D%20graph_dfs%28graph,%20v%5B0%5D%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a>

深度优先遍历的算法流程如图 9-12 所示。

- **直虚线代表向下递推**，表示开启了一个新的递归方法来访问新顶点。
- **曲虚线代表向上回溯**，表示此递归方法已经返回，回溯到了开启此方法的位置。

为了加深理解，建议将图 9-12 与代码结合起来，在脑中模拟（或者用笔画下来）整个 DFS 过程，包括每个递归方法何时开启、何时返回。

=== "<1>"
    ![图的深度优先遍历步骤](graph_traversal.assets/graph_dfs_step1.png){ class="animation-figure" }

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

<p align="center"> 图 9-12 &nbsp; 图的深度优先遍历步骤 </p>

!!! question "深度优先遍历的序列是否唯一？"

    与广度优先遍历类似，深度优先遍历序列的顺序也不是唯一的。给定某顶点，先往哪个方向探索都可以，即邻接顶点的顺序可以任意打乱，都是深度优先遍历。
    
    以树的遍历为例，“根 $\rightarrow$ 左 $\rightarrow$ 右”“左 $\rightarrow$ 根 $\rightarrow$ 右”“左 $\rightarrow$ 右 $\rightarrow$ 根”分别对应前序、中序、后序遍历，它们展示了三种遍历优先级，然而这三者都属于深度优先遍历。

### 2. &nbsp; 复杂度分析

**时间复杂度**：所有顶点都会被访问 $1$ 次，使用 $O(|V|)$ 时间；所有边都会被访问 $2$ 次，使用 $O(2|E|)$ 时间；总体使用 $O(|V| + |E|)$ 时间。

**空间复杂度**：列表 `res` ，哈希表 `visited` 顶点数量最多为 $|V|$ ，递归深度最大为 $|V|$ ，因此使用 $O(|V|)$ 空间。
