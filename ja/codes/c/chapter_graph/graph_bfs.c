/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// ノード数は最大 100 と仮定する
#define MAX_SIZE 100

/* ノードのキューの構造体 */
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

/* キューが空か判定 */
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

/* 頂点が訪問済みかどうかを確認する */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // 走査してノードを探すため、O(n) の時間を要する
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* 幅優先走査 */
// 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // BFS の実装にキューを使う
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // キューの先頭の頂点をデキューする
        res[(*resSize)++] = vet;      // 訪問した頂点を記録する
        // この頂点に隣接する全頂点を走査する
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 訪問済みの頂点をスキップする
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // 未訪問の頂点だけをエンキューする
                visited[(*visitedSize)++] = node->vertex; // この頂点を訪問済みにする
            }
            node = node->next;
        }
    }
    // メモリを解放する
    free(queue);
}

/* 実行用コード */
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
    printf("\n初期化後のグラフ\n");
    printGraph(graph);

    // 幅優先走査
    // 頂点の走査順序
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // 訪問済みの頂点を記録するために使う
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\n幅優先走査（BFS）の頂点の順序\n");
    printArray(vetsToVals(res, resSize), resSize);

    // メモリを解放する
    delGraphAdjList(graph);
    free(v);
    return 0;
}
