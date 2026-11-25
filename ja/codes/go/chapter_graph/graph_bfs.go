// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 幅優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂点の訪問順
	res := make([]Vertex, 0)
	// 訪問済みの頂点を記録するハッシュ集合
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// BFS に使うキューをスライスで表す
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
	for len(queue) > 0 {
		// キューの先頭から頂点を取り出す
		vet := queue[0]
		queue = queue[1:]
		// 訪問した頂点を記録する
		res = append(res, vet)
		// この頂点の隣接頂点をすべて調べる
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 未訪問の頂点だけをキューに追加する
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 頂点を訪問順に返す
	return res
}
