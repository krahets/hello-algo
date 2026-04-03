---
comments: true
---

# 9.3 &nbsp; グラフの走査

木は「一対多」の関係を表すのに対し、グラフはより高い自由度を持ち、任意の「多対多」の関係を表現できます。したがって、木はグラフの一種の特殊な場合とみなせます。明らかに、**木の走査操作もグラフの走査操作の一種の特殊な場合です**。

グラフと木はいずれも、走査操作を実現するために探索アルゴリズムを用いる必要があります。グラフの走査方法も、<u>幅優先走査</u>と<u>深さ優先走査</u>の 2 種類に分けられます。

## 9.3.1 &nbsp; 幅優先走査

**幅優先走査は、近いところから遠いところへ向かう走査方法であり、ある頂点から出発して、常に最も近い頂点を優先して訪問し、層ごとに外側へ広がっていきます**。以下の図に示すように、左上の頂点から出発し、まずその頂点のすべての隣接頂点を走査し、次に次の頂点のすべての隣接頂点を走査し、これを繰り返して、すべての頂点を訪問するまで続けます。

![グラフの幅優先走査](graph_traversal.assets/graph_bfs.png){ class="animation-figure" }

<p align="center"> 図 9-9 &nbsp; グラフの幅優先走査 </p>

### 1. &nbsp; アルゴリズムの実装

BFS は通常キューを用いて実装され、コードは以下のとおりです。キューは「先入れ先出し」という性質を持ち、これは BFS の「近いところから遠いところへ」という考え方と本質的に一致しています。

1. 走査の開始頂点 `startVet` をキューに追加し、ループを開始します。
2. ループの各反復で、キュー先頭の頂点を取り出して訪問を記録し、その後その頂点のすべての隣接頂点をキューの末尾に追加します。
3. 手順 `2.` を繰り返し、すべての頂点が訪問されると終了します。

頂点の重複走査を防ぐために、どの頂点が訪問済みかを記録するハッシュ集合 `visited` を用います。

