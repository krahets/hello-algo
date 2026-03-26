/**
 * File: graph_adjacency_list.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/vertex.dart';

/* Класс неориентированного графа на основе списка смежности */
class GraphAdjList {
  // Список смежности, key: вершина, value: все смежные с ней вершины
  Map<Vertex, List<Vertex>> adjList = {};

  /* Конструктор */
  GraphAdjList(List<List<Vertex>> edges) {
    for (List<Vertex> edge in edges) {
      addVertex(edge[0]);
      addVertex(edge[1]);
      addEdge(edge[0], edge[1]);
    }
  }

  /* Получить количество вершин */
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
    // Добавить ребро vet1 - vet2
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
    // Удалить ребро vet1 - vet2
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
    // Удалить из списка смежности связный список, соответствующий вершине vet
    adjList.remove(vet);
    // Обойти списки других вершин и удалить все ребра, содержащие vet
    adjList.forEach((key, value) {
      value.remove(vet);
    });
  }

  /* Вывести список смежности */
  void printAdjList() {
    print("список смежности =");
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
  print("\nПосле инициализации граф имеет вид");
  graph.printAdjList();

  /* Добавить ребро */
  // Вершины 1 и 2, то есть v[0] и v[2]
  graph.addEdge(v[0], v[2]);
  print("\nДобавить ребро 1-2 после, графравно");
  graph.printAdjList();

  /* Удалить ребро */
  // Вершины 1 и 3, то есть v[0] и v[1]
  graph.removeEdge(v[0], v[1]);
  print("\nУдалить ребро 1-3 после, графравно");
  graph.printAdjList();

  /* Добавить вершину */
  Vertex v5 = Vertex(6);
  graph.addVertex(v5);
  print("\nДобавить вершину 6 после, графравно");
  graph.printAdjList();

  /* Удалить вершину */
  // Вершина 3, то есть v[1]
  graph.removeVertex(v[1]);
  print("\nУдалить вершину 3 после, графравно");
  graph.printAdjList();
}
