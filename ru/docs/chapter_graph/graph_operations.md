---
comments: true
---

# 9.2 &nbsp; Основные операции с графом

Основные операции с графом делятся на операции с рёбрами и операции с вершинами. Их реализация зависит от того, используется ли матрица смежности или список смежности.

## 9.2.1 &nbsp; Реализация на матрице смежности

На рисунке 9-7 показаны операции с неориентированным графом из $n$ вершин.

- **Добавление или удаление ребра**. Достаточно изменить соответствующие ячейки матрицы за время $O(1)$. Граф неориентированный, поэтому нужно обновить оба направления.
- **Добавление вершины**. В конец матрицы добавляют строку и столбец, заполненные значением $0$. Это занимает время $O(n)$.
- **Удаление вершины**. Из матрицы удаляют одну строку и один столбец. В худшем случае, когда удаляются первая строка и первый столбец, нужно сдвинуть $(n-1)^2$ элементов вверх и влево. Это занимает время $O(n^2)$.
- **Инициализация**. По $n$ входным вершинам создаём список `vertices` длины $n$ за время $O(n)$. Инициализация матрицы смежности `adjMat` размером $n \times n$ занимает время $O(n^2)$.

=== "<1>"
    ![Матрица смежности: инициализация, добавление и удаление рёбер и вершин](graph_operations.assets/adjacency_matrix_step1_initialization.svg){ class="animation-figure" }

=== "<2>"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.svg){ class="animation-figure" }

=== "<3>"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.svg){ class="animation-figure" }

=== "<4>"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.svg){ class="animation-figure" }

=== "<5>"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.svg){ class="animation-figure" }

<p align="center"> Рисунок 9-7 &nbsp; Матрица смежности: инициализация, добавление и удаление рёбер и вершин </p>

