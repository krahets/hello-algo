/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
  List<int> vertices = []; // Элемент вершины: элемент представляет «значение вершины», индекс представляет «индекс вершины»
  List<List<int>> adjMat = []; // Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»

  /* Конструктор */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // Добавление вершины
    for (int val in vertices) {
      addVertex(val);
    }
    // Добавить ребра
    // Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* Получить число вершин */
  int size() {
    return vertices.length;
  }

  /* Добавление вершины */
  void addVertex(int val) {
    int n = size();
    // Добавить значение новой вершины в список вершин
    vertices.add(val);
    // Добавить строку в матрицу смежности
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // Добавить столбец в матрицу смежности
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* Удаление вершины */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // Удалить вершину с индексом index из списка вершин
    vertices.removeAt(index);
    // Удалить строку с индексом index из матрицы смежности
    adjMat.removeAt(index);
    // Удалить столбец с индексом index из матрицы смежности
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* Добавление ребра */
  // Параметры i и j соответствуют индексам элементов vertices
  void addEdge(int i, int j) {
    // Обработка выхода индекса за границы и случая равенства
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* Удаление ребра */
  // Параметры i и j соответствуют индексам элементов vertices
  void removeEdge(int i, int j) {
    // Обработка выхода индекса за границы и случая равенства
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* Вывести матрицу смежности */
  void printAdjMat() {
    print("Список вершин = $vertices");
    print("Матрица смежности = ");
    printMatrix(adjMat);
  }
}

/* Driver Code */
void main() {
  /* Инициализация неориентированного графа */
  // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
  List<int> vertices = [1, 3, 2, 5, 4];
  List<List<int>> edges = [
    [0, 1],
    [0, 3],
    [1, 2],
    [2, 3],
    [2, 4],
    [3, 4],
  ];
  GraphAdjMat graph = GraphAdjMat(vertices, edges);
  print("\nГраф после инициализации");
  graph.printAdjMat();

  /* Добавление ребра */
  // Индексы вершин 1 и 2 равны 0 и 2 соответственно
  graph.addEdge(0, 2);
  print("\nГраф после добавления ребра 1-2");
  graph.printAdjMat();

  /* Удаление ребра */
  // Индексы вершин 1 и 3 равны 0 и 1 соответственно
  graph.removeEdge(0, 1);
  print("\nГраф после удаления ребра 1-3");
  graph.printAdjMat();

  /* Добавление вершины */
  graph.addVertex(6);
  print("\nГраф после добавления вершины 6");
  graph.printAdjMat();

  /* Удаление вершины */
  // Индекс вершины 3 равен 1
  graph.removeVertex(1);
  print("\nГраф после удаления вершины 3");
  graph.printAdjMat();
}
