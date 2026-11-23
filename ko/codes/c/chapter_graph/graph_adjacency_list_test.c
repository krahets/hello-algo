/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* 실행 코드 */
int main() {
    int vals[] = {1, 3, 2, 5, 4};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // 모든 정점과 간선을 추가한다
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n초기화한 그래프:\n");
    printGraph(graph);

    /* 간선 추가 */
    // 정점 1, 2는 각각 v[0], v[2]이다
    addEdge(graph, v[0], v[2]);
    printf("\n간선 1-2를 추가한 후의 그래프:\n");
    printGraph(graph);

    /* 간선 삭제 */
    // 정점 1, 3은 각각 v[0], v[1]이다
    removeEdge(graph, v[0], v[1]);
    printf("\n간선 1-3을 삭제한 후의 그래프:\n");
    printGraph(graph);

    /* 정점 추가 */
    Vertex *v5 = newVertex(6);
    addVertex(graph, v5);
    printf("\n정점 6을 추가한 후의 그래프:\n");
    printGraph(graph);

    /* 정점 삭제 */
    // 정점 3은 v[1]이다
    removeVertex(graph, v[1]);
    printf("\n정점 3을 삭제한 후의 그래프:\n");
    printGraph(graph);

    // 메모리 해제
    delGraphAdjList(graph);
    free(v);
    return 0;
}
