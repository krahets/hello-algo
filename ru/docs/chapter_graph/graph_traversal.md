---
comments: true
---

# 9.3 &nbsp; Обход графа

Дерево представляет отношение "один ко многим", а граф имеет более высокую степень свободы и может выражать произвольные отношения "многие ко многим". Поэтому мы можем рассматривать дерево как частный случай графа. Очевидно, что **операции обхода дерева также являются частным случаем операций обхода графа**.

И графы, и деревья требуют использования поисковых алгоритмов для реализации обхода. Способы обхода графа также делятся на два типа: <u>обход в ширину</u> и <u>обход в глубину</u>.

## 9.3.1 &nbsp; Обход в ширину

**Обход в ширину - это способ обхода "от близкого к далекому": начиная с некоторого узла, мы всегда в первую очередь посещаем ближайшие вершины и слой за слоем расширяемся наружу**. Как показано на рисунке 9-9, начиная с вершины в левом верхнем углу, мы сначала обходим все смежные вершины этой вершины, затем все смежные вершины следующей вершины и так далее, пока не будут посещены все вершины.

![Обход графа в ширину](graph_traversal.assets/graph_bfs.png){ class="animation-figure" }

<p align="center"> Рисунок 9-9 &nbsp; Обход графа в ширину </p>

### 1. &nbsp; Реализация алгоритма

BFS обычно реализуется с помощью очереди, код приведен ниже. Очередь обладает свойством "первым пришел - первым вышел", что хорошо соответствует идее BFS "от близкого к далекому".

1. Поместить стартовую вершину обхода `startVet` в очередь и запустить цикл.
2. На каждой итерации цикла извлекать вершину из головы очереди и записывать факт ее посещения, после чего добавлять все смежные вершины этой вершины в хвост очереди.
3. Повторять шаг `2.` до тех пор, пока не будут посещены все вершины.

Чтобы предотвратить повторный обход вершин, нам нужен хеш-набор `visited` , в котором будет записываться, какие узлы уже посещены.

!!! tip

    Хеш-набор можно рассматривать как хеш-таблицу, которая хранит только `key` и не хранит `value` . Он позволяет выполнять добавление, удаление, поиск и изменение `key` за $O(1)$ времени. Благодаря уникальности `key` хеш-набор обычно используется, например, для устранения повторов.

=== "Python"

    ```python title="graph_bfs.py"
    def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Обход в ширину"""
        # Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
        # Последовательность обхода вершин
        res = []
        # Хеш-множество для хранения уже посещенных вершин
        visited = set[Vertex]([start_vet])
        # Очередь используется для реализации BFS
        que = deque[Vertex]([start_vet])
        # Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while len(que) > 0:
            vet = que.popleft()  # Извлечь головную вершину из очереди
            res.append(vet)  # Отметить посещенную вершину
            # Обойти все смежные вершины данной вершины
            for adj_vet in graph.adj_list[vet]:
                if adj_vet in visited:
                    continue  # Пропустить уже посещенную вершину
                que.append(adj_vet)  # Помещать в очередь только непосещенные вершины
                visited.add(adj_vet)  # Отметить эту вершину как посещенную
        # Вернуть последовательность обхода вершин
        return res
    ```

=== "C++"

    ```cpp title="graph_bfs.cpp"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
        // Последовательность обхода вершин
        vector<Vertex *> res;
        // Хеш-множество для хранения уже посещенных вершин
        unordered_set<Vertex *> visited = {startVet};
        // Очередь используется для реализации BFS
        queue<Vertex *> que;
        que.push(startVet);
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (!que.empty()) {
            Vertex *vet = que.front();
            que.pop();          // Извлечь головную вершину из очереди
            res.push_back(vet); // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for (auto adjVet : graph.adjList[vet]) {
                if (visited.count(adjVet))
                    continue;            // Пропустить уже посещенную вершину
                que.push(adjVet);        // Помещать в очередь только непосещенные вершины
                visited.emplace(adjVet); // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res;
    }
    ```

