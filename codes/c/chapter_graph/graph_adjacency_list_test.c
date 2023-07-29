/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* Driver Code */
int main() {
    /* 初始化无向图 */
    graphAdjList *graph = newGraphAdjList(5);
    // 初始化顶点
    addVertex(graph, 1);
    addVertex(graph, 3);
    addVertex(graph, 2);
    addVertex(graph, 5);
    addVertex(graph, 4);
    // 初始化边
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 3);
    addEdge(graph, 1, 2);
    addEdge(graph, 2, 3);
    addEdge(graph, 2, 4);
    addEdge(graph, 3, 4);
    printf("\n初始化后，图为:\n");
    printGraph(graph);

    /* 添加边 */
    // 顶点 1, 2 的索引分别为 0, 2
    addEdge(graph, 0, 2);
    printf("\n添加边 1-2 后图为\n");
    printGraph(graph);

    /* 删除边 */
    // 顶点 1, 3 的索引分别为 0, 1
    removeEdge(graph, 0, 1);
    printf("\n删除边 1-3 后，图为\n");
    printGraph(graph);

    /* 添加顶点 */
    addVertex(graph, 6);
    printf("\n添加顶点 6 后，图为\n");
    printGraph(graph);

    /* 删除顶点 */
    // 顶点 3 的索引为 1
    removeVertex(graph, 1);
    printf("\n删除顶点 3 后，图为\n");
    printGraph(graph);

    return 0;
}
