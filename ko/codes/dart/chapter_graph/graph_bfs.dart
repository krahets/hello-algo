/**
 * File: graph_bfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 너비 우선 순회 */
List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
  // 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
  // 정점 순회 순서
  List<Vertex> res = [];
  // 방문한 정점을 기록하는 해시 집합
  Set<Vertex> visited = {};
  visited.add(startVet);
  // 큐를 사용하여 BFS를 구현한다
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // 큐 맨 앞의 정점을 꺼낸다
    res.add(vet); // 방문한 정점을 기록한다
    // 해당 정점의 모든 인접 정점을 순회한다
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // 이미 방문한 정점은 건너뛴다
      }
      que.add(adjVet); // 방문하지 않은 정점만 큐에 삽입한다
      visited.add(adjVet); // 해당 정점을 방문했다고 표시한다
    }
  }
  // 정점 순회 순서를 반환한다
  return res;
}

/* 실행 코드 */
void main() {
  /* 무방향 그래프 초기화 */
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
  print("\n초기화한 후의 그래프");
  graph.printAdjList();

  /* 너비 우선 순회 */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\n너비 우선 순회(BFS)의 정점 순서");
  print(Vertex.vetsToVals(res));
}
