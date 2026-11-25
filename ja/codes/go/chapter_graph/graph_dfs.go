// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 深さ優先探索の補助関数 */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append は新しい参照を返すため、元の変数に新しいスライスの参照を代入し直す
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// この頂点の隣接頂点をすべて調べる
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// 隣接頂点を再帰的に訪問する
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* 深さ優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂点の訪問順
	res := make([]Vertex, 0)
	// 訪問済みの頂点を記録するハッシュ集合
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// 頂点を訪問順に返す
	return res
}
