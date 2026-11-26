/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* Helper for depth-first traversal */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // Record the visited vertex
    visited.add(vet) // Mark the vertex as visited
    // Iterate over all neighbors of this vertex
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // Skip visited vertices
        // Visit neighbors recursively
        dfs(graph, visited, res, adjVet)
    }
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // Vertex traversal order
    val res = mutableListOf<Vertex?>()
    // Use a hash set to track visited vertices
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Driver code */
fun main() {
    /* Initialize an undirected graph */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[2], v[5]),
        arrayOf(v[4], v[5]),
        arrayOf(v[5], v[6])
    )
    val graph = GraphAdjList(edges)
    println("\nGraph after initialization:")
    graph.print()

    /* Depth-first traversal */
    val res = graphDFS(graph, v[0])
    println("\nDepth-first search (DFS) visits the vertices in this order:")
    println(Vertex.vetsToVals(res))
}