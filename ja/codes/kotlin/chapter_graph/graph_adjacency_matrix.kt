/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* 隣接行列に基づく無向グラフクラス */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
    val adjMat = mutableListOf<MutableList<Int>>() // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

    /* コンストラクタ */
    init {
        // 頂点を追加
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* 頂点数を取得 */
    fun size(): Int {
        return vertices.size
    }

    /* 頂点を追加 */
    fun addVertex(_val: Int) {
        val n = size()
        // 頂点リストに新しい頂点の値を追加
        vertices.add(_val)
        // 隣接行列に 1 行追加
        val newRow = mutableListOf<Int>()
        for (j in 0..<n) {
            newRow.add(0)
        }
        adjMat.add(newRow)
        // 隣接行列に 1 列追加
        for (row in adjMat) {
            row.add(0)
        }
    }

    /* 頂点を削除 */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // 頂点リストから index の頂点を削除する
        vertices.removeAt(index)
        // 隣接行列で index 行を削除する
        adjMat.removeAt(index)
        // 隣接行列で index 列を削除する
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* 辺を追加 */
    // 引数 i, j は vertices の要素インデックスに対応する
    fun addEdge(i: Int, j: Int) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 辺を削除 */
    // 引数 i, j は vertices の要素インデックスに対応する
    fun removeEdge(i: Int, j: Int) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 隣接行列を出力 */
    fun print() {
        print("頂点リスト = ")
        println(vertices)
        println("隣接行列 =")
        printMatrix(adjMat)
    }
}

/* Driver Code */
fun main() {
    /* 無向グラフを初期化 */
    // edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
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
    println("\n初期化後のグラフは")
    graph.print()

    /* 辺を追加 */
    // 頂点 1, 2 のインデックスはそれぞれ 0, 2
    graph.addEdge(0, 2)
    println("\n辺 1-2 を追加した後のグラフは")
    graph.print()

    /* 辺を削除 */
    // 頂点 1, 3 のインデックスはそれぞれ 0, 1
    graph.removeEdge(0, 1)
    println("\n辺 1-3 を削除した後のグラフは")
    graph.print()

    /* 頂点を追加 */
    graph.addVertex(6)
    println("\n頂点 6 を追加した後のグラフは")
    graph.print()

    /* 頂点を削除 */
    // 頂点 3 のインデックスは 1
    graph.removeVertex(1)
    println("\n頂点 3 を削除した後のグラフは")
    graph.print()
}