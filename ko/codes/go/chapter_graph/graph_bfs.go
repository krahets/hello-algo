// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 너비 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 정점 방문 순서
	res := make([]Vertex, 0)
	// 방문한 정점을 기록하는 해시 집합
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// BFS에 필요한 큐를 슬라이스로 구현
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
	for len(queue) > 0 {
		// 큐의 맨 앞 정점을 꺼냄
		vet := queue[0]
		queue = queue[1:]
		// 방문한 정점 기록
		res = append(res, vet)
		// 현재 정점에 인접한 모든 정점 순회
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// 아직 방문하지 않은 정점만 큐에 삽입
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// 정점 방문 순서 반환
	return res
}
