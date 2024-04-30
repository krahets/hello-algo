// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 廣度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 頂點走訪序列
	res := make([]Vertex, 0)
	// 雜湊集合，用於記錄已被訪問過的頂點
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// 佇列用於實現 BFS, 使用切片模擬佇列
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 以頂點 vet 為起點，迴圈直至訪問完所有頂點
	for len(queue) > 0 {
		// 佇列首頂點出隊
		vet := queue[0]
		queue = queue[1:]
		// 記錄訪問頂點
		res = append(res, vet)
		// 走訪該頂點的所有鄰接頂點
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 只入列未訪問的頂點
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 返回頂點走訪序列
	return res
}
