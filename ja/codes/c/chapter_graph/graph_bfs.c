/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// ノード数の上限を 100 と仮定
#define MAX_SIZE 100

/* ノードキュー構造体 */
typedef struct {
    Vertex *vertices[MAX_SIZE];
    int front, rear, size;
} Queue;

/* コンストラクタ */
Queue *newQueue() {
    Queue *q = (Queue *)malloc(sizeof(Queue));
    q->front = q->rear = q->size = 0;
    return q;
}

/* キューが空かどうかを判定 */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* エンキュー操作 */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* デキュー操作 */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* 頂点が訪問済みかを確認 */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // 走査してノードを探すため、O(n) 時間を要する
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* 幅優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // BFS の実装にキューを用いる
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // 先頭の頂点をデキュー
        res[(*resSize)++] = vet;      // 訪問した頂点を記録
        // この頂点のすべての隣接頂点を走査
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 訪問済みの頂点をスキップ
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // 未訪問の頂点のみをキューに追加
                visited[(*visitedSize)++] = node->vertex; // この頂点を訪問済みにする
            }
            node = node->next;
        }
    }
    // メモリを解放する
    free(queue);
}

/* Driver Code */
int main() {
    // 無向グラフを初期化
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
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

    // 幅優先探索
    // 頂点の走査順序
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // 訪問済みの頂点を記録する
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\n幅優先探索（BFS）の頂点列は次のとおりです\n");
    printArray(vetsToVals(res, resSize), resSize);

    // メモリを解放する
    delGraphAdjList(graph);
    free(v);
    return 0;
}
