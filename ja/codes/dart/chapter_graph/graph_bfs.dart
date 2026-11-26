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
  // 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
  // 頂点の訪問順
  List<Vertex> res = [];
  // 訪問済みの頂点を記録するハッシュ集合
  Set<Vertex> visited = {};
  visited.add(startVet);
  // BFS にキューを使う
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // キューの先頭から頂点を取り出す
    res.add(vet); // 訪問した頂点を記録する
    // この頂点の隣接頂点をすべて調べる
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // 訪問済みの頂点を飛ばす
      }
      que.add(adjVet); // 未訪問の頂点だけをキューに追加する
      visited.add(adjVet); // この頂点を訪問済みにする
    }
  }
  // 頂点を訪問順に返す
  return res;
}

/* 実行例 */
void main() {
  /* 無向グラフを初期化する */
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
  print("\n初期化後のグラフ：");
  graph.printAdjList();

  /* 幅優先探索 */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\n幅優先探索（BFS）での頂点の訪問順：");
  print(Vertex.vetsToVals(res));
}
