---
comments: true
---

# 9.3. &nbsp; 图的遍历

!!! note "图与树的关系"

    树代表的是“一对多”的关系，而图则具有更高的自由度，可以表示任意的“多对多”关系。因此，我们可以把树看作是图的一种特例。显然，**树的遍历操作也是图的遍历操作的一种特例**，建议你在学习本章节时融会贯通两者的概念与实现方法。

「图」和「树」都是非线性数据结构，都需要使用「搜索算法」来实现遍历操作。

与树类似，图的遍历方式也可分为两种，即「广度优先遍历 Breadth-First Traversal」和「深度优先遍历 Depth-First Traversal」，也称为「广度优先搜索 Breadth-First Search」和「深度优先搜索 Depth-First Search」，简称 BFS 和 DFS。

## 9.3.1. &nbsp; 广度优先遍历

**广度优先遍历是一种由近及远的遍历方式，从距离最近的顶点开始访问，并一层层向外扩张**。具体来说，从某个顶点出发，先遍历该顶点的所有邻接顶点，然后遍历下一个顶点的所有邻接顶点，以此类推，直至所有顶点访问完毕。

![图的广度优先遍历](graph_traversal.assets/graph_bfs.png)

<p align="center"> Fig. 图的广度优先遍历 </p>

### 算法实现

BFS 通常借助「队列」来实现。队列具有“先入先出”的性质，这与 BFS 的“由近及远”的思想异曲同工。

1. 将遍历起始顶点 `startVet` 加入队列，并开启循环；
2. 在循环的每轮迭代中，弹出队首顶点并记录访问，然后将该顶点的所有邻接顶点加入到队列尾部；
3. 循环步骤 `2.` ，直到所有顶点被访问完成后结束；

为了防止重复遍历顶点，我们需要借助一个哈希表 `visited` 来记录哪些节点已被访问。

=== "Java"

    ```java title="graph_bfs.java"
    /* 广度优先遍历 BFS */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = new ArrayList<>();
        // 哈希表，用于记录已被访问过的顶点
        Set<Vertex> visited = new HashSet<>() {{ add(startVet); }};
        // 队列用于实现 BFS
        Queue<Vertex> que = new LinkedList<>() {{ offer(startVet); }};
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 队首顶点出队
            res.add(vet);            // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 跳过已被访问过的顶点
                que.offer(adjVet);   // 只入队未访问的顶点
                visited.add(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* 广度优先遍历 BFS */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    vector<Vertex*> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // 顶点遍历序列
        vector<Vertex*> res;
        // 哈希表，用于记录已被访问过的顶点
        unordered_set<Vertex*> visited = { startVet };
        // 队列用于实现 BFS
        queue<Vertex*> que;
        que.push(startVet);
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // 队首顶点出队
            res.push_back(vet); // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;           // 跳过已被访问过的顶点
                que.push(adjVet);       // 只入队未访问的顶点
                visited.emplace(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """广度优先遍历 BFS"""
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
                    continue  # 跳过已被访问过的顶点
                que.append(adj_vet)  # 只入队未访问的顶点
                visited.add(adj_vet)  # 标记该顶点已被访问
        # 返回顶点遍历序列
        return res
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* 广度优先遍历 BFS */
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

=== "JavaScript"

    ```javascript title="graph_bfs.js"
    /* 广度优先遍历 BFS */
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
            const vet = que.shift();    // 队首顶点出队
            res.push(vet);              // 记录访问顶点
            // 遍历该顶点的所有邻接顶点
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue;           // 跳过已被访问过的顶点
                }
                que.push(adjVet);       // 只入队未访问的顶点
                visited.add(adjVet);    // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "TypeScript"

    ```typescript title="graph_bfs.ts"
    /* 广度优先遍历 BFS */
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
                    continue; // 跳过已被访问过的顶点
                }
                que.push(adjVet); // 只入队未访问
                visited.add(adjVet); // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res;
    }
    ```

=== "C"

    ```c title="graph_bfs.c"
    [class]{}-[func]{graphBFS}
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    [class]{graph_bfs}-[func]{graphBFS}
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* 广度优先遍历 BFS */
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
                    continue // 跳过已被访问过的顶点
                }
                que.append(adjVet) // 只入队未访问的顶点
                visited.insert(adjVet) // 标记该顶点已被访问
            }
        }
        // 返回顶点遍历序列
        return res
    }
    ```

=== "Zig"

    ```zig title="graph_bfs.zig"
    [class]{}-[func]{graphBFS}
    ```

代码相对抽象，建议对照以下动画图示来加深理解。

=== "<1>"
    ![图的广度优先遍历步骤](graph_traversal.assets/graph_bfs_step1.png)

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

!!! question "广度优先遍历的序列是否唯一？"

    不唯一。广度优先遍历只要求按“由近及远”的顺序遍历，**而多个相同距离的顶点的遍历顺序是允许被任意打乱的**。以上图为例，顶点 $1$ , $3$ 的访问顺序可以交换、顶点 $2$ , $4$ , $6$ 的访问顺序也可以任意交换。

### 复杂度分析

