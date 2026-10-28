/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    val adjList = HashMap<Vertex, MutableList<Vertex>>()

    /* 생성자 */
    init {
        // 모든 정점과 간선을 추가한다
        for (edge in edges) {
            addVertex(edge[0]!!)
            addVertex(edge[1]!!)
            addEdge(edge[0]!!, edge[1]!!)
        }
    }

    /* 정점 개수 반환 */
    fun size(): Int {
        return adjList.size
    }

    /* 간선 추가 */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 간선 vet1 - vet2를 추가한다
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* 간선 삭제 */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 간선 vet1 - vet2를 삭제한다
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* 정점 추가 */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // 인접 리스트에 새 연결 리스트를 추가한다
        adjList[vet] = mutableListOf()
    }

    /* 정점 삭제 */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        adjList.remove(vet)
        // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* 인접 리스트 출력 */
    fun print() {
        println("인접 리스트 =")
        for (pair in adjList.entries) {
            val tmp = mutableListOf<Int>()
            for (vertex in pair.value) {
                tmp.add(vertex._val)
            }
            println("${pair.key._val}: $tmp,")
        }
    }
}

/* 실행 코드 */
fun main() {
    /* 무방향 그래프 초기화 */
    val v = Vertex.valsToVets(intArrayOf(1, 3, 2, 5, 4))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[2], v[3]),
        arrayOf(v[2], v[4]),
        arrayOf(v[3], v[4])
    )
    val graph = GraphAdjList(edges)
    println("\n초기화한 후의 그래프")
    graph.print()

    /* 간선 추가 */
    // 정점 1, 2는 각각 v[0], v[2]이다
    graph.addEdge(v[0]!!, v[2]!!)
    println("\n간선 1-2를 추가한 후의 그래프")
    graph.print()

    /* 간선 삭제 */
    // 정점 1, 3은 각각 v[0], v[1]이다
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\n간선 1-3을 삭제한 후의 그래프")
    graph.print()

    /* 정점 추가 */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\n정점 6을 추가한 후의 그래프")
    graph.print()

    /* 정점 삭제 */
    // 정점 3은 v[1]이다
    graph.removeVertex(v[1]!!)
    println("\n정점 3을 삭제한 후의 그래프")
    graph.print()
}