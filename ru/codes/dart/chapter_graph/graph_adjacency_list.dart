/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* Класс неориентированного графа на основе списка смежности */
class GraphAdjList {
  // Список смежности, где key — вершина, а value — все смежные ей вершины
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

  /* Добавление ребра */
  void addEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Добавить ребро vet1 - vet2
    adjList[vet1]!.add(vet2);
    adjList[vet2]!.add(vet1);
  }

  /* Удаление ребра */
  void removeEdge(Vertex vet1, Vertex vet2) {
    if (!adjList.containsKey(vet1) ||
        !adjList.containsKey(vet2) ||
        vet1 == vet2) {
      throw ArgumentError;
    }
    // Удалить ребро vet1 - vet2
    adjList[vet1]!.remove(vet2);
    adjList[vet2]!.remove(vet1);
  }

  /* Добавление вершины */
  void addVertex(Vertex vet) {
    if (adjList.containsKey(vet)) return;
    // Добавить новый список в список смежности
    adjList[vet] = [];
  }

  /* Удаление вершины */
  void removeVertex(Vertex vet) {
    if (!adjList.containsKey(vet)) {
      throw ArgumentError;
    }
    // Удалить из списка смежности список, соответствующий вершине vet
    adjList.remove(vet);
    // Обойти списки других вершин и удалить все ребра, содержащие vet
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

/* Driver Code */
void main() {
  /* Инициализация неориентированного графа */
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
  print("\nГраф после инициализации");
  graph.printAdjList();

  /* Добавление ребра */
  // Вершины 1 и 2 соответствуют v[0] и v[2]
  graph.addEdge(v[0], v[2]);
  print("\nГраф после добавления ребра 1-2");
  graph.printAdjList();

  /* Удаление ребра */
  // Вершины 1 и 3 соответствуют v[0] и v[1]
  graph.removeEdge(v[0], v[1]);
  print("\nГраф после удаления ребра 1-3");
  graph.printAdjList();

  /* Добавление вершины */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\nГраф после добавления вершины 6");
  graph.printAdjList();

  /* Удаление вершины */
  // Вершина 3 соответствует v[1]
  graph.removeVertex(v[1]);
  print("\nГраф после удаления вершины 3");
  graph.printAdjList();
}
