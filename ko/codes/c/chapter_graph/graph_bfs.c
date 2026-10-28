/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 노드가 최대 100개라고 가정한다
#define MAX_SIZE 100

/* 노드 큐 구조체 */
typedef struct {
    Vertex *vertices[MAX_SIZE];
    int front, rear, size;
} Queue;

/* 생성자 */
Queue *newQueue() {
    Queue *q = (Queue *)malloc(sizeof(Queue));
    q->front = q->rear = q->size = 0;
    return q;
}

/* 큐가 비어 있는지 판단 */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* 큐 삽입 연산 */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* 큐에서 꺼내는 연산 */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* 정점을 이미 방문했는지 확인 */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // O(n) 시간에 순회하여 노드를 찾는다
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* 너비 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // 큐를 사용하여 BFS를 구현한다
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // 큐 맨 앞의 정점을 꺼낸다
        res[(*resSize)++] = vet;      // 방문한 정점을 기록한다
        // 해당 정점의 모든 인접 정점을 순회한다
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 이미 방문한 정점은 건너뛴다
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // 방문하지 않은 정점만 큐에 삽입한다
                visited[(*visitedSize)++] = node->vertex; // 해당 정점을 방문했다고 표시한다
            }
            node = node->next;
        }
    }
    // 메모리 해제
    free(queue);
}

/* 실행 코드 */
int main() {
    // 무방향 그래프 초기화
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
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

    // 너비 우선 순회
    // 정점 순회 순서
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // 이미 방문한 정점을 기록한다
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\n너비 우선 순회(BFS)의 정점 순서:\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 메모리 해제
    delGraphAdjList(graph);
    free(v);
    return 0;
}
