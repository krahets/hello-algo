/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../include/include.hpp"

/* 顶点类 */
struct Vertex {
    int val;
    Vertex(int val) : val(val) {}
};

/* 基于邻接表实现的无向图类 */
class GraphAdjList {
    // 邻接表，使用哈希表来代替链表，以提升删除边、删除顶点的效率
    // 请注意，adjList 中的元素是 Vertex 对象
    unordered_map<Vertex*, unordered_set<Vertex*>> adjList;

public:
    /* 构造方法 */
    GraphAdjList(const vector<vector<Vertex*>>& edges) {
        // 添加所有顶点和边
        for (const vector<Vertex*>& edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    int size() { return adjList.size(); }

    /* 添加边 */
    void addEdge(Vertex* vet1, Vertex* vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("不存在顶点");
        // 添加边 vet1 - vet2
        adjList[vet1].insert(vet2);
        adjList[vet2].insert(vet1);
    }

    /* 删除边 */
    void removeEdge(Vertex* vet1, Vertex* vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("不存在顶点");
        // 删除边 vet1 - vet2
        adjList[vet1].erase(vet2);
        adjList[vet2].erase(vet1);
    }

    /* 添加顶点 */
    void addVertex(Vertex* vet) {
        if (adjList.count(vet)) return;
        // 在邻接表中添加一个新链表
        adjList[vet] = unordered_set<Vertex*>();
    }

    /* 删除顶点 */
    void removeVertex(Vertex* vet) {
        if (!adjList.count(vet))
            throw invalid_argument("不存在顶点");
        // 在邻接表中删除顶点 vet 对应的链表
        adjList.erase(vet);
        // 遍历其它顶点的链表，删除所有包含 vet 的边
        for (auto& [key, set_] : adjList) {
            set_.erase(vet);
        }
    }

    /* 打印邻接表 */
    void print() {
        cout << "邻接表 =" << endl;
        for (auto& [key, value] : adjList) {
            vector<int> tmp;
            for (Vertex* vertex : value)
                tmp.push_back(vertex->val);
            cout << key->val << ": ";
            PrintUtil::printVector(tmp);
        }
    }
};


/* Driver Code */
int main() {
    /* 初始化无向图 */
    Vertex *v0 = new Vertex(1),
           *v1 = new Vertex(3),
           *v2 = new Vertex(2),
           *v3 = new Vertex(5),
           *v4 = new Vertex(4);
    vector<vector<Vertex*>> edges = {{v0, v1}, {v1, v2}, {v2, v3}, {v0, v3}, {v2, v4}, {v3, v4}};
    GraphAdjList graph(edges);
    cout << "\n初始化后，图为" << endl;
    graph.print();

    /* 添加边 */
    // 顶点 1, 2 即 v0, v2
    graph.addEdge(v0, v2);
    cout << "\n添加边 1-2 后，图为" << endl;
    graph.print();

    /* 删除边 */
    // 顶点 1, 3 即 v0, v1
    graph.removeEdge(v0, v1);
    cout << "\n删除边 1-3 后，图为" << endl;
    graph.print();

    /* 添加顶点 */
    Vertex* v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\n添加顶点 6 后，图为" << endl;
    graph.print();

    /* 删除顶点 */
    // 顶点 3 即 v1
    graph.removeVertex(v1);
    cout << "\n删除顶点 3 后，图为" << endl;
    graph.print();

    /* 释放内存 */
    delete v0;
    delete v1;
    delete v2;
    delete v3;
    delete v4;
    delete v5;
}
