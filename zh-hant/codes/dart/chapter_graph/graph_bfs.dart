/**
 * File: graph_bfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 廣度優先走訪 */
List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
  // 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
  // 頂點走訪序列
  List<Vertex> res = [];
  // 雜湊集合，用於記錄已被訪問過的頂點
  Set<Vertex> visited = {};
  visited.add(startVet);
  // 佇列用於實現 BFS
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // 佇列首頂點出隊
    res.add(vet); // 記錄訪問頂點
    // 走訪該頂點的所有鄰接頂點
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // 跳過已被訪問的頂點
      }
      que.add(adjVet); // 只入列未訪問的頂點
      visited.add(adjVet); // 標記該頂點已被訪問
    }
  }
  // 返回頂點走訪序列
  return res;
}

/* Dirver Code */
void main() {
  /* 初始化無向圖 */
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
  print("\n初始化後，圖為");
  graph.printAdjList();

  /* 廣度優先走訪 */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\n廣度優先走訪（BFS）頂點序列為");
  print(Vertex.vetsToVals(res));
}
