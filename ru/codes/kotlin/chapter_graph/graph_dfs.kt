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
    res.add(vet)     // Отметить посещенную вершину
    visited.add(vet) // Отметить эту вершину как посещенную
    // Обойти все смежные вершины данной вершины
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // Пропустить уже посещенную вершину
        // Рекурсивно обходить смежные вершины
        dfs(graph, visited, res, adjVet)
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // Последовательность обхода вершин
    val res = mutableListOf<Vertex?>()
    // Хеш-множество для хранения уже посещенных вершин
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Driver Code */
fun main() {
    /* Инициализация неориентированного графа */
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
    println("\nГраф после инициализации")
    graph.print()

    /* Обход в глубину */
    val res = graphDFS(graph, v[0])
    println("\nПоследовательность вершин при обходе в глубину (DFS)")
    println(Vertex.vetsToVals(res))
}