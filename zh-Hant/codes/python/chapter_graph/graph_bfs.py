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
    """廣度優先走訪"""
    # 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
    # 頂點走訪序列
    res = []
    # 雜湊表，用於記錄已被訪問過的頂點
    visited = set[Vertex]([start_vet])
    # 佇列用於實現 BFS
    que = deque[Vertex]([start_vet])
    # 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while len(que) > 0:
        vet = que.popleft()  # 佇列首頂點出隊
        res.append(vet)  # 記錄訪問頂點
        # 走訪該頂點的所有鄰接頂點
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # 跳過已被訪問的頂點
            que.append(adj_vet)  # 只入列未訪問的頂點
            visited.add(adj_vet)  # 標記該頂點已被訪問
    # 返回頂點走訪序列
    return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化無向圖
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
    print("\n初始化後，圖為")
    graph.print()

    # 廣度優先走訪
    res = graph_bfs(graph, v[0])
    print("\n廣度優先走訪（BFS）頂點序列為")
    print(vets_to_vals(res))
