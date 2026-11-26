// File: graph_adjacency_list.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"strconv"
	"strings"

	. "github.com/krahets/hello-algo/pkg"
)

/* Undirected graph represented by an adjacency list */
type graphAdjList struct {
	// Adjacency list: each vertex maps to its neighbors
	adjList map[Vertex][]Vertex
}

/* Constructor */
func newGraphAdjList(edges [][]Vertex) *graphAdjList {
	g := &graphAdjList{
		adjList: make(map[Vertex][]Vertex),
	}
	// Add all vertices and edges
	for _, edge := range edges {
		g.addVertex(edge[0])
		g.addVertex(edge[1])
		g.addEdge(edge[0], edge[1])
	}
	return g
}

/* Get the vertex count */
func (g *graphAdjList) size() int {
	return len(g.adjList)
}

/* Add an edge */
func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// Add the edge vet1 - vet2 using an anonymous struct{}
	g.adjList[vet1] = append(g.adjList[vet1], vet2)
	g.adjList[vet2] = append(g.adjList[vet2], vet1)
}

/* Remove an edge */
func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// Remove the edge vet1 - vet2
	g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
	g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
}

/* Add a vertex */
func (g *graphAdjList) addVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if ok {
		return
	}
	// Add a new linked list to the adjacency list
	g.adjList[vet] = make([]Vertex, 0)
}

/* Remove a vertex */
func (g *graphAdjList) removeVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if !ok {
		panic("error")
	}
	// Remove the linked list for vertex vet from the adjacency list
	delete(g.adjList, vet)
	// Traverse the other vertices' lists and remove every edge incident to vet
	for v, list := range g.adjList {
		g.adjList[v] = DeleteSliceElms(list, vet)
	}
}

/* Print the adjacency list */
func (g *graphAdjList) print() {
	var builder strings.Builder
	fmt.Printf("Adjacency list = \n")
	for k, v := range g.adjList {
		builder.WriteString("\t\t" + strconv.Itoa(k.Val) + ": ")
		for _, vet := range v {
			builder.WriteString(strconv.Itoa(vet.Val) + " ")
		}
		fmt.Println(builder.String())
		builder.Reset()
	}
}
