// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 深さ優先走査の補助関数 */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append 操作は新しい参照を返すため、元の参照を新しい slice の参照で再代入する必要がある
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// この頂点のすべての隣接頂点を走査
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// 隣接頂点を再帰的に訪問
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* 深さ優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂点の走査順序
	res := make([]Vertex, 0)
	// 訪問済み頂点を記録するためのハッシュ集合
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// 頂点の走査順を返す
	return res
}
