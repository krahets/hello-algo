/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

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

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* 初始化無向圖 */
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
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
        Console.WriteLine("\n初始化後，圖為");
        graph.Print();

        /* 新增邊 */
        // 頂點 1, 2 的索引分別為 0, 2
        graph.AddEdge(0, 2);
        Console.WriteLine("\n新增邊 1-2 後，圖為");
        graph.Print();

        /* 刪除邊 */
        // 頂點 1, 3 的索引分別為 0, 1
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\n刪除邊 1-3 後，圖為");
        graph.Print();

        /* 新增頂點 */
        graph.AddVertex(6);
        Console.WriteLine("\n新增頂點 6 後，圖為");
        graph.Print();

        /* 刪除頂點 */
        // 頂點 3 的索引為 1
        graph.RemoveVertex(1);
        Console.WriteLine("\n刪除頂點 3 後，圖為");
        graph.Print();
    }
}
