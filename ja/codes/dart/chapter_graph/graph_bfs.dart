/**
 * File: graph_bfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 幅優先探索 */
List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
  // 指定した頂点の隣接頂点をすべて取得できるよう、隣接リストでグラフを表現する
  // 頂点の走査順序
  List<Vertex> res = [];
  // 訪問済み頂点を記録するためのハッシュ集合
  Set<Vertex> visited = {};
  visited.add(startVet);
  // BFS の実装にキューを用いる
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // 先頭の頂点をデキュー
    res.add(vet); // 訪問した頂点を記録
    // この頂点のすべての隣接頂点を走査
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // 訪問済みの頂点をスキップ
      }
      que.add(adjVet); // 未訪問の頂点のみをキューに追加
      visited.add(adjVet); // この頂点を訪問済みにする
    }
  }
  // 頂点の走査順を返す
  return res;
}

/* Dirver Code */
void main() {
  /* 無向グラフを初期化 */
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
  print("\n初期化後、グラフは");
  graph.printAdjList();

  /* 幅優先探索 */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\n幅優先探索（BFS）頂点列");
  print(Vertex.vetsToVals(res));
}
