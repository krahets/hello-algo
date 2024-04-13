---
comments: true
---

# 9.2 &nbsp; 圖的基礎操作

圖的基礎操作可分為對“邊”的操作和對“頂點”的操作。在“鄰接矩陣”和“鄰接表”兩種表示方法下，實現方式有所不同。

## 9.2.1 &nbsp; 基於鄰接矩陣的實現

給定一個頂點數量為 $n$ 的無向圖，則各種操作的實現方式如圖 9-7 所示。

- **新增或刪除邊**：直接在鄰接矩陣中修改指定的邊即可，使用 $O(1)$ 時間。而由於是無向圖，因此需要同時更新兩個方向的邊。
- **新增頂點**：在鄰接矩陣的尾部新增一行一列，並全部填 $0$ 即可，使用 $O(n)$ 時間。
- **刪除頂點**：在鄰接矩陣中刪除一行一列。當刪除首行首列時達到最差情況，需要將 $(n-1)^2$ 個元素“向左上移動”，從而使用 $O(n^2)$ 時間。
- **初始化**：傳入 $n$ 個頂點，初始化長度為 $n$ 的頂點串列 `vertices` ，使用 $O(n)$ 時間；初始化 $n \times n$ 大小的鄰接矩陣 `adjMat` ，使用 $O(n^2)$ 時間。

=== "初始化鄰接矩陣"
    ![鄰接矩陣的初始化、增刪邊、增刪頂點](graph_operations.assets/adjacency_matrix_step1_initialization.png){ class="animation-figure" }

=== "新增邊"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.png){ class="animation-figure" }

=== "刪除邊"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.png){ class="animation-figure" }

=== "新增頂點"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.png){ class="animation-figure" }

=== "刪除頂點"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> 圖 9-7 &nbsp; 鄰接矩陣的初始化、增刪邊、增刪頂點 </p>

