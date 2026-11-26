/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Вспомогательная функция обхода в глубину */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // Записать посещённую вершину
    visited.emplace(vet); // Отметить вершину как посещённую
    // Перебрать всех соседей этой вершины
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // Пропустить посещённые вершины
        // Рекурсивно посетить соседнюю вершину
        dfs(graph, visited, res, adjVet);
    }
}

/* Обход в глубину */
// Список смежности позволяет получить всех соседей заданной вершины
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // Порядок обхода вершин
    vector<Vertex *> res;
    // Хеш-множество посещённых вершин
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Пример использования */
int main() {
    /* Инициализировать неориентированный граф */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\nГраф после инициализации:" << endl;
    graph.print();

    /* Обход в глубину */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\nПорядок обхода вершин в глубину (DFS):" << endl;
    printVector(vetsToVals(res));

    // Освободить память
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
