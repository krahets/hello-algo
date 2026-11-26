// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 深度優先走訪的輔助函式 */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append 會回傳新的切片參照，必須將它重新指派給原變數
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// 走訪此頂點的所有相鄰頂點
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// 遞迴走訪相鄰頂點
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂點走訪順序
	res := make([]Vertex, 0)
	// 用雜湊集合記錄已走訪的頂點
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// 回傳頂點的走訪順序
	return res
}
