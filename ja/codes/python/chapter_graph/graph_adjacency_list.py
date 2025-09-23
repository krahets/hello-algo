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
    """隣接リストに基づく無向グラフクラス"""

    def __init__(self, edges: list[list[Vertex]]):
        """コンストラクタ"""
        # 隣接リスト、キー: 頂点、値: その頂点の隣接する全頂点
        self.adj_list = dict[Vertex, list[Vertex]]()
        # すべての頂点と辺を追加
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """頂点数を取得"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """辺を追加"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 辺 vet1 - vet2 を追加
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """辺を削除"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # 辺 vet1 - vet2 を削除
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """頂点を追加"""
        if vet in self.adj_list:
            return
        # 隣接リストに新しい連結リストを追加
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """頂点を削除"""
        if vet not in self.adj_list:
            raise ValueError()
        # 隣接リストから頂点vetに対応する連結リストを削除
        self.adj_list.pop(vet)
        # 他の頂点の連結リストを走査し、vetを含むすべての辺を削除
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """隣接リストを出力"""
        print("隣接リスト =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""ドライバコード"""
if __name__ == "__main__":
    # 無向グラフを初期化
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
    print("\n初期化後、グラフは")
    graph.print()

    # 辺を追加
    # 頂点1、2 つまり v[0], v[2]
    graph.add_edge(v[0], v[2])
    print("\n辺1-2を追加後、グラフは")
    graph.print()

    # 辺を削除
    # 頂点1、3 つまり v[0], v[1]
    graph.remove_edge(v[0], v[1])
    print("\n辺1-3を削除後、グラフは")
    graph.print()

    # 頂点を追加
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\n頂点6を追加後、グラフは")
    graph.print()

    # 頂点を削除
    # 頂点3 つまり v[1]
    graph.remove_vertex(v[1])
    print("\n頂点3を削除後、グラフは")
    graph.print()