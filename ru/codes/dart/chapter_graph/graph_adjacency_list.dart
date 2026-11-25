/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* Неориентированный граф на списках смежности */
class GraphAdjList {
  // Список смежности: ключ — вершина, значение — все её соседи
  Map<Vertex, List<Vertex>> adjList = {};

  /* Конструктор */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* Получить число вершин */
  int size() {
    return adjList.length;
  }

  /* Добавить ребро */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Добавить ребро vet1 — vet2
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* Удалить ребро */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Удалить ребро vet1 — vet2
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* Добавить вершину */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // Добавить новый связный список в список смежности
    adjList[vet] = [];
  }

  /* Удалить вершину */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // Удалить из списка смежности список вершины vet
    adjList.remove(vet);
    // Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* Вывести список смежности */
  void printAdjList() {
    print("Список смежности =");
    adjList.forEach((key, value) {
      List<int> tmp = [];
      for (Vertex vertex in value) {
        tmp.add(vertex.val);
      }
      print("${key.val}: $tmp,");
    });
  }
}

/* Пример использования */
void main() {
  /* Инициализировать неориентированный граф */
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
  print("\nГраф после инициализации:");
  graph.printAdjList();

  /* Добавить ребро */
  // Вершинам 1 и 2 соответствуют v[0] и v[2]
  graph.addEdge(v[0], v[2]);
  print("\nГраф после добавления ребра 1–2:");
  graph.printAdjList();

  /* Удалить ребро */
  // Вершинам 1 и 3 соответствуют v[0] и v[1]
  graph.removeEdge(v[0], v[1]);
  print("\nГраф после удаления ребра 1–3:");
  graph.printAdjList();

  /* Добавить вершину */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\nГраф после добавления вершины 6:");
  graph.printAdjList();

  /* Удалить вершину */
  // Вершине 3 соответствует v[1]
  graph.removeVertex(v[1]);
  print("\nГраф после удаления вершины 3:");
  graph.printAdjList();
}
