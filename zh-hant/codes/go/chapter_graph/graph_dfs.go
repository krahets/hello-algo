// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 深度優先走訪輔助函式 */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append 操作會返回新的的引用，必須讓原引用重新賦值為新slice的引用
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// 走訪該頂點的所有鄰接頂點
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// 遞迴訪問鄰接頂點
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂點走訪序列
	res := make([]Vertex, 0)
	// 雜湊集合，用於記錄已被訪問過的頂點
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// 返回頂點走訪序列
	return res
}
