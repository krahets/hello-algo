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
	v0 := NewVertex(1)
	v1 := NewVertex(3)
	v2 := NewVertex(2)
	v3 := NewVertex(5)
	v4 := NewVertex(4)
	edges := [][]Vertex{{v0, v1}, {v1, v2}, {v2, v3}, {v0, v3}, {v2, v4}, {v3, v4}}
	graph := newGraphAdjList(edges)
	fmt.Println("初始化后，图为:")
	graph.print()

	/* 添加边 */
	// 顶点 1, 2 即 v0, v2
	graph.addEdge(v0, v2)
	fmt.Println("\n添加边 1-2 后，图为")
	graph.print()

	/* 删除边 */
	// 顶点 1, 3 即 v0, v1
	graph.removeEdge(v0, v1)
	fmt.Println("\n删除边 1-3 后，图为")
	graph.print()

	/* 添加顶点 */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\n添加顶点 6 后，图为")
	graph.print()

	/* 删除顶点 */
	// 顶点 3 即 v1
	graph.removeVertex(v1)
	fmt.Println("\n删除顶点 3 后，图为")
	graph.print()
}
