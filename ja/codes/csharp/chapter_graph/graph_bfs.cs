/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* 幅優先探索 */
    // グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = [];
        // 訪問済み頂点を記録するためのハッシュ集合
        HashSet<Vertex> visited = [startVet];
        // BFS の実装にキューを用いる
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 先頭の頂点をデキュー
            res.Add(vet);               // 訪問した頂点を記録
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 訪問済みの頂点をスキップ
                }
                que.Enqueue(adjVet);   // 未訪問の頂点のみをキューに追加
                visited.Add(adjVet);   // この頂点を訪問済みにする
            }
        }

        // 頂点の走査順を返す
        return res;
    }

    [Test]
    public void Test() {
        /* 無向グラフを初期化 */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初期化後、グラフは");
        graph.Print();

        /* 幅優先探索 */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\n幅優先探索（BFS）の頂点順序は");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
