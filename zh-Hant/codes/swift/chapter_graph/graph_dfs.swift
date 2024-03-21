/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 深度優先走訪輔助函式 */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // 記錄訪問頂點
    visited.insert(vet) // 標記該頂點已被訪問
    // 走訪該頂點的所有鄰接頂點
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // 跳過已被訪問的頂點
        }
        // 遞迴訪問鄰接頂點
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂點走訪序列
    var res: [Vertex] = []
    // 雜湊表，用於記錄已被訪問過的頂點
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
        print("\n初始化後，圖為")
        graph.print()

        /* 深度優先走訪 */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\n深度優先走訪（DFS）頂點序列為")
        print(Vertex.vetsToVals(vets: res))
    }
}
