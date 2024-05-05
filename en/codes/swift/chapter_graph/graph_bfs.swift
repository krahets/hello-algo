/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Breadth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Vertex traversal sequence
    var res: [Vertex] = []
    // Hash set, used to record visited vertices
    var visited: Set<Vertex> = [startVet]
    // Queue used to implement BFS
    var que: [Vertex] = [startVet]
    // Starting from vertex vet, loop until all vertices are visited
    while !que.isEmpty {
        let vet = que.removeFirst() // Dequeue the vertex at the head of the queue
        res.append(vet) // Record visited vertex
        // Traverse all adjacent vertices of that vertex
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Skip already visited vertices
            }
            que.append(adjVet) // Only enqueue unvisited vertices
            visited.insert(adjVet) // Mark the vertex as visited
        }
    }
    // Return the vertex traversal sequence
    return res
}

@main
enum GraphBFS {
    /* Driver Code */
    static func main() {
        /* Initialize undirected graph */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nAfter initialization, the graph is")
        graph.print()

        /* Breadth-first traversal */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\nBreadth-first traversal (BFS) vertex sequence is")
        print(Vertex.vetsToVals(vets: res))
    }
}
