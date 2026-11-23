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
	/* 무방향 그래프 초기화 */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("초기화한 후의 그래프:")
	graph.print()

	/* 간선 추가 */
	// 정점 1, 2는 각각 v[0], v[2]이다
	graph.addEdge(v[0], v[2])
	fmt.Println("\n간선 1-2를 추가한 후의 그래프")
	graph.print()

	/* 간선 삭제 */
	// 정점 1, 3은 각각 v[0], v[1]이다
	graph.removeEdge(v[0], v[1])
	fmt.Println("\n간선 1-3을 삭제한 후의 그래프")
	graph.print()

	/* 정점 추가 */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\n정점 6을 추가한 후의 그래프")
	graph.print()

	/* 정점 삭제 */
	// 정점 3은 v[1]이다
	graph.removeVertex(v[1])
	fmt.Println("\n정점 3을 삭제한 후의 그래프")
	graph.print()
}
