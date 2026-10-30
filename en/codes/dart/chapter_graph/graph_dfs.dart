/**
 * File: graph_dfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* Depth-first traversal helper function */
void dfs(
  GraphAdjList graph,
  Set<Vertex> visited,
  List<Vertex> res,
  Vertex vet,
) {
  res.add(vet); // Record the visited vertex
  visited.add(vet); // Mark this vertex as visited
  // Traverse all neighbors of this vertex
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // Skip vertices that have already been visited
    }
    // Recursively visit the neighboring vertex
    dfs(graph, visited, res, adjVet);
  }
}

/* Depth-first traversal */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // Vertex traversal sequence
  List<Vertex> res = [];
  // Hash set recording visited vertices
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* Driver code */
void main() {
  /* Initialize the undirected graph */
  List<Vertex> v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6]);
  List<List<Vertex>> edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
  ];
  GraphAdjList graph = GraphAdjList(edges);
  print("\nGraph after initialization:");
  graph.printAdjList();

  /* Depth-first traversal */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\nVertex sequence from depth-first traversal (DFS):");
  print(Vertex.vetsToVals(res));
}
