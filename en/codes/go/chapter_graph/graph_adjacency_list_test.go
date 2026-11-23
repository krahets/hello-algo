// File: graph_adjacency_list_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestGraphAdjList(t *testing.T) {
	/* Initialize the undirected graph */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("Graph after initialization:")
	graph.print()

	/* Add an edge */
	// Vertices 1 and 2 are v[0] and v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\nGraph after adding edge 1-2:")
	graph.print()

	/* Remove an edge */
	// Vertices 1 and 3 are v[0] and v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\nGraph after removing edge 1-3:")
	graph.print()

	/* Add a vertex */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\nGraph after adding vertex 6:")
	graph.print()

	/* Remove a vertex */
	// Vertex 3 is v[1]
	graph.removeVertex(v[1])
	fmt.Println("\nGraph after removing vertex 3:")
	graph.print()
}
