/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 深度优先遍历辅助函数 */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // 记录访问顶点
    visited.insert(vet) // 标记该顶点已被访问
    // 遍历该顶点的所有邻接顶点
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // 跳过已被访问的顶点
        }
        // 递归访问邻接顶点
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* 深度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 顶点遍历序列
    var res: [Vertex] = []
    // 哈希表，用于记录已被访问过的顶点
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* Driver Code */
    static func main() {
        /* 初始化无向图 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化后，图为")
        graph.print()

        /* 深度优先遍历 */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\n深度优先遍历（DFS）顶点序列为")
        print(Vertex.vetsToVals(vets: res))
    }
}
