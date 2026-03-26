/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* обход в глубинувспомогательная функция */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // Записать посещенную вершину
    visited.add(vet) // Пометить эту вершину как посещенную
    // Обойти все смежные вершины этой вершины
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // Пропустить уже посещенную вершину
        // Рекурсивно посетить смежные вершины
        dfs(graph, visited, res, adjVet)
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получать все соседние вершины заданной вершины
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // Последовательность обхода вершин
    val res = mutableListOf<Vertex?>()
    // Хеш-множество для записи уже посещенных вершин
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Driver Code */
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
    println("\nПосле инициализации граф имеет вид")
    graph.print()

    /* Обход в глубину */
    val res = graphDFS(graph, v[0])
    println("\nПоследовательность вершин при обходе в глубину (DFS)")
    println(Vertex.vetsToVals(res))
}
