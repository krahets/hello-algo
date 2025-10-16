---
comments: true
---

# 9.2 &nbsp; グラフの基本操作

グラフの基本操作は「辺」に対する操作と「頂点」に対する操作に分けることができます。「隣接行列」と「隣接リスト」の2つの表現方法の下では、実装が異なります。

## 9.2.1 &nbsp; 隣接行列に基づく実装

$n$個の頂点を持つ無向グラフが与えられた場合、さまざまな操作は下図のように実装されます。

- **辺の追加または削除**：隣接行列内の指定された辺を直接変更し、$O(1)$時間を使用します。無向グラフであるため、両方向の辺を同時に更新する必要があります。
- **頂点の追加**：隣接行列の末尾に行と列を追加し、すべて$0$で埋めます。$O(n)$時間を使用します。
- **頂点の削除**：隣接行列内の行と列を削除します。最悪の場合は最初の行と列が削除されるときで、$(n-1)^2$個の要素を「上と左に移動」する必要があり、$O(n^2)$時間を使用します。
- **初期化**：$n$個の頂点を渡し、長さ$n$の頂点リスト`vertices`を初期化し、$O(n)$時間を使用します。$n \times n$サイズの隣接行列`adjMat`を初期化し、$O(n^2)$時間を使用します。

=== "隣接行列の初期化"
    ![隣接行列での初期化、辺の追加と削除、頂点の追加と削除](graph_operations.assets/adjacency_matrix_step1_initialization.png){ class="animation-figure" }

=== "辺の追加"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.png){ class="animation-figure" }

=== "辺の削除"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.png){ class="animation-figure" }

=== "頂点の追加"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.png){ class="animation-figure" }

=== "頂点の削除"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> 図 9-7 &nbsp; 隣接行列での初期化、辺の追加と削除、頂点の追加と削除 </p>

