// File: graph_bfs.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Обход в ширину */
// Использовать список смежности для представления графа, чтобы получать все соседние вершины заданной вершины
func graphBFS(g *graphAdjList, startVet Vertex) []Vertex {
	// Последовательность обхода вершин
	res := make([]Vertex, 0)
	// Хеш-множество для записи уже посещенных вершин
	visited := make(map[Vertex]struct{})
	visited[startVet] = struct{}{}
	// Очередь используется для реализации BFS; очередь имитируется срезом
	queue := make([]Vertex, 0)
	queue = append(queue, startVet)
	// Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
	for len(queue) > 0 {
		// Извлечь из очереди вершину из головы
		vet := queue[0]
		queue = queue[1:]
		// Записать посещенную вершину
		res = append(res, vet)
		// Обойти все смежные вершины этой вершины
		for _, adjVet := range g.adjList[vet] {
			_, isExist := visited[adjVet]
			// Помещать в очередь только непосещенные вершины
			if !isExist {
				queue = append(queue, adjVet)
				visited[adjVet] = struct{}{}
			}
		}
	}
	// Вернуть последовательность обхода вершин
	return res
}
