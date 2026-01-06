/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 幅優先走査 */
// 隣接リストを使用してグラフを表現し、指定された頂点のすべての隣接頂点を取得
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂点走査順序
    vector<Vertex *> res;
    // ハッシュセット、訪問済み頂点を記録するために使用
    unordered_set<Vertex *> visited = {startVet};
    // BFSを実装するために使用されるキュー
    queue<Vertex *> que;
    que.push(startVet);
    // 頂点vetから開始し、すべての頂点が訪問されるまでループ
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // キューの先頭の頂点をデキュー
        res.push_back(vet); // 訪問済み頂点を記録
        // その頂点のすべての隣接頂点を走査
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // すでに訪問済みの頂点をスキップ
            que.push(adjVet);        // 未訪問の頂点のみをエンキュー
            visited.emplace(adjVet); // 頂点を訪問済みとしてマーク
        }
    }
    // 頂点走査順序を返す
    return res;
}

/* ドライバーコード */
int main() {
    /* 無向グラフを初期化 */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\n初期化後、グラフは\n";
    graph.print();

    /* 幅優先走査 */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n幅優先走査（BFS）の頂点順序は" << endl;
    printVector(vetsToVals(res));

    // メモリを解放
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}