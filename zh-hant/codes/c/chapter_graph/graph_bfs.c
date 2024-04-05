/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 假設節點最大數量為 100
#define MAX_SIZE 100

/* 節點佇列結構體 */
typedef struct {
    Vertex *vertices[MAX_SIZE];
    int front, rear, size;
} Queue;

/* 建構子 */
Queue *newQueue() {
    Queue *q = (Queue *)malloc(sizeof(Queue));
    q->front = q->rear = q->size = 0;
    return q;
}

/* 判斷佇列是否為空 */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* 入列操作 */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* 出列操作 */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* 檢查頂點是否已被訪問 */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // 走訪查詢節點，使用 O(n) 時間
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* 廣度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // 佇列用於實現 BFS
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // 佇列首頂點出隊
        res[(*resSize)++] = vet;      // 記錄訪問頂點
        // 走訪該頂點的所有鄰接頂點
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 跳過已被訪問的頂點
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // 只入列未訪問的頂點
                visited[(*visitedSize)++] = node->vertex; // 標記該頂點已被訪問
            }
            node = node->next;
        }
    }
    // 釋放記憶體
    free(queue);
}

/* Driver Code */
int main() {
    // 初始化無向圖
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
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

    // 廣度優先走訪
    // 頂點走訪序列
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // 用於記錄已被訪問過的頂點
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\n廣度優先走訪（BFS）頂點序列為\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 釋放記憶體
    delGraphAdjList(graph);
    free(v);
    return 0;
}
