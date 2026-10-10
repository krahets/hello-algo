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
    """隣接行列に基づく無向グラフクラス"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """コンストラクタ"""
        # 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
        self.vertices: list[int] = []
        # 隣接行列。行・列のインデックスは「頂点インデックス」に対応
        self.adj_mat: list[list[int]] = []
        # 頂点を追加
        for val in vertices:
            self.add_vertex(val)
        # 辺を追加
        # 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """頂点数を取得"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """頂点を追加"""
        n = self.size()
        # 頂点リストに新しい頂点の値を追加
        self.vertices.append(val)
        # 隣接行列に 1 行追加
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # 隣接行列に 1 列追加
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """頂点を削除"""
        if index >= self.size():
            raise IndexError()
        # 頂点リストから index の頂点を削除する
        self.vertices.pop(index)
        # 隣接行列で index 行を削除する
        self.adj_mat.pop(index)
        # 隣接行列で index 列を削除する
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """辺を追加"""
        # パラメータ i, j は vertices の要素インデックスに対応する
        # 範囲外と同値の場合の処理
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """辺を削除"""
        # パラメータ i, j は vertices の要素インデックスに対応する
        # 範囲外と同値の場合の処理
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """隣接行列を出力"""
        print("頂点リスト =", self.vertices)
        print("隣接行列 =")
        print_matrix(self.adj_mat)


"""Driver Code"""
if __name__ == "__main__":
    # 無向グラフを初期化する
    # 注意: edges の要素は頂点インデックスであり、vertices の要素インデックスに対応する
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\n初期化後、グラフは")
    graph.print()

    # 辺を追加する
    # 頂点 1, 2 のインデックスはそれぞれ 0, 2
    graph.add_edge(0, 2)
    print("\n辺 1-2 を追加した後、グラフは")
    graph.print()

    # 辺を削除する
    # 頂点 1, 3 のインデックスはそれぞれ 0, 1
    graph.remove_edge(0, 1)
    print("\n辺 1-3 を削除した後、グラフは")
    graph.print()

    # 頂点を追加
    graph.add_vertex(6)
    print("\n頂点 6 を追加した後、グラフは")
    graph.print()

    # 頂点を削除する
    # 頂点 3 のインデックスは 1
    graph.remove_vertex(1)
    print("\n頂点 3 を削除した後、グラフは")
    graph.print()
