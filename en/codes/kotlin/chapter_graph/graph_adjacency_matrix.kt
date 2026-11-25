/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* Undirected graph represented by an adjacency matrix */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // Vertex list: each element holds a vertex value, and its position is the vertex index
    val adjMat = mutableListOf<MutableList<Int>>() // Adjacency matrix: row and column indices are vertex indices

    /* Constructor */
    init {
        // Add a vertex
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // Add an edge
        // The entries in edges are vertex indices, that is, indices into vertices
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* Get the vertex count */
    fun size(): Int {
        return vertices.size
    }

    /* Add a vertex */
    fun addVertex(_val: Int) {
        val n = size()
        // Append the new vertex value to the vertex list
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

    /* Remove a vertex */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // Remove the vertex at the specified index from the vertex list
        vertices.removeAt(index)
        // Remove the row at the specified index from the adjacency matrix
        adjMat.removeAt(index)
        // Remove the column at the specified index from the adjacency matrix
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* Add an edge */
    // Parameters i and j are indices into vertices
    fun addEdge(i: Int, j: Int) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // An undirected graph has a symmetric adjacency matrix: (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Remove an edge */
    // Parameters i and j are indices into vertices
    fun removeEdge(i: Int, j: Int) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* Print the adjacency matrix */
    fun print() {
        print("Vertex list = ")
        println(vertices)
        println("Adjacency matrix =")
        printMatrix(adjMat)
    }
}

/* Driver code */
fun main() {
    /* Initialize an undirected graph */
    // The entries in edges are vertex indices, that is, indices into vertices
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
    println("\nGraph after initialization:")
    graph.print()

    /* Add an edge */
    // Vertices 1 and 2 have indices 0 and 2, respectively
    graph.addEdge(0, 2)
    println("\nGraph after adding edge 1-2:")
    graph.print()

    /* Remove an edge */
    // Vertices 1 and 3 have indices 0 and 1, respectively
    graph.removeEdge(0, 1)
    println("\nGraph after removing edge 1-3:")
    graph.print()

    /* Add a vertex */
    graph.addVertex(6)
    println("\nGraph after adding vertex 6:")
    graph.print()

    /* Remove a vertex */
    // Vertex 3 has index 1
    graph.removeVertex(1)
    println("\nGraph after removing vertex 3:")
    graph.print()
}