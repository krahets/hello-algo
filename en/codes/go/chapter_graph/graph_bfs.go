// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Breadth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Vertex traversal sequence
	res := make([]Vertex, 0)
	// Hash set, used to record visited vertices
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// Queue used to implement BFS, simulating a queue with a slice
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// Starting from vertex vet, loop until all vertices are visited
	for len(queue) > 0 {
		// Dequeue the vertex at the head of the queue
		vet := queue[0]
		queue = queue[1:]
		// Record visited vertex
		res = append(res, vet)
		// Traverse all adjacent vertices of that vertex
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// Only enqueue unvisited vertices
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// Return the vertex traversal sequence
	return res
}
