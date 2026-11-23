/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// 정점이 최대 100개라고 가정한다
#define MAX_SIZE 100

/* 인접 행렬로 구현한 무방향 그래프 구조체 */
typedef struct {
    int vertices[MAX_SIZE];
    int adjMat[MAX_SIZE][MAX_SIZE];
    int size;
} GraphAdjMat;

/* 생성자 */
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

/* 소멸자 */
void delGraphAdjMat(GraphAdjMat *graph) {
    free(graph);
}

/* 정점 추가 */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "그래프의 정점 개수가 최댓값에 도달했다\n");
        return;
    }
    // n번째 정점을 추가하고 n번째 행과 열을 0으로 설정한다
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* 정점 삭제 */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "정점 인덱스가 범위를 벗어났다\n");
        return;
    }
    // 정점 리스트에서 인덱스 index의 정점을 제거한다
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // 인접 행렬에서 인덱스 index의 행을 삭제한다
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // 인접 행렬에서 인덱스 index의 열을 삭제한다
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* 간선 추가 */
// 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "간선 인덱스가 범위를 벗어나거나 서로 같다\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* 간선 삭제 */
// 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "간선 인덱스가 범위를 벗어나거나 서로 같다\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* 인접 행렬 출력 */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("정점 리스트 = ");
    printArray(graph->vertices, graph->size);
    printf("인접 행렬 =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* 실행 코드 */
int main() {
    // 무방향 그래프 초기화
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n초기화한 그래프:\n");
    printGraphAdjMat(graph);

    /* 간선 추가 */
    // 정점 1, 2의 인덱스는 각각 0, 2이다
    addEdge(graph, 0, 2);
    printf("\n간선 1-2를 추가한 후의 그래프:\n");
    printGraphAdjMat(graph);

    /* 간선 삭제 */
    // 정점 1, 3의 인덱스는 각각 0, 1이다
    removeEdge(graph, 0, 1);
    printf("\n간선 1-3을 삭제한 후의 그래프:\n");
    printGraphAdjMat(graph);

    /* 정점 추가 */
    addVertex(graph, 6);
    printf("\n정점 6을 추가한 후의 그래프:\n");
    printGraphAdjMat(graph);

    /* 정점 삭제 */
    // 정점 3의 인덱스는 1이다
    removeVertex(graph, 1);
    printf("\n정점 3을 삭제한 후의 그래프:\n");
    printGraphAdjMat(graph);

    // 메모리 해제
    delGraphAdjMat(graph);

    return 0;
}
