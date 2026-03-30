// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* Инициализация неориентированного графа */
	// Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("Граф после инициализации:")
	graph.print()

	/* Добавление ребра */
	// Индексы вершин 1 и 2 равны 0 и 2 соответственно
	graph.addEdge(0, 2)
	fmt.Println("Граф после добавления ребра 1-2")
	graph.print()

	/* Удаление ребра */
	// Индексы вершин 1 и 3 равны 0 и 1 соответственно
	graph.removeEdge(0, 1)
	fmt.Println("Граф после удаления ребра 1-3")
	graph.print()

	/* Добавление вершины */
	graph.addVertex(6)
	fmt.Println("Граф после добавления вершины 6")
	graph.print()

	/* Удаление вершины */
	// Индекс вершины 3 равен 1
	graph.removeVertex(1)
	fmt.Println("Граф после удаления вершины 3")
	graph.print()
}
