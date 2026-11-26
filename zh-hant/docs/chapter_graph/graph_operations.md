---
comments: true
---

# 9.2 &nbsp; 圖的基本操作

圖的基本操作分別針對「邊」和「頂點」。採用「鄰接矩陣」或「鄰接串列」來表示圖時，這些操作的實作方式有所不同。

## 9.2.1 &nbsp; 以鄰接矩陣實作

給定一張有 $n$ 個頂點的無向圖，各項操作的實作方式如圖 9-7 所示。

- **新增或刪除邊**：直接修改鄰接矩陣中指定邊對應的元素即可，耗時 $O(1)$。由於是無向圖，必須同步更新兩個方向對應的元素。
- **新增頂點**：在鄰接矩陣的尾端各新增一個橫列和直行，全部填入 $0$ 即可，耗時 $O(n)$。
- **刪除頂點**：從鄰接矩陣中各刪除一個橫列和直行。最差情況是刪除第一個橫列與第一個直行，必須將 $(n-1)^2$ 個元素「往左上方移動」，耗時 $O(n^2)$。
- **初始化**：傳入 $n$ 個頂點，初始化長度為 $n$ 的頂點清單 `vertices`，耗時 $O(n)$。初始化大小為 $n \times n$ 的鄰接矩陣 `adjMat`，耗時 $O(n^2)$。

=== "<1>"
    ![鄰接矩陣的初始化、新增與刪除邊及頂點](graph_operations.assets/adjacency_matrix_step1_initialization.svg){ class="animation-figure" }

=== "<2>"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.svg){ class="animation-figure" }

=== "<3>"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.svg){ class="animation-figure" }

=== "<4>"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.svg){ class="animation-figure" }

=== "<5>"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.svg){ class="animation-figure" }

<p align="center"> 圖 9-7 &nbsp; 鄰接矩陣的初始化、新增與刪除邊及頂點 </p>

