/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* Depth-first traversal helper function */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // Record visited vertex
    visited.add(vet) // Mark this vertex as visited
    // Traverse all adjacent vertices of this vertex
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // Skip vertices that have been visited
        // Recursively visit adjacent vertices
        dfs(graph, visited, res, adjVet)
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // Vertex traversal sequence
    val res = mutableListOf<Vertex?>()
    // Hash set for recording vertices that have been visited
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Driver Code */
fun main() {
    /* Add edge */
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
    println("\nAfter initialization, graph is")
    graph.print()

    /* Depth-first traversal */
    val res = graphDFS(graph, v[0])
    println("\nDepth-first traversal (DFS) vertex sequence is")
    println(Vertex.vetsToVals(res))
}