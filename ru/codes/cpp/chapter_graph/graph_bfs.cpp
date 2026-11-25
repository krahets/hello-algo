/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Обход в ширину */
// Список смежности позволяет получить всех соседей заданной вершины
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // Порядок обхода вершин
    vector<Vertex *> res;
    // Хеш-множество посещённых вершин
    unordered_set<Vertex *> visited = {startVet};
    // Очередь для обхода BFS
    queue<Vertex *> que;
    que.push(startVet);
    // Начать с вершины vet и повторять, пока не будут посещены все вершины
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // Извлечь первую вершину из очереди
        res.push_back(vet); // Записать посещённую вершину
        // Перебрать всех соседей этой вершины
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // Пропустить посещённые вершины
            que.push(adjVet);        // Добавить в очередь только непосещённые вершины
            visited.emplace(adjVet); // Отметить вершину как посещённую
        }
    }
    // Вернуть порядок обхода вершин
    return res;
}

/* Пример использования */
int main() {
    /* Инициализировать неориентированный граф */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\nГраф после инициализации:\\n";
    graph.print();

    /* Обход в ширину */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\nПорядок обхода вершин в ширину (BFS):" << endl;
    printVector(vetsToVals(res));

    // Освободить память
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
