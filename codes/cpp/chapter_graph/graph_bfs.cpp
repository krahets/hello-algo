/**
 * File: graph_bfs.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、高效遍历、无警告
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"
#include <vector>
#include <queue>
#include <unordered_set>

/* 广度优先遍历 BFS */
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 顶点遍历序列
    vector<Vertex *> res;
    // 已访问顶点集合
    unordered_set<Vertex *> visited{startVet};
    // 队列
    queue<Vertex *> que;
    que.push(startVet);

    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();

        res.push_back(vet);

        // 遍历邻接顶点（使用引用，避免拷贝）
        for (const auto adjVet : graph.adjList[vet]) {
            if (visited.contains(adjVet))
                continue;

            que.push(adjVet);
            visited.insert(adjVet);
        }
    }

    return res;
}

/* Driver Code */
int main() {
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};

    GraphAdjList graph(edges);
    cout << "\n初始化后，图为\n";
    graph.print();

    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n广度优先遍历（BFS）顶点序列为\n";
    printVector(vetsToVals(res));

    // 释放内存
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
