/**
 * File: graph_dfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 深さ優先走査の補助関数 */
void dfs(
  GraphAdjList graph,
  Set<Vertex> visited,
  List<Vertex> res,
  Vertex vet,
) {
  res.add(vet); // 訪問した頂点を記録
  visited.add(vet); // この頂点を訪問済みにする
  // この頂点のすべての隣接頂点を走査
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // 訪問済みの頂点をスキップ
    }
    // 隣接頂点を再帰的に訪問
    dfs(graph, visited, res, adjVet);
  }
}

/* 深さ優先探索 */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // 頂点の走査順序
  List<Vertex> res = [];
  // 訪問済み頂点を記録するためのハッシュ集合
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* Driver Code */
void main() {
  /* 無向グラフを初期化 */
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
  print("\n初期化後、グラフは");
  graph.printAdjList();

  /* 深さ優先探索 */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\n深さ優先探索（DFS）頂点列");
  print(Vertex.vetsToVals(res));
}
