/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Класс неориентированного графа на основе списка смежности */
public class GraphAdjList {
    // Список смежности, key: вершина, value: все смежные с ней вершины
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

    /* Получить количество вершин */
    public func size() -> Int {
        adjList.count
    }

    /* Добавить ребро */
    public func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Ошибка параметра")
        }
        // Добавить ребро vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }

    /* Удалить ребро */
    public func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("Ошибка параметра")
        }
        // Удалить ребро vet1 - vet2
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
            fatalError("Ошибка параметра")
        }
        // Удалить из списка смежности связный список, соответствующий вершине vet
        adjList.removeValue(forKey: vet)
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for key in adjList.keys {
            adjList[key]?.removeAll { $0 == vet }
        }
    }

    /* Вывести список смежности */
    public func print() {
        Swift.print("список смежности =")
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
        /* Инициализировать неориентированный граф */
        let v = Vertex.valsToVets(vals: [1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjList(edges: edges)
        print("\nПосле инициализации граф имеет вид")
        graph.print()

        /* Добавить ребро */
        // Вершины 1 и 2, то есть v[0] и v[2]
        graph.addEdge(vet1: v[0], vet2: v[2])
        print("\nПосле добавления ребра 1-2 граф имеет вид")
        graph.print()

        /* Удалить ребро */
        // Вершины 1 и 3, то есть v[0] и v[1]
        graph.removeEdge(vet1: v[0], vet2: v[1])
        print("\nПосле удаления ребра 1-3 граф имеет вид")
        graph.print()

        /* Добавить вершину */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\nПосле добавления вершины 6 граф имеет вид")
        graph.print()

        /* Удалить вершину */
        // Вершина 3, то есть v[1]
        graph.removeVertex(vet: v[1])
        print("\nПосле удаления вершины 3 граф имеет вид")
        graph.print()
    }
}

#endif
