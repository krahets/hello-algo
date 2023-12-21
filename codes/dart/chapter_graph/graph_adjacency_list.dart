/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* 基于邻接表实现的无向图类 */
class GraphAdjList {
  // 邻接表，key：顶点，value：该顶点的所有邻接顶点
  Map<Vertex, List<Vertex>> adjList = {};

  /* 构造方法 */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* 获取顶点数量 */
  int size() {
    return adjList.length;
  }

  /* 添加边 */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 添加边 vet1 - vet2
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* 删除边 */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 删除边 vet1 - vet2
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* 添加顶点 */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // 在邻接表中添加一个新链表
    adjList[vet] = [];
  }

  /* 删除顶点 */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // 在邻接表中删除顶点 vet 对应的链表
    adjList.remove(vet);
    // 遍历其他顶点的链表，删除所有包含 vet 的边
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* 打印邻接表 */
  void printAdjList() {
    print("邻接表 =");
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
  /* 初始化无向图 */
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
  print("\n初始化后，图为");
  graph.printAdjList();

  /* 添加边 */
  // 顶点 1, 2 即 v[0], v[2]
  graph.addEdge(v[0], v[2]);
  print("\n添加边 1-2 后，图为");
  graph.printAdjList();

  /* 删除边 */
  // 顶点 1, 3 即 v[0], v[1]
  graph.removeEdge(v[0], v[1]);
  print("\n删除边 1-3 后，图为");
  graph.printAdjList();

  /* 添加顶点 */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\n添加顶点 6 后，图为");
  graph.printAdjList();

  /* 删除顶点 */
  // 顶点 3 即 v[1]
  graph.removeVertex(v[1]);
  print("\n删除顶点 3 后，图为");
  graph.printAdjList();
}
