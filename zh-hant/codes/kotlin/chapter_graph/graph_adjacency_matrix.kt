/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* 以鄰接矩陣實作的無向圖類別 */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // 頂點清單，元素代表頂點值，索引代表頂點索引
    val adjMat = mutableListOf<MutableList<Int>>() // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

    /* 建構式 */
    init {
        // 新增頂點
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // 新增邊
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* 取得頂點數量 */
    fun size(): Int {
        return vertices.size
    }

    /* 新增頂點 */
    fun addVertex(_val: Int) {
        val n = size()
        // 將新頂點的值加入頂點清單
        vertices.add(_val)
        // 在鄰接矩陣中新增一個橫列
        val newRow = mutableListOf<Int>()
        for (j in 0..<n) {
            newRow.add(0)
        }
        adjMat.add(newRow)
        // 在鄰接矩陣中新增一個直行
        for (row in adjMat) {
            row.add(0)
        }
    }

    /* 刪除頂點 */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // 從頂點清單中移除索引為 index 的頂點
        vertices.removeAt(index)
        // 從鄰接矩陣中刪除索引為 index 的橫列
        adjMat.removeAt(index)
        // 從鄰接矩陣中刪除索引為 index 的直行
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* 新增邊 */
    // 參數 i、j 為 vertices 中的元素索引
    fun addEdge(i: Int, j: Int) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    fun removeEdge(i: Int, j: Int) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 印出鄰接矩陣 */
    fun print() {
        print("頂點清單 = ")
        println(vertices)
        println("鄰接矩陣 =")
        printMatrix(adjMat)
    }
}

/* Driver Code */
fun main() {
    /* 初始化無向圖 */
    // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
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
    println("\n初始化後的圖為")
    graph.print()

    /* 新增邊 */
    // 頂點 1、2 的索引分別為 0、2
    graph.addEdge(0, 2)
    println("\n新增邊 1-2 後的圖為")
    graph.print()

    /* 刪除邊 */
    // 頂點 1、3 的索引分別為 0、1
    graph.removeEdge(0, 1)
    println("\n刪除邊 1-3 後的圖為")
    graph.print()

    /* 新增頂點 */
    graph.addVertex(6)
    println("\n新增頂點 6 後的圖為")
    graph.print()

    /* 刪除頂點 */
    // 頂點 3 的索引為 1
    graph.removeVertex(1)
    println("\n刪除頂點 3 後的圖為")
    graph.print()
}