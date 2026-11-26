/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* 以鄰接串列實作的無向圖類別 */
class GraphAdjList {
  // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
  Map<Vertex, List<Vertex>> adjList = {};

  /* 建構式 */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* 取得頂點數量 */
  int size() {
    return adjList.length;
  }

  /* 新增邊 */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 新增邊 vet1 - vet2
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* 刪除邊 */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 刪除邊 vet1 - vet2
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* 新增頂點 */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // 在鄰接串列中新增一條鏈結串列
    adjList[vet] = [];
  }

  /* 刪除頂點 */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
    adjList.remove(vet);
    // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* 印出鄰接串列 */
  void printAdjList() {
    print("鄰接串列 =");
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
  /* 初始化無向圖 */
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
  print("\n初始化後的圖為");
  graph.printAdjList();

  /* 新增邊 */
  // 頂點 1、2 分別是 v[0]、v[2]
  graph.addEdge(v[0], v[2]);
  print("\n新增邊 1-2 後的圖為");
  graph.printAdjList();

  /* 刪除邊 */
  // 頂點 1、3 分別是 v[0]、v[1]
  graph.removeEdge(v[0], v[1]);
  print("\n刪除邊 1-3 後的圖為");
  graph.printAdjList();

  /* 新增頂點 */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\n新增頂點 6 後的圖為");
  graph.printAdjList();

  /* 刪除頂點 */
  // 頂點 3 是 v[1]
  graph.removeVertex(v[1]);
  print("\n刪除頂點 3 後的圖為");
  graph.printAdjList();
}
