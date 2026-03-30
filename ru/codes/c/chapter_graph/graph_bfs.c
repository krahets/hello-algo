/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// Предположим, что максимальное число узлов равно 100
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

/* Проверка, пуста ли очередь */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* Операция добавления в очередь */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* Операция извлечения из очереди */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* Проверить, была ли вершина уже посещена */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // Искать узел обходом за O(n) времени
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* Обход в ширину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // Очередь используется для реализации BFS
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // Извлечь головную вершину из очереди
        res[(*resSize)++] = vet;      // Отметить посещенную вершину
        // Обойти все смежные вершины данной вершины
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // Пропустить уже посещенную вершину
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // Помещать в очередь только непосещенные вершины
                visited[(*visitedSize)++] = node->vertex; // Отметить эту вершину как посещенную
            }
            node = node->next;
        }
    }
    // Освободить память
    free(queue);
}

/* Driver Code */
int main() {
    // Инициализация неориентированного графа
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // Добавить все вершины и ребра
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nПосле инициализации граф имеет вид\n");
    printGraph(graph);

    // Обход в ширину
    // Последовательность обхода вершин
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // Используется для записи уже посещенных вершин
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\nПоследовательность вершин при обходе в ширину (BFS)\n");
    printArray(vetsToVals(res, resSize), resSize);

    // Освободить память
    delGraphAdjList(graph);
    free(v);
    return 0;
}
