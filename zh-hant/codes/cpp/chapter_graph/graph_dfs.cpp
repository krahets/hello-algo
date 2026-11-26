/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 深度優先走訪的輔助函式 */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // 記錄走訪的頂點
    visited.emplace(vet); // 將此頂點標記為已走訪
    // 走訪此頂點的所有相鄰頂點
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // 略過已走訪的頂點
        // 遞迴走訪相鄰頂點
        dfs(graph, visited, res, adjVet);
    }
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂點走訪順序
    vector<Vertex *> res;
    // 用雜湊集合記錄已走訪的頂點
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
    cout << "\n初始化後的圖為" << endl;
    graph.print();

    /* 深度優先走訪 */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\n深度優先走訪（DFS）的頂點順序為" << endl;
    printVector(vetsToVals(res));

    // 釋放記憶體
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
