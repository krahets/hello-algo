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
    """너비 우선 순회"""
    # 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
    # 정점 방문 순서
    res = []
    # 방문한 정점을 기록하는 해시 집합
    visited = set[Vertex]([start_vet])
    # BFS 구현에 사용하는 큐
    que = deque[Vertex]([start_vet])
    # 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
    while len(que) > 0:
        vet = que.popleft()  # 큐의 맨 앞 정점을 꺼냄
        res.append(vet)  # 방문한 정점 기록
        # 현재 정점에 인접한 모든 정점 순회
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # 이미 방문한 정점은 건너뜀
            que.append(adj_vet)  # 아직 방문하지 않은 정점만 큐에 삽입
            visited.add(adj_vet)  # 이 정점을 방문한 것으로 표시
    # 정점 방문 순서 반환
    return res


"""Driver Code"""
if __name__ == "__main__":
    # 무방향 그래프 초기화
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
    print("\n초기화한 그래프:")
    graph.print()

    # 너비 우선 순회
    res = graph_bfs(graph, v[0])
    print("\n너비 우선 순회(BFS)의 정점 방문 순서:")
    print(vets_to_vals(res))
