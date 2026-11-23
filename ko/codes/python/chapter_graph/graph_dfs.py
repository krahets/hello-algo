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
    """깊이 우선 순회 보조 함수"""
    res.append(vet)  # 방문한 정점을 기록한다
    visited.add(vet)  # 해당 정점을 방문했다고 표시한다
    # 해당 정점의 모든 인접 정점을 순회한다
    for adjVet in graph.adj_list[vet]:
        if adjVet in visited:
            continue  # 이미 방문한 정점은 건너뛴다
        # 인접 정점을 재귀적으로 방문한다
        dfs(graph, visited, res, adjVet)


def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """깊이 우선 순회"""
    # 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
    # 정점 순회 순서
    res = []
    # 방문한 정점을 기록하는 해시 집합
    visited = set[Vertex]()
    dfs(graph, visited, res, start_vet)
    return res


"""실행 코드"""
if __name__ == "__main__":
    # 무방향 그래프 초기화
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
    print("\n초기화한 후의 그래프")
    graph.print()

    # 깊이 우선 순회
    res = graph_dfs(graph, v[0])
    print("\n깊이 우선 순회(DFS)의 정점 순서")
    print(vets_to_vals(res))
