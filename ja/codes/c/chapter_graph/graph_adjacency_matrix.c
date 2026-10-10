/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// 頂点数の最大値を 100 と仮定する
#define MAX_SIZE 100

/* 隣接行列に基づく無向グラフ構造体 */
typedef struct {
    int vertices[MAX_SIZE];
    int adjMat[MAX_SIZE][MAX_SIZE];
    int size;
} GraphAdjMat;

/* コンストラクタ */
GraphAdjMat *newGraphAdjMat() {
    GraphAdjMat *graph = (GraphAdjMat *)malloc(sizeof(GraphAdjMat));
    graph->size = 0;
    for (int i = 0; i < MAX_SIZE; i++) {
        for (int j = 0; j < MAX_SIZE; j++) {
            graph->adjMat[i][j] = 0;
        }
    }
    return graph;
}

/* デストラクタ */
void delGraphAdjMat(GraphAdjMat *graph) {
    free(graph);
}

/* 頂点を追加 */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "グラフの頂点数が最大値に達しました\n");
        return;
    }
    // n 番目の頂点を追加し、n 行目と n 列目を 0 にする
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* 頂点を削除 */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "頂点インデックスが範囲外です\n");
        return;
    }
    // 頂点リストから index の頂点を削除する
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // 隣接行列で index 行を削除する
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // 隣接行列で index 列を削除する
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* 辺を追加 */
// 引数 i, j は vertices の要素インデックスに対応する
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "辺インデックスが範囲外であるか、同一です\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* 辺を削除 */
// 引数 i, j は vertices の要素インデックスに対応する
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "辺インデックスが範囲外であるか、同一です\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* 隣接行列を出力 */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("頂点リスト = ");
    printArray(graph->vertices, graph->size);
    printf("隣接行列 =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* Driver Code */
int main() {
    // 無向グラフを初期化
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初期化後のグラフは\n");
    printGraphAdjMat(graph);

    /* 辺を追加 */
    // 頂点 1, 2 のインデックスはそれぞれ 0, 2
    addEdge(graph, 0, 2);
    printf("\n辺 1-2 を追加した後のグラフは\n");
    printGraphAdjMat(graph);

    /* 辺を削除 */
    // 頂点 1, 3 のインデックスはそれぞれ 0, 1
    removeEdge(graph, 0, 1);
    printf("\n辺 1-3 を削除した後のグラフは\n");
    printGraphAdjMat(graph);

    /* 頂点を追加 */
    addVertex(graph, 6);
    printf("\n頂点 6 を追加した後のグラフは\n");
    printGraphAdjMat(graph);

    /* 頂点を削除 */
    // 頂点 3 のインデックスは 1
    removeVertex(graph, 1);
    printf("\n頂点 3 を削除すると、グラフは次のようになります\n");
    printGraphAdjMat(graph);

    // メモリを解放する
    delGraphAdjMat(graph);

    return 0;
}
