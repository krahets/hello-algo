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
    # Represent the graph with an adjacency list to access all neighbors of a given vertex
    # Vertex traversal sequence
    res = []
    # Hash set recording visited vertices
    visited = set[Vertex]([start_vet])
    # Use a queue to implement BFS
    que = deque[Vertex]([start_vet])
    # Starting from start_vet, loop until all reachable vertices have been visited
    while len(que) > 0:
        vet = que.popleft()  # Dequeue the front vertex
        res.append(vet)  # Record the visited vertex
        # Traverse all neighbors of this vertex
        for adj_vet in graph.adj_list[vet]:
            if adj_vet in visited:
                continue  # Skip vertices that have already been visited
            que.append(adj_vet)  # Enqueue only unvisited vertices
            visited.add(adj_vet)  # Mark this vertex as visited
    # Return the vertex traversal sequence
    return res


"""Driver code"""
if __name__ == "__main__":
    # Initialize the undirected graph
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
    print("\nGraph after initialization:")
    graph.print()

    # Breadth-first traversal
    res = graph_bfs(graph, v[0])
    print("\nVertex sequence from breadth-first traversal (BFS):")
    print(vets_to_vals(res))
