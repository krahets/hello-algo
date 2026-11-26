// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Вспомогательная функция обхода в глубину */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// append возвращает новую ссылку на срез, поэтому нужно обновить исходную ссылку
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// Перебрать всех соседей этой вершины
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// Рекурсивно посетить соседнюю вершину
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* Обход в глубину */
// Список смежности позволяет получить всех соседей заданной вершины
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Порядок обхода вершин
	res := make([]Vertex, 0)
	// Хеш-множество посещённых вершин
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// Вернуть порядок обхода вершин
	return res
}
