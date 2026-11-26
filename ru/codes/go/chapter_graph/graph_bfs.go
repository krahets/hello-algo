// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Обход в ширину */
// Список смежности позволяет получить всех соседей заданной вершины
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Порядок обхода вершин
	res := make([]Vertex, 0)
	// Хеш-множество посещённых вершин
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// Для BFS нужна очередь. Реализуем её на срезе
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// Начать с вершины vet и повторять, пока не будут посещены все вершины
	for len(queue) > 0 {
		// Извлечь первую вершину из очереди
		vet := queue[0]
		queue = queue[1:]
		// Записать посещённую вершину
		res = append(res, vet)
		// Перебрать всех соседей этой вершины
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// Добавить в очередь только непосещённые вершины
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// Вернуть порядок обхода вершин
	return res
}
