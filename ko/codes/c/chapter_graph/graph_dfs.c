/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 최대 노드 수를 100으로 가정
#define MAX_SIZE 100

/* 이미 방문한 정점인지 확인 */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // 노드를 순회하여 검색하는 데 O(n) 시간 소요
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* 깊이 우선 순회 보조 함수 */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // 방문한 정점 기록
    res[(*resSize)++] = vet;
    // 현재 정점에 인접한 모든 정점 순회
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // 이미 방문한 정점은 건너뜀
        if (!isVisited(res, *resSize, node->vertex)) {
            // 인접 정점을 재귀적으로 방문
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* 실행 예제 */
int main() {
    // 무방향 그래프 초기화
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // 모든 정점과 간선 추가
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n초기화한 그래프\n");
    printGraph(graph);

    // 깊이 우선 순회
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\n깊이 우선 순회(DFS)의 정점 방문 순서\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 메모리 해제
    delGraphAdjList(graph);
    free(v);
    return 0;
}
