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
    # 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
    # 정점 순회 순서
    res = []
    # 방문한 정점을 기록하는 해시 집합
    visited = set[Vertex]([start_vet])
    # 큐를 사용하여 BFS를 구현한다
    que = deque[Vertex]([start_vet])
    # 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
    while len(que) > 0:
        vet = que.popleft()  # 큐 맨 앞의 정점을 꺼낸다
        res.append(vet)  # 방문한 정점을 기록한다
        # 해당 정점의 모든 인접 정점을 순회한다
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # 이미 방문한 정점은 건너뛴다
            que.append(adj_vet)  # 방문하지 않은 정점만 큐에 삽입한다
            visited.add(adj_vet)  # 해당 정점을 방문했다고 표시한다
    # 정점 순회 순서를 반환한다
    return res


"""실행 코드"""
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
    print("\n초기화한 후의 그래프")
    graph.print()

    # 너비 우선 순회
    res = graph_bfs(graph, v[0])
    print("\n너비 우선 순회(BFS)의 정점 순서")
    print(vets_to_vals(res))
