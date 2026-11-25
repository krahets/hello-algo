/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 假設節點數量上限為 100
#define MAX_SIZE 100

/* 檢查頂點是否已走訪 */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // 走訪並尋找節點，耗時 O(n)
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* 深度優先走訪的輔助函式 */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // 記錄走訪的頂點
    res[(*resSize)++] = vet;
    // 走訪此頂點的所有相鄰頂點
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // 略過已走訪的頂點
        if (!isVisited(res, *resSize, node->vertex)) {
            // 遞迴走訪相鄰頂點
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
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
    // 加入所有頂點和邊
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初始化後的圖為\n");
    printGraph(graph);

    // 深度優先走訪
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\n深度優先走訪（DFS）的頂點順序為\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 釋放記憶體
    delGraphAdjList(graph);
    free(v);
    return 0;
}
