/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
  List<int> vertices = []; // 정점 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
  List<List<int>> adjMat = []; //인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다

  /* 생성자 */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // 정점 추가
    for (int val in vertices) {
      addVertex(val);
    }
    // 간선 추가
    // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* 정점 개수 반환 */
  int size() {
    return vertices.length;
  }

  /* 정점 추가 */
  void addVertex(int val) {
    int n = size();
    // 정점 리스트에 새 정점의 값을 추가한다
    vertices.add(val);
    // 인접 행렬에 행 하나를 추가한다
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // 인접 행렬에 열 하나를 추가한다
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* 정점 삭제 */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // 정점 리스트에서 인덱스 index의 정점을 제거한다
    vertices.removeAt(index);
    // 인접 행렬에서 인덱스 index의 행을 삭제한다
    adjMat.removeAt(index);
    // 인접 행렬에서 인덱스 index의 열을 삭제한다
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* 간선 추가 */
  // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
  void addEdge(int i, int j) {
    // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* 간선 삭제 */
  // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
  void removeEdge(int i, int j) {
    // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* 인접 행렬 출력 */
  void printAdjMat() {
    print("정점 리스트 = $vertices");
    print("인접 행렬 = ");
    printMatrix(adjMat);
  }
}

/* 실행 코드 */
void main() {
  /* 무방향 그래프 초기화 */
  // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
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
  print("\n초기화한 후의 그래프");
  graph.printAdjMat();

  /* 간선 추가 */
  // 정점 1, 2의 인덱스는 각각 0, 2이다
  graph.addEdge(0, 2);
  print("\n간선 1-2를 추가한 후의 그래프");
  graph.printAdjMat();

  /* 간선 삭제 */
  // 정점 1, 3의 인덱스는 각각 0, 1이다
  graph.removeEdge(0, 1);
  print("\n간선 1-3을 삭제한 후의 그래프");
  graph.printAdjMat();

  /* 정점 추가 */
  graph.addVertex(6);
  print("\n정점 6을 추가한 후의 그래프");
  graph.printAdjMat();

  /* 정점 삭제 */
  // 정점 3의 인덱스는 1이다
  graph.removeVertex(1);
  print("\n정점 3을 삭제한 후의 그래프");
  graph.printAdjMat();
}
