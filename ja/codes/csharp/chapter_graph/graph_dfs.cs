/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* 深さ優先探索の補助関数 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 訪問した頂点を記録する
        visited.Add(vet); // この頂点を訪問済みにする
        // この頂点の隣接頂点をすべて調べる
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 訪問済みの頂点を飛ばす                             
            }
            // 隣接頂点を再帰的に訪問する
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先探索 */
    // 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の訪問順
        List<Vertex> res = [];
        // 訪問済みの頂点を記録するハッシュ集合
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* 無向グラフを初期化する */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初期化後のグラフ：");
        graph.Print();

        /* 深さ優先探索 */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\n深さ優先探索（DFS）での頂点の訪問順：");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
