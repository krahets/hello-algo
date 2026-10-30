"""
File: graph_adjacency_matrix.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import Vertex, print_matrix


class GraphAdjMat:
    """Undirected graph class implemented with an adjacency matrix"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """Constructor"""
        # Vertex list: elements are vertex values, and indices are vertex indices
        self.vertices: list[int] = []
        # Adjacency matrix: row and column indices correspond to vertex indices
        self.adj_mat: list[list[int]] = []
        # Add a vertex
        for val in vertices:
            self.add_vertex(val)
        # Add an edge
        # Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """Get the number of vertices"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """Add a vertex"""
        n = self.size()
        # Append the new vertex value to the vertex list
        self.vertices.append(val)
        # Add a row to the adjacency matrix
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # Add a column to the adjacency matrix
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """Remove a vertex"""
        if index >= self.size():
            raise IndexError()
        # Remove the vertex at index `index` from the vertex list
        self.vertices.pop(index)
        # Remove row `index` from the adjacency matrix
        self.adj_mat.pop(index)
        # Remove column `index` from the adjacency matrix
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """Add an edge"""
        # Parameters i and j are element indices in vertices
        # Handle out-of-bounds or equal indices
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """Remove an edge"""
        # Parameters i and j are element indices in vertices
        # Handle out-of-bounds or equal indices
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """Print the adjacency matrix"""
        print("Vertex list =", self.vertices)
        print("Adjacency matrix =")
        print_matrix(self.adj_mat)


"""Driver code"""
if __name__ == "__main__":
    # Initialize the undirected graph
    # Note that the entries in edges are vertex indices, corresponding to element indices in vertices
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\nGraph after initialization:")
    graph.print()

    # Add an edge
    # Vertices 1 and 2 have indices 0 and 2, respectively
    graph.add_edge(0, 2)
    print("\nGraph after adding edge 1-2:")
    graph.print()

    # Remove an edge
    # Vertices 1 and 3 have indices 0 and 1, respectively
    graph.remove_edge(0, 1)
    print("\nGraph after removing edge 1-3:")
    graph.print()

    # Add a vertex
    graph.add_vertex(6)
    print("\nGraph after adding vertex 6:")
    graph.print()

    # Remove a vertex
    # Vertex 3 has index 1
    graph.remove_vertex(1)
    print("\nGraph after removing vertex 3:")
    graph.print()
