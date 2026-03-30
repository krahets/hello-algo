"""
File: graph_adjacency_list.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vals_to_vets


class GraphAdjList:
    """Класс неориентированного графа на основе списка смежности"""

    def __init__(self, edges: list[list[Vertex]]):
        """Конструктор"""
        # Список смежности, где key — вершина, а value — все смежные ей вершины
        self.adj_list = dict[Vertex, list[Vertex]]()
        # Добавить все вершины и ребра
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """Получить число вершин"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """Добавление ребра"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Добавить ребро vet1 - vet2
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """Удаление ребра"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Удалить ребро vet1 - vet2
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """Добавление вершины"""
        if vet in self.adj_list:
            return
        # Добавить новый список в список смежности
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """Удаление вершины"""
        if vet not in self.adj_list:
            raise ValueError()
        # Удалить из списка смежности список, соответствующий вершине vet
        self.adj_list.pop(vet)
        # Обойти списки других вершин и удалить все ребра, содержащие vet
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """Вывести список смежности"""
        print("Список смежности =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация неориентированного графа
    v = vals_to_vets([1, 3, 2, 5, 4])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[3]],
        [v[2], v[4]],
        [v[3], v[4]],
    ]
    graph = GraphAdjList(edges)
    print("\nГраф после инициализации")
    graph.print()

    # Добавить ребро
    # Вершины 1 и 2, то есть v[0] и v[2]
    graph.add_edge(v[0], v[2])
    print("\nГраф после добавления ребра 1-2")
    graph.print()

    # Удалить ребро
    # Вершины 1 и 3 соответствуют v[0] и v[1]
    graph.remove_edge(v[0], v[1])
    print("\nГраф после удаления ребра 1-3")
    graph.print()

    # Добавление вершины
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\nГраф после добавления вершины 6")
    graph.print()

    # Удаление вершины
    # Вершина 3 соответствует v[1]
    graph.remove_vertex(v[1])
    print("\nГраф после удаления вершины 3")
    graph.print()
