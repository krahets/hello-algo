/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 深さ優先走査の補助関数 */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // 訪問した頂点を記録する
    visited.insert(vet) // この頂点を訪問済みにする
    // この頂点に隣接する全頂点を走査する
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // 訪問済みの頂点をスキップする
        }
        // 隣接する頂点を再帰的に訪問する
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* 深さ優先走査 */
// 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂点の走査順序
    var res: [Vertex] = []
    // 訪問済みの頂点を記録するハッシュ集合
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* 実行用コード */
    static func main() {
        /* 無向グラフを初期化する */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初期化後のグラフ")
        graph.print()

        /* 深さ優先走査 */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\n深さ優先走査（DFS）の頂点の順序")
        print(Vertex.vetsToVals(vets: res))
    }
}
