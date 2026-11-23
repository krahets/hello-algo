/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* Undirected graph class implemented with an adjacency list */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // Adjacency list: key is a vertex, value is the list of all its neighbors
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

    /* Add an edge */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // Add edge vet1 - vet2
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* Remove an edge */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // Remove edge vet1 - vet2
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* Add a vertex */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // Add a new list to the adjacency list
        adjList[vet] = mutableListOf()
    }

    /* Remove a vertex */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // Remove the list corresponding to vertex vet from the adjacency list
        adjList.remove(vet)
        // Traverse the lists of the other vertices and remove all edges incident to vet
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* Print the adjacency list */
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

/* Driver code */
fun main() {
    /* Initialize the undirected graph */
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
    println("\nGraph after initialization:")
    graph.print()

    /* Add an edge */
    // Vertices 1 and 2 are v[0] and v[2]
    graph.addEdge(v[0]!!, v[2]!!)
    println("\nGraph after adding edge 1-2:")
    graph.print()

    /* Remove an edge */
    // Vertices 1 and 3 are v[0] and v[1]
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\nGraph after removing edge 1-3:")
    graph.print()

    /* Add a vertex */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\nGraph after adding vertex 6:")
    graph.print()

    /* Remove a vertex */
    // Vertex 3 is v[1]
    graph.removeVertex(v[1]!!)
    println("\nGraph after removing vertex 3:")
    graph.print()
}