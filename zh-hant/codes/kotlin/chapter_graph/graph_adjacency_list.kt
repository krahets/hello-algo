/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 基於鄰接表實現的無向圖類別 */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
    val adjList = HashMap<Vertex, MutableList<Vertex>>()

    /* 建構子 */
    init {
        // 新增所有頂點和邊
        for (edge in edges) {
            addVertex(edge[0]!!)
            addVertex(edge[1]!!)
            addEdge(edge[0]!!, edge[1]!!)
        }
    }

    /* 獲取頂點數量 */
    fun size(): Int {
        return adjList.size
    }

    /* 新增邊 */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 新增邊 vet1 - vet2
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* 刪除邊 */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 刪除邊 vet1 - vet2
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* 新增頂點 */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // 在鄰接表中新增一個新鏈結串列
        adjList[vet] = mutableListOf()
    }

    /* 刪除頂點 */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        adjList.remove(vet)
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* 列印鄰接表 */
    fun print() {
        println("鄰接表 =")
        for (pair in adjList.entries) {
            val tmp = mutableListOf<Int>()
            for (vertex in pair.value) {
                tmp.add(vertex._val)
            }
            println("${pair.key._val}: $tmp,")
        }
    }
}

/* Driver Code */
fun main() {
    /* 初始化無向圖 */
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
    println("\n初始化後，圖為")
    graph.print()

    /* 新增邊 */
    // 頂點 1, 2 即 v[0], v[2]
    graph.addEdge(v[0]!!, v[2]!!)
    println("\n新增邊 1-2 後，圖為")
    graph.print()

    /* 刪除邊 */
    // 頂點 1, 3 即 v[0], v[1]
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\n刪除邊 1-3 後，圖為")
    graph.print()

    /* 新增頂點 */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\n新增頂點 6 後，圖為")
    graph.print()

    /* 刪除頂點 */
    // 頂點 3 即 v[1]
    graph.removeVertex(v[1]!!)
    println("\n刪除頂點 3 後，圖為")
    graph.print()
}