以下程式碼以鄰接矩陣實作圖：

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """以鄰接矩陣實作的無向圖類別"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """建構式"""
            # 頂點清單，元素代表頂點值，索引代表頂點索引
            self.vertices: list[int] = []
            # 鄰接矩陣，橫列與直行的索引皆對應頂點索引
            self.adj_mat: list[list[int]] = []
            # 新增頂點
            for val in vertices:
                self.add_vertex(val)
            # 新增邊
            # 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """取得頂點數量"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """新增頂點"""
            n = self.size()
            # 將新頂點的值加入頂點清單
            self.vertices.append(val)
            # 在鄰接矩陣中新增一個橫列
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # 在鄰接矩陣中新增一個直行
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """刪除頂點"""
            if index >= self.size():
                raise IndexError()
            # 從頂點清單中移除索引為 index 的頂點
            self.vertices.pop(index)
            # 從鄰接矩陣中刪除索引為 index 的橫列
            self.adj_mat.pop(index)
            # 從鄰接矩陣中刪除索引為 index 的直行
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """新增邊"""
            # 參數 i、j 為 vertices 中的元素索引
            # 處理索引超出範圍或兩個索引相同的情形
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """刪除邊"""
            # 參數 i、j 為 vertices 中的元素索引
            # 處理索引超出範圍或兩個索引相同的情形
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            self.adj_mat[i][j] = 0
            self.adj_mat[j][i] = 0

        def print(self):
            """印出鄰接矩陣"""
            print("頂點清單 =", self.vertices)
            print("鄰接矩陣 =")
            print_matrix(self.adj_mat)
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
        vector<int> vertices;       // 頂點清單，元素代表頂點值，索引代表頂點索引
        vector<vector<int>> adjMat; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

      public:
        /* 建構式 */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // 新增頂點
            for (int val : vertices) {
                addVertex(val);
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for (const vector<int> &edge : edges) {
                addEdge(edge[0], edge[1]);
            }
        }

        /* 取得頂點數量 */
        int size() const {
            return vertices.size();
        }

        /* 新增頂點 */
        void addVertex(int val) {
            int n = size();
            // 將新頂點的值加入頂點清單
            vertices.push_back(val);
            // 在鄰接矩陣中新增一個橫列
            adjMat.emplace_back(vector<int>(n, 0));
            // 在鄰接矩陣中新增一個直行
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* 刪除頂點 */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("頂點不存在");
            }
            // 從頂點清單中移除索引為 index 的頂點
            vertices.erase(vertices.begin() + index);
            // 從鄰接矩陣中刪除索引為 index 的橫列
            adjMat.erase(adjMat.begin() + index);
            // 從鄰接矩陣中刪除索引為 index 的直行
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        void addEdge(int i, int j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("頂點不存在");
            }
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        void removeEdge(int i, int j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("頂點不存在");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 印出鄰接矩陣 */
        void print() {
            cout << "頂點清單 = ";
            printVector(vertices);
            cout << "鄰接矩陣 =" << endl;
            printVectorMatrix(adjMat);
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
        List<Integer> vertices; // 頂點清單，元素代表頂點值，索引代表頂點索引
        List<List<Integer>> adjMat; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

        /* 建構式 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // 新增頂點
            for (int val : vertices) {
                addVertex(val);
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for (int[] e : edges) {
                addEdge(e[0], e[1]);
            }
        }

        /* 取得頂點數量 */
        public int size() {
            return vertices.size();
        }

        /* 新增頂點 */
        public void addVertex(int val) {
            int n = size();
            // 將新頂點的值加入頂點清單
            vertices.add(val);
            // 在鄰接矩陣中新增一個橫列
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // 在鄰接矩陣中新增一個直行
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* 刪除頂點 */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // 從頂點清單中移除索引為 index 的頂點
            vertices.remove(index);
            // 從鄰接矩陣中刪除索引為 index 的橫列
            adjMat.remove(index);
            // 從鄰接矩陣中刪除索引為 index 的直行
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        public void addEdge(int i, int j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        public void removeEdge(int i, int j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            adjMat.get(i).set(j, 0);
            adjMat.get(j).set(i, 0);
        }

        /* 印出鄰接矩陣 */
        public void print() {
            System.out.print("頂點清單 = ");
            System.out.println(vertices);
            System.out.println("鄰接矩陣 =");
            PrintUtil.printMatrix(adjMat);
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
        List<int> vertices;     // 頂點清單，元素代表頂點值，索引代表頂點索引
        List<List<int>> adjMat; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

        /* 建構函式 */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = [];
            this.adjMat = [];
            // 新增頂點
            foreach (int val in vertices) {
                AddVertex(val);
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            foreach (int[] e in edges) {
                AddEdge(e[0], e[1]);
            }
        }

        /* 取得頂點數量 */
        int Size() {
            return vertices.Count;
        }

        /* 新增頂點 */
        public void AddVertex(int val) {
            int n = Size();
            // 將新頂點的值加入頂點清單
            vertices.Add(val);
            // 在鄰接矩陣中新增一個橫列
            List<int> newRow = new(n);
            for (int j = 0; j < n; j++) {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // 在鄰接矩陣中新增一個直行
            foreach (List<int> row in adjMat) {
                row.Add(0);
            }
        }

        /* 刪除頂點 */
        public void RemoveVertex(int index) {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // 從頂點清單中移除索引為 index 的頂點
            vertices.RemoveAt(index);
            // 從鄰接矩陣中刪除索引為 index 的橫列
            adjMat.RemoveAt(index);
            // 從鄰接矩陣中刪除索引為 index 的直行
            foreach (List<int> row in adjMat) {
                row.RemoveAt(index);
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        public void AddEdge(int i, int j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        public void RemoveEdge(int i, int j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 印出鄰接矩陣 */
        public void Print() {
            Console.Write("頂點清單 = ");
            PrintUtil.PrintList(vertices);
            Console.WriteLine("鄰接矩陣 =");
            PrintUtil.PrintMatrix(adjMat);
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    /* 以鄰接矩陣實作的無向圖類別 */
    type graphAdjMat struct {
        // 頂點清單，元素代表頂點值，索引代表頂點索引
        vertices []int
        // 鄰接矩陣，橫列與直行的索引皆對應頂點索引
        adjMat [][]int
    }

    /* 建構函式 */
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
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for i := range edges {
            g.addEdge(edges[i][0], edges[i][1])
        }
        return g
    }

    /* 取得頂點數量 */
    func (g *graphAdjMat) size() int {
        return len(g.vertices)
    }

    /* 新增頂點 */
    func (g *graphAdjMat) addVertex(val int) {
        n := g.size()
        // 將新頂點的值加入頂點清單
        g.vertices = append(g.vertices, val)
        // 在鄰接矩陣中新增一個橫列
        newRow := make([]int, n)
        g.adjMat = append(g.adjMat, newRow)
        // 在鄰接矩陣中新增一個直行
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i], 0)
        }
    }

    /* 刪除頂點 */
    func (g *graphAdjMat) removeVertex(index int) {
        if index >= g.size() {
            return
        }
        // 從頂點清單中移除索引為 index 的頂點
        g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
        // 從鄰接矩陣中刪除索引為 index 的橫列
        g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
        // 從鄰接矩陣中刪除索引為 index 的直行
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
        }
    }

    /* 新增邊 */
    // 參數 i、j 為 vertices 中的元素索引
    func (g *graphAdjMat) addEdge(i, j int) {
        // 處理索引超出範圍或兩個索引相同的情形
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        g.adjMat[i][j] = 1
        g.adjMat[j][i] = 1
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    func (g *graphAdjMat) removeEdge(i, j int) {
        // 處理索引超出範圍或兩個索引相同的情形
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        g.adjMat[i][j] = 0
        g.adjMat[j][i] = 0
    }

    /* 印出鄰接矩陣 */
    func (g *graphAdjMat) print() {
        fmt.Printf("\t頂點清單 = %v\n", g.vertices)
        fmt.Printf("\t鄰接矩陣 = \n")
        for i := range g.adjMat {
            fmt.Printf("\t\t\t%v\n", g.adjMat[i])
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
        private var vertices: [Int] // 頂點清單，元素代表頂點值，索引代表頂點索引
        private var adjMat: [[Int]] // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

        /* 建構式 */
        init(vertices: [Int], edges: [[Int]]) {
            self.vertices = []
            adjMat = []
            // 新增頂點
            for val in vertices {
                addVertex(val: val)
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for e in edges {
                addEdge(i: e[0], j: e[1])
            }
        }

        /* 取得頂點數量 */
        func size() -> Int {
            vertices.count
        }

        /* 新增頂點 */
        func addVertex(val: Int) {
            let n = size()
            // 將新頂點的值加入頂點清單
            vertices.append(val)
            // 在鄰接矩陣中新增一個橫列
            let newRow = Array(repeating: 0, count: n)
            adjMat.append(newRow)
            // 在鄰接矩陣中新增一個直行
            for i in adjMat.indices {
                adjMat[i].append(0)
            }
        }

        /* 刪除頂點 */
        func removeVertex(index: Int) {
            if index >= size() {
                fatalError("超出範圍")
            }
            // 從頂點清單中移除索引為 index 的頂點
            vertices.remove(at: index)
            // 從鄰接矩陣中刪除索引為 index 的橫列
            adjMat.remove(at: index)
            // 從鄰接矩陣中刪除索引為 index 的直行
            for i in adjMat.indices {
                adjMat[i].remove(at: index)
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        func addEdge(i: Int, j: Int) {
            // 處理索引超出範圍或兩個索引相同的情形
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("超出範圍")
            }
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        func removeEdge(i: Int, j: Int) {
            // 處理索引超出範圍或兩個索引相同的情形
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("超出範圍")
            }
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 印出鄰接矩陣 */
        func print() {
            Swift.print("頂點清單 = ", terminator: "")
            Swift.print(vertices)
            Swift.print("鄰接矩陣 =")
            PrintUtil.printMatrix(matrix: adjMat)
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
        vertices; // 頂點清單，元素代表頂點值，索引代表頂點索引
        adjMat; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

        /* 建構函式 */
        constructor(vertices, edges) {
            this.vertices = [];
            this.adjMat = [];
            // 新增頂點
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 取得頂點數量 */
        size() {
            return this.vertices.length;
        }

        /* 新增頂點 */
        addVertex(val) {
            const n = this.size();
            // 將新頂點的值加入頂點清單
            this.vertices.push(val);
            // 在鄰接矩陣中新增一個橫列
            const newRow = [];
            for (let j = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 在鄰接矩陣中新增一個直行
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 刪除頂點 */
        removeVertex(index) {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 從頂點清單中移除索引為 index 的頂點
            this.vertices.splice(index, 1);

            // 從鄰接矩陣中刪除索引為 index 的橫列
            this.adjMat.splice(index, 1);
            // 從鄰接矩陣中刪除索引為 index 的直行
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        addEdge(i, j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        removeEdge(i, j) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 印出鄰接矩陣 */
        print() {
            console.log('頂點清單 = ', this.vertices);
            console.log('鄰接矩陣 =', this.adjMat);
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
        vertices: number[]; // 頂點清單，元素代表頂點值，索引代表頂點索引
        adjMat: number[][]; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

        /* 建構函式 */
        constructor(vertices: number[], edges: number[][]) {
            this.vertices = [];
            this.adjMat = [];
            // 新增頂點
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 取得頂點數量 */
        size(): number {
            return this.vertices.length;
        }

        /* 新增頂點 */
        addVertex(val: number): void {
            const n: number = this.size();
            // 將新頂點的值加入頂點清單
            this.vertices.push(val);
            // 在鄰接矩陣中新增一個橫列
            const newRow: number[] = [];
            for (let j: number = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 在鄰接矩陣中新增一個直行
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 刪除頂點 */
        removeVertex(index: number): void {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 從頂點清單中移除索引為 index 的頂點
            this.vertices.splice(index, 1);

            // 從鄰接矩陣中刪除索引為 index 的橫列
            this.adjMat.splice(index, 1);
            // 從鄰接矩陣中刪除索引為 index 的直行
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        addEdge(i: number, j: number): void {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        removeEdge(i: number, j: number): void {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 印出鄰接矩陣 */
        print(): void {
            console.log('頂點清單 = ', this.vertices);
            console.log('鄰接矩陣 =', this.adjMat);
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat {
      List<int> vertices = []; // 頂點元素，元素代表頂點值，索引代表頂點索引
      List<List<int>> adjMat = []; //鄰接矩陣，橫列與直行的索引皆對應頂點索引

      /* 建構式 */
      GraphAdjMat(List<int> vertices, List<List<int>> edges) {
        this.vertices = [];
        this.adjMat = [];
        // 新增頂點
        for (int val in vertices) {
          addVertex(val);
        }
        // 新增邊
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for (List<int> e in edges) {
          addEdge(e[0], e[1]);
        }
      }

      /* 取得頂點數量 */
      int size() {
        return vertices.length;
      }

      /* 新增頂點 */
      void addVertex(int val) {
        int n = size();
        // 將新頂點的值加入頂點清單
        vertices.add(val);
        // 在鄰接矩陣中新增一個橫列
        List<int> newRow = List.filled(n, 0, growable: true);
        adjMat.add(newRow);
        // 在鄰接矩陣中新增一個直行
        for (List<int> row in adjMat) {
          row.add(0);
        }
      }

      /* 刪除頂點 */
      void removeVertex(int index) {
        if (index >= size()) {
          throw IndexError;
        }
        // 從頂點清單中移除索引為 index 的頂點
        vertices.removeAt(index);
        // 從鄰接矩陣中刪除索引為 index 的橫列
        adjMat.removeAt(index);
        // 從鄰接矩陣中刪除索引為 index 的直行
        for (List<int> row in adjMat) {
          row.removeAt(index);
        }
      }

      /* 新增邊 */
      // 參數 i、j 為 vertices 中的元素索引
      void addEdge(int i, int j) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
      }

      /* 刪除邊 */
      // 參數 i、j 為 vertices 中的元素索引
      void removeEdge(int i, int j) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
      }

      /* 印出鄰接矩陣 */
      void printAdjMat() {
        print("頂點清單 = $vertices");
        print("鄰接矩陣 = ");
        printMatrix(adjMat);
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    /* 以鄰接矩陣實作的無向圖型別 */
    pub struct GraphAdjMat {
        // 頂點清單，元素代表頂點值，索引代表頂點索引
        pub vertices: Vec<i32>,
        // 鄰接矩陣，橫列與直行的索引皆對應頂點索引
        pub adj_mat: Vec<Vec<i32>>,
    }

    impl GraphAdjMat {
        /* 建構式 */
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
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for edge in edges {
                graph.add_edge(edge[0], edge[1])
            }

            graph
        }

        /* 取得頂點數量 */
        pub fn size(&self) -> usize {
            self.vertices.len()
        }

        /* 新增頂點 */
        pub fn add_vertex(&mut self, val: i32) {
            let n = self.size();
            // 將新頂點的值加入頂點清單
            self.vertices.push(val);
            // 在鄰接矩陣中新增一個橫列
            self.adj_mat.push(vec![0; n]);
            // 在鄰接矩陣中新增一個直行
            for row in self.adj_mat.iter_mut() {
                row.push(0);
            }
        }

        /* 刪除頂點 */
        pub fn remove_vertex(&mut self, index: usize) {
            if index >= self.size() {
                panic!("index error")
            }
            // 從頂點清單中移除索引為 index 的頂點
            self.vertices.remove(index);
            // 從鄰接矩陣中刪除索引為 index 的橫列
            self.adj_mat.remove(index);
            // 從鄰接矩陣中刪除索引為 index 的直行
            for row in self.adj_mat.iter_mut() {
                row.remove(index);
            }
        }

        /* 新增邊 */
        pub fn add_edge(&mut self, i: usize, j: usize) {
            // 參數 i、j 為 vertices 中的元素索引
            // 處理索引超出範圍或兩個索引相同的情形
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            self.adj_mat[i][j] = 1;
            self.adj_mat[j][i] = 1;
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        pub fn remove_edge(&mut self, i: usize, j: usize) {
            // 參數 i、j 為 vertices 中的元素索引
            // 處理索引超出範圍或兩個索引相同的情形
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            self.adj_mat[i][j] = 0;
            self.adj_mat[j][i] = 0;
        }

        /* 印出鄰接矩陣 */
        pub fn print(&self) {
            println!("頂點清單 = {:?}", self.vertices);
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
    /* 以鄰接矩陣實作的無向圖結構 */
    typedef struct {
        int vertices[MAX_SIZE];
        int adjMat[MAX_SIZE][MAX_SIZE];
        int size;
    } GraphAdjMat;

    /* 建構函式 */
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

    /* 解構函式 */
    void delGraphAdjMat(GraphAdjMat *graph) {
        free(graph);
    }

    /* 新增頂點 */
    void addVertex(GraphAdjMat *graph, int val) {
        if (graph->size == MAX_SIZE) {
            fprintf(stderr, "圖的頂點數量已達上限\n");
            return;
        }
        // 新增第 n 個頂點，將第 n 橫列與第 n 直行的元素設為零
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
            fprintf(stderr, "頂點索引超出範圍\n");
            return;
        }
        // 從頂點清單中移除索引為 index 的頂點
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1];
        }
        // 從鄰接矩陣中刪除索引為 index 的橫列
        for (int i = index; i < graph->size - 1; i++) {
            for (int j = 0; j < graph->size; j++) {
                graph->adjMat[i][j] = graph->adjMat[i + 1][j];
            }
        }
        // 從鄰接矩陣中刪除索引為 index 的直行
        for (int i = 0; i < graph->size; i++) {
            for (int j = index; j < graph->size - 1; j++) {
                graph->adjMat[i][j] = graph->adjMat[i][j + 1];
            }
        }
        graph->size--;
    }

    /* 新增邊 */
    // 參數 i、j 為 vertices 中的元素索引
    void addEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "邊的兩個端點索引超出範圍或彼此相同\n");
            return;
        }
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "邊的兩個端點索引超出範圍或彼此相同\n");
            return;
        }
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* 印出鄰接矩陣 */
    void printGraphAdjMat(GraphAdjMat *graph) {
        printf("頂點清單 = ");
        printArray(graph->vertices, graph->size);
        printf("鄰接矩陣 =\n");
        for (int i = 0; i < graph->size; i++) {
            printArray(graph->adjMat[i], graph->size);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_matrix.kt"
    /* 以鄰接矩陣實作的無向圖類別 */
    class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
        val vertices = mutableListOf<Int>() // 頂點清單，元素代表頂點值，索引代表頂點索引
        val adjMat = mutableListOf<MutableList<Int>>() // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

        /* 建構式 */
        init {
            // 新增頂點
            for (vertex in vertices) {
                addVertex(vertex)
            }
            // 新增邊
            // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
            for (edge in edges) {
                addEdge(edge[0], edge[1])
            }
        }

        /* 取得頂點數量 */
        fun size(): Int {
            return vertices.size
        }

        /* 新增頂點 */
        fun addVertex(_val: Int) {
            val n = size()
            // 將新頂點的值加入頂點清單
            vertices.add(_val)
            // 在鄰接矩陣中新增一個橫列
            val newRow = mutableListOf<Int>()
            for (j in 0..<n) {
                newRow.add(0)
            }
            adjMat.add(newRow)
            // 在鄰接矩陣中新增一個直行
            for (row in adjMat) {
                row.add(0)
            }
        }

        /* 刪除頂點 */
        fun removeVertex(index: Int) {
            if (index >= size())
                throw IndexOutOfBoundsException()
            // 從頂點清單中移除索引為 index 的頂點
            vertices.removeAt(index)
            // 從鄰接矩陣中刪除索引為 index 的橫列
            adjMat.removeAt(index)
            // 從鄰接矩陣中刪除索引為 index 的直行
            for (row in adjMat) {
                row.removeAt(index)
            }
        }

        /* 新增邊 */
        // 參數 i、j 為 vertices 中的元素索引
        fun addEdge(i: Int, j: Int) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 刪除邊 */
        // 參數 i、j 為 vertices 中的元素索引
        fun removeEdge(i: Int, j: Int) {
            // 處理索引超出範圍或兩個索引相同的情形
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 印出鄰接矩陣 */
        fun print() {
            print("頂點清單 = ")
            println(vertices)
            println("鄰接矩陣 =")
            printMatrix(adjMat)
        }
    }
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_matrix.rb"
    ### 以鄰接矩陣實作的無向圖類別 ###
    class GraphAdjMat
      def initialize(vertices, edges)
        ### 建構式 ###
        # 頂點清單，元素代表頂點值，索引代表頂點索引
        @vertices = []
        # 鄰接矩陣，橫列與直行的索引皆對應頂點索引
        @adj_mat = []
        # 新增頂點
        vertices.each { |val| add_vertex(val) }
        # 新增邊
        # 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        edges.each { |e| add_edge(e[0], e[1]) }
      end

      ### 取得頂點數量 ###
      def size
        @vertices.length
      end

      ### 新增頂點 ###
      def add_vertex(val)
        n = size
        # 將新頂點的值加入頂點清單
        @vertices << val
        # 在鄰接矩陣中新增一個橫列
        new_row = Array.new(n, 0)
        @adj_mat << new_row
        # 在鄰接矩陣中新增一個直行
        @adj_mat.each { |row| row << 0 }
      end

      ### 刪除頂點 ###
      def remove_vertex(index)
        raise IndexError if index >= size

        # 從頂點清單中移除索引為 index 的頂點
        @vertices.delete_at(index)
        # 從鄰接矩陣中刪除索引為 index 的橫列
        @adj_mat.delete_at(index)
        # 從鄰接矩陣中刪除索引為 index 的直行
        @adj_mat.each { |row| row.delete_at(index) }
      end

      ### 新增邊 ###
      def add_edge(i, j)
        # 參數 i、j 為 vertices 中的元素索引
        # 處理索引超出範圍或兩個索引相同的情形
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        # 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        @adj_mat[i][j] = 1
        @adj_mat[j][i] = 1
      end

      ### 刪除邊 ###
      def remove_edge(i, j)
        # 參數 i、j 為 vertices 中的元素索引
        # 處理索引超出範圍或兩個索引相同的情形
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        @adj_mat[i][j] = 0
        @adj_mat[j][i] = 0
      end

      ### 印出鄰接矩陣 ###
      def __print__
        puts "頂點清單 = #{@vertices}"
        puts '鄰接矩陣 ='
        print_matrix(@adj_mat)
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%22%22%22%E4%BB%A5%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E5%AF%A6%E4%BD%9C%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%23%20%E5%B0%87%E6%96%B0%E9%A0%82%E9%BB%9E%E7%9A%84%E5%80%BC%E5%8A%A0%E5%85%A5%E9%A0%82%E9%BB%9E%E6%B8%85%E5%96%AE%0A%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%80%8B%E6%A9%AB%E5%88%97%0A%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%80%8B%E7%9B%B4%E8%A1%8C%0A%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20row.append%280%29%0A%0A%20%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%23%20%E5%BE%9E%E9%A0%82%E9%BB%9E%E6%B8%85%E5%96%AE%E4%B8%AD%E7%A7%BB%E9%99%A4%E7%B4%A2%E5%BC%95%E7%82%BA%20index%20%E7%9A%84%E9%A0%82%E9%BB%9E%0A%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%23%20%E5%BE%9E%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%E7%82%BA%20index%20%E7%9A%84%E6%A9%AB%E5%88%97%0A%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%23%20%E5%BE%9E%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%E7%82%BA%20index%20%E7%9A%84%E7%9B%B4%E8%A1%8C%0A%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%23%20%E8%99%95%E7%90%86%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%E6%88%96%E5%85%A9%E5%80%8B%E7%B4%A2%E5%BC%95%E7%9B%B8%E5%90%8C%E7%9A%84%E6%83%85%E5%BD%A2%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%23%20%E8%99%95%E7%90%86%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%E6%88%96%E5%85%A9%E5%80%8B%E7%B4%A2%E5%BC%95%E7%9B%B8%E5%90%8C%E7%9A%84%E6%83%85%E5%BD%A2%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%23%20%E9%A0%82%E9%BB%9E%201%E3%80%812%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%E3%80%812%0A%20%20graph.add_edge%280,%202%29%0A%0A%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%23%20%E9%A0%82%E9%BB%9E%201%E3%80%813%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%E3%80%811%0A%20%20graph.remove_edge%280,%201%29%0A%0A%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20graph.add_vertex%286%29%0A%0A%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%23%20%E9%A0%82%E9%BB%9E%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%201%0A%20%20graph.remove_vertex%281%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%22%22%22%E4%BB%A5%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E5%AF%A6%E4%BD%9C%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%23%20%E5%B0%87%E6%96%B0%E9%A0%82%E9%BB%9E%E7%9A%84%E5%80%BC%E5%8A%A0%E5%85%A5%E9%A0%82%E9%BB%9E%E6%B8%85%E5%96%AE%0A%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%80%8B%E6%A9%AB%E5%88%97%0A%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E5%80%8B%E7%9B%B4%E8%A1%8C%0A%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20row.append%280%29%0A%0A%20%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%23%20%E5%BE%9E%E9%A0%82%E9%BB%9E%E6%B8%85%E5%96%AE%E4%B8%AD%E7%A7%BB%E9%99%A4%E7%B4%A2%E5%BC%95%E7%82%BA%20index%20%E7%9A%84%E9%A0%82%E9%BB%9E%0A%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%23%20%E5%BE%9E%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%E7%82%BA%20index%20%E7%9A%84%E6%A9%AB%E5%88%97%0A%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%23%20%E5%BE%9E%E9%84%B0%E6%8E%A5%E7%9F%A9%E9%99%A3%E4%B8%AD%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%E7%82%BA%20index%20%E7%9A%84%E7%9B%B4%E8%A1%8C%0A%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%23%20%E8%99%95%E7%90%86%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%E6%88%96%E5%85%A9%E5%80%8B%E7%B4%A2%E5%BC%95%E7%9B%B8%E5%90%8C%E7%9A%84%E6%83%85%E5%BD%A2%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%23%20%E8%99%95%E7%90%86%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E7%AF%84%E5%9C%8D%E6%88%96%E5%85%A9%E5%80%8B%E7%B4%A2%E5%BC%95%E7%9B%B8%E5%90%8C%E7%9A%84%E6%83%85%E5%BD%A2%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%23%20%E9%A0%82%E9%BB%9E%201%E3%80%812%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%E3%80%812%0A%20%20graph.add_edge%280,%202%29%0A%0A%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%23%20%E9%A0%82%E9%BB%9E%201%E3%80%813%20%E7%9A%84%E7%B4%A2%E5%BC%95%E5%88%86%E5%88%A5%E7%82%BA%200%E3%80%811%0A%20%20graph.remove_edge%280,%201%29%0A%0A%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20graph.add_vertex%286%29%0A%0A%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%23%20%E9%A0%82%E9%BB%9E%203%20%E7%9A%84%E7%B4%A2%E5%BC%95%E7%82%BA%201%0A%20%20graph.remove_vertex%281%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 9.2.2 &nbsp; 以鄰接串列實作

設無向圖共有 $n$ 個頂點、$m$ 條邊，各項操作可依圖 9-8 所示的方法實作。

- **新增邊**：在頂點對應的鏈結串列尾端加入邊即可，耗時 $O(1)$。由於是無向圖，兩個方向都要加入。
- **刪除邊**：在頂點對應的鏈結串列中找出並刪除指定的邊，耗時 $O(m)$。在無向圖中，兩個方向都要刪除。
- **新增頂點**：在鄰接串列中新增一條鏈結串列，以新頂點作為首節點，耗時 $O(1)$。
- **刪除頂點**：走訪整份鄰接串列，刪除所有以指定頂點為端點的邊，耗時 $O(n + m)$。
- **初始化**：在鄰接串列中建立 $n$ 個頂點和 $2m$ 條邊，耗時 $O(n + m)$。

=== "<1>"
    ![鄰接串列的初始化、新增與刪除邊及頂點](graph_operations.assets/adjacency_list_step1_initialization.svg){ class="animation-figure" }

=== "<2>"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.svg){ class="animation-figure" }

=== "<3>"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.svg){ class="animation-figure" }

=== "<4>"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.svg){ class="animation-figure" }

=== "<5>"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.svg){ class="animation-figure" }

<p align="center"> 圖 9-8 &nbsp; 鄰接串列的初始化、新增與刪除邊及頂點 </p>

以下程式碼實作鄰接串列，和圖 9-8 相比有幾處差異。

- 為了方便新增與刪除頂點，也為了簡化程式碼，我們用串列（動態陣列）代替鏈結串列。
- 使用雜湊表儲存鄰接串列，`key` 是頂點物件，`value` 是該頂點的相鄰頂點清單（鏈結串列）。

另外，我們在鄰接串列中用 `Vertex` 類別表示頂點。假如和鄰接矩陣一樣，用清單索引區分頂點，則刪除索引為 $i$ 的頂點時，得走訪整份鄰接串列，將所有大於 $i$ 的索引減 $1$，效率很低。若每個頂點都是獨一無二的 `Vertex` 物件，刪除一個頂點後就無須更改其他頂點。

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """以鄰接串列實作的無向圖類別"""

        def __init__(self, edges: list[list[Vertex]]):
            """建構式"""
            # 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
            self.adj_list = dict[Vertex, list[Vertex]]()
            # 加入所有頂點和邊
            for edge in edges:
                self.add_vertex(edge[0])
                self.add_vertex(edge[1])
                self.add_edge(edge[0], edge[1])

        def size(self) -> int:
            """取得頂點數量"""
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
            # 在鄰接串列中新增一條鏈結串列
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """刪除頂點"""
            if vet not in self.adj_list:
                raise ValueError()
            # 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            self.adj_list.pop(vet)
            # 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for vertex in self.adj_list:
                if vet in self.adj_list[vertex]:
                    self.adj_list[vertex].remove(vet)

        def print(self):
            """印出鄰接串列"""
            print("鄰接串列 =")
            for vertex in self.adj_list:
                tmp = [v.val for v in self.adj_list[vertex]]
                print(f"{vertex.val}: {tmp},")
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
      public:
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* 從 vector 中刪除指定節點 */
        void remove(vector<Vertex *> &vec, Vertex *vet) {
            for (int i = 0; i < vec.size(); i++) {
                if (vec[i] == vet) {
                    vec.erase(vec.begin() + i);
                    break;
                }
            }
        }

        /* 建構式 */
        GraphAdjList(const vector<vector<Vertex *>> &edges) {
            // 加入所有頂點和邊
            for (const vector<Vertex *> &edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 取得頂點數量 */
        int size() {
            return adjList.size();
        }

        /* 新增邊 */
        void addEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("頂點不存在");
            // 新增邊 vet1 - vet2
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* 刪除邊 */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("頂點不存在");
            // 刪除邊 vet1 - vet2
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* 新增頂點 */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // 在鄰接串列中新增一條鏈結串列
            adjList[vet] = vector<Vertex *>();
        }

        /* 刪除頂點 */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("頂點不存在");
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            adjList.erase(vet);
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* 印出鄰接串列 */
        void print() {
            cout << "鄰接串列 =" << endl;
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
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        Map<Vertex, List<Vertex>> adjList;

        /* 建構式 */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new HashMap<>();
            // 加入所有頂點和邊
            for (Vertex[] edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 取得頂點數量 */
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
            // 在鄰接串列中新增一條鏈結串列
            adjList.put(vet, new ArrayList<>());
        }

        /* 刪除頂點 */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            adjList.remove(vet);
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for (List<Vertex> list : adjList.values()) {
                list.remove(vet);
            }
        }

        /* 印出鄰接串列 */
        public void print() {
            System.out.println("鄰接串列 =");
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
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* 建構函式 */
        public GraphAdjList(Vertex[][] edges) {
            adjList = [];
            // 加入所有頂點和邊
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* 取得頂點數量 */
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
            // 在鄰接串列中新增一條鏈結串列
            adjList.Add(vet, []);
        }

        /* 刪除頂點 */
        public void RemoveVertex(Vertex vet) {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            adjList.Remove(vet);
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            foreach (List<Vertex> list in adjList.Values) {
                list.Remove(vet);
            }
        }

        /* 印出鄰接串列 */
        public void Print() {
            Console.WriteLine("鄰接串列 =");
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
    /* 以鄰接串列實作的無向圖類別 */
    type graphAdjList struct {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        adjList map[Vertex][]Vertex
    }

    /* 建構函式 */
    func newGraphAdjList(edges [][]Vertex) *graphAdjList {
        g := &graphAdjList{
            adjList: make(map[Vertex][]Vertex),
        }
        // 加入所有頂點和邊
        for _, edge := range edges {
            g.addVertex(edge[0])
            g.addVertex(edge[1])
            g.addEdge(edge[0], edge[1])
        }
        return g
    }

    /* 取得頂點數量 */
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
        // 新增邊 vet1 - vet2，加入匿名的 struct{}
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
        // 在鄰接串列中新增一條鏈結串列
        g.adjList[vet] = make([]Vertex, 0)
    }

    /* 刪除頂點 */
    func (g *graphAdjList) removeVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if !ok {
            panic("error")
        }
        // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
        delete(g.adjList, vet)
        // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
        for v, list := range g.adjList {
            g.adjList[v] = DeleteSliceElms(list, vet)
        }
    }

    /* 印出鄰接串列 */
    func (g *graphAdjList) print() {
        var builder strings.Builder
        fmt.Printf("鄰接串列 = \n")
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
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        public private(set) var adjList: [Vertex: [Vertex]]

        /* 建構式 */
        public init(edges: [[Vertex]]) {
            adjList = [:]
            // 加入所有頂點和邊
            for edge in edges {
                addVertex(vet: edge[0])
                addVertex(vet: edge[1])
                addEdge(vet1: edge[0], vet2: edge[1])
            }
        }

        /* 取得頂點數量 */
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
            // 在鄰接串列中新增一條鏈結串列
            adjList[vet] = []
        }

        /* 刪除頂點 */
        public func removeVertex(vet: Vertex) {
            if adjList[vet] == nil {
                fatalError("參數錯誤")
            }
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            adjList.removeValue(forKey: vet)
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for key in adjList.keys {
                adjList[key]?.removeAll { $0 == vet }
            }
        }

        /* 印出鄰接串列 */
        public func print() {
            Swift.print("鄰接串列 =")
            for (vertex, list) in adjList {
                let list = list.map { $0.val }
                Swift.print("\(vertex.val): \(list),")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        adjList;

        /* 建構式 */
        constructor(edges) {
            this.adjList = new Map();
            // 加入所有頂點和邊
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 取得頂點數量 */
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
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
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
            // 在鄰接串列中新增一條鏈結串列
            this.adjList.set(vet, []);
        }

        /* 刪除頂點 */
        removeVertex(vet) {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            this.adjList.delete(vet);
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for (const set of this.adjList.values()) {
                const index = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 印出鄰接串列 */
        print() {
            console.log('鄰接串列 =');
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
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        adjList: Map<Vertex, Vertex[]>;

        /* 建構式 */
        constructor(edges: Vertex[][]) {
            this.adjList = new Map();
            // 加入所有頂點和邊
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 取得頂點數量 */
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
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
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
            // 在鄰接串列中新增一條鏈結串列
            this.adjList.set(vet, []);
        }

        /* 刪除頂點 */
        removeVertex(vet: Vertex): void {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            this.adjList.delete(vet);
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for (const set of this.adjList.values()) {
                const index: number = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 印出鄰接串列 */
        print(): void {
            console.log('鄰接串列 =');
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
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList {
      // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
      Map<Vertex, List<Vertex>> adjList = {};

      /* 建構式 */
      GraphAdjList(List<List<Vertex>> edges) {
        for (List<Vertex> edge in edges) {
          addVertex(edge[0]);
          addVertex(edge[1]);
          addEdge(edge[0], edge[1]);
        }
      }

      /* 取得頂點數量 */
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
        // 在鄰接串列中新增一條鏈結串列
        adjList[vet] = [];
      }

      /* 刪除頂點 */
      void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet)) {
          throw ArgumentError;
        }
        // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
        adjList.remove(vet);
        // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
        adjList.forEach((key, value) {
          value.remove(vet);
        });
      }

      /* 印出鄰接串列 */
      void printAdjList() {
        print("鄰接串列 =");
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
    /* 以鄰接串列實作的無向圖型別 */
    pub struct GraphAdjList {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        pub adj_list: HashMap<Vertex, Vec<Vertex>>, // maybe HashSet<Vertex> for value part is better?
    }

    impl GraphAdjList {
        /* 建構式 */
        pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
            let mut graph = GraphAdjList {
                adj_list: HashMap::new(),
            };
            // 加入所有頂點和邊
            for edge in edges {
                graph.add_vertex(edge[0]);
                graph.add_vertex(edge[1]);
                graph.add_edge(edge[0], edge[1]);
            }

            graph
        }

        /* 取得頂點數量 */
        #[allow(unused)]
        pub fn size(&self) -> usize {
            self.adj_list.len()
        }

        /* 新增邊 */
        pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("value error");
            }
            // 新增邊 vet1 - vet2
            self.adj_list.entry(vet1).or_default().push(vet2);
            self.adj_list.entry(vet2).or_default().push(vet1);
        }

        /* 刪除邊 */
        #[allow(unused)]
        pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("value error");
            }
            // 刪除邊 vet1 - vet2
            self.adj_list
                .entry(vet1)
                .and_modify(|v| v.retain(|&e| e != vet2));
            self.adj_list
                .entry(vet2)
                .and_modify(|v| v.retain(|&e| e != vet1));
        }

        /* 新增頂點 */
        pub fn add_vertex(&mut self, vet: Vertex) {
            if self.adj_list.contains_key(&vet) {
                return;
            }
            // 在鄰接串列中新增一條鏈結串列
            self.adj_list.insert(vet, vec![]);
        }

        /* 刪除頂點 */
        #[allow(unused)]
        pub fn remove_vertex(&mut self, vet: Vertex) {
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            self.adj_list.remove(&vet);
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for list in self.adj_list.values_mut() {
                list.retain(|&v| v != vet);
            }
        }

        /* 印出鄰接串列 */
        pub fn print(&self) {
            println!("鄰接串列 =");
            for (vertex, list) in &self.adj_list {
                let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
                println!("{}: {:?},", vertex.val, list);
            }
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    /* 節點結構 */
    typedef struct AdjListNode {
        Vertex *vertex;           // 頂點
        struct AdjListNode *next; // 後繼節點
    } AdjListNode;

    /* 尋找頂點對應的節點 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 新增邊的輔助函式 */
    void addEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
        node->vertex = vet;
        // 從串列開頭插入
        node->next = head->next;
        head->next = node;
    }

    /* 刪除邊的輔助函式 */
    void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *pre = head;
        AdjListNode *cur = head->next;
        // 在鏈結串列中尋找 vet 對應的節點
        while (cur != NULL && cur->vertex != vet) {
            pre = cur;
            cur = cur->next;
        }
        if (cur == NULL)
            return;
        // 從鏈結串列中刪除 vet 對應的節點
        pre->next = cur->next;
        // 釋放記憶體
        free(cur);
    }

    /* 以鄰接串列實作的無向圖類別 */
    typedef struct {
        AdjListNode *heads[MAX_SIZE]; // 節點陣列
        int size;                     // 節點數量
    } GraphAdjList;

    /* 建構函式 */
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

    /* 解構函式 */
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

    /* 尋找頂點對應的節點 */
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
        assert(graph != NULL);
        if (findNode(graph, vet) != NULL)
            return;
        assert(graph->size < MAX_SIZE);
        AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
        head->vertex = vet;
        head->next = NULL;
        // 在鄰接串列中新增一條鏈結串列
        graph->heads[graph->size++] = head;
    }

    /* 刪除頂點 */
    void removeVertex(GraphAdjList *graph, Vertex *vet) {
        AdjListNode *node = findNode(graph, vet);
        assert(node != NULL);
        // 將後面的頂點往前移，補上空位
        int i;
        for (i = 0; i < graph->size; i++) {
            if (graph->heads[i] == node)
                break;
        }
        for (int j = i; j < graph->size - 1; j++) {
            graph->heads[j] = graph->heads[j + 1];
        }
        graph->size--;
        // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
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
        // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
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
    /* 以鄰接串列實作的無向圖類別 */
    class GraphAdjList(edges: Array<Array<Vertex?>>) {
        // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        val adjList = HashMap<Vertex, MutableList<Vertex>>()

        /* 建構式 */
        init {
            // 加入所有頂點和邊
            for (edge in edges) {
                addVertex(edge[0]!!)
                addVertex(edge[1]!!)
                addEdge(edge[0]!!, edge[1]!!)
            }
        }

        /* 取得頂點數量 */
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
            // 在鄰接串列中新增一條鏈結串列
            adjList[vet] = mutableListOf()
        }

        /* 刪除頂點 */
        fun removeVertex(vet: Vertex) {
            if (!adjList.containsKey(vet))
                throw IllegalArgumentException()
            // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
            adjList.remove(vet)
            // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
            for (list in adjList.values) {
                list.remove(vet)
            }
        }

        /* 印出鄰接串列 */
        fun print() {
            println("鄰接串列 =")
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
    ### 以鄰接串列實作的無向圖類別 ###
    class GraphAdjList
      attr_reader :adj_list
      
      ### 建構式 ###
      def initialize(edges)
        # 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
        @adj_list = {}
        # 加入所有頂點和邊
        for edge in edges
          add_vertex(edge[0])
          add_vertex(edge[1])
          add_edge(edge[0], edge[1])
        end
      end

      ### 取得頂點數量 ###
      def size
        @adj_list.length
      end

      ### 新增邊 ###
      def add_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

        @adj_list[vet1] << vet2
        @adj_list[vet2] << vet1
      end

      ### 刪除邊 ###
      def remove_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

        # 刪除邊 vet1 - vet2
        @adj_list[vet1].delete(vet2)
        @adj_list[vet2].delete(vet1)
      end

      ### 新增頂點 ###
      def add_vertex(vet)
        return if @adj_list.include?(vet)

        # 在鄰接串列中新增一條鏈結串列
        @adj_list[vet] = []
      end

      ### 刪除頂點 ###
      def remove_vertex(vet)
        raise ArgumentError unless @adj_list.include?(vet)

        # 從鄰接串列中刪除頂點 vet 對應的鏈結串列
        @adj_list.delete(vet)
        # 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
        for vertex in @adj_list
          @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
        end
      end

      ### 印出鄰接串列 ###
      def __print__
        puts '鄰接串列 ='
        for vertex in @adj_list
          tmp = @adj_list[vertex.first].map { |v| v.val }
          puts "#{vertex.first.val}: #{tmp},"
        end
      end
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E5%82%B3%E5%85%A5%E5%80%BC%E4%B8%B2%E5%88%97%20vals%EF%BC%8C%E5%9B%9E%E5%82%B3%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E4%BB%A5%E9%84%B0%E6%8E%A5%E4%B8%B2%E5%88%97%E5%AF%A6%E4%BD%9C%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%8A%A0%E5%85%A5%E6%89%80%E6%9C%89%E9%A0%82%E9%BB%9E%E5%92%8C%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E4%B8%B2%E5%88%97%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E6%A2%9D%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%9E%E9%84%B0%E6%8E%A5%E4%B8%B2%E5%88%97%E4%B8%AD%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%20vet%20%E5%B0%8D%E6%87%89%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E5%85%B6%E4%BB%96%E9%A0%82%E9%BB%9E%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%EF%BC%8C%E5%88%AA%E9%99%A4%E6%89%80%E6%9C%89%E4%BB%A5%20vet%20%E7%82%BA%E7%AB%AF%E9%BB%9E%E7%9A%84%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%20%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22%E9%A0%82%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22%E5%82%B3%E5%85%A5%E5%80%BC%E4%B8%B2%E5%88%97%20vals%EF%BC%8C%E5%9B%9E%E5%82%B3%E9%A0%82%E9%BB%9E%E4%B8%B2%E5%88%97%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22%E4%BB%A5%E9%84%B0%E6%8E%A5%E4%B8%B2%E5%88%97%E5%AF%A6%E4%BD%9C%E7%9A%84%E7%84%A1%E5%90%91%E5%9C%96%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%BC%8F%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%8A%A0%E5%85%A5%E6%89%80%E6%9C%89%E9%A0%82%E9%BB%9E%E5%92%8C%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%96%E5%BE%97%E9%A0%82%E9%BB%9E%E6%95%B8%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%82%8A%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E9%84%B0%E6%8E%A5%E4%B8%B2%E5%88%97%E4%B8%AD%E6%96%B0%E5%A2%9E%E4%B8%80%E6%A2%9D%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%9E%E9%84%B0%E6%8E%A5%E4%B8%B2%E5%88%97%E4%B8%AD%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%20vet%20%E5%B0%8D%E6%87%89%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E5%85%B6%E4%BB%96%E9%A0%82%E9%BB%9E%E7%9A%84%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%EF%BC%8C%E5%88%AA%E9%99%A4%E6%89%80%E6%9C%89%E4%BB%A5%20vet%20%E7%82%BA%E7%AB%AF%E9%BB%9E%E7%9A%84%E9%82%8A%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%84%A1%E5%90%91%E5%9C%96%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%82%8A%0A%20%20%20%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%82%8A%0A%20%20%20%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20%E6%96%B0%E5%A2%9E%E9%A0%82%E9%BB%9E%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E9%A0%82%E9%BB%9E%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 9.2.3 &nbsp; 效率比較

設圖中共有 $n$ 個頂點和 $m$ 條邊，表 9-2 比較鄰接矩陣和鄰接串列的時間與空間效率。請注意，「鄰接串列（鏈結串列）」對應本文的實作，「鄰接串列（雜湊表）」則專指把所有鏈結串列改為雜湊表的實作。

<p align="center"> 表 9-2 &nbsp; 鄰接矩陣與鄰接串列的比較 </p>

<div class="center-table" markdown>

|              | 鄰接矩陣 | 鄰接串列（鏈結串列） | 鄰接串列（雜湊表） |
| ------------ | -------- | -------------- | ---------------- |
| 判斷兩點是否相鄰 | $O(1)$   | $O(n)$         | $O(1)$           |
| 新增邊       | $O(1)$   | $O(1)$         | $O(1)$           |
| 刪除邊       | $O(1)$   | $O(n)$         | $O(1)$           |
| 新增頂點     | $O(n)$   | $O(1)$         | $O(1)$           |
| 刪除頂點     | $O(n^2)$ | $O(n + m)$     | $O(n)$           |
| 記憶體用量 | $O(n^2)$ | $O(n + m)$     | $O(n + m)$       |

</div>

從表 9-2 來看，鄰接串列（雜湊表）的時間與空間效率似乎最好。然而實際操作邊時，鄰接矩陣只要讀取一個陣列元素或為它賦值，效率更高。整體而言，鄰接矩陣體現了「以空間換取時間」的原則，鄰接串列則體現了「以時間換取空間」的原則。
