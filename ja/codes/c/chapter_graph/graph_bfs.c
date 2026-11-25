/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// ノード数の上限を 100 とする
#define MAX_SIZE 100

/* ノードを格納するキューの構造体 */
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

/* キューが空か判定する */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* キューに追加する */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* キューから取り出す */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* 頂点が訪問済みか調べる */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // ノードを順に探すため、O(n) 時間かかる
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* 幅優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // BFS にキューを使う
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // キューの先頭から頂点を取り出す
        res[(*resSize)++] = vet;      // 訪問した頂点を記録する
        // この頂点の隣接頂点をすべて調べる
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 訪問済みの頂点を飛ばす
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // 未訪問の頂点だけをキューに追加する
                visited[(*visitedSize)++] = node->vertex; // この頂点を訪問済みにする
            }
            node = node->next;
        }
    }
    // メモリを解放する
    free(queue);
}

/* 実行例 */
int main() {
    // 無向グラフを初期化する
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // すべての頂点と辺を追加する
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\n初期化後のグラフ：\n");
    printGraph(graph);

    // 幅優先探索
    // 頂点の訪問順
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // 訪問済みの頂点を記録する
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\n幅優先探索（BFS）での頂点の訪問順：\n");
    printArray(vetsToVals(res, resSize), resSize);

    // メモリを解放する
    delGraphAdjList(graph);
    free(v);
    return 0;
}
