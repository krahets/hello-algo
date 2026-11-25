/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// Допустим, узлов не больше 100
#define MAX_SIZE 100

/* Проверить, посещена ли вершина */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // Последовательно найти узел за время O(n)
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* Вспомогательная функция обхода в глубину */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // Записать посещённую вершину
    res[(*resSize)++] = vet;
    // Перебрать всех соседей этой вершины
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // Пропустить посещённые вершины
        if (!isVisited(res, *resSize, node->vertex)) {
            // Рекурсивно посетить соседнюю вершину
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* Обход в глубину */
// Список смежности позволяет получить всех соседей заданной вершины
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* Пример использования */
int main() {
    // Инициализировать неориентированный граф
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
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

    // Обход в глубину
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\nПорядок обхода вершин в глубину (DFS):\n");
    printArray(vetsToVals(res, resSize), resSize);

    // Освободить память
    delGraphAdjList(graph);
    free(v);
    return 0;
}
