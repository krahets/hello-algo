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

/* Неориентированный граф на списках смежности */
type graphAdjList struct {
	// Список смежности: ключ — вершина, значение — все её соседи
	adjList map[Vertex][]Vertex
}

/* Конструктор */
func newGraphAdjList(edges [][]Vertex) *graphAdjList {
	g := &graphAdjList{
		adjList: make(map[Vertex][]Vertex),
	}
	// Добавить все вершины и рёбра
	for _, edge := range edges {
		g.addVertex(edge[0])
		g.addVertex(edge[1])
		g.addEdge(edge[0], edge[1])
	}
	return g
}

/* Получить число вершин */
func (g *graphAdjList) size() int {
	return len(g.adjList)
}

/* Добавить ребро */
func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// Добавить ребро vet1 — vet2, используя анонимную структуру struct{}
	g.adjList[vet1] = append(g.adjList[vet1], vet2)
	g.adjList[vet2] = append(g.adjList[vet2], vet1)
}

/* Удалить ребро */
func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// Удалить ребро vet1 — vet2
	g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
	g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
}

/* Добавить вершину */
func (g *graphAdjList) addVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if ok {
		return
	}
	// Добавить новый связный список в список смежности
	g.adjList[vet] = make([]Vertex, 0)
}

/* Удалить вершину */
func (g *graphAdjList) removeVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if !ok {
		panic("error")
	}
	// Удалить из списка смежности список вершины vet
	delete(g.adjList, vet)
	// Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
	for v, list := range g.adjList {
		g.adjList[v] = DeleteSliceElms(list, vet)
	}
}

/* Вывести список смежности */
func (g *graphAdjList) print() {
	var builder strings.Builder
	fmt.Printf("Список смежности = \n")
	for k, v := range g.adjList {
		builder.WriteString("\t\t" + strconv.Itoa(k.Val) + ": ")
		for _, vet := range v {
			builder.WriteString(strconv.Itoa(vet.Val) + " ")
		}
		fmt.Println(builder.String())
		builder.Reset()
	}
}
