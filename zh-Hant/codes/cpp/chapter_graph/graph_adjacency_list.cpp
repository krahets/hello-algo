/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基於鄰接表實現的無向圖類別 */
class GraphAdjList {
  public:
    // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* 在 vector 中刪除指定節點 */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* 建構子 */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // 新增所有頂點和邊
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 獲取頂點數量 */
    int size() {
        return adjList.size();
    }

    /* 新增邊 */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("不存在頂點");
        // 新增邊 vet1 - vet2
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* 刪除邊 */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("不存在頂點");
        // 刪除邊 vet1 - vet2
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* 新增頂點 */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // 在鄰接表中新增一個新鏈結串列
        adjList[vet] = vector<Vertex *>();
    }

    /* 刪除頂點 */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("不存在頂點");
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        adjList.erase(vet);
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* 列印鄰接表 */
    void print() {
        cout << "鄰接表 =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// 測試樣例請見 graph_adjacency_list_test.cpp
