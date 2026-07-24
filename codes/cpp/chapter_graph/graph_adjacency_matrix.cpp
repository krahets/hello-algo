/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、异常规范、代码整洁
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>

/* 基于邻接矩阵实现的无向图类 */
class GraphAdjMat {
private:
    std::vector<int> vertices;       // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    std::vector<std::vector<int>> adjMat; // 邻接矩阵，行列索引对应“顶点索引”

public:
    /* 构造方法 */
    GraphAdjMat(const std::vector<int>& vertices, const std::vector<std::vector<int>>& edges) {
        // 添加顶点
        for (int val : vertices) {
            addVertex(val);
        }
        // 添加边
        for (const auto& edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    int size() const {
        return static_cast<int>(vertices.size());
    }

    /* 添加顶点 */
    void addVertex(int val) {
        int n = size();
        // 向顶点列表中添加新顶点的值
        vertices.push_back(val);
        // 在邻接矩阵中添加一行
        adjMat.emplace_back(n, 0);
        // 在邻接矩阵中添加一列
        for (auto& row : adjMat) {
            row.push_back(0);
        }
    }

    /* 删除顶点 */
    void removeVertex(int index) {
        if (index < 0 || index >= size()) {
            throw std::out_of_range("顶点不存在");
        }
        // 在顶点列表中移除索引 index 的顶点
        vertices.erase(vertices.begin() + index);
        // 在邻接矩阵中删除索引 index 的行
        adjMat.erase(adjMat.begin() + index);
        // 在邻接矩阵中删除索引 index 的列
        for (auto& row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* 添加边 */
    void addEdge(int i, int j) {
        int n = size();
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= n || j >= n || i == j) {
            throw std::out_of_range("顶点不存在或无效边");
        }
        // 无向图：邻接矩阵对称
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 删除边 */
    void removeEdge(int i, int j) {
        int n = size();
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= n || j >= n || i == j) {
            throw std::out_of_range("顶点不存在或无效边");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 打印邻接矩阵 */
    void print() const {
        std::cout << "顶点列表 = ";
        printVector(vertices);
        std::cout << "邻接矩阵 =\n";
        printVectorMatrix(adjMat);
    }
};

/* Driver Code */
int main() {
    /* 初始化无向图 */
    std::vector<int> vertices = {1, 3, 2, 5, 4};
    std::vector<std::vector<int>> edges = {{0, 1}, {0, 3}, {1, 2},
                                          {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    std::cout << "\n初始化后，图为\n";
    graph.print();

    /* 添加边 */
    graph.addEdge(0, 2);
    std::cout << "\n添加边 1-2 后，图为\n";
    graph.print();

    /* 删除边 */
    graph.removeEdge(0, 1);
    std::cout << "\n删除边 1-3 后，图为\n";
    graph.print();

    /* 添加顶点 */
    graph.addVertex(6);
    std::cout << "\n添加顶点 6 后，图为\n";
    graph.print();

    /* 删除顶点 */
    graph.removeVertex(1);
    std::cout << "\n删除顶点 3 后，图为\n";
    graph.print();

    return 0;
}
