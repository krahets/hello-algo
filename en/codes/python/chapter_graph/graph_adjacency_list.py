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
    """Undirected graph class implemented with an adjacency list"""

    def __init__(self, edges: list[list[Vertex]]):
        """Constructor"""
        # Adjacency list: key is a vertex, value is the list of all its neighbors
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
        """Add an edge"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Add edge vet1 - vet2
        self.adj_list[vet1].append(vet2)
        self.adj_list[vet2].append(vet1)

    def remove_edge(self, vet1: Vertex, vet2: Vertex):
        """Remove an edge"""
        if vet1 not in self.adj_list or vet2 not in self.adj_list or vet1 == vet2:
            raise ValueError()
        # Remove edge vet1 - vet2
        self.adj_list[vet1].remove(vet2)
        self.adj_list[vet2].remove(vet1)

    def add_vertex(self, vet: Vertex):
        """Add a vertex"""
        if vet in self.adj_list:
            return
        # Add a new list to the adjacency list
        self.adj_list[vet] = []

    def remove_vertex(self, vet: Vertex):
        """Remove a vertex"""
        if vet not in self.adj_list:
            raise ValueError()
        # Remove the list corresponding to vertex vet from the adjacency list
        self.adj_list.pop(vet)
        # Traverse the lists of the other vertices and remove all edges incident to vet
        for vertex in self.adj_list:
            if vet in self.adj_list[vertex]:
                self.adj_list[vertex].remove(vet)

    def print(self):
        """Print the adjacency list"""
        print("Adjacency list =")
        for vertex in self.adj_list:
            tmp = [v.val for v in self.adj_list[vertex]]
            print(f"{vertex.val}: {tmp},")


"""Driver code"""
if __name__ == "__main__":
    # Initialize the undirected graph
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
    print("\nGraph after initialization:")
    graph.print()

    # Add an edge
    # Vertices 1 and 2 are v[0] and v[2]
    graph.add_edge(v[0], v[2])
    print("\nGraph after adding edge 1-2:")
    graph.print()

    # Remove an edge
    # Vertices 1 and 3 are v[0] and v[1]
    graph.remove_edge(v[0], v[1])
    print("\nGraph after removing edge 1-3:")
    graph.print()

    # Add a vertex
    v5 = Vertex(6)
    graph.add_vertex(v5)
    print("\nGraph after adding vertex 6:")
    graph.print()

    # Remove a vertex
    # Vertex 3 is v[1]
    graph.remove_vertex(v[1])
    print("\nGraph after removing vertex 3:")
    graph.print()
