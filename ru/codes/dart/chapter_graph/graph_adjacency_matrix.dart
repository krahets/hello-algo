/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Неориентированный граф на матрице смежности */
class GraphAdjMat {
  List<int> vertices = []; // Элементы хранят значения вершин, а их позиции задают индексы вершин
  List<List<int>> adjMat = []; //Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

  /* Конструктор */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // Добавить вершину
    for (int val in vertices) {
      addVertex(val);
    }
    // Добавить ребро
    // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* Получить число вершин */
  int size() {
    return vertices.length;
  }

  /* Добавить вершину */
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

  /* Удалить вершину */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // Удалить из списка вершин вершину с индексом index
    vertices.removeAt(index);
    // Удалить из матрицы смежности строку с индексом index
    adjMat.removeAt(index);
    // Удалить из матрицы смежности столбец с индексом index
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* Добавить ребро */
  // Параметры i и j — индексы элементов vertices
  void addEdge(int i, int j) {
    // Проверить выход индексов за границы и их совпадение
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* Удалить ребро */
  // Параметры i и j — индексы элементов vertices
  void removeEdge(int i, int j) {
    // Проверить выход индексов за границы и их совпадение
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

/* Пример использования */
void main() {
  /* Инициализировать неориентированный граф */
  // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
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
  print("\nГраф после инициализации:");
  graph.printAdjMat();

  /* Добавить ребро */
  // Индексы вершин 1 и 2 равны 0 и 2 соответственно
  graph.addEdge(0, 2);
  print("\nГраф после добавления ребра 1–2:");
  graph.printAdjMat();

  /* Удалить ребро */
  // Индексы вершин 1 и 3 равны 0 и 1 соответственно
  graph.removeEdge(0, 1);
  print("\nГраф после удаления ребра 1–3:");
  graph.printAdjMat();

  /* Добавить вершину */
  graph.addVertex(6);
  print("\nГраф после добавления вершины 6:");
  graph.printAdjMat();

  /* Удалить вершину */
  // Индекс вершины 3 равен 1
  graph.removeVertex(1);
  print("\nГраф после удаления вершины 3:");
  graph.printAdjMat();
}
