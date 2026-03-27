/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// Предположим, что максимальное число узлов равно 100
#define MAX_SIZE 100

/* Проверить, была ли вершина уже посещена */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // Искать узел обходом за O(n) времени
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* Вспомогательная функция обхода в глубину */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // Отметить посещенную вершину
    res[(*resSize)++] = vet;
    // Обойти все смежные вершины данной вершины
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // Пропустить уже посещенную вершину
        if (!isVisited(res, *resSize, node->vertex)) {
            // Рекурсивно обходить смежные вершины
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* Driver Code */
int main() {
    // Инициализация неориентированного графа
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
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

    // Обход в глубину
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\nПоследовательность вершин при обходе в глубину (DFS)\n");
    printArray(vetsToVals(res, resSize), resSize);

    // Освободить память
    delGraphAdjList(graph);
    free(v);
    return 0;
}
