/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 幅優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂点の訪問順
    var res: [Vertex] = []
    // 訪問済みの頂点を記録するハッシュ集合
    var visited: Set<Vertex> = [startVet]
    // BFS にキューを使う
    var que: [Vertex] = [startVet]
    // 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
    while !que.isEmpty {
        let vet = que.removeFirst() // キューの先頭から頂点を取り出す
        res.append(vet) // 訪問した頂点を記録する
        // この頂点の隣接頂点をすべて調べる
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 訪問済みの頂点を飛ばす
            }
            que.append(adjVet) // 未訪問の頂点だけをキューに追加する
            visited.insert(adjVet) // この頂点を訪問済みにする
        }
    }
    // 頂点を訪問順に返す
    return res
}

@main
enum GraphBFS {
    /* 実行例 */
    static func main() {
        /* 無向グラフを初期化する */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初期化後のグラフ：")
        graph.print()

        /* 幅優先探索 */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\n幅優先探索（BFS）での頂点の訪問順：")
        print(Vertex.vetsToVals(vets: res))
    }
}
