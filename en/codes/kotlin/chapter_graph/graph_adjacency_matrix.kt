/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // Vertex list, elements represent "vertex value", index represents "vertex index"
    val adjMat = mutableListOf<MutableList<Int>>() // Adjacency matrix, row and column indices correspond to "vertex index"

    /* Constructor */
    init {
        // Add vertex
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // Add edge
        // Please note, edges elements represent vertex indices, corresponding to vertices elements indices
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* Get the number of vertices */
    fun size(): Int {
        return vertices.size
    }

    /* Add vertex */
    fun addVertex(_val: Int) {
        val n = size()
        // Add new vertex value to the vertex list
        vertices.add(_val)
        // Add a row to the adjacency matrix
        val newRow = mutableListOf<Int>()
        for (j in 0..<n) {
            newRow.add(0)
        }
        adjMat.add(newRow)
        // Add a column to the adjacency matrix
        for (row in adjMat) {
            row.add(0)
        }
    }

    /* Remove vertex */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // Remove vertex at `index` from the vertex list
        vertices.removeAt(index)
        // Remove the row at `index` from the adjacency matrix
        adjMat.removeAt(index)
        // Remove the column at `index` from the adjacency matrix
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* Add edge */
    // Parameters i, j correspond to vertices element indices
    fun addEdge(i: Int, j: Int) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., satisfies (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Remove edge */
    // Parameters i, j correspond to vertices element indices
    fun removeEdge(i: Int, j: Int) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* Print adjacency matrix */
    fun print() {
        print("Vertex list =")
        println(vertices)
        println("Adjacency matrix =")
        printMatrix(adjMat)
    }
}

/* Driver Code */
fun main() {
    /* Initialize undirected graph */
    // Please note, edges elements represent vertex indices, corresponding to vertices elements indices
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
    println("\nAfter initialization, the graph is")
    graph.print()

    /* Add edge */
    // Indices of vertices 1, 2 are 0, 2 respectively
    graph.addEdge(0, 2)
    println("\nAfter adding edge 1-2, the graph is")
    graph.print()

    /* Remove edge */
    // Indices of vertices 1, 3 are 0, 1 respectively
    graph.removeEdge(0, 1)
    println("\nAfter removing edge 1-3, the graph is")
    graph.print()

    /* Add vertex */
    graph.addVertex(6)
    println("\nAfter adding vertex 6, the graph is")
    graph.print()

    /* Remove vertex */
    // Index of vertex 3 is 1
    graph.removeVertex(1)
    println("\nAfter removing vertex 3, the graph is")
    graph.print()
}