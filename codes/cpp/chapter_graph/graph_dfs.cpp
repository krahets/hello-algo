/**
 * File: graph_dfs.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、高效遍历、代码整洁
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"
#include <vector>
#include <unordered_set>

/* 深度优先遍历辅助函数 */
void dfs(GraphAdjList &graph, std::unordered_set<Vertex*> &visited, std::vector<Vertex*> &res, Vertex *vet) {
    res.push_back(vet);   // 记录访问顶点
    visited.insert(vet);  // 标记已访问

    // 遍历邻接顶点（使用 const 引用，不拷贝、更高效）
    for (const Vertex* adjVet : graph.adjList[vet]) {
        if (visited.contains(adjVet))
            continue; // 跳过已访问

        dfs(graph, visited, res, const_cast<Vertex*>(adjVet));
    }
}

/* 深度优先遍历 */
std::vector<Vertex*> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    std::vector<Vertex*> res;
    std::unordered_set<Vertex*> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
int main() {
    std::vector<Vertex*> v = valsToVets({0, 1, 2, 3, 4, 5, 6});
    std::vector<std::vector<Vertex*>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                              {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};

    GraphAdjList graph(edges);
    std::cout << "\n初始化后，图为\n";
    graph.print();

    std::vector<Vertex*> res = graphDFS(graph, v[0]);
    std::cout << "\n深度优先遍历（DFS）顶点序列为\n";
    printVector(vetsToVals(res));

    // 释放内存
    for (Vertex* vet : v) {
        delete vet;
    }

    return 0;
}
