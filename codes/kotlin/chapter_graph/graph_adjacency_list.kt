/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 基于邻接表实现的无向图类 */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // 邻接表，key：顶点，value：该顶点的所有邻接顶点
    val adjList = HashMap<Vertex, MutableList<Vertex>>()

    /* 构造方法 */
    init {
        // 添加所有顶点和边
        for (edge in edges) {
            addVertex(edge[0]!!)
            addVertex(edge[1]!!)
            addEdge(edge[0]!!, edge[1]!!)
        }
    }

    /* 获取顶点数量 */
    fun size(): Int {
        return adjList.size
    }

    /* 添加边 */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 添加边 vet1 - vet2
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* 删除边 */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 删除边 vet1 - vet2
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* 添加顶点 */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // 在邻接表中添加一个新链表
        adjList[vet] = mutableListOf()
    }

    /* 删除顶点 */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // 在邻接表中删除顶点 vet 对应的链表
        adjList.remove(vet)
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* 打印邻接表 */
    fun print() {
        println("邻接表 =")
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
    /* 初始化无向图 */
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
    println("\n初始化后，图为")
    graph.print()

    /* 添加边 */
    // 顶点 1, 2 即 v[0], v[2]
    graph.addEdge(v[0]!!, v[2]!!)
    println("\n添加边 1-2 后，图为")
    graph.print()

    /* 删除边 */
    // 顶点 1, 3 即 v[0], v[1]
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\n删除边 1-3 后，图为")
    graph.print()

    /* 添加顶点 */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\n添加顶点 6 后，图为")
    graph.print()

    /* 删除顶点 */
    // 顶点 3 即 v[1]
    graph.removeVertex(v[1]!!)
    println("\n删除顶点 3 后，图为")
    graph.print()
}