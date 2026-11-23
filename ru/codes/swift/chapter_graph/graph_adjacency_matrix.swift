/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
    private var vertices: [Int] // Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
    private var adjMat: [[Int]] // Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»

    /* Конструктор */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // Добавление вершины
        for val in vertices {
            addVertex(val: val)
        }
        // Добавить ребра
        // Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* Получить число вершин */
    func size() -> Int {
        vertices.count
    }

    /* Добавление вершины */
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

    /* Удаление вершины */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("Выход за границы диапазона")
        }
        // Удалить вершину с индексом index из списка вершин
        vertices.remove(at: index)
        // Удалить строку с индексом index из матрицы смежности
        adjMat.remove(at: index)
        // Удалить столбец с индексом index из матрицы смежности
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* Добавление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    func addEdge(i: Int, j: Int) {
        // Обработка выхода индекса за границы и случая равенства
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Выход за границы диапазона")
        }
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* Удаление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    func removeEdge(i: Int, j: Int) {
        // Обработка выхода индекса за границы и случая равенства
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("Выход за границы диапазона")
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
    /* Driver Code */
    static func main() {
        /* Инициализация неориентированного графа */
        // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\nГраф после инициализации")
        graph.print()

        /* Добавление ребра */
        // Индексы вершин 1 и 2 равны 0 и 2 соответственно
        graph.addEdge(i: 0, j: 2)
        print("\nГраф после добавления ребра 1-2")
        graph.print()

        /* Удаление ребра */
        // Индексы вершин 1 и 3 равны 0 и 1 соответственно
        graph.removeEdge(i: 0, j: 1)
        print("\nГраф после удаления ребра 1-3")
        graph.print()

        /* Добавление вершины */
        graph.addVertex(val: 6)
        print("\nГраф после добавления вершины 6")
        graph.print()

        /* Удаление вершины */
        // Индекс вершины 3 равен 1
        graph.removeVertex(index: 1)
        print("\nГраф после удаления вершины 3")
        graph.print()
    }
}
