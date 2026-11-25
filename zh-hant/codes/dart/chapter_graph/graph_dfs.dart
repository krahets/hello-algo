/**
 * File: graph_dfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 深度優先走訪的輔助函式 */
void dfs(
  GraphAdjList graph,
  Set<Vertex> visited,
  List<Vertex> res,
  Vertex vet,
) {
  res.add(vet); // 記錄走訪的頂點
  visited.add(vet); // 將此頂點標記為已走訪
  // 走訪此頂點的所有相鄰頂點
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // 略過已走訪的頂點
    }
    // 遞迴走訪相鄰頂點
    dfs(graph, visited, res, adjVet);
  }
}

/* 深度優先走訪 */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // 頂點走訪順序
  List<Vertex> res = [];
  // 用雜湊集合記錄已走訪的頂點
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* Driver Code */
void main() {
  /* 初始化無向圖 */
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
  print("\n初始化後的圖為");
  graph.printAdjList();

  /* 深度優先走訪 */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\n深度優先走訪（DFS）的頂點順序為");
  print(Vertex.vetsToVals(res));
}
