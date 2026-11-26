// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* Undirected graph represented by an adjacency matrix */
type graphAdjMat struct {
	// Vertex list: each element holds a vertex value, and its position is the vertex index
	vertices []int
	// Adjacency matrix: row and column indices are vertex indices
	adjMat [][]int
}

/* Constructor */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// Add a vertex
	n := len(vertices)
	adjMat := make([][]int, n)
	for i := range adjMat {
		adjMat[i] = make([]int, n)
	}
	// Initialize the graph
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// Add an edge
	// The entries in edges are vertex indices, that is, indices into vertices
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* Get the vertex count */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* Add a vertex */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// Append the new vertex value to the vertex list
	g.vertices = append(g.vertices, val)
	// Add a row to the adjacency matrix
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// Add a column to the adjacency matrix
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* Remove a vertex */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// Remove the vertex at the specified index from the vertex list
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// Remove the row at the specified index from the adjacency matrix
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// Remove the column at the specified index from the adjacency matrix
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* Add an edge */
// Parameters i and j are indices into vertices
func (g *graphAdjMat) addEdge(i, j int) {
	// Check for out-of-bounds or equal indices
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// An undirected graph has a symmetric adjacency matrix: (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* Remove an edge */
// Parameters i and j are indices into vertices
func (g *graphAdjMat) removeEdge(i, j int) {
	// Check for out-of-bounds or equal indices
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* Print the adjacency matrix */
func (g *graphAdjMat) print() {
	fmt.Printf("\tVertex list = %v\n", g.vertices)
	fmt.Printf("\tAdjacency matrix = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
