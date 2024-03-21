/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 廣度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂點走訪序列
    vector<Vertex *> res;
    // 雜湊表，用於記錄已被訪問過的頂點
    unordered_set<Vertex *> visited = {startVet};
    // 佇列用於實現 BFS
    queue<Vertex *> que;
    que.push(startVet);
    // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // 佇列首頂點出隊
        res.push_back(vet); // 記錄訪問頂點
        // 走訪該頂點的所有鄰接頂點
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // 跳過已被訪問的頂點
            que.push(adjVet);        // 只入列未訪問的頂點
            visited.emplace(adjVet); // 標記該頂點已被訪問
        }
    }
    // 返回頂點走訪序列
    return res;
}

/* Driver Code */
int main() {
    /* 初始化無向圖 */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\n初始化後，圖為\\n";
    graph.print();

    /* 廣度優先走訪 */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n廣度優先走訪（BFS）頂點序列為" << endl;
    printVector(vetsToVals(res));

    // 釋放記憶體
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
