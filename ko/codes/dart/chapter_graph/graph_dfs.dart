/**
 * File: graph_dfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* 깊이 우선 순회 보조 함수 */
void dfs(
  GraphAdjList graph,
  Set<Vertex> visited,
  List<Vertex> res,
  Vertex vet,
) {
  res.add(vet); // 방문한 정점을 기록한다
  visited.add(vet); // 해당 정점을 방문했다고 표시한다
  // 해당 정점의 모든 인접 정점을 순회한다
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // 이미 방문한 정점은 건너뛴다
    }
    // 인접 정점을 재귀적으로 방문한다
    dfs(graph, visited, res, adjVet);
  }
}

/* 깊이 우선 순회 */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // 정점 순회 순서
  List<Vertex> res = [];
  // 방문한 정점을 기록하는 해시 집합
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* 실행 코드 */
void main() {
  /* 무방향 그래프 초기화 */
  List<Vertex> v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6]);
  List<List<Vertex>> edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
  ];
  GraphAdjList graph = GraphAdjList(edges);
  print("\n초기화한 후의 그래프");
  graph.printAdjList();

  /* 깊이 우선 순회 */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\n깊이 우선 순회(DFS)의 정점 순서");
  print(Vertex.vetsToVals(res));
}
