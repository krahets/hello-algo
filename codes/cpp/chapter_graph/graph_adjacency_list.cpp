/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、异常安全、规范命名
 */

#include "../utils/common.hpp"
#include <unordered_map>
#include <vector>
#include <stdexcept>
#include <iostream>

/* 基于邻接表实现的无向图类 */
class GraphAdjList {
public:
    // 邻接表：key=顶点，value=邻接顶点列表
    std::unordered_map<Vertex*, std::vector<Vertex*>> adjList;

    /* 从 vector 中删除指定顶点（安全遍历） */
    void remove(std::vector<Vertex*>& vec, Vertex* vet) {
        for (auto it = vec.begin(); it != vec.end(); ++it) {
            if (*it == vet) {
                vec.erase(it);
                break;
            }
        }
    }

    /* 构造方法 */
    explicit GraphAdjList(const std::vector<std::vector<Vertex*>>& edges) {
        for (const auto& edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    int size() const {
        return static_cast<int>(adjList.size());
    }

    /* 添加边 */
    void addEdge(Vertex* vet1, Vertex* vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw std::invalid_argument("顶点不存在或相同");

        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* 删除边 */
    void removeEdge(Vertex* vet1, Vertex* vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw std::invalid_argument("顶点不存在或相同");

        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* 添加顶点 */
    void addVertex(Vertex* vet) {
        if (adjList.contains(vet))
            return;
        adjList[vet] = std::vector<Vertex*>{};
    }

    /* 删除顶点及所有关联边 */
    void removeVertex(Vertex* vet) {
        if (!adjList.count(vet))
            throw std::invalid_argument("顶点不存在");

        adjList.erase(vet);
        for (auto& pair : adjList) {
            remove(pair.second, vet);
        }
    }

    /* 打印邻接表 */
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
