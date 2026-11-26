"""
File: graph_bfs.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vals_to_vets, vets_to_vals
from collections import deque
from graph_adjacency_list import GraphAdjList


def graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """幅優先探索"""
    # 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
    # 頂点の訪問順
    res = []
    # 訪問済みの頂点を記録するハッシュ集合
    visited = set[Vertex]([start_vet])
    # BFS にキューを使う
    que = deque[Vertex]([start_vet])
    # 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
    while len(que) > 0:
        vet = que.popleft()  # キューの先頭から頂点を取り出す
        res.append(vet)  # 訪問した頂点を記録する
        # この頂点の隣接頂点をすべて調べる
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # 訪問済みの頂点を飛ばす
            que.append(adj_vet)  # 未訪問の頂点だけをキューに追加する
            visited.add(adj_vet)  # この頂点を訪問済みにする
    # 頂点を訪問順に返す
    return res


"""Driver Code"""
if __name__ == "__main__":
    # 無向グラフを初期化する
    v = vals_to_vets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[1], v[4]],
        [v[2], v[5]],
        [v[3], v[4]],
        [v[3], v[6]],
        [v[4], v[5]],
        [v[4], v[7]],
        [v[5], v[8]],
        [v[6], v[7]],
        [v[7], v[8]],
    ]
    graph = GraphAdjList(edges)
    print("\n初期化後のグラフ：")
    graph.print()

    # 幅優先探索
    res = graph_bfs(graph, v[0])
    print("\n幅優先探索（BFS）での頂点の訪問順：")
    print(vets_to_vals(res))
