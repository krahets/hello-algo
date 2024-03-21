/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 假設節點最大數量為 100
#define MAX_SIZE 100

/* 檢查頂點是否已被訪問 */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // 走訪查詢節點，使用 O(n) 時間
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* 深度優先走訪輔助函式 */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // 記錄訪問頂點
    res[(*resSize)++] = vet;
    // 走訪該頂點的所有鄰接頂點
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // 跳過已被訪問的頂點
        if (!isVisited(res, *resSize, node->vertex)) {
            // 遞迴訪問鄰接頂點
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* Driver Code */
int main() {
    // 初始化無向圖
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // 新增所有頂點和邊
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初始化後，圖為\n");
    printGraph(graph);

    // 深度優先走訪
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\n深度優先走訪（DFS）頂點序列為\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 釋放記憶體
    delGraphAdjList(graph);
    free(v);
    return 0;
}
