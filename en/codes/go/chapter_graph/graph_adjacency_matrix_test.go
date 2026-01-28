// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* Add edge */
	// Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("After initialization, graph is:")
	graph.print()

	/* Add edge */
	// Add vertex
	graph.addEdge(0, 2)
	fmt.Println("After adding edge 1-2, graph is")
	graph.print()

	/* Remove edge */
	// Vertices 1, 3 have indices 0, 1 respectively
	graph.removeEdge(0, 1)
	fmt.Println("After removing edge 1-3, graph is")
	graph.print()

	/* Add vertex */
	graph.addVertex(6)
	fmt.Println("After adding vertex 6, graph is")
	graph.print()

	/* Remove vertex */
	// Vertex 3 has index 1
	graph.removeVertex(1)
	fmt.Println("After removing vertex 3, graph is")
	graph.print()
}
