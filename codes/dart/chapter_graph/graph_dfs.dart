/**
 * File: graph_dfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 深度优先遍历辅助函数 */
void dfs(
  GraphAdjList graph,
  Set<Vertex> visited,
  List<Vertex> res,
  Vertex vet,
) {
  res.add(vet); // 记录访问顶点
  visited.add(vet); // 标记该顶点已被访问
  // 遍历该顶点的所有邻接顶点
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // 跳过已被访问的顶点
    }
    // 递归访问邻接顶点
    dfs(graph, visited, res, adjVet);
  }
}

/* 深度优先遍历 */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // 顶点遍历序列
  List<Vertex> res = [];
  // 哈希表，用于记录已被访问过的顶点
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* Driver Code */
void main() {
  /* 初始化无向图 */
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
  print("\n初始化后，图为");
  graph.printAdjList();

  /* 深度优先遍历 */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\n深度优先遍历（DFS）顶点序列为");
  print(Vertex.vetsToVals(res));
}
