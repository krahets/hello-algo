/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 深さ優先探索の補助関数 */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // 訪問した頂点を記録する
    visited.emplace(vet); // この頂点を訪問済みにする
    // この頂点の隣接頂点をすべて調べる
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // 訪問済みの頂点を飛ばす
        // 隣接頂点を再帰的に訪問する
        dfs(graph, visited, res, adjVet);
    }
}

/* 深さ優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂点の訪問順
    vector<Vertex *> res;
    // 訪問済みの頂点を記録するハッシュ集合
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* 実行例 */
int main() {
    /* 無向グラフを初期化する */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\n初期化後のグラフ：" << endl;
    graph.print();

    /* 深さ優先探索 */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\n深さ優先探索（DFS）での頂点の訪問順：" << endl;
    printVector(vetsToVals(res));

    // メモリを解放する
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
