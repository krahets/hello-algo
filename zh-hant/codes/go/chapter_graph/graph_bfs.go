// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 廣度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂點走訪順序
	res := make([]Vertex, 0)
	// 用雜湊集合記錄已走訪的頂點
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// 以切片模擬佇列，用來實作 BFS
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
	for len(queue) > 0 {
		// 取出佇列前端的頂點
		vet := queue[0]
		queue = queue[1:]
		// 記錄走訪的頂點
		res = append(res, vet)
		// 走訪此頂點的所有相鄰頂點
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 只將尚未走訪的頂點加入佇列
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 回傳頂點的走訪順序
	return res
}
