/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 廣度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 頂點走訪順序
    vector<Vertex *> res;
    // 用雜湊集合記錄已走訪的頂點
    unordered_set<Vertex *> visited = {startVet};
    // 使用佇列實作 BFS
    queue<Vertex *> que;
    que.push(startVet);
    // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // 取出佇列前端的頂點
        res.push_back(vet); // 記錄走訪的頂點
        // 走訪此頂點的所有相鄰頂點
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // 略過已走訪的頂點
            que.push(adjVet);        // 只將尚未走訪的頂點加入佇列
            visited.emplace(adjVet); // 將此頂點標記為已走訪
        }
    }
    // 回傳頂點的走訪順序
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
    cout << "\n初始化後的圖為\\n";
    graph.print();

    /* 廣度優先走訪 */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n廣度優先走訪（BFS）的頂點順序為" << endl;
    printVector(vetsToVals(res));

    // 釋放記憶體
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
