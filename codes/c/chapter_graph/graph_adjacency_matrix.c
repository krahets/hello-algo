/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

/* 基于邻接矩阵实现的无向图类结构 */
struct graphAdjMat {
    int *vertices;         // 顶点列表
    unsigned int **adjMat; // 邻接矩阵，元素代表“边”，索引代表“顶点索引”
    unsigned int size;     // 顶点数量
    unsigned int capacity; // 图容量
};

typedef struct graphAdjMat graphAdjMat;

/* 添加边 */
// 参数 i, j 对应 vertices 元素索引
void addEdge(graphAdjMat *t, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i >= t->size || j >= t->size || i == j) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    // 添加边
    // 参数 i, j 对应 vertices 元素索引
    t->adjMat[i][j] = 1;
    t->adjMat[j][i] = 1;
}

/* 删除边 */
// 参数 i, j 对应 vertices 元素索引
void removeEdge(graphAdjMat *t, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i >= t->size || j >= t->size || i == j) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    // 删除边
    // 参数 i, j 对应 vertices 元素索引
    t->adjMat[i][j] = 0;
    t->adjMat[j][i] = 0;
}

/* 添加顶点 */
void addVertex(graphAdjMat *t, int val) {
    // 如果实际使用不大于预设空间，则直接初始化新空间
    if (t->size < t->capacity) {
        t->vertices[t->size] = val; // 初始化新顶点值
        for (int i = 0; i < t->size; i++) {
            t->adjMat[i][t->size] = 0; // 邻接矩新列阵置0
        }
        memset(t->adjMat[t->size], 0, sizeof(unsigned int) * (t->size + 1)); // 将新增行置 0
        t->size++;
        return;
    }

    // 扩容，申请新的顶点数组
    int *temp = (int *)malloc(sizeof(int) * (t->size * 2));
    memcpy(temp, t->vertices, sizeof(int) * t->size);
    temp[t->size] = val;

    // 释放原数组
    free(t->vertices);
    t->vertices = temp;

    // 扩容，申请新的二维数组
    unsigned int **tempMat = (unsigned int **)malloc(sizeof(unsigned int *) * t->size * 2);
    unsigned int *tempMatLine = (unsigned int *)malloc(sizeof(unsigned int) * (t->size * 2) * (t->size * 2));
    memset(tempMatLine, 0, sizeof(unsigned int) * (t->size * 2) * (t->size * 2));
    for (int k = 0; k < t->size * 2; k++) {
        tempMat[k] = tempMatLine + k * (t->size * 2);
    }

    for (int i = 0; i < t->size; i++) {
        memcpy(tempMat[i], t->adjMat[i], sizeof(unsigned int) * t->size); // 原数据复制到新数组
    }

    for (int i = 0; i < t->size; i++) {
        tempMat[i][t->size] = 0; // 将新增列置 0
    }
    memset(tempMat[t->size], 0, sizeof(unsigned int) * (t->size + 1)); // 将新增行置 0

    // 释放原数组
    free(t->adjMat[0]);
    free(t->adjMat);

    // 扩容后，指向新地址
    t->adjMat = tempMat; // 指向新的邻接矩阵地址
    t->capacity = t->size * 2;
    t->size++;
}

/* 删除顶点 */
void removeVertex(graphAdjMat *t, unsigned int index) {
    // 越界检查
    if (index < 0 || index >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    for (int i = index; i < t->size - 1; i++) {
        t->vertices[i] = t->vertices[i + 1]; // 清除删除的顶点，并将其后所有顶点前移
    }
    t->vertices[t->size - 1] = 0; // 将被前移的最后一个顶点置 0

    // 清除邻接矩阵中删除的列
    for (int i = 0; i < t->size - 1; i++) {
        if (i < index) {
            for (int j = index; j < t->size - 1; j++) {
                t->adjMat[i][j] = t->adjMat[i][j + 1]; // 被删除列后的所有列前移
            }
        } else {
            memcpy(t->adjMat[i], t->adjMat[i + 1], sizeof(unsigned int) * t->size); // 被删除行的下方所有行上移
            for (int j = index; j < t->size; j++) {
                t->adjMat[i][j] = t->adjMat[i][j + 1]; // 被删除列后的所有列前移
            }
        }
    }
    t->size--;
}

/* 打印顶点与邻接矩阵 */
void printGraph(graphAdjMat *t) {
    if (t->size == 0) {
        printf("graph is empty\n");
        return;
    }
    printf("顶点列表 = [");
    for (int i = 0; i < t->size; i++) {
        if (i != t->size - 1) {
            printf("%d, ", t->vertices[i]);
        } else {
            printf("%d", t->vertices[i]);
        }
    }
    printf("]\n");
    printf("邻接矩阵 =\n[\n");
    for (int i = 0; i < t->size; i++) {
        printf("  [");
        for (int j = 0; j < t->size; j++) {
            if (j != t->size - 1) {
                printf("%u, ", t->adjMat[i][j]);
            } else {
                printf("%u", t->adjMat[i][j]);
            }
        }
        printf("],\n");
    }
    printf("]\n");
}

/* 构造函数 */
graphAdjMat *newGraphAjdMat(unsigned int numberVertices, int *vertices, unsigned int **adjMat) {
    // 申请内存
    graphAdjMat *newGraph = (graphAdjMat *)malloc(sizeof(graphAdjMat));   // 为图分配内存
    newGraph->vertices = (int *)malloc(sizeof(int) * numberVertices * 2); // 为顶点列表分配内存
    newGraph->adjMat = (unsigned int **)malloc(sizeof(unsigned int *) * numberVertices * 2); // 为邻接矩阵分配二维内存
    unsigned int *temp = (unsigned int *)malloc(sizeof(unsigned int) * numberVertices * 2 * numberVertices * 2); // 为邻接矩阵分配一维内存
    newGraph->size = numberVertices;                // 初始化顶点数量
    newGraph->capacity = numberVertices * 2;        // 初始化图容量

    // 配置二维数组
    for (int i = 0; i < numberVertices * 2; i++) {
        newGraph->adjMat[i] = temp + i * numberVertices * 2; // 将二维指针指向一维数组
    }

    // 赋值
    memcpy(newGraph->vertices, vertices, sizeof(int) * numberVertices);
    for (int i = 0; i < numberVertices; i++) {
        memcpy(newGraph->adjMat[i], adjMat[i], sizeof(unsigned int) * numberVertices); // 将传入的邻接矩阵赋值给结构体内邻接矩阵
    }

    // 返回结构体指针
    return newGraph;
}

/* Driver Code */
int main() {
    /* 初始化无向图 */
    int vertices[5] = {1, 3, 2, 5, 4};
    unsigned int **edge = (unsigned int **)malloc(sizeof(unsigned int *) * 5);
    // 用于构建二维数组的一维指针
    unsigned int *temp = (unsigned int *)malloc(sizeof(unsigned int) * 25);
    memset(temp, 0, sizeof(unsigned int) * 25);
    for (int k = 0; k < 5; k++) {
        edge[k] = temp + k * 5;
    }
    // 初始化边
    edge[0][1] = edge[1][0] = 1;
    edge[0][3] = edge[3][0] = 1;
    edge[1][2] = edge[2][1] = 1;
    edge[2][3] = edge[3][2] = 1;
    edge[2][4] = edge[4][2] = 1;
    edge[3][4] = edge[4][3] = 1;
    // 建立无向图
    graphAdjMat *graph = newGraphAjdMat(5, vertices, edge);
    free(edge);
    free(temp);
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
