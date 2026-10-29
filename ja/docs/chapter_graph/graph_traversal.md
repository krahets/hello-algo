---
comments: true
---

# 9.3 &nbsp; グラフの走査

木は「一対多」の関係を表しますが、グラフは自由度が高く、任意の「多対多」の関係を表せます。そのため、木はグラフの特殊な場合と考えられます。当然、**木の走査も、グラフの走査の特殊な場合です**。

グラフも木も、走査には探索アルゴリズムを使います。グラフの走査方法も、<u>幅優先走査</u>と<u>深さ優先走査</u>の二つに分けられます。

## 9.3.1 &nbsp; 幅優先走査

**幅優先走査は、あるノードから始め、距離の近い頂点から優先して訪問し、層ごとに外側へ広がっていく走査方法です**。図 9-9 のように、左上の頂点から始めて、その頂点に隣接するすべての頂点を訪問します。続いて次の頂点に隣接するすべての頂点を訪問し、これをすべての頂点に到達するまで繰り返します。

![グラフの幅優先走査](graph_traversal.assets/graph_bfs.png){ class="animation-figure" }

<p align="center"> 図 9-9 &nbsp; グラフの幅優先走査 </p>

### 1. &nbsp; アルゴリズムの実装

BFS は通常、次のコードのようにキューで実装します。キューの「先入れ先出し」という性質は、BFS の「近いところから遠いところへ」という考え方に合っています。

1. 走査を始める頂点 `startVet` をキューに入れ、ループを開始します。
2. 各反復で、キューの先頭の頂点を取り出して訪問を記録し、その頂点に隣接するすべての頂点をキューの末尾に入れます。
3. 手順 `2.` を繰り返し、すべての頂点を訪問したら終了します。

同じ頂点を繰り返し訪問しないよう、ハッシュ集合 `visited` に訪問済みのノードを記録します。

