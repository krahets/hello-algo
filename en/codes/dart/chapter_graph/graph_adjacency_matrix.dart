/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Undirected graph class implemented with an adjacency matrix */
class GraphAdjMat {
  List<int> vertices = []; // Vertex entries: each element is a vertex value, and its index is the vertex index
  List<List<int>> adjMat = []; //Adjacency matrix: row and column indices correspond to vertex indices

  /* Constructor */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // Add a vertex
    for (int val in vertices) {
      addVertex(val);
    }
    // Add an edge
    // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* Get the number of vertices */
  int size() {
    return vertices.length;
  }

  /* Add a vertex */
  void addVertex(int val) {
    int n = size();
    // Append the new vertex value to the vertex list
    vertices.add(val);
    // Add a row to the adjacency matrix
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // Add a column to the adjacency matrix
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* Remove a vertex */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // Remove the vertex at index `index` from the vertex list
    vertices.removeAt(index);
    // Remove row `index` from the adjacency matrix
    adjMat.removeAt(index);
    // Remove column `index` from the adjacency matrix
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* Add an edge */
  // Parameters i and j are element indices in vertices
  void addEdge(int i, int j) {
    // Handle out-of-bounds or equal indices
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* Remove an edge */
  // Parameters i and j are element indices in vertices
  void removeEdge(int i, int j) {
    // Handle out-of-bounds or equal indices
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* Print the adjacency matrix */
  void printAdjMat() {
    print("Vertex list = $vertices");
    print("Adjacency matrix = ");
    printMatrix(adjMat);
  }
}

/* Driver code */
void main() {
  /* Initialize the undirected graph */
  // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
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
  print("\nGraph after initialization:");
  graph.printAdjMat();

  /* Add an edge */
  // Vertices 1 and 2 have indices 0 and 2, respectively
  graph.addEdge(0, 2);
  print("\nGraph after adding edge 1-2:");
  graph.printAdjMat();

  /* Remove an edge */
  // Vertices 1 and 3 have indices 0 and 1, respectively
  graph.removeEdge(0, 1);
  print("\nGraph after removing edge 1-3:");
  graph.printAdjMat();

  /* Add a vertex */
  graph.addVertex(6);
  print("\nGraph after adding vertex 6:");
  graph.printAdjMat();

  /* Remove a vertex */
  // Vertex 3 has index 1
  graph.removeVertex(1);
  print("\nGraph after removing vertex 3:");
  graph.printAdjMat();
}
