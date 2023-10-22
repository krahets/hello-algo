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
    ![邻接矩阵的初始化、增删边、增删顶点](graph_operations.assets/adjacency_matrix_initialization.png)

=== "添加边"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_add_edge.png)

=== "删除边"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_remove_edge.png)

=== "添加顶点"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_add_vertex.png)

=== "删除顶点"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_remove_vertex.png)

<p align="center"> 图 9-7 &nbsp; 邻接矩阵的初始化、增删边、增删顶点 </p>

以下是基于邻接矩阵表示图的实现代码。

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """基于邻接矩阵实现的无向图类"""

        # 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        vertices: list[int] = []
        # 邻接矩阵，行列索引对应“顶点索引”
        adj_mat: list[list[int]] = []

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """构造方法"""
            self.vertices: list[int] = []
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
            # 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
        readonly List<int> vertices;     // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        readonly List<List<int>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造函数 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new List<int>();
            this.adjMat = new List<List<int>>();
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
        public int Size() {
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
        // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) === (j, i)
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) === (j, i)
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
        // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
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
    /* 基于邻接矩阵实现的无向图类结构 */
    typedef struct {
        int *vertices; // 顶点列表
        int **adjMat;  // 邻接矩阵，元素代表“边”，索引代表“顶点索引”
        int size;      // 顶点数量
        int capacity;  // 图容量
    } GraphAdjMat;

    /* 添加边 */
    // 参数 i, j 对应 vertices 元素索引
    void addEdge(GraphAdjMat *graph, int i, int j) {
        // 越界检查
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            exit(1);
        }
        // 添加边
        // 参数 i, j 对应 vertices 元素索引
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* 删除边 */
    // 参数 i, j 对应 vertices 元素索引
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        // 越界检查
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            exit(1);
        }
        // 删除边
        // 参数 i, j 对应 vertices 元素索引
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* 添加顶点 */
    void addVertex(GraphAdjMat *graph, int val) {
        // 如果实际使用不大于预设空间，则直接初始化新空间
        if (graph->size < graph->capacity) {
            graph->vertices[graph->size] = val; // 初始化新顶点值
            for (int i = 0; i < graph->size; i++) {
                graph->adjMat[i][graph->size] = 0; // 邻接矩新列阵置0
            }
            memset(graph->adjMat[graph->size], 0, sizeof(int) * (graph->size + 1)); // 将新增行置 0
            graph->size++;
            return;
        }
        // 扩容，申请新的顶点数组
        int *temp = (int *)malloc(sizeof(int) * (graph->size * 2));
        memcpy(temp, graph->vertices, sizeof(int) * graph->size);
        temp[graph->size] = val;
        // 释放原数组
        free(graph->vertices);
        graph->vertices = temp;
        // 扩容，申请新的二维数组
        int **tempMat = (int **)malloc(sizeof(int *) * graph->size * 2);
        int *tempMatLine = (int *)malloc(sizeof(int) * (graph->size * 2) * (graph->size * 2));
        memset(tempMatLine, 0, sizeof(int) * (graph->size * 2) * (graph->size * 2));
        for (int k = 0; k < graph->size * 2; k++) {
            tempMat[k] = tempMatLine + k * (graph->size * 2);
        }
        for (int i = 0; i < graph->size; i++) {
            memcpy(tempMat[i], graph->adjMat[i], sizeof(int) * graph->size); // 原数据复制到新数组
        }
        for (int i = 0; i < graph->size; i++) {
            tempMat[i][graph->size] = 0; // 将新增列置 0
        }
        memset(tempMat[graph->size], 0, sizeof(int) * (graph->size + 1)); // 将新增行置 0
        // 释放原数组
        free(graph->adjMat[0]);
        free(graph->adjMat);
        // 扩容后，指向新地址
        graph->adjMat = tempMat; // 指向新的邻接矩阵地址
        graph->capacity = graph->size * 2;
        graph->size++;
    }

    /* 删除顶点 */
    void removeVertex(GraphAdjMat *graph, int index) {
        // 越界检查
        if (index < 0 || index >= graph->size) {
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            exit(1);
        }
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1]; // 清除删除的顶点，并将其后所有顶点前移
        }
        graph->vertices[graph->size - 1] = 0; // 将被前移的最后一个顶点置 0
        // 清除邻接矩阵中删除的列
        for (int i = 0; i < graph->size - 1; i++) {
            if (i < index) {
                for (int j = index; j < graph->size - 1; j++) {
                    graph->adjMat[i][j] = graph->adjMat[i][j + 1]; // 被删除列后的所有列前移
                }
            } else {
                memcpy(graph->adjMat[i], graph->adjMat[i + 1], sizeof(int) * graph->size); // 被删除行的下方所有行上移
                for (int j = index; j < graph->size; j++) {
                    graph->adjMat[i][j] = graph->adjMat[i][j + 1]; // 被删除列后的所有列前移
                }
            }
        }
        graph->size--;
    }

    /* 打印顶点与邻接矩阵 */
    void printGraph(GraphAdjMat *graph) {
        if (graph->size == 0) {
            printf("graph is empty\n");
            return;
        }
        printf("顶点列表 = [");
        for (int i = 0; i < graph->size; i++) {
            if (i != graph->size - 1) {
                printf("%d, ", graph->vertices[i]);
            } else {
                printf("%d", graph->vertices[i]);
            }
        }
        printf("]\n");
        printf("邻接矩阵 =\n[\n");
        for (int i = 0; i < graph->size; i++) {
            printf("  [");
            for (int j = 0; j < graph->size; j++) {
                if (j != graph->size - 1) {
                    printf("%u, ", graph->adjMat[i][j]);
                } else {
                    printf("%u", graph->adjMat[i][j]);
                }
            }
            printf("],\n");
        }
        printf("]\n");
    }

    /* 构造函数 */
    GraphAdjMat *newGraphAjdMat(int numberVertices, int *vertices, int **adjMat) {
        // 申请内存
        GraphAdjMat *newGraph = (GraphAdjMat *)malloc(sizeof(GraphAdjMat));    // 为图分配内存
        newGraph->vertices = (int *)malloc(sizeof(int) * numberVertices * 2);  // 为顶点列表分配内存
        newGraph->adjMat = (int **)malloc(sizeof(int *) * numberVertices * 2); // 为邻接矩阵分配二维内存
        int *temp = (int *)malloc(sizeof(int) * numberVertices * 2 * numberVertices * 2); // 为邻接矩阵分配一维内存
        newGraph->size = numberVertices;                                                  // 初始化顶点数量
        newGraph->capacity = numberVertices * 2;                                          // 初始化图容量
        // 配置二维数组
        for (int i = 0; i < numberVertices * 2; i++) {
            newGraph->adjMat[i] = temp + i * numberVertices * 2; // 将二维指针指向一维数组
        }
        // 赋值
        memcpy(newGraph->vertices, vertices, sizeof(int) * numberVertices);
        for (int i = 0; i < numberVertices; i++) {
            memcpy(newGraph->adjMat[i], adjMat[i],
                   sizeof(int) * numberVertices); // 将传入的邻接矩阵赋值给结构体内邻接矩阵
        }
        // 返回结构体指针
        return newGraph;
    }
    ```

=== "Zig"

    ```zig title="graph_adjacency_matrix.zig"
    [class]{GraphAdjMat}-[func]{}
    ```

## 9.2.2 &nbsp; 基于邻接表的实现

设无向图的顶点总数为 $n$、边总数为 $m$ ，则可根据图 9-8 所示的方法实现各种操作。

- **添加边**：在顶点对应链表的末尾添加边即可，使用 $O(1)$ 时间。因为是无向图，所以需要同时添加两个方向的边。
- **删除边**：在顶点对应链表中查找并删除指定边，使用 $O(m)$ 时间。在无向图中，需要同时删除两个方向的边。
- **添加顶点**：在邻接表中添加一个链表，并将新增顶点作为链表头节点，使用 $O(1)$ 时间。
- **删除顶点**：需遍历整个邻接表，删除包含指定顶点的所有边，使用 $O(n + m)$ 时间。
- **初始化**：在邻接表中创建 $n$ 个顶点和 $2m$ 条边，使用 $O(n + m)$ 时间。

=== "初始化邻接表"
    ![邻接表的初始化、增删边、增删顶点](graph_operations.assets/adjacency_list_initialization.png)

=== "添加边"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_add_edge.png)

=== "删除边"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_remove_edge.png)

=== "添加顶点"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_add_vertex.png)

=== "删除顶点"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_remove_vertex.png)

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
            # 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* 构造函数 */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new Dictionary<Vertex, List<Vertex>>();
            // 添加所有顶点和边
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        public int Size() {
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
            adjList.Add(vet, new List<Vertex>());
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
                List<int> tmp = new();
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
      // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
        // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
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
    /* 基于邻接链表实现的无向图类结构 */
    typedef struct {
        Vertex **vertices;     // 邻接表
        unsigned int size;     // 顶点数量
        unsigned int capacity; // 顶点容量
    } GraphAdjList;

    /* 添加边 */
    void addEdge(GraphAdjList *graph, int i, int j) {
        // 越界检查
        if (i < 0 || j < 0 || i == j || i >= graph->size || j >= graph->size) {
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            return;
        }
        // 查找欲添加边的顶点 vet1 - vet2
        Vertex *vet1 = graph->vertices[i];
        Vertex *vet2 = graph->vertices[j];
        // 连接顶点 vet1 - vet2
        pushBack(vet1->list, vet2);
        pushBack(vet2->list, vet1);
    }

    /* 删除边 */
    void removeEdge(GraphAdjList *graph, int i, int j) {
        // 越界检查
        if (i < 0 || j < 0 || i == j || i >= graph->size || j >= graph->size) {
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            return;
        }
        // 查找欲删除边的顶点 vet1 - vet2
        Vertex *vet1 = graph->vertices[i];
        Vertex *vet2 = graph->vertices[j];
        // 移除待删除边 vet1 - vet2
        removeLink(vet1->list, vet2);
        removeLink(vet2->list, vet1);
    }

    /* 添加顶点 */
    void addVertex(GraphAdjList *graph, int val) {
        // 若大小超过容量，则扩容
        if (graph->size >= graph->capacity) {
            Vertex **tempList = (Vertex **)malloc(sizeof(Vertex *) * 2 * graph->capacity);
            memcpy(tempList, graph->vertices, sizeof(Vertex *) * graph->size);
            free(graph->vertices);                 // 释放原邻接表内存
            graph->vertices = tempList;            // 指向新邻接表
            graph->capacity = graph->capacity * 2; // 容量扩大至2倍
        }
        // 申请新顶点内存并将新顶点地址存入顶点列表
        Vertex *newV = newVertex(val);       // 建立新顶点
        newV->pos = graph->size;             // 为新顶点标记下标
        newV->list = newLinklist(newV);      // 为新顶点建立链表
        graph->vertices[graph->size] = newV; // 将新顶点加入邻接表
        graph->size++;
    }

    /* 删除顶点 */
    void removeVertex(GraphAdjList *graph, unsigned int index) {
        // 越界检查
        if (index < 0 || index >= graph->size) {
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            exit(1);
        }
        Vertex *vet = graph->vertices[index]; // 查找待删节点
        if (vet == 0) {                       // 若不存在该节点，则返回
            printf("index is:%d\n", index);
            printf("Out of range in %s:%d\n", __FILE__, __LINE__);
            return;
        }
        // 遍历待删除顶点的链表，将所有与待删除结点有关的边删除
        Node *temp = vet->list->head->next;
        while (temp != 0) {
            removeLink(temp->val->list, vet); // 删除与该顶点有关的边
            temp = temp->next;
        }
        // 将顶点前移
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1]; // 顶点前移
            graph->vertices[i]->pos--;                   // 所有前移的顶点索引值减1
        }
        graph->vertices[graph->size - 1] = 0; // 将被删除顶点的位置置 0
        graph->size--;
        // 释放内存
        freeVertex(vet);
    }

    /* 打印顶点与邻接矩阵 */
    void printGraph(GraphAdjList *graph) {
        printf("邻接表  =\n");
        for (int i = 0; i < graph->size; i++) {
            Node *n = graph->vertices[i]->list->head->next;
            printf("%d: [", graph->vertices[i]->val);
            while (n != 0) {
                if (n->next != 0) {
                    printf("%d, ", n->val->val);
                } else {
                    printf("%d", n->val->val);
                }
                n = n->next;
            }
            printf("]\n");
        }
    }

    /* 构造函数 */
    GraphAdjList *newGraphAdjList(unsigned int verticesCapacity) {
        // 申请内存
        GraphAdjList *newGraph = (GraphAdjList *)malloc(sizeof(GraphAdjList));
        // 建立顶点表并分配内存
        newGraph->vertices = (Vertex **)malloc(sizeof(Vertex *) * verticesCapacity); // 为顶点列表分配内存
        memset(newGraph->vertices, 0, sizeof(Vertex *) * verticesCapacity);          // 顶点列表置 0
        newGraph->size = 0;                                                          // 初始化顶点数量
        newGraph->capacity = verticesCapacity;                                       // 初始化顶点容量
        // 返回图指针
        return newGraph;
    }
    ```

=== "Zig"

    ```zig title="graph_adjacency_list.zig"
    [class]{GraphAdjList}-[func]{}
    ```

## 9.2.3 &nbsp; 效率对比

设图中共有 $n$ 个顶点和 $m$ 条边，表 9-2 对比了邻接矩阵和邻接表的时间和空间效率。

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

观察表 9-2 ，似乎邻接表（哈希表）的时间与空间效率最优。但实际上，在邻接矩阵中操作边的效率更高，只需要一次数组访问或赋值操作即可。综合来看，邻接矩阵体现了“以空间换时间”的原则，而邻接表体现了“以时间换空间”的原则。
