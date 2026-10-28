// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* 무방향 그래프 초기화 */
	// edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("초기화한 후의 그래프:")
	graph.print()

	/* 간선 추가 */
	// 정점 1, 2의 인덱스는 각각 0, 2이다
	graph.addEdge(0, 2)
	fmt.Println("간선 1-2를 추가한 후의 그래프")
	graph.print()

	/* 간선 삭제 */
	// 정점 1, 3의 인덱스는 각각 0, 1이다
	graph.removeEdge(0, 1)
	fmt.Println("간선 1-3을 삭제한 후의 그래프")
	graph.print()

	/* 정점 추가 */
	graph.addVertex(6)
	fmt.Println("정점 6을 추가한 후의 그래프")
	graph.print()

	/* 정점 삭제 */
	// 정점 3의 인덱스는 1이다
	graph.removeVertex(1)
	fmt.Println("정점 3을 삭제한 후의 그래프")
	graph.print()
}
