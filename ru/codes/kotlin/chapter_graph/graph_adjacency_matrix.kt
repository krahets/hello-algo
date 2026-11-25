/**
 * File: graph_adjacency_matrix.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.printMatrix

/* Неориентированный граф на матрице смежности */
class GraphAdjMat(vertices: IntArray, edges: Array<IntArray>) {
    val vertices = mutableListOf<Int>() // Список вершин: элементы — значения вершин, позиции — их индексы
    val adjMat = mutableListOf<MutableList<Int>>() // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

    /* Конструктор */
    init {
        // Добавить вершину
        for (vertex in vertices) {
            addVertex(vertex)
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for (edge in edges) {
            addEdge(edge[0], edge[1])
        }
    }

    /* Получить число вершин */
    fun size(): Int {
        return vertices.size
    }

    /* Добавить вершину */
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

    /* Удалить вершину */
    fun removeVertex(index: Int) {
        if (index >= size())
            throw IndexOutOfBoundsException()
        // Удалить из списка вершин вершину с индексом index
        vertices.removeAt(index)
        // Удалить из матрицы смежности строку с индексом index
        adjMat.removeAt(index)
        // Удалить из матрицы смежности столбец с индексом index
        for (row in adjMat) {
            row.removeAt(index)
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    fun addEdge(i: Int, j: Int) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw IndexOutOfBoundsException()
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    fun removeEdge(i: Int, j: Int) {
        // Проверить выход индексов за границы и их совпадение
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

/* Пример использования */
fun main() {
    /* Инициализировать неориентированный граф */
    // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
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
    println("\nГраф после инициализации:")
    graph.print()

    /* Добавить ребро */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.addEdge(0, 2)
    println("\nГраф после добавления ребра 1–2:")
    graph.print()

    /* Удалить ребро */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.removeEdge(0, 1)
    println("\nГраф после удаления ребра 1–3:")
    graph.print()

    /* Добавить вершину */
    graph.addVertex(6)
    println("\nГраф после добавления вершины 6:")
    graph.print()

    /* Удалить вершину */
    // Индекс вершины 3 равен 1
    graph.removeVertex(1)
    println("\nГраф после удаления вершины 3:")
    graph.print()
}