Так выглядит реализация графа на матрице смежности:

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """Неориентированный граф на матрице смежности"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """Конструктор"""
            # Список вершин: элементы — значения вершин, позиции — их индексы
            self.vertices: list[int] = []
            # Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
            self.adj_mat: list[list[int]] = []
            # Добавить вершину
            for val in vertices:
                self.add_vertex(val)
            # Добавить ребро
            # Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """Получить число вершин"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """Добавить вершину"""
            n = self.size()
            # Добавить значение новой вершины в список вершин
            self.vertices.append(val)
            # Добавить строку в матрицу смежности
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # Добавить столбец в матрицу смежности
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """Удалить вершину"""
            if index >= self.size():
                raise IndexError()
            # Удалить из списка вершин вершину с индексом index
            self.vertices.pop(index)
            # Удалить из матрицы смежности строку с индексом index
            self.adj_mat.pop(index)
            # Удалить из матрицы смежности столбец с индексом index
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """Добавить ребро"""
            # Параметры i и j — индексы элементов vertices
            # Проверить выход индексов за границы и их совпадение
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """Удалить ребро"""
            # Параметры i и j — индексы элементов vertices
            # Проверить выход индексов за границы и их совпадение
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            self.adj_mat[i][j] = 0
            self.adj_mat[j][i] = 0

        def print(self):
            """Вывести матрицу смежности"""
            print("Список вершин =", self.vertices)
            print("Матрица смежности =")
            print_matrix(self.adj_mat)
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
        vector<int> vertices;       // Список вершин: элементы — значения вершин, позиции — их индексы
        vector<vector<int>> adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

      public:
        /* Конструктор */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // Добавить вершину
            for (int val : vertices) {
                addVertex(val);
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for (const vector<int> &edge : edges) {
                addEdge(edge[0], edge[1]);
            }
        }

        /* Получить число вершин */
        int size() const {
            return vertices.size();
        }

        /* Добавить вершину */
        void addVertex(int val) {
            int n = size();
            // Добавить значение новой вершины в список вершин
            vertices.push_back(val);
            // Добавить строку в матрицу смежности
            adjMat.emplace_back(vector<int>(n, 0));
            // Добавить столбец в матрицу смежности
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* Удалить вершину */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("Вершина не существует");
            }
            // Удалить из списка вершин вершину с индексом index
            vertices.erase(vertices.begin() + index);
            // Удалить из матрицы смежности строку с индексом index
            adjMat.erase(adjMat.begin() + index);
            // Удалить из матрицы смежности столбец с индексом index
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        void addEdge(int i, int j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("Вершина не существует");
            }
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        void removeEdge(int i, int j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("Вершина не существует");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* Вывести матрицу смежности */
        void print() {
            cout << "Список вершин = ";
            printVector(vertices);
            cout << "Матрица смежности =" << endl;
            printVectorMatrix(adjMat);
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
        List<Integer> vertices; // Список вершин: элементы — значения вершин, позиции — их индексы
        List<List<Integer>> adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

        /* Конструктор */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // Добавить вершину
            for (int val : vertices) {
                addVertex(val);
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for (int[] e : edges) {
                addEdge(e[0], e[1]);
            }
        }

        /* Получить число вершин */
        public int size() {
            return vertices.size();
        }

        /* Добавить вершину */
        public void addVertex(int val) {
            int n = size();
            // Добавить значение новой вершины в список вершин
            vertices.add(val);
            // Добавить строку в матрицу смежности
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // Добавить столбец в матрицу смежности
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* Удалить вершину */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // Удалить из списка вершин вершину с индексом index
            vertices.remove(index);
            // Удалить из матрицы смежности строку с индексом index
            adjMat.remove(index);
            // Удалить из матрицы смежности столбец с индексом index
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        public void addEdge(int i, int j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        public void removeEdge(int i, int j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            adjMat.get(i).set(j, 0);
            adjMat.get(j).set(i, 0);
        }

        /* Вывести матрицу смежности */
        public void print() {
            System.out.print("Список вершин = ");
            System.out.println(vertices);
            System.out.println("Матрица смежности =");
            PrintUtil.printMatrix(adjMat);
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
        List<int> vertices;     // Список вершин: элементы — значения вершин, позиции — их индексы
        List<List<int>> adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

        /* Конструктор */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = [];
            this.adjMat = [];
            // Добавить вершину
            foreach (int val in vertices) {
                AddVertex(val);
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            foreach (int[] e in edges) {
                AddEdge(e[0], e[1]);
            }
        }

        /* Получить число вершин */
        int Size() {
            return vertices.Count;
        }

        /* Добавить вершину */
        public void AddVertex(int val) {
            int n = Size();
            // Добавить значение новой вершины в список вершин
            vertices.Add(val);
            // Добавить строку в матрицу смежности
            List<int> newRow = new(n);
            for (int j = 0; j < n; j++) {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // Добавить столбец в матрицу смежности
            foreach (List<int> row in adjMat) {
                row.Add(0);
            }
        }

        /* Удалить вершину */
        public void RemoveVertex(int index) {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // Удалить из списка вершин вершину с индексом index
            vertices.RemoveAt(index);
            // Удалить из матрицы смежности строку с индексом index
            adjMat.RemoveAt(index);
            // Удалить из матрицы смежности столбец с индексом index
            foreach (List<int> row in adjMat) {
                row.RemoveAt(index);
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        public void AddEdge(int i, int j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        public void RemoveEdge(int i, int j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* Вывести матрицу смежности */
        public void Print() {
            Console.Write("Список вершин = ");
            PrintUtil.PrintList(vertices);
            Console.WriteLine("Матрица смежности =");
            PrintUtil.PrintMatrix(adjMat);
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    /* Неориентированный граф на матрице смежности */
    type graphAdjMat struct {
        // Список вершин: элементы — значения вершин, позиции — их индексы
        vertices []int
        // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
        adjMat [][]int
    }

    /* Конструктор */
    func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
        // Добавить вершину
        n := len(vertices)
        adjMat := make([][]int, n)
        for i := range adjMat {
            adjMat[i] = make([]int, n)
        }
        // Инициализировать граф
        g := &graphAdjMat{
            vertices: vertices,
            adjMat:   adjMat,
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for i := range edges {
            g.addEdge(edges[i][0], edges[i][1])
        }
        return g
    }

    /* Получить число вершин */
    func (g *graphAdjMat) size() int {
        return len(g.vertices)
    }

    /* Добавить вершину */
    func (g *graphAdjMat) addVertex(val int) {
        n := g.size()
        // Добавить значение новой вершины в список вершин
        g.vertices = append(g.vertices, val)
        // Добавить строку в матрицу смежности
        newRow := make([]int, n)
        g.adjMat = append(g.adjMat, newRow)
        // Добавить столбец в матрицу смежности
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i], 0)
        }
    }

    /* Удалить вершину */
    func (g *graphAdjMat) removeVertex(index int) {
        if index >= g.size() {
            return
        }
        // Удалить из списка вершин вершину с индексом index
        g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
        // Удалить из матрицы смежности строку с индексом index
        g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
        // Удалить из матрицы смежности столбец с индексом index
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    func (g *graphAdjMat) addEdge(i, j int) {
        // Проверить выход индексов за границы и их совпадение
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        g.adjMat[i][j] = 1
        g.adjMat[j][i] = 1
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    func (g *graphAdjMat) removeEdge(i, j int) {
        // Проверить выход индексов за границы и их совпадение
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        g.adjMat[i][j] = 0
        g.adjMat[j][i] = 0
    }

    /* Вывести матрицу смежности */
    func (g *graphAdjMat) print() {
        fmt.Printf("\tСписок вершин = %v\n", g.vertices)
        fmt.Printf("\tМатрица смежности = \n")
        for i := range g.adjMat {
            fmt.Printf("\t\t\t%v\n", g.adjMat[i])
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
        private var vertices: [Int] // Список вершин: элементы — значения вершин, позиции — их индексы
        private var adjMat: [[Int]] // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

        /* Конструктор */
        init(vertices: [Int], edges: [[Int]]) {
            self.vertices = []
            adjMat = []
            // Добавить вершину
            for val in vertices {
                addVertex(val: val)
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for e in edges {
                addEdge(i: e[0], j: e[1])
            }
        }

        /* Получить число вершин */
        func size() -> Int {
            vertices.count
        }

        /* Добавить вершину */
        func addVertex(val: Int) {
            let n = size()
            // Добавить значение новой вершины в список вершин
            vertices.append(val)
            // Добавить строку в матрицу смежности
            let newRow = Array(repeating: 0, count: n)
            adjMat.append(newRow)
            // Добавить столбец в матрицу смежности
            for i in adjMat.indices {
                adjMat[i].append(0)
            }
        }

        /* Удалить вершину */
        func removeVertex(index: Int) {
            if index >= size() {
                fatalError("Индекс вне диапазона")
            }
            // Удалить из списка вершин вершину с индексом index
            vertices.remove(at: index)
            // Удалить из матрицы смежности строку с индексом index
            adjMat.remove(at: index)
            // Удалить из матрицы смежности столбец с индексом index
            for i in adjMat.indices {
                adjMat[i].remove(at: index)
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        func addEdge(i: Int, j: Int) {
            // Проверить выход индексов за границы и их совпадение
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("Индекс вне диапазона")
            }
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        func removeEdge(i: Int, j: Int) {
            // Проверить выход индексов за границы и их совпадение
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("Индекс вне диапазона")
            }
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* Вывести матрицу смежности */
        func print() {
            Swift.print("Список вершин = ", terminator: "")
            Swift.print(vertices)
            Swift.print("Матрица смежности =")
            PrintUtil.printMatrix(matrix: adjMat)
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
        vertices; // Список вершин: элементы — значения вершин, позиции — их индексы
        adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

        /* Конструктор */
        constructor(vertices, edges) {
            this.vertices = [];
            this.adjMat = [];
            // Добавить вершину
            for (const val of vertices) {
                this.addVertex(val);
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* Получить число вершин */
        size() {
            return this.vertices.length;
        }

        /* Добавить вершину */
        addVertex(val) {
            const n = this.size();
            // Добавить значение новой вершины в список вершин
            this.vertices.push(val);
            // Добавить строку в матрицу смежности
            const newRow = [];
            for (let j = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // Добавить столбец в матрицу смежности
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* Удалить вершину */
        removeVertex(index) {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // Удалить из списка вершин вершину с индексом index
            this.vertices.splice(index, 1);

            // Удалить из матрицы смежности строку с индексом index
            this.adjMat.splice(index, 1);
            // Удалить из матрицы смежности столбец с индексом index
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        addEdge(i, j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        removeEdge(i, j) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* Вывести матрицу смежности */
        print() {
            console.log('Список вершин = ', this.vertices);
            console.log('Матрица смежности =', this.adjMat);
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
        vertices: number[]; // Список вершин: элементы — значения вершин, позиции — их индексы
        adjMat: number[][]; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

        /* Конструктор */
        constructor(vertices: number[], edges: number[][]) {
            this.vertices = [];
            this.adjMat = [];
            // Добавить вершину
            for (const val of vertices) {
                this.addVertex(val);
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* Получить число вершин */
        size(): number {
            return this.vertices.length;
        }

        /* Добавить вершину */
        addVertex(val: number): void {
            const n: number = this.size();
            // Добавить значение новой вершины в список вершин
            this.vertices.push(val);
            // Добавить строку в матрицу смежности
            const newRow: number[] = [];
            for (let j: number = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // Добавить столбец в матрицу смежности
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* Удалить вершину */
        removeVertex(index: number): void {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // Удалить из списка вершин вершину с индексом index
            this.vertices.splice(index, 1);

            // Удалить из матрицы смежности строку с индексом index
            this.adjMat.splice(index, 1);
            // Удалить из матрицы смежности столбец с индексом index
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        addEdge(i: number, j: number): void {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        removeEdge(i: number, j: number): void {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* Вывести матрицу смежности */
        print(): void {
            console.log('Список вершин = ', this.vertices);
            console.log('Матрица смежности =', this.adjMat);
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat {
      List<int> vertices = []; // Элементы хранят значения вершин, а их позиции задают индексы вершин
      List<List<int>> adjMat = []; //Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

      /* Конструктор */
      GraphAdjMat(List<int> vertices, List<List<int>> edges) {
        this.vertices = [];
        this.adjMat = [];
        // Добавить вершину
        for (int val in vertices) {
          addVertex(val);
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for (List<int> e in edges) {
          addEdge(e[0], e[1]);
        }
      }

      /* Получить число вершин */
      int size() {
        return vertices.length;
      }

      /* Добавить вершину */
      void addVertex(int val) {
        int n = size();
        // Добавить значение новой вершины в список вершин
        vertices.add(val);
        // Добавить строку в матрицу смежности
        List<int> newRow = List.filled(n, 0, growable: true);
        adjMat.add(newRow);
        // Добавить столбец в матрицу смежности
        for (List<int> row in adjMat) {
          row.add(0);
        }
      }

      /* Удалить вершину */
      void removeVertex(int index) {
        if (index >= size()) {
          throw IndexError;
        }
        // Удалить из списка вершин вершину с индексом index
        vertices.removeAt(index);
        // Удалить из матрицы смежности строку с индексом index
        adjMat.removeAt(index);
        // Удалить из матрицы смежности столбец с индексом index
        for (List<int> row in adjMat) {
          row.removeAt(index);
        }
      }

      /* Добавить ребро */
      // Параметры i и j — индексы элементов vertices
      void addEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
      }

      /* Удалить ребро */
      // Параметры i и j — индексы элементов vertices
      void removeEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
      }

      /* Вывести матрицу смежности */
      void printAdjMat() {
        print("Список вершин = $vertices");
        print("Матрица смежности = ");
        printMatrix(adjMat);
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    /* Тип неориентированного графа на матрице смежности */
    pub struct GraphAdjMat {
        // Список вершин: элементы — значения вершин, позиции — их индексы
        pub vertices: Vec<i32>,
        // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
        pub adj_mat: Vec<Vec<i32>>,
    }

    impl GraphAdjMat {
        /* Конструктор */
        pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
            let mut graph = GraphAdjMat {
                vertices: vec![],
                adj_mat: vec![],
            };
            // Добавить вершину
            for val in vertices {
                graph.add_vertex(val);
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for edge in edges {
                graph.add_edge(edge[0], edge[1])
            }

            graph
        }

        /* Получить число вершин */
        pub fn size(&self) -> usize {
            self.vertices.len()
        }

        /* Добавить вершину */
        pub fn add_vertex(&mut self, val: i32) {
            let n = self.size();
            // Добавить значение новой вершины в список вершин
            self.vertices.push(val);
            // Добавить строку в матрицу смежности
            self.adj_mat.push(vec![0; n]);
            // Добавить столбец в матрицу смежности
            for row in self.adj_mat.iter_mut() {
                row.push(0);
            }
        }

        /* Удалить вершину */
        pub fn remove_vertex(&mut self, index: usize) {
            if index >= self.size() {
                panic!("index error")
            }
            // Удалить из списка вершин вершину с индексом index
            self.vertices.remove(index);
            // Удалить из матрицы смежности строку с индексом index
            self.adj_mat.remove(index);
            // Удалить из матрицы смежности столбец с индексом index
            for row in self.adj_mat.iter_mut() {
                row.remove(index);
            }
        }

        /* Добавить ребро */
        pub fn add_edge(&mut self, i: usize, j: usize) {
            // Параметры i и j — индексы элементов vertices
            // Проверить выход индексов за границы и их совпадение
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            self.adj_mat[i][j] = 1;
            self.adj_mat[j][i] = 1;
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        pub fn remove_edge(&mut self, i: usize, j: usize) {
            // Параметры i и j — индексы элементов vertices
            // Проверить выход индексов за границы и их совпадение
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            self.adj_mat[i][j] = 0;
            self.adj_mat[j][i] = 0;
        }

        /* Вывести матрицу смежности */
        pub fn print(&self) {
            println!("Список вершин = {:?}", self.vertices);
            println!("Матрица смежности =");
            println!("[");
            for row in &self.adj_mat {
                println!("  {:?},", row);
            }
            println!("]")
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_matrix.c"
    /* Структура неориентированного графа с матрицей смежности */
    typedef struct {
        int vertices[MAX_SIZE];
        int adjMat[MAX_SIZE][MAX_SIZE];
        int size;
    } GraphAdjMat;

    /* Конструктор */
    GraphAdjMat *newGraphAdjMat() {
        GraphAdjMat *graph = (GraphAdjMat *)malloc(sizeof(GraphAdjMat));
        graph->size = 0;
        for (int i = 0; i < MAX_SIZE; i++) {
            for (int j = 0; j < MAX_SIZE; j++) {
                graph->adjMat[i][j] = 0;
            }
        }
        return graph;
    }

    /* Деструктор */
    void delGraphAdjMat(GraphAdjMat *graph) {
        free(graph);
    }

    /* Добавить вершину */
    void addVertex(GraphAdjMat *graph, int val) {
        if (graph->size == MAX_SIZE) {
            fprintf(stderr, "Достигнуто максимальное число вершин графа\n");
            return;
        }
        // Добавить n-ю вершину и заполнить нулями n-ю строку и n-й столбец
        int n = graph->size;
        graph->vertices[n] = val;
        for (int i = 0; i <= n; i++) {
            graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
        }
        graph->size++;
    }

    /* Удалить вершину */
    void removeVertex(GraphAdjMat *graph, int index) {
        if (index < 0 || index >= graph->size) {
            fprintf(stderr, "Индекс вершины вне диапазона\n");
            return;
        }
        // Удалить из списка вершин вершину с индексом index
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1];
        }
        // Удалить из матрицы смежности строку с индексом index
        for (int i = index; i < graph->size - 1; i++) {
            for (int j = 0; j < graph->size; j++) {
                graph->adjMat[i][j] = graph->adjMat[i + 1][j];
            }
        }
        // Удалить из матрицы смежности столбец с индексом index
        for (int i = 0; i < graph->size; i++) {
            for (int j = index; j < graph->size - 1; j++) {
                graph->adjMat[i][j] = graph->adjMat[i][j + 1];
            }
        }
        graph->size--;
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    void addEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "Индексы концов ребра вне диапазона или совпадают\n");
            return;
        }
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "Индексы концов ребра вне диапазона или совпадают\n");
            return;
        }
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    void printGraphAdjMat(GraphAdjMat *graph) {
        printf("Список вершин = ");
        printArray(graph->vertices, graph->size);
        printf("Матрица смежности =\n");
        for (int i = 0; i < graph->size; i++) {
            printArray(graph->adjMat[i], graph->size);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_matrix.kt"
    /* Неориентированный граф на матрице смежности */
    class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
        val vertices = mutableListOf<Int>() // Список вершин: элементы — значения вершин, позиции — их индексы
        val adjMat = mutableListOf<MutableList<Int>>() // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

        /* Конструктор */
        init {
            // Добавить вершину
            for (vertex in vertices) {
                addVertex(vertex)
            }
            // Добавить ребро
            // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
            for (edge in edges) {
                addEdge(edge[0], edge[1])
            }
        }

        /* Получить число вершин */
        fun size(): Int {
            return vertices.size
        }

        /* Добавить вершину */
        fun addVertex(_val: Int) {
            val n = size()
            // Добавить значение новой вершины в список вершин
            vertices.add(_val)
            // Добавить строку в матрицу смежности
            val newRow = mutableListOf<Int>()
            for (j in 0..<n) {
                newRow.add(0)
            }
            adjMat.add(newRow)
            // Добавить столбец в матрицу смежности
            for (row in adjMat) {
                row.add(0)
            }
        }

        /* Удалить вершину */
        fun removeVertex(index: Int) {
            if (index >= size())
                throw IndexOutOfBoundsException()
            // Удалить из списка вершин вершину с индексом index
            vertices.removeAt(index)
            // Удалить из матрицы смежности строку с индексом index
            adjMat.removeAt(index)
            // Удалить из матрицы смежности столбец с индексом index
            for (row in adjMat) {
                row.removeAt(index)
            }
        }

        /* Добавить ребро */
        // Параметры i и j — индексы элементов vertices
        fun addEdge(i: Int, j: Int) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* Удалить ребро */
        // Параметры i и j — индексы элементов vertices
        fun removeEdge(i: Int, j: Int) {
            // Проверить выход индексов за границы и их совпадение
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* Вывести матрицу смежности */
        fun print() {
            print("Список вершин = ")
            println(vertices)
            println("Матрица смежности =")
            printMatrix(adjMat)
        }
    }
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_matrix.rb"
    ### Неориентированный граф на матрице смежности ###
    class GraphAdjMat
      def initialize(vertices, edges)
        ### Конструктор ###
        # Список вершин: элементы — значения вершин, позиции — их индексы
        @vertices = []
        # Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
        @adj_mat = []
        # Добавить вершину
        vertices.each { |val| add_vertex(val) }
        # Добавить ребро
        # Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        edges.each { |e| add_edge(e[0], e[1]) }
      end

      ### Получить число вершин ###
      def size
        @vertices.length
      end

      ### Добавить вершину ###
      def add_vertex(val)
        n = size
        # Добавить значение новой вершины в список вершин
        @vertices << val
        # Добавить строку в матрицу смежности
        new_row = Array.new(n, 0)
        @adj_mat << new_row
        # Добавить столбец в матрицу смежности
        @adj_mat.each { |row| row << 0 }
      end

      ### Удалить вершину ###
      def remove_vertex(index)
        raise IndexError if index >= size

        # Удалить из списка вершин вершину с индексом index
        @vertices.delete_at(index)
        # Удалить из матрицы смежности строку с индексом index
        @adj_mat.delete_at(index)
        # Удалить из матрицы смежности столбец с индексом index
        @adj_mat.each { |row| row.delete_at(index) }
      end

      ### Добавить ребро ###
      def add_edge(i, j)
        # Параметры i и j — индексы элементов vertices
        # Проверить выход индексов за границы и их совпадение
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        # Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        @adj_mat[i][j] = 1
        @adj_mat[j][i] = 1
      end

      ### Удалить ребро ###
      def remove_edge(i, j)
        # Параметры i и j — индексы элементов vertices
        # Проверить выход индексов за границы и их совпадение
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        @adj_mat[i][j] = 0
        @adj_mat[j][i] = 0
      end

      ### Вывести матрицу смежности ###
      def __print__
        puts "Список вершин = #{@vertices}"
        puts 'Матрица смежности ='
        print_matrix(@adj_mat)
      end
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%22%22%22%D0%9D%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%3A%20%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0%20%D1%81%D0%BC%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%22%22%22%0A%0A%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20%20for%20val%20in%20vertices%3A%0A%20%20%20self.add_vertex%28val%29%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20%20for%20e%20in%20edges%3A%0A%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%22%22%22%0A%20%20return%20len%28self.vertices%29%0A%0A%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20n%20%3D%20self.size%28%29%0A%20%20%23%20%D0%92%D0%BD%D0%B5%D1%81%D1%82%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%20%D0%B2%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20self.vertices.append%28val%29%0A%20%20%23%20%D0%9D%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B0%0A%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20self.adj_mat.append%28new_row%29%0A%20%20%23%20%D0%9D%D0%BE%D0%B2%D1%8B%D0%B9%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D0%B5%D1%86%0A%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20row.append%280%29%0A%0A%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20raise%20IndexError%28%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%0A%20%20self.vertices.pop%28index%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D1%83%20index%0A%20%20self.adj_mat.pop%28index%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D0%B5%D1%86%20index%0A%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20row.pop%28index%29%0A%0A%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20%23%20%D0%92%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%20%D0%B8%D0%BB%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D1%8B%3F%0A%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20raise%20IndexError%28%29%0A%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20%23%20%D0%92%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%20%D0%B8%D0%BB%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D1%8B%3F%0A%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20raise%20IndexError%28%29%0A%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BD%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%0A%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20%23%20%D0%92%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%201,%202%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%200,%202%0A%20graph.add_edge%280,%202%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20%23%20%D0%92%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%201,%203%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%200,%201%0A%20graph.remove_edge%280,%201%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20graph.add_vertex%286%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20%23%20%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%203%3A%201%0A%20graph.remove_vertex%281%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%22%22%22%D0%9D%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%3A%20%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0%20%D1%81%D0%BC%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%22%22%22%0A%0A%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20%20for%20val%20in%20vertices%3A%0A%20%20%20self.add_vertex%28val%29%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20%20for%20e%20in%20edges%3A%0A%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%22%22%22%0A%20%20return%20len%28self.vertices%29%0A%0A%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20n%20%3D%20self.size%28%29%0A%20%20%23%20%D0%92%D0%BD%D0%B5%D1%81%D1%82%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%20%D0%B2%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20self.vertices.append%28val%29%0A%20%20%23%20%D0%9D%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B0%0A%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20self.adj_mat.append%28new_row%29%0A%20%20%23%20%D0%9D%D0%BE%D0%B2%D1%8B%D0%B9%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D0%B5%D1%86%0A%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20row.append%280%29%0A%0A%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20raise%20IndexError%28%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%0A%20%20self.vertices.pop%28index%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D1%83%20index%0A%20%20self.adj_mat.pop%28index%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D0%B5%D1%86%20index%0A%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20row.pop%28index%29%0A%0A%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20%23%20%D0%92%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%20%D0%B8%D0%BB%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D1%8B%3F%0A%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20raise%20IndexError%28%29%0A%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20%23%20%D0%92%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%20%D0%B8%D0%BB%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D1%8B%3F%0A%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20raise%20IndexError%28%29%0A%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BD%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%0A%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20%23%20%D0%92%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%201,%202%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%200,%202%0A%20graph.add_edge%280,%202%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20%23%20%D0%92%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%201,%203%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%200,%201%0A%20graph.remove_edge%280,%201%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20graph.add_vertex%286%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20%23%20%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%203%3A%201%0A%20graph.remove_vertex%281%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 9.2.2 &nbsp; Реализация на списке смежности

Пусть в неориентированном графе $n$ вершин и $m$ рёбер. На рисунке 9-8 показано, как выполнять операции с таким графом.

- **Добавление ребра**. Запись о ребре добавляется в конец списка вершины за время $O(1)$. В неориентированном графе нужно добавить записи для обоих направлений.
- **Удаление ребра**. На поиск и удаление заданного ребра в списке вершины уходит время $O(m)$. В неориентированном графе нужно удалить записи для обоих направлений.
- **Добавление вершины**. В список смежности добавляют связный список, головным узлом которого служит новая вершина. Это занимает время $O(1)$.
- **Удаление вершины**. Нужно обойти весь список смежности и удалить все рёбра, инцидентные заданной вершине. Это занимает время $O(n + m)$.
- **Инициализация**. В списке смежности создают $n$ вершин и $2m$ записей о рёбрах за время $O(n + m)$.

=== "<1>"
    ![Список смежности: инициализация, добавление и удаление рёбер и вершин](graph_operations.assets/adjacency_list_step1_initialization.svg){ class="animation-figure" }

=== "<2>"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.svg){ class="animation-figure" }

=== "<3>"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.svg){ class="animation-figure" }

=== "<4>"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.svg){ class="animation-figure" }

=== "<5>"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.svg){ class="animation-figure" }

<p align="center"> Рисунок 9-8 &nbsp; Список смежности: инициализация, добавление и удаление рёбер и вершин </p>

Ниже приведён код для списка смежности. От схемы выше он отличается в следующих деталях.

- Чтобы упростить код и облегчить добавление и удаление вершин, вместо связных списков используем списки на основе динамических массивов.
- Список смежности храним в хеш-таблице: `key` — объект вершины, `value` — список её соседей (на схеме — связный список).

Для представления вершин в списке смежности используется класс `Vertex`. Допустим, что, как в матрице смежности, вершины различаются по индексам в списке. Тогда при удалении вершины с индексом $i$ пришлось бы обойти весь список смежности и уменьшить все индексы больше $i$ на $1$. Это неэффективно. Если же каждая вершина — отдельный объект `Vertex`, после удаления одной вершины менять остальные не нужно.

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """Неориентированный граф на списках смежности"""

        def __init__(self, edges: list[list[Vertex]]):
            """Конструктор"""
            # Список смежности: ключ — вершина, значение — все её соседи
            self.adj_list = dict[Vertex, list[Vertex]]()
            # Добавить все вершины и рёбра
            for edge in edges:
                self.add_vertex(edge[0])
                self.add_vertex(edge[1])
                self.add_edge(edge[0], edge[1])

        def size(self) -> int:
            """Получить число вершин"""
            return len(self.adj_list)

        def add_edge(self, vet1: Vertex, vet2: Vertex):
            """Добавить ребро"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # Добавить ребро vet1 — vet2
            self.adj_list[vet1].append(vet2)
            self.adj_list[vet2].append(vet1)

        def remove_edge(self, vet1: Vertex, vet2: Vertex):
            """Удалить ребро"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # Удалить ребро vet1 — vet2
            self.adj_list[vet1].remove(vet2)
            self.adj_list[vet2].remove(vet1)

        def add_vertex(self, vet: Vertex):
            """Добавить вершину"""
            if vet in self.adj_list:
                return
            # Добавить новый связный список в список смежности
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """Удалить вершину"""
            if vet not in self.adj_list:
                raise ValueError()
            # Удалить из списка смежности список вершины vet
            self.adj_list.pop(vet)
            # Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for vertex in self.adj_list:
                if vet in self.adj_list[vertex]:
                    self.adj_list[vertex].remove(vet)

        def print(self):
            """Вывести список смежности"""
            print("Список смежности =")
            for vertex in self.adj_list:
                tmp = [v.val for v in self.adj_list[vertex]]
                print(f"{vertex.val}: {tmp},")
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
      public:
        // Список смежности: ключ — вершина, значение — все её соседи
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* Удалить указанный узел из vector */
        void remove(vector<Vertex *> &vec, Vertex *vet) {
            for (int i = 0; i < vec.size(); i++) {
                if (vec[i] == vet) {
                    vec.erase(vec.begin() + i);
                    break;
                }
            }
        }

        /* Конструктор */
        GraphAdjList(const vector<vector<Vertex *>> &edges) {
            // Добавить все вершины и рёбра
            for (const vector<Vertex *> &edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* Получить число вершин */
        int size() {
            return adjList.size();
        }

        /* Добавить ребро */
        void addEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("Вершина отсутствует");
            // Добавить ребро vet1 — vet2
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* Удалить ребро */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("Вершина отсутствует");
            // Удалить ребро vet1 — vet2
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* Добавить вершину */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // Добавить новый связный список в список смежности
            adjList[vet] = vector<Vertex *>();
        }

        /* Удалить вершину */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("Вершина отсутствует");
            // Удалить из списка смежности список вершины vet
            adjList.erase(vet);
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* Вывести список смежности */
        void print() {
            cout << "Список смежности =" << endl;
            for (auto &adj : adjList) {
                const auto &key = adj.first;
                const auto &vec = adj.second;
                cout << key->val << ": ";
                printVector(vetsToVals(vec));
            }
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_list.java"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
        // Список смежности: ключ — вершина, значение — все её соседи
        Map<Vertex, List<Vertex>> adjList;

        /* Конструктор */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new HashMap<>();
            // Добавить все вершины и рёбра
            for (Vertex[] edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* Получить число вершин */
        public int size() {
            return adjList.size();
        }

        /* Добавить ребро */
        public void addEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // Добавить ребро vet1 — vet2
            adjList.get(vet1).add(vet2);
            adjList.get(vet2).add(vet1);
        }

        /* Удалить ребро */
        public void removeEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // Удалить ребро vet1 — vet2
            adjList.get(vet1).remove(vet2);
            adjList.get(vet2).remove(vet1);
        }

        /* Добавить вершину */
        public void addVertex(Vertex vet) {
            if (adjList.containsKey(vet))
                return;
            // Добавить новый связный список в список смежности
            adjList.put(vet, new ArrayList<>());
        }

        /* Удалить вершину */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // Удалить из списка смежности список вершины vet
            adjList.remove(vet);
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for (List<Vertex> list : adjList.values()) {
                list.remove(vet);
            }
        }

        /* Вывести список смежности */
        public void print() {
            System.out.println("Список смежности =");
            for (Map.Entry<Vertex, List<Vertex>> pair : adjList.entrySet()) {
                List<Integer> tmp = new ArrayList<>();
                for (Vertex vertex : pair.getValue())
                    tmp.add(vertex.val);
                System.out.println(pair.getKey().val + ": " + tmp + ",");
            }
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_list.cs"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
        // Список смежности: ключ — вершина, значение — все её соседи
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* Конструктор */
        public GraphAdjList(Vertex[][] edges) {
            adjList = [];
            // Добавить все вершины и рёбра
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* Получить число вершин */
        int Size() {
            return adjList.Count;
        }

        /* Добавить ребро */
        public void AddEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // Добавить ребро vet1 — vet2
            adjList[vet1].Add(vet2);
            adjList[vet2].Add(vet1);
        }

        /* Удалить ребро */
        public void RemoveEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // Удалить ребро vet1 — vet2
            adjList[vet1].Remove(vet2);
            adjList[vet2].Remove(vet1);
        }

        /* Добавить вершину */
        public void AddVertex(Vertex vet) {
            if (adjList.ContainsKey(vet))
                return;
            // Добавить новый связный список в список смежности
            adjList.Add(vet, []);
        }

        /* Удалить вершину */
        public void RemoveVertex(Vertex vet) {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // Удалить из списка смежности список вершины vet
            adjList.Remove(vet);
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            foreach (List<Vertex> list in adjList.Values) {
                list.Remove(vet);
            }
        }

        /* Вывести список смежности */
        public void Print() {
            Console.WriteLine("Список смежности =");
            foreach (KeyValuePair<Vertex, List<Vertex>> pair in adjList) {
                List<int> tmp = [];
                foreach (Vertex vertex in pair.Value)
                    tmp.Add(vertex.val);
                Console.WriteLine(pair.Key.val + ": [" + string.Join(", ", tmp) + "],");
            }
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_list.go"
    /* Неориентированный граф на списках смежности */
    type graphAdjList struct {
        // Список смежности: ключ — вершина, значение — все её соседи
        adjList map[Vertex][]Vertex
    }

    /* Конструктор */
    func newGraphAdjList(edges [][]Vertex) *graphAdjList {
        g := &graphAdjList{
            adjList: make(map[Vertex][]Vertex),
        }
        // Добавить все вершины и рёбра
        for _, edge := range edges {
            g.addVertex(edge[0])
            g.addVertex(edge[1])
            g.addEdge(edge[0], edge[1])
        }
        return g
    }

    /* Получить число вершин */
    func (g *graphAdjList) size() int {
        return len(g.adjList)
    }

    /* Добавить ребро */
    func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // Добавить ребро vet1 — vet2, используя анонимную структуру struct{}
        g.adjList[vet1] = append(g.adjList[vet1], vet2)
        g.adjList[vet2] = append(g.adjList[vet2], vet1)
    }

    /* Удалить ребро */
    func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // Удалить ребро vet1 — vet2
        g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
        g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
    }

    /* Добавить вершину */
    func (g *graphAdjList) addVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if ok {
            return
        }
        // Добавить новый связный список в список смежности
        g.adjList[vet] = make([]Vertex, 0)
    }

    /* Удалить вершину */
    func (g *graphAdjList) removeVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if !ok {
            panic("error")
        }
        // Удалить из списка смежности список вершины vet
        delete(g.adjList, vet)
        // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
        for v, list := range g.adjList {
            g.adjList[v] = DeleteSliceElms(list, vet)
        }
    }

    /* Вывести список смежности */
    func (g *graphAdjList) print() {
        var builder strings.Builder
        fmt.Printf("Список смежности = \n")
        for k, v := range g.adjList {
            builder.WriteString("\t\t" + strconv.Itoa(k.Val) + ": ")
            for _, vet := range v {
                builder.WriteString(strconv.Itoa(vet.Val) + " ")
            }
            fmt.Println(builder.String())
            builder.Reset()
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_list.swift"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
        // Список смежности: ключ — вершина, значение — все её соседи
        public private(set) var adjList: [Vertex: [Vertex]]

        /* Конструктор */
        public init(edges: [[Vertex]]) {
            adjList = [:]
            // Добавить все вершины и рёбра
            for edge in edges {
                addVertex(vet: edge[0])
                addVertex(vet: edge[1])
                addEdge(vet1: edge[0], vet2: edge[1])
            }
        }

        /* Получить число вершин */
        public func size() -> Int {
            adjList.count
        }

        /* Добавить ребро */
        public func addEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("Недопустимые параметры")
            }
            // Добавить ребро vet1 — vet2
            adjList[vet1]?.append(vet2)
            adjList[vet2]?.append(vet1)
        }

        /* Удалить ребро */
        public func removeEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("Недопустимые параметры")
            }
            // Удалить ребро vet1 — vet2
            adjList[vet1]?.removeAll { $0 == vet2 }
            adjList[vet2]?.removeAll { $0 == vet1 }
        }

        /* Добавить вершину */
        public func addVertex(vet: Vertex) {
            if adjList[vet] != nil {
                return
            }
            // Добавить новый связный список в список смежности
            adjList[vet] = []
        }

        /* Удалить вершину */
        public func removeVertex(vet: Vertex) {
            if adjList[vet] == nil {
                fatalError("Недопустимые параметры")
            }
            // Удалить из списка смежности список вершины vet
            adjList.removeValue(forKey: vet)
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for key in adjList.keys {
                adjList[key]?.removeAll { $0 == vet }
            }
        }

        /* Вывести список смежности */
        public func print() {
            Swift.print("Список смежности =")
            for (vertex, list) in adjList {
                let list = list.map { $0.val }
                Swift.print("\(vertex.val): \(list),")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
        // Список смежности: ключ — вершина, значение — все её соседи
        adjList;

        /* Конструктор */
        constructor(edges) {
            this.adjList = new Map();
            // Добавить все вершины и рёбра
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* Получить число вершин */
        size() {
            return this.adjList.size;
        }

        /* Добавить ребро */
        addEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // Добавить ребро vet1 — vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* Удалить ребро */
        removeEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // Удалить ребро vet1 — vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* Добавить вершину */
        addVertex(vet) {
            if (this.adjList.has(vet)) return;
            // Добавить новый связный список в список смежности
            this.adjList.set(vet, []);
        }

        /* Удалить вершину */
        removeVertex(vet) {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // Удалить из списка смежности список вершины vet
            this.adjList.delete(vet);
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for (const set of this.adjList.values()) {
                const index = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* Вывести список смежности */
        print() {
            console.log('Список смежности =');
            for (const [key, value] of this.adjList) {
                const tmp = [];
                for (const vertex of value) {
                    tmp.push(vertex.val);
                }
                console.log(key.val + ': ' + tmp.join());
            }
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_list.ts"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
        // Список смежности: ключ — вершина, значение — все её соседи
        adjList: Map<Vertex, Vertex[]>;

        /* Конструктор */
        constructor(edges: Vertex[][]) {
            this.adjList = new Map();
            // Добавить все вершины и рёбра
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* Получить число вершин */
        size(): number {
            return this.adjList.size;
        }

        /* Добавить ребро */
        addEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // Добавить ребро vet1 — vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* Удалить ребро */
        removeEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // Удалить ребро vet1 — vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* Добавить вершину */
        addVertex(vet: Vertex): void {
            if (this.adjList.has(vet)) return;
            // Добавить новый связный список в список смежности
            this.adjList.set(vet, []);
        }

        /* Удалить вершину */
        removeVertex(vet: Vertex): void {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // Удалить из списка смежности список вершины vet
            this.adjList.delete(vet);
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for (const set of this.adjList.values()) {
                const index: number = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* Вывести список смежности */
        print(): void {
            console.log('Список смежности =');
            for (const [key, value] of this.adjList.entries()) {
                const tmp = [];
                for (const vertex of value) {
                    tmp.push(vertex.val);
                }
                console.log(key.val + ': ' + tmp.join());
            }
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_list.dart"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList {
      // Список смежности: ключ — вершина, значение — все её соседи
      Map<Vertex, List<Vertex>> adjList = {};

      /* Конструктор */
      GraphAdjList(List<List<Vertex>> edges) {
        for (List<Vertex> edge in edges) {
          addVertex(edge[0]);
          addVertex(edge[1]);
          addEdge(edge[0], edge[1]);
        }
      }

      /* Получить число вершин */
      int size() {
        return adjList.length;
      }

      /* Добавить ребро */
      void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // Добавить ребро vet1 — vet2
        adjList[vet1]!.add(vet2);
        adjList[vet2]!.add(vet1);
      }

      /* Удалить ребро */
      void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // Удалить ребро vet1 — vet2
        adjList[vet1]!.remove(vet2);
        adjList[vet2]!.remove(vet1);
      }

      /* Добавить вершину */
      void addVertex(Vertex vet) {
        if (adjList.containsKey(vet)) return;
        // Добавить новый связный список в список смежности
        adjList[vet] = [];
      }

      /* Удалить вершину */
      void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet)) {
          throw ArgumentError;
        }
        // Удалить из списка смежности список вершины vet
        adjList.remove(vet);
        // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
        adjList.forEach((key, value) {
          value.remove(vet);
        });
      }

      /* Вывести список смежности */
      void printAdjList() {
        print("Список смежности =");
        adjList.forEach((key, value) {
          List<int> tmp = [];
          for (Vertex vertex in value) {
            tmp.add(vertex.val);
          }
          print("${key.val}: $tmp,");
        });
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_list.rs"
    /* Тип неориентированного графа на списках смежности */
    pub struct GraphAdjList {
        // Список смежности: ключ — вершина, значение — все её соседи
        pub adj_list: HashMap<Vertex, Vec<Vertex>>, // Возможно, для значения лучше подойдёт HashSet<Vertex>?
    }

    impl GraphAdjList {
        /* Конструктор */
        pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
            let mut graph = GraphAdjList {
                adj_list: HashMap::new(),
            };
            // Добавить все вершины и рёбра
            for edge in edges {
                graph.add_vertex(edge[0]);
                graph.add_vertex(edge[1]);
                graph.add_edge(edge[0], edge[1]);
            }

            graph
        }

        /* Получить число вершин */
        #[allow(unused)]
        pub fn size(&self) -> usize {
            self.adj_list.len()
        }

        /* Добавить ребро */
        pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("value error");
            }
            // Добавить ребро vet1 — vet2
            self.adj_list.entry(vet1).or_default().push(vet2);
            self.adj_list.entry(vet2).or_default().push(vet1);
        }

        /* Удалить ребро */
        #[allow(unused)]
        pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("value error");
            }
            // Удалить ребро vet1 — vet2
            self.adj_list
                .entry(vet1)
                .and_modify(|v| v.retain(|&e| e != vet2));
            self.adj_list
                .entry(vet2)
                .and_modify(|v| v.retain(|&e| e != vet1));
        }

        /* Добавить вершину */
        pub fn add_vertex(&mut self, vet: Vertex) {
            if self.adj_list.contains_key(&vet) {
                return;
            }
            // Добавить новый связный список в список смежности
            self.adj_list.insert(vet, vec![]);
        }

        /* Удалить вершину */
        #[allow(unused)]
        pub fn remove_vertex(&mut self, vet: Vertex) {
            // Удалить из списка смежности список вершины vet
            self.adj_list.remove(&vet);
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for list in self.adj_list.values_mut() {
                list.retain(|&v| v != vet);
            }
        }

        /* Вывести список смежности */
        pub fn print(&self) {
            println!("Список смежности =");
            for (vertex, list) in &self.adj_list {
                let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
                println!("{}: {:?},", vertex.val, list);
            }
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    /* Структура узла */
    typedef struct AdjListNode {
        Vertex *vertex;           // Вершина
        struct AdjListNode *next; // Следующий узел
    } AdjListNode;

    /* Найти узел, соответствующий вершине */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* Вспомогательная функция добавления ребра */
    void addEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
        node->vertex = vet;
        // Вставка в начало списка
        node->next = head->next;
        head->next = node;
    }

    /* Вспомогательная функция удаления ребра */
    void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *pre = head;
        AdjListNode *cur = head->next;
        // Найти в списке узел вершины vet
        while (cur != NULL && cur->vertex != vet) {
            pre = cur;
            cur = cur->next;
        }
        if (cur == NULL)
            return;
        // Удалить из списка узел вершины vet
        pre->next = cur->next;
        // Освободить память
        free(cur);
    }

    /* Неориентированный граф на списках смежности */
    typedef struct {
        AdjListNode *heads[MAX_SIZE]; // Массив узлов
        int size;                     // Число узлов
    } GraphAdjList;

    /* Конструктор */
    GraphAdjList *newGraphAdjList() {
        GraphAdjList *graph = (GraphAdjList *)malloc(sizeof(GraphAdjList));
        if (!graph) {
            return NULL;
        }
        graph->size = 0;
        for (int i = 0; i < MAX_SIZE; i++) {
            graph->heads[i] = NULL;
        }
        return graph;
    }

    /* Деструктор */
    void delGraphAdjList(GraphAdjList *graph) {
        for (int i = 0; i < graph->size; i++) {
            AdjListNode *cur = graph->heads[i];
            while (cur != NULL) {
                AdjListNode *next = cur->next;
                if (cur != graph->heads[i]) {
                    free(cur);
                }
                cur = next;
            }
            free(graph->heads[i]->vertex);
            free(graph->heads[i]);
        }
        free(graph);
    }

    /* Найти узел, соответствующий вершине */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* Добавить ребро */
    void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL && head1 != head2);
        // Добавить ребро vet1 — vet2
        addEdgeHelper(head1, vet2);
        addEdgeHelper(head2, vet1);
    }

    /* Удалить ребро */
    void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL);
        // Удалить ребро vet1 — vet2
        removeEdgeHelper(head1, head2->vertex);
        removeEdgeHelper(head2, head1->vertex);
    }

    /* Добавить вершину */
    void addVertex(GraphAdjList *graph, Vertex *vet) {
        assert(graph != NULL);
        if (findNode(graph, vet) != NULL)
            return;
        assert(graph->size < MAX_SIZE);
        AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
        head->vertex = vet;
        head->next = NULL;
        // Добавить новый связный список в список смежности
        graph->heads[graph->size++] = head;
    }

    /* Удалить вершину */
    void removeVertex(GraphAdjList *graph, Vertex *vet) {
        AdjListNode *node = findNode(graph, vet);
        assert(node != NULL);
        // Сдвинуть следующие вершины к началу, чтобы заполнить свободное место
        int i;
        for (i = 0; i < graph->size; i++) {
            if (graph->heads[i] == node)
                break;
        }
        for (int j = i; j < graph->size - 1; j++) {
            graph->heads[j] = graph->heads[j + 1];
        }
        graph->size--;
        // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
        for (int i = 0; i < graph->size; i++) {
            AdjListNode *cur = graph->heads[i];
            while (cur->next != NULL) {
                AdjListNode *next = cur->next;
                if (next->vertex == vet) {
                    cur->next = next->next;
                    free(next);
                } else {
                    cur = next;
                }
            }
        }
        // Удалить из списка смежности список вершины vet
        while (node != NULL) {
            AdjListNode *next = node->next;
            free(node);
            node = next;
        }
        free(vet);
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_list.kt"
    /* Неориентированный граф на списках смежности */
    class GraphAdjList(edges: Array<Array<Vertex?>>) {
        // Список смежности: ключ — вершина, значение — все её соседи
        val adjList = HashMap<Vertex, MutableList<Vertex>>()

        /* Конструктор */
        init {
            // Добавить все вершины и рёбра
            for (edge in edges) {
                addVertex(edge[0]!!)
                addVertex(edge[1]!!)
                addEdge(edge[0]!!, edge[1]!!)
            }
        }

        /* Получить число вершин */
        fun size(): Int {
            return adjList.size
        }

        /* Добавить ребро */
        fun addEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // Добавить ребро vet1 — vet2
            adjList[vet1]?.add(vet2)
            adjList[vet2]?.add(vet1)
        }

        /* Удалить ребро */
        fun removeEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // Удалить ребро vet1 — vet2
            adjList[vet1]?.remove(vet2)
            adjList[vet2]?.remove(vet1)
        }

        /* Добавить вершину */
        fun addVertex(vet: Vertex) {
            if (adjList.containsKey(vet))
                return
            // Добавить новый связный список в список смежности
            adjList[vet] = mutableListOf()
        }

        /* Удалить вершину */
        fun removeVertex(vet: Vertex) {
            if (!adjList.containsKey(vet))
                throw IllegalArgumentException()
            // Удалить из списка смежности список вершины vet
            adjList.remove(vet)
            // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
            for (list in adjList.values) {
                list.remove(vet)
            }
        }

        /* Вывести список смежности */
        fun print() {
            println("Список смежности =")
            for (pair in adjList.entries) {
                val tmp = mutableListOf<Int>()
                for (vertex in pair.value) {
                    tmp.add(vertex._val)
                }
                println("${pair.key._val}: $tmp,")
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_list.rb"
    ### Неориентированный граф на списках смежности ###
    class GraphAdjList
      attr_reader :adj_list
      
      ### Конструктор ###
      def initialize(edges)
        # Список смежности: ключ — вершина, значение — все её соседи
        @adj_list = {}
        # Добавить все вершины и рёбра
        for edge in edges
          add_vertex(edge[0])
          add_vertex(edge[1])
          add_edge(edge[0], edge[1])
        end
      end

      ### Получить число вершин ###
      def size
        @adj_list.length
      end

      ### Добавить ребро ###
      def add_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

        @adj_list[vet1] << vet2
        @adj_list[vet2] << vet1
      end

      ### Удалить ребро ###
      def remove_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

        # Удалить ребро vet1 — vet2
        @adj_list[vet1].delete(vet2)
        @adj_list[vet2].delete(vet1)
      end

      ### Добавить вершину ###
      def add_vertex(vet)
        return if @adj_list.include?(vet)

        # Добавить новый связный список в список смежности
        @adj_list[vet] = []
      end

      ### Удалить вершину ###
      def remove_vertex(vet)
        raise ArgumentError unless @adj_list.include?(vet)

        # Удалить из списка смежности список вершины vet
        @adj_list.delete(vet)
        # Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
        for vertex in @adj_list
          @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
        end
      end

      ### Вывести список смежности ###
      def __print__
        puts 'Список смежности ='
        for vertex in @adj_list
          tmp = @adj_list[vertex.first].map { |v| v.val }
          puts "#{vertex.first.val}: #{tmp},"
        end
      end
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%22%22%22%0A%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%22%22%22%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%20vals%20%E2%86%92%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%20vets%22%22%22%0A%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%22%22%22%D0%9D%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%3A%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B8%20%D1%81%D0%BC%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%22%22%22%0A%0A%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%20%D0%B8%20%D1%80%D1%91%D0%B1%D1%80%D0%B0%0A%20%20for%20edge%20in%20edges%3A%0A%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%22%22%22%0A%20%20return%20len%28self.adj_list%29%0A%0A%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20raise%20ValueError%28%29%0A%20%20%23%20%D0%A0%D0%B5%D0%B1%D1%80%D0%BE%20vet1%20%E2%80%94%20vet2%3A%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%0A%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20raise%20ValueError%28%29%0A%20%20%23%20%D0%A0%D0%B5%D0%B1%D1%80%D0%BE%20vet1%20%E2%80%94%20vet2%3A%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20return%0A%20%20%23%20%D0%9D%D0%BE%D0%B2%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%81%D0%BE%D1%81%D0%B5%D0%B4%D0%B5%D0%B9%0A%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20raise%20ValueError%28%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20vet%0A%20%20self.adj_list.pop%28vet%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D0%B2%D1%8F%D0%B7%D0%B8%20%D1%81%20vet%20%D0%B8%D0%B7%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%0A%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BD%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%0A%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20edges%20%3D%20%5B%0A%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%5D%0A%20graph%20%3D%20GraphAdjList%28edges%29%0A%20del%20edges%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20v5%20%3D%20Vertex%286%29%0A%20graph.add_vertex%28v5%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%22%22%22%0A%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%22%22%22%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%20vals%20%E2%86%92%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%20vets%22%22%22%0A%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%22%22%22%D0%9D%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%3A%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B8%20%D1%81%D0%BC%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%22%22%22%0A%0A%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%20%D0%B8%20%D1%80%D1%91%D0%B1%D1%80%D0%B0%0A%20%20for%20edge%20in%20edges%3A%0A%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%22%22%22%0A%20%20return%20len%28self.adj_list%29%0A%0A%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20raise%20ValueError%28%29%0A%20%20%23%20%D0%A0%D0%B5%D0%B1%D1%80%D0%BE%20vet1%20%E2%80%94%20vet2%3A%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%0A%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%22%22%22%0A%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20raise%20ValueError%28%29%0A%20%20%23%20%D0%A0%D0%B5%D0%B1%D1%80%D0%BE%20vet1%20%E2%80%94%20vet2%3A%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20return%0A%20%20%23%20%D0%9D%D0%BE%D0%B2%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%81%D0%BE%D1%81%D0%B5%D0%B4%D0%B5%D0%B9%0A%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20raise%20ValueError%28%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20vet%0A%20%20self.adj_list.pop%28vet%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%81%D0%B2%D1%8F%D0%B7%D0%B8%20%D1%81%20vet%20%D0%B8%D0%B7%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%0A%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BD%D0%B5%D0%BE%D1%80%D0%B8%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B3%D1%80%D0%B0%D1%84%0A%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20edges%20%3D%20%5B%0A%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%5D%0A%20graph%20%3D%20GraphAdjList%28edges%29%0A%20del%20edges%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%B1%D1%80%D0%BE%0A%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20v5%20%3D%20Vertex%286%29%0A%20graph.add_vertex%28v5%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%0A%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 9.2.3 &nbsp; Сравнение эффективности

Пусть в графе $n$ вершин и $m$ рёбер. В таблице сравниваются затраты времени и памяти для матрицы и списков смежности. Столбец «Список смежности (связные списки)» соответствует рассмотренной реализации. В варианте «Список смежности (хеш-таблицы)» каждый список соседей заменён хеш-таблицей.

<p align="center"> Таблица 9-2 &nbsp; Сравнение матрицы и списков смежности </p>

<div class="center-table" markdown>

|              | Матрица смежности | Список смежности (связные списки) | Список смежности (хеш-таблицы) |
| ------------ | -------- | -------------- | ---------------- |
| Проверка смежности | $O(1)$   | $O(n)$         | $O(1)$           |
| Добавить ребро       | $O(1)$   | $O(1)$         | $O(1)$           |
| Удалить ребро       | $O(1)$   | $O(n)$         | $O(1)$           |
| Добавить вершину     | $O(n)$   | $O(1)$         | $O(1)$           |
| Удалить вершину     | $O(n^2)$ | $O(n + m)$     | $O(n)$           |
| Занимаемая память | $O(n^2)$ | $O(n + m)$     | $O(n + m)$       |

</div>

По таблице может показаться, что списки смежности с хеш-таблицами лучше всего используют и время, и память. На практике операции с рёбрами быстрее в матрице смежности: достаточно одного чтения из массива или одного присваивания. Таким образом, матрица смежности выигрывает во времени за счёт памяти, а список смежности экономит память ценой времени.
