/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
  List<int> vertices = []; // 정점 원소는 정점 값을, 인덱스는 정점 인덱스를 나타냄
  List<List<int>> adjMat = []; //인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당

  /* 생성자 */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // 정점 추가
    for (int val in vertices) {
      addVertex(val);
    }
    // 간선 추가
    // edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* 정점 수 구하기 */
  int size() {
    return vertices.length;
  }

  /* 정점 추가 */
  void addVertex(int val) {
    int n = size();
    // 정점 리스트에 새 정점의 값 추가
    vertices.add(val);
    // 인접 행렬에 행 하나 추가
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // 인접 행렬에 열 하나 추가
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* 정점 삭제 */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // 정점 리스트에서 인덱스가 index인 정점 삭제
    vertices.removeAt(index);
    // 인접 행렬에서 인덱스가 index인 행 삭제
    adjMat.removeAt(index);
    // 인접 행렬에서 인덱스가 index인 열 삭제
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* 간선 추가 */
  // 매개변수 i, j는 vertices의 원소 인덱스
  void addEdge(int i, int j) {
    // 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // 무방향 그래프의 인접 행렬은 주대각선을 기준으로 대칭이므로 (i, j) == (j, i)
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* 간선 삭제 */
  // 매개변수 i, j는 vertices의 원소 인덱스
  void removeEdge(int i, int j) {
    // 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
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

/* 실행 예제 */
void main() {
  /* 무방향 그래프 초기화 */
  // edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
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
  print("\n초기화한 그래프:");
  graph.printAdjMat();

  /* 간선 추가 */
  // 정점 1과 2의 인덱스는 각각 0과 2
  graph.addEdge(0, 2);
  print("\n간선 1-2를 추가한 그래프:");
  graph.printAdjMat();

  /* 간선 삭제 */
  // 정점 1과 3의 인덱스는 각각 0과 1
  graph.removeEdge(0, 1);
  print("\n간선 1-3을 삭제한 그래프:");
  graph.printAdjMat();

  /* 정점 추가 */
  graph.addVertex(6);
  print("\n정점 6을 추가한 그래프:");
  graph.printAdjMat();

  /* 정점 삭제 */
  // 정점 3의 인덱스는 1
  graph.removeVertex(1);
  print("\n정점 3을 삭제한 그래프:");
  graph.printAdjMat();
}