以下は隣接行列を使用して表現されたグラフの実装コードです：

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """隣接行列に基づく無向グラフクラス"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """コンストラクタ"""
            # 頂点リスト、要素は「頂点値」を表し、インデックスは「頂点インデックス」を表す
            self.vertices: list[int] = []
            # 隣接行列、行と列のインデックスは「頂点インデックス」に対応
            self.adj_mat: list[list[int]] = []
            # 頂点を追加
            for val in vertices:
                self.add_vertex(val)
            # 辺を追加
            # edges要素は頂点インデックスを表す
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """頂点数を取得"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """頂点を追加"""
            n = self.size()
            # 頂点リストに新しい頂点値を追加
            self.vertices.append(val)
            # 隣接行列に行を追加
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # 隣接行列に列を追加
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """頂点を削除"""
            if index >= self.size():
                raise IndexError()
            # 頂点リストから`index`の頂点を削除
            self.vertices.pop(index)
            # 隣接行列から`index`の行を削除
            self.adj_mat.pop(index)
            # 隣接行列から`index`の列を削除
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """辺を追加"""
            # パラメータi、jは頂点要素のインデックスに対応
            # インデックスの範囲外と等価性を処理
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # 無向グラフでは、隣接行列は主対角線について対称、すなわち (i, j) == (j, i) を満たす
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """辺を削除"""
            # パラメータi、jは頂点要素のインデックスに対応
            # インデックスの範囲外と等価性を処理
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
        vector<int> vertices;       // 頂点リスト、要素は「頂点値」を表し、インデックスは「頂点インデックス」を表す
        vector<vector<int>> adjMat; // 隣接行列、行と列のインデックスは「頂点インデックス」に対応

      public:
        /* コンストラクタ */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // 頂点を追加
            for (int val : vertices) {
                addVertex(val);
            }
            // 辺を追加
            // 辺の要素は頂点インデックスを表す
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
            // 頂点リストに新しい頂点値を追加
            vertices.push_back(val);
            // 隣接行列に行を追加
            adjMat.emplace_back(vector<int>(n, 0));
            // 隣接行列に列を追加
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* 頂点を削除 */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("Vertex does not exist");
            }
            // 頂点リストから`index`の頂点を削除
            vertices.erase(vertices.begin() + index);
            // 隣接行列から`index`の行を削除
            adjMat.erase(adjMat.begin() + index);
            // 隣接行列から`index`の列を削除
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* 辺を追加 */
        // パラメータi、jは頂点要素のインデックスに対応
        void addEdge(int i, int j) {
            // インデックス範囲外と等価性を処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("Vertex does not exist");
            }
            // 無向グラフでは、隣接行列は主対角線について対称、即ち(i, j) == (j, i)を満たす
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 辺を削除 */
        // パラメータi、jは頂点要素のインデックスに対応
        void removeEdge(int i, int j) {
            // インデックス範囲外と等価性を処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("Vertex does not exist");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* 隣接行列を印刷 */
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
        List<Integer> vertices; // 頂点リスト、要素は「頂点値」を表し、インデックスは「頂点インデックス」を表す
        List<List<Integer>> adjMat; // 隣接行列、行と列のインデックスは「頂点インデックス」に対応

        /* コンストラクタ */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // 頂点を追加
            for (int val : vertices) {
                addVertex(val);
            }
            // 辺を追加
            // 辺の要素は頂点インデックスを表す
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
            // 頂点リストに新しい頂点値を追加
            vertices.add(val);
            // 隣接行列に行を追加
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // 隣接行列に列を追加
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* 頂点を削除 */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // 頂点リストから `index` の頂点を削除
            vertices.remove(index);
            // 隣接行列から `index` の行を削除
            adjMat.remove(index);
            // 隣接行列から `index` の列を削除
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* 辺を追加 */
        // パラメータ i、j は頂点要素のインデックスに対応
        public void addEdge(int i, int j) {
            // インデックスの範囲外と等価性を処理
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // 無向グラフでは、隣接行列は主対角線について対称、すなわち (i, j) == (j, i) を満たす
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* 辺を削除 */
        // パラメータ i、j は頂点要素のインデックスに対応
        public void removeEdge(int i, int j) {
            // インデックスの範囲外と等価性を処理
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
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    [class]{graphAdjMat}-[func]{}
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "C"

    ```c title="graph_adjacency_matrix.c"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_matrix.kt"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_matrix.rb"
    [class]{GraphAdjMat}-[func]{}
    ```

=== "Zig"

    ```zig title="graph_adjacency_matrix.zig"
    [class]{GraphAdjMat}-[func]{}
    ```

## 9.2.2 &nbsp; 隣接リストに基づく実装

総計$n$個の頂点と$m$個の辺を持つ無向グラフが与えられた場合、さまざまな操作は下図のように実装できます。

- **辺の追加**：対応する頂点の連結リストの末尾に辺を追加するだけで、$O(1)$時間を使用します。無向グラフであるため、両方向に同時に辺を追加する必要があります。
- **辺の削除**：対応する頂点の連結リスト内で指定された辺を見つけて削除し、$O(m)$時間を使用します。無向グラフでは、両方向の辺を同時に削除する必要があります。
- **頂点の追加**：隣接リストに連結リストを追加し、新しい頂点をリストのヘッドノードにし、$O(1)$時間を使用します。
- **頂点の削除**：隣接リスト全体を走査し、指定された頂点を含むすべての辺を削除する必要があり、$O(n + m)$時間を使用します。
- **初期化**：隣接リストに$n$個の頂点と$2m$個の辺を作成し、$O(n + m)$時間を使用します。

=== "隣接リストの初期化"
    ![隣接リストでの初期化、辺の追加と削除、頂点の追加と削除](graph_operations.assets/adjacency_list_step1_initialization.png){ class="animation-figure" }

=== "辺の追加"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.png){ class="animation-figure" }

=== "辺の削除"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.png){ class="animation-figure" }

=== "頂点の追加"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.png){ class="animation-figure" }

=== "頂点の削除"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> 図 9-8 &nbsp; 隣接リストでの初期化、辺の追加と削除、頂点の追加と削除 </p>

以下は隣接リストのコード実装です。上図と比較して、実際のコードには以下の違いがあります。

- 頂点の追加と削除の便宜、およびコードの簡素化のため、連結リストの代わりにリスト（動的配列）を使用します。
- ハッシュテーブルを使用して隣接リストを格納し、`key`が頂点インスタンス、`value`がその頂点の隣接頂点のリスト（連結リスト）です。

さらに、隣接リストで頂点を表現するために`Vertex`クラスを使用します。その理由は：隣接行列のようにリストインデックスを使用して異なる頂点を区別する場合、インデックス$i$の頂点を削除したい場合、隣接リスト全体を走査し、$i$より大きいすべてのインデックスを1つずつ減少させる必要があり、これは非常に非効率的です。しかし、各頂点が一意の`Vertex`インスタンスである場合、頂点を削除しても他の頂点に変更を加える必要がありません。

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """隣接リストに基づく無向グラフクラス"""

        def __init__(self, edges: list[list[Vertex]]):
            """コンストラクタ"""
            # 隣接リスト、キー: 頂点、値: その頂点の隣接する全頂点
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
            # 隣接リストに新しい連結リストを追加
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """頂点を削除"""
            if vet not in self.adj_list:
                raise ValueError()
            # 隣接リストから頂点vetに対応する連結リストを削除
            self.adj_list.pop(vet)
            # 他の頂点の連結リストを走査し、vetを含むすべての辺を削除
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
        // 隣接リスト、キー：頂点、値：その頂点のすべての隣接頂点
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* ベクターから指定されたノードを削除 */
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
                throw invalid_argument("Vertex does not exist");
            // 辺 vet1 - vet2 を追加
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* 辺を削除 */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("Vertex does not exist");
            // 辺 vet1 - vet2 を削除
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* 頂点を追加 */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // 隣接リストに新しい連結リストを追加
            adjList[vet] = vector<Vertex *>();
        }

        /* 頂点を削除 */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("Vertex does not exist");
            // 隣接リストから頂点vetに対応する連結リストを削除
            adjList.erase(vet);
            // 他の頂点の連結リストを走査し、vetを含むすべての辺を削除
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* 隣接リストを印刷 */
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
        // 隣接リスト、キー: 頂点、値: その頂点のすべての隣接頂点
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
            // 隣接リストに新しい連結リストを追加
            adjList.put(vet, new ArrayList<>());
        }

        /* 頂点を削除 */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // 隣接リストから頂点 vet に対応する連結リストを削除
            adjList.remove(vet);
            // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除
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
    [class]{GraphAdjList}-[func]{}
    ```

=== "Go"

    ```go title="graph_adjacency_list.go"
    [class]{graphAdjList}-[func]{}
    ```

=== "Swift"

    ```swift title="graph_adjacency_list.swift"
    [class]{GraphAdjList}-[func]{}
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    [class]{GraphAdjList}-[func]{}
    ```

=== "TS"

    ```typescript title="graph_adjacency_list.ts"
    [class]{GraphAdjList}-[func]{}
    ```

=== "Dart"

    ```dart title="graph_adjacency_list.dart"
    [class]{GraphAdjList}-[func]{}
    ```

=== "Rust"

    ```rust title="graph_adjacency_list.rs"
    [class]{GraphAdjList}-[func]{}
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    [class]{AdjListNode}-[func]{}

    [class]{GraphAdjList}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_list.kt"
    [class]{GraphAdjList}-[func]{}
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_list.rb"
    [class]{GraphAdjList}-[func]{}
    ```

=== "Zig"

    ```zig title="graph_adjacency_list.zig"
    [class]{GraphAdjList}-[func]{}
    ```

## 9.2.3 &nbsp; 効率の比較

グラフに$n$個の頂点と$m$個の辺があると仮定すると、下表は隣接行列と隣接リストの時間効率と空間効率を比較しています。

<p align="center"> 表 9-2 &nbsp; 隣接行列と隣接リストの比較 </p>

<div class="center-table" markdown>

|                  | 隣接行列       | 隣接リスト（連結リスト） | 隣接リスト（ハッシュテーブル） |
| ---------------- | -------------- | ----------------------- | ----------------------------- |
| 隣接性の判定     | $O(1)$         | $O(m)$                  | $O(1)$                        |
| 辺の追加         | $O(1)$         | $O(1)$                  | $O(1)$                        |
| 辺の削除         | $O(1)$         | $O(m)$                  | $O(1)$                        |
| 頂点の追加       | $O(n)$         | $O(1)$                  | $O(1)$                        |
| 頂点の削除       | $O(n^2)$       | $O(n + m)$              | $O(n)$                        |
| メモリ空間使用量 | $O(n^2)$       | $O(n + m)$              | $O(n + m)$                    |

</div>

上表を観察すると、隣接リスト（ハッシュテーブル）が最高の時間効率と空間効率を持っているように見えます。しかし、実際には、隣接行列での辺に対する操作がより効率的で、単一の配列アクセスまたは代入操作のみが必要です。全体的に、隣接行列は「空間と時間のトレードオフ」の原則を例示し、隣接リストは「時間と空間のトレードオフ」を例示しています。
