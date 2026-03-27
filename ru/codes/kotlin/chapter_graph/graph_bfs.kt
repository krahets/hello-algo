/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* Обход в ширину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // Последовательность обхода вершин
    val res = mutableListOf<Vertex?>()
    // Хеш-множество для хранения уже посещенных вершин
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // Очередь используется для реализации BFS
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
    while (!que.isEmpty()) {
        val vet = que.poll() // Извлечь головную вершину из очереди
        res.add(vet)         // Отметить посещенную вершину
        // Обойти все смежные вершины данной вершины
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // Пропустить уже посещенную вершину
            que.offer(adjVet)   // Помещать в очередь только непосещенные вершины
            visited.add(adjVet) // Отметить эту вершину как посещенную
        }
    }
    // Вернуть последовательность обхода вершин
    return res
}

/* Driver Code */
fun main() {
    /* Инициализация неориентированного графа */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[1], v[4]),
        arrayOf(v[2], v[5]),
        arrayOf(v[3], v[4]),
        arrayOf(v[3], v[6]),
        arrayOf(v[4], v[5]),
        arrayOf(v[4], v[7]),
        arrayOf(v[5], v[8]),
        arrayOf(v[6], v[7]),
        arrayOf(v[7], v[8])
    )
    val graph = GraphAdjList(edges)
    println("\nГраф после инициализации")
    graph.print()

    /* Обход в ширину */
    val res = graphBFS(graph, v[0]!!)
    println("\nПоследовательность вершин при обходе в ширину (BFS)")
    println(Vertex.vetsToVals(res))
}