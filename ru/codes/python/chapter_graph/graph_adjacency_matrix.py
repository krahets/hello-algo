"""
File: graph_adjacency_matrix.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, print_matrix


class GraphAdjMat:
    """Неориентированный граф на матрице смежности"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """Конструктор"""
        # Список вершин: элементы — значения вершин, позиции — их индексы
        self.vertices: list[int] = []
        # Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
        self.adj_mat: list[list[int]] = []
        # Добавить вершину
        for val in vertices:
            self.add_vertex(val)
        # Добавить ребро
        # Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """Получить число вершин"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """Добавить вершину"""
        n = self.size()
        # Добавить значение новой вершины в список вершин
        self.vertices.append(val)
        # Добавить строку в матрицу смежности
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # Добавить столбец в матрицу смежности
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """Удалить вершину"""
        if index >= self.size():
            raise IndexError()
        # Удалить из списка вершин вершину с индексом index
        self.vertices.pop(index)
        # Удалить из матрицы смежности строку с индексом index
        self.adj_mat.pop(index)
        # Удалить из матрицы смежности столбец с индексом index
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """Добавить ребро"""
        # Параметры i и j — индексы элементов vertices
        # Проверить выход индексов за границы и их совпадение
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """Удалить ребро"""
        # Параметры i и j — индексы элементов vertices
        # Проверить выход индексов за границы и их совпадение
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """Вывести матрицу смежности"""
        print("Список вершин =", self.vertices)
        print("Матрица смежности =")
        print_matrix(self.adj_mat)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать неориентированный граф
    # Элементы edges содержат индексы вершин, то есть индексы элементов vertices
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\nГраф после инициализации:")
    graph.print()

    # Добавить ребро
    # Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.add_edge(0, 2)
    print("\nГраф после добавления ребра 1–2:")
    graph.print()

    # Удалить ребро
    # Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.remove_edge(0, 1)
    print("\nГраф после удаления ребра 1–3:")
    graph.print()

    # Добавить вершину
    graph.add_vertex(6)
    print("\nГраф после добавления вершины 6:")
    graph.print()

    # Удалить вершину
    # Индекс вершины 3 равен 1
    graph.remove_vertex(1)
    print("\nГраф после удаления вершины 3:")
    graph.print()
