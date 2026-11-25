/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* Пример использования */
int main() {
    /* Инициализировать неориентированный граф */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\nГраф после инициализации:" << endl;
    graph.print();

    /* Добавить ребро */
    // Вершинам 1 и 2 соответствуют v[0] и v[2]
    graph.addEdge(v[0], v[2]);
    cout << "\nГраф после добавления ребра 1–2:" << endl;
    graph.print();

    /* Удалить ребро */
    // Вершинам 1 и 3 соответствуют v[0] и v[1]
    graph.removeEdge(v[0], v[1]);
    cout << "\nГраф после удаления ребра 1–3:" << endl;
    graph.print();

    /* Добавить вершину */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\nГраф после добавления вершины 6:" << endl;
    graph.print();

    /* Удалить вершину */
    // Вершине 3 соответствует v[1]
    graph.removeVertex(v[1]);
    cout << "\nГраф после удаления вершины 3:" << endl;
    graph.print();

    // Освободить память
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
