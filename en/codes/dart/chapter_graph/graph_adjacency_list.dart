/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* Undirected graph represented by an adjacency list */
class GraphAdjList {
  // Adjacency list: each vertex maps to its neighbors
  Map<Vertex, List<Vertex>> adjList = {};

  /* Constructor */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* Get the vertex count */
  int size() {
    return adjList.length;
  }

  /* Add an edge */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Add the edge vet1 - vet2
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* Remove an edge */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Remove the edge vet1 - vet2
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* Add a vertex */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // Add a new linked list to the adjacency list
    adjList[vet] = [];
  }

  /* Remove a vertex */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // Remove the linked list for vertex vet from the adjacency list
    adjList.remove(vet);
    // Traverse the other vertices' lists and remove every edge incident to vet
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* Print the adjacency list */
  void printAdjList() {
    print("Adjacency list =");
    adjList.forEach((key, value) {
      List<int> tmp = [];
      for (Vertex vertex in value) {
        tmp.add(vertex.val);
      }
      print("${key.val}: $tmp,");
    });
  }
}

/* Driver code */
void main() {
  /* Initialize an undirected graph */
  List<Vertex> v = Vertex.valsToVets([1, 3, 2, 5, 4]);
  List<List<Vertex>> edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[3]],
    [v[2], v[4]],
    [v[3], v[4]],
  ];
  GraphAdjList graph = GraphAdjList(edges);
  print("\nGraph after initialization:");
  graph.printAdjList();

  /* Add an edge */
  // Vertices 1 and 2 are v[0] and v[2], respectively
  graph.addEdge(v[0], v[2]);
  print("\nGraph after adding edge 1-2:");
  graph.printAdjList();

  /* Remove an edge */
  // Vertices 1 and 3 are v[0] and v[1], respectively
  graph.removeEdge(v[0], v[1]);
  print("\nGraph after removing edge 1-3:");
  graph.printAdjList();

  /* Add a vertex */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\nGraph after adding vertex 6:");
  graph.printAdjList();

  /* Remove a vertex */
  // Vertex 3 is v[1]
  graph.removeVertex(v[1]);
  print("\nGraph after removing vertex 3:");
  graph.printAdjList();
}