**时间复杂度：** 所有顶点都会入队并出队一次，使用 $O(|V|)$ 时间；在遍历邻接顶点的过程中，由于是无向图，因此所有边都会被访问 $2$ 次，使用 $O(2|E|)$ 时间；总体使用 $O(|V| + |E|)$ 时间。

**空间复杂度：** 列表 `res` ，哈希表 `visited` ，队列 `que` 中的顶点数量最多为 $|V|$ ，使用 $O(|V|)$ 空间。

## 9.3.2. &nbsp; 深度优先遍历

**深度优先遍历是一种优先走到底、无路可走再回头的遍历方式**。具体地，从某个顶点出发，访问当前顶点的某个邻接顶点，直到走到尽头时返回，再继续走到尽头并返回，以此类推，直至所有顶点遍历完成。

![图的深度优先遍历](graph_traversal.assets/graph_dfs.png)

<p align="center"> Fig. 图的深度优先遍历 </p>

### 算法实现

这种“走到尽头 + 回溯”的算法形式通常基于递归来实现。与 BFS 类似，在 DFS 中我们也需要借助一个哈希表 `visited` 来记录已被访问的顶点，以避免重复访问顶点。

=== "Java"

    ```java title="graph_dfs.java"
    /* 深度优先遍历 DFS 辅助函数 */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 记录访问顶点
        visited.add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 跳过已被访问过的顶点
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 DFS */
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

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* 深度优先遍历 DFS 辅助函数 */
    void dfs(GraphAdjList& graph, unordered_set<Vertex*>& visited, vector<Vertex*>& res, Vertex* vet) {
        res.push_back(vet);   // 记录访问顶点
        visited.emplace(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (Vertex* adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;     // 跳过已被访问过的顶点
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 DFS */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    vector<Vertex*> graphDFS(GraphAdjList& graph, Vertex* startVet) {
        // 顶点遍历序列
        vector<Vertex*> res;
        // 哈希表，用于记录已被访问过的顶点
        unordered_set<Vertex*> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """深度优先遍历 DFS 辅助函数"""
        res.append(vet)  # 记录访问顶点
        visited.add(vet)  # 标记该顶点已被访问
        # 遍历该顶点的所有邻接顶点
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # 跳过已被访问过的顶点
            # 递归访问邻接顶点
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """深度优先遍历 DFS"""
        # 顶点遍历序列
        res = []
        # 哈希表，用于记录已被访问过的顶点
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* 深度优先遍历 DFS 辅助函数 */
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

    /* 深度优先遍历 DFS */
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

=== "JavaScript"

    ```javascript title="graph_dfs.js"
    /* 深度优先遍历 DFS */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    function dfs(graph, visited, res, vet) {
        res.push(vet);      // 记录访问顶点
        visited.add(vet);   // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 跳过已被访问过的顶点
            }
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 DFS */
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

=== "TypeScript"

    ```typescript title="graph_dfs.ts"
    /* 深度优先遍历 DFS 辅助函数 */
    function dfs(graph: GraphAdjList, visited: Set<Vertex>, res: Vertex[], vet: Vertex): void {
        res.push(vet); // 记录访问顶点
        visited.add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 跳过已被访问过的顶点
            }
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 DFS */
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

=== "C"

    ```c title="graph_dfs.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    [class]{graph_dfs}-[func]{dfs}

    [class]{graph_dfs}-[func]{graphDFS}
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* 深度优先遍历 DFS 辅助函数 */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // 记录访问顶点
        visited.insert(vet) // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 跳过已被访问过的顶点
            }
            // 递归访问邻接顶点
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* 深度优先遍历 DFS */
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

=== "Zig"

    ```zig title="graph_dfs.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{graphDFS}
    ```

深度优先遍历的算法流程如下图所示，其中：

- **直虚线代表向下递推**，表示开启了一个新的递归方法来访问新顶点；
- **曲虚线代表向上回溯**，表示此递归方法已经返回，回溯到了开启此递归方法的位置；

为了加深理解，建议将图示与代码结合起来，在脑中（或者用笔画下来）模拟整个 DFS 过程，包括每个递归方法何时开启、何时返回。

=== "<1>"
    ![图的深度优先遍历步骤](graph_traversal.assets/graph_dfs_step1.png)

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

!!! question "深度优先遍历的序列是否唯一？"

    与广度优先遍历类似，深度优先遍历序列的顺序也不是唯一的。给定某顶点，先往哪个方向探索都可以，即邻接顶点的顺序可以任意打乱，都是深度优先遍历。
    
    以树的遍历为例，“根 $\rightarrow$ 左 $\rightarrow$ 右”、“左 $\rightarrow$ 根 $\rightarrow$ 右”、“左 $\rightarrow$ 右 $\rightarrow$ 根”分别对应前序、中序、后序遍历，它们展示了三种不同的遍历优先级，然而这三者都属于深度优先遍历。

### 复杂度分析

**时间复杂度：** 所有顶点都会被访问 $1$ 次，使用 $O(|V|)$ 时间；所有边都会被访问 $2$ 次，使用 $O(2|E|)$ 时间；总体使用 $O(|V| + |E|)$ 时间。

**空间复杂度：** 列表 `res` ，哈希表 `visited` 顶点数量最多为 $|V|$ ，递归深度最大为 $|V|$ ，因此使用 $O(|V|)$ 空间。