=== "Java"

    ```java title="graph_bfs.java"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = new ArrayList<>();
        // Хеш-множество для хранения уже посещенных вершин
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Очередь используется для реализации BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Извлечь головную вершину из очереди
            res.add(vet);            // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Пропустить уже посещенную вершину
                que.offer(adjVet);   // Помещать в очередь только непосещенные вершины
                visited.add(adjVet); // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_bfs.cs"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = [];
        // Хеш-множество для хранения уже посещенных вершин
        HashSet<Vertex> visited = [startVet];
        // Очередь используется для реализации BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Извлечь головную вершину из очереди
            res.Add(vet);               // Отметить посещенную вершину
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Пропустить уже посещенную вершину
                }
                que.Enqueue(adjVet);   // Помещать в очередь только непосещенные вершины
                visited.Add(adjVet);   // Отметить эту вершину как посещенную
            }
        }

        // Вернуть последовательность обхода вершин
        return res;
    }
    ```

=== "Go"

    ```go title="graph_bfs.go"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
        // Последовательность обхода вершин
        res := make([]Vertex, 0)
        // Хеш-множество для хранения уже посещенных вершин
        visited := make(map[Vertex]struct{})
        visited[startVet] = struct{}{}
        // Очередь используется для реализации BFS, срез используется для имитации очереди
        queue := make([]Vertex, 0)
        queue = append(queue, startVet)
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        for len(queue) > 0 {
            // Извлечь головную вершину из очереди
            vet := queue[0]
            queue = queue[1:]
            // Отметить посещенную вершину
            res = append(res, vet)
            // Обойти все смежные вершины данной вершины
            for _, adjVet := range g.adjList[vet] {
                _, isExist := visited[adjVet]
                // Помещать в очередь только непосещенные вершины
                if !isExist {
                    queue = append(queue, adjVet)
                    visited[adjVet] = struct{}{}
                }
            }
        }
        // Вернуть последовательность обхода вершин
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_bfs.swift"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // Последовательность обхода вершин
        var res: [Vertex] = []
        // Хеш-множество для хранения уже посещенных вершин
        var visited: Set<Vertex> = [startVet]
        // Очередь используется для реализации BFS
        var que: [Vertex] = [startVet]
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while !que.isEmpty {
            let vet = que.removeFirst() // Извлечь головную вершину из очереди
            res.append(vet) // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for adjVet in graph.adjList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue // Пропустить уже посещенную вершину
                }
                que.append(adjVet) // Помещать в очередь только непосещенные вершины
                visited.insert(adjVet) // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_bfs.js"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    function graphBFS(graph, startVet) {
        // Последовательность обхода вершин
        const res = [];
        // Хеш-множество для хранения уже посещенных вершин
        const visited = new Set();
        visited.add(startVet);
        // Очередь используется для реализации BFS
        const que = [startVet];
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (que.length) {
            const vet = que.shift(); // Извлечь головную вершину из очереди
            res.push(vet); // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // Пропустить уже посещенную вершину
                }
                que.push(adjVet); // Помещать в очередь только непосещенные вершины
                visited.add(adjVet); // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_bfs.ts"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // Последовательность обхода вершин
        const res: Vertex[] = [];
        // Хеш-множество для хранения уже посещенных вершин
        const visited: Set<Vertex> = new Set();
        visited.add(startVet);
        // Очередь используется для реализации BFS
        const que = [startVet];
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (que.length) {
            const vet = que.shift(); // Извлечь головную вершину из очереди
            res.push(vet); // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for (const adjVet of graph.adjList.get(vet) ?? []) {
                if (visited.has(adjVet)) {
                    continue; // Пропустить уже посещенную вершину
                }
                que.push(adjVet); // Помещать в очередь только непосещенные вершины
                visited.add(adjVet); // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_bfs.dart"
    /* Обход в ширину */
    List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
      // Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
      // Последовательность обхода вершин
      List<Vertex> res = [];
      // Хеш-множество для хранения уже посещенных вершин
      Set<Vertex> visited = {};
      visited.add(startVet);
      // Очередь используется для реализации BFS
      Queue<Vertex> que = Queue();
      que.add(startVet);
      // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
      while (que.isNotEmpty) {
        Vertex vet = que.removeFirst(); // Извлечь головную вершину из очереди
        res.add(vet); // Отметить посещенную вершину
        // Обойти все смежные вершины данной вершины
        for (Vertex adjVet in graph.adjList[vet]!) {
          if (visited.contains(adjVet)) {
            continue; // Пропустить уже посещенную вершину
          }
          que.add(adjVet); // Помещать в очередь только непосещенные вершины
          visited.add(adjVet); // Отметить эту вершину как посещенную
        }
      }
      // Вернуть последовательность обхода вершин
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_bfs.rs"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // Последовательность обхода вершин
        let mut res = vec![];
        // Хеш-множество для хранения уже посещенных вершин
        let mut visited = HashSet::new();
        visited.insert(start_vet);
        // Очередь используется для реализации BFS
        let mut que = VecDeque::new();
        que.push_back(start_vet);
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while let Some(vet) = que.pop_front() {
            res.push(vet); // Отметить посещенную вершину

            // Обойти все смежные вершины данной вершины
            if let Some(adj_vets) = graph.adj_list.get(&vet) {
                for &adj_vet in adj_vets {
                    if visited.contains(&adj_vet) {
                        continue; // Пропустить уже посещенную вершину
                    }
                    que.push_back(adj_vet); // Помещать в очередь только непосещенные вершины
                    visited.insert(adj_vet); // Отметить эту вершину как посещенную
                }
            }
        }
        // Вернуть последовательность обхода вершин
        res
    }
    ```

