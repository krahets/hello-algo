/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* 基於鄰接表實現的無向圖類別 */
class GraphAdjList {
  // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
  Map<Vertex, List<Vertex>> adjList = {};

  /* 建構子 */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* 獲取頂點數量 */
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
    // 在鄰接表中新增一個新鏈結串列
    adjList[vet] = [];
  }

  /* 刪除頂點 */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // 在鄰接表中刪除頂點 vet 對應的鏈結串列
    adjList.remove(vet);
    // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* 列印鄰接表 */
  void printAdjList() {
    print("鄰接表 =");
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
  print("\n初始化後，圖為");
  graph.printAdjList();

  /* 新增邊 */
  // 頂點 1, 2 即 v[0], v[2]
  graph.addEdge(v[0], v[2]);
  print("\n新增邊 1-2 後，圖為");
  graph.printAdjList();

  /* 刪除邊 */
  // 頂點 1, 3 即 v[0], v[1]
  graph.removeEdge(v[0], v[1]);
  print("\n刪除邊 1-3 後，圖為");
  graph.printAdjList();

  /* 新增頂點 */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\n新增頂點 6 後，圖為");
  graph.printAdjList();

  /* 刪除頂點 */
  // 頂點 3 即 v[1]
  graph.removeVertex(v[1]);
  print("\n刪除頂點 3 後，圖為");
  graph.printAdjList();
}
