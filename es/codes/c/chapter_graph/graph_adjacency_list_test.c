/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* Driver Code */
int main() {
    int vals[] = {1, 3, 2, 5, 4};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // 添加所有顶点和边
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初始化后，图为\n");
    printGraph(graph);

    /* 添加边 */
    // 顶点 1, 2 即 v[0], v[2]
    addEdge(graph, v[0], v[2]);
    printf("\n添加边 1-2 后，图为\n");
    printGraph(graph);

    /* 删除边 */
    // 顶点 1, 3 即 v[0], v[1]
    removeEdge(graph, v[0], v[1]);
    printf("\n删除边 1-3 后，图为\n");
    printGraph(graph);

    /* 添加顶点 */
    Vertex *v5 = newVertex(6);
    addVertex(graph, v5);
    printf("\n添加顶点 6 后，图为\n");
    printGraph(graph);

    /* 删除顶点 */
    // 顶点 3 即 v[1]
    removeVertex(graph, v[1]);
    printf("\n删除顶点 3 后，图为:\n");
    printGraph(graph);

    // 释放内存
    delGraphAdjList(graph);
    free(v);
    return 0;
}
