/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 以鄰接串列實作的無向圖類別 */
class GraphAdjList {
  public:
    // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* 從 vector 中刪除指定節點 */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* 建構式 */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // 加入所有頂點和邊
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 取得頂點數量 */
    int size() {
        return adjList.size();
    }

    /* 新增邊 */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("頂點不存在");
        // 新增邊 vet1 - vet2
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* 刪除邊 */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("頂點不存在");
        // 刪除邊 vet1 - vet2
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* 新增頂點 */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // 在鄰接串列中新增一條鏈結串列
        adjList[vet] = vector<Vertex *>();
    }

    /* 刪除頂點 */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("頂點不存在");
        // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
        adjList.erase(vet);
        // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* 印出鄰接串列 */
    void print() {
        cout << "鄰接串列 =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// 測試案例請見 graph_adjacency_list_test.cpp
