// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 幅優先走査 */
// 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂点の走査順序
	res := make([]Vertex, 0)
	// 訪問済みの頂点を記録するハッシュ集合
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// BFS の実装にキューを使い、スライスでキューを再現する
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
	for len(queue) > 0 {
		// キューの先頭の頂点をデキューする
		vet := queue[0]
		queue = queue[1:]
		// 訪問した頂点を記録する
		res = append(res, vet)
		// この頂点に隣接する全頂点を走査する
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 未訪問の頂点だけをエンキューする
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 頂点の走査順序を返す
	return res
}
