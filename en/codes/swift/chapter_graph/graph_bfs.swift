/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Breadth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Vertex traversal sequence
    var res: [Vertex] = []
    // Hash set recording visited vertices
    var visited: Set<Vertex> = [startVet]
    // Use a queue to implement BFS
    var que: [Vertex] = [startVet]
    // Starting from startVet, loop until all reachable vertices have been visited
    while !que.isEmpty {
        let vet = que.removeFirst() // Dequeue the front vertex
        res.append(vet) // Record the visited vertex
        // Traverse all neighbors of this vertex
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Skip vertices that have already been visited
            }
            que.append(adjVet) // Enqueue only unvisited vertices
            visited.insert(adjVet) // Mark this vertex as visited
        }
    }
    // Return the vertex traversal sequence
    return res
}

@main
enum GraphBFS {
    /* Driver code */
    static func main() {
        /* Initialize the undirected graph */
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
        print("\nVertex sequence from breadth-first traversal (BFS):")
        print(Vertex.vetsToVals(vets: res))
    }
}
