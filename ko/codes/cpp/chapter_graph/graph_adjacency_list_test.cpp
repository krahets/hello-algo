/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* 실행 코드 */
int main() {
    /* 무방향 그래프 초기화 */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\n초기화한 후의 그래프" << endl;
    graph.print();

    /* 간선 추가 */
    // 정점 1, 2는 각각 v[0], v[2]이다
    graph.addEdge(v[0], v[2]);
    cout << "\n간선 1-2를 추가한 후의 그래프" << endl;
    graph.print();

    /* 간선 삭제 */
    // 정점 1, 3은 각각 v[0], v[1]이다
    graph.removeEdge(v[0], v[1]);
    cout << "\n간선 1-3을 삭제한 후의 그래프" << endl;
    graph.print();

    /* 정점 추가 */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\n정점 6을 추가한 후의 그래프" << endl;
    graph.print();

    /* 정점 삭제 */
    // 정점 3은 v[1]이다
    graph.removeVertex(v[1]);
    cout << "\n정점 3을 삭제한 후의 그래프" << endl;
    graph.print();

    // 메모리 해제
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
