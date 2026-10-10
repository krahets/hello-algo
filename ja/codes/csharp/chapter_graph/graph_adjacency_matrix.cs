/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

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

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* 無向グラフを初期化 */
        // edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
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
        Console.WriteLine("\n初期化後、グラフは");
        graph.Print();

        /* 辺を追加 */
        // 頂点 1, 2 のインデックスはそれぞれ 0, 2
        graph.AddEdge(0, 2);
        Console.WriteLine("\n辺 1-2 を追加した後、グラフは");
        graph.Print();

        /* 辺を削除 */
        // 頂点 1, 3 のインデックスはそれぞれ 0, 1
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\n辺 1-3 を削除した後、グラフは");
        graph.Print();

        /* 頂点を追加 */
        graph.AddVertex(6);
        Console.WriteLine("\n頂点 6 を追加した後、グラフは");
        graph.Print();

        /* 頂点を削除 */
        // 頂点 3 のインデックスは 1
        graph.RemoveVertex(1);
        Console.WriteLine("\n頂点 3 を削除した後、グラフは");
        graph.Print();
    }
}
