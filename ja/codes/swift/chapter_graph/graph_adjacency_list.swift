/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 隣接リストで実装した無向グラフクラス */
public class GraphAdjList {
    // 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
    public private(set) var adjList: [Vertex: [Vertex]]

    /* コンストラクタ */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // すべての頂点と辺を追加する
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* 頂点数を取得する */
    public func size() -> Int {
        adjList.count
    }

    /* 辺を追加する */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("引数が不正です")
        }
        // 辺 vet1 - vet2 を追加する
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* 辺を削除する */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("引数が不正です")
        }
        // 辺 vet1 - vet2 を削除する
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* 頂点を追加する */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // 隣接リストに新しい連結リストを追加する
        adjList[vet] = []
    }

    /* 頂点を削除する */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("引数が不正です")
        }
        // 隣接リストから頂点 vet に対応する連結リストを削除する
        adjList.removeValue(forKey: vet)
        // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* 隣接リストを表示する */
    public func print() {
        Swift.print("隣接リスト =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* 実行用コード */
    static func main() {
        /* 無向グラフを初期化する */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\n初期化後のグラフ")
        graph.print()

        /* 辺を追加する */
        // 頂点 1, 2 は v[0], v[2] に対応する
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\n辺 1-2 を追加した後のグラフ")
        graph.print()

        /* 辺を削除する */
        // 頂点 1, 3 は v[0], v[1] に対応する
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\n辺 1-3 を削除した後のグラフ")
        graph.print()

        /* 頂点を追加する */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\n頂点 6 を追加した後のグラフ")
        graph.print()

        /* 頂点を削除する */
        // 頂点 3 は v[1] に対応する
        graph.removeVertex(vet: v[1])
        print("\n頂点 3 を削除した後のグラフ")
        graph.print()
    }
}

#endif
