// File: graph_bfs_test.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestGraphBFS(t *testing.T) {
	/* Инициализация неориентированного графа */
	vets := ValsToVets([]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9})
	edges := [][]Vertex{
		{vets[0], vets[1]}, {vets[0], vets[3]}, {vets[1], vets[2]}, {vets[1], vets[4]},
		{vets[2], vets[5]}, {vets[3], vets[4]}, {vets[3], vets[6]}, {vets[4], vets[5]},
		{vets[4], vets[7]}, {vets[5], vets[8]}, {vets[6], vets[7]}, {vets[7], vets[8]}}
	graph := newGraphAdjList(edges)
	fmt.Println("Граф после инициализации:")
	graph.print()

	/* Обход в ширину */
	res := graphBFS(graph, vets[0])
	fmt.Println("Последовательность вершин при обходе в ширину (BFS):")
	PrintSlice(VetsToVals(res))
}
