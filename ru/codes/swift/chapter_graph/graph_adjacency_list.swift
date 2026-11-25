/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Неориентированный граф на списках смежности */
public class GraphAdjList {
    // Список смежности: ключ — вершина, значение — все её соседи
    public private(set) var adjList: [Vertex: [Vertex]]

    /* Конструктор */
    public init(edges: [[Vertex]]) {
        adjList = [:]
        // Добавить все вершины и рёбра
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

    /* Добавить ребро */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Недопустимые параметры")
        }
        // Добавить ребро vet1 — vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* Удалить ребро */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Недопустимые параметры")
        }
        // Удалить ребро vet1 — vet2
        adjList[vet1]?.removeAll { $0 == vet2 }
        adjList[vet2]?.removeAll { $0 == vet1 }
    }

    /* Добавить вершину */
    public func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // Добавить новый связный список в список смежности
        adjList[vet] = []
    }

    /* Удалить вершину */
    public func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("Недопустимые параметры")
        }
        // Удалить из списка смежности список вершины vet
        adjList.removeValue(forKey: vet)
        // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
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
    /* Пример использования */
    static func main() {
        /* Инициализировать неориентированный граф */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\nГраф после инициализации:")
        graph.print()

        /* Добавить ребро */
        // Вершинам 1 и 2 соответствуют v[0] и v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\nГраф после добавления ребра 1–2:")
        graph.print()

        /* Удалить ребро */
        // Вершинам 1 и 3 соответствуют v[0] и v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\nГраф после удаления ребра 1–3:")
        graph.print()

        /* Добавить вершину */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\nГраф после добавления вершины 6:")
        graph.print()

        /* Удалить вершину */
        // Вершине 3 соответствует v[1]
        graph.removeVertex(vet: v[1])
        print("\nГраф после удаления вершины 3:")
        graph.print()
    }
}

#endif
