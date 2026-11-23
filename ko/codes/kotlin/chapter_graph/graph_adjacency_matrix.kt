/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    val adjMat = mutableListOf<MutableList<Int>>() // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다

    /* 생성자 */
    init {
        // 정점 추가
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* 정점 개수 반환 */
    fun size(): Int {
        return vertices.size
    }

    /* 정점 추가 */
    fun addVertex(_val: Int) {
        val n = size()
        // 정점 리스트에 새 정점의 값을 추가한다
        vertices.add(_val)
        // 인접 행렬에 행 하나를 추가한다
        val newRow = mutableListOf<Int>()
        for (j in 0..<n) {
            newRow.add(0)
        }
        adjMat.add(newRow)
        // 인접 행렬에 열 하나를 추가한다
        for (row in adjMat) {
            row.add(0)
        }
    }

    /* 정점 삭제 */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // 정점 리스트에서 인덱스 index의 정점을 제거한다
        vertices.removeAt(index)
        // 인접 행렬에서 인덱스 index의 행을 삭제한다
        adjMat.removeAt(index)
        // 인접 행렬에서 인덱스 index의 열을 삭제한다
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* 간선 추가 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    fun addEdge(i: Int, j: Int) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    fun removeEdge(i: Int, j: Int) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 인접 행렬 출력 */
    fun print() {
        print("정점 리스트 = ")
        println(vertices)
        println("인접 행렬 =")
        printMatrix(adjMat)
    }
}

/* 실행 코드 */
fun main() {
    /* 무방향 그래프 초기화 */
    // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
    val vertices = intArrayOf(1, 3, 2, 5, 4)
    val edges = arrayOf(
        intArrayOf(0, 1),
        intArrayOf(0, 3),
        intArrayOf(1, 2),
        intArrayOf(2, 3),
        intArrayOf(2, 4),
        intArrayOf(3, 4)
    )
    val graph = GraphAdjMat(vertices, edges)
    println("\n초기화한 후의 그래프")
    graph.print()

    /* 간선 추가 */
    // 정점 1, 2의 인덱스는 각각 0, 2이다
    graph.addEdge(0, 2)
    println("\n간선 1-2를 추가한 후의 그래프")
    graph.print()

    /* 간선 삭제 */
    // 정점 1, 3의 인덱스는 각각 0, 1이다
    graph.removeEdge(0, 1)
    println("\n간선 1-3을 삭제한 후의 그래프")
    graph.print()

    /* 정점 추가 */
    graph.addVertex(6)
    println("\n정점 6을 추가한 후의 그래프")
    graph.print()

    /* 정점 삭제 */
    // 정점 3의 인덱스는 1이다
    graph.removeVertex(1)
    println("\n정점 3을 삭제한 후의 그래프")
    graph.print()
}