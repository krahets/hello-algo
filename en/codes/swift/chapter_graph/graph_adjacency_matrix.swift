/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Undirected graph class implemented with an adjacency matrix */
class GraphAdjMat {
    private var vertices: [Int] // Vertex list: elements are vertex values, and indices are vertex indices
    private var adjMat: [[Int]] // Adjacency matrix: row and column indices correspond to vertex indices

    /* Constructor */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // Add all vertices
        for val in vertices {
            addVertex(val: val)
        }
        // Add all edges
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* Get the number of vertices */
    func size() -> Int {
        vertices.count
    }

    /* Add a vertex */
    func addVertex(val: Int) {
        let n = size()
        // Append the new vertex value to the vertex list
        vertices.append(val)
        // Add a row to the adjacency matrix
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // Add a column to the adjacency matrix
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* Remove a vertex */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("Invalid index")
        }
        // Remove the vertex at index `index` from the vertex list
        vertices.remove(at: index)
        // Remove row `index` from the adjacency matrix
        adjMat.remove(at: index)
        // Remove column `index` from the adjacency matrix
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* Add an edge */
    // Parameters i and j are element indices in vertices
    func addEdge(i: Int, j: Int) {
        // Handle out-of-bounds or equal indices
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Invalid index")
        }
        // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Remove an edge */
    // Parameters i and j are element indices in vertices
    func removeEdge(i: Int, j: Int) {
        // Handle out-of-bounds or equal indices
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Invalid index")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* Print the adjacency matrix */
    func print() {
        Swift.print("Vertex list = ", terminator: "")
        Swift.print(vertices)
        Swift.print("Adjacency matrix =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Driver code */
    static func main() {
        /* Initialize the undirected graph */
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\nGraph after initialization:")
        graph.print()

        /* Add an edge */
        // Vertices 1 and 2 have indices 0 and 2, respectively
        graph.addEdge(i: 0, j: 2)
        print("\nGraph after adding edge 1-2:")
        graph.print()

        /* Remove an edge */
        // Vertices 1 and 3 have indices 0 and 1, respectively
        graph.removeEdge(i: 0, j: 1)
        print("\nGraph after removing edge 1-3:")
        graph.print()

        /* Add a vertex */
        graph.addVertex(val: 6)
        print("\nGraph after adding vertex 6:")
        graph.print()

        /* Remove a vertex */
        // Vertex 3 has index 1
        graph.removeVertex(index: 1)
        print("\nGraph after removing vertex 3:")
        graph.print()
    }
}
