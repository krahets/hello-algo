/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Класс неориентированного графа на основе списка смежности */
public class GraphAdjList {
    // Список смежности, где key — вершина, а value — все смежные ей вершины
    public private(set) var adjList: [Vertex: [Vertex]]

    /* Конструктор */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // Добавить все вершины и ребра
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* Получить число вершин */
    public func size() -> Int {
        adjList.count
    }

    /* Добавление ребра */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Неверный аргумент")
        }
        // Добавить ребро vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* Удаление ребра */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Неверный аргумент")
        }
        // Удалить ребро vet1 - vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* Добавление вершины */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // Добавить новый список в список смежности
        adjList[vet] = []
    }

    /* Удаление вершины */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("Неверный аргумент")
        }
        // Удалить из списка смежности список, соответствующий вершине vet
        adjList.removeValue(forKey: vet)
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* Вывести список смежности */
    public func print() {
        Swift.print("Список смежности =")
        for (vertex, list) in adjList {
            let list = list.map { $0.val }
            Swift.print("\(vertex.val): \(list),")
        }
    }
}

#if !TARGET

@main
enum GraphAdjacencyList {
    /* Driver Code */
    static func main() {
        /* Инициализация неориентированного графа */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\nГраф после инициализации")
        graph.print()

        /* Добавление ребра */
        // Вершины 1 и 2 соответствуют v[0] и v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\nГраф после добавления ребра 1-2")
        graph.print()

        /* Удаление ребра */
        // Вершины 1 и 3 соответствуют v[0] и v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\nГраф после удаления ребра 1-3")
        graph.print()

        /* Добавление вершины */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\nГраф после добавления вершины 6")
        graph.print()

        /* Удаление вершины */
        // Вершина 3 соответствует v[1]
        graph.removeVertex(vet: v[1])
        print("\nГраф после удаления вершины 3")
        graph.print()
    }
}

#endif
