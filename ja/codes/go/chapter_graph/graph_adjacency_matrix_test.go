// File: graph_adjacency_matrix_test.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"
)

func TestGraphAdjMat(t *testing.T) {
	/* 無向グラフを初期化する */
	// edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
	vertices := []int{1, 3, 2, 5, 4}
	edges := [][]int{{0, 1}, {1, 2}, {2, 3}, {0, 3}, {2, 4}, {3, 4}}
	graph := newGraphAdjMat(vertices, edges)
	fmt.Println("初期化後のグラフ：")
	graph.print()

	/* 辺を追加する */
	// 頂点 1, 2 のインデックスはそれぞれ 0, 2
	graph.addEdge(0, 2)
	fmt.Println("辺 1-2 を追加した後のグラフ")
	graph.print()

	/* 辺を削除する */
	// 頂点 1, 3 のインデックスはそれぞれ 0, 1
	graph.removeEdge(0, 1)
	fmt.Println("辺 1-3 を削除した後のグラフ")
	graph.print()

	/* 頂点を追加する */
	graph.addVertex(6)
	fmt.Println("頂点 6 を追加した後のグラフ")
	graph.print()

	/* 頂点を削除する */
	// 頂点 3 のインデックスは 1
	graph.removeVertex(1)
	fmt.Println("頂点 3 を削除した後のグラフ")
	graph.print()
}
