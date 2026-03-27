/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс неориентированного графа на основе списка смежности */
class GraphAdjList {
  public:
    // Список смежности, key: вершина, value: все смежные с ней вершины
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* Удалить указанный узел из vector */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* Конструктор */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // Добавить все вершины и ребра
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* Получить количество вершин */
    int size() {
        return adjList.size();
    }

    /* Добавить ребро */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("не существуетвершина");
        // Добавить ребро vet1 - vet2
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* Удалить ребро */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("не существуетвершина");
        // Удалить ребро vet1 - vet2
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* Добавить вершину */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // Добавить новый связный список в список смежности
        adjList[vet] = vector<Vertex *>();
    }

    /* Удалить вершину */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("не существуетвершина");
        // Удалить из списка смежности связный список, соответствующий вершине vet
        adjList.erase(vet);
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* Вывести список смежности */
    void print() {
        cout << "Список смежности =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// Тестовые примеры см. в graph_adjacency_list_test.cpp
