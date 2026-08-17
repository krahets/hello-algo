/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
  List<int> vertices = []; // Vertex elements, elements represent "vertex values", indices represent "vertex indices"
  List<List<int>> adjMat = []; // Adjacency matrix, where the row and column indices correspond to the "vertex index"

  /* Constructor */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // Add vertex
    for (int val in vertices) {
      addVertex(val);
    }
    // Add edge
    // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* Get the number of vertices */
  int size() {
    return vertices.length;
  }

  /* Add vertex */
  void addVertex(int val) {
    int n = size();
    // Add the value of the new vertex to the vertex list
    vertices.add(val);
    // Add a row to the adjacency matrix
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // Add a column to the adjacency matrix
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* Remove vertex */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // Remove the vertex at index from the vertex list
    vertices.removeAt(index);
    // Remove the row at index from the adjacency matrix
    adjMat.removeAt(index);
    // Remove the column at index from the adjacency matrix
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* Add edge */
  // Parameters i, j correspond to the vertices element indices
  void addEdge(int i, int j) {
    // Handle index out of bounds and equality
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* Remove edge */
  // Parameters i, j correspond to the vertices element indices
  void removeEdge(int i, int j) {
    // Handle index out of bounds and equality
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* Print adjacency matrix */
  void printAdjMat() {
    print("Vertex list = $vertices");
    print("Adjacency matrix = ");
    printMatrix(adjMat);
  }
}

/* Driver Code */
void main() {
  /* Add edge */
  // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
  List<int> vertices = [1, 3, 2, 5, 4];
  List<List<int>> edges = [
    [0, 1],
    [0, 3],
    [1, 2],
    [2, 3],
    [2, 4],
    [3, 4],
  ];
  GraphAdjMat graph = GraphAdjMat(vertices, edges);
  print("\nAfter initialization, graph is");
  graph.printAdjMat();

  /* Add edge */
  // Add vertex
  graph.addEdge(0, 2);
  print("\nAfter adding edge 1-2, graph is");
  graph.printAdjMat();

  /* Remove edge */
  // Vertices 1, 3 have indices 0, 1 respectively
  graph.removeEdge(0, 1);
  print("\nAfter removing edge 1-3, graph is");
  graph.printAdjMat();

  /* Add vertex */
  graph.addVertex(6);
  print("\nAfter adding vertex 6, graph is");
  graph.printAdjMat();

  /* Remove vertex */
  // Vertex 3 has index 1
  graph.removeVertex(1);
  print("\nAfter removing vertex 3, graph is");
  graph.printAdjMat();
}
