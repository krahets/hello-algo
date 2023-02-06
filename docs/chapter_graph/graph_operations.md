---
comments: true
---

# 9.2. 图基础操作

图的基础操作分为对「边」的操作和对「顶点」的操作，在「邻接矩阵」和「邻接表」这两种表示下的实现方式不同。

## 9.2.1. 基于邻接矩阵的实现

设图的顶点总数为 $n$ ，则有：

- **添加或删除边**：直接在邻接矩阵中修改指定边的对应元素即可，使用 $O(1)$ 时间。而由于是无向图，因此需要同时更新两个方向的边。
- **添加顶点**：在邻接矩阵的尾部添加一行一列，并全部填 $0$ 即可，使用 $O(n)$ 时间。
- **删除顶点**：在邻接矩阵中删除一行一列。当删除首行首列时达到最差情况，需要将 $(n-1)^2$ 个元素“向左上移动”，从而使用 $O(n^2)$ 时间。
- **初始化**：传入 $n$ 个顶点，初始化长度为 $n$ 的顶点列表 `vertices` ，使用 $O(n)$ 时间；初始化 $n \times n$ 大小的邻接矩阵 `adjMat` ，使用 $O(n^2)$ 时间。

=== "初始化邻接矩阵"
    ![adjacency_matrix_initialization](graph_operations.assets/adjacency_matrix_initialization.png)

=== "添加边"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_add_edge.png)

=== "删除边"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_remove_edge.png)

=== "添加顶点"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_add_vertex.png)

=== "删除顶点"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_remove_vertex.png)

以下是基于邻接矩阵表示图的实现代码。

=== "Java"

    ```java title="graph_adjacency_matrix.java"
    /* 基于邻接矩阵实现的无向图类 */
    class GraphAdjMat {
        List<Integer> vertices;     // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        List<List<Integer>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”
    
        /* 构造函数 */
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
    }
    ```

=== "C++"

    ```cpp title="graph_adjacency_matrix.cpp"

    ```

=== "Python"

    ```python title="graph_adjacency_matrix.py"

    ```

=== "Go"

    ```go title="graph_adjacency_matrix.go"

    ```

=== "JavaScript"

    ```js title="graph_adjacency_matrix.js"

    ```

=== "TypeScript"

    ```typescript title="graph_adjacency_matrix.ts"

    ```

=== "C"

    ```c title="graph_adjacency_matrix.c"

    ```

=== "C#"

    ```csharp title="graph_adjacency_matrix.cs"
    class GraphAdjMat
    {
        List<int> vertices;     // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
        List<List<int>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

        /* 构造函数 */
        public GraphAdjMat(int[] vertices, int[][] edges)
        {
            this.vertices = new List<int>();
            this.adjMat = new List<List<int>>();
            // 添加顶点
            foreach (int val in vertices)
            {
                AddVertex(val);
            }
            // 添加边
            // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
            foreach (int[] e in edges)
            {
                AddEdge(e[0], e[1]);
            }
        }

        /* 获取顶点数量 */
        public int Size()
        {
            return vertices.Count;
        }

        /* 添加顶点 */
        public void AddVertex(int val)
        {
            int n = Size();
            // 向顶点列表中添加新顶点的值
            vertices.Add(val);
            // 在邻接矩阵中添加一行
            List<int> newRow = new List<int>(n);
            for (int j = 0; j < n; j++)
            {
                newRow.Add(0);
            }
            adjMat.Add(newRow);
            // 在邻接矩阵中添加一列
            foreach (List<int> row in adjMat)
            {
                row.Add(0);
            }
        }

        /* 删除顶点 */
        public void RemoveVertex(int index)
        {
            if (index >= Size())
                throw new IndexOutOfRangeException();
            // 在顶点列表中移除索引 index 的顶点
            vertices.RemoveAt(index);
            // 在邻接矩阵中删除索引 index 的行
            adjMat.RemoveAt(index);
            // 在邻接矩阵中删除索引 index 的列
            foreach (List<int> row in adjMat)
            {
                row.RemoveAt(index);
            }
        }

        /* 添加边 */
        // 参数 i, j 对应 vertices 元素索引
        public void AddEdge(int i, int j)
        {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
            adjMat[i][j] = 1;
            adjMat[j][i] = 1;
        }

        /* 删除边 */
        // 参数 i, j 对应 vertices 元素索引
        public void RemoveEdge(int i, int j)
        {
            // 索引越界与相等处理
            if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
                throw new IndexOutOfRangeException();
            adjMat[i][j] = 0;
            adjMat[j][i] = 0;
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_matrix.swift"

    ```

=== "Zig"

    ```zig title="graph_adjacency_matrix.zig"

    ```

## 9.2.2. 基于邻接表的实现

设图的顶点总数为 $n$ 、边总数为 $m$ ，则有：

