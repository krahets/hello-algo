/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 深さ優先走査ヘルパー関数 */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // 訪問済み頂点を記録
    visited.emplace(vet); // 頂点を訪問済みとしてマーク
    // その頂点のすべての隣接頂点を走査
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // すでに訪問済みの頂点をスキップ
        // 隣接頂点を再帰的に訪問
        dfs(graph, visited, res, adjVet);
    }
}

/* 深さ優先走査 */
// 隣接リストを使用してグラフを表現し、指定された頂点のすべての隣接頂点を取得
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂点走査順序
    vector<Vertex *> res;
    // ハッシュセット、訪問済み頂点を記録するために使用
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* ドライバーコード */
int main() {
    /* 無向グラフを初期化 */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\n初期化後、グラフは" << endl;
    graph.print();

    /* 深さ優先走査 */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\n深さ優先走査（DFS）の頂点順序は" << endl;
    printVector(vetsToVals(res));

    // メモリを解放
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}