/**
 * File: graph_bfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Обход в ширину */
// Использовать список смежности для представления графа, чтобы получать все соседние вершины заданной вершины
func graphBFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Последовательность обхода вершин
    var res: [Vertex] = []
    // Хеш-множество для записи уже посещенных вершин
    var visited: Set<Vertex> = [startVet]
    // Очередь используется для реализации BFS
    var que: [Vertex] = [startVet]
    // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
    while !que.isEmpty {
        let vet = que.removeFirst() // Извлечь из очереди вершину из головы
        res.append(vet) // Записать посещенную вершину
        // Обойти все смежные вершины этой вершины
        for adjVet in graph.adjList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue // Пропустить уже посещенную вершину
            }
            que.append(adjVet) // Помещать в очередь только непосещенные вершины
            visited.insert(adjVet) // Пометить эту вершину как посещенную
        }
    }
    // Вернуть последовательность обхода вершин
    return res
}

@main
enum GraphBFS {
    /* Driver Code */
    static func main() {
        /* Инициализировать неориентированный граф */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nПосле инициализации граф имеет вид")
        graph.print()

        /* Обход в ширину */
        let res = graphBFS(graph: graph, startVet: v[0])
        print("\nПоследовательность вершин при обходе в ширину (BFS)")
        print(Vertex.vetsToVals(vets: res))
    }
}
