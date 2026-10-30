---
comments: true
---

# 9.2 &nbsp; Basic graph operations

Basic graph operations fall into two categories: operations on edges and operations on vertices. Their implementations differ depending on whether the graph is represented by an adjacency matrix or an adjacency list.

## 9.2.1 &nbsp; Adjacency matrix implementation

For an undirected graph with $n$ vertices, the operations are implemented as shown in Figure 9-7.

- **Add or remove an edge**: Modify the corresponding entry in the adjacency matrix directly, taking $O(1)$ time. Since the graph is undirected, update the edge in both directions.
- **Add a vertex**: Append one row and one column to the adjacency matrix and fill them with $0$, taking $O(n)$ time.
- **Remove a vertex**: Delete the corresponding row and column from the adjacency matrix. The worst case occurs when deleting the first row and column: $(n-1)^2$ entries must be shifted up and to the left, taking $O(n^2)$ time.
- **Initialize the graph**: Given $n$ vertices, initialize the vertex list `vertices` of length $n$ in $O(n)$ time, then initialize the $n \times n$ adjacency matrix `adjMat` in $O(n^2)$ time.

=== "<1>"
    ![Initializing an adjacency matrix and adding or removing edges and vertices](graph_operations.assets/adjacency_matrix_step1_initialization.png){ class="animation-figure" }

=== "<2>"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.png){ class="animation-figure" }

=== "<3>"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.png){ class="animation-figure" }

=== "<4>"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.png){ class="animation-figure" }

=== "<5>"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> Figure 9-7 &nbsp; Initializing an adjacency matrix and adding or removing edges and vertices </p>

The following code implements a graph using an adjacency matrix:

