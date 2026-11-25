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
    """Undirected graph represented by an adjacency matrix"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """Constructor"""
        # Vertex list: each element holds a vertex value, and its position is the vertex index
        self.vertices: list[int] = []
        # Adjacency matrix: row and column indices are vertex indices
        self.adj_mat: list[list[int]] = []
        # Add a vertex
        for val in vertices:
            self.add_vertex(val)
        # Add an edge
        # The entries in edges are vertex indices, that is, indices into vertices
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """Get the vertex count"""
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
        # Remove the vertex at the specified index from the vertex list
        self.vertices.pop(index)
        # Remove the row at the specified index from the adjacency matrix
        self.adj_mat.pop(index)
        # Remove the column at the specified index from the adjacency matrix
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """Add an edge"""
        # Parameters i and j are indices into vertices
        # Check for out-of-bounds or equal indices
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # An undirected graph has a symmetric adjacency matrix: (i, j) == (j, i)
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """Remove an edge"""
        # Parameters i and j are indices into vertices
        # Check for out-of-bounds or equal indices
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """Print the adjacency matrix"""
        print("Vertex list =", self.vertices)
        print("Adjacency matrix =")
        print_matrix(self.adj_mat)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize an undirected graph
    # The entries in edges are vertex indices, that is, indices into vertices
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
