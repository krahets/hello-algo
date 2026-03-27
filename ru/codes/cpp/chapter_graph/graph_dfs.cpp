/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Вспомогательная функция обхода в глубину */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // Отметить посещенную вершину
    visited.emplace(vet); // Отметить эту вершину как посещенную
    // Обойти все смежные вершины данной вершины
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // Пропустить уже посещенную вершину
        // Рекурсивно обходить смежные вершины
        dfs(graph, visited, res, adjVet);
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // Последовательность обхода вершин
    vector<Vertex *> res;
    // Хеш-множество для хранения уже посещенных вершин
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
int main() {
    /* Инициализация неориентированного графа */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\nПосле инициализации граф имеет вид" << endl;
    graph.print();

    /* Обход в глубину */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\nПоследовательность вершин при обходе в глубину (DFS)" << endl;
    printVector(vetsToVals(res));

    // Освободить память
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