!!! tip "ヒント"

    ハッシュ集合は、`key` だけを保存し、`value` を保存しないハッシュテーブルと考えられます。`key` の追加・削除・検索・更新を時間計算量 $O(1)$ で行えます。`key` が重複しない性質を活かし、データの重複除去などによく使われます。

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """幅優先走査"""
        # 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
        # 頂点の走査順序
        res = []
        # 訪問済みの頂点を記録するハッシュ集合
        visited = set[Vertex]([start_vet])
        # BFS の実装にキューを使う
        que = deque[Vertex]([start_vet])
        # 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while len(que) > 0:
            vet = que.popleft()  # キューの先頭の頂点をデキューする
            res.append(vet)  # 訪問した頂点を記録する
            # この頂点に隣接する全頂点を走査する
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # 訪問済みの頂点をスキップする
                que.append(adj_vet)  # 未訪問の頂点だけをエンキューする
                visited.add(adj_vet)  # この頂点を訪問済みにする
        # 頂点の走査順序を返す
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // 頂点の走査順序
        vector<Vertex *> res;
        // 訪問済みの頂点を記録するハッシュ集合
        unordered_set<Vertex *> visited = {startVet};
        // BFS の実装にキューを使う
        queue<Vertex *> que;
        que.push(startVet);
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // キューの先頭の頂点をデキューする
            res.push_back(vet); // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // 訪問済みの頂点をスキップする
                que.push(adjVet);        // 未訪問の頂点だけをエンキューする
                visited.emplace(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = new ArrayList<>();
        // 訪問済みの頂点を記録するハッシュ集合
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // BFS の実装にキューを使う
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // キューの先頭の頂点をデキューする
            res.add(vet);            // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 訪問済みの頂点をスキップする
                que.offer(adjVet);   // 未訪問の頂点だけをエンキューする
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = [];
        // 訪問済みの頂点を記録するハッシュ集合
        HashSet<Vertex> visited = [startVet];
        // BFS の実装にキューを使う
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // キューの先頭の頂点をデキューする
            res.Add(vet);               // 訪問した頂点を記録する
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 訪問済みの頂点をスキップする
                }
                que.Enqueue(adjVet);   // 未訪問の頂点だけをエンキューする
                visited.Add(adjVet);   // この頂点を訪問済みにする
            }
        }

        // 頂点の走査順序を返す
        return res;
    }
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
        // 頂点の走査順序
        res := make([]Vertex, 0)
        // 訪問済みの頂点を記録するハッシュ集合
        visited := make(map[Vertex]struct{})
        visited[startVet] = struct{}{}
        // BFS の実装にキューを使い、スライスでキューを再現する
        queue := make([]Vertex, 0)
        queue = append(queue, startVet)
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        for len(queue) > 0 {
            // キューの先頭の頂点をデキューする
            vet := queue[0]
            queue = queue[1:]
            // 訪問した頂点を記録する
            res = append(res, vet)
            // この頂点に隣接する全頂点を走査する
            for _, adjVet := range g.adjList[vet] {
                _, isExist := visited[adjVet]
                // 未訪問の頂点だけをエンキューする
                if !isExist {
                    queue = append(queue, adjVet)
                    visited[adjVet] = struct{}{}
                }
            }
        }
        // 頂点の走査順序を返す
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // 頂点の走査順序
        var res: [Vertex] = []
        // 訪問済みの頂点を記録するハッシュ集合
        var visited: Set<Vertex> = [startVet]
        // BFS の実装にキューを使う
        var que: [Vertex] = [startVet]
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while !que.isEmpty {
            let vet = que.removeFirst() // キューの先頭の頂点をデキューする
            res.append(vet) // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for adjVet in graph.adjList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue // 訪問済みの頂点をスキップする
                }
                que.append(adjVet) // 未訪問の頂点だけをエンキューする
                visited.insert(adjVet) // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    function graphBFS(graph, startVet) {
        // 頂点の走査順序
        const res = [];
        // 訪問済みの頂点を記録するハッシュ集合
        const visited = new Set();
        visited.add(startVet);
        // BFS の実装にキューを使う
        const que = [startVet];
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (que.length) {
            const vet = que.shift(); // キューの先頭の頂点をデキューする
            res.push(vet); // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // 訪問済みの頂点をスキップする
                }
                que.push(adjVet); // 未訪問の頂点だけをエンキューする
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // 頂点の走査順序
        const res: Vertex[] = [];
        // 訪問済みの頂点を記録するハッシュ集合
        const visited: Set<Vertex> = new Set();
        visited.add(startVet);
        // BFS の実装にキューを使う
        const que = [startVet];
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (que.length) {
            const vet = que.shift(); // キューの先頭の頂点をデキューする
            res.push(vet); // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // 訪問済みの頂点をスキップする
                }
                que.push(adjVet); // 未訪問のものだけをエンキューする
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    /* 幅優先走査 */
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
      // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
      // 頂点の走査順序
      List<Vertex> res = [];
      // 訪問済みの頂点を記録するハッシュ集合
      Set<Vertex> visited = {};
      visited.add(startVet);
      // BFS の実装にキューを使う
      Queue<Vertex> que = Queue();
      que.add(startVet);
      // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
      while (que.isNotEmpty) {
        Vertex vet = que.removeFirst(); // キューの先頭の頂点をデキューする
        res.add(vet); // 訪問した頂点を記録する
        // この頂点に隣接する全頂点を走査する
        for (Vertex adjVet in graph.adjList[vet]!) {
          if (visited.contains(adjVet)) {
            continue; // 訪問済みの頂点をスキップする
          }
          que.add(adjVet); // 未訪問の頂点だけをエンキューする
          visited.add(adjVet); // この頂点を訪問済みにする
        }
      }
      // 頂点の走査順序を返す
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // 頂点の走査順序
        let mut res = vec![];
        // 訪問済みの頂点を記録するハッシュ集合
        let mut visited = HashSet::new();
        visited.insert(start_vet);
        // BFS の実装にキューを使う
        let mut que = VecDeque::new();
        que.push_back(start_vet);
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while let Some(vet) = que.pop_front() {
            res.push(vet); // 訪問した頂点を記録する

            // この頂点に隣接する全頂点を走査する
            if let Some(adj_vets) = graph.adj_list.get(&vet) {
                for &adj_vet in adj_vets {
                    if visited.contains(&adj_vet) {
                        continue; // 訪問済みの頂点をスキップする
                    }
                    que.push_back(adj_vet); // 未訪問の頂点だけをエンキューする
                    visited.insert(adj_vet); // この頂点を訪問済みにする
                }
            }
        }
        // 頂点の走査順序を返す
        res
    }
    ```

=== "C"

    ```c title="graph_bfs.c"
    /* ノードのキューの構造体 */
    typedef struct {
        Vertex *vertices[MAX_SIZE];
        int front, rear, size;
    } Queue;

    /* コンストラクタ */
    Queue *newQueue() {
        Queue *q = (Queue *)malloc(sizeof(Queue));
        q->front = q->rear = q->size = 0;
        return q;
    }

    /* キューが空か判定 */
    int isEmpty(Queue *q) {
        return q->size == 0;
    }

    /* エンキュー操作 */
    void enqueue(Queue *q, Vertex *vet) {
        q->vertices[q->rear] = vet;
        q->rear = (q->rear + 1) % MAX_SIZE;
        q->size++;
    }

    /* デキュー操作 */
    Vertex *dequeue(Queue *q) {
        Vertex *vet = q->vertices[q->front];
        q->front = (q->front + 1) % MAX_SIZE;
        q->size--;
        return vet;
    }

    /* 頂点が訪問済みかどうかを確認する */
    int isVisited(Vertex **visited, int size, Vertex *vet) {
        // 走査してノードを探すため、O(n) の時間を要する
        for (int i = 0; i < size; i++) {
            if (visited[i] == vet)
                return 1;
        }
        return 0;
    }

    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
        // BFS の実装にキューを使う
        Queue *queue = newQueue();
        enqueue(queue, startVet);
        visited[(*visitedSize)++] = startVet;
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (!isEmpty(queue)) {
            Vertex *vet = dequeue(queue); // キューの先頭の頂点をデキューする
            res[(*resSize)++] = vet;      // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            AdjListNode *node = findNode(graph, vet);
            while (node != NULL) {
                // 訪問済みの頂点をスキップする
                if (!isVisited(visited, *visitedSize, node->vertex)) {
                    enqueue(queue, node->vertex);             // 未訪問の頂点だけをエンキューする
                    visited[(*visitedSize)++] = node->vertex; // この頂点を訪問済みにする
                }
                node = node->next;
            }
        }
        // メモリを解放する
        free(queue);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_bfs.kt"
    /* 幅優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
        // 頂点の走査順序
        val res = mutableListOf<Vertex?>()
        // 訪問済みの頂点を記録するハッシュ集合
        val visited = HashSet<Vertex>()
        visited.add(startVet)
        // BFS の実装にキューを使う
        val que = LinkedList<Vertex>()
        que.offer(startVet)
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (!que.isEmpty()) {
            val vet = que.poll() // キューの先頭の頂点をデキューする
            res.add(vet)         // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for (adjVet in graph.adjList[vet]!!) {
                if (visited.contains(adjVet))
                    continue        // 訪問済みの頂点をスキップする
                que.offer(adjVet)   // 未訪問の頂点だけをエンキューする
                visited.add(adjVet) // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_bfs.rb"
    ### 幅優先走査 ###
    def graph_bfs(graph, start_vet)
      # 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
      # 頂点の走査順序
      res = []
      # 訪問済みの頂点を記録するハッシュ集合
      visited = Set.new([start_vet])
      # BFS の実装にキューを使う
      que = [start_vet]
      # 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
      while que.length > 0
        vet = que.shift # キューの先頭の頂点をデキューする
        res << vet # 訪問した頂点を記録する
        # この頂点に隣接する全頂点を走査する
        for adj_vet in graph.adj_list[vet]
          next if visited.include?(adj_vet) # 訪問済みの頂点をスキップする
          que << adj_vet # 未訪問の頂点だけをエンキューする
          visited.add(adj_vet) # この頂点を訪問済みにする
        end
      end
      # 頂点の走査順序を返す
      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%22%22%22%E5%80%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%22%22%22%E5%B9%85%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%22%22%22%0A%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20res%20%3D%20%5B%5D%0A%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%23%20BFS%20%E3%81%AE%E5%AE%9F%E8%A3%85%E3%81%AB%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E4%BD%BF%E3%81%86%0A%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%23%20%E9%A0%82%E7%82%B9%20vet%20%E3%82%92%E5%A7%8B%E7%82%B9%E3%81%A8%E3%81%97%E3%81%A6%E3%80%81%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E3%81%99%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E5%85%88%E9%A0%AD%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AB%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E5%85%A8%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20%E6%9C%AA%E8%A8%AA%E5%95%8F%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%A0%E3%81%91%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%E3%82%92%E8%BF%94%E3%81%99%0A%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20edges%20%3D%20%5B%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%5D%0A%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20del%20edges%0A%0A%20%20%23%20%E5%B9%85%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%0A%20%20res%20%3D%20graph_bfs%28graph,%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%22%22%22%E5%80%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%22%22%22%E5%B9%85%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%22%22%22%0A%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20res%20%3D%20%5B%5D%0A%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%23%20BFS%20%E3%81%AE%E5%AE%9F%E8%A3%85%E3%81%AB%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E4%BD%BF%E3%81%86%0A%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%23%20%E9%A0%82%E7%82%B9%20vet%20%E3%82%92%E5%A7%8B%E7%82%B9%E3%81%A8%E3%81%97%E3%81%A6%E3%80%81%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E3%81%99%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E5%85%88%E9%A0%AD%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AB%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E5%85%A8%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20%E6%9C%AA%E8%A8%AA%E5%95%8F%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%A0%E3%81%91%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%E3%82%92%E8%BF%94%E3%81%99%0A%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20edges%20%3D%20%5B%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%5D%0A%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20del%20edges%0A%0A%20%20%23%20%E5%B9%85%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%0A%20%20res%20%3D%20graph_bfs%28graph,%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

コードだけでは抽象的なので、図 9-10 と照らし合わせると理解が深まります。

=== "<1>"
    ![グラフの幅優先走査の手順](graph_traversal.assets/graph_bfs_step1.png){ class="animation-figure" }

=== "<2>"
    ![グラフの幅優先走査：手順 2](graph_traversal.assets/graph_bfs_step2.png){ class="animation-figure" }

=== "<3>"
    ![グラフの幅優先走査：手順 3](graph_traversal.assets/graph_bfs_step3.png){ class="animation-figure" }

=== "<4>"
    ![グラフの幅優先走査：手順 4](graph_traversal.assets/graph_bfs_step4.png){ class="animation-figure" }

=== "<5>"
    ![グラフの幅優先走査：手順 5](graph_traversal.assets/graph_bfs_step5.png){ class="animation-figure" }

=== "<6>"
    ![グラフの幅優先走査：手順 6](graph_traversal.assets/graph_bfs_step6.png){ class="animation-figure" }

=== "<7>"
    ![グラフの幅優先走査：手順 7](graph_traversal.assets/graph_bfs_step7.png){ class="animation-figure" }

=== "<8>"
    ![グラフの幅優先走査：手順 8](graph_traversal.assets/graph_bfs_step8.png){ class="animation-figure" }

=== "<9>"
    ![グラフの幅優先走査：手順 9](graph_traversal.assets/graph_bfs_step9.png){ class="animation-figure" }

=== "<10>"
    ![グラフの幅優先走査：手順 10](graph_traversal.assets/graph_bfs_step10.png){ class="animation-figure" }

=== "<11>"
    ![グラフの幅優先走査：手順 11](graph_traversal.assets/graph_bfs_step11.png){ class="animation-figure" }

<p align="center"> 図 9-10 &nbsp; グラフの幅優先走査の手順 </p>

!!! question "幅優先走査の順序は一意ですか？"

    一意ではありません。幅優先走査で必要なのは「近いところから遠いところへ」という順序だけで、**同じ距離にある複数の頂点は、どの順に訪問してもかまいません**。図 9-10 では、頂点 $1$ と $3$ の訪問順を入れ替えられますし、頂点 $2$、$4$、$6$ も任意の順に訪問できます。

### 2. &nbsp; 計算量の解析

**時間計算量**：すべての頂点を 1 回ずつキューに入れて取り出すため、$O(|V|)$ 時間かかります。隣接する頂点を走査する際は、無向グラフなので、すべての辺を $2$ 回ずつ調べ、$O(2|E|)$ 時間かかります。全体では $O(|V| + |E|)$ 時間です。

**空間計算量**：リスト `res`、ハッシュ集合 `visited`、キュー `que` が保持する頂点数は最大 $|V|$ なので、$O(|V|)$ の空間を使います。

## 9.3.2 &nbsp; 深さ優先走査

**深さ優先走査は、まず進めるところまで進み、行き止まりになったら引き返す走査方法です**。図 9-11 のように、左上の頂点から出発し、現在の頂点に隣接する頂点の一つを訪問して、行き止まりまで進んだら戻ります。別の方向でも同じように進んで戻る操作を繰り返し、すべての頂点を走査します。

![グラフの深さ優先走査](graph_traversal.assets/graph_dfs.png){ class="animation-figure" }

<p align="center"> 図 9-11 &nbsp; グラフの深さ優先走査 </p>

### 1. &nbsp; アルゴリズムの実装

この「行き止まりまで進んでから戻る」というアルゴリズムの形は、通常、再帰で実装します。幅優先走査と同様に、深さ優先走査でもハッシュ集合 `visited` に訪問済みの頂点を記録し、重複して訪問するのを防ぎます。

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """深さ優先走査の補助関数"""
        res.append(vet)  # 訪問した頂点を記録する
        visited.add(vet)  # この頂点を訪問済みにする
        # この頂点に隣接する全頂点を走査する
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # 訪問済みの頂点をスキップする
            # 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """深さ優先走査"""
        # 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
        # 頂点の走査順序
        res = []
        # 訪問済みの頂点を記録するハッシュ集合
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* 深さ優先走査の補助関数 */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // 訪問した頂点を記録する
        visited.emplace(vet); // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // 訪問済みの頂点をスキップする
            // 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // 頂点の走査順序
        vector<Vertex *> res;
        // 訪問済みの頂点を記録するハッシュ集合
        unordered_set<Vertex *> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Java"

    ```java title="graph_dfs.java"
    /* 深さ優先走査の補助関数 */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 訪問した頂点を記録する
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 訪問済みの頂点をスキップする
            // 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = new ArrayList<>();
        // 訪問済みの頂点を記録するハッシュ集合
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    /* 深さ優先走査の補助関数 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 訪問した頂点を記録する
        visited.Add(vet); // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 訪問済みの頂点をスキップする                             
            }
            // 隣接する頂点を再帰的に訪問する
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = [];
        // 訪問済みの頂点を記録するハッシュ集合
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* 深さ優先走査の補助関数 */
    func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
        // append 操作は新しい参照を返すため、元の参照に新しいスライスの参照を代入し直す必要がある
        *res = append(*res, vet)
        visited[vet] = struct{}{}
        // この頂点に隣接する全頂点を走査する
        for _, adjVet := range g.adjList[vet] {
            _, isExist := visited[adjVet]
            // 隣接する頂点を再帰的に訪問する
            if !isExist {
                dfs(g, visited, res, adjVet)
            }
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
        // 頂点の走査順序
        res := make([]Vertex, 0)
        // 訪問済みの頂点を記録するハッシュ集合
        visited := make(map[Vertex]struct{})
        dfs(g, visited, &res, startVet)
        // 頂点の走査順序を返す
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* 深さ優先走査の補助関数 */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // 訪問した頂点を記録する
        visited.insert(vet) // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 訪問済みの頂点をスキップする
            }
            // 隣接する頂点を再帰的に訪問する
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // 頂点の走査順序
        var res: [Vertex] = []
        // 訪問済みの頂点を記録するハッシュ集合
        var visited: Set<Vertex> = []
        dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    function dfs(graph, visited, res, vet) {
        res.push(vet); // 訪問した頂点を記録する
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点をスキップする
            }
            // 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    function graphDFS(graph, startVet) {
        // 頂点の走査順序
        const res = [];
        // 訪問済みの頂点を記録するハッシュ集合
        const visited = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_dfs.ts"
    /* 深さ優先走査の補助関数 */
    function dfs(
        graph: GraphAdjList,
        visited: Set<Vertex>,
        res: Vertex[],
        vet: Vertex
    ): void {
        res.push(vet); // 訪問した頂点を記録する
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点をスキップする
            }
            // 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // 頂点の走査順序
        const res: Vertex[] = [];
        // 訪問済みの頂点を記録するハッシュ集合
        const visited: Set<Vertex> = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_dfs.dart"
    /* 深さ優先走査の補助関数 */
    void dfs(
      GraphAdjList graph,
      Set<Vertex> visited,
      List<Vertex> res,
      Vertex vet,
    ) {
      res.add(vet); // 訪問した頂点を記録する
      visited.add(vet); // この頂点を訪問済みにする
      // この頂点に隣接する全頂点を走査する
      for (Vertex adjVet in graph.adjList[vet]!) {
        if (visited.contains(adjVet)) {
          continue; // 訪問済みの頂点をスキップする
        }
        // 隣接する頂点を再帰的に訪問する
        dfs(graph, visited, res, adjVet);
      }
    }

    /* 深さ優先走査 */
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
      // 頂点の走査順序
      List<Vertex> res = [];
      // 訪問済みの頂点を記録するハッシュ集合
      Set<Vertex> visited = {};
      dfs(graph, visited, res, startVet);
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    /* 深さ優先走査の補助関数 */
    fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
        res.push(vet); // 訪問した頂点を記録する
        visited.insert(vet); // この頂点を訪問済みにする
                             // この頂点に隣接する全頂点を走査する
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 訪問済みの頂点をスキップする
                }
                // 隣接する頂点を再帰的に訪問する
                dfs(graph, visited, res, adj_vet);
            }
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // 頂点の走査順序
        let mut res = vec![];
        // 訪問済みの頂点を記録するハッシュ集合
        let mut visited = HashSet::new();
        dfs(&graph, &mut visited, &mut res, start_vet);

        res
    }
    ```

