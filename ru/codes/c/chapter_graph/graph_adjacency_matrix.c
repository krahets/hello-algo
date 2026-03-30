/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// Предположить, что максимальное число вершин равно 100
#define MAX_SIZE 100

/* Структура неориентированного графа на основе матрицы смежности */
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

/* Добавление вершины */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "Количество вершин графа уже достигло максимума\n");
        return;
    }
    // Добавить n-ю вершину и обнулить n-ю строку и столбец
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* Удаление вершины */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "индекс вершины выходит за границы\n");
        return;
    }
    // Удалить вершину с индексом index из списка вершин
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // Удалить строку с индексом index из матрицы смежности
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // Удалить столбец с индексом index из матрицы смежности
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* Добавление ребра */
// Параметры i и j соответствуют индексам элементов vertices
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "индексы ребра выходят за границы или совпадают\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* Удаление ребра */
// Параметры i и j соответствуют индексам элементов vertices
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "индексы ребра выходят за границы или совпадают\n");
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

/* Driver Code */
int main() {
    // Инициализация неориентированного графа
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nПосле инициализации граф имеет вид\n");
    printGraphAdjMat(graph);

    /* Добавление ребра */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    addEdge(graph, 0, 2);
    printf("\nПосле добавления ребра 1-2 граф имеет вид\n");
    printGraphAdjMat(graph);

    /* Удаление ребра */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    removeEdge(graph, 0, 1);
    printf("\nПосле удаления ребра 1-3 граф имеет вид\n");
    printGraphAdjMat(graph);

    /* Добавление вершины */
    addVertex(graph, 6);
    printf("\nПосле добавления вершины 6 граф имеет вид\n");
    printGraphAdjMat(graph);

    /* Удаление вершины */
    // Индекс вершины 3 равен 1
    removeVertex(graph, 1);
    printf("\nПосле удаления вершины 3 граф имеет вид\n");
    printGraphAdjMat(graph);

    // Освободить память
    delGraphAdjMat(graph);

    return 0;
}
