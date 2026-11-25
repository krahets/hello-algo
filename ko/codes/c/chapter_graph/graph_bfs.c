/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// 최대 노드 수를 100으로 가정
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

/* 큐가 비었는지 확인 */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* 큐에 삽입 */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* 큐에서 꺼내기 */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* 이미 방문한 정점인지 확인 */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // 노드를 순회하여 검색하는 데 O(n) 시간 소요
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* 너비 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // BFS 구현에 사용하는 큐
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // 큐의 맨 앞 정점을 꺼냄
        res[(*resSize)++] = vet;      // 방문한 정점 기록
        // 현재 정점에 인접한 모든 정점 순회
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // 이미 방문한 정점은 건너뜀
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // 아직 방문하지 않은 정점만 큐에 삽입
                visited[(*visitedSize)++] = node->vertex; // 이 정점을 방문한 것으로 표시
            }
            node = node->next;
        }
    }
    // 메모리 해제
    free(queue);
}

/* 실행 예제 */
int main() {
    // 무방향 그래프 초기화
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
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

    // 너비 우선 순회
    // 정점 방문 순서
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // 이미 방문한 정점을 기록하는 용도
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\n너비 우선 순회(BFS)의 정점 방문 순서\n");
    printArray(vetsToVals(res, resSize), resSize);

    // 메모리 해제
    delGraphAdjList(graph);
    free(v);
    return 0;
}
