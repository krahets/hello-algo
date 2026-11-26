/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 幅優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂点の訪問順
    vector<Vertex *> res;
    // 訪問済みの頂点を記録するハッシュ集合
    unordered_set<Vertex *> visited = {startVet};
    // BFS にキューを使う
    queue<Vertex *> que;
    que.push(startVet);
    // 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // キューの先頭から頂点を取り出す
        res.push_back(vet); // 訪問した頂点を記録する
        // この頂点の隣接頂点をすべて調べる
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // 訪問済みの頂点を飛ばす
            que.push(adjVet);        // 未訪問の頂点だけをキューに追加する
            visited.emplace(adjVet); // この頂点を訪問済みにする
        }
    }
    // 頂点を訪問順に返す
    return res;
}

/* 実行例 */
int main() {
    /* 無向グラフを初期化する */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\n初期化後のグラフ：\\n";
    graph.print();

    /* 幅優先探索 */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n幅優先探索（BFS）での頂点の訪問順：" << endl;
    printVector(vetsToVals(res));

    // メモリを解放する
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
