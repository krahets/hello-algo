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
	/* 無向グラフを初期化する */
	v := ValsToVets([]int{1, 3, 2, 5, 4})
	edges := [][]Vertex{{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}}
	graph := newGraphAdjList(edges)
	fmt.Println("初期化後のグラフ：")
	graph.print()

	/* 辺を追加する */
	// 頂点 1, 2 は v[0], v[2] に対応する
	graph.addEdge(v[0], v[2])
	fmt.Println("\n辺 1-2 を追加した後のグラフ")
	graph.print()

	/* 辺を削除する */
	// 頂点 1, 3 は v[0], v[1] に対応する
	graph.removeEdge(v[0], v[1])
	fmt.Println("\n辺 1-3 を削除した後のグラフ")
	graph.print()

	/* 頂点を追加する */
	v5 := NewVertex(6)
	graph.addVertex(v5)
	fmt.Println("\n頂点 6 を追加した後のグラフ")
	graph.print()

	/* 頂点を削除する */
	// 頂点 3 は v[1] に対応する
	graph.removeVertex(v[1])
	fmt.Println("\n頂点 3 を削除した後のグラフ")
	graph.print()
}
