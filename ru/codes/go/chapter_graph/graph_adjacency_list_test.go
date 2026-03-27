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
	/* Инициализация неориентированного графа */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("Граф после инициализации:")
	graph.print()

	/* Добавление ребра */
	// Вершины 1 и 2 соответствуют v[0] и v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\nГраф после добавления ребра 1-2")
	graph.print()

	/* Удаление ребра */
	// Вершины 1 и 3 соответствуют v[0] и v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\nГраф после удаления ребра 1-3")
	graph.print()

	/* Добавление вершины */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\nГраф после добавления вершины 6")
	graph.print()

	/* Удаление вершины */
	// Вершина 3 соответствует v[1]
	graph.removeVertex(v[1])
	fmt.Println("\nГраф после удаления вершины 3")
	graph.print()
}
