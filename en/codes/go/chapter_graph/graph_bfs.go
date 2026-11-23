// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Breadth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Vertex traversal sequence
	res := make([]Vertex, 0)
	// Hash set recording visited vertices
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// Use a queue for BFS, represented here by a slice
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// Starting from startVet, loop until all reachable vertices have been visited
	for len(queue) > 0 {
		// Dequeue the front vertex
		vet := queue[0]
		queue = queue[1:]
		// Record the visited vertex
		res = append(res, vet)
		// Traverse all neighbors of this vertex
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// Enqueue only unvisited vertices
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// Return the vertex traversal sequence
	return res
}
