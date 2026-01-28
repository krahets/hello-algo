/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
    private var vertices: [Int] // Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
    private var adjMat: [[Int]] // Adjacency matrix, where the row and column indices correspond to the "vertex index"

    /* Constructor */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // Add vertex
        for val in vertices {
            addVertex(val: val)
        }
        // Add edge
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* Get the number of vertices */
    func size() -> Int {
        vertices.count
    }

    /* Add vertex */
    func addVertex(val: Int) {
        let n = size()
        // Add the value of the new vertex to the vertex list
        vertices.append(val)
        // Add a row to the adjacency matrix
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // Add a column to the adjacency matrix
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* Remove vertex */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("Out of bounds")
        }
        // Remove the vertex at index from the vertex list
        vertices.remove(at: index)
        // Remove the row at index from the adjacency matrix
        adjMat.remove(at: index)
        // Remove the column at index from the adjacency matrix
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* Add edge */
    // Parameters i, j correspond to the vertices element indices
    func addEdge(i: Int, j: Int) {
        // Handle index out of bounds and equality
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Out of bounds")
        }
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Remove edge */
    // Parameters i, j correspond to the vertices element indices
    func removeEdge(i: Int, j: Int) {
        // Handle index out of bounds and equality
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Out of bounds")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* Print adjacency matrix */
    func print() {
        Swift.print("Vertex list = ", terminator: "")
        Swift.print(vertices)
        Swift.print("Adjacency matrix =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Driver Code */
    static func main() {
        /* Add edge */
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\nAfter initialization, graph is")
        graph.print()

        /* Add edge */
        // Add vertex
        graph.addEdge(i: 0, j: 2)
        print("\nAfter adding edge 1-2, graph is")
        graph.print()

        /* Remove edge */
        // Vertices 1, 3 have indices 0, 1 respectively
        graph.removeEdge(i: 0, j: 1)
        print("\nAfter removing edge 1-3, graph is")
        graph.print()

        /* Add vertex */
        graph.addVertex(val: 6)
        print("\nAfter adding vertex 6, graph is")
        graph.print()

        /* Remove vertex */
        // Vertex 3 has index 1
        graph.removeVertex(index: 1)
        print("\nAfter removing vertex 3, graph is")
        graph.print()
    }
}
