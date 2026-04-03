---
comments: true
---

# 9.2 &nbsp; グラフの基本操作

グラフの基本操作は、「辺」に対する操作と「頂点」に対する操作に分けられます。「隣接行列」と「隣接リスト」の 2 つの表現方法では、実装方法が異なります。

## 9.2.1 &nbsp; 隣接行列に基づく実装

頂点数が $n$ の無向グラフを与えると、各種操作の実装方法は次図のとおりです。

- **辺の追加または削除**：隣接行列で指定した辺を直接変更すればよく、$O(1)$ 時間です。無向グラフであるため、2 方向の辺を同時に更新する必要があります。
- **頂点の追加**：隣接行列の末尾に 1 行 1 列を追加し、すべてを $0$ で埋めればよく、$O(n)$ 時間です。
- **頂点の削除**：隣接行列から 1 行 1 列を削除します。先頭行と先頭列を削除する場合が最悪で、$(n-1)^2$ 個の要素を「左上へ移動」させる必要があるため、$O(n^2)$ 時間です。
- **初期化**：$n$ 個の頂点を受け取り、長さ $n$ の頂点リスト `vertices` を初期化するのに $O(n)$ 時間、サイズ $n \times n$ の隣接行列 `adjMat` を初期化するのに $O(n^2)$ 時間かかります。

=== "<1>"
    ![隣接行列の初期化、辺の追加と削除、頂点の追加と削除](graph_operations.assets/adjacency_matrix_step1_initialization.png){ class="animation-figure" }

=== "<2>"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.png){ class="animation-figure" }

=== "<3>"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.png){ class="animation-figure" }

=== "<4>"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.png){ class="animation-figure" }

=== "<5>"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> 図 9-7 &nbsp; 隣接行列の初期化、辺の追加と削除、頂点の追加と削除 </p>

