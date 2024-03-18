/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基于邻接表实现的无向图类 */
public class GraphAdjList {
    // 邻接表，key：顶点，value：该顶点的所有邻接顶点
    public private(set) var adjList: [Vertex: [Vertex]]

    /* 构造方法 */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // 添加所有顶点和边
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* 获取顶点数量 */
    public func size() -> Int {
        adjList.count
    }

    /* 添加边 */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("参数错误")
        }
        // 添加边 vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* 删除边 */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("参数错误")
        }
        // 删除边 vet1 - vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* 添加顶点 */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // 在邻接表中添加一个新链表
        adjList[vet] = []
    }

    /* 删除顶点 */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("参数错误")
        }
        // 在邻接表中删除顶点 vet 对应的链表
        adjList.removeValue(forKey: vet)
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* 打印邻接表 */
    public func print() {
        Swift.print("邻接表 =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* Driver Code */
    static func main() {
        /* 初始化无向图 */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化后，图为")
        graph.print()

        /* 添加边 */
        // 顶点 1, 2 即 v[0], v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\n添加边 1-2 后，图为")
        graph.print()

        /* 删除边 */
        // 顶点 1, 3 即 v[0], v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\n删除边 1-3 后，图为")
        graph.print()

        /* 添加顶点 */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\n添加顶点 6 后，图为")
        graph.print()

        /* 删除顶点 */
        // 顶点 3 即 v[1]
        graph.removeVertex(vet: v[1])
        print("\n删除顶点 3 后，图为")
        graph.print()
    }
}

#endif
