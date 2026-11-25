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
    """深度優先走訪的輔助函式"""
    res.append(vet)  # 記錄走訪的頂點
    visited.add(vet)  # 將此頂點標記為已走訪
    # 走訪此頂點的所有相鄰頂點
    for adjVet in graph.adj_list[vet]:
        if adjVet in visited:
            continue  # 略過已走訪的頂點
        # 遞迴走訪相鄰頂點
        dfs(graph, visited, res, adjVet)


def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """深度優先走訪"""
    # 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
    # 頂點走訪順序
    res = []
    # 用雜湊集合記錄已走訪的頂點
    visited = set[Vertex]()
    dfs(graph, visited, res, start_vet)
    return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化無向圖
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
    print("\n初始化後的圖為")
    graph.print()

    # 深度優先走訪
    res = graph_dfs(graph, v[0])
    print("\n深度優先走訪（DFS）的頂點順序為")
    print(vets_to_vals(res))
