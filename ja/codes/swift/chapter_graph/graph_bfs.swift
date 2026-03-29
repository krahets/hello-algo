/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 幅優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂点の走査順序
    var res: [Vertex] = []
    // 訪問済み頂点を記録するためのハッシュ集合
    var visited: Set<Vertex> = [startVet]
    // BFS の実装にキューを用いる
    var que: [Vertex] = [startVet]
    // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
    while !que.isEmpty {
        let vet = que.removeFirst() // 先頭の頂点をデキュー
        res.append(vet) // 訪問した頂点を記録
        // この頂点のすべての隣接頂点を走査
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 訪問済みの頂点をスキップ
            }
            que.append(adjVet) // 未訪問の頂点のみをキューに追加
            visited.insert(adjVet) // この頂点を訪問済みにする
        }
    }
    // 頂点の走査順を返す
    return res
}

@main
enum GraphBFS {
    /* Driver Code */
    static func main() {
        /* 無向グラフを初期化 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初期化後のグラフ")
        graph.print()

        /* 幅優先探索 */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\n幅優先探索（BFS）の頂点列")
        print(Vertex.vetsToVals(vets: res))
    }
}
