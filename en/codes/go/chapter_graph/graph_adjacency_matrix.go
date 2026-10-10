// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* Undirected graph class based on adjacency matrix */
type graphAdjMat struct {
	// Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
	vertices []int
	// Adjacency matrix, where the row and column indices correspond to the "vertex index"
	adjMat [][]int
}

/* Constructor */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// Add vertex
	n := len(vertices)
	adjMat := make([][]int, n)
	for i := range adjMat {
		adjMat[i] = make([]int, n)
	}
	// Initialize graph
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// Add edge
	// Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* Get the number of vertices */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* Add vertex */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// Add the value of the new vertex to the vertex list
	g.vertices = append(g.vertices, val)
	// Add a row to the adjacency matrix
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// Add a column to the adjacency matrix
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* Remove vertex */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// Remove the vertex at index from the vertex list
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// Remove the row at index from the adjacency matrix
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// Remove the column at index from the adjacency matrix
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* Add edge */
// Parameters i, j correspond to the vertices element indices
func (g *graphAdjMat) addEdge(i, j int) {
	// Handle index out of bounds and equality
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* Remove edge */
// Parameters i, j correspond to the vertices element indices
func (g *graphAdjMat) removeEdge(i, j int) {
	// Handle index out of bounds and equality
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* Print adjacency matrix */
func (g *graphAdjMat) print() {
	fmt.Printf("\tVertex list = %v\n", g.vertices)
	fmt.Printf("\tAdjacency matrix = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
