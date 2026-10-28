/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
class GraphAdjList {
  // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
  Map<Vertex, List<Vertex>> adjList = {};

  /* 생성자 */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* 정점 개수 반환 */
  int size() {
    return adjList.length;
  }

  /* 간선 추가 */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 간선 vet1 - vet2를 추가한다
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* 간선 삭제 */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // 간선 vet1 - vet2를 삭제한다
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* 정점 추가 */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // 인접 리스트에 새 연결 리스트를 추가한다
    adjList[vet] = [];
  }

  /* 정점 삭제 */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
    adjList.remove(vet);
    // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* 인접 리스트 출력 */
  void printAdjList() {
    print("인접 리스트 =");
    adjList.forEach((key, value) {
      List<int> tmp = [];
      for (Vertex vertex in value) {
        tmp.add(vertex.val);
      }
      print("${key.val}: $tmp,");
    });
  }
}

/* 실행 코드 */
void main() {
  /* 무방향 그래프 초기화 */
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
  print("\n초기화한 후의 그래프");
  graph.printAdjList();

  /* 간선 추가 */
  // 정점 1, 2는 각각 v[0], v[2]이다
  graph.addEdge(v[0], v[2]);
  print("\n간선 1-2를 추가한 후의 그래프");
  graph.printAdjList();

  /* 간선 삭제 */
  // 정점 1, 3은 각각 v[0], v[1]이다
  graph.removeEdge(v[0], v[1]);
  print("\n간선 1-3을 삭제한 후의 그래프");
  graph.printAdjList();

  /* 정점 추가 */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\n정점 6을 추가한 후의 그래프");
  graph.printAdjList();

  /* 정점 삭제 */
  // 정점 3은 v[1]이다
  graph.removeVertex(v[1]);
  print("\n정점 3을 삭제한 후의 그래프");
  graph.printAdjList();
}
