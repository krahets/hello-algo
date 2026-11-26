/**
 * File: graph_adjacency_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* Неориентированный граф на списках смежности */
class GraphAdjList(edges: Array<Array<Vertex?>>) {
    // Список смежности: ключ — вершина, значение — все её соседи
    val adjList = HashMap<Vertex, MutableList<Vertex>>()

    /* Конструктор */
    init {
        // Добавить все вершины и рёбра
        for (edge in edges) {
            addVertex(edge[0]!!)
            addVertex(edge[1]!!)
            addEdge(edge[0]!!, edge[1]!!)
        }
    }

    /* Получить число вершин */
    fun size(): Int {
        return adjList.size
    }

    /* Добавить ребро */
    fun addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // Добавить ребро vet1 — vet2
        adjList[vet1]?.add(vet2)
        adjList[vet2]?.add(vet1)
    }

    /* Удалить ребро */
    fun removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw IllegalArgumentException()
        // Удалить ребро vet1 — vet2
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* Добавить вершину */
    fun addVertex(vet: Vertex) {
        if (adjList.containsKey(vet))
            return
        // Добавить новый связный список в список смежности
        adjList[vet] = mutableListOf()
    }

    /* Удалить вершину */
    fun removeVertex(vet: Vertex) {
        if (!adjList.containsKey(vet))
            throw IllegalArgumentException()
        // Удалить из списка смежности список вершины vet
        adjList.remove(vet)
        // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
        for (list in adjList.values) {
            list.remove(vet)
        }
    }

    /* Вывести список смежности */
    fun print() {
        println("Список смежности =")
        for (pair in adjList.entries) {
            val tmp = mutableListOf<Int>()
            for (vertex in pair.value) {
                tmp.add(vertex._val)
            }
            println("${pair.key._val}: $tmp,")
        }
    }
}

/* Пример использования */
fun main() {
    /* Инициализировать неориентированный граф */
    val v = Vertex.valsToVets(intArrayOf(1, 3, 2, 5, 4))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[2], v[3]),
        arrayOf(v[2], v[4]),
        arrayOf(v[3], v[4])
    )
    val graph = GraphAdjList(edges)
    println("\nГраф после инициализации:")
    graph.print()

    /* Добавить ребро */
    // Вершинам 1 и 2 соответствуют v[0] и v[2]
    graph.addEdge(v[0]!!, v[2]!!)
    println("\nГраф после добавления ребра 1–2:")
    graph.print()

    /* Удалить ребро */
    // Вершинам 1 и 3 соответствуют v[0] и v[1]
    graph.removeEdge(v[0]!!, v[1]!!)
    println("\nГраф после удаления ребра 1–3:")
    graph.print()

    /* Добавить вершину */
    val v5 = Vertex(6)
    graph.addVertex(v5)
    println("\nГраф после добавления вершины 6:")
    graph.print()

    /* Удалить вершину */
    // Вершине 3 соответствует v[1]
    graph.removeVertex(v[1]!!)
    println("\nГраф после удаления вершины 3:")
    graph.print()
}