=== "Python"

    ```python title="graph_adjacency_matrix.py"
    class GraphAdjMat:
        """Undirected graph class implemented with an adjacency matrix"""

        def __init__(self, vertices: list[int], edges: list[list[int]]):
            """Constructor"""
            # Vertex list: elements are vertex values, and indices are vertex indices
            self.vertices: list[int] = []
            # Adjacency matrix: row and column indices correspond to vertex indices
            self.adj_mat: list[list[int]] = []
            # Add a vertex
            for val in vertices:
                self.add_vertex(val)
            # Add an edge
            # Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for e in edges:
                self.add_edge(e[0], e[1])

        def size(self) -> int:
            """Get the number of vertices"""
            return len(self.vertices)

        def add_vertex(self, val: int):
            """Add a vertex"""
            n = self.size()
            # Append the new vertex value to the vertex list
            self.vertices.append(val)
            # Add a row to the adjacency matrix
            new_row = [0] * n
            self.adj_mat.append(new_row)
            # Add a column to the adjacency matrix
            for row in self.adj_mat:
                row.append(0)

        def remove_vertex(self, index: int):
            """Remove a vertex"""
            if index >= self.size():
                raise IndexError()
            # Remove the vertex at index `index` from the vertex list
            self.vertices.pop(index)
            # Remove row `index` from the adjacency matrix
            self.adj_mat.pop(index)
            # Remove column `index` from the adjacency matrix
            for row in self.adj_mat:
                row.pop(index)

        def add_edge(self, i: int, j: int):
            """Add an edge"""
            # Parameters i and j are element indices in vertices
            # Handle out-of-bounds or equal indices
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            # For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            self.adj_mat[i][j] = 1
            self.adj_mat[j][i] = 1

        def remove_edge(self, i: int, j: int):
            """Remove an edge"""
            # Parameters i and j are element indices in vertices
            # Handle out-of-bounds or equal indices
            if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
                raise IndexError()
            self.adj_mat[i][j] = 0
            self.adj_mat[j][i] = 0

        def print(self):
            """Print the adjacency matrix"""
            print("Vertex list =", self.vertices)
            print("Adjacency matrix =")
            print_matrix(self.adj_mat)
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
        vector<int> vertices;       // Vertex list: elements are vertex values, and indices are vertex indices
        vector<vector<int>> adjMat; // Adjacency matrix: row and column indices correspond to vertex indices

      public:
        /* Constructor */
        GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
            // Add a vertex
            for (int val : vertices) {
                addVertex(val);
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for (const vector<int> &edge : edges) {
                addEdge(edge[0], edge[1]);
            }
        }

        /* Get the number of vertices */
        int size() const {
            return vertices.size();
        }

        /* Add a vertex */
        void addVertex(int val) {
            int n = size();
            // Append the new vertex value to the vertex list
            vertices.push_back(val);
            // Add a row to the adjacency matrix
            adjMat.emplace_back(vector<int>(n, 0));
            // Add a column to the adjacency matrix
            for (vector<int> &row : adjMat) {
                row.push_back(0);
            }
        }

        /* Remove a vertex */
        void removeVertex(int index) {
            if (index >= size()) {
                throw out_of_range("Invalid vertex");
            }
            // Remove the vertex at index `index` from the vertex list
            vertices.erase(vertices.begin() + index);
            // Remove row `index` from the adjacency matrix
            adjMat.erase(adjMat.begin() + index);
            // Remove column `index` from the adjacency matrix
            for (vector<int> &row : adjMat) {
                row.erase(row.begin() + index);
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        void addEdge(int i, int j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("Invalid vertex");
            }
            // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        void removeEdge(int i, int j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
                throw out_of_range("Invalid vertex");
            }
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* Print the adjacency matrix */
        void print() {
            cout << "Vertex list = ";
            printVector(vertices);
            cout << "Adjacency matrix =" << endl;
            printVectorMatrix(adjMat);
        }
    };
    ```

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
        List<Integer> vertices; // Vertex list: elements are vertex values, and indices are vertex indices
        List<List<Integer>> adjMat; // Adjacency matrix: row and column indices correspond to vertex indices

        /* Constructor */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = new ArrayList<>();
            this.adjMat = new ArrayList<>();
            // Add a vertex
            for (int val : vertices) {
                addVertex(val);
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for (int[] e : edges) {
                addEdge(e[0], e[1]);
            }
        }

        /* Get the number of vertices */
        public int size() {
            return vertices.size();
        }

        /* Add a vertex */
        public void addVertex(int val) {
            int n = size();
            // Append the new vertex value to the vertex list
            vertices.add(val);
            // Add a row to the adjacency matrix
            List<Integer> newRow = new ArrayList<>(n);
            for (int j = 0; j < n; j++) {
                newRow.add(0);
            }
            adjMat.add(newRow);
            // Add a column to the adjacency matrix
            for (List<Integer> row : adjMat) {
                row.add(0);
            }
        }

        /* Remove a vertex */
        public void removeVertex(int index) {
            if (index >= size())
                throw new IndexOutOfBoundsException();
            // Remove the vertex at index `index` from the vertex list
            vertices.remove(index);
            // Remove row `index` from the adjacency matrix
            adjMat.remove(index);
            // Remove column `index` from the adjacency matrix
            for (List<Integer> row : adjMat) {
                row.remove(index);
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        public void addEdge(int i, int j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            adjMat.get(i).set(j, 1);
            adjMat.get(j).set(i, 1);
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        public void removeEdge(int i, int j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw new IndexOutOfBoundsException();
            adjMat.get(i).set(j, 0);
            adjMat.get(j).set(i, 0);
        }

        /* Print the adjacency matrix */
        public void print() {
            System.out.print("Vertex list = ");
            System.out.println(vertices);
            System.out.println("Adjacency matrix =");
            PrintUtil.printMatrix(adjMat);
        }
    }
    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
        List<int> vertices;     // Vertex list: elements are vertex values, and indices are vertex indices
        List<List<int>> adjMat; // Adjacency matrix: row and column indices correspond to vertex indices

        /* Constructor */
        public GraphAdjMat(int[] vertices, int[][] edges) {
            this.vertices = [];
            this.adjMat = [];
            // Add a vertex
            foreach (int val in vertices) {
                AddVertex(val);
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            foreach (int[] e in edges) {
                AddEdge(e[0], e[1]);
            }
        }

        /* Get the number of vertices */
        int Size() {
            return vertices.Count;
        }

        /* Add a vertex */
        public void AddVertex(int val) {
            int n = Size();
            // Append the new vertex value to the vertex list
            vertices.Add(val);
            // Add a row to the adjacency matrix
            List<int> newRow = new(n);
            for (int j = 0; j < n; j++) {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // Add a column to the adjacency matrix
            foreach (List<int> row in adjMat) {
                row.Add(0);
            }
        }

        /* Remove a vertex */
        public void RemoveVertex(int index) {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // Remove the vertex at index `index` from the vertex list
            vertices.RemoveAt(index);
            // Remove row `index` from the adjacency matrix
            adjMat.RemoveAt(index);
            // Remove column `index` from the adjacency matrix
            foreach (List<int> row in adjMat) {
                row.RemoveAt(index);
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        public void AddEdge(int i, int j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        public void RemoveEdge(int i, int j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }

        /* Print the adjacency matrix */
        public void Print() {
            Console.Write("Vertex list = ");
            PrintUtil.PrintList(vertices);
            Console.WriteLine("Adjacency matrix =");
            PrintUtil.PrintMatrix(adjMat);
        }
    }
    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"
    /* Undirected graph type implemented with an adjacency matrix */
    type graphAdjMat struct {
        // Vertex list: elements are vertex values, and indices are vertex indices
        vertices []int
        // Adjacency matrix: row and column indices correspond to vertex indices
        adjMat [][]int
    }

    /* Constructor */
    func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
        // Allocate the adjacency matrix for all vertices
        n := len(vertices)
        adjMat := make([][]int, n)
        for i := range adjMat {
            adjMat[i] = make([]int, n)
        }
        // Initialize the graph
        g := &graphAdjMat{
            vertices: vertices,
            adjMat:   adjMat,
        }
        // Add all edges
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for i := range edges {
            g.addEdge(edges[i][0], edges[i][1])
        }
        return g
    }

    /* Get the number of vertices */
    func (g *graphAdjMat) size() int {
        return len(g.vertices)
    }

    /* Add a vertex */
    func (g *graphAdjMat) addVertex(val int) {
        n := g.size()
        // Append the new vertex value to the vertex list
        g.vertices = append(g.vertices, val)
        // Add a row to the adjacency matrix
        newRow := make([]int, n)
        g.adjMat = append(g.adjMat, newRow)
        // Add a column to the adjacency matrix
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i], 0)
        }
    }

    /* Remove a vertex */
    func (g *graphAdjMat) removeVertex(index int) {
        if index >= g.size() {
            return
        }
        // Remove the vertex at index `index` from the vertex list
        g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
        // Remove row `index` from the adjacency matrix
        g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
        // Remove column `index` from the adjacency matrix
        for i := range g.adjMat {
            g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
        }
    }

    /* Add an edge */
    // Parameters i and j are element indices in vertices
    func (g *graphAdjMat) addEdge(i, j int) {
        // Check for out-of-bounds or equal indices (the constructed error is not returned)
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index out of bounds")
        }
        // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        g.adjMat[i][j] = 1
        g.adjMat[j][i] = 1
    }

    /* Remove an edge */
    // Parameters i and j are element indices in vertices
    func (g *graphAdjMat) removeEdge(i, j int) {
        // Check for out-of-bounds or equal indices (the constructed error is not returned)
        if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
            fmt.Errorf("%s", "Index out of bounds")
        }
        g.adjMat[i][j] = 0
        g.adjMat[j][i] = 0
    }

    /* Print the adjacency matrix */
    func (g *graphAdjMat) print() {
        fmt.Printf("\tVertex list = %v\n", g.vertices)
        fmt.Printf("\tAdjacency matrix = \n")
        for i := range g.adjMat {
            fmt.Printf("\t\t\t%v\n", g.adjMat[i])
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
        private var vertices: [Int] // Vertex list: elements are vertex values, and indices are vertex indices
        private var adjMat: [[Int]] // Adjacency matrix: row and column indices correspond to vertex indices

        /* Constructor */
        init(vertices: [Int], edges: [[Int]]) {
            self.vertices = []
            adjMat = []
            // Add all vertices
            for val in vertices {
                addVertex(val: val)
            }
            // Add all edges
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for e in edges {
                addEdge(i: e[0], j: e[1])
            }
        }

        /* Get the number of vertices */
        func size() -> Int {
            vertices.count
        }

        /* Add a vertex */
        func addVertex(val: Int) {
            let n = size()
            // Append the new vertex value to the vertex list
            vertices.append(val)
            // Add a row to the adjacency matrix
            let newRow = Array(repeating: 0, count: n)
            adjMat.append(newRow)
            // Add a column to the adjacency matrix
            for i in adjMat.indices {
                adjMat[i].append(0)
            }
        }

        /* Remove a vertex */
        func removeVertex(index: Int) {
            if index >= size() {
                fatalError("Invalid index")
            }
            // Remove the vertex at index `index` from the vertex list
            vertices.remove(at: index)
            // Remove row `index` from the adjacency matrix
            adjMat.remove(at: index)
            // Remove column `index` from the adjacency matrix
            for i in adjMat.indices {
                adjMat[i].remove(at: index)
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        func addEdge(i: Int, j: Int) {
            // Handle out-of-bounds or equal indices
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("Invalid index")
            }
            // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        func removeEdge(i: Int, j: Int) {
            // Handle out-of-bounds or equal indices
            if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
                fatalError("Invalid index")
            }
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* Print the adjacency matrix */
        func print() {
            Swift.print("Vertex list = ", terminator: "")
            Swift.print(vertices)
            Swift.print("Adjacency matrix =")
            PrintUtil.printMatrix(matrix: adjMat)
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_matrix.js"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
        vertices; // Vertex list: elements are vertex values, and indices are vertex indices
        adjMat; // Adjacency matrix: row and column indices correspond to vertex indices

        /* Constructor */
        constructor(vertices, edges) {
            this.vertices = [];
            this.adjMat = [];
            // Add a vertex
            for (const val of vertices) {
                this.addVertex(val);
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* Get the number of vertices */
        size() {
            return this.vertices.length;
        }

        /* Add a vertex */
        addVertex(val) {
            const n = this.size();
            // Append the new vertex value to the vertex list
            this.vertices.push(val);
            // Add a row to the adjacency matrix
            const newRow = [];
            for (let j = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // Add a column to the adjacency matrix
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* Remove a vertex */
        removeVertex(index) {
            if (index >= this.size()) {
                throw new RangeError('Index out of bounds');
            }
            // Remove the vertex at index `index` from the vertex list
            this.vertices.splice(index, 1);

            // Remove row `index` from the adjacency matrix
            this.adjMat.splice(index, 1);
            // Remove column `index` from the adjacency matrix
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        addEdge(i, j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index out of bounds');
            }
            // In an undirected graph, the adjacency matrix is symmetric about its main diagonal: (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        removeEdge(i, j) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index out of bounds');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* Print the adjacency matrix */
        print() {
            console.log('Vertex list = ', this.vertices);
            console.log('Adjacency matrix =', this.adjMat);
        }
    }
    ```

=== "TS"

    ```typescript title="graph_adjacency_matrix.ts"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
        vertices: number[]; // Vertex list: elements are vertex values, and indices are vertex indices
        adjMat: number[][]; // Adjacency matrix: row and column indices correspond to vertex indices

        /* Constructor */
        constructor(vertices: number[], edges: number[][]) {
            this.vertices = [];
            this.adjMat = [];
            // Add a vertex
            for (const val of vertices) {
                this.addVertex(val);
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for (const e of edges) {
                this.addEdge(e[0], e[1]);
            }
        }

        /* Get the number of vertices */
        size(): number {
            return this.vertices.length;
        }

        /* Add a vertex */
        addVertex(val: number): void {
            const n: number = this.size();
            // Append the new vertex value to the vertex list
            this.vertices.push(val);
            // Add a row to the adjacency matrix
            const newRow: number[] = [];
            for (let j: number = 0; j < n; j++) {
                newRow.push(0);
            }
            this.adjMat.push(newRow);
            // Add a column to the adjacency matrix
            for (const row of this.adjMat) {
                row.push(0);
            }
        }

        /* Remove a vertex */
        removeVertex(index: number): void {
            if (index >= this.size()) {
                throw new RangeError('Index out of bounds');
            }
            // Remove the vertex at index `index` from the vertex list
            this.vertices.splice(index, 1);

            // Remove row `index` from the adjacency matrix
            this.adjMat.splice(index, 1);
            // Remove column `index` from the adjacency matrix
            for (const row of this.adjMat) {
                row.splice(index, 1);
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        addEdge(i: number, j: number): void {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index out of bounds');
            }
            // In an undirected graph, the adjacency matrix is symmetric about its main diagonal: (i, j) === (j, i)
            this.adjMat[i][j] = 1;
            this.adjMat[j][i] = 1;
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        removeEdge(i: number, j: number): void {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
                throw new RangeError('Index out of bounds');
            }
            this.adjMat[i][j] = 0;
            this.adjMat[j][i] = 0;
        }

        /* Print the adjacency matrix */
        print(): void {
            console.log('Vertex list = ', this.vertices);
            console.log('Adjacency matrix =', this.adjMat);
        }
    }
    ```

=== "Dart"

    ```dart title="graph_adjacency_matrix.dart"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat {
      List<int> vertices = []; // Vertex entries: each element is a vertex value, and its index is the vertex index
      List<List<int>> adjMat = []; //Adjacency matrix: row and column indices correspond to vertex indices

      /* Constructor */
      GraphAdjMat(List<int> vertices, List<List<int>> edges) {
        this.vertices = [];
        this.adjMat = [];
        // Add a vertex
        for (int val in vertices) {
          addVertex(val);
        }
        // Add an edge
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for (List<int> e in edges) {
          addEdge(e[0], e[1]);
        }
      }

      /* Get the number of vertices */
      int size() {
        return vertices.length;
      }

      /* Add a vertex */
      void addVertex(int val) {
        int n = size();
        // Append the new vertex value to the vertex list
        vertices.add(val);
        // Add a row to the adjacency matrix
        List<int> newRow = List.filled(n, 0, growable: true);
        adjMat.add(newRow);
        // Add a column to the adjacency matrix
        for (List<int> row in adjMat) {
          row.add(0);
        }
      }

      /* Remove a vertex */
      void removeVertex(int index) {
        if (index >= size()) {
          throw IndexError;
        }
        // Remove the vertex at index `index` from the vertex list
        vertices.removeAt(index);
        // Remove row `index` from the adjacency matrix
        adjMat.removeAt(index);
        // Remove column `index` from the adjacency matrix
        for (List<int> row in adjMat) {
          row.removeAt(index);
        }
      }

      /* Add an edge */
      // Parameters i and j are element indices in vertices
      void addEdge(int i, int j) {
        // Handle out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
      }

      /* Remove an edge */
      // Parameters i and j are element indices in vertices
      void removeEdge(int i, int j) {
        // Handle out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
          throw IndexError;
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
      }

      /* Print the adjacency matrix */
      void printAdjMat() {
        print("Vertex list = $vertices");
        print("Adjacency matrix = ");
        printMatrix(adjMat);
      }
    }
    ```

=== "Rust"

    ```rust title="graph_adjacency_matrix.rs"
    /* Undirected graph type implemented with an adjacency matrix */
    pub struct GraphAdjMat {
        // Vertex list: elements are vertex values, and indices are vertex indices
        pub vertices: Vec<i32>,
        // Adjacency matrix: row and column indices correspond to vertex indices
        pub adj_mat: Vec<Vec<i32>>,
    }

    impl GraphAdjMat {
        /* Constructor */
        pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
            let mut graph = GraphAdjMat {
                vertices: vec![],
                adj_mat: vec![],
            };
            // Add a vertex
            for val in vertices {
                graph.add_vertex(val);
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for edge in edges {
                graph.add_edge(edge[0], edge[1])
            }

            graph
        }

        /* Get the number of vertices */
        pub fn size(&self) -> usize {
            self.vertices.len()
        }

        /* Add a vertex */
        pub fn add_vertex(&mut self, val: i32) {
            let n = self.size();
            // Append the new vertex value to the vertex list
            self.vertices.push(val);
            // Add a row to the adjacency matrix
            self.adj_mat.push(vec![0; n]);
            // Add a column to the adjacency matrix
            for row in self.adj_mat.iter_mut() {
                row.push(0);
            }
        }

        /* Remove a vertex */
        pub fn remove_vertex(&mut self, index: usize) {
            if index >= self.size() {
                panic!("Invalid vertex index")
            }
            // Remove the vertex at index `index` from the vertex list
            self.vertices.remove(index);
            // Remove row `index` from the adjacency matrix
            self.adj_mat.remove(index);
            // Remove column `index` from the adjacency matrix
            for row in self.adj_mat.iter_mut() {
                row.remove(index);
            }
        }

        /* Add an edge */
        pub fn add_edge(&mut self, i: usize, j: usize) {
            // Parameters i and j are element indices in vertices
            // Handle out-of-bounds or equal indices
            if i >= self.size() || j >= self.size() || i == j {
                panic!("Invalid vertex index")
            }
            // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            self.adj_mat[i][j] = 1;
            self.adj_mat[j][i] = 1;
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        pub fn remove_edge(&mut self, i: usize, j: usize) {
            // Parameters i and j are element indices in vertices
            // Handle out-of-bounds or equal indices
            if i >= self.size() || j >= self.size() || i == j {
                panic!("Invalid vertex index")
            }
            self.adj_mat[i][j] = 0;
            self.adj_mat[j][i] = 0;
        }

        /* Print the adjacency matrix */
        pub fn print(&self) {
            println!("Vertex list = {:?}", self.vertices);
            println!("Adjacency matrix =");
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
    /* Undirected graph structure implemented with an adjacency matrix */
    typedef struct {
        int vertices[MAX_SIZE];
        int adjMat[MAX_SIZE][MAX_SIZE];
        int size;
    } GraphAdjMat;

    /* Constructor */
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

    /* Destructor */
    void delGraphAdjMat(GraphAdjMat *graph) {
        free(graph);
    }

    /* Add a vertex */
    void addVertex(GraphAdjMat *graph, int val) {
        if (graph->size == MAX_SIZE) {
            fprintf(stderr, "The graph has reached its maximum number of vertices\n");
            return;
        }
        // Add the vertex at index n and set row n and column n to zero
        int n = graph->size;
        graph->vertices[n] = val;
        for (int i = 0; i <= n; i++) {
            graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
        }
        graph->size++;
    }

    /* Remove a vertex */
    void removeVertex(GraphAdjMat *graph, int index) {
        if (index < 0 || index >= graph->size) {
            fprintf(stderr, "Vertex index out of bounds\n");
            return;
        }
        // Remove the vertex at index `index` from the vertex list
        for (int i = index; i < graph->size - 1; i++) {
            graph->vertices[i] = graph->vertices[i + 1];
        }
        // Remove row `index` from the adjacency matrix
        for (int i = index; i < graph->size - 1; i++) {
            for (int j = 0; j < graph->size; j++) {
                graph->adjMat[i][j] = graph->adjMat[i + 1][j];
            }
        }
        // Remove column `index` from the adjacency matrix
        for (int i = 0; i < graph->size; i++) {
            for (int j = index; j < graph->size - 1; j++) {
                graph->adjMat[i][j] = graph->adjMat[i][j + 1];
            }
        }
        graph->size--;
    }

    /* Add an edge */
    // Parameters i and j are element indices in vertices
    void addEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "Edge endpoint indices are out of bounds or equal\n");
            return;
        }
        graph->adjMat[i][j] = 1;
        graph->adjMat[j][i] = 1;
    }

    /* Remove an edge */
    // Parameters i and j are element indices in vertices
    void removeEdge(GraphAdjMat *graph, int i, int j) {
        if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
            fprintf(stderr, "Edge endpoint indices are out of bounds or equal\n");
            return;
        }
        graph->adjMat[i][j] = 0;
        graph->adjMat[j][i] = 0;
    }

    /* Print the adjacency matrix */
    void printGraphAdjMat(GraphAdjMat *graph) {
        printf("Vertex list = ");
        printArray(graph->vertices, graph->size);
        printf("Adjacency matrix =\n");
        for (int i = 0; i < graph->size; i++) {
            printArray(graph->adjMat[i], graph->size);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="graph_adjacency_matrix.kt"
    /* Undirected graph class implemented with an adjacency matrix */
    class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
        val vertices = mutableListOf<Int>() // Vertex list: elements are vertex values, and indices are vertex indices
        val adjMat = mutableListOf<MutableList<Int>>() // Adjacency matrix: row and column indices correspond to vertex indices

        /* Constructor */
        init {
            // Add a vertex
            for (vertex in vertices) {
                addVertex(vertex)
            }
            // Add an edge
            // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
            for (edge in edges) {
                addEdge(edge[0], edge[1])
            }
        }

        /* Get the number of vertices */
        fun size(): Int {
            return vertices.size
        }

        /* Add a vertex */
        fun addVertex(_val: Int) {
            val n = size()
            // Append the new vertex value to the vertex list
            vertices.add(_val)
            // Add a row to the adjacency matrix
            val newRow = mutableListOf<Int>()
            for (j in 0..<n) {
                newRow.add(0)
            }
            adjMat.add(newRow)
            // Add a column to the adjacency matrix
            for (row in adjMat) {
                row.add(0)
            }
        }

        /* Remove a vertex */
        fun removeVertex(index: Int) {
            if (index >= size())
                throw IndexOutOfBoundsException()
            // Remove the vertex at index `index` from the vertex list
            vertices.removeAt(index)
            // Remove row `index` from the adjacency matrix
            adjMat.removeAt(index)
            // Remove column `index` from the adjacency matrix
            for (row in adjMat) {
                row.removeAt(index)
            }
        }

        /* Add an edge */
        // Parameters i and j are element indices in vertices
        fun addEdge(i: Int, j: Int) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
            adjMat[i][j] = 1
            adjMat[j][i] = 1
        }

        /* Remove an edge */
        // Parameters i and j are element indices in vertices
        fun removeEdge(i: Int, j: Int) {
            // Handle out-of-bounds or equal indices
            if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
                throw IndexOutOfBoundsException()
            adjMat[i][j] = 0
            adjMat[j][i] = 0
        }

        /* Print the adjacency matrix */
        fun print() {
            print("Vertex list = ")
            println(vertices)
            println("Adjacency matrix =")
            printMatrix(adjMat)
        }
    }
    ```

=== "Ruby"

    ```ruby title="graph_adjacency_matrix.rb"
    ### Undirected graph class implemented with an adjacency matrix ###
    class GraphAdjMat
      def initialize(vertices, edges)
        ### Constructor ###
        # Vertex list: elements are vertex values, and indices are vertex indices
        @vertices = []
        # Adjacency matrix: row and column indices correspond to vertex indices
        @adj_mat = []
        # Add a vertex
        vertices.each { |val| add_vertex(val) }
        # Add an edge
        # Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        edges.each { |e| add_edge(e[0], e[1]) }
      end

      ### Get the number of vertices ###
      def size
        @vertices.length
      end

      ### Add a vertex ###
      def add_vertex(val)
        n = size
        # Append the new vertex value to the vertex list
        @vertices << val
        # Add a row to the adjacency matrix
        new_row = Array.new(n, 0)
        @adj_mat << new_row
        # Add a column to the adjacency matrix
        @adj_mat.each { |row| row << 0 }
      end

      ### Remove a vertex ###
      def remove_vertex(index)
        raise IndexError if index >= size

        # Remove the vertex at index `index` from the vertex list
        @vertices.delete_at(index)
        # Remove row `index` from the adjacency matrix
        @adj_mat.delete_at(index)
        # Remove column `index` from the adjacency matrix
        @adj_mat.each { |row| row.delete_at(index) }
      end

      ### Add an edge ###
      def add_edge(i, j)
        # Parameters i and j are element indices in vertices
        # Handle out-of-bounds or equal indices
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        # For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        @adj_mat[i][j] = 1
        @adj_mat[j][i] = 1
      end

      ### Remove an edge ###
      def remove_edge(i, j)
        # Parameters i and j are element indices in vertices
        # Handle out-of-bounds or equal indices
        if i < 0 || j < 0 || i >= size || j >= size || i == j
          raise IndexError
        end
        @adj_mat[i][j] = 0
        @adj_mat[j][i] = 0
      end

      ### Print the adjacency matrix ###
      def __print__
        puts "Vertex list = #{@vertices}"
        puts 'Adjacency matrix ='
        print_matrix(@adj_mat)
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20class%20implemented%20with%20an%20adjacency%20matrix%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20vertex%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20%23%20Add%20an%20edge%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20number%20of%20vertices%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20%23%20Append%20the%20new%20vertex%20value%20to%20the%20vertex%20list%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20row%20to%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20column%20to%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20the%20vertex%20at%20index%20%60index%60%20from%20the%20vertex%20list%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20row%20%60index%60%20from%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20column%20%60index%60%20from%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Handle%20out-of-bounds%20or%20equal%20indices%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Handle%20out-of-bounds%20or%20equal%20indices%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20undirected%20graph%0A%20%20%20%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%20%20%20%23%20Add%20an%20edge%0A%20%20%20%20%23%20Vertices%201%20and%202%20have%20indices%200%20and%202,%20respectively%0A%20%20%20%20graph.add_edge%280,%202%29%0A%0A%20%20%20%20%23%20Remove%20an%20edge%0A%20%20%20%20%23%20Vertices%201%20and%203%20have%20indices%200%20and%201,%20respectively%0A%20%20%20%20graph.remove_edge%280,%201%29%0A%0A%20%20%20%20%23%20Add%20a%20vertex%0A%20%20%20%20graph.add_vertex%286%29%0A%0A%20%20%20%20%23%20Remove%20a%20vertex%0A%20%20%20%20%23%20Vertex%203%20has%20index%201%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20GraphAdjMat%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20class%20implemented%20with%20an%20adjacency%20matrix%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20vertices%3A%20list%5Bint%5D,%20edges%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.vertices%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.adj_mat%3A%20list%5Blist%5Bint%5D%5D%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20vertex%0A%20%20%20%20%20%20%20%20for%20val%20in%20vertices%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28val%29%0A%20%20%20%20%20%20%20%20%23%20Add%20an%20edge%0A%20%20%20%20%20%20%20%20for%20e%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28e%5B0%5D,%20e%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20number%20of%20vertices%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.vertices%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20n%20%3D%20self.size%28%29%0A%20%20%20%20%20%20%20%20%23%20Append%20the%20new%20vertex%20value%20to%20the%20vertex%20list%0A%20%20%20%20%20%20%20%20self.vertices.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20row%20to%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20new_row%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%20%20%20%20self.adj_mat.append%28new_row%29%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20column%20to%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.append%280%29%0A%0A%20%20%20%20def%20remove_vertex%28self,%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20index%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20the%20vertex%20at%20index%20%60index%60%20from%20the%20vertex%20list%0A%20%20%20%20%20%20%20%20self.vertices.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20row%20%60index%60%20from%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20self.adj_mat.pop%28index%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20column%20%60index%60%20from%20the%20adjacency%20matrix%0A%20%20%20%20%20%20%20%20for%20row%20in%20self.adj_mat%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20row.pop%28index%29%0A%0A%20%20%20%20def%20add_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Handle%20out-of-bounds%20or%20equal%20indices%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%201%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%201%0A%0A%20%20%20%20def%20remove_edge%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Handle%20out-of-bounds%20or%20equal%20indices%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%20or%20j%20%3E%3D%20self.size%28%29%20or%20i%20%3D%3D%20j%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%29%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bi%5D%5Bj%5D%20%3D%200%0A%20%20%20%20%20%20%20%20self.adj_mat%5Bj%5D%5Bi%5D%20%3D%200%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20undirected%20graph%0A%20%20%20%20vertices%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20edges%20%3D%20%5B%5B0,%201%5D,%20%5B0,%203%5D,%20%5B1,%202%5D,%20%5B2,%203%5D,%20%5B2,%204%5D,%20%5B3,%204%5D%5D%0A%20%20%20%20graph%20%3D%20GraphAdjMat%28vertices,%20edges%29%0A%0A%20%20%20%20%23%20Add%20an%20edge%0A%20%20%20%20%23%20Vertices%201%20and%202%20have%20indices%200%20and%202,%20respectively%0A%20%20%20%20graph.add_edge%280,%202%29%0A%0A%20%20%20%20%23%20Remove%20an%20edge%0A%20%20%20%20%23%20Vertices%201%20and%203%20have%20indices%200%20and%201,%20respectively%0A%20%20%20%20graph.remove_edge%280,%201%29%0A%0A%20%20%20%20%23%20Add%20a%20vertex%0A%20%20%20%20graph.add_vertex%286%29%0A%0A%20%20%20%20%23%20Remove%20a%20vertex%0A%20%20%20%20%23%20Vertex%203%20has%20index%201%0A%20%20%20%20graph.remove_vertex%281%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 9.2.2 &nbsp; Adjacency list implementation

For an undirected graph with $n$ vertices and $m$ edges, the operations can be implemented as shown in Figure 9-8.

- **Add an edge**: Append the edge to the linked list of the corresponding vertex, taking $O(1)$ time. Since the graph is undirected, add the edge in both directions.
- **Remove an edge**: Find and remove the specified edge in the corresponding vertex's linked list, taking $O(m)$ time. For an undirected graph, remove the edge in both directions.
- **Add a vertex**: Add a linked list to the adjacency list with the new vertex as its head node, taking $O(1)$ time.
- **Remove a vertex**: Traverse the entire adjacency list and remove every edge involving the specified vertex, taking $O(n + m)$ time.
- **Initialize the graph**: Create $n$ vertices and $2m$ edge entries in the adjacency list, taking $O(n + m)$ time.

=== "<1>"
    ![Initializing an adjacency list and adding or removing edges and vertices](graph_operations.assets/adjacency_list_step1_initialization.png){ class="animation-figure" }

=== "<2>"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.png){ class="animation-figure" }

=== "<3>"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.png){ class="animation-figure" }

=== "<4>"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.png){ class="animation-figure" }

=== "<5>"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.png){ class="animation-figure" }

<p align="center"> Figure 9-8 &nbsp; Initializing an adjacency list and adding or removing edges and vertices </p>

The following code implements an adjacency list, with these differences from Figure 9-8.

- To make adding and removing vertices easier and simplify the code, we use lists (dynamic arrays) in place of linked lists.
- A hash table stores the adjacency list. Each `key` is a vertex instance, and its `value` is the list (linked list) of adjacent vertices.

We also use the `Vertex` class to represent vertices in the adjacency list. If we identified vertices by list indices, as in the adjacency matrix, deleting the vertex at index $i$ would require traversing the entire adjacency list and subtracting $1$ from every index greater than $i$. This would be inefficient. When each vertex is a unique `Vertex` instance, deleting one vertex requires no changes to the other vertices.

=== "Python"

    ```python title="graph_adjacency_list.py"
    class GraphAdjList:
        """Undirected graph class implemented with an adjacency list"""

        def __init__(self, edges: list[list[Vertex]]):
            """Constructor"""
            # Adjacency list: key is a vertex, value is the list of all its neighbors
            self.adj_list = dict[Vertex, list[Vertex]]()
            # Add all vertices and edges
            for edge in edges:
                self.add_vertex(edge[0])
                self.add_vertex(edge[1])
                self.add_edge(edge[0], edge[1])

        def size(self) -> int:
            """Get the number of vertices"""
            return len(self.adj_list)

        def add_edge(self, vet1: Vertex, vet2: Vertex):
            """Add an edge"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # Add edge vet1 - vet2
            self.adj_list[vet1].append(vet2)
            self.adj_list[vet2].append(vet1)

        def remove_edge(self, vet1: Vertex, vet2: Vertex):
            """Remove an edge"""
            if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
                raise ValueError()
            # Remove edge vet1 - vet2
            self.adj_list[vet1].remove(vet2)
            self.adj_list[vet2].remove(vet1)

        def add_vertex(self, vet: Vertex):
            """Add a vertex"""
            if vet in self.adj_list:
                return
            # Add a new list to the adjacency list
            self.adj_list[vet] = []

        def remove_vertex(self, vet: Vertex):
            """Remove a vertex"""
            if vet not in self.adj_list:
                raise ValueError()
            # Remove the list corresponding to vertex vet from the adjacency list
            self.adj_list.pop(vet)
            # Traverse the lists of the other vertices and remove all edges incident to vet
            for vertex in self.adj_list:
                if vet in self.adj_list[vertex]:
                    self.adj_list[vertex].remove(vet)

        def print(self):
            """Print the adjacency list"""
            print("Adjacency list =")
            for vertex in self.adj_list:
                tmp = [v.val for v in self.adj_list[vertex]]
                print(f"{vertex.val}: {tmp},")
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
      public:
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        unordered_map<Vertex *, vector<Vertex *>> adjList;

        /* Remove the specified vertex from the vector */
        void remove(vector<Vertex *> &vec, Vertex *vet) {
            for (int i = 0; i < vec.size(); i++) {
                if (vec[i] == vet) {
                    vec.erase(vec.begin() + i);
                    break;
                }
            }
        }

        /* Constructor */
        GraphAdjList(const vector<vector<Vertex *>> &edges) {
            // Add all vertices and edges
            for (const vector<Vertex *> &edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* Get the number of vertices */
        int size() {
            return adjList.size();
        }

        /* Add an edge */
        void addEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("Invalid vertex");
            // Add edge vet1 - vet2
            adjList[vet1].push_back(vet2);
            adjList[vet2].push_back(vet1);
        }

        /* Remove an edge */
        void removeEdge(Vertex *vet1, Vertex *vet2) {
            if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
                throw invalid_argument("Invalid vertex");
            // Remove edge vet1 - vet2
            remove(adjList[vet1], vet2);
            remove(adjList[vet2], vet1);
        }

        /* Add a vertex */
        void addVertex(Vertex *vet) {
            if (adjList.count(vet))
                return;
            // Add a new list to the adjacency list
            adjList[vet] = vector<Vertex *>();
        }

        /* Remove a vertex */
        void removeVertex(Vertex *vet) {
            if (!adjList.count(vet))
                throw invalid_argument("Invalid vertex");
            // Remove the list corresponding to vertex vet from the adjacency list
            adjList.erase(vet);
            // Traverse the lists of the other vertices and remove all edges incident to vet
            for (auto &adj : adjList) {
                remove(adj.second, vet);
            }
        }

        /* Print the adjacency list */
        void print() {
            cout << "Adjacency list =" << endl;
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
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        Map<Vertex, List<Vertex>> adjList;

        /* Constructor */
        public GraphAdjList(Vertex[][] edges) {
            this.adjList = new HashMap<>();
            // Add all vertices and edges
            for (Vertex[] edge : edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }

        /* Get the number of vertices */
        public int size() {
            return adjList.size();
        }

        /* Add an edge */
        public void addEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // Add edge vet1 - vet2
            adjList.get(vet1).add(vet2);
            adjList.get(vet2).add(vet1);
        }

        /* Remove an edge */
        public void removeEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw new IllegalArgumentException();
            // Remove edge vet1 - vet2
            adjList.get(vet1).remove(vet2);
            adjList.get(vet2).remove(vet1);
        }

        /* Add a vertex */
        public void addVertex(Vertex vet) {
            if (adjList.containsKey(vet))
                return;
            // Add a new list to the adjacency list
            adjList.put(vet, new ArrayList<>());
        }

        /* Remove a vertex */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // Remove the list corresponding to vertex vet from the adjacency list
            adjList.remove(vet);
            // Traverse the lists of the other vertices and remove all edges incident to vet
            for (List<Vertex> list : adjList.values()) {
                list.remove(vet);
            }
        }

        /* Print the adjacency list */
        public void print() {
            System.out.println("Adjacency list =");
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
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        public Dictionary<Vertex, List<Vertex>> adjList;

        /* Constructor */
        public GraphAdjList(Vertex[][] edges) {
            adjList = [];
            // Add all vertices and edges
            foreach (Vertex[] edge in edges) {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* Get the number of vertices */
        int Size() {
            return adjList.Count;
        }

        /* Add an edge */
        public void AddEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // Add edge vet1 - vet2
            adjList[vet1].Add(vet2);
            adjList[vet2].Add(vet1);
        }

        /* Remove an edge */
        public void RemoveEdge(Vertex vet1, Vertex vet2) {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // Remove edge vet1 - vet2
            adjList[vet1].Remove(vet2);
            adjList[vet2].Remove(vet1);
        }

        /* Add a vertex */
        public void AddVertex(Vertex vet) {
            if (adjList.ContainsKey(vet))
                return;
            // Add a new list to the adjacency list
            adjList.Add(vet, []);
        }

        /* Remove a vertex */
        public void RemoveVertex(Vertex vet) {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // Remove the list corresponding to vertex vet from the adjacency list
            adjList.Remove(vet);
            // Traverse the lists of the other vertices and remove all edges incident to vet
            foreach (List<Vertex> list in adjList.Values) {
                list.Remove(vet);
            }
        }

        /* Print the adjacency list */
        public void Print() {
            Console.WriteLine("Adjacency list =");
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
    /* Undirected graph type implemented with an adjacency list */
    type graphAdjList struct {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        adjList map[Vertex][]Vertex
    }

    /* Constructor */
    func newGraphAdjList(edges [][]Vertex) *graphAdjList {
        g := &graphAdjList{
            adjList: make(map[Vertex][]Vertex),
        }
        // Add all vertices and edges
        for _, edge := range edges {
            g.addVertex(edge[0])
            g.addVertex(edge[1])
            g.addEdge(edge[0], edge[1])
        }
        return g
    }

    /* Get the number of vertices */
    func (g *graphAdjList) size() int {
        return len(g.adjList)
    }

    /* Add an edge */
    func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // Add edge vet1 - vet2 by appending each vertex to the other vertex's neighbor list
        g.adjList[vet1] = append(g.adjList[vet1], vet2)
        g.adjList[vet2] = append(g.adjList[vet2], vet1)
    }

    /* Remove an edge */
    func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
        _, ok1 := g.adjList[vet1]
        _, ok2 := g.adjList[vet2]
        if !ok1 || !ok2 || vet1 == vet2 {
            panic("error")
        }
        // Remove edge vet1 - vet2
        g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
        g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
    }

    /* Add a vertex */
    func (g *graphAdjList) addVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if ok {
            return
        }
        // Add a new list to the adjacency list
        g.adjList[vet] = make([]Vertex, 0)
    }

    /* Remove a vertex */
    func (g *graphAdjList) removeVertex(vet Vertex) {
        _, ok := g.adjList[vet]
        if !ok {
            panic("error")
        }
        // Remove the list corresponding to vertex vet from the adjacency list
        delete(g.adjList, vet)
        // Traverse the lists of the other vertices and remove all edges incident to vet
        for v, list := range g.adjList {
            g.adjList[v] = DeleteSliceElms(list, vet)
        }
    }

    /* Print the adjacency list */
    func (g *graphAdjList) print() {
        var builder strings.Builder
        fmt.Printf("Adjacency list = \n")
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
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        public private(set) var adjList: [Vertex: [Vertex]]

        /* Constructor */
        public init(edges: [[Vertex]]) {
            adjList = [:]
            // Add all vertices and edges
            for edge in edges {
                addVertex(vet: edge[0])
                addVertex(vet: edge[1])
                addEdge(vet1: edge[0], vet2: edge[1])
            }
        }

        /* Get the number of vertices */
        public func size() -> Int {
            adjList.count
        }

        /* Add an edge */
        public func addEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("Invalid arguments")
            }
            // Add edge vet1 - vet2
            adjList[vet1]?.append(vet2)
            adjList[vet2]?.append(vet1)
        }

        /* Remove an edge */
        public func removeEdge(vet1: Vertex, vet2: Vertex) {
            if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
                fatalError("Invalid arguments")
            }
            // Remove edge vet1 - vet2
            adjList[vet1]?.removeAll { $0 == vet2 }
            adjList[vet2]?.removeAll { $0 == vet1 }
        }

        /* Add a vertex */
        public func addVertex(vet: Vertex) {
            if adjList[vet] != nil {
                return
            }
            // Add a new list to the adjacency list
            adjList[vet] = []
        }

        /* Remove a vertex */
        public func removeVertex(vet: Vertex) {
            if adjList[vet] == nil {
                fatalError("Invalid arguments")
            }
            // Remove the list corresponding to vertex vet from the adjacency list
            adjList.removeValue(forKey: vet)
            // Traverse the lists of the other vertices and remove all edges incident to vet
            for key in adjList.keys {
                adjList[key]?.removeAll { $0 == vet }
            }
        }

        /* Print the adjacency list */
        public func print() {
            Swift.print("Adjacency list =")
            for (vertex, list) in adjList {
                let list = list.map { $0.val }
                Swift.print("\(vertex.val): \(list),")
            }
        }
    }
    ```

=== "JS"

    ```javascript title="graph_adjacency_list.js"
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        adjList;

        /* Constructor */
        constructor(edges) {
            this.adjList = new Map();
            // Add all vertices and edges
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* Get the number of vertices */
        size() {
            return this.adjList.size;
        }

        /* Add an edge */
        addEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Invalid argument');
            }
            // Add edge vet1 - vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* Remove an edge */
        removeEdge(vet1, vet2) {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
            ) {
                throw new Error('Invalid argument');
            }
            // Remove edge vet1 - vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* Add a vertex */
        addVertex(vet) {
            if (this.adjList.has(vet)) return;
            // Add a new list to the adjacency list
            this.adjList.set(vet, []);
        }

        /* Remove a vertex */
        removeVertex(vet) {
            if (!this.adjList.has(vet)) {
                throw new Error('Invalid argument');
            }
            // Remove the list corresponding to vertex vet from the adjacency list
            this.adjList.delete(vet);
            // Traverse the lists of the other vertices and remove all edges incident to vet
            for (const set of this.adjList.values()) {
                const index = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* Print the adjacency list */
        print() {
            console.log('Adjacency list =');
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
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        adjList: Map<Vertex, Vertex[]>;

        /* Constructor */
        constructor(edges: Vertex[][]) {
            this.adjList = new Map();
            // Add all vertices and edges
            for (const edge of edges) {
                this.addVertex(edge[0]);
                this.addVertex(edge[1]);
                this.addEdge(edge[0], edge[1]);
            }
        }

        /* Get the number of vertices */
        size(): number {
            return this.adjList.size;
        }

        /* Add an edge */
        addEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2
            ) {
                throw new Error('Invalid argument');
            }
            // Add edge vet1 - vet2
            this.adjList.get(vet1).push(vet2);
            this.adjList.get(vet2).push(vet1);
        }

        /* Remove an edge */
        removeEdge(vet1: Vertex, vet2: Vertex): void {
            if (
                !this.adjList.has(vet1) ||
                !this.adjList.has(vet2) ||
                vet1 === vet2 ||
                this.adjList.get(vet1).indexOf(vet2) === -1
            ) {
                throw new Error('Invalid argument');
            }
            // Remove edge vet1 - vet2
            this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
            this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
        }

        /* Add a vertex */
        addVertex(vet: Vertex): void {
            if (this.adjList.has(vet)) return;
            // Add a new list to the adjacency list
            this.adjList.set(vet, []);
        }

        /* Remove a vertex */
        removeVertex(vet: Vertex): void {
            if (!this.adjList.has(vet)) {
                throw new Error('Invalid argument');
            }
            // Remove the list corresponding to vertex vet from the adjacency list
            this.adjList.delete(vet);
            // Traverse the lists of the other vertices and remove all edges incident to vet
            for (const set of this.adjList.values()) {
                const index: number = set.indexOf(vet);
                if (index > -1) {
                    set.splice(index, 1);
                }
            }
        }

        /* Print the adjacency list */
        print(): void {
            console.log('Adjacency list =');
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
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList {
      // Adjacency list: key is a vertex, value is the list of all its neighbors
      Map<Vertex, List<Vertex>> adjList = {};

      /* Constructor */
      GraphAdjList(List<List<Vertex>> edges) {
        for (List<Vertex> edge in edges) {
          addVertex(edge[0]);
          addVertex(edge[1]);
          addEdge(edge[0], edge[1]);
        }
      }

      /* Get the number of vertices */
      int size() {
        return adjList.length;
      }

      /* Add an edge */
      void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // Add edge vet1 - vet2
        adjList[vet1]!.add(vet2);
        adjList[vet2]!.add(vet1);
      }

      /* Remove an edge */
      void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) ||
            !adjList.containsKey(vet2) ||
            vet1 == vet2) {
          throw ArgumentError;
        }
        // Remove edge vet1 - vet2
        adjList[vet1]!.remove(vet2);
        adjList[vet2]!.remove(vet1);
      }

      /* Add a vertex */
      void addVertex(Vertex vet) {
        if (adjList.containsKey(vet)) return;
        // Add a new list to the adjacency list
        adjList[vet] = [];
      }

      /* Remove a vertex */
      void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet)) {
          throw ArgumentError;
        }
        // Remove the list corresponding to vertex vet from the adjacency list
        adjList.remove(vet);
        // Traverse the lists of the other vertices and remove all edges incident to vet
        adjList.forEach((key, value) {
          value.remove(vet);
        });
      }

      /* Print the adjacency list */
      void printAdjList() {
        print("Adjacency list =");
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
    /* Undirected graph type implemented with an adjacency list */
    pub struct GraphAdjList {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        pub adj_list: HashMap<Vertex, Vec<Vertex>>, // A HashSet<Vertex> may be a better choice for the neighbor collection
    }

    impl GraphAdjList {
        /* Constructor */
        pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
            let mut graph = GraphAdjList {
                adj_list: HashMap::new(),
            };
            // Add all vertices and edges
            for edge in edges {
                graph.add_vertex(edge[0]);
                graph.add_vertex(edge[1]);
                graph.add_edge(edge[0], edge[1]);
            }

            graph
        }

        /* Get the number of vertices */
        #[allow(unused)]
        pub fn size(&self) -> usize {
            self.adj_list.len()
        }

        /* Add an edge */
        pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("Vertices must be distinct");
            }
            // Add edge vet1 - vet2
            self.adj_list.entry(vet1).or_default().push(vet2);
            self.adj_list.entry(vet2).or_default().push(vet1);
        }

        /* Remove an edge */
        #[allow(unused)]
        pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
            if vet1 == vet2 {
                panic!("Vertices must be distinct");
            }
            // Remove edge vet1 - vet2
            self.adj_list
                .entry(vet1)
                .and_modify(|v| v.retain(|&e| e != vet2));
            self.adj_list
                .entry(vet2)
                .and_modify(|v| v.retain(|&e| e != vet1));
        }

        /* Add a vertex */
        pub fn add_vertex(&mut self, vet: Vertex) {
            if self.adj_list.contains_key(&vet) {
                return;
            }
            // Add a new neighbor list to the adjacency list
            self.adj_list.insert(vet, vec![]);
        }

        /* Remove a vertex */
        #[allow(unused)]
        pub fn remove_vertex(&mut self, vet: Vertex) {
            // Remove the neighbor list for vertex vet from the adjacency list
            self.adj_list.remove(&vet);
            // Traverse the other neighbor lists and remove every edge incident to vet
            for list in self.adj_list.values_mut() {
                list.retain(|&v| v != vet);
            }
        }

        /* Print the adjacency list */
        pub fn print(&self) {
            println!("Adjacency list =");
            for (vertex, list) in &self.adj_list {
                let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
                println!("{}: {:?},", vertex.val, list);
            }
        }
    }
    ```

=== "C"

    ```c title="graph_adjacency_list.c"
    /* Adjacency-list node structure */
    typedef struct AdjListNode {
        Vertex *vertex;           // Vertex
        struct AdjListNode *next; // Next node
    } AdjListNode;

    /* Find the list node corresponding to a vertex */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* Helper for adding an edge */
    void addEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
        node->vertex = vet;
        // Insert at the front of the neighbor list
        node->next = head->next;
        head->next = node;
    }

    /* Helper for removing an edge */
    void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
        AdjListNode *pre = head;
        AdjListNode *cur = head->next;
        // Search the linked list for the node corresponding to vet
        while (cur != NULL && cur->vertex != vet) {
            pre = cur;
            cur = cur->next;
        }
        if (cur == NULL)
            return;
        // Remove the node corresponding to vet from the linked list
        pre->next = cur->next;
        // Free memory
        free(cur);
    }

    /* Undirected graph structure implemented with an adjacency list */
    typedef struct {
        AdjListNode *heads[MAX_SIZE]; // Array of list heads
        int size;                     // Number of vertices
    } GraphAdjList;

    /* Constructor */
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

    /* Destructor */
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

    /* Find the list node corresponding to a vertex */
    AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
        for (int i = 0; i < graph->size; i++) {
            if (graph->heads[i]->vertex == vet) {
                return graph->heads[i];
            }
        }
        return NULL;
    }

    /* Add an edge */
    void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL && head1 != head2);
        // Add edge vet1 - vet2
        addEdgeHelper(head1, vet2);
        addEdgeHelper(head2, vet1);
    }

    /* Remove an edge */
    void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
        AdjListNode *head1 = findNode(graph, vet1);
        AdjListNode *head2 = findNode(graph, vet2);
        assert(head1 != NULL && head2 != NULL);
        // Remove edge vet1 - vet2
        removeEdgeHelper(head1, head2->vertex);
        removeEdgeHelper(head2, head1->vertex);
    }

    /* Add a vertex */
    void addVertex(GraphAdjList *graph, Vertex *vet) {
        assert(graph != NULL && graph->size < MAX_SIZE);
        AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
        head->vertex = vet;
        head->next = NULL;
        // Add a new list to the adjacency list
        graph->heads[graph->size++] = head;
    }

    /* Remove a vertex */
    void removeVertex(GraphAdjList *graph, Vertex *vet) {
        AdjListNode *node = findNode(graph, vet);
        assert(node != NULL);
        // Remove the list corresponding to vertex vet from the adjacency list
        AdjListNode *cur = node, *pre = NULL;
        while (cur) {
            pre = cur;
            cur = cur->next;
            free(pre);
        }
        // Traverse the lists of the other vertices and remove all edges incident to vet
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
        // Shift subsequent vertices forward to fill the gap
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
    /* Undirected graph class implemented with an adjacency list */
    class GraphAdjList(edges: Array<Array<Vertex?>>) {
        // Adjacency list: key is a vertex, value is the list of all its neighbors
        val adjList = HashMap<Vertex, MutableList<Vertex>>()

        /* Constructor */
        init {
            // Add all vertices and edges
            for (edge in edges) {
                addVertex(edge[0]!!)
                addVertex(edge[1]!!)
                addEdge(edge[0]!!, edge[1]!!)
            }
        }

        /* Get the number of vertices */
        fun size(): Int {
            return adjList.size
        }

        /* Add an edge */
        fun addEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // Add edge vet1 - vet2
            adjList[vet1]?.add(vet2)
            adjList[vet2]?.add(vet1)
        }

        /* Remove an edge */
        fun removeEdge(vet1: Vertex, vet2: Vertex) {
            if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
                throw IllegalArgumentException()
            // Remove edge vet1 - vet2
            adjList[vet1]?.remove(vet2)
            adjList[vet2]?.remove(vet1)
        }

        /* Add a vertex */
        fun addVertex(vet: Vertex) {
            if (adjList.containsKey(vet))
                return
            // Add a new list to the adjacency list
            adjList[vet] = mutableListOf()
        }

        /* Remove a vertex */
        fun removeVertex(vet: Vertex) {
            if (!adjList.containsKey(vet))
                throw IllegalArgumentException()
            // Remove the list corresponding to vertex vet from the adjacency list
            adjList.remove(vet)
            // Traverse the lists of the other vertices and remove all edges incident to vet
            for (list in adjList.values) {
                list.remove(vet)
            }
        }

        /* Print the adjacency list */
        fun print() {
            println("Adjacency list =")
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
    ### Undirected graph class implemented with an adjacency list ###
    class GraphAdjList
      attr_reader :adj_list
      
      ### Constructor ###
      def initialize(edges)
        # Adjacency list: key is a vertex, value is the list of all its neighbors
        @adj_list = {}
        # Add all vertices and edges
        for edge in edges
          add_vertex(edge[0])
          add_vertex(edge[1])
          add_edge(edge[0], edge[1])
        end
      end

      ### Get the number of vertices ###
      def size
        @adj_list.length
      end

      ### Add an edge ###
      def add_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

        @adj_list[vet1] << vet2
        @adj_list[vet2] << vet1
      end

      ### Remove an edge ###
      def remove_edge(vet1, vet2)
        raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

        # Remove edge vet1 - vet2
        @adj_list[vet1].delete(vet2)
        @adj_list[vet2].delete(vet1)
      end

      ### Add a vertex ###
      def add_vertex(vet)
        return if @adj_list.include?(vet)

        # Add a new neighbor list to the adjacency list
        @adj_list[vet] = []
      end

      ### Remove a vertex ###
      def remove_vertex(vet)
        raise ArgumentError unless @adj_list.include?(vet)

        # Remove the neighbor list for vertex vet from the adjacency list
        @adj_list.delete(vet)
        # Traverse the other neighbor lists and remove all edges incident to vet
        for vertex in @adj_list
          @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
        end
      end

      ### Print the adjacency list ###
      def __print__
        puts 'Adjacency list ='
        for vertex in @adj_list
          tmp = @adj_list[vertex.first].map { |v| v.val }
          puts "#{vertex.first.val}: #{tmp},"
        end
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22Vertex%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22Given%20the%20list%20of%20values%20vals,%20return%20the%20list%20of%20vertices%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20class%20implemented%20with%20an%20adjacency%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20Add%20all%20vertices%20and%20edges%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20number%20of%20vertices%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20Add%20edge%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20edge%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20new%20list%20to%20the%20adjacency%20list%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20the%20list%20corresponding%20to%20vertex%20vet%20from%20the%20adjacency%20list%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20Traverse%20the%20lists%20of%20the%20other%20vertices%20and%20remove%20all%20edges%20incident%20to%20vet%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20undirected%20graph%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20Add%20an%20edge%0A%20%20%20%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20Remove%20an%20edge%0A%20%20%20%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20Add%20a%20vertex%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20Remove%20a%20vertex%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Vertex%3A%0A%20%20%20%20%22%22%22Vertex%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%0Adef%20vals_to_vets%28vals%3A%20list%5Bint%5D%29%20-%3E%20list%5B%22Vertex%22%5D%3A%0A%20%20%20%20%22%22%22Given%20the%20list%20of%20values%20vals,%20return%20the%20list%20of%20vertices%20vets%22%22%22%0A%20%20%20%20return%20%5BVertex%28val%29%20for%20val%20in%20vals%5D%0A%0A%0Aclass%20GraphAdjList%3A%0A%20%20%20%20%22%22%22Undirected%20graph%20class%20implemented%20with%20an%20adjacency%20list%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20edges%3A%20list%5Blist%5BVertex%5D%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self.adj_list%20%3D%20dict%5BVertex,%20list%5BVertex%5D%5D%28%29%0A%20%20%20%20%20%20%20%20%23%20Add%20all%20vertices%20and%20edges%0A%20%20%20%20%20%20%20%20for%20edge%20in%20edges%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B0%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_vertex%28edge%5B1%5D%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.add_edge%28edge%5B0%5D,%20edge%5B1%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20number%20of%20vertices%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.adj_list%29%0A%0A%20%20%20%20def%20add_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20Add%20edge%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.append%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.append%28vet1%29%0A%0A%20%20%20%20def%20remove_edge%28self,%20vet1%3A%20Vertex,%20vet2%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20an%20edge%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet1%20not%20in%20self.adj_list%20or%20vet2%20not%20in%20self.adj_list%20or%20vet1%20%3D%3D%20vet2%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20edge%20vet1%20-%20vet2%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet1%5D.remove%28vet2%29%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet2%5D.remove%28vet1%29%0A%0A%20%20%20%20def%20add_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Add%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Add%20a%20new%20list%20to%20the%20adjacency%20list%0A%20%20%20%20%20%20%20%20self.adj_list%5Bvet%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20remove_vertex%28self,%20vet%3A%20Vertex%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20a%20vertex%22%22%22%0A%20%20%20%20%20%20%20%20if%20vet%20not%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20ValueError%28%29%0A%20%20%20%20%20%20%20%20%23%20Remove%20the%20list%20corresponding%20to%20vertex%20vet%20from%20the%20adjacency%20list%0A%20%20%20%20%20%20%20%20self.adj_list.pop%28vet%29%0A%20%20%20%20%20%20%20%20%23%20Traverse%20the%20lists%20of%20the%20other%20vertices%20and%20remove%20all%20edges%20incident%20to%20vet%0A%20%20%20%20%20%20%20%20for%20vertex%20in%20self.adj_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20vet%20in%20self.adj_list%5Bvertex%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.adj_list%5Bvertex%5D.remove%28vet%29%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20undirected%20graph%0A%20%20%20%20v%20%3D%20vals_to_vets%28%5B1,%203,%202,%205,%204%5D%29%0A%20%20%20%20edges%20%3D%20%5B%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B1%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B0%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B1%5D,%20v%5B2%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B3%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B2%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%20%20%20%20%5Bv%5B3%5D,%20v%5B4%5D%5D,%0A%20%20%20%20%5D%0A%20%20%20%20graph%20%3D%20GraphAdjList%28edges%29%0A%20%20%20%20del%20edges%0A%0A%20%20%20%20%23%20Add%20an%20edge%0A%20%20%20%20graph.add_edge%28v%5B0%5D,%20v%5B2%5D%29%0A%0A%20%20%20%20%23%20Remove%20an%20edge%0A%20%20%20%20graph.remove_edge%28v%5B0%5D,%20v%5B1%5D%29%0A%0A%20%20%20%20%23%20Add%20a%20vertex%0A%20%20%20%20v5%20%3D%20Vertex%286%29%0A%20%20%20%20graph.add_vertex%28v5%29%0A%0A%20%20%20%20%23%20Remove%20a%20vertex%0A%20%20%20%20graph.remove_vertex%28v%5B1%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=39&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 9.2.3 &nbsp; Comparing efficiency

For a graph with $n$ vertices and $m$ edges, Table 9-2 compares the time and space efficiency of adjacency matrices and adjacency lists. Here, "adjacency list (linked lists)" refers to the implementation in this section, while "adjacency list (hash tables)" specifically refers to an implementation in which every linked list is replaced by a hash table.

<p align="center"> Table 9-2 &nbsp; Comparing adjacency matrices and adjacency lists </p>

<div class="center-table" markdown>

|              | Adjacency matrix | Adjacency list (linked lists) | Adjacency list (hash tables) |
| ------------ | -------- | -------------- | ---------------- |
| Check adjacency | $O(1)$   | $O(n)$         | $O(1)$           |
| Add an edge       | $O(1)$   | $O(1)$         | $O(1)$           |
| Remove an edge       | $O(1)$   | $O(n)$         | $O(1)$           |
| Add a vertex     | $O(n)$   | $O(1)$         | $O(1)$           |
| Remove a vertex     | $O(n^2)$ | $O(n + m)$     | $O(n)$           |
| Memory usage | $O(n^2)$ | $O(n + m)$     | $O(n + m)$       |

</div>

Table 9-2 suggests that an adjacency list using hash tables is the most efficient in both time and space. In practice, however, edge operations in an adjacency matrix are faster: each requires only a single array access or assignment. Overall, an adjacency matrix trades space for time, while an adjacency list trades time for space.
