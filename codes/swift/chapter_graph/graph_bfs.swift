/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 广度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 顶点遍历序列
    var res: [Vertex] = []
    // 哈希集合，用于记录已被访问过的顶点
    var visited: Set<Vertex> = [startVet]
    // 队列用于实现 BFS
    var que: [Vertex] = [startVet]
    // 以顶点 vet 为起点，循环直至访问完所有顶点
    while !que.isEmpty {
        let vet = que.removeFirst() // 队首顶点出队
        res.append(vet) // 记录访问顶点
        // 遍历该顶点的所有邻接顶点
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 跳过已被访问的顶点
            }
            que.append(adjVet) // 只入队未访问的顶点
            visited.insert(adjVet) // 标记该顶点已被访问
        }
    }
    // 返回顶点遍历序列
    return res
}

@main
enum GraphBFS {
    /* Driver Code */
    static func main() {
        /* 初始化无向图 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化后，图为")
        graph.print()

        /* 广度优先遍历 */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\n广度优先遍历（BFS）顶点序列为")
        print(Vertex.vetsToVals(vets: res))
    }
}
