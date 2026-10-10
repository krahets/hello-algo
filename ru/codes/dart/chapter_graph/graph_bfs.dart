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
  // Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
  // Последовательность обхода вершин
  List<Vertex> res = [];
  // Хеш-множество для хранения уже посещенных вершин
  Set<Vertex> visited = {};
  visited.add(startVet);
  // Очередь используется для реализации BFS
  Queue<Vertex> que = Queue();
  que.add(startVet);
  // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
  while (que.isNotEmpty) {
    Vertex vet = que.removeFirst(); // Извлечь головную вершину из очереди
    res.add(vet); // Отметить посещенную вершину
    // Обойти все смежные вершины данной вершины
    for (Vertex adjVet in graph.adjList[vet]!) {
      if (visited.contains(adjVet)) {
        continue; // Пропустить уже посещенную вершину
      }
      que.add(adjVet); // Помещать в очередь только непосещенные вершины
      visited.add(adjVet); // Отметить эту вершину как посещенную
    }
  }
  // Вернуть последовательность обхода вершин
  return res;
}

/* Dirver Code */
void main() {
  /* Инициализация неориентированного графа */
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
  print("\nГраф после инициализации");
  graph.printAdjList();

  /* Обход в ширину */
  List<Vertex> res = graphBFS(graph, v[0]);
  print("\nПоследовательность вершин при обходе в ширину (BFS)");
  print(Vertex.vetsToVals(res));
}
