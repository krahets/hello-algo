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
	/* 初始化无向图 */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("初始化后，图为:")
	graph.print()

	/* 添加边 */
	// 顶点 1, 2 即 v[0], v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\n添加边 1-2 后，图为")
	graph.print()

	/* 删除边 */
	// 顶点 1, 3 即 v[0], v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\n删除边 1-3 后，图为")
	graph.print()

	/* 添加顶点 */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\n添加顶点 6 后，图为")
	graph.print()

	/* 删除顶点 */
	// 顶点 3 即 v[1]
	graph.removeVertex(v[1])
	fmt.Println("\n删除顶点 3 后，图为")
	graph.print()
}
