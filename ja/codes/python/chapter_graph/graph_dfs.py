"""
File: graph_dfs.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vets_to_vals, vals_to_vets
from graph_adjacency_list import GraphAdjList


def dfs(graph: GraphAdjList, visited: set[Vertex], res: list[Vertex], vet: Vertex):
    """深さ優先走査のヘルパー関数"""
    res.append(vet)  # 訪問済み頂点を記録
    visited.add(vet)  # 頂点を訪問済みとしてマーク
    # その頂点のすべての隣接頂点を走査
    for adjVet in graph.adj_list[vet]:
        if adjVet in visited:
            continue  # 既に訪問済みの頂点をスキップ
        # 隣接頂点を再帰的に訪問
        dfs(graph, visited, res, adjVet)


def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """深さ優先走査"""
    # 隣接リストを使用してグラフを表現し、指定された頂点のすべての隣接頂点を取得
    # 頂点走査シーケンス
    res = []
    # ハッシュセット、訪問済み頂点を記録するために使用
    visited = set[Vertex]()
    dfs(graph, visited, res, start_vet)
    return res


"""ドライバコード"""
if __name__ == "__main__":
    # 無向グラフを初期化
    v = vals_to_vets([0, 1, 2, 3, 4, 5, 6])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[5]],
        [v[4], v[5]],
        [v[5], v[6]],
    ]
    graph = GraphAdjList(edges)
    print("\n初期化後、グラフは")
    graph.print()

    # 深さ優先走査
    res = graph_dfs(graph, v[0])
    print("\n深さ優先走査（DFS）の頂点シーケンスは")
    print(vets_to_vals(res))