/**
 * File: graph_bfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* Breadth-first traversal */
List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
  // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
  // Vertex traversal sequence
  List<Vertex> res = [];
  // Hash set, used to record visited vertices
  Set<Vertex> visited = {};
  visited.add(startVet);
  // Queue used to implement BFS
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // Starting from vertex vet, loop until all vertices are visited
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // Dequeue the vertex at the head of the queue
    res.add(vet); // Record visited vertex
    // Traverse all adjacent vertices of that vertex
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // Skip already visited vertices
      }
      que.add(adjVet); // Only enqueue unvisited vertices
      visited.add(adjVet); // Mark the vertex as visited
    }
  }
  // Return the vertex traversal sequence
  return res;
}

/* Dirver Code */
void main() {
  /* Initialize undirected graph */
  List<Vertex> v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  List<List<Vertex>> edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[1], v[4]],
    [v[2], v[5]],
    [v[3], v[4]],
    [v[3], v[6]],
    [v[4], v[5]],
    [v[4], v[7]],
    [v[5], v[8]],
    [v[6], v[7]],
    [v[7], v[8]],
  ];
  GraphAdjList graph = GraphAdjList(edges);
  print("\nAfter initialization, the graph is");
  graph.printAdjList();

  /* Breadth-first traversal */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\nBreadth-first traversal (BFS) vertex sequence is");
  print(Vertex.vetsToVals(res));
}
