/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 幅優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂点の走査順序
    vector<Vertex *> res;
    // 訪問済み頂点を記録するためのハッシュ集合
    unordered_set<Vertex *> visited = {startVet};
    // BFS の実装にキューを用いる
    queue<Vertex *> que;
    que.push(startVet);
    // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // 先頭の頂点をデキュー
        res.push_back(vet); // 訪問した頂点を記録
        // この頂点のすべての隣接頂点を走査
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // 訪問済みの頂点をスキップ
            que.push(adjVet);        // 未訪問の頂点のみをキューに追加
            visited.emplace(adjVet); // この頂点を訪問済みにする
        }
    }
    // 頂点の走査順を返す
    return res;
}

/* Driver Code */
int main() {
    /* 無向グラフを初期化 */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\n初期化後、グラフは\\n";
    graph.print();

    /* 幅優先探索 */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n幅優先探索（BFS）の頂点順序は" << endl;
    printVector(vetsToVals(res));

    // メモリを解放する
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
