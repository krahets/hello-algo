// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Depth-first traversal helper function */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append returns an updated slice, which must be assigned back through the original slice pointer
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// Traverse all neighbors of this vertex
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// Recursively visit the neighboring vertex
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Vertex traversal sequence
	res := make([]Vertex, 0)
	// Hash set recording visited vertices
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// Return the vertex traversal sequence
	return res
}
