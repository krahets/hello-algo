// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* 初始化無向圖 */
	// 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("初始化後，圖為:")
	graph.print()

	/* 新增邊 */
	// 頂點 1, 2 的索引分別為 0, 2
	graph.addEdge(0, 2)
	fmt.Println("新增邊 1-2 後，圖為")
	graph.print()

	/* 刪除邊 */
	// 頂點 1, 3 的索引分別為 0, 1
	graph.removeEdge(0, 1)
	fmt.Println("刪除邊 1-3 後，圖為")
	graph.print()

	/* 新增頂點 */
	graph.addVertex(6)
	fmt.Println("新增頂點 6 後，圖為")
	graph.print()

	/* 刪除頂點 */
	// 頂點 3 的索引為 1
	graph.removeVertex(1)
	fmt.Println("刪除頂點 3 後，圖為")
	graph.print()
}
