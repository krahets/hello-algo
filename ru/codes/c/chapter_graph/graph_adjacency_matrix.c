/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// Допустим, вершин не больше 100
#define MAX_SIZE 100

/* Структура неориентированного графа с матрицей смежности */
typedef struct {
    int vertices[MAX_SIZE];
    int adjMat[MAX_SIZE][MAX_SIZE];
    int size;
} GraphAdjMat;

/* Конструктор */
GraphAdjMat *newGraphAdjMat() {
    GraphAdjMat *graph = (GraphAdjMat *)malloc(sizeof(GraphAdjMat));
    graph->size = 0;
    for (int i = 0; i < MAX_SIZE; i++) {
        for (int j = 0; j < MAX_SIZE; j++) {
            graph->adjMat[i][j] = 0;
        }
    }
    return graph;
}

/* Деструктор */
void delGraphAdjMat(GraphAdjMat *graph) {
    free(graph);
}

/* Добавить вершину */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "Достигнуто максимальное число вершин графа\n");
        return;
    }
    // Добавить n-ю вершину и заполнить нулями n-ю строку и n-й столбец
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* Удалить вершину */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "Индекс вершины вне диапазона\n");
        return;
    }
    // Удалить из списка вершин вершину с индексом index
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // Удалить из матрицы смежности строку с индексом index
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // Удалить из матрицы смежности столбец с индексом index
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* Добавить ребро */
// Параметры i и j — индексы элементов vertices
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "Индексы концов ребра вне диапазона или совпадают\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* Удалить ребро */
// Параметры i и j — индексы элементов vertices
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "Индексы концов ребра вне диапазона или совпадают\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* Вывести матрицу смежности */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("Список вершин = ");
    printArray(graph->vertices, graph->size);
    printf("Матрица смежности =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* Пример использования */
int main() {
    // Инициализировать неориентированный граф
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nГраф после инициализации:\n");
    printGraphAdjMat(graph);

    /* Добавить ребро */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    addEdge(graph, 0, 2);
    printf("\nГраф после добавления ребра 1–2:\n");
    printGraphAdjMat(graph);

    /* Удалить ребро */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    removeEdge(graph, 0, 1);
    printf("\nГраф после удаления ребра 1–3:\n");
    printGraphAdjMat(graph);

    /* Добавить вершину */
    addVertex(graph, 6);
    printf("\nГраф после добавления вершины 6:\n");
    printGraphAdjMat(graph);

    /* Удалить вершину */
    // Индекс вершины 3 равен 1
    removeVertex(graph, 1);
    printf("\nГраф после удаления вершины 3:\n");
    printGraphAdjMat(graph);

    // Освободить память
    delGraphAdjMat(graph);

    return 0;
}
