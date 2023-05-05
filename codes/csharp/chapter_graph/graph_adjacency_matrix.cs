/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* 基于邻接矩阵实现的无向图类 */
class GraphAdjMat {
    List<int> vertices;     // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    List<List<int>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

    /* 构造函数 */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new List<int>();
        this.adjMat = new List<List<int>>();
        // 添加顶点
        foreach (int val in vertices) {
            addVertex(val);
        }
        // 添加边
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        foreach (int[] e in edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 获取顶点数量 */
    public int size() {
        return vertices.Count;
    }

    /* 添加顶点 */
    public void addVertex(int val) {
        int n = size();
        // 向顶点列表中添加新顶点的值
        vertices.Add(val);
        // 在邻接矩阵中添加一行
        List<int> newRow = new List<int>(n);
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
    public void removeVertex(int index) {
        if (index >= size())
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
    public void addEdge(int i, int j) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfRangeException();
        // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 删除边 */
    // 参数 i, j 对应 vertices 元素索引
    public void removeEdge(int i, int j) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 打印邻接矩阵 */
    public void print() {
        Console.Write("顶点列表 = ");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("邻接矩阵 =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* 初始化无向图 */
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = new int[][] { new int[] { 0, 1 }, new int[] { 0, 3 },
                                      new int[] { 1, 2 }, new int[] { 2, 3 },
                                      new int[] { 2, 4 }, new int[] { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        Console.WriteLine("\n初始化后，图为");
        graph.print();

        /* 添加边 */
        // 顶点 1, 2 的索引分别为 0, 2
        graph.addEdge(0, 2);
        Console.WriteLine("\n添加边 1-2 后，图为");
        graph.print();

        /* 删除边 */
        // 顶点 1, 3 的索引分别为 0, 1
        graph.removeEdge(0, 1);
        Console.WriteLine("\n删除边 1-3 后，图为");
        graph.print();

        /* 添加顶点 */
        graph.addVertex(6);
        Console.WriteLine("\n添加顶点 6 后，图为");
        graph.print();

        /* 删除顶点 */
        // 顶点 3 的索引为 1
        graph.removeVertex(1);
        Console.WriteLine("\n删除顶点 3 后，图为");
        graph.print();
    }
}
