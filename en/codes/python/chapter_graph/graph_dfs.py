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
    """Helper for depth-first traversal"""
    res.append(vet)  # Record the visited vertex
    visited.add(vet)  # Mark the vertex as visited
    # Iterate over all neighbors of this vertex
    for adjVet in graph.adj_list[vet]:
        if adjVet in visited:
            continue  # Skip visited vertices
        # Visit neighbors recursively
        dfs(graph, visited, res, adjVet)


def graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> list[Vertex]:
    """Depth-first traversal"""
    # Represent the graph with an adjacency list to look up all neighbors of a given vertex
    # Vertex traversal order
    res = []
    # Use a hash set to track visited vertices
    visited = set[Vertex]()
    dfs(graph, visited, res, start_vet)
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize an undirected graph
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
    print("\nGraph after initialization:")
    graph.print()

    # Depth-first traversal
    res = graph_dfs(graph, v[0])
    print("\nDepth-first search (DFS) visits the vertices in this order:")
    print(vets_to_vals(res))
