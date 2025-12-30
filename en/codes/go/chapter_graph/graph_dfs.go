// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Depth-first traversal helper function */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append operation returns a new reference, must reassign original reference to new slice's reference
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// Traverse all adjacent vertices of this vertex
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// Recursively visit adjacent vertices
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Vertex traversal sequence
	res := make([]Vertex, 0)
	// Hash set for recording vertices that have been visited
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// Return vertex traversal sequence
	return res
}
