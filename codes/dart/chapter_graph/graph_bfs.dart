/**
 * File: graph_bfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 广度优先遍历 */
List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
  // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
  // 顶点遍历序列
  List<Vertex> res = [];
  // 哈希集合，用于记录已被访问过的顶点
  Set<Vertex> visited = {};
  visited.add(startVet);
  // 队列用于实现 BFS
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // 以顶点 vet 为起点，循环直至访问完所有顶点
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // 队首顶点出队
    res.add(vet); // 记录访问顶点
    // 遍历该顶点的所有邻接顶点
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // 跳过已被访问的顶点
      }
      que.add(adjVet); // 只入队未访问的顶点
      visited.add(adjVet); // 标记该顶点已被访问
    }
  }
  // 返回顶点遍历序列
  return res;
}

/* Dirver Code */
void main() {
  /* 初始化无向图 */
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
  print("\n初始化后，图为");
  graph.printAdjList();

  /* 广度优先遍历 */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\n广度优先遍历（BFS）顶点序列为");
  print(Vertex.vetsToVals(res));
}
