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
    """인접 리스트로 구현한 무방향 그래프 클래스"""

    def __init__(self, edges: list[list[Vertex]]):
        """생성자"""
        # 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
        self.adj_list = dict[Vertex, list[Vertex]]()
        # 모든 정점과 간선을 추가한다
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """정점 개수 반환"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """간선 추가"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 간선 vet1 - vet2를 추가한다
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """간선 삭제"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 간선 vet1 - vet2를 삭제한다
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """정점 추가"""
        if vet in self.adj_list:
            return
        # 인접 리스트에 새 연결 리스트를 추가한다
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """정점 삭제"""
        if vet not in self.adj_list:
            raise ValueError()
        # 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        self.adj_list.pop(vet)
        # 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """인접 리스트 출력"""
        print("인접 리스트 =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""실행 코드"""
if __name__ == "__main__":
    # 무방향 그래프 초기화
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
    print("\n초기화한 후의 그래프")
    graph.print()

    # 간선 추가
    # 정점 1, 2는 각각 v[0], v[2]이다
    graph.add_edge(v[0], v[2])
    print("\n간선 1-2를 추가한 후의 그래프")
    graph.print()

    # 간선 삭제
    # 정점 1, 3은 각각 v[0], v[1]이다
    graph.remove_edge(v[0], v[1])
    print("\n간선 1-3을 삭제한 후의 그래프")
    graph.print()

    # 정점 추가
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\n정점 6을 추가한 후의 그래프")
    graph.print()

    # 정점 삭제
    # 정점 3은 v[1]이다
    graph.remove_vertex(v[1])
    print("\n정점 3을 삭제한 후의 그래프")
    graph.print()
