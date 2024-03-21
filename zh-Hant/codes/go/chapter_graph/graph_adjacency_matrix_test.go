// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* 初始化无向图 */
	// 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("初始化后，图为:")
	graph.print()

	/* 添加边 */
	// 顶点 1, 2 的索引分别为 0, 2
	graph.addEdge(0, 2)
	fmt.Println("添加边 1-2 后，图为")
	graph.print()

	/* 删除边 */
	// 顶点 1, 3 的索引分别为 0, 1
	graph.removeEdge(0, 1)
	fmt.Println("删除边 1-3 后，图为")
	graph.print()

	/* 添加顶点 */
	graph.addVertex(6)
	fmt.Println("添加顶点 6 后，图为")
	graph.print()

	/* 删除顶点 */
	// 顶点 3 的索引为 1
	graph.removeVertex(1)
	fmt.Println("删除顶点 3 后，图为")
	graph.print()
}