以下は、隣接行列でグラフを表した実装コードです：

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """隣接行列に基づく無向グラフクラス"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """コンストラクタ"""
            # 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
            self.vertices: list[int] = []
            # 隣接行列。行・列のインデックスは「頂点インデックス」に対応
            self.adj_mat: list[list[int]] = []
            # 頂点を追加
            for val in vertices:
                self.add_vertex(val)
            # 辺を追加
            # 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """頂点数を取得"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """頂点を追加"""
            n = self.size()
            # 頂点リストに新しい頂点の値を追加
            self.vertices.append(val)
            # 隣接行列に 1 行追加
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # 隣接行列に 1 列追加
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """頂点を削除"""
            if index >= self.size():
                raise IndexError()
            # 頂点リストから index の頂点を削除する
            self.vertices.pop(index)
            # 隣接行列で index 行を削除する
            self.adj_mat.pop(index)
            # 隣接行列で index 列を削除する
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """辺を追加"""
            # パラメータ i, j は vertices の要素インデックスに対応する
            # 範囲外と同値の場合の処理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """辺を削除"""
            # パラメータ i, j は vertices の要素インデックスに対応する
            # 範囲外と同値の場合の処理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            self.adj_mat[i][j] = 0
            self.adj_mat[j][i] = 0

        def print(self):
            """隣接行列を出力"""
            print("頂点リスト =", self.vertices)
            print("隣接行列 =")
            print_matrix(self.adj_mat)
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
        vector<int> vertices;       // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        vector<vector<int>> adjMat; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

      public:
        /* コンストラクタ */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // 頂点を追加
            for (int val : vertices) {
                addVertex(val);
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for (const vector<int> &edge : edges) {
                addEdge(edge[0], edge[1]);
            }
        }

        /* 頂点数を取得 */
        int size() const {
            return vertices.size();
        }

        /* 頂点を追加 */
        void addVertex(int val) {
            int n = size();
            // 頂点リストに新しい頂点の値を追加
            vertices.push_back(val);
            // 隣接行列に 1 行追加
            adjMat.emplace_back(vector<int>(n, 0));
            // 隣接行列に 1 列追加
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* 頂点を削除 */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("頂点が存在しません");
            }
            // 頂点リストから index の頂点を削除する
            vertices.erase(vertices.begin() + index);
            // 隣接行列で index 行を削除する
            adjMat.erase(adjMat.begin() + index);
            // 隣接行列で index 列を削除する
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        void addEdge(int i, int j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("頂点が存在しません");
            }
            // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        void removeEdge(int i, int j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("頂点が存在しません");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 隣接行列を出力 */
        void print() {
            cout << "頂点リスト = ";
            printVector(vertices);
            cout << "隣接行列 =" << endl;
            printVectorMatrix(adjMat);
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
        List<Integer> vertices; // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        List<List<Integer>> adjMat; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // 頂点を追加
            for (int val : vertices) {
                addVertex(val);
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for (int[] e : edges) {
                addEdge(e[0], e[1]);
            }
        }

        /* 頂点数を取得 */
        public int size() {
            return vertices.size();
        }

        /* 頂点を追加 */
        public void addVertex(int val) {
            int n = size();
            // 頂点リストに新しい頂点の値を追加
            vertices.add(val);
            // 隣接行列に 1 行追加
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // 隣接行列に 1 列追加
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* 頂点を削除 */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // 頂点リストから index の頂点を削除する
            vertices.remove(index);
            // 隣接行列で index 行を削除する
            adjMat.remove(index);
            // 隣接行列で index 列を削除する
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        public void addEdge(int i, int j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        public void removeEdge(int i, int j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            adjMat.get(i).set(j, 0);
            adjMat.get(j).set(i, 0);
        }

        /* 隣接行列を出力 */
        public void print() {
            System.out.print("頂点リスト = ");
            System.out.println(vertices);
            System.out.println("隣接行列 =");
            PrintUtil.printMatrix(adjMat);
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
        List<int> vertices;     // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        List<List<int>> adjMat; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = [];
            this.adjMat = [];
            // 頂点を追加
            foreach (int val in vertices) {
                AddVertex(val);
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            foreach (int[] e in edges) {
                AddEdge(e[0], e[1]);
            }
        }

        /* 頂点数を取得 */
        int Size() {
            return vertices.Count;
        }

        /* 頂点を追加 */
        public void AddVertex(int val) {
            int n = Size();
            // 頂点リストに新しい頂点の値を追加
            vertices.Add(val);
            // 隣接行列に 1 行追加
            List<int> newRow = new(n);
            for (int j = 0; j < n; j++) {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // 隣接行列に 1 列追加
            foreach (List<int> row in adjMat) {
                row.Add(0);
            }
        }

        /* 頂点を削除 */
        public void RemoveVertex(int index) {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // 頂点リストから index の頂点を削除する
            vertices.RemoveAt(index);
            // 隣接行列で index 行を削除する
            adjMat.RemoveAt(index);
            // 隣接行列で index 列を削除する
            foreach (List<int> row in adjMat) {
                row.RemoveAt(index);
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        public void AddEdge(int i, int j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        public void RemoveEdge(int i, int j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 隣接行列を出力 */
        public void Print() {
            Console.Write("頂点リスト = ");
            PrintUtil.PrintList(vertices);
            Console.WriteLine("隣接行列 =");
            PrintUtil.PrintMatrix(adjMat);
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    /* 隣接行列に基づく無向グラフクラス */
    type graphAdjMat struct {
        // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        vertices []int
        // 隣接行列。行・列のインデックスは「頂点インデックス」に対応
        adjMat [][]int
    }

    /* コンストラクタ */
    func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
        // 頂点を追加
        n := len(vertices)
        adjMat := make([][]int, n)
        for i := range adjMat {
            adjMat[i] = make([]int, n)
        }
        // グラフを初期化する
        g := &graphAdjMat{
            vertices: vertices,
            adjMat:   adjMat,
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for i := range edges {
            g.addEdge(edges[i][0], edges[i][1])
        }
        return g
    }

    /* 頂点数を取得 */
    func (g *graphAdjMat) size() int {
        return len(g.vertices)
    }

    /* 頂点を追加 */
    func (g *graphAdjMat) addVertex(val int) {
        n := g.size()
        // 頂点リストに新しい頂点の値を追加
        g.vertices = append(g.vertices, val)
        // 隣接行列に 1 行追加
        newRow := make([]int, n)
        g.adjMat = append(g.adjMat, newRow)
        // 隣接行列に 1 列追加
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i], 0)
        }
    }

    /* 頂点を削除 */
    func (g *graphAdjMat) removeVertex(index int) {
        if index >= g.size() {
            return
        }
        // 頂点リストから index の頂点を削除する
        g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
        // 隣接行列で index 行を削除する
        g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
        // 隣接行列で index 列を削除する
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
        }
    }

    /* 辺を追加 */
    // 引数 i, j は vertices の要素インデックスに対応する
    func (g *graphAdjMat) addEdge(i, j int) {
        // インデックスの範囲外と等値の処理
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        g.adjMat[i][j] = 1
        g.adjMat[j][i] = 1
    }

    /* 辺を削除 */
    // 引数 i, j は vertices の要素インデックスに対応する
    func (g *graphAdjMat) removeEdge(i, j int) {
        // インデックスの範囲外と等値の処理
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index Out Of Bounds Exception")
        }
        g.adjMat[i][j] = 0
        g.adjMat[j][i] = 0
    }

    /* 隣接行列を出力 */
    func (g *graphAdjMat) print() {
        fmt.Printf("\t頂点リスト = %v\n", g.vertices)
        fmt.Printf("\t隣接行列 = \n")
        for i := range g.adjMat {
            fmt.Printf("\t\t\t%v\n", g.adjMat[i])
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
        private var vertices: [Int] // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        private var adjMat: [[Int]] // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        init(vertices: [Int], edges: [[Int]]) {
            self.vertices = []
            adjMat = []
            // 頂点を追加
            for val in vertices {
                addVertex(val: val)
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for e in edges {
                addEdge(i: e[0], j: e[1])
            }
        }

        /* 頂点数を取得 */
        func size() -> Int {
            vertices.count
        }

        /* 頂点を追加 */
        func addVertex(val: Int) {
            let n = size()
            // 頂点リストに新しい頂点の値を追加
            vertices.append(val)
            // 隣接行列に 1 行追加
            let newRow = Array(repeating: 0, count: n)
            adjMat.append(newRow)
            // 隣接行列に 1 列追加
            for i in adjMat.indices {
                adjMat[i].append(0)
            }
        }

        /* 頂点を削除 */
        func removeVertex(index: Int) {
            if index >= size() {
                fatalError("範囲外")
            }
            // 頂点リストから index の頂点を削除する
            vertices.remove(at: index)
            // 隣接行列で index 行を削除する
            adjMat.remove(at: index)
            // 隣接行列で index 列を削除する
            for i in adjMat.indices {
                adjMat[i].remove(at: index)
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        func addEdge(i: Int, j: Int) {
            // インデックスの範囲外と等値の処理
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("範囲外")
            }
            // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        func removeEdge(i: Int, j: Int) {
            // インデックスの範囲外と等値の処理
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("範囲外")
            }
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 隣接行列を出力 */
        func print() {
            Swift.print("頂点リスト = ", terminator: "")
            Swift.print(vertices)
            Swift.print("隣接行列 =")
            PrintUtil.printMatrix(matrix: adjMat)
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
        vertices; // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        adjMat; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        constructor(vertices, edges) {
            this.vertices = [];
            this.adjMat = [];
            // 頂点を追加
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 頂点数を取得 */
        size() {
            return this.vertices.length;
        }

        /* 頂点を追加 */
        addVertex(val) {
            const n = this.size();
            // 頂点リストに新しい頂点の値を追加
            this.vertices.push(val);
            // 隣接行列に 1 行追加
            const newRow = [];
            for (let j = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 隣接行列に 1 列追加
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 頂点を削除 */
        removeVertex(index) {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 頂点リストから index の頂点を削除する
            this.vertices.splice(index, 1);

            // 隣接行列で index 行を削除する
            this.adjMat.splice(index, 1);
            // 隣接行列で index 列を削除する
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        addEdge(i, j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 無向グラフでは、隣接行列は主対角線に関して対称であり、(i, j) === (j, i) を満たす
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        removeEdge(i, j) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 隣接行列を出力 */
        print() {
            console.log('頂点リスト = ', this.vertices);
            console.log('隣接行列 =', this.adjMat);
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
        vertices: number[]; // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        adjMat: number[][]; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        constructor(vertices: number[], edges: number[][]) {
            this.vertices = [];
            this.adjMat = [];
            // 頂点を追加
            for (const val of vertices) {
                this.addVertex(val);
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* 頂点数を取得 */
        size(): number {
            return this.vertices.length;
        }

        /* 頂点を追加 */
        addVertex(val: number): void {
            const n: number = this.size();
            // 頂点リストに新しい頂点の値を追加
            this.vertices.push(val);
            // 隣接行列に 1 行追加
            const newRow: number[] = [];
            for (let j: number = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // 隣接行列に 1 列追加
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* 頂点を削除 */
        removeVertex(index: number): void {
            if (index >= this.size()) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 頂点リストから index の頂点を削除する
            this.vertices.splice(index, 1);

            // 隣接行列で index 行を削除する
            this.adjMat.splice(index, 1);
            // 隣接行列で index 列を削除する
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        addEdge(i: number, j: number): void {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            // 無向グラフでは、隣接行列は主対角線に関して対称であり、(i, j) === (j, i) を満たす
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        removeEdge(i: number, j: number): void {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index Out Of Bounds Exception');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* 隣接行列を出力 */
        print(): void {
            console.log('頂点リスト = ', this.vertices);
            console.log('隣接行列 =', this.adjMat);
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat {
      List<int> vertices = []; // 頂点要素。要素は「頂点値」を表し、インデックスは「頂点インデックス」を表す
      List<List<int>> adjMat = []; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

      /* コンストラクタ */
      GraphAdjMat(List<int> vertices, List<List<int>> edges) {
        this.vertices = [];
        this.adjMat = [];
        // 頂点を追加
        for (int val in vertices) {
          addVertex(val);
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for (List<int> e in edges) {
          addEdge(e[0], e[1]);
        }
      }

      /* 頂点数を取得 */
      int size() {
        return vertices.length;
      }

      /* 頂点を追加 */
      void addVertex(int val) {
        int n = size();
        // 頂点リストに新しい頂点の値を追加
        vertices.add(val);
        // 隣接行列に 1 行追加
        List<int> newRow = List.filled(n, 0, growable: true);
        adjMat.add(newRow);
        // 隣接行列に 1 列追加
        for (List<int> row in adjMat) {
          row.add(0);
        }
      }

      /* 頂点を削除 */
      void removeVertex(int index) {
        if (index >= size()) {
          throw IndexError;
        }
        // 頂点リストから index の頂点を削除する
        vertices.removeAt(index);
        // 隣接行列で index 行を削除する
        adjMat.removeAt(index);
        // 隣接行列で index 列を削除する
        for (List<int> row in adjMat) {
          row.removeAt(index);
        }
      }

      /* 辺を追加 */
      // 引数 i, j は vertices の要素インデックスに対応する
      void addEdge(int i, int j) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
      }

      /* 辺を削除 */
      // 引数 i, j は vertices の要素インデックスに対応する
      void removeEdge(int i, int j) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
      }

      /* 隣接行列を出力 */
      void printAdjMat() {
        print("頂点リスト = $vertices");
        print("隣接行列 = ");
        printMatrix(adjMat);
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    /* 隣接行列に基づく無向グラフ型 */
    pub struct GraphAdjMat {
        // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        pub vertices: Vec<i32>,
        // 隣接行列。行・列のインデックスは「頂点インデックス」に対応
        pub adj_mat: Vec<Vec<i32>>,
    }

    impl GraphAdjMat {
        /* コンストラクタ */
        pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
            let mut graph = GraphAdjMat {
                vertices: vec![],
                adj_mat: vec![],
            };
            // 頂点を追加
            for val in vertices {
                graph.add_vertex(val);
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for edge in edges {
                graph.add_edge(edge[0], edge[1])
            }

            graph
        }

        /* 頂点数を取得 */
        pub fn size(&self) -> usize {
            self.vertices.len()
        }

        /* 頂点を追加 */
        pub fn add_vertex(&mut self, val: i32) {
            let n = self.size();
            // 頂点リストに新しい頂点の値を追加
            self.vertices.push(val);
            // 隣接行列に 1 行追加
            self.adj_mat.push(vec![0; n]);
            // 隣接行列に 1 列追加
            for row in self.adj_mat.iter_mut() {
                row.push(0);
            }
        }

        /* 頂点を削除 */
        pub fn remove_vertex(&mut self, index: usize) {
            if index >= self.size() {
                panic!("index error")
            }
            // 頂点リストから index の頂点を削除する
            self.vertices.remove(index);
            // 隣接行列で index 行を削除する
            self.adj_mat.remove(index);
            // 隣接行列で index 列を削除する
            for row in self.adj_mat.iter_mut() {
                row.remove(index);
            }
        }

        /* 辺を追加 */
        pub fn add_edge(&mut self, i: usize, j: usize) {
            // パラメータ i, j は vertices の要素インデックスに対応する
            // 範囲外と同値の場合の処理
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            self.adj_mat[i][j] = 1;
            self.adj_mat[j][i] = 1;
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        pub fn remove_edge(&mut self, i: usize, j: usize) {
            // パラメータ i, j は vertices の要素インデックスに対応する
            // 範囲外と同値の場合の処理
            if i >= self.size() || j >= self.size() || i == j {
                panic!("index error")
            }
            self.adj_mat[i][j] = 0;
            self.adj_mat[j][i] = 0;
        }

        /* 隣接行列を出力 */
        pub fn print(&self) {
            println!("頂点リスト = {:?}", self.vertices);
            println!("隣接行列 =");
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
    /* 隣接行列に基づく無向グラフ構造体 */
    typedef struct {
        int vertices[MAX_SIZE];
        int adjMat[MAX_SIZE][MAX_SIZE];
        int size;
    } GraphAdjMat;

    /* コンストラクタ */
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

    /* デストラクタ */
    void delGraphAdjMat(GraphAdjMat *graph) {
        free(graph);
    }

    /* 頂点を追加 */
    void addVertex(GraphAdjMat *graph, int val) {
        if (graph->size == MAX_SIZE) {
            fprintf(stderr, "グラフの頂点数が最大値に達しました\n");
            return;
        }
        // n 番目の頂点を追加し、n 行目と n 列目を 0 にする
        int n = graph->size;
        graph->vertices[n] = val;
        for (int i = 0; i <= n; i++) {
            graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
        }
        graph->size++;
    }

    /* 頂点を削除 */
    void removeVertex(GraphAdjMat *graph, int index) {
        if (index < 0 || index >= graph->size) {
            fprintf(stderr, "頂点インデックスが範囲外です\n");
            return;
        }
        // 頂点リストから index の頂点を削除する
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1];
        }
        // 隣接行列で index 行を削除する
        for (int i = index; i < graph->size - 1; i++) {
            for (int j = 0; j < graph->size; j++) {
                graph->adjMat[i][j] = graph->adjMat[i + 1][j];
            }
        }
        // 隣接行列で index 列を削除する
        for (int i = 0; i < graph->size; i++) {
            for (int j = index; j < graph->size - 1; j++) {
                graph->adjMat[i][j] = graph->adjMat[i][j + 1];
            }
        }
        graph->size--;
    }

    /* 辺を追加 */
    // 引数 i, j は vertices の要素インデックスに対応する
    void addEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "辺インデックスが範囲外であるか、同一です\n");
            return;
        }
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* 辺を削除 */
    // 引数 i, j は vertices の要素インデックスに対応する
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "辺インデックスが範囲外であるか、同一です\n");
            return;
        }
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* 隣接行列を出力 */
    void printGraphAdjMat(GraphAdjMat *graph) {
        printf("頂点リスト = ");
        printArray(graph->vertices, graph->size);
        printf("隣接行列 =\n");
        for (int i = 0; i < graph->size; i++) {
            printArray(graph->adjMat[i], graph->size);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_matrix.kt"
    /* 隣接行列に基づく無向グラフクラス */
    class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
        val vertices = mutableListOf<Int>() // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        val adjMat = mutableListOf<MutableList<Int>>() // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        init {
            // 頂点を追加
            for (vertex in vertices) {
                addVertex(vertex)
            }
            // 辺を追加
            // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
            for (edge in edges) {
                addEdge(edge[0], edge[1])
            }
        }

        /* 頂点数を取得 */
        fun size(): Int {
            return vertices.size
        }

        /* 頂点を追加 */
        fun addVertex(_val: Int) {
            val n = size()
            // 頂点リストに新しい頂点の値を追加
            vertices.add(_val)
            // 隣接行列に 1 行追加
            val newRow = mutableListOf<Int>()
            for (j in 0..<n) {
                newRow.add(0)
            }
            adjMat.add(newRow)
            // 隣接行列に 1 列追加
            for (row in adjMat) {
                row.add(0)
            }
        }

        /* 頂点を削除 */
        fun removeVertex(index: Int) {
            if (index >= size())
                throw IndexOutOfBoundsException()
            // 頂点リストから index の頂点を削除する
            vertices.removeAt(index)
            // 隣接行列で index 行を削除する
            adjMat.removeAt(index)
            // 隣接行列で index 列を削除する
            for (row in adjMat) {
                row.removeAt(index)
            }
        }

        /* 辺を追加 */
        // 引数 i, j は vertices の要素インデックスに対応する
        fun addEdge(i: Int, j: Int) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* 辺を削除 */
        // 引数 i, j は vertices の要素インデックスに対応する
        fun removeEdge(i: Int, j: Int) {
            // インデックスの範囲外と等値の処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* 隣接行列を出力 */
        fun print() {
            print("頂点リスト = ")
            println(vertices)
            println("隣接行列 =")
            printMatrix(adjMat)
        }
    }
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_matrix.rb"
    ### 隣接行列で実装した無向グラフクラス ###
    class GraphAdjMat
      def initialize(vertices, edges)
        ### コンストラクタ ###
        # 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        @vertices = []
        # 隣接行列。行・列のインデックスは「頂点インデックス」に対応
        @adj_mat = []
        # 頂点を追加
        vertices.each { |val| add_vertex(val) }
        # 辺を追加
        # 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        edges.each { |e| add_edge(e[0], e[1]) }
      end

      ### 頂点数を取得 ###
      def size
        @vertices.length
      end

      ### 頂点を追加 ###
      def add_vertex(val)
        n = size
        # 頂点リストに新しい頂点の値を追加
        @vertices << val
        # 隣接行列に 1 行追加
        new_row = Array.new(n, 0)
        @adj_mat << new_row
        # 隣接行列に 1 列追加
        @adj_mat.each { |row| row << 0 }
      end

      ### 頂点を削除 ###
      def remove_vertex(index)
        raise IndexError if index >= size

        # 頂点リストから index の頂点を削除する
        @vertices.delete_at(index)
        # 隣接行列で index 行を削除する
        @adj_mat.delete_at(index)
        # 隣接行列で index 列を削除する
        @adj_mat.each { |row| row.delete_at(index) }
      end

      ### 辺を追加 ###
      def add_edge(i, j)
        # パラメータ i, j は vertices の要素インデックスに対応する
        # 範囲外と同値の場合の処理
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        # 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        @adj_mat[i][j] = 1
        @adj_mat[j][i] = 1
      end

      ### 辺を削除 ###
      def remove_edge(i, j)
        # パラメータ i, j は vertices の要素インデックスに対応する
        # 範囲外と同値の場合の処理
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        @adj_mat[i][j] = 0
        @adj_mat[j][i] = 0
      end

      ### 隣接行列を出力 ###
      def __print__
        puts "頂点リスト = #{@vertices}"
        puts '隣接行列 ='
        print_matrix(@adj_mat)
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20vertices%3A%20list%5Bint%5D%2C%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D%2C%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20%28j%20%3E%3D%20self.size%28%29%29%20or%20%28i%20%3D%3D%20j%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20%28j%20%3E%3D%20self.size%28%29%29%20or%20%28i%20%3D%3D%20j%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20vertices%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0%2C%201%5D%2C%20%5B0%2C%203%5D%2C%20%5B1%2C%202%5D%2C%20%5B2%2C%203%5D%2C%20%5B2%2C%204%5D%2C%20%5B3%2C%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices%2C%20edges%29%0A%20%20%20%20graph.add_edge%280%2C%202%29%0A%20%20%20%20graph.remove_edge%280%2C%201%29%0A%20%20%20%20graph.add_vertex%286%29%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20vertices%3A%20list%5Bint%5D%2C%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D%2C%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20%28j%20%3E%3D%20self.size%28%29%29%20or%20%28i%20%3D%3D%20j%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20%28j%20%3E%3D%20self.size%28%29%29%20or%20%28i%20%3D%3D%20j%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20vertices%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0%2C%201%5D%2C%20%5B0%2C%203%5D%2C%20%5B1%2C%202%5D%2C%20%5B2%2C%203%5D%2C%20%5B2%2C%204%5D%2C%20%5B3%2C%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices%2C%20edges%29%0A%20%20%20%20graph.add_edge%280%2C%202%29%0A%20%20%20%20graph.remove_edge%280%2C%201%29%0A%20%20%20%20graph.add_vertex%286%29%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 9.2.2 &nbsp; 隣接リストに基づく実装

無向グラフの頂点総数を $n$、辺総数を $m$ とすると、各種操作は次図の方法で実装できます。

- **辺の追加**：頂点に対応する連結リストの末尾に辺を追加すればよく、$O(1)$ 時間です。無向グラフなので、2 方向の辺を同時に追加する必要があります。
- **辺の削除**：頂点に対応する連結リストから指定した辺を探して削除するため、$O(m)$ 時間です。無向グラフでは、2 方向の辺を同時に削除する必要があります。
- **頂点の追加**：隣接リストに 1 つの連結リストを追加し、新しい頂点をその連結リストの先頭ノードとするため、$O(1)$ 時間です。
- **頂点の削除**：隣接リスト全体を走査し、指定した頂点を含むすべての辺を削除する必要があるため、$O(n + m)$ 時間です。
- **初期化**：隣接リストに $n$ 個の頂点と $2m$ 本の辺を作成するため、$O(n + m)$ 時間です。

=== "<1>"
    ![隣接リストの初期化、辺の追加と削除、頂点の追加と削除](graph_operations.assets/adjacency_list_step1_initialization.png){ class="animation-figure" }

=== "<2>"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.png){ class="animation-figure" }

=== "<3>"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.png){ class="animation-figure" }

=== "<4>"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.png){ class="animation-figure" }

=== "<5>"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> 図 9-8 &nbsp; 隣接リストの初期化、辺の追加と削除、頂点の追加と削除 </p>

以下は隣接リストのコード実装です。上図と比べると、実際のコードには次の違いがあります。

- 頂点の追加と削除を容易にし、コードを簡潔にするため、連結リストの代わりにリスト（動的配列）を使用しています。
- ハッシュテーブルを用いて隣接リストを格納しており、`key` は頂点インスタンス、`value` はその頂点に隣接する頂点のリスト（連結リスト）です。

また、隣接リストでは頂点を表すために `Vertex` クラスを使用しています。その理由は、もし隣接行列と同様にリストのインデックスで異なる頂点を区別すると、インデックス $i$ の頂点を削除する場合、隣接リスト全体を走査して、$i$ より大きいすべてのインデックスを $1$ 減らす必要があり、効率が非常に低いためです。これに対して、各頂点が一意な `Vertex` インスタンスであれば、ある頂点を削除しても他の頂点を変更する必要はありません。

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """隣接リストに基づく無向グラフクラス"""

        def __init__(self, edges: list[list[Vertex]]):
            """コンストラクタ"""
            # 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
            self.adj_list = dict[Vertex, list[Vertex]]()
            # すべての頂点と辺を追加
            for edge in edges:
                self.add_vertex(edge[0])
                self.add_vertex(edge[1])
                self.add_edge(edge[0], edge[1])

        def size(self) -> int:
            """頂点数を取得"""
            return len(self.adj_list)

        def add_edge(self, vet1: Vertex, vet2: Vertex):
            """辺を追加"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # 辺 vet1 - vet2 を追加
            self.adj_list[vet1].append(vet2)
            self.adj_list[vet2].append(vet1)

        def remove_edge(self, vet1: Vertex, vet2: Vertex):
            """辺を削除"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # 辺 vet1 - vet2 を削除
            self.adj_list[vet1].remove(vet2)
            self.adj_list[vet2].remove(vet1)

        def add_vertex(self, vet: Vertex):
            """頂点を追加"""
            if vet in self.adj_list:
                return
            # 隣接リストに新しいリストを追加
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """頂点を削除"""
            if vet not in self.adj_list:
                raise ValueError()
            # 隣接リストから頂点 vet に対応するリストを削除
            self.adj_list.pop(vet)
            # 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for vertex in self.adj_list:
                if vet in self.adj_list[vertex]:
                    self.adj_list[vertex].remove(vet)

        def print(self):
            """隣接リストを出力"""
            print("隣接リスト =")
            for vertex in self.adj_list:
                tmp = [v.val for v in self.adj_list[vertex]]
                print(f"{vertex.val}: {tmp},")
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
      public:
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* vector 内の指定ノードを削除 */
        void remove(vector<Vertex *> &vec, Vertex *vet) {
            for (int i = 0; i < vec.size(); i++) {
                if (vec[i] == vet) {
                    vec.erase(vec.begin() + i);
                    break;
                }
            }
        }

        /* コンストラクタ */
        GraphAdjList(const vector<vector<Vertex *>> &edges) {
            // すべての頂点と辺を追加
            for (const vector<Vertex *> &edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 頂点数を取得 */
        int size() {
            return adjList.size();
        }

        /* 辺を追加 */
        void addEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("頂点が存在しません");
            // 辺 vet1 - vet2 を追加
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* 辺を削除 */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("頂点が存在しません");
            // 辺 vet1 - vet2 を削除
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* 頂点を追加 */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // 隣接リストに新しいリストを追加
            adjList[vet] = vector<Vertex *>();
        }

        /* 頂点を削除 */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("頂点が存在しません");
            // 隣接リストから頂点 vet に対応するリストを削除
            adjList.erase(vet);
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* 隣接リストを出力 */
        void print() {
            cout << "隣接リスト =" << endl;
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
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        Map<Vertex, List<Vertex>> adjList;

        /* コンストラクタ */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new HashMap<>();
            // すべての頂点と辺を追加
            for (Vertex[] edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* 頂点数を取得 */
        public int size() {
            return adjList.size();
        }

        /* 辺を追加 */
        public void addEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // 辺 vet1 - vet2 を追加
            adjList.get(vet1).add(vet2);
            adjList.get(vet2).add(vet1);
        }

        /* 辺を削除 */
        public void removeEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // 辺 vet1 - vet2 を削除
            adjList.get(vet1).remove(vet2);
            adjList.get(vet2).remove(vet1);
        }

        /* 頂点を追加 */
        public void addVertex(Vertex vet) {
            if (adjList.containsKey(vet))
                return;
            // 隣接リストに新しいリストを追加
            adjList.put(vet, new ArrayList<>());
        }

        /* 頂点を削除 */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // 隣接リストから頂点 vet に対応するリストを削除
            adjList.remove(vet);
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for (List<Vertex> list : adjList.values()) {
                list.remove(vet);
            }
        }

        /* 隣接リストを出力 */
        public void print() {
            System.out.println("隣接リスト =");
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
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* コンストラクタ */
        public GraphAdjList(Vertex[][] edges) {
            adjList = [];
            // すべての頂点と辺を追加
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* 頂点数を取得 */
        int Size() {
            return adjList.Count;
        }

        /* 辺を追加 */
        public void AddEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 辺 vet1 - vet2 を追加
            adjList[vet1].Add(vet2);
            adjList[vet2].Add(vet1);
        }

        /* 辺を削除 */
        public void RemoveEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 辺 vet1 - vet2 を削除
            adjList[vet1].Remove(vet2);
            adjList[vet2].Remove(vet1);
        }

        /* 頂点を追加 */
        public void AddVertex(Vertex vet) {
            if (adjList.ContainsKey(vet))
                return;
            // 隣接リストに新しいリストを追加
            adjList.Add(vet, []);
        }

        /* 頂点を削除 */
        public void RemoveVertex(Vertex vet) {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // 隣接リストから頂点 vet に対応するリストを削除
            adjList.Remove(vet);
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            foreach (List<Vertex> list in adjList.Values) {
                list.Remove(vet);
            }
        }

        /* 隣接リストを出力 */
        public void Print() {
            Console.WriteLine("隣接リスト =");
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
    /* 隣接リストに基づく無向グラフクラス */
    type graphAdjList struct {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        adjList map[Vertex][]Vertex
    }

    /* コンストラクタ */
    func newGraphAdjList(edges [][]Vertex) *graphAdjList {
        g := &graphAdjList{
            adjList: make(map[Vertex][]Vertex),
        }
        // すべての頂点と辺を追加
        for _, edge := range edges {
            g.addVertex(edge[0])
            g.addVertex(edge[1])
            g.addEdge(edge[0], edge[1])
        }
        return g
    }

    /* 頂点数を取得 */
    func (g *graphAdjList) size() int {
        return len(g.adjList)
    }

    /* 辺を追加 */
    func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // 辺 `vet1 - vet2` を追加し、無名 `struct{}` を追加する
        g.adjList[vet1] = append(g.adjList[vet1], vet2)
        g.adjList[vet2] = append(g.adjList[vet2], vet1)
    }

    /* 辺を削除 */
    func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // 辺 vet1 - vet2 を削除
        g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
        g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
    }

    /* 頂点を追加 */
    func (g *graphAdjList) addVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if ok {
            return
        }
        // 隣接リストに新しいリストを追加
        g.adjList[vet] = make([]Vertex, 0)
    }

    /* 頂点を削除 */
    func (g *graphAdjList) removeVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if !ok {
            panic("error")
        }
        // 隣接リストから頂点 vet に対応するリストを削除
        delete(g.adjList, vet)
        // 他の頂点のリストを走査し、vet を含むすべての辺を削除
        for v, list := range g.adjList {
            g.adjList[v] = DeleteSliceElms(list, vet)
        }
    }

    /* 隣接リストを出力 */
    func (g *graphAdjList) print() {
        var builder strings.Builder
        fmt.Printf("隣接リスト = \n")
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
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        public private(set) var adjList: [Vertex: [Vertex]]

        /* コンストラクタ */
        public init(edges: [[Vertex]]) {
            adjList = [:]
            // すべての頂点と辺を追加
            for edge in edges {
                addVertex(vet: edge[0])
                addVertex(vet: edge[1])
                addEdge(vet1: edge[0], vet2: edge[1])
            }
        }

        /* 頂点数を取得 */
        public func size() -> Int {
            adjList.count
        }

        /* 辺を追加 */
        public func addEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("引数エラー")
            }
            // 辺 vet1 - vet2 を追加
            adjList[vet1]?.append(vet2)
            adjList[vet2]?.append(vet1)
        }

        /* 辺を削除 */
        public func removeEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("引数エラー")
            }
            // 辺 vet1 - vet2 を削除
            adjList[vet1]?.removeAll { $0 == vet2 }
            adjList[vet2]?.removeAll { $0 == vet1 }
        }

        /* 頂点を追加 */
        public func addVertex(vet: Vertex) {
            if adjList[vet] != nil {
                return
            }
            // 隣接リストに新しいリストを追加
            adjList[vet] = []
        }

        /* 頂点を削除 */
        public func removeVertex(vet: Vertex) {
            if adjList[vet] == nil {
                fatalError("引数エラー")
            }
            // 隣接リストから頂点 vet に対応するリストを削除
            adjList.removeValue(forKey: vet)
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for key in adjList.keys {
                adjList[key]?.removeAll { $0 == vet }
            }
        }

        /* 隣接リストを出力 */
        public func print() {
            Swift.print("隣接リスト =")
            for (vertex, list) in adjList {
                let list = list.map { $0.val }
                Swift.print("\(vertex.val): \(list),")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        adjList;

        /* コンストラクタ */
        constructor(edges) {
            this.adjList = new Map();
            // すべての頂点と辺を追加
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 頂点数を取得 */
        size() {
            return this.adjList.size;
        }

        /* 辺を追加 */
        addEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 辺 vet1 - vet2 を追加
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* 辺を削除 */
        removeEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 辺 vet1 - vet2 を削除
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* 頂点を追加 */
        addVertex(vet) {
            if (this.adjList.has(vet)) return;
            // 隣接リストに新しいリストを追加
            this.adjList.set(vet, []);
        }

        /* 頂点を削除 */
        removeVertex(vet) {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 隣接リストから頂点 vet に対応するリストを削除
            this.adjList.delete(vet);
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for (const set of this.adjList.values()) {
                const index = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 隣接リストを出力 */
        print() {
            console.log('隣接リスト =');
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
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        adjList: Map<Vertex, Vertex[]>;

        /* コンストラクタ */
        constructor(edges: Vertex[][]) {
            this.adjList = new Map();
            // すべての頂点と辺を追加
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* 頂点数を取得 */
        size(): number {
            return this.adjList.size;
        }

        /* 辺を追加 */
        addEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 辺 vet1 - vet2 を追加
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* 辺を削除 */
        removeEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
            ) {
                throw new Error('Illegal Argument Exception');
            }
            // 辺 vet1 - vet2 を削除
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* 頂点を追加 */
        addVertex(vet: Vertex): void {
            if (this.adjList.has(vet)) return;
            // 隣接リストに新しいリストを追加
            this.adjList.set(vet, []);
        }

        /* 頂点を削除 */
        removeVertex(vet: Vertex): void {
            if (!this.adjList.has(vet)) {
                throw new Error('Illegal Argument Exception');
            }
            // 隣接リストから頂点 vet に対応するリストを削除
            this.adjList.delete(vet);
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for (const set of this.adjList.values()) {
                const index: number = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* 隣接リストを出力 */
        print(): void {
            console.log('隣接リスト =');
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
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList {
      // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
      Map<Vertex, List<Vertex>> adjList = {};

      /* コンストラクタ */
      GraphAdjList(List<List<Vertex>> edges) {
        for (List<Vertex> edge in edges) {
          addVertex(edge[0]);
          addVertex(edge[1]);
          addEdge(edge[0], edge[1]);
        }
      }

      /* 頂点数を取得 */
      int size() {
        return adjList.length;
      }

      /* 辺を追加 */
      void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // 辺 vet1 - vet2 を追加
        adjList[vet1]!.add(vet2);
        adjList[vet2]!.add(vet1);
      }

      /* 辺を削除 */
      void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // 辺 vet1 - vet2 を削除
        adjList[vet1]!.remove(vet2);
        adjList[vet2]!.remove(vet1);
      }

      /* 頂点を追加 */
      void addVertex(Vertex vet) {
        if (adjList.containsKey(vet)) return;
        // 隣接リストに新しいリストを追加
        adjList[vet] = [];
      }

      /* 頂点を削除 */
      void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet)) {
          throw ArgumentError;
        }
        // 隣接リストから頂点 vet に対応するリストを削除
        adjList.remove(vet);
        // 他の頂点のリストを走査し、vet を含むすべての辺を削除
        adjList.forEach((key, value) {
          value.remove(vet);
        });
      }

      /* 隣接リストを出力 */
      void printAdjList() {
        print("隣接リスト =");
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
    /* 隣接リストに基づく無向グラフ型 */
    pub struct GraphAdjList {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        pub adj_list: HashMap<Vertex, Vec<Vertex>>, // maybe HashSet<Vertex> for value part is better?
    }

    impl GraphAdjList {
        /* コンストラクタ */
        pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
            let mut graph = GraphAdjList {
                adj_list: HashMap::new(),
            };
            // すべての頂点と辺を追加
            for edge in edges {
                graph.add_vertex(edge[0]);
                graph.add_vertex(edge[1]);
                graph.add_edge(edge[0], edge[1]);
            }

            graph
        }

        /* 頂点数を取得 */
        #[allow(unused)]
        pub fn size(&self) -> usize {
            self.adj_list.len()
        }

        /* 辺を追加 */
        pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("value error");
            }
            // 辺 vet1 - vet2 を追加
            self.adj_list.entry(vet1).or_default().push(vet2);
            self.adj_list.entry(vet2).or_default().push(vet1);
        }

        /* 辺を削除 */
        #[allow(unused)]
        pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("value error");
            }
            // 辺 vet1 - vet2 を削除
            self.adj_list
                .entry(vet1)
                .and_modify(|v| v.retain(|&e| e != vet2));
            self.adj_list
                .entry(vet2)
                .and_modify(|v| v.retain(|&e| e != vet1));
        }

        /* 頂点を追加 */
        pub fn add_vertex(&mut self, vet: Vertex) {
            if self.adj_list.contains_key(&vet) {
                return;
            }
            // 隣接リストに新しいリストを追加
            self.adj_list.insert(vet, vec![]);
        }

        /* 頂点を削除 */
        #[allow(unused)]
        pub fn remove_vertex(&mut self, vet: Vertex) {
            // 隣接リストから頂点 vet に対応するリストを削除
            self.adj_list.remove(&vet);
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for list in self.adj_list.values_mut() {
                list.retain(|&v| v != vet);
            }
        }

        /* 隣接リストを出力 */
        pub fn print(&self) {
            println!("隣接リスト =");
            for (vertex, list) in &self.adj_list {
                let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
                println!("{}: {:?},", vertex.val, list);
            }
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    /* ノード構造体 */
    typedef struct AdjListNode {
        Vertex *vertex;           // 頂点
        struct AdjListNode *next; // 後続ノード
    } AdjListNode;

    /* 頂点に対応するノードを検索 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 辺を追加する補助関数 */
    void addEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
        node->vertex = vet;
        // 先頭挿入法
        node->next = head->next;
        head->next = node;
    }

    /* 辺削除の補助関数 */
    void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *pre = head;
        AdjListNode *cur = head->next;
        // 連結リスト内で vet に対応するノードを探索
        while (cur != NULL && cur->vertex != vet) {
            pre = cur;
            cur = cur->next;
        }
        if (cur == NULL)
            return;
        // vet に対応するノードを連結リストから削除
        pre->next = cur->next;
        // メモリを解放する
        free(cur);
    }

    /* 隣接リストに基づく無向グラフクラス */
    typedef struct {
        AdjListNode *heads[MAX_SIZE]; // ノード配列
        int size;                     // ノード数
    } GraphAdjList;

    /* コンストラクタ */
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

    /* デストラクタ */
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

    /* 頂点に対応するノードを検索 */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* 辺を追加 */
    void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL && head1 != head2);
        // 辺 vet1 - vet2 を追加
        addEdgeHelper(head1, vet2);
        addEdgeHelper(head2, vet1);
    }

    /* 辺を削除 */
    void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL);
        // 辺 vet1 - vet2 を削除
        removeEdgeHelper(head1, head2->vertex);
        removeEdgeHelper(head2, head1->vertex);
    }

    /* 頂点を追加 */
    void addVertex(GraphAdjList *graph, Vertex *vet) {
        assert(graph != NULL && graph->size < MAX_SIZE);
        AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
        head->vertex = vet;
        head->next = NULL;
        // 隣接リストに新しいリストを追加
        graph->heads[graph->size++] = head;
    }

    /* 頂点を削除 */
    void removeVertex(GraphAdjList *graph, Vertex *vet) {
        AdjListNode *node = findNode(graph, vet);
        assert(node != NULL);
        // 隣接リストから頂点 vet に対応するリストを削除
        AdjListNode *cur = node, *pre = NULL;
        while (cur) {
            pre = cur;
            cur = cur->next;
            free(pre);
        }
        // 他の頂点のリストを走査し、vet を含むすべての辺を削除
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
        // この頂点より後ろの頂点を前に詰めて欠損を埋める
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
    /* 隣接リストに基づく無向グラフクラス */
    class GraphAdjList(edges: Array<Array<Vertex?>>) {
        // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        val adjList = HashMap<Vertex, MutableList<Vertex>>()

        /* コンストラクタ */
        init {
            // すべての頂点と辺を追加
            for (edge in edges) {
                addVertex(edge[0]!!)
                addVertex(edge[1]!!)
                addEdge(edge[0]!!, edge[1]!!)
            }
        }

        /* 頂点数を取得 */
        fun size(): Int {
            return adjList.size
        }

        /* 辺を追加 */
        fun addEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // 辺 vet1 - vet2 を追加
            adjList[vet1]?.add(vet2)
            adjList[vet2]?.add(vet1)
        }

        /* 辺を削除 */
        fun removeEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // 辺 vet1 - vet2 を削除
            adjList[vet1]?.remove(vet2)
            adjList[vet2]?.remove(vet1)
        }

        /* 頂点を追加 */
        fun addVertex(vet: Vertex) {
            if (adjList.containsKey(vet))
                return
            // 隣接リストに新しいリストを追加
            adjList[vet] = mutableListOf()
        }

        /* 頂点を削除 */
        fun removeVertex(vet: Vertex) {
            if (!adjList.containsKey(vet))
                throw IllegalArgumentException()
            // 隣接リストから頂点 vet に対応するリストを削除
            adjList.remove(vet)
            // 他の頂点のリストを走査し、vet を含むすべての辺を削除
            for (list in adjList.values) {
                list.remove(vet)
            }
        }

        /* 隣接リストを出力 */
        fun print() {
            println("隣接リスト =")
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
    ### 隣接リストで実装した無向グラフクラス ###
    class GraphAdjList
      attr_reader :adj_list
      
      ### コンストラクタ ###
      def initialize(edges)
        # 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
        @adj_list = {}
        # すべての頂点と辺を追加
        for edge in edges
          add_vertex(edge[0])
          add_vertex(edge[1])
          add_edge(edge[0], edge[1])
        end
      end

      ### 頂点数を取得 ###
      def size
        @adj_list.length
      end

      ### 辺を追加 ###
      def add_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

        @adj_list[vet1] << vet2
        @adj_list[vet2] << vet1
      end

      ### 辺を削除 ###
      def remove_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

        # 辺 vet1 - vet2 を削除
        @adj_list[vet1].delete(vet2)
        @adj_list[vet2].delete(vet1)
      end

      ### 頂点を追加 ###
      def add_vertex(vet)
        return if @adj_list.include?(vet)

        # 隣接リストに新しいリストを追加
        @adj_list[vet] = []
      end

      ### 頂点を削除 ###
      def remove_vertex(vet)
        raise ArgumentError unless @adj_list.include?(vet)

        # 隣接リストから頂点 vet に対応するリストを削除
        @adj_list.delete(vet)
        # 他の頂点のリストを走査し、vet を含むすべての辺を削除
        for vertex in @adj_list
          @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
        end
      end

      ### 隣接リストを出力 ###
      def __print__
        puts '隣接リスト ='
        for vertex in @adj_list
          tmp = @adj_list[vertex.first].map { |v| v.val }
          puts "#{vertex.first.val}: #{tmp},"
        end
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%27Vertex%27%5D%3A%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1%2C%203%2C%202%2C%205%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%20%5Bv%5B2%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B2%5D%2C%20v%5B4%5D%5D%2C%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%20%20%20%20graph.add_edge%28v%5B0%5D%2C%20v%5B2%5D%29%0A%20%20%20%20graph.remove_edge%28v%5B0%5D%2C%20v%5B1%5D%29%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%27Vertex%27%5D%3A%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0Aclass%20GraphAdjList%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex%2C%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D%2C%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self%2C%20vet1%3A%20Vertex%2C%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self%2C%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1%2C%203%2C%202%2C%205%2C%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%5Bv%5B0%5D%2C%20v%5B1%5D%5D%2C%20%5Bv%5B0%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B1%5D%2C%20v%5B2%5D%5D%2C%20%5Bv%5B2%5D%2C%20v%5B3%5D%5D%2C%20%5Bv%5B2%5D%2C%20v%5B4%5D%5D%2C%20%5Bv%5B3%5D%2C%20v%5B4%5D%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%20%20%20%20graph.add_edge%28v%5B0%5D%2C%20v%5B2%5D%29%0A%20%20%20%20graph.remove_edge%28v%5B0%5D%2C%20v%5B1%5D%29%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 9.2.3 &nbsp; 効率の比較

グラフに $n$ 個の頂点と $m$ 本の辺があるとすると、次の表は隣接行列と隣接リストの時間効率および空間効率を比較したものです。なお、隣接リスト（連結リスト）は本記事の実装に対応し、隣接リスト（ハッシュテーブル）はすべての連結リストをハッシュテーブルに置き換えた実装を指します。

<p align="center"> 表 9-2 &nbsp; 隣接行列と隣接リストの比較 </p>

<div class="center-table" markdown>

|              | 隣接行列 | 隣接リスト（連結リスト） | 隣接リスト（ハッシュテーブル） |
| ------------ | -------- | -------------- | ---------------- |
| 隣接判定     | $O(1)$   | $O(n)$         | $O(1)$           |
| 辺の追加     | $O(1)$   | $O(1)$         | $O(1)$           |
| 辺の削除     | $O(1)$   | $O(n)$         | $O(1)$           |
| 頂点の追加   | $O(n)$   | $O(1)$         | $O(1)$           |
| 頂点の削除   | $O(n^2)$ | $O(n + m)$     | $O(n)$           |
| メモリ使用量 | $O(n^2)$ | $O(n + m)$     | $O(n + m)$       |

</div>

上表を見ると、隣接リスト（ハッシュテーブル）の時間効率と空間効率が最も優れているように見えます。しかし実際には、隣接行列のほうが辺の操作効率は高く、必要なのは 1 回の配列アクセスまたは代入だけです。総合的に見ると、隣接行列は「空間を時間と引き換えにする」原則を体現し、隣接リストは「時間を空間と引き換えにする」原則を体現しています。
