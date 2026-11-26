/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// 假設頂點數量上限為 100
#define MAX_SIZE 100

/* 以鄰接矩陣實作的無向圖結構 */
typedef struct {
    int vertices[MAX_SIZE];
    int adjMat[MAX_SIZE][MAX_SIZE];
    int size;
} GraphAdjMat;

/* 建構函式 */
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

/* 解構函式 */
void delGraphAdjMat(GraphAdjMat *graph) {
    free(graph);
}

/* 新增頂點 */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "圖的頂點數量已達上限\n");
        return;
    }
    // 新增第 n 個頂點，將第 n 橫列與第 n 直行的元素設為零
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* 刪除頂點 */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "頂點索引超出範圍\n");
        return;
    }
    // 從頂點清單中移除索引為 index 的頂點
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // 從鄰接矩陣中刪除索引為 index 的橫列
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // 從鄰接矩陣中刪除索引為 index 的直行
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* 新增邊 */
// 參數 i、j 為 vertices 中的元素索引
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "邊的兩個端點索引超出範圍或彼此相同\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* 刪除邊 */
// 參數 i、j 為 vertices 中的元素索引
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "邊的兩個端點索引超出範圍或彼此相同\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* 印出鄰接矩陣 */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("頂點清單 = ");
    printArray(graph->vertices, graph->size);
    printf("鄰接矩陣 =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* Driver Code */
int main() {
    // 初始化無向圖
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初始化後的圖為\n");
    printGraphAdjMat(graph);

    /* 新增邊 */
    // 頂點 1、2 的索引分別為 0、2
    addEdge(graph, 0, 2);
    printf("\n新增邊 1-2 後的圖為\n");
    printGraphAdjMat(graph);

    /* 刪除邊 */
    // 頂點 1、3 的索引分別為 0、1
    removeEdge(graph, 0, 1);
    printf("\n刪除邊 1-3 後的圖為\n");
    printGraphAdjMat(graph);

    /* 新增頂點 */
    addVertex(graph, 6);
    printf("\n新增頂點 6 後的圖為\n");
    printGraphAdjMat(graph);

    /* 刪除頂點 */
    // 頂點 3 的索引為 1
    removeVertex(graph, 1);
    printf("\n刪除頂點 3 後的圖為\n");
    printGraphAdjMat(graph);

    // 釋放記憶體
    delGraphAdjMat(graph);

    return 0;
}
