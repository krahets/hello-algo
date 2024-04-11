/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* 基于邻接矩阵实现的无向图类 */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    val adjMat = mutableListOf<MutableList<Int>>() // 邻接矩阵，行列索引对应“顶点索引”

    /* 构造方法 */
    init {
        // 添加顶点
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // 添加边
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* 获取顶点数量 */
    fun size(): Int {
        return vertices.size
    }

    /* 添加顶点 */
    fun addVertex(_val: Int) {
        val n = size()
        // 向顶点列表中添加新顶点的值
        vertices.add(_val)
        // 在邻接矩阵中添加一行
        val newRow = mutableListOf<Int>()
        for (j in 0..<n) {
            newRow.add(0)
        }
        adjMat.add(newRow)
        // 在邻接矩阵中添加一列
        for (row in adjMat) {
            row.add(0)
        }
    }

    /* 删除顶点 */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // 在顶点列表中移除索引 index 的顶点
        vertices.removeAt(index)
        // 在邻接矩阵中删除索引 index 的行
        adjMat.removeAt(index)
        // 在邻接矩阵中删除索引 index 的列
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* 添加边 */
    // 参数 i, j 对应 vertices 元素索引
    fun addEdge(i: Int, j: Int) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 删除边 */
    // 参数 i, j 对应 vertices 元素索引
    fun removeEdge(i: Int, j: Int) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 打印邻接矩阵 */
    fun print() {
        print("顶点列表 = ")
        println(vertices)
        println("邻接矩阵 =")
        printMatrix(adjMat)
    }
}

/* Driver Code */
fun main() {
    /* 初始化无向图 */
    // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
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
    println("\n初始化后，图为")
    graph.print()

    /* 添加边 */
    // 顶点 1, 2 的索引分别为 0, 2
    graph.addEdge(0, 2)
    println("\n添加边 1-2 后，图为")
    graph.print()

    /* 删除边 */
    // 顶点 1, 3 的索引分别为 0, 1
    graph.removeEdge(0, 1)
    println("\n删除边 1-3 后，图为")
    graph.print()

    /* 添加顶点 */
    graph.addVertex(6)
    println("\n添加顶点 6 后，图为")
    graph.print()

    /* 删除顶点 */
    // 顶点 3 的索引为 1
    graph.removeVertex(1)
    println("\n删除顶点 3 后，图为")
    graph.print()
}