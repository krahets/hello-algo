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

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* 初始化无向图 */
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        int[] vertices = [1, 3, 2, 5, 4];
        int[][] edges = 
        [
            [0, 1],
            [0, 3],
            [1, 2],
            [2, 3],
            [2, 4],
            [3, 4]
        ];
        GraphAdjMat graph = new(vertices, edges);
        Console.WriteLine("\n初始化后，图为");
        graph.Print();

        /* 添加边 */
        // 顶点 1, 2 的索引分别为 0, 2
        graph.AddEdge(0, 2);
        Console.WriteLine("\n添加边 1-2 后，图为");
        graph.Print();

        /* 删除边 */
        // 顶点 1, 3 的索引分别为 0, 1
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\n删除边 1-3 后，图为");
        graph.Print();

        /* 添加顶点 */
        graph.AddVertex(6);
        Console.WriteLine("\n添加顶点 6 后，图为");
        graph.Print();

        /* 删除顶点 */
        // 顶点 3 的索引为 1
        graph.RemoveVertex(1);
        Console.WriteLine("\n删除顶点 3 后，图为");
        graph.Print();
    }
}
