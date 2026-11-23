/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 너비 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 정점 순회 순서
    val res = mutableListOf<Vertex?>()
    // 방문한 정점을 기록하는 해시 집합
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // 큐를 사용하여 BFS를 구현한다
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
    while (!que.isEmpty()) {
        val vet = que.poll() // 큐 맨 앞의 정점을 꺼낸다
        res.add(vet)         // 방문한 정점을 기록한다
        // 해당 정점의 모든 인접 정점을 순회한다
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 이미 방문한 정점은 건너뛴다
            que.offer(adjVet)   // 방문하지 않은 정점만 큐에 삽입한다
            visited.add(adjVet) // 해당 정점을 방문했다고 표시한다
        }
    }
    // 정점 순회 순서를 반환한다
    return res
}

/* 실행 코드 */
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
    println("\n초기화한 후의 그래프")
    graph.print()

    /* 너비 우선 순회 */
    val res = graphBFS(graph, v[0]!!)
    println("\n너비 우선 순회(BFS)의 정점 순서")
    println(Vertex.vetsToVals(res))
}