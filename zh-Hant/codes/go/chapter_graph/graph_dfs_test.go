// File: graph_dfs_test.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestGraphDFS(t *testing.T) {
	/* 初始化无向图 */
	vets := ValsToVets([]int{0, 1, 2, 3, 4, 5, 6})
	edges := [][]Vertex{
		{vets[0], vets[1]}, {vets[0], vets[3]}, {vets[1], vets[2]},
		{vets[2], vets[5]}, {vets[4], vets[5]}, {vets[5], vets[6]}}
	graph := newGraphAdjList(edges)
	fmt.Println("初始化后，图为:")
	graph.print()

	/* 深度优先遍历 */
	res := graphDFS(graph, vets[0])
	fmt.Println("深度优先遍历（DFS）顶点序列为:")
	PrintSlice(VetsToVals(res))
}