=== "C"

    ```c title="graph_bfs.c"
    /* Структура очереди узлов */
    typedef struct {
        Vertex *vertices[MAX_SIZE];
        int front, rear, size;
    } Queue;

    /* Конструктор */
    Queue *newQueue() {
        Queue *q = (Queue *)malloc(sizeof(Queue));
        q->front = q->rear = q->size = 0;
        return q;
    }

    /* Проверка, пуста ли очередь */
    int isEmpty(Queue *q) {
        return q->size == 0;
    }

    /* Операция добавления в очередь */
    void enqueue(Queue *q, Vertex *vet) {
        q->vertices[q->rear] = vet;
        q->rear = (q->rear + 1) % MAX_SIZE;
        q->size++;
    }

    /* Операция извлечения из очереди */
    Vertex *dequeue(Queue *q) {
        Vertex *vet = q->vertices[q->front];
        q->front = (q->front + 1) % MAX_SIZE;
        q->size--;
        return vet;
    }

    /* Проверить, была ли вершина уже посещена */
    int isVisited(Vertex **visited, int size, Vertex *vet) {
        // Искать узел обходом за O(n) времени
        for (int i = 0; i < size; i++) {
            if (visited[i] == vet)
                return 1;
        }
        return 0;
    }

    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
        // Очередь используется для реализации BFS
        Queue *queue = newQueue();
        enqueue(queue, startVet);
        visited[(*visitedSize)++] = startVet;
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (!isEmpty(queue)) {
            Vertex *vet = dequeue(queue); // Извлечь головную вершину из очереди
            res[(*resSize)++] = vet;      // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            AdjListNode *node = findNode(graph, vet);
            while (node != NULL) {
                // Пропустить уже посещенную вершину
                if (!isVisited(visited, *visitedSize, node->vertex)) {
                    enqueue(queue, node->vertex);             // Помещать в очередь только непосещенные вершины
                    visited[(*visitedSize)++] = node->vertex; // Отметить эту вершину как посещенную
                }
                node = node->next;
            }
        }
        // Освободить память
        free(queue);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_bfs.kt"
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
        // Последовательность обхода вершин
        val res = mutableListOf<Vertex?>()
        // Хеш-множество для хранения уже посещенных вершин
        val visited = HashSet<Vertex>()
        visited.add(startVet)
        // Очередь используется для реализации BFS
        val que = LinkedList<Vertex>()
        que.offer(startVet)
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (!que.isEmpty()) {
            val vet = que.poll() // Извлечь головную вершину из очереди
            res.add(vet)         // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for (adjVet in graph.adjList[vet]!!) {
                if (visited.contains(adjVet))
                    continue        // Пропустить уже посещенную вершину
                que.offer(adjVet)   // Помещать в очередь только непосещенные вершины
                visited.add(adjVet) // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_bfs.rb"
    =begin
    File: graph_bfs.rb
    Created Time: 2024-04-25
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require 'set'
    require_relative './graph_adjacency_list'
    require_relative '../utils/vertex'

    # ## Обход в ширину ###
    def graph_bfs(graph, start_vet)
      # Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
      # Последовательность обхода вершин
      res = []
      # Хеш-множество для хранения уже посещенных вершин
      visited = Set.new([start_vet])
      # Очередь используется для реализации BFS
      que = [start_vet]
      # Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
      while que.length > 0
        vet = que.shift # Извлечь головную вершину из очереди
        res << vet # Отметить посещенную вершину
        # Обойти все смежные вершины данной вершины
        for adj_vet in graph.adj_list[vet]
          next if visited.include?(adj_vet) # Пропустить уже посещенную вершину
          que << adj_vet # Помещать в очередь только непосещенные вершины
          visited.add(adj_vet) # Отметить эту вершину как посещенную
        end
      end
      # Вернуть последовательность обхода вершин
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%27Vertex%27%5D%3A%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%0A%20%20%20%20%20%20%20%20res.append%28vet%29%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%20%20%20%20res%20%3D%20graph_bfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20Vertex%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%27Vertex%27%5D%3A%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0Adef%20graph_bfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20que%20%3D%20deque%5BVertex%5D%28%5Bstart_vet%5D%29%0A%20%20%20%20while%20len%28que%29%20%3E%200%3A%0A%20%20%20%20%20%20%20%20vet%20%3D%20que.popleft%28%29%0A%20%20%20%20%20%20%20%20res.append%28vet%29%0A%20%20%20%20%20%20%20%20for%20adj_vet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20adj_vet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%20%20%20%20que.append%28adj_vet%29%0A%20%20%20%20%20%20%20%20%20%20%20%20visited.add%28adj_vet%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%20%20%20%20res%20%3D%20graph_bfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=131&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Код сравнительно абстрактен, поэтому рекомендуется сверяться с рисунками ниже для лучшего понимания.

=== "<1>"
    ![Шаги обхода графа в ширину](graph_traversal.assets/graph_bfs_step1.png){ class="animation-figure" }

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

<p align="center"> Рисунок 9-10 &nbsp; Шаги обхода графа в ширину </p>

!!! question "Является ли последовательность обхода в ширину единственной?"

    Нет. Обход в ширину требует только соблюдения порядка "от близкого к далекому", **а порядок обхода нескольких вершин на одинаковом расстоянии может произвольно меняться**. Например, на рисунке 9-10 можно поменять местами порядок посещения вершин $1$ и $3$ , а также в произвольном порядке переставить вершины $2$, $4$, $6$ .

### 2. &nbsp; Анализ сложности

**Временная сложность**: все вершины по одному разу помещаются в очередь и извлекаются из нее, что требует $O(|V|)$ времени; при обходе смежных вершин, поскольку граф неориентированный, все ребра будут посещены по $2$ раза, что требует $O(2|E|)$ времени; в сумме получается $O(|V| + |E|)$ .

**Пространственная сложность**: список `res` , хеш-набор `visited` и очередь `que` в худшем случае могут содержать до $|V|$ вершин, поэтому требуется $O(|V|)$ памяти.

## 9.3.2 &nbsp; Обход в глубину

**Обход в глубину - это способ обхода, при котором сначала идут до самого конца, а когда дальше идти нельзя, откатываются назад**. Как показано на рисунке 9-11, начиная с вершины в левом верхнем углу, мы выбираем некоторую смежную вершину текущей вершины, идем до упора, затем возвращаемся назад, снова идем до упора и так далее, пока не будут посещены все вершины.

![Обход графа в глубину](graph_traversal.assets/graph_dfs.png){ class="animation-figure" }

<p align="center"> Рисунок 9-11 &nbsp; Обход графа в глубину </p>

### 1. &nbsp; Реализация алгоритма

Такой алгоритмический шаблон "дойти до конца и вернуться" обычно реализуется через рекурсию. Подобно обходу в ширину, в обходе в глубину мы также используем хеш-набор `visited` для записи уже посещенных вершин и тем самым избегаем повторного посещения.

=== "Python"

    ```python title="graph_dfs.py"
    def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
        """Вспомогательная функция обхода в глубину"""
        res.append(vet)  # Отметить посещенную вершину
        visited.add(vet)  # Отметить эту вершину как посещенную
        # Обойти все смежные вершины данной вершины
        for adjVet in graph.adj_list[vet]:
            if adjVet in visited:
                continue  # Пропустить уже посещенную вершину
            # Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet)

    def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
        """Обход в глубину"""
        # Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
        # Последовательность обхода вершин
        res = []
        # Хеш-множество для хранения уже посещенных вершин
        visited = set[Vertex]()
        dfs(graph, visited, res, start_vet)
        return res
    ```

=== "C++"

    ```cpp title="graph_dfs.cpp"
    /* Вспомогательная функция обхода в глубину */
    void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
        res.push_back(vet);   // Отметить посещенную вершину
        visited.emplace(vet); // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for (Vertex *adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue; // Пропустить уже посещенную вершину
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
        // Последовательность обхода вершин
        vector<Vertex *> res;
        // Хеш-множество для хранения уже посещенных вершин
        unordered_set<Vertex *> visited;
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Java"

    ```java title="graph_dfs.java"
    /* Вспомогательная функция обхода в глубину */
    void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // Отметить посещенную вершину
        visited.add(vet); // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Пропустить уже посещенную вершину
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = new ArrayList<>();
        // Хеш-множество для хранения уже посещенных вершин
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "C#"

    ```csharp title="graph_dfs.cs"
    /* Вспомогательная функция обхода в глубину */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Отметить посещенную вершину
        visited.Add(vet); // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Пропустить уже посещенную вершину
            }
            // Рекурсивно обходить смежные вершины
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = [];
        // Хеш-множество для хранения уже посещенных вершин
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Go"

    ```go title="graph_dfs.go"
    /* Вспомогательная функция обхода в глубину */
    func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
        // Операция append возвращает новую ссылку, поэтому исходную ссылку нужно заново присвоить новому срезу
        *res = append(*res, vet)
        visited[vet] = struct{}{}
        // Обойти все смежные вершины данной вершины
        for _, adjVet := range g.adjList[vet] {
            _, isExist := visited[adjVet]
            // Рекурсивно обходить смежные вершины
            if !isExist {
                dfs(g, visited, res, adjVet)
            }
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
        // Последовательность обхода вершин
        res := make([]Vertex, 0)
        // Хеш-множество для хранения уже посещенных вершин
        visited := make(map[Vertex]struct{})
        dfs(g, visited, &res, startVet)
        // Вернуть последовательность обхода вершин
        return res
    }
    ```

