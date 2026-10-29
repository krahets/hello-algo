/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* 実行用コード */
int main() {
    int vals[] = {1, 3, 2, 5, 4};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // すべての頂点と辺を追加する
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初期化後のグラフ\n");
    printGraph(graph);

    /* 辺を追加する */
    // 頂点 1, 2 は v[0], v[2] に対応する
    addEdge(graph, v[0], v[2]);
    printf("\n辺 1-2 を追加した後のグラフ\n");
    printGraph(graph);

    /* 辺を削除する */
    // 頂点 1, 3 は v[0], v[1] に対応する
    removeEdge(graph, v[0], v[1]);
    printf("\n辺 1-3 を削除した後のグラフ\n");
    printGraph(graph);

    /* 頂点を追加する */
    Vertex *v5 = newVertex(6);
    addVertex(graph, v5);
    printf("\n頂点 6 を追加した後のグラフ\n");
    printGraph(graph);

    /* 頂点を削除する */
    // 頂点 3 は v[1] に対応する
    removeVertex(graph, v[1]);
    printf("\n頂点 3 を削除した後のグラフ：\n");
    printGraph(graph);

    // メモリを解放する
    delGraphAdjList(graph);
    free(v);
    return 0;
}
