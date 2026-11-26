/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 너비 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 정점 방문 순서
    var res: [Vertex] = []
    // 방문한 정점을 기록하는 해시 집합
    var visited: Set<Vertex> = [startVet]
    // BFS 구현에 사용하는 큐
    var que: [Vertex] = [startVet]
    // 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
    while !que.isEmpty {
        let vet = que.removeFirst() // 큐의 맨 앞 정점을 꺼냄
        res.append(vet) // 방문한 정점 기록
        // 현재 정점에 인접한 모든 정점 순회
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // 이미 방문한 정점은 건너뜀
            }
            que.append(adjVet) // 아직 방문하지 않은 정점만 큐에 삽입
            visited.insert(adjVet) // 이 정점을 방문한 것으로 표시
        }
    }
    // 정점 방문 순서 반환
    return res
}

@main
enum GraphBFS {
    /* 실행 예제 */
    static func main() {
        /* 무방향 그래프 초기화 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n초기화한 그래프:")
        graph.print()

        /* 너비 우선 순회 */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\n너비 우선 순회(BFS)의 정점 방문 순서:")
        print(Vertex.vetsToVals(vets: res))
    }
}
