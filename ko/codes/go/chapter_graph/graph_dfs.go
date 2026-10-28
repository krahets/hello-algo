// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 깊이 우선 순회 보조 함수 */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append 연산은 새 참조를 반환하므로 원래 참조에 새 슬라이스의 참조를 다시 대입해야 한다
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// 해당 정점의 모든 인접 정점을 순회한다
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// 인접 정점을 재귀적으로 방문한다
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// 정점 순회 순서
	res := make([]Vertex, 0)
	// 방문한 정점을 기록하는 해시 집합
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// 정점 순회 순서를 반환한다
	return res
}
