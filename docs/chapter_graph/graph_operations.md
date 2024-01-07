---
comments: true
---

# 9.2 &nbsp; 图基础操作

图的基础操作可分为对“边”的操作和对“顶点”的操作。在“邻接矩阵”和“邻接表”两种表示方法下，实现方式有所不同。

## 9.2.1 &nbsp; 基于邻接矩阵的实现

给定一个顶点数量为 $n$ 的无向图，则各种操作的实现方式如图 9-7 所示。

- **添加或删除边**：直接在邻接矩阵中修改指定的边即可，使用 $O(1)$ 时间。而由于是无向图，因此需要同时更新两个方向的边。
- **添加顶点**：在邻接矩阵的尾部添加一行一列，并全部填 $0$ 即可，使用 $O(n)$ 时间。
- **删除顶点**：在邻接矩阵中删除一行一列。当删除首行首列时达到最差情况，需要将 $(n-1)^2$ 个元素“向左上移动”，从而使用 $O(n^2)$ 时间。
- **初始化**：传入 $n$ 个顶点，初始化长度为 $n$ 的顶点列表 `vertices` ，使用 $O(n)$ 时间；初始化 $n \times n$ 大小的邻接矩阵 `adjMat` ，使用 $O(n^2)$ 时间。

=== "初始化邻接矩阵"
    ![邻接矩阵的初始化、增删边、增删顶点](graph_operations.assets/adjacency_matrix_initialization.png){ class="animation-figure" }

=== "添加边"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_add_edge.png){ class="animation-figure" }

=== "删除边"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_remove_edge.png){ class="animation-figure" }

=== "添加顶点"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_add_vertex.png){ class="animation-figure" }

=== "删除顶点"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_remove_vertex.png){ class="animation-figure" }

<p align="center"> 图 9-7 &nbsp; 邻接矩阵的初始化、增删边、增删顶点 </p>

