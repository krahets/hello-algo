/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// Допустим, узлов не больше 100
#define MAX_SIZE 100

/* Структура очереди узлов */
typedef struct {
    Vertex *vertices[MAX_SIZE];
    int front, rear, size;
} Queue;

/* Конструктор */
Queue *newQueue() {
    Queue *q = (Queue *)malloc(sizeof(Queue));
    q->front = q->rear = q->size = 0;
    return q;
}

/* Проверить, пуста ли очередь */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* Добавить в очередь */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* Извлечь из очереди */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* Проверить, посещена ли вершина */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // Последовательно найти узел за время O(n)
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* Обход в ширину */
// Список смежности позволяет получить всех соседей заданной вершины
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // Очередь для обхода BFS
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // Начать с вершины vet и повторять, пока не будут посещены все вершины
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // Извлечь первую вершину из очереди
        res[(*resSize)++] = vet;      // Записать посещённую вершину
        // Перебрать всех соседей этой вершины
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // Пропустить посещённые вершины
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // Добавить в очередь только непосещённые вершины
                visited[(*visitedSize)++] = node->vertex; // Отметить вершину как посещённую
            }
            node = node->next;
        }
    }
    // Освободить память
    free(queue);
}

/* Пример использования */
int main() {
    // Инициализировать неориентированный граф
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // Добавить все вершины и рёбра
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nГраф после инициализации:\n");
    printGraph(graph);

    // Обход в ширину
    // Порядок обхода вершин
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // Для учёта посещённых вершин
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\nПорядок обхода вершин в ширину (BFS):\n");
    printArray(vetsToVals(res, resSize), resSize);

    // Освободить память
    delGraphAdjList(graph);
    free(v);
    return 0;
}