=== "Swift"

    ```swift title="graph_dfs.swift"
    /* Вспомогательная функция обхода в глубину */
    func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
        res.append(vet) // Отметить посещенную вершину
        visited.insert(vet) // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Пропустить уже посещенную вершину
            }
            // Рекурсивно обходить смежные вершины
            dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
        // Последовательность обхода вершин
        var res: [Vertex] = []
        // Хеш-множество для хранения уже посещенных вершин
        var visited: Set<Vertex> = []
        dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
        return res
    }
    ```

=== "JS"

    ```javascript title="graph_dfs.js"
    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    function dfs(graph, visited, res, vet) {
        res.push(vet); // Отметить посещенную вершину
        visited.add(vet); // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // Пропустить уже посещенную вершину
            }
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    function graphDFS(graph, startVet) {
        // Последовательность обхода вершин
        const res = [];
        // Хеш-множество для хранения уже посещенных вершин
        const visited = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "TS"

    ```typescript title="graph_dfs.ts"
    /* Вспомогательная функция обхода в глубину */
    function dfs(
        graph: GraphAdjList,
        visited: Set<Vertex>,
        res: Vertex[],
        vet: Vertex
    ): void {
        res.push(vet); // Отметить посещенную вершину
        visited.add(vet); // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for (const adjVet of graph.adjList.get(vet)) {
            if (visited.has(adjVet)) {
                continue; // Пропустить уже посещенную вершину
            }
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
        // Последовательность обхода вершин
        const res: Vertex[] = [];
        // Хеш-множество для хранения уже посещенных вершин
        const visited: Set<Vertex> = new Set();
        dfs(graph, visited, res, startVet);
        return res;
    }
    ```

=== "Dart"

    ```dart title="graph_dfs.dart"
    /* Вспомогательная функция обхода в глубину */
    void dfs(
      GraphAdjList graph,
      Set<Vertex> visited,
      List<Vertex> res,
      Vertex vet,
    ) {
      res.add(vet); // Отметить посещенную вершину
      visited.add(vet); // Отметить эту вершину как посещенную
      // Обойти все смежные вершины данной вершины
      for (Vertex adjVet in graph.adjList[vet]!) {
        if (visited.contains(adjVet)) {
          continue; // Пропустить уже посещенную вершину
        }
        // Рекурсивно обходить смежные вершины
        dfs(graph, visited, res, adjVet);
      }
    }

    /* Обход в глубину */
    List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
      // Последовательность обхода вершин
      List<Vertex> res = [];
      // Хеш-множество для хранения уже посещенных вершин
      Set<Vertex> visited = {};
      dfs(graph, visited, res, startVet);
      return res;
    }
    ```

=== "Rust"

    ```rust title="graph_dfs.rs"
    /* Вспомогательная функция обхода в глубину */
    fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
        res.push(vet); // Отметить посещенную вершину
        visited.insert(vet); // Отметить эту вершину как посещенную
                             // Обойти все смежные вершины данной вершины
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // Пропустить уже посещенную вершину
                }
                // Рекурсивно обходить смежные вершины
                dfs(graph, visited, res, adj_vet);
            }
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
        // Последовательность обхода вершин
        let mut res = vec![];
        // Хеш-множество для хранения уже посещенных вершин
        let mut visited = HashSet::new();
        dfs(&graph, &mut visited, &mut res, start_vet);

        res
    }
    ```

=== "C"

    ```c title="graph_dfs.c"
    /* Проверить, была ли вершина уже посещена */
    int isVisited(Vertex **res, int size, Vertex *vet) {
        // Искать узел обходом за O(n) времени
        for (int i = 0; i < size; i++) {
            if (res[i] == vet) {
                return 1;
            }
        }
        return 0;
    }

    /* Вспомогательная функция обхода в глубину */
    void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
        // Отметить посещенную вершину
        res[(*resSize)++] = vet;
        // Обойти все смежные вершины данной вершины
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // Пропустить уже посещенную вершину
            if (!isVisited(res, *resSize, node->vertex)) {
                // Рекурсивно обходить смежные вершины
                dfs(graph, res, resSize, node->vertex);
            }
            node = node->next;
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
        dfs(graph, res, resSize, startVet);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_dfs.kt"
    /* Вспомогательная функция обхода в глубину */
    fun dfs(
        graph: GraphAdjList,
        visited: MutableSet<Vertex?>,
        res: MutableList<Vertex?>,
        vet: Vertex?
    ) {
        res.add(vet)     // Отметить посещенную вершину
        visited.add(vet) // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue  // Пропустить уже посещенную вершину
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet)
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
        // Последовательность обхода вершин
        val res = mutableListOf<Vertex?>()
        // Хеш-множество для хранения уже посещенных вершин
        val visited = HashSet<Vertex?>()
        dfs(graph, visited, res, startVet)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="graph_dfs.rb"
    =begin
    File: graph_dfs.rb
    Created Time: 2024-04-25
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require 'set'
    require_relative './graph_adjacency_list'
    require_relative '../utils/vertex'

    # ## Вспомогательная функция обхода в глубину ###
    def dfs(graph, visited, res, vet)
      res << vet # Отметить посещенную вершину
      visited.add(vet) # Отметить эту вершину как посещенную
      # Обойти все смежные вершины данной вершины
      for adj_vet in graph.adj_list[vet]
        next if visited.include?(adj_vet) # Пропустить уже посещенную вершину
        # Рекурсивно обходить смежные вершины
        dfs(graph, visited, res, adj_vet)
      end
    end

    =begin
    File: graph_dfs.rb
    Created Time: 2024-04-25
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require 'set'
    require_relative './graph_adjacency_list'
    require_relative '../utils/vertex'

    # ## Вспомогательная функция обхода в глубину ###
    def dfs(graph, visited, res, vet)
      res << vet # Отметить посещенную вершину
      visited.add(vet) # Отметить эту вершину как посещенную
      # Обойти все смежные вершины данной вершины
      for adj_vet in graph.adj_list[vet]
        next if visited.include?(adj_vet) # Пропустить уже посещенную вершину
        # Рекурсивно обходить смежные вершины
        dfs(graph, visited, res, adj_vet)
      end
    end

    # ## Обход в глубину ###
    def graph_dfs(graph, start_vet)
      # Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
      # Последовательность обхода вершин
      res = []
      # Хеш-множество для хранения уже посещенных вершин
      visited = Set.new
      dfs(graph, visited, res, start_vet)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%27Vertex%27%5D%3A%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0Adef%20dfs%28graph%3A%20GraphAdjList%2C%20visited%3A%20set%5BVertex%5D%2C%20res%3A%20list%5BVertex%5D%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20res.append%28vet%29%0A%20%20%20%20visited.add%28vet%29%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20adjVet%29%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20start_vet%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20res%20%3D%20graph_dfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%27Vertex%27%5D%3A%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0Adef%20dfs%28graph%3A%20GraphAdjList%2C%20visited%3A%20set%5BVertex%5D%2C%20res%3A%20list%5BVertex%5D%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20res.append%28vet%29%0A%20%20%20%20visited.add%28vet%29%0A%20%20%20%20for%20adjVet%20in%20graph.adj_list%5Bvet%5D%3A%0A%20%20%20%20%20%20%20%20if%20adjVet%20in%20visited%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20adjVet%29%0A%0Adef%20graph_dfs%28graph%3A%20GraphAdjList%2C%20start_vet%3A%20Vertex%29%20-%3E%20list%5BVertex%5D%3A%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20visited%20%3D%20set%5BVertex%5D%28%29%0A%20%20%20%20dfs%28graph%2C%20visited%2C%20res%2C%20start_vet%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B0%2C%201%2C%202%2C%203%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B4%5D%5D%2C%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20res%20%3D%20graph_dfs%28graph%2C%20v%5B0%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=130&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Алгоритмический процесс обхода в глубину показан на рисунках ниже.

