/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* 隣接リストで実装した無向グラフクラス */
class GraphAdjList {
  // 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
  Map<Vertex, List<Vertex>> adjList = {};

  /* コンストラクタ */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* 頂点数を取得する */
  int size() {
    return adjList.length;
  }

  /* 辺を追加する */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 辺 vet1 - vet2 を追加する
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* 辺を削除する */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 辺 vet1 - vet2 を削除する
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* 頂点を追加する */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // 隣接リストに新しい連結リストを追加する
    adjList[vet] = [];
  }

  /* 頂点を削除する */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // 隣接リストから頂点 vet に対応する連結リストを削除する
    adjList.remove(vet);
    // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* 隣接リストを表示する */
  void printAdjList() {
    print("隣接リスト =");
    adjList.forEach((key, value) {
      List<int> tmp = [];
      for (Vertex vertex in value) {
        tmp.add(vertex.val);
      }
      print("${key.val}: $tmp,");
    });
  }
}

/* 実行用コード */
void main() {
  /* 無向グラフを初期化する */
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
  print("\n初期化後のグラフ");
  graph.printAdjList();

  /* 辺を追加する */
  // 頂点 1, 2 は v[0], v[2] に対応する
  graph.addEdge(v[0], v[2]);
  print("\n辺 1-2 を追加した後のグラフ");
  graph.printAdjList();

  /* 辺を削除する */
  // 頂点 1, 3 は v[0], v[1] に対応する
  graph.removeEdge(v[0], v[1]);
  print("\n辺 1-3 を削除した後のグラフ");
  graph.printAdjList();

  /* 頂点を追加する */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\n頂点 6 を追加した後のグラフ");
  graph.printAdjList();

  /* 頂点を削除する */
  // 頂点 3 は v[1] に対応する
  graph.removeVertex(v[1]);
  print("\n頂点 3 を削除した後のグラフ");
  graph.printAdjList();
}
