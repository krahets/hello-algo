/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、内存安全、const正确性、无泄漏、无警告
 */

#include <unordered_map>
#include <vector>
#include <stdexcept>
#include <iostream>
#include "../utils/common.hpp"

/* 基于邻接表实现的无向图类 */
class GraphAdjList {
public:
    std::unordered_map<Vertex*, std::vector<Vertex*>> adjList;

    void remove(std::vector<Vertex*>& vec, Vertex* vet) {
        for (auto it = vec.begin(); it != vec.end(); ++it) {
            if (*it == vet) {
                vec.erase(it);
                break;
            }
        }
    }

    explicit GraphAdjList(const std::vector<std::vector<Vertex*>>& edges) {
        for (const auto& edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    int size() const {
        return static_cast<int>(adjList.size());
    }

    void addEdge(Vertex* vet1, Vertex* vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw std::invalid_argument("顶点不存在或相同");

        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    void removeEdge(Vertex* vet1, Vertex* vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw std::invalid_argument("顶点不存在或相同");

        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    void addVertex(Vertex* vet) {
        if (adjList.contains(vet))
            return;
        adjList[vet] = std::vector<Vertex*>{};
    }

    void removeVertex(Vertex* vet) {
        if (!adjList.count(vet))
            throw std::invalid_argument("顶点不存在");

        adjList.erase(vet);
        for (auto& pair : adjList) {
            remove(pair.second, vet);
        }
    }

    void print() const {
        std::cout << "邻接表 =\n";
        for (const auto& pair : adjList) {
            Vertex* key = pair.first;
            const std::vector<Vertex*>& neighbors = pair.second;
            std::cout << key->val << ": ";
            printVector(vetsToVals(neighbors));
        }
    }
};

/* Driver Code */
int main() {
    // 初始化顶点
    std::vector<Vertex*> v = valsToVets({1, 3, 2, 5, 4});
    std::vector<std::vector<Vertex*>> edges = {{v[0], v[1]}, {v[0], v[3]},
                                               {v[1], v[2]}, {v[2], v[3]},
                                               {v[2], v[4]}, {v[3], v[4]}};

    GraphAdjList graph(edges);
    std::cout << "\n初始化后，图为\n";
    graph.print();

    // 添加边
    graph.addEdge(v[0], v[2]);
    std::cout << "\n添加边 1-2 后，图为\n";
    graph.print();

    // 删除边
    graph.removeEdge(v[0], v[1]);
    std::cout << "\n删除边 1-3 后，图为\n";
    graph.print();

    // 添加顶点
    Vertex* v5 = new Vertex(6);
    graph.addVertex(v5);
    std::cout << "\n添加顶点 6 后，图为\n";
    graph.print();

    // 删除顶点
    graph.removeVertex(v[1]);
    std::cout << "\n删除顶点 3 后，图为\n";
    graph.print();

    // 释放所有顶点内存
    for (Vertex* vet : v) {
        delete vet;
    }
    delete v5;  // 修复内存泄漏

    return 0;
}
