/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Undirected graph class implemented with an adjacency list */
public class GraphAdjList {
    // Adjacency list: key is a vertex, value is the list of all its neighbors
    public private(set) var adjList: [Vertex: [Vertex]]

    /* Constructor */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // Add all vertices and edges
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* Get the number of vertices */
    public func size() -> Int {
        adjList.count
    }

    /* Add an edge */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Invalid arguments")
        }
        // Add edge vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* Remove an edge */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Invalid arguments")
        }
        // Remove edge vet1 - vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* Add a vertex */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // Add a new list to the adjacency list
        adjList[vet] = []
    }

    /* Remove a vertex */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("Invalid arguments")
        }
        // Remove the list corresponding to vertex vet from the adjacency list
        adjList.removeValue(forKey: vet)
        // Traverse the lists of the other vertices and remove all edges incident to vet
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* Print the adjacency list */
    public func print() {
        Swift.print("Adjacency list =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* Driver code */
    static func main() {
        /* Initialize the undirected graph */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\nGraph after initialization:")
        graph.print()

        /* Add an edge */
        // Vertices 1 and 2 are v[0] and v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\nGraph after adding edge 1-2:")
        graph.print()

        /* Remove an edge */
        // Vertices 1 and 3 are v[0] and v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\nGraph after removing edge 1-3:")
        graph.print()

        /* Add a vertex */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\nGraph after adding vertex 6:")
        graph.print()

        /* Remove a vertex */
        // Vertex 3 is v[1]
        graph.removeVertex(vet: v[1])
        print("\nGraph after removing vertex 3:")
        graph.print()
    }
}

#endif
