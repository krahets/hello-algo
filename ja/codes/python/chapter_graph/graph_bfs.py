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
    """幅優先走査"""
    # 隣接リストを使用してグラフを表現し、指定された頂点のすべての隣接頂点を取得
    # 頂点走査シーケンス
    res = []
    # ハッシュセット、訪問済み頂点を記録するために使用
    visited = set[Vertex]([start_vet])
    # BFSを実装するために使用されるキュー
    que = deque[Vertex]([start_vet])
    # 頂点vetから開始し、すべての頂点が訪問されるまでループ
    while len(que) > 0:
        vet = que.popleft()  # キューの先頭の頂点をデキュー
        res.append(vet)  # 訪問済み頂点を記録
        # その頂点のすべての隣接頂点を走査
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # 既に訪問済みの頂点をスキップ
            que.append(adj_vet)  # 未訪問の頂点のみをエンキュー
            visited.add(adj_vet)  # 頂点を訪問済みとしてマーク
    # 頂点走査シーケンスを返す
    return res


"""ドライバコード"""
if __name__ == "__main__":
    # 無向グラフを初期化
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
    print("\n初期化後、グラフは")
    graph.print()

    # 幅優先走査
    res = graph_bfs(graph, v[0])
    print("\n幅優先走査（BFS）の頂点シーケンスは")
    print(vets_to_vals(res))