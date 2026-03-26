/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* Driver Code */
int main() {
    /* Инициализировать неориентированный граф */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\nПосле инициализации граф имеет вид" << endl;
    graph.print();

    /* Добавить ребро */
    // Вершины 1 и 2, то есть v[0] и v[2]
    graph.addEdge(v[0], v[2]);
    cout << "\nПосле добавления ребра 1-2 граф имеет вид" << endl;
    graph.print();

    /* Удалить ребро */
    // Вершины 1 и 3, то есть v[0] и v[1]
    graph.removeEdge(v[0], v[1]);
    cout << "\nПосле удаления ребра 1-3 граф имеет вид" << endl;
    graph.print();

    /* Добавить вершину */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\nПосле добавления вершины 6 граф имеет вид" << endl;
    graph.print();

    /* Удалить вершину */
    // Вершина 3, то есть v[1]
    graph.removeVertex(v[1]);
    cout << "\nПосле удаления вершины 3 граф имеет вид" << endl;
    graph.print();

    // Освободить память
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
