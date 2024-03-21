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
	/* 初始化無向圖 */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("初始化後，圖為:")
	graph.print()

	/* 新增邊 */
	// 頂點 1, 2 即 v[0], v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\n新增邊 1-2 後，圖為")
	graph.print()

	/* 刪除邊 */
	// 頂點 1, 3 即 v[0], v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\n刪除邊 1-3 後，圖為")
	graph.print()

	/* 新增頂點 */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\n新增頂點 6 後，圖為")
	graph.print()

	/* 刪除頂點 */
	// 頂點 3 即 v[1]
	graph.removeVertex(v[1])
	fmt.Println("\n刪除頂點 3 後，圖為")
	graph.print()
}
