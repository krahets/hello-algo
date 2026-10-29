/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* 実行用コード */
int main() {
    /* 無向グラフを初期化する */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\n初期化後のグラフ" << endl;
    graph.print();

    /* 辺を追加する */
    // 頂点 1, 2 は v[0], v[2] に対応する
    graph.addEdge(v[0], v[2]);
    cout << "\n辺 1-2 を追加した後のグラフ" << endl;
    graph.print();

    /* 辺を削除する */
    // 頂点 1, 3 は v[0], v[1] に対応する
    graph.removeEdge(v[0], v[1]);
    cout << "\n辺 1-3 を削除した後のグラフ" << endl;
    graph.print();

    /* 頂点を追加する */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\n頂点 6 を追加した後のグラフ" << endl;
    graph.print();

    /* 頂点を削除する */
    // 頂点 3 は v[1] に対応する
    graph.removeVertex(v[1]);
    cout << "\n頂点 3 を削除した後のグラフ" << endl;
    graph.print();

    // メモリを解放する
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
