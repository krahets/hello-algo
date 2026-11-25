/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 深度優先走訪的輔助函式 */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // 記錄走訪的頂點
    visited.insert(vet) // 將此頂點標記為已走訪
    // 走訪此頂點的所有相鄰頂點
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // 略過已走訪的頂點
        }
        // 遞迴走訪相鄰頂點
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂點走訪順序
    var res: [Vertex] = []
    // 用雜湊集合記錄已走訪的頂點
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* Driver Code */
    static func main() {
        /* 初始化無向圖 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化後的圖為")
        graph.print()

        /* 深度優先走訪 */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\n深度優先走訪（DFS）的頂點順序為")
        print(Vertex.vetsToVals(vets: res))
    }
}
