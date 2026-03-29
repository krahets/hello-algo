/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 隣接行列に基づく無向グラフクラス */
class GraphAdjMat {
  List<int> vertices = []; // 頂点要素。要素は「頂点値」を表し、インデックスは「頂点インデックス」を表す
  List<List<int>> adjMat = []; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

  /* コンストラクタ */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // 頂点を追加
    for (int val in vertices) {
      addVertex(val);
    }
    // 辺を追加
    // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* 頂点数を取得 */
  int size() {
    return vertices.length;
  }

  /* 頂点を追加 */
  void addVertex(int val) {
    int n = size();
    // 頂点リストに新しい頂点の値を追加
    vertices.add(val);
    // 隣接行列に 1 行追加
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // 隣接行列に 1 列追加
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* 頂点を削除 */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // 頂点リストから index の頂点を削除する
    vertices.removeAt(index);
    // 隣接行列で index 行を削除する
    adjMat.removeAt(index);
    // 隣接行列で index 列を削除する
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* 辺を追加 */
  // 引数 i, j は vertices の要素インデックスに対応する
  void addEdge(int i, int j) {
    // インデックスの範囲外と等値の処理
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* 辺を削除 */
  // 引数 i, j は vertices の要素インデックスに対応する
  void removeEdge(int i, int j) {
    // インデックスの範囲外と等値の処理
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* 隣接行列を出力 */
  void printAdjMat() {
    print("頂点リスト = $vertices");
    print("隣接行列 = ");
    printMatrix(adjMat);
  }
}

/* Driver Code */
void main() {
  /* 無向グラフを初期化 */
  // edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
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
  print("\n初期化後、グラフは");
  graph.printAdjMat();

  /* 辺を追加 */
  // 頂点 1, 2 のインデックスはそれぞれ 0, 2
  graph.addEdge(0, 2);
  print("\n辺 1-2 を追加後、グラフは");
  graph.printAdjMat();

  /* 辺を削除 */
  // 頂点 1, 3 のインデックスはそれぞれ 0, 1
  graph.removeEdge(0, 1);
  print("\n辺 1-3 を削除後、グラフは");
  graph.printAdjMat();

  /* 頂点を追加 */
  graph.addVertex(6);
  print("\n頂点 6 を追加後、グラフは");
  graph.printAdjMat();

  /* 頂点を削除 */
  // 頂点 3 のインデックスは 1
  graph.removeVertex(1);
  print("\n頂点 3 を削除後、グラフは");
  graph.printAdjMat();
}
