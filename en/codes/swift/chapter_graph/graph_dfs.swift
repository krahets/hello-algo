/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Helper for depth-first traversal */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // Record the visited vertex
    visited.insert(vet) // Mark the vertex as visited
    // Iterate over all neighbors of this vertex
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // Skip visited vertices
        }
        // Visit neighbors recursively
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Vertex traversal order
    var res: [Vertex] = []
    // Use a hash set to track visited vertices
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* Driver code */
    static func main() {
        /* Initialize an undirected graph */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nGraph after initialization:")
        graph.print()

        /* Depth-first traversal */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\nDepth-first search (DFS) visits the vertices in this order:")
        print(Vertex.vetsToVals(vets: res))
    }
}
