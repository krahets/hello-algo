/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 깊이 우선 순회 보조 함수 */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // 방문한 정점 기록
    visited.add(vet) // 이 정점을 방문한 것으로 표시
    // 현재 정점에 인접한 모든 정점 순회
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // 이미 방문한 정점은 건너뜀
        // 인접 정점을 재귀적으로 방문
        dfs(graph, visited, res, adjVet)
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // 정점 방문 순서
    val res = mutableListOf<Vertex?>()
    // 방문한 정점을 기록하는 해시 집합
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* 실행 예제 */
fun main() {
    /* 무방향 그래프 초기화 */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[2], v[5]),
        arrayOf(v[4], v[5]),
        arrayOf(v[5], v[6])
    )
    val graph = GraphAdjList(edges)
    println("\n초기화한 그래프:")
    graph.print()

    /* 깊이 우선 순회 */
    val res = graphDFS(graph, v[0])
    println("\n깊이 우선 순회(DFS)의 정점 방문 순서:")
    println(Vertex.vetsToVals(res))
}