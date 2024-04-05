/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 深度優先走訪輔助函式 */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // 記錄訪問頂點
    visited.emplace(vet); // 標記該頂點已被訪問
    // 走訪該頂點的所有鄰接頂點
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // 跳過已被訪問的頂點
        // 遞迴訪問鄰接頂點
        dfs(graph, visited, res, adjVet);
    }
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂點走訪序列
    vector<Vertex *> res;
    // 雜湊表，用於記錄已被訪問過的頂點
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
int main() {
    /* 初始化無向圖 */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\n初始化後，圖為" << endl;
    graph.print();

    /* 深度優先走訪 */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\n深度優先走訪（DFS）頂點序列為" << endl;
    printVector(vetsToVals(res));

    // 釋放記憶體
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