以下是基于邻接矩阵表示图的实现代码：

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """基于邻接矩阵实现的无向图类"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """构造方法"""
            # 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
            self.vertices: list[int] = []
            # 邻接矩阵，行列索引对应“顶点索引”
            self.adj_mat: list[list[int]] = []
            # 添加顶点
            for val in vertices:
                self.add_vertex(val)
            # 添加边
            # 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """获取顶点数量"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """添加顶点"""
            n = self.size()
            # 向顶点列表中添加新顶点的值
            self.vertices.append(val)
            # 在邻接矩阵中添加一行
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # 在邻接矩阵中添加一列
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """删除顶点"""
            if index >= self.size():
                raise IndexError()
            # 在顶点列表中移除索引 index 的顶点
            self.vertices.pop(index)
            # 在邻接矩阵中删除索引 index 的行
            self.adj_mat.pop(index)
            # 在邻接矩阵中删除索引 index 的列
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """添加边"""
            # 参数 i, j 对应 vertices 元素索引
            # 索引越界与相等处理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """删除边"""
            # 参数 i, j 对应 vertices 元素索引
            # 索引越界与相等处理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            self.adj_mat[i][j] = 0
            self.adj_mat[j][i] = 0

        def print(self):
            """打印邻接矩阵"""
            print("顶点列表 =", self.vertices)
            print("邻接矩阵 =")
            print_matrix(self.adj_mat)
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        vector<int> vertices;       // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        vector<vector<int>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

      public:
        /* 构造方法 */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // 添加顶点
            for (int val : vertices) {
                addVertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for (const vector<int> &edge : edges) {
                addEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        int size() const {
            return vertices.size();
        }

        /* 添加顶点 */
        void addVertex(int val) {
            int n = size();
            // 向顶点列表中添加新顶点的值
            vertices.push_back(val);
            // 在邻接矩阵中添加一行
            adjMat.emplace_back(vector<int>(n, 0));
            // 在邻接矩阵中添加一列
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* 删除顶点 */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("顶点不存在");
            }
            // 在顶点列表中移除索引 index 的顶点
            vertices.erase(vertices.begin() + index);
            // 在邻接矩阵中删除索引 index 的行
            adjMat.erase(adjMat.begin() + index);
            // 在邻接矩阵中删除索引 index 的列
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        void addEdge(int i, int j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("顶点不存在");
            }
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        void removeEdge(int i, int j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("顶点不存在");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 打印邻接矩阵 */
        void print() {
            cout << "顶点列表 = ";
            printVector(vertices);
            cout << "邻接矩阵 =" << endl;
            printVectorMatrix(adjMat);
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        List<Integer> vertices; // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        List<List<Integer>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造方法 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // 添加顶点
            for (int val : vertices) {
                addVertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for (int[] e : edges) {
                addEdge(e[0], e[1]);
            }
        }

        /* 获取顶点数量 */
        public int size() {
            return vertices.size();
        }

        /* 添加顶点 */
        public void addVertex(int val) {
            int n = size();
            // 向顶点列表中添加新顶点的值
            vertices.add(val);
            // 在邻接矩阵中添加一行
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // 在邻接矩阵中添加一列
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* 删除顶点 */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // 在顶点列表中移除索引 index 的顶点
            vertices.remove(index);
            // 在邻接矩阵中删除索引 index 的行
            adjMat.remove(index);
            // 在邻接矩阵中删除索引 index 的列
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        public void addEdge(int i, int j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        public void removeEdge(int i, int j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            adjMat.get(i).set(j, 0);
            adjMat.get(j).set(i, 0);
        }

        /* 打印邻接矩阵 */
        public void print() {
            System.out.print("顶点列表 = ");
            System.out.println(vertices);
            System.out.println("邻接矩阵 =");
            PrintUtil.printMatrix(adjMat);
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        List<int> vertices;     // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        List<List<int>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造函数 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = [];
            this.adjMat = [];
            // 添加顶点
            foreach (int val in vertices) {
                AddVertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            foreach (int[] e in edges) {
                AddEdge(e[0], e[1]);
            }
        }

        /* 获取顶点数量 */
        int Size() {
            return vertices.Count;
        }

        /* 添加顶点 */
        public void AddVertex(int val) {
            int n = Size();
            // 向顶点列表中添加新顶点的值
            vertices.Add(val);
            // 在邻接矩阵中添加一行
            List<int> newRow = new(n);
            for (int j = 0; j < n; j++) {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // 在邻接矩阵中添加一列
            foreach (List<int> row in adjMat) {
                row.Add(0);
            }
        }

        /* 删除顶点 */
        public void RemoveVertex(int index) {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // 在顶点列表中移除索引 index 的顶点
            vertices.RemoveAt(index);
            // 在邻接矩阵中删除索引 index 的行
            adjMat.RemoveAt(index);
            // 在邻接矩阵中删除索引 index 的列
            foreach (List<int> row in adjMat) {
                row.RemoveAt(index);
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        public void AddEdge(int i, int j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        public void RemoveEdge(int i, int j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 打印邻接矩阵 */
        public void Print() {
            Console.Write("顶点列表 = ");
            PrintUtil.PrintList(vertices);
            Console.WriteLine("邻接矩阵 =");
            PrintUtil.PrintMatrix(adjMat);
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    /* 基于邻接矩阵实现的无向图类 */
    type graphAdjMat struct {
        // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        vertices []int
        // 邻接矩阵，行列索引对应“顶点索引”
        adjMat [][]int
    }

    /* 构造函数 */
    func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
        // 添加顶点
        n := len(vertices)
        adjMat := make([][]int, n)
        for i := range adjMat {
            adjMat[i] = make([]int, n)
        }
        // 初始化图
        g := &graphAdjMat{
            vertices: vertices,
            adjMat:   adjMat,
        }
        // 添加边
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        for i := range edges {
            g.addEdge(edges[i][0], edges[i][1])
        }
        return g
    }

    /* 获取顶点数量 */
    func (g *graphAdjMat) size() int {
        return len(g.vertices)
    }

    /* 添加顶点 */
    func (g *graphAdjMat) addVertex(val int) {
        n := g.size()
        // 向顶点列表中添加新顶点的值
        g.vertices = append(g.vertices, val)
        // 在邻接矩阵中添加一行
        newRow := make([]int, n)
        g.adjMat = append(g.adjMat, newRow)
        // 在邻接矩阵中添加一列
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i], 0)
        }
    }

    /* 删除顶点 */
    func (g *graphAdjMat) removeVertex(index int) {
        if index >= g.size() {
            return
        }
        // 在顶点列表中移除索引 index 的顶点
        g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
        // 在邻接矩阵中删除索引 index 的行
        g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
        // 在邻接矩阵中删除索引 index 的列
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
        }
    }

    /* 添加边 */
    // 参数 i, j 对应 vertices 元素索引
    func (g *graphAdjMat) addEdge(i, j int) {
        // 索引越界与相等处理
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
        g.adjMat[i][j] = 1
        g.adjMat[j][i] = 1
    }

    /* 删除边 */
    // 参数 i, j 对应 vertices 元素索引
    func (g *graphAdjMat) removeEdge(i, j int) {
        // 索引越界与相等处理
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        g.adjMat[i][j] = 0
        g.adjMat[j][i] = 0
    }

    /* 打印邻接矩阵 */
    func (g *graphAdjMat) print() {
        fmt.Printf("\t顶点列表 = %v\n", g.vertices)
        fmt.Printf("\t邻接矩阵 = \n")
        for i := range g.adjMat {
            fmt.Printf("\t\t\t%v\n", g.adjMat[i])
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        private var vertices: [Int] // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        private var adjMat: [[Int]] // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造方法 */
        init(vertices: [Int], edges: [[Int]]) {
            self.vertices = []
            adjMat = []
            // 添加顶点
            for val in vertices {
                addVertex(val: val)
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for e in edges {
                addEdge(i: e[0], j: e[1])
            }
        }

        /* 获取顶点数量 */
        func size() -> Int {
            vertices.count
        }

        /* 添加顶点 */
        func addVertex(val: Int) {
            let n = size()
            // 向顶点列表中添加新顶点的值
            vertices.append(val)
            // 在邻接矩阵中添加一行
            let newRow = Array(repeating: 0, count: n)
            adjMat.append(newRow)
            // 在邻接矩阵中添加一列
            for i in adjMat.indices {
                adjMat[i].append(0)
            }
        }

        /* 删除顶点 */
        func removeVertex(index: Int) {
            if index >= size() {
                fatalError("越界")
            }
            // 在顶点列表中移除索引 index 的顶点
            vertices.remove(at: index)
            // 在邻接矩阵中删除索引 index 的行
            adjMat.remove(at: index)
            // 在邻接矩阵中删除索引 index 的列
            for i in adjMat.indices {
                adjMat[i].remove(at: index)
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        func addEdge(i: Int, j: Int) {
            // 索引越界与相等处理
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("越界")
            }
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        func removeEdge(i: Int, j: Int) {
            // 索引越界与相等处理
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("越界")
            }
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 打印邻接矩阵 */
        func print() {
            Swift.print("顶点列表 = ", terminator: "")
            Swift.print(vertices)
            Swift.print("邻接矩阵 =")
            PrintUtil.printMatrix(matrix: adjMat)
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        vertices; // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        adjMat; // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造函数 */
        constructor(vertices, edges) {
            this.vertices = [];
            this.adjMat = [];
            // 添加顶点
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 获取顶点数量 */
        size() {
            return this.vertices.length;
        }

        /* 添加顶点 */
        addVertex(val) {
            const n = this.size();
            // 向顶点列表中添加新顶点的值
            this.vertices.push(val);
            // 在邻接矩阵中添加一行
            const newRow = [];
            for (let j = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 在邻接矩阵中添加一列
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 删除顶点 */
        removeVertex(index) {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在顶点列表中移除索引 index 的顶点
            this.vertices.splice(index, 1);

            // 在邻接矩阵中删除索引 index 的行
            this.adjMat.splice(index, 1);
            // 在邻接矩阵中删除索引 index 的列
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        addEdge(i, j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        removeEdge(i, j) {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 打印邻接矩阵 */
        print() {
            console.log('顶点列表 = ', this.vertices);
            console.log('邻接矩阵 =', this.adjMat);
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        vertices: number[]; // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        adjMat: number[][]; // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造函数 */
        constructor(vertices: number[], edges: number[][]) {
            this.vertices = [];
            this.adjMat = [];
            // 添加顶点
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 获取顶点数量 */
        size(): number {
            return this.vertices.length;
        }

        /* 添加顶点 */
        addVertex(val: number): void {
            const n: number = this.size();
            // 向顶点列表中添加新顶点的值
            this.vertices.push(val);
            // 在邻接矩阵中添加一行
            const newRow: number[] = [];
            for (let j: number = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 在邻接矩阵中添加一列
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 删除顶点 */
        removeVertex(index: number): void {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在顶点列表中移除索引 index 的顶点
            this.vertices.splice(index, 1);

            // 在邻接矩阵中删除索引 index 的行
            this.adjMat.splice(index, 1);
            // 在邻接矩阵中删除索引 index 的列
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        addEdge(i: number, j: number): void {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        removeEdge(i: number, j: number): void {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 打印邻接矩阵 */
        print(): void {
            console.log('顶点列表 = ', this.vertices);
            console.log('邻接矩阵 =', this.adjMat);
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
      List<int> vertices = []; // 顶点元素，元素代表“顶点值”，索引代表“顶点索引”
      List<List<int>> adjMat = []; //邻接矩阵，行列索引对应“顶点索引”

      /* 构造方法 */
      GraphAdjMat(List<int> vertices, List<List<int>> edges) {
        this.vertices = [];
        this.adjMat = [];
        // 添加顶点
        for (int val in vertices) {
          addVertex(val);
        }
        // 添加边
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        for (List<int> e in edges) {
          addEdge(e[0], e[1]);
        }
      }

      /* 获取顶点数量 */
      int size() {
        return vertices.length;
      }

      /* 添加顶点 */
      void addVertex(int val) {
        int n = size();
        // 向顶点列表中添加新顶点的值
        vertices.add(val);
        // 在邻接矩阵中添加一行
        List<int> newRow = List.filled(n, 0, growable: true);
        adjMat.add(newRow);
        // 在邻接矩阵中添加一列
        for (List<int> row in adjMat) {
          row.add(0);
        }
      }

      /* 删除顶点 */
      void removeVertex(int index) {
        if (index >= size()) {
          throw IndexError;
        }
        // 在顶点列表中移除索引 index 的顶点
        vertices.removeAt(index);
        // 在邻接矩阵中删除索引 index 的行
        adjMat.removeAt(index);
        // 在邻接矩阵中删除索引 index 的列
        for (List<int> row in adjMat) {
          row.removeAt(index);
        }
      }

      /* 添加边 */
      // 参数 i, j 对应 vertices 元素索引
      void addEdge(int i, int j) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
      }

      /* 删除边 */
      // 参数 i, j 对应 vertices 元素索引
      void removeEdge(int i, int j) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
      }

      /* 打印邻接矩阵 */
      void printAdjMat() {
        print("顶点列表 = $vertices");
        print("邻接矩阵 = ");
        printMatrix(adjMat);
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    /* 基于邻接矩阵实现的无向图类型 */
    pub struct GraphAdjMat {
        // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        pub vertices: Vec<i32>,
        // 邻接矩阵，行列索引对应“顶点索引”
        pub adj_mat: Vec<Vec<i32>>,
    }

    impl GraphAdjMat {
        /* 构造方法 */
        pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
            let mut graph = GraphAdjMat {
                vertices: vec![],
                adj_mat: vec![],
            };
            // 添加顶点
            for val in vertices {
                graph.add_vertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            for edge in edges {
                graph.add_edge(edge[0], edge[1])
            }

            graph
        }

        /* 获取顶点数量 */
        pub fn size(&self) -> usize {
            self.vertices.len()
        }

        /* 添加顶点 */
        pub fn add_vertex(&mut self, val: i32) {
            let n = self.size();
            // 向顶点列表中添加新顶点的值
            self.vertices.push(val);
            // 在邻接矩阵中添加一行
            self.adj_mat.push(vec![0; n]);
            // 在邻接矩阵中添加一列
            for row in &mut self.adj_mat {
                row.push(0);
            }
        }

        /* 删除顶点 */
        pub fn remove_vertex(&mut self, index: usize) {
            if index >= self.size() {
                panic!("index error")
            }
            // 在顶点列表中移除索引 index 的顶点
            self.vertices.remove(index);
            // 在邻接矩阵中删除索引 index 的行
            self.adj_mat.remove(index);
            // 在邻接矩阵中删除索引 index 的列
            for row in &mut self.adj_mat {
                row.remove(index);
            }
        }

        /* 添加边 */
        pub fn add_edge(&mut self, i: usize, j: usize) {
            // 参数 i, j 对应 vertices 元素索引
            // 索引越界与相等处理
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
            self.adj_mat[i][j] = 1;
            self.adj_mat[j][i] = 1;
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        pub fn remove_edge(&mut self, i: usize, j: usize) {
            // 参数 i, j 对应 vertices 元素索引
            // 索引越界与相等处理
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            self.adj_mat[i][j] = 0;
            self.adj_mat[j][i] = 0;
        }

        /* 打印邻接矩阵 */
        pub fn print(&self) {
            println!("顶点列表 = {:?}", self.vertices);
            println!("邻接矩阵 =");
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
    /* 基于邻接矩阵实现的无向图结构体 */
    typedef struct {
        int vertices[MAX_SIZE];
        int adjMat[MAX_SIZE][MAX_SIZE];
        int size;
    } GraphAdjMat;

    /* 构造函数 */
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

    /* 析构函数 */
    void delGraphAdjMat(GraphAdjMat *graph) {
        free(graph);
    }

    /* 添加顶点 */
    void addVertex(GraphAdjMat *graph, int val) {
        if (graph->size == MAX_SIZE) {
            fprintf(stderr, "图的顶点数量已达最大值\n");
            return;
        }
        // 添加第 n 个顶点，并将第 n 行和列置零
        int n = graph->size;
        graph->vertices[n] = val;
        for (int i = 0; i <= n; i++) {
            graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
        }
        graph->size++;
    }

    /* 删除顶点 */
    void removeVertex(GraphAdjMat *graph, int index) {
        if (index < 0 || index >= graph->size) {
            fprintf(stderr, "顶点索引越界\n");
            return;
        }
        // 在顶点列表中移除索引 index 的顶点
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1];
        }
        // 在邻接矩阵中删除索引 index 的行
        for (int i = index; i < graph->size - 1; i++) {
            for (int j = 0; j < graph->size; j++) {
                graph->adjMat[i][j] = graph->adjMat[i + 1][j];
            }
        }
        // 在邻接矩阵中删除索引 index 的列
        for (int i = 0; i < graph->size; i++) {
            for (int j = index; j < graph->size - 1; j++) {
                graph->adjMat[i][j] = graph->adjMat[i][j + 1];
            }
        }
        graph->size--;
    }

    /* 添加边 */
    // 参数 i, j 对应 vertices 元素索引
    void addEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "边索引越界或相等\n");
            return;
        }
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* 删除边 */
    // 参数 i, j 对应 vertices 元素索引
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "边索引越界或相等\n");
            return;
        }
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* 打印邻接矩阵 */
    void printGraphAdjMat(GraphAdjMat *graph) {
        printf("顶点列表 = ");
        printArray(graph->vertices, graph->size);
        printf("邻接矩阵 =\n");
        for (int i = 0; i < graph->size; i++) {
            printArray(graph->adjMat[i], graph->size);
        }
    }
    ```

=== "Zig"

    ```zig title="graph_adjacency_matrix.zig"
    [class]{GraphAdjMat}-[func]{}
    ```

??? pythontutor "可视化运行"

    <iframe width="800" height="600" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E9%A1%B6%E7%82%B9%E6%95%B0%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%91%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E6%96%B0%E9%A1%B6%E7%82%B9%E7%9A%84%E5%80%BC%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E6%B7%BB%E5%8A%A0%E4%B8%80%E8%A1%8C%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E6%B7%BB%E5%8A%A0%E4%B8%80%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%E4%B8%AD%E7%A7%BB%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E8%A1%8C%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E4%B8%8E%E7%9B%B8%E7%AD%89%E5%A4%84%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E4%B8%8E%E7%9B%B8%E7%AD%89%E5%A4%84%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%201,%202%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%AB%E4%B8%BA%200,%202%0A%20%20%20%20graph.add_edge%280,%202%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%BE%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%201,%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%AB%E4%B8%BA%200,%201%0A%20%20%20%20graph.remove_edge%280,%201%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%0A%20%20%20%20graph.add_vertex%286%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%201%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=370&codeDivWidth=300&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>
    <a href=https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E9%A1%B6%E7%82%B9%E6%95%B0%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%91%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E6%96%B0%E9%A1%B6%E7%82%B9%E7%9A%84%E5%80%BC%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E6%B7%BB%E5%8A%A0%E4%B8%80%E8%A1%8C%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E6%B7%BB%E5%8A%A0%E4%B8%80%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%E4%B8%AD%E7%A7%BB%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E9%A1%B6%E7%82%B9%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E8%A1%8C%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5%E4%B8%AD%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E4%B8%8E%E7%9B%B8%E7%AD%89%E5%A4%84%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E4%B8%8E%E7%9B%B8%E7%AD%89%E5%A4%84%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%201,%202%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%AB%E4%B8%BA%200,%202%0A%20%20%20%20graph.add_edge%280,%202%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%BE%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%201,%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%AB%E4%B8%BA%200,%201%0A%20%20%20%20graph.remove_edge%280,%201%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%0A%20%20%20%20graph.add_vertex%286%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%0A%20%20%20%20%23%20%E9%A1%B6%E7%82%B9%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%BA%201%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false target="_blank" rel="noopener noreferrer">全屏观看 ></a>

## 9.2.2 &nbsp; 基于邻接表的实现

设无向图的顶点总数为 $n$、边总数为 $m$ ，则可根据图 9-8 所示的方法实现各种操作。

- **添加边**：在顶点对应链表的末尾添加边即可，使用 $O(1)$ 时间。因为是无向图，所以需要同时添加两个方向的边。
- **删除边**：在顶点对应链表中查找并删除指定边，使用 $O(m)$ 时间。在无向图中，需要同时删除两个方向的边。
- **添加顶点**：在邻接表中添加一个链表，并将新增顶点作为链表头节点，使用 $O(1)$ 时间。
- **删除顶点**：需遍历整个邻接表，删除包含指定顶点的所有边，使用 $O(n + m)$ 时间。
- **初始化**：在邻接表中创建 $n$ 个顶点和 $2m$ 条边，使用 $O(n + m)$ 时间。

=== "初始化邻接表"
    ![邻接表的初始化、增删边、增删顶点](graph_operations.assets/adjacency_list_initialization.png){ class="animation-figure" }

=== "添加边"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_add_edge.png){ class="animation-figure" }

=== "删除边"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_remove_edge.png){ class="animation-figure" }

=== "添加顶点"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_add_vertex.png){ class="animation-figure" }

=== "删除顶点"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_remove_vertex.png){ class="animation-figure" }

<p align="center"> 图 9-8 &nbsp; 邻接表的初始化、增删边、增删顶点 </p>

以下是邻接表的代码实现。对比图 9-8 ，实际代码有以下不同。

- 为了方便添加与删除顶点，以及简化代码，我们使用列表（动态数组）来代替链表。
- 使用哈希表来存储邻接表，`key` 为顶点实例，`value` 为该顶点的邻接顶点列表（链表）。

另外，我们在邻接表中使用 `Vertex` 类来表示顶点，这样做的原因是：如果与邻接矩阵一样，用列表索引来区分不同顶点，那么假设要删除索引为 $i$ 的顶点，则需遍历整个邻接表，将所有大于 $i$ 的索引全部减 $1$ ，效率很低。而如果每个顶点都是唯一的 `Vertex` 实例，删除某一顶点之后就无须改动其他顶点了。

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """基于邻接表实现的无向图类"""

        def __init__(self, edges: list[list[Vertex]]):
            """构造方法"""
            # 邻接表，key：顶点，value：该顶点的所有邻接顶点
            self.adj_list = dict[Vertex, list[Vertex]]()
            # 添加所有顶点和边
            for edge in edges:
                self.add_vertex(edge[0])
                self.add_vertex(edge[1])
                self.add_edge(edge[0], edge[1])

        def size(self) -> int:
            """获取顶点数量"""
            return len(self.adj_list)

        def add_edge(self, vet1: Vertex, vet2: Vertex):
            """添加边"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # 添加边 vet1 - vet2
            self.adj_list[vet1].append(vet2)
            self.adj_list[vet2].append(vet1)

        def remove_edge(self, vet1: Vertex, vet2: Vertex):
            """删除边"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # 删除边 vet1 - vet2
            self.adj_list[vet1].remove(vet2)
            self.adj_list[vet2].remove(vet1)

        def add_vertex(self, vet: Vertex):
            """添加顶点"""
            if vet in self.adj_list:
                return
            # 在邻接表中添加一个新链表
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """删除顶点"""
            if vet not in self.adj_list:
                raise ValueError()
            # 在邻接表中删除顶点 vet 对应的链表
            self.adj_list.pop(vet)
            # 遍历其他顶点的链表，删除所有包含 vet 的边
            for vertex in self.adj_list:
                if vet in self.adj_list[vertex]:
                    self.adj_list[vertex].remove(vet)

        def print(self):
            """打印邻接表"""
            print("邻接表 =")
            for vertex in self.adj_list:
                tmp = [v.val for v in self.adj_list[vertex]]
                print(f"{vertex.val}: {tmp},")
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
      public:
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* 在 vector 中删除指定节点 */
        void remove(vector<Vertex *> &vec, Vertex *vet) {
            for (int i = 0; i < vec.size(); i++) {
                if (vec[i] == vet) {
                    vec.erase(vec.begin() + i);
                    break;
                }
            }
        }

        /* 构造方法 */
        GraphAdjList(const vector<vector<Vertex *>> &edges) {
            // 添加所有顶点和边
            for (const vector<Vertex *> &edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        int size() {
            return adjList.size();
        }

        /* 添加边 */
        void addEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("不存在顶点");
            // 添加边 vet1 - vet2
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* 删除边 */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("不存在顶点");
            // 删除边 vet1 - vet2
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* 添加顶点 */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // 在邻接表中添加一个新链表
            adjList[vet] = vector<Vertex *>();
        }

        /* 删除顶点 */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("不存在顶点");
            // 在邻接表中删除顶点 vet 对应的链表
            adjList.erase(vet);
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* 打印邻接表 */
        void print() {
            cout << "邻接表 =" << endl;
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
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        Map<Vertex, List<Vertex>> adjList;

        /* 构造方法 */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new HashMap<>();
            // 添加所有顶点和边
            for (Vertex[] edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        public int size() {
            return adjList.size();
        }

        /* 添加边 */
        public void addEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // 添加边 vet1 - vet2
            adjList.get(vet1).add(vet2);
            adjList.get(vet2).add(vet1);
        }

        /* 删除边 */
        public void removeEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // 删除边 vet1 - vet2
            adjList.get(vet1).remove(vet2);
            adjList.get(vet2).remove(vet1);
        }

        /* 添加顶点 */
        public void addVertex(Vertex vet) {
            if (adjList.containsKey(vet))
                return;
            // 在邻接表中添加一个新链表
            adjList.put(vet, new ArrayList<>());
        }

        /* 删除顶点 */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // 在邻接表中删除顶点 vet 对应的链表
            adjList.remove(vet);
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            for (List<Vertex> list : adjList.values()) {
                list.remove(vet);
            }
        }

        /* 打印邻接表 */
        public void print() {
            System.out.println("邻接表 =");
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
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* 构造函数 */
        public GraphAdjList(Vertex[][] edges) {
            adjList = [];
            // 添加所有顶点和边
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        int Size() {
            return adjList.Count;
        }

        /* 添加边 */
        public void AddEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 添加边 vet1 - vet2
            adjList[vet1].Add(vet2);
            adjList[vet2].Add(vet1);
        }

        /* 删除边 */
        public void RemoveEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 删除边 vet1 - vet2
            adjList[vet1].Remove(vet2);
            adjList[vet2].Remove(vet1);
        }

        /* 添加顶点 */
        public void AddVertex(Vertex vet) {
            if (adjList.ContainsKey(vet))
                return;
            // 在邻接表中添加一个新链表
            adjList.Add(vet, []);
        }

        /* 删除顶点 */
        public void RemoveVertex(Vertex vet) {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // 在邻接表中删除顶点 vet 对应的链表
            adjList.Remove(vet);
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            foreach (List<Vertex> list in adjList.Values) {
                list.Remove(vet);
            }
        }

        /* 打印邻接表 */
        public void Print() {
            Console.WriteLine("邻接表 =");
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
    /* 基于邻接表实现的无向图类 */
    type graphAdjList struct {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        adjList map[Vertex][]Vertex
    }

    /* 构造函数 */
    func newGraphAdjList(edges [][]Vertex) *graphAdjList {
        g := &graphAdjList{
            adjList: make(map[Vertex][]Vertex),
        }
        // 添加所有顶点和边
        for _, edge := range edges {
            g.addVertex(edge[0])
            g.addVertex(edge[1])
            g.addEdge(edge[0], edge[1])
        }
        return g
    }

    /* 获取顶点数量 */
    func (g *graphAdjList) size() int {
        return len(g.adjList)
    }

    /* 添加边 */
    func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // 添加边 vet1 - vet2, 添加匿名 struct{},
        g.adjList[vet1] = append(g.adjList[vet1], vet2)
        g.adjList[vet2] = append(g.adjList[vet2], vet1)
    }

    /* 删除边 */
    func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // 删除边 vet1 - vet2
        g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
        g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
    }

    /* 添加顶点 */
    func (g *graphAdjList) addVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if ok {
            return
        }
        // 在邻接表中添加一个新链表
        g.adjList[vet] = make([]Vertex, 0)
    }

    /* 删除顶点 */
    func (g *graphAdjList) removeVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if !ok {
            panic("error")
        }
        // 在邻接表中删除顶点 vet 对应的链表
        delete(g.adjList, vet)
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        for v, list := range g.adjList {
            g.adjList[v] = DeleteSliceElms(list, vet)
        }
    }

    /* 打印邻接表 */
    func (g *graphAdjList) print() {
        var builder strings.Builder
        fmt.Printf("邻接表 = \n")
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
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        public private(set) var adjList: [Vertex: [Vertex]]

        /* 构造方法 */
        public init(edges: [[Vertex]]) {
            adjList = [:]
            // 添加所有顶点和边
            for edge in edges {
                addVertex(vet: edge[0])
                addVertex(vet: edge[1])
                addEdge(vet1: edge[0], vet2: edge[1])
            }
        }

        /* 获取顶点数量 */
        public func size() -> Int {
            adjList.count
        }

        /* 添加边 */
        public func addEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("参数错误")
            }
            // 添加边 vet1 - vet2
            adjList[vet1]?.append(vet2)
            adjList[vet2]?.append(vet1)
        }

        /* 删除边 */
        public func removeEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("参数错误")
            }
            // 删除边 vet1 - vet2
            adjList[vet1]?.removeAll(where: { $0 == vet2 })
            adjList[vet2]?.removeAll(where: { $0 == vet1 })
        }

        /* 添加顶点 */
        public func addVertex(vet: Vertex) {
            if adjList[vet] != nil {
                return
            }
            // 在邻接表中添加一个新链表
            adjList[vet] = []
        }

        /* 删除顶点 */
        public func removeVertex(vet: Vertex) {
            if adjList[vet] == nil {
                fatalError("参数错误")
            }
            // 在邻接表中删除顶点 vet 对应的链表
            adjList.removeValue(forKey: vet)
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            for key in adjList.keys {
                adjList[key]?.removeAll(where: { $0 == vet })
            }
        }

        /* 打印邻接表 */
        public func print() {
            Swift.print("邻接表 =")
            for pair in adjList {
                var tmp: [Int] = []
                for vertex in pair.value {
                    tmp.append(vertex.val)
                }
                Swift.print("\(pair.key.val): \(tmp),")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        adjList;

        /* 构造方法 */
        constructor(edges) {
            this.adjList = new Map();
            // 添加所有顶点和边
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        size() {
            return this.adjList.size;
        }

        /* 添加边 */
        addEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 添加边 vet1 - vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* 删除边 */
        removeEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 删除边 vet1 - vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* 添加顶点 */
        addVertex(vet) {
            if (this.adjList.has(vet)) return;
            // 在邻接表中添加一个新链表
            this.adjList.set(vet, []);
        }

        /* 删除顶点 */
        removeVertex(vet) {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 在邻接表中删除顶点 vet 对应的链表
            this.adjList.delete(vet);
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            for (const set of this.adjList.values()) {
                const index = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 打印邻接表 */
        print() {
            console.log('邻接表 =');
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
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        adjList: Map<Vertex, Vertex[]>;

        /* 构造方法 */
        constructor(edges: Vertex[][]) {
            this.adjList = new Map();
            // 添加所有顶点和边
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        size(): number {
            return this.adjList.size;
        }

        /* 添加边 */
        addEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 添加边 vet1 - vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* 删除边 */
        removeEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 删除边 vet1 - vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* 添加顶点 */
        addVertex(vet: Vertex): void {
            if (this.adjList.has(vet)) return;
            // 在邻接表中添加一个新链表
            this.adjList.set(vet, []);
        }

        /* 删除顶点 */
        removeVertex(vet: Vertex): void {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 在邻接表中删除顶点 vet 对应的链表
            this.adjList.delete(vet);
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            for (const set of this.adjList.values()) {
                const index: number = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 打印邻接表 */
        print(): void {
            console.log('邻接表 =');
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
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
      // 邻接表，key：顶点，value：该顶点的所有邻接顶点
      Map<Vertex, List<Vertex>> adjList = {};

      /* 构造方法 */
      GraphAdjList(List<List<Vertex>> edges) {
        for (List<Vertex> edge in edges) {
          addVertex(edge[0]);
          addVertex(edge[1]);
          addEdge(edge[0], edge[1]);
        }
      }

      /* 获取顶点数量 */
      int size() {
        return adjList.length;
      }

      /* 添加边 */
      void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // 添加边 vet1 - vet2
        adjList[vet1]!.add(vet2);
        adjList[vet2]!.add(vet1);
      }

      /* 删除边 */
      void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // 删除边 vet1 - vet2
        adjList[vet1]!.remove(vet2);
        adjList[vet2]!.remove(vet1);
      }

      /* 添加顶点 */
      void addVertex(Vertex vet) {
        if (adjList.containsKey(vet)) return;
        // 在邻接表中添加一个新链表
        adjList[vet] = [];
      }

      /* 删除顶点 */
      void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet)) {
          throw ArgumentError;
        }
        // 在邻接表中删除顶点 vet 对应的链表
        adjList.remove(vet);
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        adjList.forEach((key, value) {
          value.remove(vet);
        });
      }

      /* 打印邻接表 */
      void printAdjList() {
        print("邻接表 =");
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
    /* 基于邻接表实现的无向图类型 */
    pub struct GraphAdjList {
        // 邻接表，key：顶点，value：该顶点的所有邻接顶点
        pub adj_list: HashMap<Vertex, Vec<Vertex>>,
    }

    impl GraphAdjList {
        /* 构造方法 */
        pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
            let mut graph = GraphAdjList {
                adj_list: HashMap::new(),
            };
            // 添加所有顶点和边
            for edge in edges {
                graph.add_vertex(edge[0]);
                graph.add_vertex(edge[1]);
                graph.add_edge(edge[0], edge[1]);
            }

            graph
        }

        /* 获取顶点数量 */
        #[allow(unused)]
        pub fn size(&self) -> usize {
            self.adj_list.len()
        }

        /* 添加边 */
        pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
            {
                panic!("value error");
            }
            // 添加边 vet1 - vet2
            self.adj_list.get_mut(&vet1).unwrap().push(vet2);
            self.adj_list.get_mut(&vet2).unwrap().push(vet1);
        }

        /* 删除边 */
        #[allow(unused)]
        pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
            {
                panic!("value error");
            }
            // 删除边 vet1 - vet2
            self.adj_list
                .get_mut(&vet1)
                .unwrap()
                .retain(|&vet| vet != vet2);
            self.adj_list
                .get_mut(&vet2)
                .unwrap()
                .retain(|&vet| vet != vet1);
        }

        /* 添加顶点 */
        pub fn add_vertex(&mut self, vet: Vertex) {
            if self.adj_list.contains_key(&vet) {
                return;
            }
            // 在邻接表中添加一个新链表
            self.adj_list.insert(vet, vec![]);
        }

        /* 删除顶点 */
        #[allow(unused)]
        pub fn remove_vertex(&mut self, vet: Vertex) {
            if !self.adj_list.contains_key(&vet) {
                panic!("value error");
            }
            // 在邻接表中删除顶点 vet 对应的链表
            self.adj_list.remove(&vet);
            // 遍历其他顶点的链表，删除所有包含 vet 的边
            for list in self.adj_list.values_mut() {
                list.retain(|&v| v != vet);
            }
        }

        /* 打印邻接表 */
        pub fn print(&self) {
            println!("邻接表 =");
            for (vertex, list) in &self.adj_list {
                let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
                println!("{}: {:?},", vertex.val, list);
            }
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    /* 节点结构体 */
    typedef struct AdjListNode {
        Vertex *vertex;           // 顶点
        struct AdjListNode *next; // 后继节点
    } AdjListNode;

    /* 查找顶点对应的节点 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 添加边辅助函数 */
    void addEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
        node->vertex = vet;
        // 头插法
        node->next = head->next;
        head->next = node;
    }

    /* 删除边辅助函数 */
    void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *pre = head;
        AdjListNode *cur = head->next;
        // 在链表中搜索 vet 对应节点
        while (cur != NULL && cur->vertex != vet) {
            pre = cur;
            cur = cur->next;
        }
        if (cur == NULL)
            return;
        // 将 vet 对应节点从链表中删除
        pre->next = cur->next;
        // 释放内存
        free(cur);
    }

    /* 基于邻接表实现的无向图类 */
    typedef struct {
        AdjListNode *heads[MAX_SIZE]; // 节点数组
        int size;                     // 节点数量
    } GraphAdjList;

    /* 构造函数 */
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

    /* 析构函数 */
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

    /* 查找顶点对应的节点 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 添加边 */
    void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL && head1 != head2);
        // 添加边 vet1 - vet2
        addEdgeHelper(head1, vet2);
        addEdgeHelper(head2, vet1);
    }

    /* 删除边 */
    void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL);
        // 删除边 vet1 - vet2
        removeEdgeHelper(head1, head2->vertex);
        removeEdgeHelper(head2, head1->vertex);
    }

    /* 添加顶点 */
    void addVertex(GraphAdjList *graph, Vertex *vet) {
        assert(graph != NULL && graph->size < MAX_SIZE);
        AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
        head->vertex = vet;
        head->next = NULL;
        // 在邻接表中添加一个新链表
        graph->heads[graph->size++] = head;
    }

    /* 删除顶点 */
    void removeVertex(GraphAdjList *graph, Vertex *vet) {
        AdjListNode *node = findNode(graph, vet);
        assert(node != NULL);
        // 在邻接表中删除顶点 vet 对应的链表
        AdjListNode *cur = node, *pre = NULL;
        while (cur) {
            pre = cur;
            cur = cur->next;
            free(pre);
        }
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        for (int i = 0; i < graph->size; i++) {
            cur = graph->heads[i];
            pre = NULL;
            while (cur) {
                pre = cur;
                cur = cur->next;
                if (cur && cur->vertex == vet) {
                    pre->next = cur->next;
                    free(cur);
                    break;
                }
            }
        }
        // 将该顶点之后的顶点向前移动，以填补空缺
        int i;
        for (i = 0; i < graph->size; i++) {
            if (graph->heads[i] == node)
                break;
        }
        for (int j = i; j < graph->size - 1; j++) {
            graph->heads[j] = graph->heads[j + 1];
        }
        graph->size--;
        free(vet);
    }
    ```

=== "Zig"

    ```zig title="graph_adjacency_list.zig"
    [class]{GraphAdjList}-[func]{}
    ```

??? pythontutor "可视化运行"

    <iframe width="800" height="600" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A1%B6%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BE%93%E5%85%A5%E5%80%BC%E5%88%97%E8%A1%A8%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E8%A1%A8%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%89%80%E6%9C%89%E9%A1%B6%E7%82%B9%E5%92%8C%E8%BE%B9%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E9%A1%B6%E7%82%B9%E6%95%B0%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%BE%B9%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E4%B8%80%E4%B8%AA%E6%96%B0%E9%93%BE%E8%A1%A8%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E8%A1%A8%E4%B8%AD%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%20vet%20%E5%AF%B9%E5%BA%94%E7%9A%84%E9%93%BE%E8%A1%A8%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E5%85%B6%E4%BB%96%E9%A1%B6%E7%82%B9%E7%9A%84%E9%93%BE%E8%A1%A8%EF%BC%8C%E5%88%A0%E9%99%A4%E6%89%80%E6%9C%89%E5%8C%85%E5%90%AB%20vet%20%E7%9A%84%E8%BE%B9%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%0A%20%20%20%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%BE%B9%0A%20%20%20%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=370&codeDivWidth=300&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>
    <a href=https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A1%B6%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BE%93%E5%85%A5%E5%80%BC%E5%88%97%E8%A1%A8%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A1%B6%E7%82%B9%E5%88%97%E8%A1%A8%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E4%BA%8E%E9%82%BB%E6%8E%A5%E8%A1%A8%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%97%A0%E5%90%91%E5%9B%BE%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%89%80%E6%9C%89%E9%A1%B6%E7%82%B9%E5%92%8C%E8%BE%B9%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E9%A1%B6%E7%82%B9%E6%95%B0%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E8%BE%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%BE%B9%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E4%B8%80%E4%B8%AA%E6%96%B0%E9%93%BE%E8%A1%A8%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%82%BB%E6%8E%A5%E8%A1%A8%E4%B8%AD%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%20vet%20%E5%AF%B9%E5%BA%94%E7%9A%84%E9%93%BE%E8%A1%A8%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E5%85%B6%E4%BB%96%E9%A1%B6%E7%82%B9%E7%9A%84%E9%93%BE%E8%A1%A8%EF%BC%8C%E5%88%A0%E9%99%A4%E6%89%80%E6%9C%89%E5%8C%85%E5%90%AB%20vet%20%E7%9A%84%E8%BE%B9%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%97%A0%E5%90%91%E5%9B%BE%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%BE%B9%0A%20%20%20%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%BE%B9%0A%20%20%20%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E9%A1%B6%E7%82%B9%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E9%A1%B6%E7%82%B9%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false target="_blank" rel="noopener noreferrer">全屏观看 ></a>

## 9.2.3 &nbsp; 效率对比

设图中共有 $n$ 个顶点和 $m$ 条边，表 9-2 对比了邻接矩阵和邻接表的时间效率和空间效率。

<p align="center"> 表 9-2 &nbsp; 邻接矩阵与邻接表对比 </p>

<div class="center-table" markdown>

|              | 邻接矩阵 | 邻接表（链表） | 邻接表（哈希表） |
| ------------ | -------- | -------------- | ---------------- |
| 判断是否邻接 | $O(1)$   | $O(m)$         | $O(1)$           |
| 添加边       | $O(1)$   | $O(1)$         | $O(1)$           |
| 删除边       | $O(1)$   | $O(m)$         | $O(1)$           |
| 添加顶点     | $O(n)$   | $O(1)$         | $O(1)$           |
| 删除顶点     | $O(n^2)$ | $O(n + m)$     | $O(n)$           |
| 内存空间占用 | $O(n^2)$ | $O(n + m)$     | $O(n + m)$       |

</div>

观察表 9-2 ，似乎邻接表（哈希表）的时间效率与空间效率最优。但实际上，在邻接矩阵中操作边的效率更高，只需一次数组访问或赋值操作即可。综合来看，邻接矩阵体现了“以空间换时间”的原则，而邻接表体现了“以时间换空间”的原则。
