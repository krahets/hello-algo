/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// Предположим, что максимальное число узлов равно 100
#define MAX_SIZE 100

/* Структура узла */
typedef struct AdjListNode {
    Vertex *vertex;           // Вершина
    struct AdjListNode *next; // Узел-преемник
} AdjListNode;

/* Класс неориентированного графа на основе списка смежности */
typedef struct {
    AdjListNode *heads[MAX_SIZE]; // Массив узлов
    int size;                     // Количество узлов
} GraphAdjList;

/* Конструктор */
GraphAdjList *newGraphAdjList() {
    GraphAdjList *graph = (GraphAdjList *)malloc(sizeof(GraphAdjList));
    if (!graph) {
        return NULL;
    }
    graph->size = 0;
    for (int i = 0; i < MAX_SIZE; i++) {
        graph->heads[i] = NULL;
    }
    return graph;
}

/* Деструктор */
void delGraphAdjList(GraphAdjList *graph) {
    for (int i = 0; i < graph->size; i++) {
        AdjListNode *cur = graph->heads[i];
        while (cur != NULL) {
            AdjListNode *next = cur->next;
            if (cur != graph->heads[i]) {
                free(cur);
            }
            cur = next;
        }
        free(graph->heads[i]->vertex);
        free(graph->heads[i]);
    }
    free(graph);
}

/* Найти узел, соответствующий вершине */
AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
    for (int i = 0; i < graph->size; i++) {
        if (graph->heads[i]->vertex == vet) {
            return graph->heads[i];
        }
    }
    return NULL;
}

/* Вспомогательная функция добавления ребра */
void addEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
    node->vertex = vet;
    // Вставка в голову
    node->next = head->next;
    head->next = node;
}

/* Добавление ребра */
void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL && head1 != head2);
    // Добавить ребро vet1 - vet2
    addEdgeHelper(head1, vet2);
    addEdgeHelper(head2, vet1);
}

/* Вспомогательная функция удаления ребра */
void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *pre = head;
    AdjListNode *cur = head->next;
    // Искать в связном списке узел, соответствующий vet
    while (cur != NULL && cur->vertex != vet) {
        pre = cur;
        cur = cur->next;
    }
    if (cur == NULL)
        return;
    // Удалить из связного списка узел, соответствующий vet
    pre->next = cur->next;
    // Освободить память
    free(cur);
}

/* Удаление ребра */
void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL);
    // Удалить ребро vet1 - vet2
    removeEdgeHelper(head1, head2->vertex);
    removeEdgeHelper(head2, head1->vertex);
}

/* Добавление вершины */
void addVertex(GraphAdjList *graph, Vertex *vet) {
    assert(graph != NULL && graph->size < MAX_SIZE);
    AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
    head->vertex = vet;
    head->next = NULL;
    // Добавить новый список в список смежности
    graph->heads[graph->size++] = head;
}

/* Удаление вершины */
void removeVertex(GraphAdjList *graph, Vertex *vet) {
    AdjListNode *node = findNode(graph, vet);
    assert(node != NULL);
    // Удалить из списка смежности список, соответствующий вершине vet
    AdjListNode *cur = node, *pre = NULL;
    while (cur) {
        pre = cur;
        cur = cur->next;
        free(pre);
    }
    // Обойти списки других вершин и удалить все ребра, содержащие vet
    for (int i = 0; i < graph->size; i++) {
        cur = graph->heads[i];
        pre = NULL;
        while (cur) {
            pre = cur;
            cur = cur->next;
            if (cur && cur->vertex == vet) {
                pre->next = cur->next;
                free(cur);
                break;
            }
        }
    }
    // Сдвинуть вершины после данной вперед, чтобы заполнить образовавшийся пробел
    int i;
    for (i = 0; i < graph->size; i++) {
        if (graph->heads[i] == node)
            break;
    }
    for (int j = i; j < graph->size - 1; j++) {
        graph->heads[j] = graph->heads[j + 1];
    }
    graph->size--;
    free(vet);
}

/* Вывести список смежности */
void printGraph(const GraphAdjList *graph) {
    printf("Список смежности =\n");
    for (int i = 0; i < graph->size; ++i) {
        AdjListNode *node = graph->heads[i];
        printf("%d: [", node->vertex->val);
        node = node->next;
        while (node) {
            printf("%d, ", node->vertex->val);
            node = node->next;
        }
        printf("]\n");
    }
}
