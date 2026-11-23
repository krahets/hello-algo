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
    """隣接リストで実装した無向グラフクラス"""

    def __init__(self, edges: list[list[Vertex]]):
        """コンストラクタ"""
        # 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
        self.adj_list = dict[Vertex, list[Vertex]]()
        # すべての頂点と辺を追加する
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """頂点数を取得する"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """辺を追加する"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 辺 vet1 - vet2 を追加する
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """辺を削除する"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 辺 vet1 - vet2 を削除する
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """頂点を追加する"""
        if vet in self.adj_list:
            return
        # 隣接リストに新しい連結リストを追加する
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """頂点を削除する"""
        if vet not in self.adj_list:
            raise ValueError()
        # 隣接リストから頂点 vet に対応する連結リストを削除する
        self.adj_list.pop(vet)
        # 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """隣接リストを表示する"""
        print("隣接リスト =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""実行用コード"""
if __name__ == "__main__":
    # 無向グラフを初期化する
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
    print("\n初期化後のグラフ")
    graph.print()

    # 辺を追加する
    # 頂点 1, 2 は v[0], v[2] に対応する
    graph.add_edge(v[0], v[2])
    print("\n辺 1-2 を追加した後のグラフ")
    graph.print()

    # 辺を削除する
    # 頂点 1, 3 は v[0], v[1] に対応する
    graph.remove_edge(v[0], v[1])
    print("\n辺 1-3 を削除した後のグラフ")
    graph.print()

    # 頂点を追加する
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\n頂点 6 を追加した後のグラフ")
    graph.print()

    # 頂点を削除する
    # 頂点 3 は v[1] に対応する
    graph.remove_vertex(v[1])
    print("\n頂点 3 を削除した後のグラフ")
    graph.print()