以下是基於鄰接矩陣表示圖的實現程式碼：

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """基於鄰接矩陣實現的無向圖類別"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """建構子"""
            # 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
            self.vertices: list[int] = []
            # 鄰接矩陣，行列索引對應“頂點索引”
            self.adj_mat: list[list[int]] = []
            # 新增頂點
            for val in vertices:
                self.add_vertex(val)
            # 新增邊
            # 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """獲取頂點數量"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """新增頂點"""
            n = self.size()
            # 向頂點串列中新增新頂點的值
            self.vertices.append(val)
            # 在鄰接矩陣中新增一行
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # 在鄰接矩陣中新增一列
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """刪除頂點"""
            if index >= self.size():
                raise IndexError()
            # 在頂點串列中移除索引 index 的頂點
            self.vertices.pop(index)
            # 在鄰接矩陣中刪除索引 index 的行
            self.adj_mat.pop(index)
            # 在鄰接矩陣中刪除索引 index 的列
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """新增邊"""
            # 參數 i, j 對應 vertices 元素索引
            # 索引越界與相等處理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """刪除邊"""
            # 參數 i, j 對應 vertices 元素索引
            # 索引越界與相等處理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            self.adj_mat[i][j] = 0
            self.adj_mat[j][i] = 0

        def print(self):
            """列印鄰接矩陣"""
            print("頂點串列 =", self.vertices)
            print("鄰接矩陣 =")
            print_matrix(self.adj_mat)
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
        vector<int> vertices;       // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        vector<vector<int>> adjMat; // 鄰接矩陣，行列索引對應“頂點索引”

      public:
        /* 建構子 */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // 新增頂點
            for (int val : vertices) {
                addVertex(val);
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for (const vector<int> &edge : edges) {
                addEdge(edge[0], edge[1]);
            }
        }

        /* 獲取頂點數量 */
        int size() const {
            return vertices.size();
        }

        /* 新增頂點 */
        void addVertex(int val) {
            int n = size();
            // 向頂點串列中新增新頂點的值
            vertices.push_back(val);
            // 在鄰接矩陣中新增一行
            adjMat.emplace_back(vector<int>(n, 0));
            // 在鄰接矩陣中新增一列
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* 刪除頂點 */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("頂點不存在");
            }
            // 在頂點串列中移除索引 index 的頂點
            vertices.erase(vertices.begin() + index);
            // 在鄰接矩陣中刪除索引 index 的行
            adjMat.erase(adjMat.begin() + index);
            // 在鄰接矩陣中刪除索引 index 的列
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        void addEdge(int i, int j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("頂點不存在");
            }
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        void removeEdge(int i, int j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("頂點不存在");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 列印鄰接矩陣 */
        void print() {
            cout << "頂點串列 = ";
            printVector(vertices);
            cout << "鄰接矩陣 =" << endl;
            printVectorMatrix(adjMat);
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
        List<Integer> vertices; // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        List<List<Integer>> adjMat; // 鄰接矩陣，行列索引對應“頂點索引”

        /* 建構子 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // 新增頂點
            for (int val : vertices) {
                addVertex(val);
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for (int[] e : edges) {
                addEdge(e[0], e[1]);
            }
        }

        /* 獲取頂點數量 */
        public int size() {
            return vertices.size();
        }

        /* 新增頂點 */
        public void addVertex(int val) {
            int n = size();
            // 向頂點串列中新增新頂點的值
            vertices.add(val);
            // 在鄰接矩陣中新增一行
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // 在鄰接矩陣中新增一列
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* 刪除頂點 */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // 在頂點串列中移除索引 index 的頂點
            vertices.remove(index);
            // 在鄰接矩陣中刪除索引 index 的行
            adjMat.remove(index);
            // 在鄰接矩陣中刪除索引 index 的列
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        public void addEdge(int i, int j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        public void removeEdge(int i, int j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            adjMat.get(i).set(j, 0);
            adjMat.get(j).set(i, 0);
        }

        /* 列印鄰接矩陣 */
        public void print() {
            System.out.print("頂點串列 = ");
            System.out.println(vertices);
            System.out.println("鄰接矩陣 =");
            PrintUtil.printMatrix(adjMat);
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
        List<int> vertices;     // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        List<List<int>> adjMat; // 鄰接矩陣，行列索引對應“頂點索引”

        /* 建構子 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = [];
            this.adjMat = [];
            // 新增頂點
            foreach (int val in vertices) {
                AddVertex(val);
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            foreach (int[] e in edges) {
                AddEdge(e[0], e[1]);
            }
        }

        /* 獲取頂點數量 */
        int Size() {
            return vertices.Count;
        }

        /* 新增頂點 */
        public void AddVertex(int val) {
            int n = Size();
            // 向頂點串列中新增新頂點的值
            vertices.Add(val);
            // 在鄰接矩陣中新增一行
            List<int> newRow = new(n);
            for (int j = 0; j < n; j++) {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // 在鄰接矩陣中新增一列
            foreach (List<int> row in adjMat) {
                row.Add(0);
            }
        }

        /* 刪除頂點 */
        public void RemoveVertex(int index) {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // 在頂點串列中移除索引 index 的頂點
            vertices.RemoveAt(index);
            // 在鄰接矩陣中刪除索引 index 的行
            adjMat.RemoveAt(index);
            // 在鄰接矩陣中刪除索引 index 的列
            foreach (List<int> row in adjMat) {
                row.RemoveAt(index);
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        public void AddEdge(int i, int j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        public void RemoveEdge(int i, int j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 列印鄰接矩陣 */
        public void Print() {
            Console.Write("頂點串列 = ");
            PrintUtil.PrintList(vertices);
            Console.WriteLine("鄰接矩陣 =");
            PrintUtil.PrintMatrix(adjMat);
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    /* 基於鄰接矩陣實現的無向圖類別 */
    type graphAdjMat struct {
        // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        vertices []int
        // 鄰接矩陣，行列索引對應“頂點索引”
        adjMat [][]int
    }

    /* 建構子 */
    func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
        // 新增頂點
        n := len(vertices)
        adjMat := make([][]int, n)
        for i := range adjMat {
            adjMat[i] = make([]int, n)
        }
        // 初始化圖
        g := &graphAdjMat{
            vertices: vertices,
            adjMat:   adjMat,
        }
        // 新增邊
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        for i := range edges {
            g.addEdge(edges[i][0], edges[i][1])
        }
        return g
    }

    /* 獲取頂點數量 */
    func (g *graphAdjMat) size() int {
        return len(g.vertices)
    }

    /* 新增頂點 */
    func (g *graphAdjMat) addVertex(val int) {
        n := g.size()
        // 向頂點串列中新增新頂點的值
        g.vertices = append(g.vertices, val)
        // 在鄰接矩陣中新增一行
        newRow := make([]int, n)
        g.adjMat = append(g.adjMat, newRow)
        // 在鄰接矩陣中新增一列
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i], 0)
        }
    }

    /* 刪除頂點 */
    func (g *graphAdjMat) removeVertex(index int) {
        if index >= g.size() {
            return
        }
        // 在頂點串列中移除索引 index 的頂點
        g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
        // 在鄰接矩陣中刪除索引 index 的行
        g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
        // 在鄰接矩陣中刪除索引 index 的列
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
        }
    }

    /* 新增邊 */
    // 參數 i, j 對應 vertices 元素索引
    func (g *graphAdjMat) addEdge(i, j int) {
        // 索引越界與相等處理
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
        g.adjMat[i][j] = 1
        g.adjMat[j][i] = 1
    }

    /* 刪除邊 */
    // 參數 i, j 對應 vertices 元素索引
    func (g *graphAdjMat) removeEdge(i, j int) {
        // 索引越界與相等處理
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        g.adjMat[i][j] = 0
        g.adjMat[j][i] = 0
    }

    /* 列印鄰接矩陣 */
    func (g *graphAdjMat) print() {
        fmt.Printf("\t頂點串列 = %v\n", g.vertices)
        fmt.Printf("\t鄰接矩陣 = \n")
        for i := range g.adjMat {
            fmt.Printf("\t\t\t%v\n", g.adjMat[i])
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
        private var vertices: [Int] // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        private var adjMat: [[Int]] // 鄰接矩陣，行列索引對應“頂點索引”

        /* 建構子 */
        init(vertices: [Int], edges: [[Int]]) {
            self.vertices = []
            adjMat = []
            // 新增頂點
            for val in vertices {
                addVertex(val: val)
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for e in edges {
                addEdge(i: e[0], j: e[1])
            }
        }

        /* 獲取頂點數量 */
        func size() -> Int {
            vertices.count
        }

        /* 新增頂點 */
        func addVertex(val: Int) {
            let n = size()
            // 向頂點串列中新增新頂點的值
            vertices.append(val)
            // 在鄰接矩陣中新增一行
            let newRow = Array(repeating: 0, count: n)
            adjMat.append(newRow)
            // 在鄰接矩陣中新增一列
            for i in adjMat.indices {
                adjMat[i].append(0)
            }
        }

        /* 刪除頂點 */
        func removeVertex(index: Int) {
            if index >= size() {
                fatalError("越界")
            }
            // 在頂點串列中移除索引 index 的頂點
            vertices.remove(at: index)
            // 在鄰接矩陣中刪除索引 index 的行
            adjMat.remove(at: index)
            // 在鄰接矩陣中刪除索引 index 的列
            for i in adjMat.indices {
                adjMat[i].remove(at: index)
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        func addEdge(i: Int, j: Int) {
            // 索引越界與相等處理
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("越界")
            }
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        func removeEdge(i: Int, j: Int) {
            // 索引越界與相等處理
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("越界")
            }
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 列印鄰接矩陣 */
        func print() {
            Swift.print("頂點串列 = ", terminator: "")
            Swift.print(vertices)
            Swift.print("鄰接矩陣 =")
            PrintUtil.printMatrix(matrix: adjMat)
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
        vertices; // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        adjMat; // 鄰接矩陣，行列索引對應“頂點索引”

        /* 建構子 */
        constructor(vertices, edges) {
            this.vertices = [];
            this.adjMat = [];
            // 新增頂點
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 獲取頂點數量 */
        size() {
            return this.vertices.length;
        }

        /* 新增頂點 */
        addVertex(val) {
            const n = this.size();
            // 向頂點串列中新增新頂點的值
            this.vertices.push(val);
            // 在鄰接矩陣中新增一行
            const newRow = [];
            for (let j = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 在鄰接矩陣中新增一列
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 刪除頂點 */
        removeVertex(index) {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在頂點串列中移除索引 index 的頂點
            this.vertices.splice(index, 1);

            // 在鄰接矩陣中刪除索引 index 的行
            this.adjMat.splice(index, 1);
            // 在鄰接矩陣中刪除索引 index 的列
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        addEdge(i, j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        removeEdge(i, j) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 列印鄰接矩陣 */
        print() {
            console.log('頂點串列 = ', this.vertices);
            console.log('鄰接矩陣 =', this.adjMat);
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
        vertices: number[]; // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        adjMat: number[][]; // 鄰接矩陣，行列索引對應“頂點索引”

        /* 建構子 */
        constructor(vertices: number[], edges: number[][]) {
            this.vertices = [];
            this.adjMat = [];
            // 新增頂點
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 獲取頂點數量 */
        size(): number {
            return this.vertices.length;
        }

        /* 新增頂點 */
        addVertex(val: number): void {
            const n: number = this.size();
            // 向頂點串列中新增新頂點的值
            this.vertices.push(val);
            // 在鄰接矩陣中新增一行
            const newRow: number[] = [];
            for (let j: number = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 在鄰接矩陣中新增一列
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 刪除頂點 */
        removeVertex(index: number): void {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在頂點串列中移除索引 index 的頂點
            this.vertices.splice(index, 1);

            // 在鄰接矩陣中刪除索引 index 的行
            this.adjMat.splice(index, 1);
            // 在鄰接矩陣中刪除索引 index 的列
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        addEdge(i: number, j: number): void {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        removeEdge(i: number, j: number): void {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 列印鄰接矩陣 */
        print(): void {
            console.log('頂點串列 = ', this.vertices);
            console.log('鄰接矩陣 =', this.adjMat);
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat {
      List<int> vertices = []; // 頂點元素，元素代表“頂點值”，索引代表“頂點索引”
      List<List<int>> adjMat = []; //鄰接矩陣，行列索引對應“頂點索引”

      /* 建構子 */
      GraphAdjMat(List<int> vertices, List<List<int>> edges) {
        this.vertices = [];
        this.adjMat = [];
        // 新增頂點
        for (int val in vertices) {
          addVertex(val);
        }
        // 新增邊
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        for (List<int> e in edges) {
          addEdge(e[0], e[1]);
        }
      }

      /* 獲取頂點數量 */
      int size() {
        return vertices.length;
      }

      /* 新增頂點 */
      void addVertex(int val) {
        int n = size();
        // 向頂點串列中新增新頂點的值
        vertices.add(val);
        // 在鄰接矩陣中新增一行
        List<int> newRow = List.filled(n, 0, growable: true);
        adjMat.add(newRow);
        // 在鄰接矩陣中新增一列
        for (List<int> row in adjMat) {
          row.add(0);
        }
      }

      /* 刪除頂點 */
      void removeVertex(int index) {
        if (index >= size()) {
          throw IndexError;
        }
        // 在頂點串列中移除索引 index 的頂點
        vertices.removeAt(index);
        // 在鄰接矩陣中刪除索引 index 的行
        adjMat.removeAt(index);
        // 在鄰接矩陣中刪除索引 index 的列
        for (List<int> row in adjMat) {
          row.removeAt(index);
        }
      }

      /* 新增邊 */
      // 參數 i, j 對應 vertices 元素索引
      void addEdge(int i, int j) {
        // 索引越界與相等處理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
      }

      /* 刪除邊 */
      // 參數 i, j 對應 vertices 元素索引
      void removeEdge(int i, int j) {
        // 索引越界與相等處理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
      }

      /* 列印鄰接矩陣 */
      void printAdjMat() {
        print("頂點串列 = $vertices");
        print("鄰接矩陣 = ");
        printMatrix(adjMat);
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    /* 基於鄰接矩陣實現的無向圖型別 */
    pub struct GraphAdjMat {
        // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        pub vertices: Vec<i32>,
        // 鄰接矩陣，行列索引對應“頂點索引”
        pub adj_mat: Vec<Vec<i32>>,
    }

    impl GraphAdjMat {
        /* 建構子 */
        pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
            let mut graph = GraphAdjMat {
                vertices: vec![],
                adj_mat: vec![],
            };
            // 新增頂點
            for val in vertices {
                graph.add_vertex(val);
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for edge in edges {
                graph.add_edge(edge[0], edge[1])
            }

            graph
        }

        /* 獲取頂點數量 */
        pub fn size(&self) -> usize {
            self.vertices.len()
        }

        /* 新增頂點 */
        pub fn add_vertex(&mut self, val: i32) {
            let n = self.size();
            // 向頂點串列中新增新頂點的值
            self.vertices.push(val);
            // 在鄰接矩陣中新增一行
            self.adj_mat.push(vec![0; n]);
            // 在鄰接矩陣中新增一列
            for row in &mut self.adj_mat {
                row.push(0);
            }
        }

        /* 刪除頂點 */
        pub fn remove_vertex(&mut self, index: usize) {
            if index >= self.size() {
                panic!("index error")
            }
            // 在頂點串列中移除索引 index 的頂點
            self.vertices.remove(index);
            // 在鄰接矩陣中刪除索引 index 的行
            self.adj_mat.remove(index);
            // 在鄰接矩陣中刪除索引 index 的列
            for row in &mut self.adj_mat {
                row.remove(index);
            }
        }

        /* 新增邊 */
        pub fn add_edge(&mut self, i: usize, j: usize) {
            // 參數 i, j 對應 vertices 元素索引
            // 索引越界與相等處理
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            self.adj_mat[i][j] = 1;
            self.adj_mat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        pub fn remove_edge(&mut self, i: usize, j: usize) {
            // 參數 i, j 對應 vertices 元素索引
            // 索引越界與相等處理
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            self.adj_mat[i][j] = 0;
            self.adj_mat[j][i] = 0;
        }

        /* 列印鄰接矩陣 */
        pub fn print(&self) {
            println!("頂點串列 = {:?}", self.vertices);
            println!("鄰接矩陣 =");
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
    /* 基於鄰接矩陣實現的無向圖結構體 */
    typedef struct {
        int vertices[MAX_SIZE];
        int adjMat[MAX_SIZE][MAX_SIZE];
        int size;
    } GraphAdjMat;

    /* 建構子 */
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

    /* 析構函式 */
    void delGraphAdjMat(GraphAdjMat *graph) {
        free(graph);
    }

    /* 新增頂點 */
    void addVertex(GraphAdjMat *graph, int val) {
        if (graph->size == MAX_SIZE) {
            fprintf(stderr, "圖的頂點數量已達最大值\n");
            return;
        }
        // 新增第 n 個頂點，並將第 n 行和列置零
        int n = graph->size;
        graph->vertices[n] = val;
        for (int i = 0; i <= n; i++) {
            graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
        }
        graph->size++;
    }

    /* 刪除頂點 */
    void removeVertex(GraphAdjMat *graph, int index) {
        if (index < 0 || index >= graph->size) {
            fprintf(stderr, "頂點索引越界\n");
            return;
        }
        // 在頂點串列中移除索引 index 的頂點
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1];
        }
        // 在鄰接矩陣中刪除索引 index 的行
        for (int i = index; i < graph->size - 1; i++) {
            for (int j = 0; j < graph->size; j++) {
                graph->adjMat[i][j] = graph->adjMat[i + 1][j];
            }
        }
        // 在鄰接矩陣中刪除索引 index 的列
        for (int i = 0; i < graph->size; i++) {
            for (int j = index; j < graph->size - 1; j++) {
                graph->adjMat[i][j] = graph->adjMat[i][j + 1];
            }
        }
        graph->size--;
    }

    /* 新增邊 */
    // 參數 i, j 對應 vertices 元素索引
    void addEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "邊索引越界或相等\n");
            return;
        }
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i, j 對應 vertices 元素索引
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "邊索引越界或相等\n");
            return;
        }
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* 列印鄰接矩陣 */
    void printGraphAdjMat(GraphAdjMat *graph) {
        printf("頂點串列 = ");
        printArray(graph->vertices, graph->size);
        printf("鄰接矩陣 =\n");
        for (int i = 0; i < graph->size; i++) {
            printArray(graph->adjMat[i], graph->size);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_matrix.kt"
    /* 基於鄰接矩陣實現的無向圖類別 */
    class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
        val vertices = mutableListOf<Int>() // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
        val adjMat = mutableListOf<MutableList<Int>>() // 鄰接矩陣，行列索引對應“頂點索引”

        /* 建構子 */
        init {
            // 新增頂點
            for (vertex in vertices) {
                addVertex(vertex)
            }
            // 新增邊
            // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
            for (edge in edges) {
                addEdge(edge[0], edge[1])
            }
        }

        /* 獲取頂點數量 */
        fun size(): Int {
            return vertices.size
        }

        /* 新增頂點 */
        fun addVertex(_val: Int) {
            val n = size()
            // 向頂點串列中新增新頂點的值
            vertices.add(_val)
            // 在鄰接矩陣中新增一行
            val newRow = mutableListOf<Int>()
            for (j in 0..<n) {
                newRow.add(0)
            }
            adjMat.add(newRow)
            // 在鄰接矩陣中新增一列
            for (row in adjMat) {
                row.add(0)
            }
        }

        /* 刪除頂點 */
        fun removeVertex(index: Int) {
            if (index >= size())
                throw IndexOutOfBoundsException()
            // 在頂點串列中移除索引 index 的頂點
            vertices.removeAt(index)
            // 在鄰接矩陣中刪除索引 index 的行
            adjMat.removeAt(index)
            // 在鄰接矩陣中刪除索引 index 的列
            for (row in adjMat) {
                row.removeAt(index)
            }
        }

        /* 新增邊 */
        // 參數 i, j 對應 vertices 元素索引
        fun addEdge(i: Int, j: Int) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 刪除邊 */
        // 參數 i, j 對應 vertices 元素索引
        fun removeEdge(i: Int, j: Int) {
            // 索引越界與相等處理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 列印鄰接矩陣 */
        fun print() {
            print("頂點串列 = ")
            println(vertices)
            println("鄰接矩陣 =")
            printMatrix(adjMat)
        }
    }
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_matrix.rb"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Zig"

    ```zig title="graph_adjacency_matrix.zig"
    [class]{GraphAdjMat}-[func]{}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%96%BC%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E5%AF%A6%E7%8F%BE%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20vertices%3A%20list%5Bint%5D%2C%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D%2C%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%91%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%E4%B8%AD%E6%96%B0%E5%A2%9E%E6%96%B0%E9%A0%82%E9%BB%9E%E7%9A%84%E5%80%BC%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E8%A1%8C%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%E4%B8%AD%E7%A7%BB%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E9%A0%82%E9%BB%9E%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E8%A1%8C%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E8%88%87%E7%9B%B8%E7%AD%89%E8%99%95%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E8%88%87%E7%9B%B8%E7%AD%89%E8%99%95%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20%20%20vertices%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0%2C%201%5D%2C%20%5B0%2C%203%5D%2C%20%5B1%2C%202%5D%2C%20%5B2%2C%203%5D%2C%20%5B2%2C%204%5D%2C%20%5B3%2C%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices%2C%20edges%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20%23%20%E9%A0%82%E9%BB%9E%201%2C%202%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%2C%202%0A%20%20%20%20graph.add_edge%280%2C%202%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%20%20%23%20%E9%A0%82%E9%BB%9E%201%2C%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%2C%201%0A%20%20%20%20graph.remove_edge%280%2C%201%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20graph.add_vertex%286%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%20%20%23%20%E9%A0%82%E9%BB%9E%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%201%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%96%BC%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E5%AF%A6%E7%8F%BE%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20vertices%3A%20list%5Bint%5D%2C%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D%2C%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%91%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%E4%B8%AD%E6%96%B0%E5%A2%9E%E6%96%B0%E9%A0%82%E9%BB%9E%E7%9A%84%E5%80%BC%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E8%A1%8C%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%E4%B8%AD%E7%A7%BB%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E9%A0%82%E9%BB%9E%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E8%A1%8C%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%20index%20%E7%9A%84%E5%88%97%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E8%88%87%E7%9B%B8%E7%AD%89%E8%99%95%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%B4%A2%E5%BC%95%E8%B6%8A%E7%95%8C%E8%88%87%E7%9B%B8%E7%AD%89%E8%99%95%E7%90%86%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20%20%20vertices%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0%2C%201%5D%2C%20%5B0%2C%203%5D%2C%20%5B1%2C%202%5D%2C%20%5B2%2C%203%5D%2C%20%5B2%2C%204%5D%2C%20%5B3%2C%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices%2C%20edges%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20%23%20%E9%A0%82%E9%BB%9E%201%2C%202%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%2C%202%0A%20%20%20%20graph.add_edge%280%2C%202%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%20%20%23%20%E9%A0%82%E9%BB%9E%201%2C%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%2C%201%0A%20%20%20%20graph.remove_edge%280%2C%201%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20graph.add_vertex%286%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%20%20%23%20%E9%A0%82%E9%BB%9E%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%201%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 9.2.2 &nbsp; 基於鄰接表的實現

設無向圖的頂點總數為 $n$、邊總數為 $m$ ，則可根據圖 9-8 所示的方法實現各種操作。

- **新增邊**：在頂點對應鏈結串列的末尾新增邊即可，使用 $O(1)$ 時間。因為是無向圖，所以需要同時新增兩個方向的邊。
- **刪除邊**：在頂點對應鏈結串列中查詢並刪除指定邊，使用 $O(m)$ 時間。在無向圖中，需要同時刪除兩個方向的邊。
- **新增頂點**：在鄰接表中新增一個鏈結串列，並將新增頂點作為鏈結串列頭節點，使用 $O(1)$ 時間。
- **刪除頂點**：需走訪整個鄰接表，刪除包含指定頂點的所有邊，使用 $O(n + m)$ 時間。
- **初始化**：在鄰接表中建立 $n$ 個頂點和 $2m$ 條邊，使用 $O(n + m)$ 時間。

=== "初始化鄰接表"
    ![鄰接表的初始化、增刪邊、增刪頂點](graph_operations.assets/adjacency_list_step1_initialization.png){ class="animation-figure" }

=== "新增邊"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.png){ class="animation-figure" }

=== "刪除邊"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.png){ class="animation-figure" }

=== "新增頂點"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.png){ class="animation-figure" }

=== "刪除頂點"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> 圖 9-8 &nbsp; 鄰接表的初始化、增刪邊、增刪頂點 </p>

以下是鄰接表的程式碼實現。對比圖 9-8 ，實際程式碼有以下不同。

- 為了方便新增與刪除頂點，以及簡化程式碼，我們使用串列（動態陣列）來代替鏈結串列。
- 使用雜湊表來儲存鄰接表，`key` 為頂點例項，`value` 為該頂點的鄰接頂點串列（鏈結串列）。

另外，我們在鄰接表中使用 `Vertex` 類別來表示頂點，這樣做的原因是：如果與鄰接矩陣一樣，用串列索引來區分不同頂點，那麼假設要刪除索引為 $i$ 的頂點，則需走訪整個鄰接表，將所有大於 $i$ 的索引全部減 $1$ ，效率很低。而如果每個頂點都是唯一的 `Vertex` 例項，刪除某一頂點之後就無須改動其他頂點了。

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """基於鄰接表實現的無向圖類別"""

        def __init__(self, edges: list[list[Vertex]]):
            """建構子"""
            # 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
            self.adj_list = dict[Vertex, list[Vertex]]()
            # 新增所有頂點和邊
            for edge in edges:
                self.add_vertex(edge[0])
                self.add_vertex(edge[1])
                self.add_edge(edge[0], edge[1])

        def size(self) -> int:
            """獲取頂點數量"""
            return len(self.adj_list)

        def add_edge(self, vet1: Vertex, vet2: Vertex):
            """新增邊"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # 新增邊 vet1 - vet2
            self.adj_list[vet1].append(vet2)
            self.adj_list[vet2].append(vet1)

        def remove_edge(self, vet1: Vertex, vet2: Vertex):
            """刪除邊"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # 刪除邊 vet1 - vet2
            self.adj_list[vet1].remove(vet2)
            self.adj_list[vet2].remove(vet1)

        def add_vertex(self, vet: Vertex):
            """新增頂點"""
            if vet in self.adj_list:
                return
            # 在鄰接表中新增一個新鏈結串列
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """刪除頂點"""
            if vet not in self.adj_list:
                raise ValueError()
            # 在鄰接表中刪除頂點 vet 對應的鏈結串列
            self.adj_list.pop(vet)
            # 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for vertex in self.adj_list:
                if vet in self.adj_list[vertex]:
                    self.adj_list[vertex].remove(vet)

        def print(self):
            """列印鄰接表"""
            print("鄰接表 =")
            for vertex in self.adj_list:
                tmp = [v.val for v in self.adj_list[vertex]]
                print(f"{vertex.val}: {tmp},")
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
      public:
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* 在 vector 中刪除指定節點 */
        void remove(vector<Vertex *> &vec, Vertex *vet) {
            for (int i = 0; i < vec.size(); i++) {
                if (vec[i] == vet) {
                    vec.erase(vec.begin() + i);
                    break;
                }
            }
        }

        /* 建構子 */
        GraphAdjList(const vector<vector<Vertex *>> &edges) {
            // 新增所有頂點和邊
            for (const vector<Vertex *> &edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 獲取頂點數量 */
        int size() {
            return adjList.size();
        }

        /* 新增邊 */
        void addEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("不存在頂點");
            // 新增邊 vet1 - vet2
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* 刪除邊 */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("不存在頂點");
            // 刪除邊 vet1 - vet2
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* 新增頂點 */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // 在鄰接表中新增一個新鏈結串列
            adjList[vet] = vector<Vertex *>();
        }

        /* 刪除頂點 */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("不存在頂點");
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            adjList.erase(vet);
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* 列印鄰接表 */
        void print() {
            cout << "鄰接表 =" << endl;
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
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        Map<Vertex, List<Vertex>> adjList;

        /* 建構子 */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new HashMap<>();
            // 新增所有頂點和邊
            for (Vertex[] edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 獲取頂點數量 */
        public int size() {
            return adjList.size();
        }

        /* 新增邊 */
        public void addEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // 新增邊 vet1 - vet2
            adjList.get(vet1).add(vet2);
            adjList.get(vet2).add(vet1);
        }

        /* 刪除邊 */
        public void removeEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // 刪除邊 vet1 - vet2
            adjList.get(vet1).remove(vet2);
            adjList.get(vet2).remove(vet1);
        }

        /* 新增頂點 */
        public void addVertex(Vertex vet) {
            if (adjList.containsKey(vet))
                return;
            // 在鄰接表中新增一個新鏈結串列
            adjList.put(vet, new ArrayList<>());
        }

        /* 刪除頂點 */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            adjList.remove(vet);
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for (List<Vertex> list : adjList.values()) {
                list.remove(vet);
            }
        }

        /* 列印鄰接表 */
        public void print() {
            System.out.println("鄰接表 =");
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
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* 建構子 */
        public GraphAdjList(Vertex[][] edges) {
            adjList = [];
            // 新增所有頂點和邊
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* 獲取頂點數量 */
        int Size() {
            return adjList.Count;
        }

        /* 新增邊 */
        public void AddEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 新增邊 vet1 - vet2
            adjList[vet1].Add(vet2);
            adjList[vet2].Add(vet1);
        }

        /* 刪除邊 */
        public void RemoveEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 刪除邊 vet1 - vet2
            adjList[vet1].Remove(vet2);
            adjList[vet2].Remove(vet1);
        }

        /* 新增頂點 */
        public void AddVertex(Vertex vet) {
            if (adjList.ContainsKey(vet))
                return;
            // 在鄰接表中新增一個新鏈結串列
            adjList.Add(vet, []);
        }

        /* 刪除頂點 */
        public void RemoveVertex(Vertex vet) {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            adjList.Remove(vet);
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            foreach (List<Vertex> list in adjList.Values) {
                list.Remove(vet);
            }
        }

        /* 列印鄰接表 */
        public void Print() {
            Console.WriteLine("鄰接表 =");
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
    /* 基於鄰接表實現的無向圖類別 */
    type graphAdjList struct {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        adjList map[Vertex][]Vertex
    }

    /* 建構子 */
    func newGraphAdjList(edges [][]Vertex) *graphAdjList {
        g := &graphAdjList{
            adjList: make(map[Vertex][]Vertex),
        }
        // 新增所有頂點和邊
        for _, edge := range edges {
            g.addVertex(edge[0])
            g.addVertex(edge[1])
            g.addEdge(edge[0], edge[1])
        }
        return g
    }

    /* 獲取頂點數量 */
    func (g *graphAdjList) size() int {
        return len(g.adjList)
    }

    /* 新增邊 */
    func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // 新增邊 vet1 - vet2, 新增匿名 struct{},
        g.adjList[vet1] = append(g.adjList[vet1], vet2)
        g.adjList[vet2] = append(g.adjList[vet2], vet1)
    }

    /* 刪除邊 */
    func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // 刪除邊 vet1 - vet2
        g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
        g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
    }

    /* 新增頂點 */
    func (g *graphAdjList) addVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if ok {
            return
        }
        // 在鄰接表中新增一個新鏈結串列
        g.adjList[vet] = make([]Vertex, 0)
    }

    /* 刪除頂點 */
    func (g *graphAdjList) removeVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if !ok {
            panic("error")
        }
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        delete(g.adjList, vet)
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for v, list := range g.adjList {
            g.adjList[v] = DeleteSliceElms(list, vet)
        }
    }

    /* 列印鄰接表 */
    func (g *graphAdjList) print() {
        var builder strings.Builder
        fmt.Printf("鄰接表 = \n")
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
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        public private(set) var adjList: [Vertex: [Vertex]]

        /* 建構子 */
        public init(edges: [[Vertex]]) {
            adjList = [:]
            // 新增所有頂點和邊
            for edge in edges {
                addVertex(vet: edge[0])
                addVertex(vet: edge[1])
                addEdge(vet1: edge[0], vet2: edge[1])
            }
        }

        /* 獲取頂點數量 */
        public func size() -> Int {
            adjList.count
        }

        /* 新增邊 */
        public func addEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("參數錯誤")
            }
            // 新增邊 vet1 - vet2
            adjList[vet1]?.append(vet2)
            adjList[vet2]?.append(vet1)
        }

        /* 刪除邊 */
        public func removeEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("參數錯誤")
            }
            // 刪除邊 vet1 - vet2
            adjList[vet1]?.removeAll { $0 == vet2 }
            adjList[vet2]?.removeAll { $0 == vet1 }
        }

        /* 新增頂點 */
        public func addVertex(vet: Vertex) {
            if adjList[vet] != nil {
                return
            }
            // 在鄰接表中新增一個新鏈結串列
            adjList[vet] = []
        }

        /* 刪除頂點 */
        public func removeVertex(vet: Vertex) {
            if adjList[vet] == nil {
                fatalError("參數錯誤")
            }
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            adjList.removeValue(forKey: vet)
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for key in adjList.keys {
                adjList[key]?.removeAll { $0 == vet }
            }
        }

        /* 列印鄰接表 */
        public func print() {
            Swift.print("鄰接表 =")
            for (vertex, list) in adjList {
                let list = list.map { $0.val }
                Swift.print("\(vertex.val): \(list),")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        adjList;

        /* 建構子 */
        constructor(edges) {
            this.adjList = new Map();
            // 新增所有頂點和邊
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 獲取頂點數量 */
        size() {
            return this.adjList.size;
        }

        /* 新增邊 */
        addEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 新增邊 vet1 - vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* 刪除邊 */
        removeEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 刪除邊 vet1 - vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* 新增頂點 */
        addVertex(vet) {
            if (this.adjList.has(vet)) return;
            // 在鄰接表中新增一個新鏈結串列
            this.adjList.set(vet, []);
        }

        /* 刪除頂點 */
        removeVertex(vet) {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            this.adjList.delete(vet);
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for (const set of this.adjList.values()) {
                const index = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 列印鄰接表 */
        print() {
            console.log('鄰接表 =');
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
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        adjList: Map<Vertex, Vertex[]>;

        /* 建構子 */
        constructor(edges: Vertex[][]) {
            this.adjList = new Map();
            // 新增所有頂點和邊
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 獲取頂點數量 */
        size(): number {
            return this.adjList.size;
        }

        /* 新增邊 */
        addEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 新增邊 vet1 - vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* 刪除邊 */
        removeEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 刪除邊 vet1 - vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* 新增頂點 */
        addVertex(vet: Vertex): void {
            if (this.adjList.has(vet)) return;
            // 在鄰接表中新增一個新鏈結串列
            this.adjList.set(vet, []);
        }

        /* 刪除頂點 */
        removeVertex(vet: Vertex): void {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            this.adjList.delete(vet);
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for (const set of this.adjList.values()) {
                const index: number = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 列印鄰接表 */
        print(): void {
            console.log('鄰接表 =');
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
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList {
      // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
      Map<Vertex, List<Vertex>> adjList = {};

      /* 建構子 */
      GraphAdjList(List<List<Vertex>> edges) {
        for (List<Vertex> edge in edges) {
          addVertex(edge[0]);
          addVertex(edge[1]);
          addEdge(edge[0], edge[1]);
        }
      }

      /* 獲取頂點數量 */
      int size() {
        return adjList.length;
      }

      /* 新增邊 */
      void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // 新增邊 vet1 - vet2
        adjList[vet1]!.add(vet2);
        adjList[vet2]!.add(vet1);
      }

      /* 刪除邊 */
      void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // 刪除邊 vet1 - vet2
        adjList[vet1]!.remove(vet2);
        adjList[vet2]!.remove(vet1);
      }

      /* 新增頂點 */
      void addVertex(Vertex vet) {
        if (adjList.containsKey(vet)) return;
        // 在鄰接表中新增一個新鏈結串列
        adjList[vet] = [];
      }

      /* 刪除頂點 */
      void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet)) {
          throw ArgumentError;
        }
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        adjList.remove(vet);
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        adjList.forEach((key, value) {
          value.remove(vet);
        });
      }

      /* 列印鄰接表 */
      void printAdjList() {
        print("鄰接表 =");
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
    /* 基於鄰接表實現的無向圖型別 */
    pub struct GraphAdjList {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        pub adj_list: HashMap<Vertex, Vec<Vertex>>,
    }

    impl GraphAdjList {
        /* 建構子 */
        pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
            let mut graph = GraphAdjList {
                adj_list: HashMap::new(),
            };
            // 新增所有頂點和邊
            for edge in edges {
                graph.add_vertex(edge[0]);
                graph.add_vertex(edge[1]);
                graph.add_edge(edge[0], edge[1]);
            }

            graph
        }

        /* 獲取頂點數量 */
        #[allow(unused)]
        pub fn size(&self) -> usize {
            self.adj_list.len()
        }

        /* 新增邊 */
        pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
            {
                panic!("value error");
            }
            // 新增邊 vet1 - vet2
            self.adj_list.get_mut(&vet1).unwrap().push(vet2);
            self.adj_list.get_mut(&vet2).unwrap().push(vet1);
        }

        /* 刪除邊 */
        #[allow(unused)]
        pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
            {
                panic!("value error");
            }
            // 刪除邊 vet1 - vet2
            self.adj_list
                .get_mut(&vet1)
                .unwrap()
                .retain(|&vet| vet != vet2);
            self.adj_list
                .get_mut(&vet2)
                .unwrap()
                .retain(|&vet| vet != vet1);
        }

        /* 新增頂點 */
        pub fn add_vertex(&mut self, vet: Vertex) {
            if self.adj_list.contains_key(&vet) {
                return;
            }
            // 在鄰接表中新增一個新鏈結串列
            self.adj_list.insert(vet, vec![]);
        }

        /* 刪除頂點 */
        #[allow(unused)]
        pub fn remove_vertex(&mut self, vet: Vertex) {
            if !self.adj_list.contains_key(&vet) {
                panic!("value error");
            }
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            self.adj_list.remove(&vet);
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for list in self.adj_list.values_mut() {
                list.retain(|&v| v != vet);
            }
        }

        /* 列印鄰接表 */
        pub fn print(&self) {
            println!("鄰接表 =");
            for (vertex, list) in &self.adj_list {
                let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
                println!("{}: {:?},", vertex.val, list);
            }
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    /* 節點結構體 */
    typedef struct AdjListNode {
        Vertex *vertex;           // 頂點
        struct AdjListNode *next; // 後繼節點
    } AdjListNode;

    /* 查詢頂點對應的節點 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 新增邊輔助函式 */
    void addEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
        node->vertex = vet;
        // 頭插法
        node->next = head->next;
        head->next = node;
    }

    /* 刪除邊輔助函式 */
    void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *pre = head;
        AdjListNode *cur = head->next;
        // 在鏈結串列中搜索 vet 對應節點
        while (cur != NULL && cur->vertex != vet) {
            pre = cur;
            cur = cur->next;
        }
        if (cur == NULL)
            return;
        // 將 vet 對應節點從鏈結串列中刪除
        pre->next = cur->next;
        // 釋放記憶體
        free(cur);
    }

    /* 基於鄰接表實現的無向圖類別 */
    typedef struct {
        AdjListNode *heads[MAX_SIZE]; // 節點陣列
        int size;                     // 節點數量
    } GraphAdjList;

    /* 建構子 */
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

    /* 析構函式 */
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

    /* 查詢頂點對應的節點 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 新增邊 */
    void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL && head1 != head2);
        // 新增邊 vet1 - vet2
        addEdgeHelper(head1, vet2);
        addEdgeHelper(head2, vet1);
    }

    /* 刪除邊 */
    void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL);
        // 刪除邊 vet1 - vet2
        removeEdgeHelper(head1, head2->vertex);
        removeEdgeHelper(head2, head1->vertex);
    }

    /* 新增頂點 */
    void addVertex(GraphAdjList *graph, Vertex *vet) {
        assert(graph != NULL && graph->size < MAX_SIZE);
        AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
        head->vertex = vet;
        head->next = NULL;
        // 在鄰接表中新增一個新鏈結串列
        graph->heads[graph->size++] = head;
    }

    /* 刪除頂點 */
    void removeVertex(GraphAdjList *graph, Vertex *vet) {
        AdjListNode *node = findNode(graph, vet);
        assert(node != NULL);
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        AdjListNode *cur = node, *pre = NULL;
        while (cur) {
            pre = cur;
            cur = cur->next;
            free(pre);
        }
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
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
        // 將該頂點之後的頂點向前移動，以填補空缺
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

=== "Kotlin"

    ```kotlin title="graph_adjacency_list.kt"
    /* 基於鄰接表實現的無向圖類別 */
    class GraphAdjList(edges: Array<Array<Vertex?>>) {
        // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        val adjList = HashMap<Vertex, MutableList<Vertex>>()

        /* 建構子 */
        init {
            // 新增所有頂點和邊
            for (edge in edges) {
                addVertex(edge[0]!!)
                addVertex(edge[1]!!)
                addEdge(edge[0]!!, edge[1]!!)
            }
        }

        /* 獲取頂點數量 */
        fun size(): Int {
            return adjList.size
        }

        /* 新增邊 */
        fun addEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // 新增邊 vet1 - vet2
            adjList[vet1]?.add(vet2)
            adjList[vet2]?.add(vet1)
        }

        /* 刪除邊 */
        fun removeEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // 刪除邊 vet1 - vet2
            adjList[vet1]?.remove(vet2)
            adjList[vet2]?.remove(vet1)
        }

        /* 新增頂點 */
        fun addVertex(vet: Vertex) {
            if (adjList.containsKey(vet))
                return
            // 在鄰接表中新增一個新鏈結串列
            adjList[vet] = mutableListOf()
        }

        /* 刪除頂點 */
        fun removeVertex(vet: Vertex) {
            if (!adjList.containsKey(vet))
                throw IllegalArgumentException()
            // 在鄰接表中刪除頂點 vet 對應的鏈結串列
            adjList.remove(vet)
            // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
            for (list in adjList.values) {
                list.remove(vet)
            }
        }

        /* 列印鄰接表 */
        fun print() {
            println("鄰接表 =")
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
    [class]{GraphAdjList}-[func]{}
    ```

=== "Zig"

    ```zig title="graph_adjacency_list.zig"
    [class]{GraphAdjList}-[func]{}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BC%B8%E5%85%A5%E5%80%BC%E4%B8%B2%E5%88%97%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%96%BC%E9%84%B0%E6%8E%A5%E8%A1%A8%E5%AF%A6%E7%8F%BE%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E6%89%80%E6%9C%89%E9%A0%82%E9%BB%9E%E5%92%8C%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E8%A1%A8%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%80%8B%E6%96%B0%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E8%A1%A8%E4%B8%AD%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%20vet%20%E5%B0%8D%E6%87%89%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E5%85%B6%E4%BB%96%E9%A0%82%E9%BB%9E%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%EF%BC%8C%E5%88%AA%E9%99%A4%E6%89%80%E6%9C%89%E5%8C%85%E5%90%AB%20vet%20%E7%9A%84%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1%2C%203%2C%202%2C%205%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20graph.add_edge%28v%5B0%5D%2C%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%20%20graph.remove_edge%28v%5B0%5D%2C%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E8%BC%B8%E5%85%A5%E5%80%BC%E4%B8%B2%E5%88%97%20vals%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%96%BC%E9%84%B0%E6%8E%A5%E8%A1%A8%E5%AF%A6%E7%8F%BE%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E6%89%80%E6%9C%89%E9%A0%82%E9%BB%9E%E5%92%8C%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E8%A1%A8%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%80%8B%E6%96%B0%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E8%A1%A8%E4%B8%AD%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%20vet%20%E5%B0%8D%E6%87%89%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E5%85%B6%E4%BB%96%E9%A0%82%E9%BB%9E%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%EF%BC%8C%E5%88%AA%E9%99%A4%E6%89%80%E6%9C%89%E5%8C%85%E5%90%AB%20vet%20%E7%9A%84%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1%2C%203%2C%202%2C%205%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D%2C%20v%5B3%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%2C%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20graph.add_edge%28v%5B0%5D%2C%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%20%20graph.remove_edge%28v%5B0%5D%2C%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 9.2.3 &nbsp; 效率對比

設圖中共有 $n$ 個頂點和 $m$ 條邊，表 9-2 對比了鄰接矩陣和鄰接表的時間效率和空間效率。

<p align="center"> 表 9-2 &nbsp; 鄰接矩陣與鄰接表對比 </p>

<div class="center-table" markdown>

|              | 鄰接矩陣 | 鄰接表（鏈結串列） | 鄰接表（雜湊表） |
| ------------ | -------- | -------------- | ---------------- |
| 判斷是否鄰接 | $O(1)$   | $O(m)$         | $O(1)$           |
| 新增邊       | $O(1)$   | $O(1)$         | $O(1)$           |
| 刪除邊       | $O(1)$   | $O(m)$         | $O(1)$           |
| 新增頂點     | $O(n)$   | $O(1)$         | $O(1)$           |
| 刪除頂點     | $O(n^2)$ | $O(n + m)$     | $O(n)$           |
| 記憶體空間佔用 | $O(n^2)$ | $O(n + m)$     | $O(n + m)$       |

</div>

觀察表 9-2 ，似乎鄰接表（雜湊表）的時間效率與空間效率最優。但實際上，在鄰接矩陣中操作邊的效率更高，只需一次陣列訪問或賦值操作即可。綜合來看，鄰接矩陣體現了“以空間換時間”的原則，而鄰接表體現了“以時間換空間”的原則。
