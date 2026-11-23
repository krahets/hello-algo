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
  // Represent the graph with an adjacency list to access all neighbors of a given vertex
  // Vertex traversal sequence
  List<Vertex> res = [];
  // Hash set recording visited vertices
  Set<Vertex> visited = {};
  visited.add(startVet);
  // Use a queue to implement BFS
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // Starting from startVet, loop until all reachable vertices have been visited
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // Dequeue the front vertex
    res.add(vet); // Record the visited vertex
    // Traverse all neighbors of this vertex
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // Skip vertices that have already been visited
      }
      que.add(adjVet); // Enqueue only unvisited vertices
      visited.add(adjVet); // Mark this vertex as visited
    }
  }
  // Return the vertex traversal sequence
  return res;
}

/* Driver code */
void main() {
  /* Initialize the undirected graph */
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
  print("\nGraph after initialization:");
  graph.printAdjList();

  /* Breadth-first traversal */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\nVertex sequence from breadth-first traversal (BFS):");
  print(Vertex.vetsToVals(res));
}
