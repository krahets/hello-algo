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
  res.add(vet); // Отметить посещенную вершину
  visited.add(vet); // Отметить эту вершину как посещенную
  // Обойти все смежные вершины данной вершины
  for (Vertex adjVet in graph.adjList[vet]!) {
    if (visited.contains(adjVet)) {
      continue; // Пропустить уже посещенную вершину
    }
    // Рекурсивно обходить смежные вершины
    dfs(graph, visited, res, adjVet);
  }
}

/* Обход в глубину */
List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
  // Последовательность обхода вершин
  List<Vertex> res = [];
  // Хеш-множество для хранения уже посещенных вершин
  Set<Vertex> visited = {};
  dfs(graph, visited, res, startVet);
  return res;
}

/* Driver Code */
void main() {
  /* Инициализация неориентированного графа */
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
  print("\nГраф после инициализации");
  graph.printAdjList();

  /* Обход в глубину */
  List<Vertex> res = graphDFS(graph, v[0]);
  print("\nПоследовательность вершин при обходе в глубину (DFS)");
  print(Vertex.vetsToVals(res));
}
