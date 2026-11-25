/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* Пример использования */
int main() {
    int vals[] = {1, 3, 2, 5, 4};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
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

    /* Добавить ребро */
    // Вершинам 1 и 2 соответствуют v[0] и v[2]
    addEdge(graph, v[0], v[2]);
    printf("\nГраф после добавления ребра 1–2:\n");
    printGraph(graph);

    /* Удалить ребро */
    // Вершинам 1 и 3 соответствуют v[0] и v[1]
    removeEdge(graph, v[0], v[1]);
    printf("\nГраф после удаления ребра 1–3:\n");
    printGraph(graph);

    /* Добавить вершину */
    Vertex *v5 = newVertex(6);
    addVertex(graph, v5);
    printf("\nГраф после добавления вершины 6:\n");
    printGraph(graph);

    /* Удалить вершину */
    // Вершине 3 соответствует v[1]
    removeVertex(graph, v[1]);
    printf("\nГраф после удаления вершины 3:\n");
    printGraph(graph);

    // Освободить память
    delGraphAdjList(graph);
    free(v);
    return 0;
}
