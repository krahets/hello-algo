"""
File: graph_bfs.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vals_to_vets, vets_to_vals
from collections import deque
from graph_adjacency_list import GraphAdjList


def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """Обход в ширину"""
    # Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
    # Последовательность обхода вершин
    res = []
    # Хеш-множество для хранения уже посещенных вершин
    visited = set[Vertex]([start_vet])
    # Очередь используется для реализации BFS
    que = deque[Vertex]([start_vet])
    # Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
    while len(que) > 0:
        vet = que.popleft()  # Извлечь головную вершину из очереди
        res.append(vet)  # Отметить посещенную вершину
        # Обойти все смежные вершины данной вершины
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # Пропустить уже посещенную вершину
            que.append(adj_vet)  # Помещать в очередь только непосещенные вершины
            visited.add(adj_vet)  # Отметить эту вершину как посещенную
    # Вернуть последовательность обхода вершин
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация неориентированного графа
    v = vals_to_vets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[1], v[4]],
        [v[2], v[5]],
        [v[3], v[4]],
        [v[3], v[6]],
        [v[4], v[5]],
        [v[4], v[7]],
        [v[5], v[8]],
        [v[6], v[7]],
        [v[7], v[8]],
    ]
    graph = GraphAdjList(edges)
    print("\nГраф после инициализации")
    graph.print()

    # Обход в ширину
    res = graph_bfs(graph, v[0])
    print("\nПоследовательность вершин при обходе в ширину (BFS)")
    print(vets_to_vals(res))
