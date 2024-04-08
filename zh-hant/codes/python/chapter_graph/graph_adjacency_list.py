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
    """基於鄰接表實現的無向圖類別"""

    def __init__(self, edges: list[list[Vertex]]):
        """建構子"""
        # 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
        self.adj_list = dict[Vertex, list[Vertex]]()
        # 新增所有頂點和邊
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """獲取頂點數量"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """新增邊"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 新增邊 vet1 - vet2
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """刪除邊"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 刪除邊 vet1 - vet2
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """新增頂點"""
        if vet in self.adj_list:
            return
        # 在鄰接表中新增一個新鏈結串列
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """刪除頂點"""
        if vet not in self.adj_list:
            raise ValueError()
        # 在鄰接表中刪除頂點 vet 對應的鏈結串列
        self.adj_list.pop(vet)
        # 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """列印鄰接表"""
        print("鄰接表 =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""Driver Code"""
if __name__ == "__main__":
    # 初始化無向圖
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
    print("\n初始化後，圖為")
    graph.print()

    # 新增邊
    # 頂點 1, 2 即 v[0], v[2]
    graph.add_edge(v[0], v[2])
    print("\n新增邊 1-2 後，圖為")
    graph.print()

    # 刪除邊
    # 頂點 1, 3 即 v[0], v[1]
    graph.remove_edge(v[0], v[1])
    print("\n刪除邊 1-3 後，圖為")
    graph.print()

    # 新增頂點
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\n新增頂點 6 後，圖為")
    graph.print()

    # 刪除頂點
    # 頂點 3 即 v[1]
    graph.remove_vertex(v[1])
    print("\n刪除頂點 3 後，圖為")
    graph.print()
