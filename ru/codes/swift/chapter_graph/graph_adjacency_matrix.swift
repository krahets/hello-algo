/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Неориентированный граф на матрице смежности */
class GraphAdjMat {
    private var vertices: [Int] // Список вершин: элементы — значения вершин, позиции — их индексы
    private var adjMat: [[Int]] // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

    /* Конструктор */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // Добавить вершину
        for val in vertices {
            addVertex(val: val)
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* Получить число вершин */
    func size() -> Int {
        vertices.count
    }

    /* Добавить вершину */
    func addVertex(val: Int) {
        let n = size()
        // Добавить значение новой вершины в список вершин
        vertices.append(val)
        // Добавить строку в матрицу смежности
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // Добавить столбец в матрицу смежности
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* Удалить вершину */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("Индекс вне диапазона")
        }
        // Удалить из списка вершин вершину с индексом index
        vertices.remove(at: index)
        // Удалить из матрицы смежности строку с индексом index
        adjMat.remove(at: index)
        // Удалить из матрицы смежности столбец с индексом index
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    func addEdge(i: Int, j: Int) {
        // Проверить выход индексов за границы и их совпадение
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Индекс вне диапазона")
        }
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    func removeEdge(i: Int, j: Int) {
        // Проверить выход индексов за границы и их совпадение
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Индекс вне диапазона")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* Вывести матрицу смежности */
    func print() {
        Swift.print("Список вершин = ", terminator: "")
        Swift.print(vertices)
        Swift.print("Матрица смежности =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Пример использования */
    static func main() {
        /* Инициализировать неориентированный граф */
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\nГраф после инициализации:")
        graph.print()

        /* Добавить ребро */
        // Индексы вершин 1 и 2 равны 0 и 2 соответственно
        graph.addEdge(i: 0, j: 2)
        print("\nГраф после добавления ребра 1–2:")
        graph.print()

        /* Удалить ребро */
        // Индексы вершин 1 и 3 равны 0 и 1 соответственно
        graph.removeEdge(i: 0, j: 1)
        print("\nГраф после удаления ребра 1–3:")
        graph.print()

        /* Добавить вершину */
        graph.addVertex(val: 6)
        print("\nГраф после добавления вершины 6:")
        graph.print()

        /* Удалить вершину */
        // Индекс вершины 3 равен 1
        graph.removeVertex(index: 1)
        print("\nГраф после удаления вершины 3:")
        graph.print()
    }
}
