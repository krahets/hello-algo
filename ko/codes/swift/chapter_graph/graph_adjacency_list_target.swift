/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
public class GraphAdjList {
    // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    public private(set) var adjList: [Vertex: [Vertex]]

    /* 생성자 */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // 모든 정점과 간선을 추가한다
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* 정점 개수 반환 */
    public func size() -> Int {
        adjList.count
    }

    /* 간선 추가 */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("인수 오류")
        }
        // 간선 vet1 - vet2를 추가한다
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* 간선 삭제 */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("인수 오류")
        }
        // 간선 vet1 - vet2를 삭제한다
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* 정점 추가 */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // 인접 리스트에 새 연결 리스트를 추가한다
        adjList[vet] = []
    }

    /* 정점 삭제 */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("인수 오류")
        }
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        adjList.removeValue(forKey: vet)
        // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* 인접 리스트 출력 */
    public func print() {
        Swift.print("인접 리스트 =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* 실행 코드 */
    static func main() {
        /* 무방향 그래프 초기화 */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\n초기화한 후의 그래프")
        graph.print()

        /* 간선 추가 */
        // 정점 1, 2는 각각 v[0], v[2]이다
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\n간선 1-2를 추가한 후의 그래프")
        graph.print()

        /* 간선 삭제 */
        // 정점 1, 3은 각각 v[0], v[1]이다
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\n간선 1-3을 삭제한 후의 그래프")
        graph.print()

        /* 정점 추가 */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\n정점 6을 추가한 후의 그래프")
        graph.print()

        /* 정점 삭제 */
        // 정점 3은 v[1]이다
        graph.removeVertex(vet: v[1])
        print("\n정점 3을 삭제한 후의 그래프")
        graph.print()
    }
}

#endif
