// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* Initialize undirected graph */
	// Please note, edges elements represent vertex indices, corresponding to vertices elements indices
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("After initialization, the graph is:")
	graph.print()

	/* Add edge */
	// Indices of vertices 1, 2 are 0, 2 respectively
	graph.addEdge(0, 2)
	fmt.Println("After adding edge 1-2, the graph is")
	graph.print()

	/* Remove edge */
	// Indices of vertices 1, 3 are 0, 1 respectively
	graph.removeEdge(0, 1)
	fmt.Println("After removing edge 1-3, the graph is")
	graph.print()

	/* Add vertex */
	graph.addVertex(6)
	fmt.Println("After adding vertex 6, the graph is")
	graph.print()

	/* Remove vertex */
	// Index of vertex 3 is 1
	graph.removeVertex(1)
	fmt.Println("After removing vertex 3, the graph is")
	graph.print()
}
