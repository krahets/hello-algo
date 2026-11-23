/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
    val adjMat = mutableListOf<MutableList<Int>>() // Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»

    /* Конструктор */
    init {
        // Добавление вершины
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // Добавить ребра
        // Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* Получить число вершин */
    fun size(): Int {
        return vertices.size
    }

    /* Добавление вершины */
    fun addVertex(_val: Int) {
        val n = size()
        // Добавить значение новой вершины в список вершин
        vertices.add(_val)
        // Добавить строку в матрицу смежности
        val newRow = mutableListOf<Int>()
        for (j in 0..<n) {
            newRow.add(0)
        }
        adjMat.add(newRow)
        // Добавить столбец в матрицу смежности
        for (row in adjMat) {
            row.add(0)
        }
    }

    /* Удаление вершины */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // Удалить вершину с индексом index из списка вершин
        vertices.removeAt(index)
        // Удалить строку с индексом index из матрицы смежности
        adjMat.removeAt(index)
        // Удалить столбец с индексом index из матрицы смежности
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* Добавление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    fun addEdge(i: Int, j: Int) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Удаление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    fun removeEdge(i: Int, j: Int) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* Вывести матрицу смежности */
    fun print() {
        print("Список вершин = ")
        println(vertices)
        println("Матрица смежности =")
        printMatrix(adjMat)
    }
}

/* Driver Code */
fun main() {
    /* Инициализация неориентированного графа */
    // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
    val vertices = intArrayOf(1, 3, 2, 5, 4)
    val edges = arrayOf(
        intArrayOf(0, 1),
        intArrayOf(0, 3),
        intArrayOf(1, 2),
        intArrayOf(2, 3),
        intArrayOf(2, 4),
        intArrayOf(3, 4)
    )
    val graph = GraphAdjMat(vertices, edges)
    println("\nГраф после инициализации")
    graph.print()

    /* Добавление ребра */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.addEdge(0, 2)
    println("\nГраф после добавления ребра 1-2")
    graph.print()

    /* Удаление ребра */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.removeEdge(0, 1)
    println("\nГраф после удаления ребра 1-3")
    graph.print()

    /* Добавление вершины */
    graph.addVertex(6)
    println("\nГраф после добавления вершины 6")
    graph.print()

    /* Удаление вершины */
    // Индекс вершины 3 равен 1
    graph.removeVertex(1)
    println("\nГраф после удаления вершины 3")
    graph.print()
}