/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* 깊이 우선 순회 보조 함수 */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // 방문한 정점을 기록한다
    visited.insert(vet) // 해당 정점을 방문했다고 표시한다
    // 해당 정점의 모든 인접 정점을 순회한다
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // 이미 방문한 정점은 건너뛴다
        }
        // 인접 정점을 재귀적으로 방문한다
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 정점 순회 순서
    var res: [Vertex] = []
    // 방문한 정점을 기록하는 해시 집합
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* 실행 코드 */
    static func main() {
        /* 무방향 그래프 초기화 */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\n초기화한 후의 그래프")
        graph.print()

        /* 깊이 우선 순회 */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\n깊이 우선 순회(DFS)의 정점 순서")
        print(Vertex.vetsToVals(vets: res))
    }
}
