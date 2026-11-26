/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 廣度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 頂點走訪順序
    var res: [Vertex] = []
    // 用雜湊集合記錄已走訪的頂點
    var visited: Set<Vertex> = [startVet]
    // 使用佇列實作 BFS
    var que: [Vertex] = [startVet]
    // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
    while !que.isEmpty {
        let vet = que.removeFirst() // 取出佇列前端的頂點
        res.append(vet) // 記錄走訪的頂點
        // 走訪此頂點的所有相鄰頂點
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 略過已走訪的頂點
            }
            que.append(adjVet) // 只將尚未走訪的頂點加入佇列
            visited.insert(adjVet) // 將此頂點標記為已走訪
        }
    }
    // 回傳頂點的走訪順序
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
        print("\n初始化後的圖為")
        graph.print()

        /* 廣度優先走訪 */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\n廣度優先走訪（BFS）的頂點順序為")
        print(Vertex.vetsToVals(vets: res))
    }
}
