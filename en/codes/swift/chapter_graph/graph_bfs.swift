/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Breadth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Vertex traversal order
    var res: [Vertex] = []
    // Use a hash set to track visited vertices
    var visited: Set<Vertex> = [startVet]
    // Use a queue for BFS
    var que: [Vertex] = [startVet]
    // Starting at vertex vet, loop until all reachable vertices have been visited
    while !que.isEmpty {
        let vet = que.removeFirst() // Dequeue the front vertex
        res.append(vet) // Record the visited vertex
        // Iterate over all neighbors of this vertex
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Skip visited vertices
            }
            que.append(adjVet) // Enqueue only unvisited vertices
            visited.insert(adjVet) // Mark the vertex as visited
        }
    }
    // Return the vertex traversal order
    return res
}

@main
enum GraphBFS {
    /* Driver code */
    static func main() {
        /* Initialize an undirected graph */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nGraph after initialization:")
        graph.print()

        /* Breadth-first traversal */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\nBreadth-first search (BFS) visits the vertices in this order:")
        print(Vertex.vetsToVals(vets: res))
    }
}
