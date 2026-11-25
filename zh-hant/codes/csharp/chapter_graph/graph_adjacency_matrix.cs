/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

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

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* 初始化無向圖 */
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
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
        Console.WriteLine("\n初始化後的圖為");
        graph.Print();

        /* 新增邊 */
        // 頂點 1、2 的索引分別為 0、2
        graph.AddEdge(0, 2);
        Console.WriteLine("\n新增邊 1-2 後的圖為");
        graph.Print();

        /* 刪除邊 */
        // 頂點 1、3 的索引分別為 0、1
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\n刪除邊 1-3 後的圖為");
        graph.Print();

        /* 新增頂點 */
        graph.AddVertex(6);
        Console.WriteLine("\n新增頂點 6 後的圖為");
        graph.Print();

        /* 刪除頂點 */
        // 頂點 3 的索引為 1
        graph.RemoveVertex(1);
        Console.WriteLine("\n刪除頂點 3 後的圖為");
        graph.Print();
    }
}
