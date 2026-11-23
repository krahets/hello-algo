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
    """인접 행렬로 구현한 무방향 그래프 클래스"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """생성자"""
        # 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
        self.vertices: list[int] = []
        # 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다
        self.adj_mat: list[list[int]] = []
        # 정점 추가
        for val in vertices:
            self.add_vertex(val)
        # 간선 추가
        # edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """정점 개수 반환"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """정점 추가"""
        n = self.size()
        # 정점 리스트에 새 정점의 값을 추가한다
        self.vertices.append(val)
        # 인접 행렬에 행 하나를 추가한다
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # 인접 행렬에 열 하나를 추가한다
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """정점 삭제"""
        if index >= self.size():
            raise IndexError()
        # 정점 리스트에서 인덱스 index의 정점을 제거한다
        self.vertices.pop(index)
        # 인접 행렬에서 인덱스 index의 행을 삭제한다
        self.adj_mat.pop(index)
        # 인접 행렬에서 인덱스 index의 열을 삭제한다
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """간선 추가"""
        # 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
        # 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """간선 삭제"""
        # 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
        # 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """인접 행렬 출력"""
        print("정점 리스트 =", self.vertices)
        print("인접 행렬 =")
        print_matrix(self.adj_mat)


"""실행 코드"""
if __name__ == "__main__":
    # 무방향 그래프 초기화
    # edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\n초기화한 후의 그래프")
    graph.print()

    # 간선 추가
    # 정점 1, 2의 인덱스는 각각 0, 2이다
    graph.add_edge(0, 2)
    print("\n간선 1-2를 추가한 후의 그래프")
    graph.print()

    # 간선 삭제
    # 정점 1, 3의 인덱스는 각각 0, 1이다
    graph.remove_edge(0, 1)
    print("\n간선 1-3을 삭제한 후의 그래프")
    graph.print()

    # 정점 추가
    graph.add_vertex(6)
    print("\n정점 6을 추가한 후의 그래프")
    graph.print()

    # 정점 삭제
    # 정점 3의 인덱스는 1이다
    graph.remove_vertex(1)
    print("\n정점 3을 삭제한 후의 그래프")
    graph.print()
