// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Helper for depth-first traversal */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append returns a new slice reference, so assign it back to the original variable
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// Iterate over all neighbors of this vertex
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// Visit neighbors recursively
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Vertex traversal order
	res := make([]Vertex, 0)
	// Use a hash set to track visited vertices
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// Return the vertex traversal order
	return res
}
