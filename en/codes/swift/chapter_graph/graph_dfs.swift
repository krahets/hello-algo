/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Depth-first traversal helper function */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // Record visited vertex
    visited.insert(vet) // Mark the vertex as visited
    // Traverse all adjacent vertices of that vertex
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // Skip already visited vertices
        }
        // Recursively visit adjacent vertices
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Vertex traversal sequence
    var res: [Vertex] = []
    // Hash set, used to record visited vertices
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* Driver Code */
    static func main() {
        /* Initialize undirected graph */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nAfter initialization, the graph is")
        graph.print()

        /* Depth-first traversal */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\nDepth-first traversal (DFS) vertex sequence is")
        print(Vertex.vetsToVals(vets: res))
    }
}
