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
	/* Initialize undirected graph */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("After initialization, the graph is:")
	graph.print()

	/* Add edge */
	// Vertices 1, 2 i.e., v[0], v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\nAfter adding edge 1-2, the graph is")
	graph.print()

	/* Remove edge */
	// Vertices 1, 3 i.e., v[0], v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\nAfter removing edge 1-3, the graph is")
	graph.print()

	/* Add vertex */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\nAfter adding vertex 6, the graph is")
	graph.print()

	/* Remove vertex */
	// Vertex 3 i.e., v[1]
	graph.removeVertex(v[1])
	fmt.Println("\nAfter removing vertex 3, the graph is")
	graph.print()
}
