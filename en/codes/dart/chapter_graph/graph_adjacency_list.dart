/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* Undirected graph class based on adjacency list */
class GraphAdjList {
  // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
  Map<Vertex, List<Vertex>> adjList = {};

  /* Constructor */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* Get the number of vertices */
  int size() {
    return adjList.length;
  }

  /* Add edge */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Add edge vet1 - vet2
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* Remove edge */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Remove edge vet1 - vet2
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* Add vertex */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // Add a new linked list to the adjacency list
    adjList[vet] = [];
  }

  /* Remove vertex */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // Remove the vertex vet's corresponding linked list from the adjacency list
    adjList.remove(vet);
    // Traverse other vertices' linked lists, removing all edges containing vet
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

/* Driver Code */
void main() {
  /* Initialize undirected graph */
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
  print("\nAfter initialization, the graph is");
  graph.printAdjList();

  /* Add edge */
  // Vertices 1, 2 i.e., v[0], v[2]
  graph.addEdge(v[0], v[2]);
  print("\nAfter adding edge 1-2, the graph is");
  graph.printAdjList();

  /* Remove edge */
  // Vertices 1, 3 i.e., v[0], v[1]
  graph.removeEdge(v[0], v[1]);
  print("\nAfter removing edge 1-3, the graph is");
  graph.printAdjList();

  /* Add vertex */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\nAfter adding vertex 6, the graph is");
  graph.printAdjList();

  /* Remove vertex */
  // Vertex 3 i.e., v[1]
  graph.removeVertex(v[1]);
  print("\nAfter removing vertex 3, the graph is");
  graph.printAdjList();
}
