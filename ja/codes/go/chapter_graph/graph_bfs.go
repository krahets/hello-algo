// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 幅優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂点の走査順序
	res := make([]Vertex, 0)
	// 訪問済み頂点を記録するためのハッシュ集合
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// キューは BFS の実装に用い、スライスでキューをシミュレートする
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
	for len(queue) > 0 {
		// 先頭の頂点をデキュー
		vet := queue[0]
		queue = queue[1:]
		// 訪問した頂点を記録
		res = append(res, vet)
		// この頂点のすべての隣接頂点を走査
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 未訪問の頂点のみをキューに追加
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 頂点の走査順を返す
	return res
}
