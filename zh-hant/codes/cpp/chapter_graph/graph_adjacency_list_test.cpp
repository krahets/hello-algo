/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* Driver Code */
int main() {
    /* 初始化無向圖 */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\n初始化後，圖為" << endl;
    graph.print();

    /* 新增邊 */
    // 頂點 1, 2 即 v[0], v[2]
    graph.addEdge(v[0], v[2]);
    cout << "\n新增邊 1-2 後，圖為" << endl;
    graph.print();

    /* 刪除邊 */
    // 頂點 1, 3 即 v[0], v[1]
    graph.removeEdge(v[0], v[1]);
    cout << "\n刪除邊 1-3 後，圖為" << endl;
    graph.print();

    /* 新增頂點 */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\n新增頂點 6 後，圖為" << endl;
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 即 v[1]
    graph.removeVertex(v[1]);
    cout << "\n刪除頂點 3 後，圖為" << endl;
    graph.print();

    // 釋放記憶體
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
