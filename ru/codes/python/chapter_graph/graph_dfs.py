"""
File: graph_dfs.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vets_to_vals, vals_to_vets
from graph_adjacency_list import GraphAdjList


def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
    """Вспомогательная функция обхода в глубину"""
    res.append(vet)  # Записать посещённую вершину
    visited.add(vet)  # Отметить вершину как посещённую
    # Перебрать всех соседей этой вершины
    for adjVet in graph.adj_list[vet]:
        if adjVet in visited:
            continue  # Пропустить посещённые вершины
        # Рекурсивно посетить соседнюю вершину
        dfs(graph, visited, res, adjVet)


def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """Обход в глубину"""
    # Список смежности позволяет получить всех соседей заданной вершины
    # Порядок обхода вершин
    res = []
    # Хеш-множество посещённых вершин
    visited = set[Vertex]()
    dfs(graph, visited, res, start_vet)
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать неориентированный граф
    v = vals_to_vets([0, 1, 2, 3, 4, 5, 6])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[5]],
        [v[4], v[5]],
        [v[5], v[6]],
    ]
    graph = GraphAdjList(edges)
    print("\nГраф после инициализации:")
    graph.print()

    # Обход в глубину
    res = graph_dfs(graph, v[0])
    print("\nПорядок обхода вершин в глубину (DFS):")
    print(vets_to_vals(res))
