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
	/* Инициализировать неориентированный граф */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("После инициализации граф имеет вид:")
	graph.print()

	/* Добавить ребро */
	// Вершины 1 и 2, то есть v[0] и v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\nПосле добавления ребра 1-2 граф имеет вид")
	graph.print()

	/* Удалить ребро */
	// Вершины 1 и 3, то есть v[0] и v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\nПосле удаления ребра 1-3 граф имеет вид")
	graph.print()

	/* Добавить вершину */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\nПосле добавления вершины 6 граф имеет вид")
	graph.print()

	/* Удалить вершину */
	// Вершина 3, то есть v[1]
	graph.removeVertex(v[1])
	fmt.Println("\nПосле удаления вершины 3 граф имеет вид")
	graph.print()
}
