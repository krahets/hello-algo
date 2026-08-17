/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* Undirected graph class based on adjacency list */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    val adjList = HashMap<Vertex, MutableList<Vertex>>()

    /* Constructor */
    init {
        // Add all vertices and edges
        for (edge in edges) {
            addVertex(edge[0]!!)
            addVertex(edge[1]!!)
            addEdge(edge[0]!!, edge[1]!!)
        }
    }

    /* Get the number of vertices */
    fun size(): Int {
        return adjList.size
    }

    /* Add edge */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // Add edge vet1 - vet2
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* Remove edge */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // Remove edge vet1 - vet2
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* Add vertex */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // Add a new linked list in the adjacency list
        adjList[vet] = mutableListOf()
    }

    /* Remove vertex */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // Remove the linked list corresponding to vertex vet in the adjacency list
        adjList.remove(vet)
        // Traverse the linked lists of other vertices and remove all edges containing vet
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* Print adjacency list */
    fun print() {
        println("Adjacency list =")
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
    /* Add edge */
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
    println("\nAfter initialization, graph is")
    graph.print()

    /* Add edge */
    // Vertices 1, 3 are v[0], v[1]
    graph.addEdge(v[0]!!, v[2]!!)
    println("\nAfter adding edge 1-2, graph is")
    graph.print()

    /* Remove edge */
    // Vertex 3 is v[1]
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\nAfter removing edge 1-3, graph is")
    graph.print()

    /* Add vertex */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\nAfter adding vertex 6, graph is")
    graph.print()

    /* Remove vertex */
    // Vertex 3 is v[1]
    graph.removeVertex(v[1]!!)
    println("\nAfter removing vertex 3, graph is")
    graph.print()
}