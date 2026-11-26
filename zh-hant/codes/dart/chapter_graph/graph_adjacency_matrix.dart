/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 以鄰接矩陣實作的無向圖類別 */
class GraphAdjMat {
  List<int> vertices = []; // 頂點元素，元素代表頂點值，索引代表頂點索引
  List<List<int>> adjMat = []; //鄰接矩陣，橫列與直行的索引皆對應頂點索引

  /* 建構式 */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // 新增頂點
    for (int val in vertices) {
      addVertex(val);
    }
    // 新增邊
    // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* 取得頂點數量 */
  int size() {
    return vertices.length;
  }

  /* 新增頂點 */
  void addVertex(int val) {
    int n = size();
    // 將新頂點的值加入頂點清單
    vertices.add(val);
    // 在鄰接矩陣中新增一個橫列
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // 在鄰接矩陣中新增一個直行
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* 刪除頂點 */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // 從頂點清單中移除索引為 index 的頂點
    vertices.removeAt(index);
    // 從鄰接矩陣中刪除索引為 index 的橫列
    adjMat.removeAt(index);
    // 從鄰接矩陣中刪除索引為 index 的直行
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* 新增邊 */
  // 參數 i、j 為 vertices 中的元素索引
  void addEdge(int i, int j) {
    // 處理索引超出範圍或兩個索引相同的情形
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* 刪除邊 */
  // 參數 i、j 為 vertices 中的元素索引
  void removeEdge(int i, int j) {
    // 處理索引超出範圍或兩個索引相同的情形
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* 印出鄰接矩陣 */
  void printAdjMat() {
    print("頂點清單 = $vertices");
    print("鄰接矩陣 = ");
    printMatrix(adjMat);
  }
}

/* Driver Code */
void main() {
  /* 初始化無向圖 */
  // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
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
  print("\n初始化後的圖為");
  graph.printAdjMat();

  /* 新增邊 */
  // 頂點 1、2 的索引分別為 0、2
  graph.addEdge(0, 2);
  print("\n新增邊 1-2 後的圖為");
  graph.printAdjMat();

  /* 刪除邊 */
  // 頂點 1、3 的索引分別為 0、1
  graph.removeEdge(0, 1);
  print("\n刪除邊 1-3 後的圖為");
  graph.printAdjMat();

  /* 新增頂點 */
  graph.addVertex(6);
  print("\n新增頂點 6 後的圖為");
  graph.printAdjMat();

  /* 刪除頂點 */
  // 頂點 3 的索引為 1
  graph.removeVertex(1);
  print("\n刪除頂點 3 後的圖為");
  graph.printAdjMat();
}