- **Прямая пунктирная линия обозначает нисходящее рекурсивное развертывание** , то есть запуск нового рекурсивного метода для посещения новой вершины.
- **Изогнутая пунктирная линия обозначает обратный возврат по рекурсии** , то есть данный рекурсивный метод завершился и управление вернулось туда, откуда он был вызван.

Чтобы лучше понять алгоритм, рекомендуется совместить рисунки ниже с кодом и мысленно проследить весь процесс DFS, включая моменты запуска и возврата каждого рекурсивного вызова.

=== "<1>"
    ![Шаги обхода графа в глубину](graph_traversal.assets/graph_dfs_step1.png){ class="animation-figure" }

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

<p align="center"> Рисунок 9-12 &nbsp; Шаги обхода графа в глубину </p>

!!! question "Является ли последовательность обхода в глубину единственной?"

    Как и в случае обхода в ширину, последовательность DFS тоже не является единственной. Для заданной вершины допустимо сначала углубиться в любое направление, то есть порядок смежных вершин может быть произвольным, и все такие варианты будут корректными обходами в глубину.
    
    Если взять в качестве примера обход дерева, то варианты "корень $\rightarrow$ лево $\rightarrow$ право", "лево $\rightarrow$ корень $\rightarrow$ право" и "лево $\rightarrow$ право $\rightarrow$ корень" соответствуют прямому, симметричному и обратному обходам соответственно. Они показывают три разных приоритета обхода, но все они относятся к обходу в глубину.

### 2. &nbsp; Анализ сложности

**Временная сложность**: все вершины будут посещены по $1$ разу, что требует $O(|V|)$ времени; все ребра будут посещены по $2$ раза, что требует $O(2|E|)$ времени; суммарно получается $O(|V| + |E|)$ .

**Пространственная сложность**: число вершин в списке `res` и хеш-наборе `visited` в худшем случае достигает $|V|$ , максимальная глубина рекурсии тоже равна $|V|$ , поэтому требуется $O(|V|)$ памяти.
