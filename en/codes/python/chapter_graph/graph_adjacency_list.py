"""
File: graph_adjacency_list.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, vals_to_vets


class GraphAdjList:
    """Undirected graph class based on adjacency list"""

    def __init__(self, edges: list[list[Vertex]]):
        """Constructor"""
        # Adjacency list, key: vertex, value: all adjacent vertices of that vertex
        self.adj_list = dict[Vertex, list[Vertex]]()
        # Add all vertices and edges
        for edge in edges:
            self.add_vertex(edge[0])
            self.add_vertex(edge[1])
            self.add_edge(edge[0], edge[1])

    def size(self) -> int:
        """Get the number of vertices"""
        return len(self.adj_list)

    def add_edge(self, vet1: Vertex, vet2: Vertex):
        """Add edge"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Add edge vet1 - vet2
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """Remove edge"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Remove edge vet1 - vet2
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """Add vertex"""
        if vet in self.adj_list:
            return
        # Add a new linked list to the adjacency list
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """Remove vertex"""
        if vet not in self.adj_list:
            raise ValueError()
        # Remove the vertex vet's corresponding linked list from the adjacency list
        self.adj_list.pop(vet)
        # Traverse other vertices' linked lists, removing all edges containing vet
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """Print the adjacency list"""
        print("Adjacency list =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""Driver Code"""
if __name__ == "__main__":
    # Initialize undirected graph
    v = vals_to_vets([1, 3, 2, 5, 4])
    edges = [
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[3]],
        [v[2], v[4]],
        [v[3], v[4]],
    ]
    graph = GraphAdjList(edges)
    print("\nAfter initialization, the graph is")
    graph.print()

    # Add edge
    # Vertices 1, 2 i.e., v[0], v[2]
    graph.add_edge(v[0], v[2])
    print("\nAfter adding edge 1-2, the graph is")
    graph.print()

    # Remove edge
    # Vertices 1, 3 i.e., v[0], v[1]
    graph.remove_edge(v[0], v[1])
    print("\nAfter removing edge 1-3, the graph is")
    graph.print()

    # Add vertex
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\nAfter adding vertex 6, the graph is")
    graph.print()

    # Remove vertex
    # Vertex 3 i.e., v[1]
    graph.remove_vertex(v[1])
    print("\nAfter removing vertex 3, the graph is")
    graph.print()
