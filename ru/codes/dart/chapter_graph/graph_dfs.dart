/**
 * File: graph_dfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* Вспомогательная функция обхода в глубину */
void dfs(
  GraphAdjList graph,
  Set<Vertex> visited,
  List<Vertex> res,
  Vertex vet,
) {
  res.add(vet); // Записать посещённую вершину
  visited.add(vet); // Отметить вершину как посещённую
  // Перебрать всех соседей этой вершины
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // Пропустить посещённые вершины
    }
    // Рекурсивно посетить соседнюю вершину
    dfs(graph, visited, res, adjVet);
  }
}

/* Обход в глубину */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // Порядок обхода вершин
  List<Vertex> res = [];
  // Хеш-множество посещённых вершин
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* Пример использования */
void main() {
  /* Инициализировать неориентированный граф */
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
  print("\nГраф после инициализации:");
  graph.printAdjList();

  /* Обход в глубину */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\nПорядок обхода вершин в глубину (DFS):");
  print(Vertex.vetsToVals(res));
}
