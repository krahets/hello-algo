// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 广度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 顶点遍历序列
	res := make([]Vertex, 0)
	// 哈希集合，用于记录已被访问过的顶点
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// 队列用于实现 BFS, 使用切片模拟队列
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 以顶点 vet 为起点，循环直至访问完所有顶点
	for len(queue) > 0 {
		// 队首顶点出队
		vet := queue[0]
		queue = queue[1:]
		// 记录访问顶点
		res = append(res, vet)
		// 遍历该顶点的所有邻接顶点
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 只入队未访问的顶点
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 返回顶点遍历序列
	return res
}
