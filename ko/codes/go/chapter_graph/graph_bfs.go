// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 너비 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 정점 순회 순서
	res := make([]Vertex, 0)
	// 방문한 정점을 기록하는 해시 집합
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// 큐로 BFS를 구현하며, 슬라이스로 큐를 구현한다
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
	for len(queue) > 0 {
		// 큐 맨 앞의 정점을 꺼낸다
		vet := queue[0]
		queue = queue[1:]
		// 방문한 정점을 기록한다
		res = append(res, vet)
		// 해당 정점의 모든 인접 정점을 순회한다
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 방문하지 않은 정점만 큐에 삽입한다
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 정점 순회 순서를 반환한다
	return res
}
