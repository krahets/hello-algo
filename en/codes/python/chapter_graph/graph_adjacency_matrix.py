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
    """Undirected graph class based on adjacency matrix"""

    def __init__(self, vertices: list[int], edges: list[list[int]]):
        """Constructor"""
        # Vertex list, elements represent "vertex value", index represents "vertex index"
        self.vertices: list[int] = []
        # Adjacency matrix, row and column indices correspond to "vertex index"
        self.adj_mat: list[list[int]] = []
        # Add vertex
        for val in vertices:
            self.add_vertex(val)
        # Add edge
        # Edges elements represent vertex indices
        for e in edges:
            self.add_edge(e[0], e[1])

    def size(self) -> int:
        """Get the number of vertices"""
        return len(self.vertices)

    def add_vertex(self, val: int):
        """Add vertex"""
        n = self.size()
        # Add new vertex value to the vertex list
        self.vertices.append(val)
        # Add a row to the adjacency matrix
        new_row = [0] * n
        self.adj_mat.append(new_row)
        # Add a column to the adjacency matrix
        for row in self.adj_mat:
            row.append(0)

    def remove_vertex(self, index: int):
        """Remove vertex"""
        if index >= self.size():
            raise IndexError()
        # Remove vertex at `index` from the vertex list
        self.vertices.pop(index)
        # Remove the row at `index` from the adjacency matrix
        self.adj_mat.pop(index)
        # Remove the column at `index` from the adjacency matrix
        for row in self.adj_mat:
            row.pop(index)

    def add_edge(self, i: int, j: int):
        """Add edge"""
        # Parameters i, j correspond to vertices element indices
        # Handle index out of bounds and equality
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        # In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., satisfies (i, j) == (j, i)
        self.adj_mat[i][j] = 1
        self.adj_mat[j][i] = 1

    def remove_edge(self, i: int, j: int):
        """Remove edge"""
        # Parameters i, j correspond to vertices element indices
        # Handle index out of bounds and equality
        if i < 0 or j < 0 or i >= self.size() or j >= self.size() or i == j:
            raise IndexError()
        self.adj_mat[i][j] = 0
        self.adj_mat[j][i] = 0

    def print(self):
        """Print adjacency matrix"""
        print("Vertex list =", self.vertices)
        print("Adjacency matrix =")
        print_matrix(self.adj_mat)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize undirected graph
    # Edges elements represent vertex indices
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = GraphAdjMat(vertices, edges)
    print("\nAfter initialization, the graph is")
    graph.print()

    # Add edge
    # Indices of vertices 1, 2 are 0, 2 respectively
    graph.add_edge(0, 2)
    print("\nAfter adding edge 1-2, the graph is")
    graph.print()

    # Remove edge
    # Indices of vertices 1, 3 are 0, 1 respectively
    graph.remove_edge(0, 1)
    print("\nAfter removing edge 1-3, the graph is")
    graph.print()

    # Add vertex
    graph.add_vertex(6)
    print("\nAfter adding vertex 6, the graph is")
    graph.print()

    # Remove vertex
    # Index of vertex 3 is 1
    graph.remove_vertex(1)
    print("\nAfter removing vertex 3, the graph is")
    graph.print()