!!! tip

    ハッシュ集合は、`value` を持たず `key` だけを格納するハッシュテーブルとみなせます。これは $O(1)$ の時間計算量で `key` の追加・削除・検索・更新を行えます。`key` の一意性にもとづき、ハッシュ集合は通常、データの重複排除などの場面で用いられます。

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """幅優先探索"""
        # 指定した頂点の隣接頂点をすべて取得できるよう、隣接リストでグラフを表現する
        # 頂点の走査順序
        res = []
        # 訪問済み頂点を記録するためのハッシュ集合
        visited = set[Vertex]([start_vet])
        # BFS の実装にキューを用いる
        que = deque[Vertex]([start_vet])
        # 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while len(que) > 0:
            vet = que.popleft()  # 先頭の頂点をデキュー
            res.append(vet)  # 訪問した頂点を記録
            # この頂点のすべての隣接頂点を走査
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # 訪問済みの頂点をスキップ
                que.append(adj_vet)  # 未訪問の頂点のみをキューに追加
                visited.add(adj_vet)  # この頂点を訪問済みにする
        # 頂点の走査順を返す
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // 頂点の走査順序
        vector<Vertex *> res;
        // 訪問済み頂点を記録するためのハッシュ集合
        unordered_set<Vertex *> visited = {startVet};
        // BFS の実装にキューを用いる
        queue<Vertex *> que;
        que.push(startVet);
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // 先頭の頂点をデキュー
            res.push_back(vet); // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // 訪問済みの頂点をスキップ
                que.push(adjVet);        // 未訪問の頂点のみをキューに追加
                visited.emplace(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順を返す
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = new ArrayList<>();
        // 訪問済み頂点を記録するためのハッシュ集合
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // BFS の実装にキューを用いる
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 先頭の頂点をデキュー
            res.add(vet);            // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 訪問済みの頂点をスキップ
                que.offer(adjVet);   // 未訪問の頂点のみをキューに追加
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順を返す
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = [];
        // 訪問済み頂点を記録するためのハッシュ集合
        HashSet<Vertex> visited = [startVet];
        // BFS の実装にキューを用いる
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 先頭の頂点をデキュー
            res.Add(vet);               // 訪問した頂点を記録
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 訪問済みの頂点をスキップ
                }
                que.Enqueue(adjVet);   // 未訪問の頂点のみをキューに追加
                visited.Add(adjVet);   // この頂点を訪問済みにする
            }
        }

        // 頂点の走査順を返す
        return res;
    }
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
        // 頂点の走査順序
        res := make([]Vertex, 0)
        // 訪問済み頂点を記録するためのハッシュ集合
        visited := make(map[Vertex]struct{})
        visited[startVet] = struct{}{}
        // キューは BFS の実装に用い、スライスでキューをシミュレートする
        queue := make([]Vertex, 0)
        queue = append(queue, startVet)
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        for len(queue) > 0 {
            // 先頭の頂点をデキュー
            vet := queue[0]
            queue = queue[1:]
            // 訪問した頂点を記録
            res = append(res, vet)
            // この頂点のすべての隣接頂点を走査
            for _, adjVet := range g.adjList[vet] {
                _, isExist := visited[adjVet]
                // 未訪問の頂点のみをキューに追加
                if !isExist {
                    queue = append(queue, adjVet)
                    visited[adjVet] = struct{}{}
                }
            }
        }
        // 頂点の走査順を返す
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // 頂点の走査順序
        var res: [Vertex] = []
        // 訪問済み頂点を記録するためのハッシュ集合
        var visited: Set<Vertex> = [startVet]
        // BFS の実装にキューを用いる
        var que: [Vertex] = [startVet]
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while !que.isEmpty {
            let vet = que.removeFirst() // 先頭の頂点をデキュー
            res.append(vet) // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            for adjVet in graph.adjList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue // 訪問済みの頂点をスキップ
                }
                que.append(adjVet) // 未訪問の頂点のみをキューに追加
                visited.insert(adjVet) // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順を返す
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    function graphBFS(graph, startVet) {
        // 頂点の走査順序
        const res = [];
        // 訪問済み頂点を記録するためのハッシュ集合
        const visited = new Set();
        visited.add(startVet);
        // BFS の実装にキューを用いる
        const que = [startVet];
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (que.length) {
            const vet = que.shift(); // 先頭の頂点をデキュー
            res.push(vet); // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // 訪問済みの頂点をスキップ
                }
                que.push(adjVet); // 未訪問の頂点のみをキューに追加
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順を返す
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // 頂点の走査順序
        const res: Vertex[] = [];
        // 訪問済み頂点を記録するためのハッシュ集合
        const visited: Set<Vertex> = new Set();
        visited.add(startVet);
        // BFS の実装にキューを用いる
        const que = [startVet];
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (que.length) {
            const vet = que.shift(); // 先頭の頂点をデキュー
            res.push(vet); // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // 訪問済みの頂点をスキップ
                }
                que.push(adjVet); // 未訪問のものだけをキューに入れる
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順を返す
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    /* 幅優先探索 */
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
      // 指定した頂点の隣接頂点をすべて取得できるよう、隣接リストでグラフを表現する
      // 頂点の走査順序
      List<Vertex> res = [];
      // 訪問済み頂点を記録するためのハッシュ集合
      Set<Vertex> visited = {};
      visited.add(startVet);
      // BFS の実装にキューを用いる
      Queue<Vertex> que = Queue();
      que.add(startVet);
      // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
      while (que.isNotEmpty) {
        Vertex vet = que.removeFirst(); // 先頭の頂点をデキュー
        res.add(vet); // 訪問した頂点を記録
        // この頂点のすべての隣接頂点を走査
        for (Vertex adjVet in graph.adjList[vet]!) {
          if (visited.contains(adjVet)) {
            continue; // 訪問済みの頂点をスキップ
          }
          que.add(adjVet); // 未訪問の頂点のみをキューに追加
          visited.add(adjVet); // この頂点を訪問済みにする
        }
      }
      // 頂点の走査順を返す
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // 頂点の走査順序
        let mut res = vec![];
        // 訪問済み頂点を記録するためのハッシュ集合
        let mut visited = HashSet::new();
        visited.insert(start_vet);
        // BFS の実装にキューを用いる
        let mut que = VecDeque::new();
        que.push_back(start_vet);
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while let Some(vet) = que.pop_front() {
            res.push(vet); // 訪問した頂点を記録

            // この頂点のすべての隣接頂点を走査
            if let Some(adj_vets) = graph.adj_list.get(&vet) {
                for &adj_vet in adj_vets {
                    if visited.contains(&adj_vet) {
                        continue; // 訪問済みの頂点をスキップ
                    }
                    que.push_back(adj_vet); // 未訪問の頂点のみをキューに追加
                    visited.insert(adj_vet); // この頂点を訪問済みにする
                }
            }
        }
        // 頂点の走査順を返す
        res
    }
    ```

=== "C"

    ```c title="graph_bfs.c"
    /* ノードキュー構造体 */
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

    /* キューが空かどうかを判定 */
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

    /* 頂点が訪問済みかを確認 */
    int isVisited(Vertex **visited, int size, Vertex *vet) {
        // 走査してノードを探すため、O(n) 時間を要する
        for (int i = 0; i < size; i++) {
            if (visited[i] == vet)
                return 1;
        }
        return 0;
    }

    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
        // BFS の実装にキューを用いる
        Queue *queue = newQueue();
        enqueue(queue, startVet);
        visited[(*visitedSize)++] = startVet;
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (!isEmpty(queue)) {
            Vertex *vet = dequeue(queue); // 先頭の頂点をデキュー
            res[(*resSize)++] = vet;      // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            AdjListNode *node = findNode(graph, vet);
            while (node != NULL) {
                // 訪問済みの頂点をスキップ
                if (!isVisited(visited, *visitedSize, node->vertex)) {
                    enqueue(queue, node->vertex);             // 未訪問の頂点のみをキューに追加
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
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
        // 頂点の走査順序
        val res = mutableListOf<Vertex?>()
        // 訪問済み頂点を記録するためのハッシュ集合
        val visited = HashSet<Vertex>()
        visited.add(startVet)
        // BFS の実装にキューを用いる
        val que = LinkedList<Vertex>()
        que.offer(startVet)
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (!que.isEmpty()) {
            val vet = que.poll() // 先頭の頂点をデキュー
            res.add(vet)         // 訪問した頂点を記録
            // この頂点のすべての隣接頂点を走査
            for (adjVet in graph.adjList[vet]!!) {
                if (visited.contains(adjVet))
                    continue        // 訪問済みの頂点をスキップ
                que.offer(adjVet)   // 未訪問の頂点のみをキューに追加
                visited.add(adjVet) // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順を返す
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_bfs.rb"
    ### 幅優先探索 ###
    def graph_bfs(graph, start_vet)
      # 指定した頂点の隣接頂点をすべて取得できるよう、隣接リストでグラフを表現する
      # 頂点の走査順序
      res = []
      # 訪問済み頂点を記録するためのハッシュ集合
      visited = Set.new([start_vet])
      # BFS の実装にキューを用いる
      que = [start_vet]
      # 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
      while que.length > 0
        vet = que.shift # 先頭の頂点をデキュー
        res << vet # 訪問した頂点を記録
        # この頂点のすべての隣接頂点を走査
        for adj_vet in graph.adj_list[vet]
          next if visited.include?(adj_vet) # 訪問済みの頂点をスキップ
          que << adj_vet # 未訪問の頂点のみをキューに追加
          visited.add(adj_vet) # この頂点を訪問済みにする
        end
      end
      # 頂点の走査順を返す
      res
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E5%80%A4%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E5%9F%BA%E3%81%A5%E3%81%8F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E5%B9%85%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20BFS%20%E3%81%AE%E5%AE%9F%E8%A3%85%E3%81%AB%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E7%94%A8%E3%81%84%E3%82%8B%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%20vet%20%E3%82%92%E8%B5%B7%E7%82%B9%E3%81%AB%E3%80%81%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E3%81%97%E7%B5%82%E3%81%88%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20%20%20%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%0A%20%20%20%20%20%20%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20%E6%9C%AA%E8%A8%AA%E5%95%8F%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AE%E3%81%BF%E3%82%92%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20res%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E5%B9%85%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20graph_bfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E5%80%A4%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E5%9F%BA%E3%81%A5%E3%81%8F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E5%B9%85%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20BFS%20%E3%81%AE%E5%AE%9F%E8%A3%85%E3%81%AB%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E7%94%A8%E3%81%84%E3%82%8B%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%20vet%20%E3%82%92%E8%B5%B7%E7%82%B9%E3%81%AB%E3%80%81%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E3%81%97%E7%B5%82%E3%81%88%E3%82%8B%E3%81%BE%E3%81%A7%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20%20%20%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%0A%20%20%20%20%20%20%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%20%20%23%20%E6%9C%AA%E8%A8%AA%E5%95%8F%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AE%E3%81%BF%E3%82%92%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20res%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E5%B9%85%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20graph_bfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

コードはやや抽象的なので、以下の図と照らし合わせて理解を深めることを勧めます。

=== "<1>"
    ![グラフの幅優先走査の手順](graph_traversal.assets/graph_bfs_step1.png){ class="animation-figure" }

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

<p align="center"> 図 9-10 &nbsp; グラフの幅優先走査の手順 </p>

!!! question "幅優先走査の順序列は一意ですか？"

    一意ではありません。幅優先走査は「近いところから遠いところへ」の順で走査することだけを要求し、**同じ距離にある複数の頂点の走査順は任意に入れ替えて構いません**。上図を例にすると、頂点 $1$ と $3$ の訪問順は交換でき、頂点 $2$、$4$、$6$ の訪問順も任意に入れ替えられます。

### 2. &nbsp; 計算量の分析

**時間計算量**：すべての頂点は 1 回ずつキューに入り、1 回ずつキューから出るため、$O(|V|)$ 時間です。隣接頂点を走査する過程では、無向グラフであるため、すべての辺が $2$ 回訪問され、$O(2|E|)$ 時間です。したがって全体では $O(|V| + |E|)$ 時間です。

**空間計算量**：リスト `res`、ハッシュ集合 `visited`、キュー `que` に含まれる頂点数は最大で $|V|$ であるため、$O(|V|)$ 空間です。

## 9.3.2 &nbsp; 深さ優先走査

**深さ優先走査は、まず行けるところまで進み、進めなくなったら戻る走査方法です**。以下の図に示すように、左上の頂点から出発し、現在の頂点のある隣接頂点を訪問して、行き止まりに達するまで進んだら戻り、再び別の方向へ進んで行き止まりまで進んで戻る、ということを繰り返し、すべての頂点の走査が完了するまで続けます。

![グラフの深さ優先走査](graph_traversal.assets/graph_dfs.png){ class="animation-figure" }

<p align="center"> 図 9-11 &nbsp; グラフの深さ優先走査 </p>

### 1. &nbsp; アルゴリズムの実装

この「行き止まりまで進んでから戻る」アルゴリズムのパターンは、通常再帰にもとづいて実装されます。幅優先走査と同様に、深さ優先走査でも、頂点の重複訪問を避けるために、訪問済みの頂点を記録するハッシュ集合 `visited` を用います。

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """深さ優先走査の補助関数"""
        res.append(vet)  # 訪問した頂点を記録
        visited.add(vet)  # この頂点を訪問済みにする
        # この頂点のすべての隣接頂点を走査
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # 訪問済みの頂点をスキップ
            # 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """深さ優先探索"""
        # 指定した頂点の隣接頂点をすべて取得できるよう、隣接リストでグラフを表現する
        # 頂点の走査順序
        res = []
        # 訪問済み頂点を記録するためのハッシュ集合
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* 深さ優先走査の補助関数 */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // 訪問した頂点を記録
        visited.emplace(vet); // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // 訪問済みの頂点をスキップ
            // 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // 頂点の走査順序
        vector<Vertex *> res;
        // 訪問済み頂点を記録するためのハッシュ集合
        unordered_set<Vertex *> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Java"

    ```java title="graph_dfs.java"
    /* 深さ優先走査の補助関数 */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 訪問した頂点を記録
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 訪問済みの頂点をスキップ
            // 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = new ArrayList<>();
        // 訪問済み頂点を記録するためのハッシュ集合
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    /* 深さ優先走査の補助関数 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 訪問した頂点を記録
        visited.Add(vet); // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 訪問済みの頂点をスキップ
            }
            // 隣接頂点を再帰的に訪問
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = [];
        // 訪問済み頂点を記録するためのハッシュ集合
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* 深さ優先走査の補助関数 */
    func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
        // append 操作は新しい参照を返すため、元の参照を新しい slice の参照で再代入する必要がある
        *res = append(*res, vet)
        visited[vet] = struct{}{}
        // この頂点のすべての隣接頂点を走査
        for _, adjVet := range g.adjList[vet] {
            _, isExist := visited[adjVet]
            // 隣接頂点を再帰的に訪問
            if !isExist {
                dfs(g, visited, res, adjVet)
            }
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
        // 頂点の走査順序
        res := make([]Vertex, 0)
        // 訪問済み頂点を記録するためのハッシュ集合
        visited := make(map[Vertex]struct{})
        dfs(g, visited, &res, startVet)
        // 頂点の走査順を返す
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* 深さ優先走査の補助関数 */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // 訪問した頂点を記録
        visited.insert(vet) // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 訪問済みの頂点をスキップ
            }
            // 隣接頂点を再帰的に訪問
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // 頂点の走査順序
        var res: [Vertex] = []
        // 訪問済み頂点を記録するためのハッシュ集合
        var visited: Set<Vertex> = []
        dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    function dfs(graph, visited, res, vet) {
        res.push(vet); // 訪問した頂点を記録
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点をスキップ
            }
            // 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    function graphDFS(graph, startVet) {
        // 頂点の走査順序
        const res = [];
        // 訪問済み頂点を記録するためのハッシュ集合
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
        res.push(vet); // 訪問した頂点を記録
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点をスキップ
            }
            // 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // 頂点の走査順序
        const res: Vertex[] = [];
        // 訪問済み頂点を記録するためのハッシュ集合
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
      res.add(vet); // 訪問した頂点を記録
      visited.add(vet); // この頂点を訪問済みにする
      // この頂点のすべての隣接頂点を走査
      for (Vertex adjVet in graph.adjList[vet]!) {
        if (visited.contains(adjVet)) {
          continue; // 訪問済みの頂点をスキップ
        }
        // 隣接頂点を再帰的に訪問
        dfs(graph, visited, res, adjVet);
      }
    }

    /* 深さ優先探索 */
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
      // 頂点の走査順序
      List<Vertex> res = [];
      // 訪問済み頂点を記録するためのハッシュ集合
      Set<Vertex> visited = {};
      dfs(graph, visited, res, startVet);
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    /* 深さ優先走査の補助関数 */
    fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
        res.push(vet); // 訪問した頂点を記録
        visited.insert(vet); // この頂点を訪問済みにする
                             // この頂点のすべての隣接頂点を走査
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 訪問済みの頂点をスキップ
                }
                // 隣接頂点を再帰的に訪問
                dfs(graph, visited, res, adj_vet);
            }
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // 頂点の走査順序
        let mut res = vec![];
        // 訪問済み頂点を記録するためのハッシュ集合
        let mut visited = HashSet::new();
        dfs(&graph, &mut visited, &mut res, start_vet);

        res
    }
    ```

=== "C"

    ```c title="graph_dfs.c"
    /* 頂点が訪問済みかを確認 */
    int isVisited(Vertex **res, int size, Vertex *vet) {
        // 走査してノードを探すため、O(n) 時間を要する
        for (int i = 0; i < size; i++) {
            if (res[i] == vet) {
                return 1;
            }
        }
        return 0;
    }

    /* 深さ優先走査の補助関数 */
    void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
        // 訪問した頂点を記録
        res[(*resSize)++] = vet;
        // この頂点のすべての隣接頂点を走査
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 訪問済みの頂点をスキップ
            if (!isVisited(res, *resSize, node->vertex)) {
                // 隣接頂点を再帰的に訪問
                dfs(graph, res, resSize, node->vertex);
            }
            node = node->next;
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
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
        res.add(vet)     // 訪問した頂点を記録
        visited.add(vet) // この頂点を訪問済みにする
        // この頂点のすべての隣接頂点を走査
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue  // 訪問済みの頂点をスキップ
            // 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adjVet)
        }
    }

    /* 深さ優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
        // 頂点の走査順序
        val res = mutableListOf<Vertex?>()
        // 訪問済み頂点を記録するためのハッシュ集合
        val visited = HashSet<Vertex?>()
        dfs(graph, visited, res, startVet)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_dfs.rb"
    ### 深さ優先探索の補助関数 ###
    def dfs(graph, visited, res, vet)
      res << vet # 訪問した頂点を記録
      visited.add(vet) # この頂点を訪問済みにする
      # この頂点のすべての隣接頂点を走査
      for adj_vet in graph.adj_list[vet]
        next if visited.include?(adj_vet) # 訪問済みの頂点をスキップ
        # 隣接頂点を再帰的に訪問
        dfs(graph, visited, res, adj_vet)
      end
    end

    ### 深さ優先探索 ###
    def graph_dfs(graph, start_vet)
      # 指定した頂点の隣接頂点をすべて取得できるよう、隣接リストでグラフを表現する
      # 頂点の走査順序
      res = []
      # 訪問済み頂点を記録するためのハッシュ集合
      visited = Set.new
      dfs(graph, visited, res, start_vet)
      res
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E5%80%A4%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E5%9F%BA%E3%81%A5%E3%81%8F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList%2C%20visited%3A%20set%5BVertex%5D%2C%20res%3A%20list%5BVertex%5D%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%E3%81%AE%E8%A3%9C%E5%8A%A9%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%0A%20%20%20%20visited.add%28vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%0A%20%20%20%20%20%20%20%20%23%20%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A8%AA%E5%95%8F%0A%20%20%20%20%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%81%AE%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E3%81%99%E3%81%B9%E3%81%A6%E5%8F%96%E5%BE%97%E3%81%A7%E3%81%8D%E3%82%8B%E3%82%88%E3%81%86%E3%80%81%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E8%A1%A8%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20start_vet%29%0A%20%20%20%20return%20res%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%20%20%23%20%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20graph_dfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E5%80%A4%E3%83%AA%E3%82%B9%E3%83%88%20vals%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%80%81%E9%A0%82%E7%82%B9%E3%83%AA%E3%82%B9%E3%83%88%20vets%20%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E5%9F%BA%E3%81%A5%E3%81%8F%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%BE%BA%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E9%A0%82%E7%82%B9%E3%82%92%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%0Adef%20dfs%28graph%3A%20GraphAdjList%2C%20visited%3A%20set%5BVertex%5D%2C%20res%3A%20list%5BVertex%5D%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E8%B5%B0%E6%9F%BB%E3%81%AE%E8%A3%9C%E5%8A%A9%E9%96%A2%E6%95%B0%22%22%22%0A%20%20%20%20res.append%28vet%29%20%20%23%20%E8%A8%AA%E5%95%8F%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%0A%20%20%20%20visited.add%28vet%29%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E9%A0%82%E7%82%B9%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E3%82%B9%E3%82%AD%E3%83%83%E3%83%97%0A%20%20%20%20%20%20%20%20%23%20%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E8%A8%AA%E5%95%8F%0A%20%20%20%20%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20adjVet%29%0A%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20%22%22%22%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%9F%E9%A0%82%E7%82%B9%E3%81%AE%E9%9A%A3%E6%8E%A5%E9%A0%82%E7%82%B9%E3%82%92%E3%81%99%E3%81%B9%E3%81%A6%E5%8F%96%E5%BE%97%E3%81%A7%E3%81%8D%E3%82%8B%E3%82%88%E3%81%86%E3%80%81%E9%9A%A3%E6%8E%A5%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E8%A1%A8%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E9%A0%82%E7%82%B9%E3%81%AE%E8%B5%B0%E6%9F%BB%E9%A0%86%E5%BA%8F%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E6%B8%88%E3%81%BF%E3%81%AE%E9%A0%82%E7%82%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20start_vet%29%0A%20%20%20%20return%20res%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E7%84%A1%E5%90%91%E3%82%B0%E3%83%A9%E3%83%95%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%0A%20%20%20%20%23%20%E6%B7%B1%E3%81%95%E5%84%AA%E5%85%88%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20graph_dfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

深さ優先走査のアルゴリズムの流れは以下の図のとおりです。

- **直線の破線は下向きの再帰呼び出し**を表し、新しい頂点を訪問するために新たな再帰メソッドが開始されたことを意味します。
- **曲線の破線は上向きのバックトラック**を表し、この再帰メソッドがすでに戻って、呼び出し元の位置までたどり着いたことを意味します。

理解を深めるために、以下の図とコードを結びつけて、DFS 全体の過程を頭の中でシミュレーションする（あるいは紙に書き出す）ことを勧めます。各再帰メソッドがいつ開始し、いつ戻るかも含めて追ってみてください。

=== "<1>"
    ![グラフの深さ優先走査の手順](graph_traversal.assets/graph_dfs_step1.png){ class="animation-figure" }

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

<p align="center"> 図 9-12 &nbsp; グラフの深さ優先走査の手順 </p>

!!! question "深さ優先走査の順序列は一意ですか？"

    幅優先走査と同様に、深さ優先走査の順序列も一意ではありません。ある頂点が与えられたとき、どの方向を先に探索してもよく、つまり隣接頂点の順序は任意に入れ替えられ、それでも深さ優先走査になります。
    
    木の走査を例にすると、「根 $\rightarrow$ 左 $\rightarrow$ 右」「左 $\rightarrow$ 根 $\rightarrow$ 右」「左 $\rightarrow$ 右 $\rightarrow$ 根」は、それぞれ先行順、中間順、後行順走査に対応します。これらは 3 種類の走査優先順位を示していますが、いずれも深さ優先走査に属します。

### 2. &nbsp; 計算量の分析

**時間計算量**：すべての頂点は $1$ 回ずつ訪問されるため、$O(|V|)$ 時間です。すべての辺は $2$ 回ずつ訪問されるため、$O(2|E|)$ 時間です。したがって全体では $O(|V| + |E|)$ 時間です。

**空間計算量**：リスト `res` とハッシュ集合 `visited` に含まれる頂点数は最大で $|V|$ であり、再帰の深さも最大で $|V|$ であるため、$O(|V|)$ 空間です。
