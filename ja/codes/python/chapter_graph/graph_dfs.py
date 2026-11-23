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
    """深さ優先走査の補助関数"""
    res.append(vet)  # 訪問した頂点を記録する
    visited.add(vet)  # この頂点を訪問済みにする
    # この頂点に隣接する全頂点を走査する
    for adjVet in graph.adj_list[vet]:
        if adjVet in visited:
            continue  # 訪問済みの頂点をスキップする
        # 隣接する頂点を再帰的に訪問する
        dfs(graph, visited, res, adjVet)


def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """深さ優先走査"""
    # 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    # 頂点の走査順序
    res = []
    # 訪問済みの頂点を記録するハッシュ集合
    visited = set[Vertex]()
    dfs(graph, visited, res, start_vet)
    return res


"""実行用コード"""
if __name__ == "__main__":
    # 無向グラフを初期化する
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
    print("\n初期化後のグラフ")
    graph.print()

    # 深さ優先走査
    res = graph_dfs(graph, v[0])
    print("\n深さ優先走査（DFS）の頂点の順序")
    print(vets_to_vals(res))
