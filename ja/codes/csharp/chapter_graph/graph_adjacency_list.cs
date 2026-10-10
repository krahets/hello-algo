/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* 隣接リストに基づく無向グラフクラス */
public class GraphAdjList {
    // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* コンストラクタ */
    public GraphAdjList(Vertex[][] edges) {
        adjList = [];
        // すべての頂点と辺を追加
        foreach (Vertex[] edge in edges) {
            AddVertex(edge[0]);
            AddVertex(edge[1]);
            AddEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得 */
    int Size() {
        return adjList.Count;
    }

    /* 辺を追加 */
    public void AddEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 辺 vet1 - vet2 を追加
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* 辺を削除 */
    public void RemoveEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 辺 vet1 - vet2 を削除
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* 頂点を追加 */
    public void AddVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // 隣接リストに新しいリストを追加
        adjList.Add(vet, []);
    }

    /* 頂点を削除 */
    public void RemoveVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // 隣接リストから頂点 vet に対応するリストを削除
        adjList.Remove(vet);
        // 他の頂点のリストを走査し、vet を含むすべての辺を削除
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* 隣接リストを出力 */
    public void Print() {
        Console.WriteLine("隣接リスト =");
        foreach (KeyValuePair<Vertex, List<Vertex>> pair in adjList) {
            List<int> tmp = [];
            foreach (Vertex vertex in pair.Value)
                tmp.Add(vertex.val);
            Console.WriteLine(pair.Key.val + ": [" + string.Join(", ", tmp) + "],");
        }
    }
}

public class graph_adjacency_list {
    [Test]
    public void Test() {
        /* 無向グラフを初期化 */
        Vertex[] v = Vertex.ValsToVets([1, 3, 2, 5, 4]);
        Vertex[][] edges =
        [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[2], v[3]],
            [v[2], v[4]],
            [v[3], v[4]] 
        ];
        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初期化後、グラフは");
        graph.Print();

        /* 辺を追加 */
        // 頂点 1, 2 は v[0], v[2]
        graph.AddEdge(v[0], v[2]);
        Console.WriteLine("\n辺 1-2 を追加した後、グラフは");
        graph.Print();

        /* 辺を削除 */
        // 頂点 1, 3 は v[0], v[1]
        graph.RemoveEdge(v[0], v[1]);
        Console.WriteLine("\n辺 1-3 を削除した後、グラフは");
        graph.Print();

        /* 頂点を追加 */
        Vertex v5 = new(6);
        graph.AddVertex(v5);
        Console.WriteLine("\n頂点 6 を追加した後、グラフは");
        graph.Print();

        /* 頂点を削除 */
        // 頂点 3 は v[1]
        graph.RemoveVertex(v[1]);
        Console.WriteLine("\n頂点 3 を削除した後、グラフは");
        graph.Print();
    }
}
