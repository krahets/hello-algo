/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 隣接行列で無向グラフを表すクラス */
class GraphAdjMat {
    vector<int> vertices;       // 頂点リスト。要素は頂点の値を、インデックスは頂点のインデックスを表す
    vector<vector<int>> adjMat; // 隣接行列。行と列のインデックスは頂点のインデックスに対応する

  public:
    /* コンストラクタ */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // 頂点を追加する
        for (int val : vertices) {
            addVertex(val);
        }
        // 辺を追加する
        // edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得する */
    int size() const {
        return vertices.size();
    }

    /* 頂点を追加する */
    void addVertex(int val) {
        int n = size();
        // 新しい頂点の値を頂点リストに追加する
        vertices.push_back(val);
        // 隣接行列に行を 1 つ追加する
        adjMat.emplace_back(vector<int>(n, 0));
        // 隣接行列に列を 1 つ追加する
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* 頂点を削除する */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("頂点が存在しません");
        }
        // 頂点リストからインデックス index の頂点を削除する
        vertices.erase(vertices.begin() + index);
        // 隣接行列からインデックス index の行を削除する
        adjMat.erase(adjMat.begin() + index);
        // 隣接行列からインデックス index の列を削除する
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* 辺を追加する */
    // 引数 i と j は vertices の要素のインデックス
    void addEdge(int i, int j) {
        // インデックスが範囲外または同じ値の場合の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂点が存在しません");
        }
        // 無向グラフの隣接行列は主対角線に関して対称で、(i, j) == (j, i) を満たす
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 辺を削除する */
    // 引数 i と j は vertices の要素のインデックス
    void removeEdge(int i, int j) {
        // インデックスが範囲外または同じ値の場合の処理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂点が存在しません");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 隣接行列を表示する */
    void print() {
        cout << "頂点リスト = ";
        printVector(vertices);
        cout << "隣接行列 =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* 実行例 */
int main() {
    /* 無向グラフを初期化する */
    // edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\n初期化後のグラフ：" << endl;
    graph.print();

    /* 辺を追加する */
    // 頂点 1 と 2 のインデックスはそれぞれ 0 と 2
    graph.addEdge(0, 2);
    cout << "\n辺 1-2 を追加した後のグラフ：" << endl;
    graph.print();

    /* 辺を削除する */
    // 頂点 1 と 3 のインデックスはそれぞれ 0 と 1
    graph.removeEdge(0, 1);
    cout << "\n辺 1-3 を削除した後のグラフ：" << endl;
    graph.print();

    /* 頂点を追加する */
    graph.addVertex(6);
    cout << "\n頂点 6 を追加した後のグラフ：" << endl;
    graph.print();

    /* 頂点を削除する */
    // 頂点 3 のインデックスは 1
    graph.removeVertex(1);
    cout << "\n頂点 3 を削除した後のグラフ：" << endl;
    graph.print();

    return 0;
}
