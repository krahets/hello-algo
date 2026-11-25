/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* Вспомогательная функция обхода в глубину */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // Записать посещённую вершину
    visited.add(vet) // Отметить вершину как посещённую
    // Перебрать всех соседей этой вершины
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // Пропустить посещённые вершины
        // Рекурсивно посетить соседнюю вершину
        dfs(graph, visited, res, adjVet)
    }
}

/* Обход в глубину */
// Список смежности позволяет получить всех соседей заданной вершины
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // Порядок обхода вершин
    val res = mutableListOf<Vertex?>()
    // Хеш-множество посещённых вершин
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Пример использования */
fun main() {
    /* Инициализировать неориентированный граф */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[2], v[5]),
        arrayOf(v[4], v[5]),
        arrayOf(v[5], v[6])
    )
    val graph = GraphAdjList(edges)
    println("\nГраф после инициализации:")
    graph.print()

    /* Обход в глубину */
    val res = graphDFS(graph, v[0])
    println("\nПорядок обхода вершин в глубину (DFS):")
    println(Vertex.vetsToVals(res))
}