- **添加边**：在顶点对应链表的尾部添加边即可，使用 $O(1)$ 时间。因为是无向图，所以需要同时添加两个方向的边。
- **删除边**：在顶点对应链表中查询与删除指定边，使用 $O(m)$ 时间。与添加边一样，需要同时删除两个方向的边。
- **添加顶点**：在邻接表中添加一个链表即可，并以新增顶点为链表头结点，使用 $O(1)$ 时间。
- **删除顶点**：需要遍历整个邻接表，删除包含指定顶点的所有边，使用 $O(n + m)$ 时间。
- **初始化**：需要在邻接表中建立 $n$ 个结点和 $2m$ 条边，使用 $O(n + m)$ 时间。

=== "初始化邻接表"
    ![adjacency_list_initialization](graph_operations.assets/adjacency_list_initialization.png)

=== "添加边"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_add_edge.png)

=== "删除边"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_remove_edge.png)

=== "添加顶点"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_add_vertex.png)

=== "删除顶点"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_remove_vertex.png)

基于邻接表实现图的代码如下所示。

=== "Java"

    ```java title="graph_adjacency_list.java"
    /* 顶点类 */
    class Vertex {
        int val;
        public Vertex(int val) {
            this.val = val;
        }
    }
    
    /* 基于邻接表实现的无向图类 */
    class GraphAdjList {
        // 请注意，vertices 和 adjList 中存储的都是 Vertex 对象
        Map<Vertex, Set<Vertex>> adjList; // 邻接表（使用哈希表实现）
    
        /* 构造函数 */
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
            // 在邻接表中添加一个新链表（即 HashSet）
            adjList.put(vet, new HashSet<>());
        }
    
        /* 删除顶点 */
        public void removeVertex(Vertex vet) {
            if (!adjList.containsKey(vet))
                throw new IllegalArgumentException();
            // 在邻接表中删除顶点 vet 对应的链表（即 HashSet）
            adjList.remove(vet);
            // 遍历其它顶点的链表（即 HashSet），删除所有包含 vet 的边
            for (Set<Vertex> set : adjList.values()) {
                set.remove(vet);
            }
        }
    }
    ```

=== "C++"

    ```cpp title="graph_adjacency_list.cpp"

    ```

=== "Python"

    ```python title="graph_adjacency_list.py"

    ```

=== "Go"

    ```go title="graph_adjacency_list.go"

    ```

=== "JavaScript"

    ```js title="graph_adjacency_list.js"

    ```

=== "TypeScript"

    ```typescript title="graph_adjacency_list.ts"

    ```

=== "C"

    ```c title="graph_adjacency_list.c"

    ```

=== "C#"

    ```csharp title="graph_adjacency_list.cs"
    class Vertex
    {
        public int Val { get; init; }
        public Vertex(int val)
        {
            Val = val;
        }
    }

    /* 基于邻接表实现的无向图类 */
    class GraphAdjList
    {
        // 请注意，vertices 和 adjList 中存储的都是 Vertex 对象
        Dictionary<Vertex, HashSet<Vertex>> adjList; // 邻接表（使用哈希表实现）

        /* 构造函数 */
        public GraphAdjList(Vertex[][] edges)
        {
            this.adjList = new Dictionary<Vertex, HashSet<Vertex>>();
            // 添加所有顶点和边
            foreach (Vertex[] edge in edges)
            {
                AddVertex(edge[0]);
                AddVertex(edge[1]);
                AddEdge(edge[0], edge[1]);
            }
        }

        /* 获取顶点数量 */
        public int Size()
        {
            return adjList.Count;
        }

        /* 添加边 */
        public void AddEdge(Vertex vet1, Vertex vet2)
        {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 添加边 vet1 - vet2
            adjList[vet1].Add(vet2);
            adjList[vet2].Add(vet1);
        }

        /* 删除边 */
        public void RemoveEdge(Vertex vet1, Vertex vet2)
        {
            if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
                throw new InvalidOperationException();
            // 删除边 vet1 - vet2
            adjList[vet1].Remove(vet2);
            adjList[vet2].Remove(vet1);
        }

        /* 添加顶点 */
        public void AddVertex(Vertex vet)
        {
            if (adjList.ContainsKey(vet))
                return;
            // 在邻接表中添加一个新链表（即 HashSet）
            adjList.Add(vet, new HashSet<Vertex>());
        }

        /* 删除顶点 */
        public void RemoveVertex(Vertex vet)
        {
            if (!adjList.ContainsKey(vet))
                throw new InvalidOperationException();
            // 在邻接表中删除顶点 vet 对应的链表（即 HashSet）
            adjList.Remove(vet);
            // 遍历其它顶点的链表（即 HashSet），删除所有包含 vet 的边
            foreach (HashSet<Vertex> set in adjList.Values)
            {
                set.Remove(vet);
            }
        }
    }
    ```

=== "Swift"

    ```swift title="graph_adjacency_list.swift"

    ```

=== "Zig"

    ```zig title="graph_adjacency_list.zig"

    ```

## 9.2.3. 效率对比

设图中共有 $n$ 个顶点和 $m$ 条边，下表为邻接矩阵和邻接表的时间和空间效率对比。

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

观察上表，貌似邻接表（哈希表）的时间与空间效率最优。但实际上，在邻接矩阵中操作边的效率更高，只需要一次数组访问或赋值操作即可。总结以上，**邻接矩阵体现“以空间换时间”，邻接表体现“以时间换空间”**。
