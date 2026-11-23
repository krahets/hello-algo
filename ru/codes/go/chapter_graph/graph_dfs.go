// File: graph_dfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Вспомогательная функция обхода в глубину */
func dfs(g *graphAdjList, visited map[Vertex]struct{}, res *[]Vertex, vet Vertex) {
	// Операция append возвращает новую ссылку, поэтому исходную ссылку нужно заново присвоить новому срезу
	*res = append(*res, vet)
	visited[vet] = struct{}{}
	// Обойти все смежные вершины данной вершины
	for _, adjVet := range g.adjList[vet] {
		_, isExist := visited[adjVet]
		// Рекурсивно обходить смежные вершины
		if !isExist {
			dfs(g, visited, res, adjVet)
		}
	}
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
func graphDFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Последовательность обхода вершин
	res := make([]Vertex, 0)
	// Хеш-множество для хранения уже посещенных вершин
	visited := make(map[Vertex]struct{})
	dfs(g, visited, &res, startVet)
	// Вернуть последовательность обхода вершин
	return res
}
