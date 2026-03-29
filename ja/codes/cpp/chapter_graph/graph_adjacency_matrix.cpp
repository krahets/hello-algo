/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 隣接行列に基づく無向グラフクラス */
class GraphAdjMat {
    vector<int> vertices;       // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
    vector<vector<int>> adjMat; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

  public:
    /* コンストラクタ */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // 頂点を追加
        for (int val : vertices) {
            addVertex(val);
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得 */
    int size() const {
        return vertices.size();
    }

    /* 頂点を追加 */
    void addVertex(int val) {
        int n = size();
        // 頂点リストに新しい頂点の値を追加
        vertices.push_back(val);
        // 隣接行列に 1 行追加
        adjMat.emplace_back(vector<int>(n, 0));
        // 隣接行列に 1 列追加
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* 頂点を削除 */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("頂点が存在しません");
        }
        // 頂点リストから index の頂点を削除する
        vertices.erase(vertices.begin() + index);
        // 隣接行列で index 行を削除する
        adjMat.erase(adjMat.begin() + index);
        // 隣接行列で index 列を削除する
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* 辺を追加 */
    // 引数 i, j は vertices の要素インデックスに対応する
    void addEdge(int i, int j) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂点が存在しません");
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
            throw out_of_range("頂点が存在しません");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 隣接行列を出力 */
    void print() {
        cout << "頂点リスト = ";
        printVector(vertices);
        cout << "隣接行列 =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Driver Code */
int main() {
    /* 無向グラフを初期化 */
    // edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\n初期化後、グラフは" << endl;
    graph.print();

    /* 辺を追加 */
    // 頂点 1, 2 のインデックスはそれぞれ 0, 2
    graph.addEdge(0, 2);
    cout << "\n辺 1-2 を追加した後、グラフは" << endl;
    graph.print();

    /* 辺を削除 */
    // 頂点 1, 3 のインデックスはそれぞれ 0, 1
    graph.removeEdge(0, 1);
    cout << "\n辺 1-3 を削除した後、グラフは" << endl;
    graph.print();

    /* 頂点を追加 */
    graph.addVertex(6);
    cout << "\n頂点 6 を追加した後、グラフは" << endl;
    graph.print();

    /* 頂点を削除 */
    // 頂点 3 のインデックスは 1
    graph.removeVertex(1);
    cout << "\n頂点 3 を削除した後、グラフは" << endl;
    graph.print();

    return 0;
}
