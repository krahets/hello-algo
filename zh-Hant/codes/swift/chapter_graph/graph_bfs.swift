/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 廣度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂點走訪序列
    var res: [Vertex] = []
    // 雜湊表，用於記錄已被訪問過的頂點
    var visited: Set<Vertex> = [startVet]
    // 佇列用於實現 BFS
    var que: [Vertex] = [startVet]
    // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while !que.isEmpty {
        let vet = que.removeFirst() // 佇列首頂點出隊
        res.append(vet) // 記錄訪問頂點
        // 走訪該頂點的所有鄰接頂點
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 跳過已被訪問的頂點
            }
            que.append(adjVet) // 只入列未訪問的頂點
            visited.insert(adjVet) // 標記該頂點已被訪問
        }
    }
    // 返回頂點走訪序列
    return res
}

@main
enum GraphBFS {
    /* Driver Code */
    static func main() {
        /* 初始化無向圖 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化後，圖為")
        graph.print()

        /* 廣度優先走訪 */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\n廣度優先走訪（BFS）頂點序列為")
        print(Vertex.vetsToVals(vets: res))
    }
}
