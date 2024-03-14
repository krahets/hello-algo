/**
 * File: graph_adjacency_matrix.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 基于邻接矩阵实现的无向图类 */
class GraphAdjMat {
  List<int> vertices = []; // 顶点元素，元素代表“顶点值”，索引代表“顶点索引”
  List<List<int>> adjMat = []; //邻接矩阵，行列索引对应“顶点索引”

  /* 构造方法 */
  GraphAdjMat(List<int> vertices, List<List<int>> edges) {
    this.vertices = [];
    this.adjMat = [];
    // 添加顶点
    for (int val in vertices) {
      addVertex(val);
    }
    // 添加边
    // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
    for (List<int> e in edges) {
      addEdge(e[0], e[1]);
    }
  }

  /* 获取顶点数量 */
  int size() {
    return vertices.length;
  }

  /* 添加顶点 */
  void addVertex(int val) {
    int n = size();
    // 向顶点列表中添加新顶点的值
    vertices.add(val);
    // 在邻接矩阵中添加一行
    List<int> newRow = List.filled(n, 0, growable: true);
    adjMat.add(newRow);
    // 在邻接矩阵中添加一列
    for (List<int> row in adjMat) {
      row.add(0);
    }
  }

  /* 删除顶点 */
  void removeVertex(int index) {
    if (index >= size()) {
      throw IndexError;
    }
    // 在顶点列表中移除索引 index 的顶点
    vertices.removeAt(index);
    // 在邻接矩阵中删除索引 index 的行
    adjMat.removeAt(index);
    // 在邻接矩阵中删除索引 index 的列
    for (List<int> row in adjMat) {
      row.removeAt(index);
    }
  }

  /* 添加边 */
  // 参数 i, j 对应 vertices 元素索引
  void addEdge(int i, int j) {
    // 索引越界与相等处理
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
    adjMat[i][j] = 1;
    adjMat[j][i] = 1;
  }

  /* 删除边 */
  // 参数 i, j 对应 vertices 元素索引
  void removeEdge(int i, int j) {
    // 索引越界与相等处理
    if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
      throw IndexError;
    }
    adjMat[i][j] = 0;
    adjMat[j][i] = 0;
  }

  /* 打印邻接矩阵 */
  void printAdjMat() {
    print("顶点列表 = $vertices");
    print("邻接矩阵 = ");
    printMatrix(adjMat);
  }
}

/* Driver Code */
void main() {
  /* 初始化无向图 */
  // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
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
  print("\n初始化后，图为");
  graph.printAdjMat();

  /* 添加边 */
  // 顶点 1, 2 的索引分别为 0, 2
  graph.addEdge(0, 2);
  print("\n添加边 1-2 后，图为");
  graph.printAdjMat();

  /* 删除边 */
  // 顶点 1, 3 的索引分别为 0, 1
  graph.removeEdge(0, 1);
  print("\n删除边 1-3 后，图为");
  graph.printAdjMat();

  /* 添加顶点 */
  graph.addVertex(6);
  print("\n添加顶点 6 后，图为");
  graph.printAdjMat();

  /* 删除顶点 */
  // 顶点 3 的索引为 1
  graph.removeVertex(1);
  print("\n删除顶点 3 后，图为");
  graph.printAdjMat();
}
