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
    # 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
    # 頂點走訪順序
    res = []
    # 用雜湊集合記錄已走訪的頂點
    visited = set[Vertex]([start_vet])
    # 使用佇列實作 BFS
    que = deque[Vertex]([start_vet])
    # 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
    while len(que) > 0:
        vet = que.popleft()  # 取出佇列前端的頂點
        res.append(vet)  # 記錄走訪的頂點
        # 走訪此頂點的所有相鄰頂點
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # 略過已走訪的頂點
            que.append(adj_vet)  # 只將尚未走訪的頂點加入佇列
            visited.add(adj_vet)  # 將此頂點標記為已走訪
    # 回傳頂點的走訪順序
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
    print("\n初始化後的圖為")
    graph.print()

    # 廣度優先走訪
    res = graph_bfs(graph, v[0])
    print("\n廣度優先走訪（BFS）的頂點順序為")
    print(vets_to_vals(res))
