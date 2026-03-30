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
	/* 無向グラフを初期化 */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("初期化後、グラフは:")
	graph.print()

	/* 辺を追加 */
	// 頂点 1, 2 は v[0], v[2]
	graph.addEdge(v[0], v[2])
	fmt.Println("\n辺 1-2 を追加後、グラフは")
	graph.print()

	/* 辺を削除 */
	// 頂点 1, 3 は v[0], v[1]
	graph.removeEdge(v[0], v[1])
	fmt.Println("\n辺 1-3 を削除後、グラフは")
	graph.print()

	/* 頂点を追加 */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\n頂点 6 を追加後、グラフは")
	graph.print()

	/* 頂点を削除 */
	// 頂点 3 は v[1]
	graph.removeVertex(v[1])
	fmt.Println("\n頂点 3 を削除後、グラフは")
	graph.print()
}
