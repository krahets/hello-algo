/**
 * File: graph_dfs.swift
 * Created Time: 2023-02-21
 * Author: nuomi1 (nuomi1@qq.com)
 */

import graph_adjacency_list_target
import utils

/* Вспомогательная функция обхода в глубину */
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    res.append(vet) // Отметить посещенную вершину
    visited.insert(vet) // Отметить эту вершину как посещенную
    // Обойти все смежные вершины данной вершины
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            continue // Пропустить уже посещенную вершину
        }
        // Рекурсивно обходить смежные вершины
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // Последовательность обхода вершин
    var res: [Vertex] = []
    // Хеш-множество для хранения уже посещенных вершин
    var visited: Set<Vertex> = []
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

@main
enum GraphDFS {
    /* Driver Code */
    static func main() {
        /* Инициализация неориентированного графа */
        let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjList(edges: edges)
        print("\nГраф после инициализации")
        graph.print()

        /* Обход в глубину */
        let res = graphDFS(graph: graph, startVet: v[0])
        print("\nПоследовательность вершин при обходе в глубину (DFS)")
        print(Vertex.vetsToVals(vets: res))
    }
}
