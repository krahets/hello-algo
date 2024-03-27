/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基於鄰接表實現的無向圖類別 */
public class GraphAdjList {
    // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
    public private(set) var adjList: [Vertex: [Vertex]]

    /* 建構子 */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // 新增所有頂點和邊
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* 獲取頂點數量 */
    public func size() -> Int {
        adjList.count
    }

    /* 新增邊 */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("參數錯誤")
        }
        // 新增邊 vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* 刪除邊 */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("參數錯誤")
        }
        // 刪除邊 vet1 - vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* 新增頂點 */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // 在鄰接表中新增一個新鏈結串列
        adjList[vet] = []
    }

    /* 刪除頂點 */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("參數錯誤")
        }
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        adjList.removeValue(forKey: vet)
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* 列印鄰接表 */
    public func print() {
        Swift.print("鄰接表 =")
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
        /* 初始化無向圖 */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化後，圖為")
        graph.print()

        /* 新增邊 */
        // 頂點 1, 2 即 v[0], v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\n新增邊 1-2 後，圖為")
        graph.print()

        /* 刪除邊 */
        // 頂點 1, 3 即 v[0], v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\n刪除邊 1-3 後，圖為")
        graph.print()

        /* 新增頂點 */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\n新增頂點 6 後，圖為")
        graph.print()

        /* 刪除頂點 */
        // 頂點 3 即 v[1]
        graph.removeVertex(vet: v[1])
        print("\n刪除頂點 3 後，圖為")
        graph.print()
    }
}

#endif
