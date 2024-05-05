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
    """Breadth-first traversal"""
    # Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    # Vertex traversal sequence
    res = []
    # Hash set, used to record visited vertices
    visited = set[Vertex]([start_vet])
    # Queue used to implement BFS
    que = deque[Vertex]([start_vet])
    # Starting from vertex vet, loop until all vertices are visited
    while len(que) > 0:
        vet = que.popleft()  # Dequeue the vertex at the head of the queue
        res.append(vet)  # Record visited vertex
        # Traverse all adjacent vertices of that vertex
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # Skip already visited vertices
            que.append(adj_vet)  # Only enqueue unvisited vertices
            visited.add(adj_vet)  # Mark the vertex as visited
    # Return the vertex traversal sequence
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize undirected graph
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
    print("\nAfter initialization, the graph is")
    graph.print()

    # Breadth-first traversal
    res = graph_bfs(graph, v[0])
    print("\nBreadth-first traversal (BFS) vertex sequence is")
    print(vets_to_vals(res))
