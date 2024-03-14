/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// 假设顶点数量最大为 100
#define MAX_SIZE 100

/* 基于邻接矩阵实现的无向图结构体 */
typedef struct {
    int vertices[MAX_SIZE];
    int adjMat[MAX_SIZE][MAX_SIZE];
    int size;
} GraphAdjMat;

/* 构造函数 */
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

/* 析构函数 */
void delGraphAdjMat(GraphAdjMat *graph) {
    free(graph);
}

/* 添加顶点 */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "图的顶点数量已达最大值\n");
        return;
    }
    // 添加第 n 个顶点，并将第 n 行和列置零
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* 删除顶点 */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "顶点索引越界\n");
        return;
    }
    // 在顶点列表中移除索引 index 的顶点
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // 在邻接矩阵中删除索引 index 的行
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // 在邻接矩阵中删除索引 index 的列
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* 添加边 */
// 参数 i, j 对应 vertices 元素索引
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "边索引越界或相等\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* 删除边 */
// 参数 i, j 对应 vertices 元素索引
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "边索引越界或相等\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* 打印邻接矩阵 */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("顶点列表 = ");
    printArray(graph->vertices, graph->size);
    printf("邻接矩阵 =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* Driver Code */
int main() {
    // 初始化无向图
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初始化后，图为\n");
    printGraphAdjMat(graph);

    /* 添加边 */
    // 顶点 1, 2 的索引分别为 0, 2
    addEdge(graph, 0, 2);
    printf("\n添加边 1-2 后，图为\n");
    printGraphAdjMat(graph);

    /* 删除边 */
    // 顶点 1, 3 的索引分别为 0, 1
    removeEdge(graph, 0, 1);
    printf("\n删除边 1-3 后，图为\n");
    printGraphAdjMat(graph);

    /* 添加顶点 */
    addVertex(graph, 6);
    printf("\n添加顶点 6 后，图为\n");
    printGraphAdjMat(graph);

    /* 删除顶点 */
    // 顶点 3 的索引为 1
    removeVertex(graph, 1);
    printf("\n删除顶点 3 后，图为\n");
    printGraphAdjMat(graph);

    // 释放内存
    delGraphAdjMat(graph);

    return 0;
}
