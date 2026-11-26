/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 너비 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 정점 방문 순서
    val res = mutableListOf<Vertex?>()
    // 방문한 정점을 기록하는 해시 집합
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // BFS 구현에 사용하는 큐
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
    while (!que.isEmpty()) {
        val vet = que.poll() // 큐의 맨 앞 정점을 꺼냄
        res.add(vet)         // 방문한 정점 기록
        // 현재 정점에 인접한 모든 정점 순회
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 이미 방문한 정점은 건너뜀
            que.offer(adjVet)   // 아직 방문하지 않은 정점만 큐에 삽입
            visited.add(adjVet) // 이 정점을 방문한 것으로 표시
        }
    }
    // 정점 방문 순서 반환
    return res
}

/* 실행 예제 */
fun main() {
    /* 무방향 그래프 초기화 */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[1], v[4]),
        arrayOf(v[2], v[5]),
        arrayOf(v[3], v[4]),
        arrayOf(v[3], v[6]),
        arrayOf(v[4], v[5]),
        arrayOf(v[4], v[7]),
        arrayOf(v[5], v[8]),
        arrayOf(v[6], v[7]),
        arrayOf(v[7], v[8])
    )
    val graph = GraphAdjList(edges)
    println("\n초기화한 그래프:")
    graph.print()

    /* 너비 우선 순회 */
    val res = graphBFS(graph, v[0]!!)
    println("\n너비 우선 순회(BFS)의 정점 방문 순서:")
    println(Vertex.vetsToVals(res))
}