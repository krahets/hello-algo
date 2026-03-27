/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Обход в ширину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // Последовательность обхода вершин
    vector<Vertex *> res;
    // Хеш-множество для хранения уже посещенных вершин
    unordered_set<Vertex *> visited = {startVet};
    // Очередь используется для реализации BFS
    queue<Vertex *> que;
    que.push(startVet);
    // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // Извлечь головную вершину из очереди
        res.push_back(vet); // Отметить посещенную вершину
        // Обойти все смежные вершины данной вершины
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // Пропустить уже посещенную вершину
            que.push(adjVet);        // Помещать в очередь только непосещенные вершины
            visited.emplace(adjVet); // Отметить эту вершину как посещенную
        }
    }
    // Вернуть последовательность обхода вершин
    return res;
}

/* Driver Code */
int main() {
    /* Инициализация неориентированного графа */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\nПосле инициализации граф имеет вид\n";
    graph.print();

    /* Обход в ширину */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\nПоследовательность вершин при обходе в ширину (BFS)" << endl;
    printVector(vetsToVals(res));

    // Освободить память
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
