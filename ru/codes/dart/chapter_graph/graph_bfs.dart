/**
 * File: graph_bfs.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

import '../utils/vertex.dart';
import 'graph_adjacency_list.dart';

/* Обход в ширину */
List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
  // Список смежности позволяет получить всех соседей заданной вершины
  // Порядок обхода вершин
  List<Vertex> res = [];
  // Хеш-множество посещённых вершин
  Set<Vertex> visited = {};
  visited.add(startVet);
  // Очередь для обхода BFS
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // Начать с вершины vet и повторять, пока не будут посещены все вершины
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // Извлечь первую вершину из очереди
    res.add(vet); // Записать посещённую вершину
    // Перебрать всех соседей этой вершины
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // Пропустить посещённые вершины
      }
      que.add(adjVet); // Добавить в очередь только непосещённые вершины
      visited.add(adjVet); // Отметить вершину как посещённую
    }
  }
  // Вернуть порядок обхода вершин
  return res;
}

/* Пример использования */
void main() {
  /* Инициализировать неориентированный граф */
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
  print("\nГраф после инициализации:");
  graph.printAdjList();

  /* Обход в ширину */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\nПорядок обхода вершин в ширину (BFS):");
  print(Vertex.vetsToVals(res));
}
