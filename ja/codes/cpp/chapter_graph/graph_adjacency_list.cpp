/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 隣接リストに基づく無向グラフクラス */
class GraphAdjList {
  public:
    // 隣接リスト、キー：頂点、値：その頂点のすべての隣接頂点
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* ベクターから指定されたノードを削除 */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* コンストラクタ */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // すべての頂点と辺を追加
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得 */
    int size() {
        return adjList.size();
    }

    /* 辺を追加 */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Vertex does not exist");
        // 辺 vet1 - vet2 を追加
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* 辺を削除 */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Vertex does not exist");
        // 辺 vet1 - vet2 を削除
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* 頂点を追加 */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // 隣接リストに新しい連結リストを追加
        adjList[vet] = vector<Vertex *>();
    }

    /* 頂点を削除 */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("Vertex does not exist");
        // 隣接リストから頂点vetに対応する連結リストを削除
        adjList.erase(vet);
        // 他の頂点の連結リストを走査し、vetを含むすべての辺を削除
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* 隣接リストを印刷 */
    void print() {
        cout << "隣接リスト =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// テストケースはgraph_adjacency_list_test.cppを参照