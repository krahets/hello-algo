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
    """隣接行列で無向グラフを表すクラス"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """コンストラクタ"""
        # 頂点リスト。要素は頂点の値を、インデックスは頂点のインデックスを表す
        self.vertices: list[int] = []
        # 隣接行列。行と列のインデックスは頂点のインデックスに対応する
        self.adj_mat: list[list[int]] = []
        # 頂点を追加する
        for val in vertices:
            self.add_vertex(val)
        # 辺を追加する
        # edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """頂点数を取得する"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """頂点を追加する"""
        n = self.size()
        # 新しい頂点の値を頂点リストに追加する
        self.vertices.append(val)
        # 隣接行列に行を 1 つ追加する
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # 隣接行列に列を 1 つ追加する
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """頂点を削除する"""
        if index >= self.size():
            raise IndexError()
        # 頂点リストからインデックス index の頂点を削除する
        self.vertices.pop(index)
        # 隣接行列からインデックス index の行を削除する
        self.adj_mat.pop(index)
        # 隣接行列からインデックス index の列を削除する
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """辺を追加する"""
        # 引数 i と j は vertices の要素のインデックス
        # インデックスが範囲外または同じ値の場合の処理
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # 無向グラフの隣接行列は主対角線に関して対称で、(i, j) == (j, i) を満たす
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """辺を削除する"""
        # 引数 i と j は vertices の要素のインデックス
        # インデックスが範囲外または同じ値の場合の処理
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """隣接行列を表示する"""
        print("頂点リスト =", self.vertices)
        print("隣接行列 =")
        print_matrix(self.adj_mat)


"""Driver Code"""
if __name__ == "__main__":
    # 無向グラフを初期化する
    # edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\n初期化後のグラフ：")
    graph.print()

    # 辺を追加する
    # 頂点 1 と 2 のインデックスはそれぞれ 0 と 2
    graph.add_edge(0, 2)
    print("\n辺 1-2 を追加した後のグラフ：")
    graph.print()

    # 辺を削除する
    # 頂点 1 と 3 のインデックスはそれぞれ 0 と 1
    graph.remove_edge(0, 1)
    print("\n辺 1-3 を削除した後のグラフ：")
    graph.print()

    # 頂点を追加する
    graph.add_vertex(6)
    print("\n頂点 6 を追加した後のグラフ：")
    graph.print()

    # 頂点を削除する
    # 頂点 3 のインデックスは 1
    graph.remove_vertex(1)
    print("\n頂点 3 を削除した後のグラフ：")
    graph.print()