=== "C"

    ```c title="graph_dfs.c"
    /* 頂点が訪問済みかどうかを確認する */
    int isVisited(Vertex **res, int size, Vertex *vet) {
        // 走査してノードを探すため、O(n) の時間を要する
        for (int i = 0; i < size; i++) {
            if (res[i] == vet) {
                return 1;
            }
        }
        return 0;
    }

    /* 深さ優先走査の補助関数 */
    void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
        // 訪問した頂点を記録する
        res[(*resSize)++] = vet;
        // この頂点に隣接する全頂点を走査する
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 訪問済みの頂点をスキップする
            if (!isVisited(res, *resSize, node->vertex)) {
                // 隣接する頂点を再帰的に訪問する
                dfs(graph, res, resSize, node->vertex);
            }
            node = node->next;
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
        dfs(graph, res, resSize, startVet);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_dfs.kt"
    /* 深さ優先走査の補助関数 */
    fun dfs(
        graph: GraphAdjList,
        visited: MutableSet<Vertex?>,
        res: MutableList<Vertex?>,
        vet: Vertex?
    ) {
        res.add(vet)     // 訪問した頂点を記録する
        visited.add(vet) // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue  // 訪問済みの頂点をスキップする
            // 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet)
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
        // 頂点の走査順序
        val res = mutableListOf<Vertex?>()
        // 訪問済みの頂点を記録するハッシュ集合
        val visited = HashSet<Vertex?>()
        dfs(graph, visited, res, startVet)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_dfs.rb"
    ### 深さ優先走査の補助関数 ###
    def dfs(graph, visited, res, vet)
      res << vet # 訪問した頂点を記録する
      visited.add(vet) # この頂点を訪問済みにする
      # この頂点に隣接する全頂点を走査する
      for adj_vet in graph.adj_list[vet]
        next if visited.include?(adj_vet) # 訪問済みの頂点をスキップする
        # 隣接する頂点を再帰的に訪問する
        dfs(graph, visited, res, adj_vet)
      end
    end

    ### 深さ優先走査 ###
    def graph_dfs(graph, start_vet)
      # 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
      # 頂点の走査順序
      res = []
      # 訪問済みの頂点を記録するハッシュ集合
      visited = Set.new
      dfs(graph, visited, res, start_vet)
      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%22%22%22%E5%80%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList,%20visited%3A%20set%5BVertex%5D,%20res%3A%20list%5BVertex%5D,%20vet%3A%20Vertex%29%3A%0A%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%E3%81%AE%E8%A3%9C%E5%8A%A9%E9%96%A2%E6%95%B0%22%22%22%0A%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20visited.add%28vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AB%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E5%85%A8%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E9%A0%82%E7%82%B9%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A8%AA%E5%95%8F%E3%81%99%E3%82%8B%0A%20%20%20%20dfs%28graph,%20visited,%20res,%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%22%22%22%0A%20%20%23%20%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%81%AB%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E5%85%A8%E9%A0%82%E7%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%97%E3%82%84%E3%81%99%E3%81%84%E3%82%88%E3%81%86%E3%81%AB%E3%80%81%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E8%A1%A8%E3%81%99%0A%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20res%20%3D%20%5B%5D%0A%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20dfs%28graph,%20visited,%20res,%20start_vet%29%0A%20%20return%20res%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20edges%20%3D%20%5B%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%5D%0A%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%23%20%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%0A%20%20res%20%3D%20graph_dfs%28graph,%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%22%22%22%E5%80%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList,%20visited%3A%20set%5BVertex%5D,%20res%3A%20list%5BVertex%5D,%20vet%3A%20Vertex%29%3A%0A%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%E3%81%AE%E8%A3%9C%E5%8A%A9%E9%96%A2%E6%95%B0%22%22%22%0A%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20visited.add%28vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AB%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E5%85%A8%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E9%A0%82%E7%82%B9%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A8%AA%E5%95%8F%E3%81%99%E3%82%8B%0A%20%20%20%20dfs%28graph,%20visited,%20res,%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList,%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%22%22%22%0A%20%20%23%20%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%81%AB%E9%9A%A3%E6%8E%A5%E3%81%99%E3%82%8B%E5%85%A8%E9%A0%82%E7%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%97%E3%82%84%E3%81%99%E3%81%84%E3%82%88%E3%81%86%E3%81%AB%E3%80%81%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E8%A1%A8%E3%81%99%0A%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20res%20%3D%20%5B%5D%0A%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20dfs%28graph,%20visited,%20res,%20start_vet%29%0A%20%20return%20res%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20v%20%3D%20vals_to_vets%28%5B0,%201,%202,%203,%204%5D%29%0A%20%20edges%20%3D%20%5B%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%5Bv%5B1%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%5D%0A%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%23%20%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%0A%20%20res%20%3D%20graph_dfs%28graph,%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

深さ優先走査のアルゴリズムの流れを図 9-12 に示します。

- **直線の破線は、下へ進む再帰呼び出しを表し**、新しい再帰メソッドを呼び出して、新しい頂点を訪問することを示します。
- **曲線の破線は、上へ戻る動きを表し**、再帰メソッドから戻り、そのメソッドを呼び出した位置に復帰することを示します。

理解を深めるため、図 9-12 とコードを照らし合わせ、各再帰メソッドがいつ呼ばれ、いつ戻るかを含めた DFS 全体の流れを、頭の中でたどるか、紙に描いてみてください。

=== "<1>"
    ![グラフの深さ優先走査の手順](graph_traversal.assets/graph_dfs_step1.png){ class="animation-figure" }

=== "<2>"
    ![グラフの深さ優先走査：手順 2](graph_traversal.assets/graph_dfs_step2.png){ class="animation-figure" }

=== "<3>"
    ![グラフの深さ優先走査：手順 3](graph_traversal.assets/graph_dfs_step3.png){ class="animation-figure" }

=== "<4>"
    ![グラフの深さ優先走査：手順 4](graph_traversal.assets/graph_dfs_step4.png){ class="animation-figure" }

=== "<5>"
    ![グラフの深さ優先走査：手順 5](graph_traversal.assets/graph_dfs_step5.png){ class="animation-figure" }

=== "<6>"
    ![グラフの深さ優先走査：手順 6](graph_traversal.assets/graph_dfs_step6.png){ class="animation-figure" }

=== "<7>"
    ![グラフの深さ優先走査：手順 7](graph_traversal.assets/graph_dfs_step7.png){ class="animation-figure" }

=== "<8>"
    ![グラフの深さ優先走査：手順 8](graph_traversal.assets/graph_dfs_step8.png){ class="animation-figure" }

=== "<9>"
    ![グラフの深さ優先走査：手順 9](graph_traversal.assets/graph_dfs_step9.png){ class="animation-figure" }

=== "<10>"
    ![グラフの深さ優先走査：手順 10](graph_traversal.assets/graph_dfs_step10.png){ class="animation-figure" }

=== "<11>"
    ![グラフの深さ優先走査：手順 11](graph_traversal.assets/graph_dfs_step11.png){ class="animation-figure" }

<p align="center"> 図 9-12 &nbsp; グラフの深さ優先走査の手順 </p>

!!! question "深さ優先走査の順序は一意ですか？"

    幅優先走査と同様に、深さ優先走査の順序も一意ではありません。ある頂点からどの方向を先に探索してもよく、隣接する頂点の順序を任意に入れ替えても、深さ優先走査であることは変わりません。
    
    木の走査を例にすると、「根 $\rightarrow$ 左 $\rightarrow$ 右」「左 $\rightarrow$ 根 $\rightarrow$ 右」「左 $\rightarrow$ 右 $\rightarrow$ 根」は、それぞれ行きがけ順、通りがけ順、帰りがけ順の走査です。訪問の優先順位は異なりますが、いずれも深さ優先走査です。

### 2. &nbsp; 計算量の解析

**時間計算量**：すべての頂点を $1$ 回ずつ訪問するのに $O(|V|)$ 時間、すべての辺を $2$ 回ずつ調べるのに $O(2|E|)$ 時間かかります。全体では $O(|V| + |E|)$ 時間です。

**空間計算量**：リスト `res` とハッシュ集合 `visited` の頂点数は最大 $|V|$、再帰の深さも最大 $|V|$ なので、$O(|V|)$ の空間を使います。
