/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 隣接リストで実装した無向グラフクラス */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
    val adjList = HashMap<Vertex, MutableList<Vertex>>()

    /* コンストラクタ */
    init {
        // すべての頂点と辺を追加する
        for (edge in edges) {
            addVertex(edge[0]!!)
            addVertex(edge[1]!!)
            addEdge(edge[0]!!, edge[1]!!)
        }
    }

    /* 頂点数を取得する */
    fun size(): Int {
        return adjList.size
    }

    /* 辺を追加する */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 辺 vet1 - vet2 を追加する
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* 辺を削除する */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // 辺 vet1 - vet2 を削除する
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* 頂点を追加する */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // 隣接リストに新しい連結リストを追加する
        adjList[vet] = mutableListOf()
    }

    /* 頂点を削除する */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // 隣接リストから頂点 vet に対応する連結リストを削除する
        adjList.remove(vet)
        // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* 隣接リストを表示する */
    fun print() {
        println("隣接リスト =")
        for (pair in adjList.entries) {
            val tmp = mutableListOf<Int>()
            for (vertex in pair.value) {
                tmp.add(vertex._val)
            }
            println("${pair.key._val}: $tmp,")
        }
    }
}

/* 実行用コード */
fun main() {
    /* 無向グラフを初期化する */
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
    println("\n初期化後のグラフ")
    graph.print()

    /* 辺を追加する */
    // 頂点 1, 2 は v[0], v[2] に対応する
    graph.addEdge(v[0]!!, v[2]!!)
    println("\n辺 1-2 を追加した後のグラフ")
    graph.print()

    /* 辺を削除する */
    // 頂点 1, 3 は v[0], v[1] に対応する
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\n辺 1-3 を削除した後のグラフ")
    graph.print()

    /* 頂点を追加する */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\n頂点 6 を追加した後のグラフ")
    graph.print()

    /* 頂点を削除する */
    // 頂点 3 は v[1] に対応する
    graph.removeVertex(v[1]!!)
    println("\n頂点 3 を削除した後のグラフ")
    graph.print()
}