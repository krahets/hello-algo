/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// ノード数の上限を 100 と仮定
#define MAX_SIZE 100

/* 頂点が訪問済みかを確認 */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // 走査してノードを探すため、O(n) 時間を要する
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* 深さ優先走査の補助関数 */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // 訪問した頂点を記録
    res[(*resSize)++] = vet;
    // この頂点のすべての隣接頂点を走査
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // 訪問済みの頂点をスキップ
        if (!isVisited(res, *resSize, node->vertex)) {
            // 隣接頂点を再帰的に訪問
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* 深さ優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* Driver Code */
int main() {
    // 無向グラフを初期化
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // すべての頂点と辺を追加
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初期化後のグラフは\n");
    printGraph(graph);

    // 深さ優先探索
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\n深さ優先探索（DFS）の頂点列は次のとおりです\n");
    printArray(vetsToVals(res, resSize), resSize);

    // メモリを解放する
    delGraphAdjList(graph);
    free(v);
    return 0;
}
