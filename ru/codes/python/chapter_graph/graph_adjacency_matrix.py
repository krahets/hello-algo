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
    """Класс неориентированного графа на основе матрицы смежности"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """Конструктор"""
        # Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
        self.vertices: list[int] = []
        # Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»
        self.adj_mat: list[list[int]] = []
        # Добавление вершины
        for val in vertices:
            self.add_vertex(val)
        # Добавить ребра
        # Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """Получить число вершин"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """Добавление вершины"""
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
        """Удаление вершины"""
        if index >= self.size():
            raise IndexError()
        # Удалить вершину с индексом index из списка вершин
        self.vertices.pop(index)
        # Удалить строку с индексом index из матрицы смежности
        self.adj_mat.pop(index)
        # Удалить столбец с индексом index из матрицы смежности
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """Добавление ребра"""
        # Параметры i и j соответствуют индексам элементов vertices
        # Обработка выхода индекса за границы и случая равенства
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """Удаление ребра"""
        # Параметры i и j соответствуют индексам элементов vertices
        # Обработка выхода индекса за границы и случая равенства
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
    # Инициализация неориентированного графа
    # Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\nГраф после инициализации")
    graph.print()

    # Добавление ребра
    # Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.add_edge(0, 2)
    print("\nГраф после добавления ребра 1-2")
    graph.print()

    # Удалить ребро
    # Индексы вершин 1 и 3 равны 0 и 1
    graph.remove_edge(0, 1)
    print("\nГраф после удаления ребра 1-3")
    graph.print()

    # Добавление вершины
    graph.add_vertex(6)
    print("\nГраф после добавления вершины 6")
    graph.print()

    # Удаление вершины
    # Индекс вершины 3 равен 1
    graph.remove_vertex(1)
    print("\nГраф после удаления вершины 3")
    graph.print()
