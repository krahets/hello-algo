// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* Инициализировать неориентированный граф */
	// Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("После инициализации граф имеет вид:")
	graph.print()

	/* Добавить ребро */
	// Индексы вершин 1 и 2 равны 0 и 2 соответственно
	graph.addEdge(0, 2)
	fmt.Println("Добавить ребро 1-2 после, графравно")
	graph.print()

	/* Удалить ребро */
	// Индексы вершин 1 и 3 равны 0 и 1 соответственно
	graph.removeEdge(0, 1)
	fmt.Println("Удалить ребро 1-3 после, графравно")
	graph.print()

	/* Добавить вершину */
	graph.addVertex(6)
	fmt.Println("Добавить вершину 6 после, графравно")
	graph.print()

	/* Удалить вершину */
	// Индекс вершины 3 равен 1
	graph.removeVertex(1)
	fmt.Println("Удалить вершину 3 после, графравно")
	graph.print()
}
