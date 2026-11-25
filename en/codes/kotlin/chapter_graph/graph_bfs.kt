/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* Breadth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // Vertex traversal order
    val res = mutableListOf<Vertex?>()
    // Use a hash set to track visited vertices
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // Use a queue for BFS
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // Starting at vertex vet, loop until all reachable vertices have been visited
    while (!que.isEmpty()) {
        val vet = que.poll() // Dequeue the front vertex
        res.add(vet)         // Record the visited vertex
        // Iterate over all neighbors of this vertex
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // Skip visited vertices
            que.offer(adjVet)   // Enqueue only unvisited vertices
            visited.add(adjVet) // Mark the vertex as visited
        }
    }
    // Return the vertex traversal order
    return res
}

/* Driver code */
fun main() {
    /* Initialize an undirected graph */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[1], v[4]),
        arrayOf(v[2], v[5]),
        arrayOf(v[3], v[4]),
        arrayOf(v[3], v[6]),
        arrayOf(v[4], v[5]),
        arrayOf(v[4], v[7]),
        arrayOf(v[5], v[8]),
        arrayOf(v[6], v[7]),
        arrayOf(v[7], v[8])
    )
    val graph = GraphAdjList(edges)
    println("\nGraph after initialization:")
    graph.print()

    /* Breadth-first traversal */
    val res = graphBFS(graph, v[0]!!)
    println("\nBreadth-first search (BFS) visits the vertices in this order:")
    println(Vertex.vetsToVals(res))
}