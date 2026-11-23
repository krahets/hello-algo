/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 노드가 최대 100개라고 가정한다
#define MAX_SIZE 100

/* 정점을 이미 방문했는지 확인 */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // O(n) 시간에 순회하여 노드를 찾는다
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* 깊이 우선 순회 보조 함수 */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // 방문한 정점을 기록한다
    res[(*resSize)++] = vet;
    // 해당 정점의 모든 인접 정점을 순회한다
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // 이미 방문한 정점은 건너뛴다
        if (!isVisited(res, *resSize, node->vertex)) {
            // 인접 정점을 재귀적으로 방문한다
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* 실행 코드 */
int main() {
    // 무방향 그래프 초기화
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
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

    // 깊이 우선 순회
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\n깊이 우선 순회(DFS)의 정점 순서:\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 메모리 해제
    delGraphAdjList(graph);
    free(v);
    return 0;
}
