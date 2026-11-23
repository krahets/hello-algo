// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* Initialize the undirected graph */
	// Note that the entries in edges are vertex indices, corresponding to element indices in vertices
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("Graph after initialization:")
	graph.print()

	/* Add an edge */
	// Vertices 1 and 2 have indices 0 and 2, respectively
	graph.addEdge(0, 2)
	fmt.Println("Graph after adding edge 1-2:")
	graph.print()

	/* Remove an edge */
	// Vertices 1 and 3 have indices 0 and 1, respectively
	graph.removeEdge(0, 1)
	fmt.Println("Graph after removing edge 1-3:")
	graph.print()

	/* Add a vertex */
	graph.addVertex(6)
	fmt.Println("Graph after adding vertex 6:")
	graph.print()

	/* Remove a vertex */
	// Vertex 3 has index 1
	graph.removeVertex(1)
	fmt.Println("Graph after removing vertex 3:")
	graph.print()
}
