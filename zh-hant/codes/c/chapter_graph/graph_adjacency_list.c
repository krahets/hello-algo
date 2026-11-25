/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// 假設節點數量上限為 100
#define MAX_SIZE 100

/* 節點結構 */
typedef struct AdjListNode {
    Vertex *vertex;           // 頂點
    struct AdjListNode *next; // 後繼節點
} AdjListNode;

/* 以鄰接串列實作的無向圖類別 */
typedef struct {
    AdjListNode *heads[MAX_SIZE]; // 節點陣列
    int size;                     // 節點數量
} GraphAdjList;

/* 建構函式 */
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

/* 解構函式 */
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

/* 尋找頂點對應的節點 */
AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
    for (int i = 0; i < graph->size; i++) {
        if (graph->heads[i]->vertex == vet) {
            return graph->heads[i];
        }
    }
    return NULL;
}

/* 新增邊的輔助函式 */
void addEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
    node->vertex = vet;
    // 從串列開頭插入
    node->next = head->next;
    head->next = node;
}

/* 新增邊 */
void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL && head1 != head2);
    // 新增邊 vet1 - vet2
    addEdgeHelper(head1, vet2);
    addEdgeHelper(head2, vet1);
}

/* 刪除邊的輔助函式 */
void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *pre = head;
    AdjListNode *cur = head->next;
    // 在鏈結串列中尋找 vet 對應的節點
    while (cur != NULL && cur->vertex != vet) {
        pre = cur;
        cur = cur->next;
    }
    if (cur == NULL)
        return;
    // 從鏈結串列中刪除 vet 對應的節點
    pre->next = cur->next;
    // 釋放記憶體
    free(cur);
}

/* 刪除邊 */
void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL);
    // 刪除邊 vet1 - vet2
    removeEdgeHelper(head1, head2->vertex);
    removeEdgeHelper(head2, head1->vertex);
}

/* 新增頂點 */
void addVertex(GraphAdjList *graph, Vertex *vet) {
    assert(graph != NULL);
    if (findNode(graph, vet) != NULL)
        return;
    assert(graph->size < MAX_SIZE);
    AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
    head->vertex = vet;
    head->next = NULL;
    // 在鄰接串列中新增一條鏈結串列
    graph->heads[graph->size++] = head;
}

/* 刪除頂點 */
void removeVertex(GraphAdjList *graph, Vertex *vet) {
    AdjListNode *node = findNode(graph, vet);
    assert(node != NULL);
    // 將後面的頂點往前移，補上空位
    int i;
    for (i = 0; i < graph->size; i++) {
        if (graph->heads[i] == node)
            break;
    }
    for (int j = i; j < graph->size - 1; j++) {
        graph->heads[j] = graph->heads[j + 1];
    }
    graph->size--;
    // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
    for (int i = 0; i < graph->size; i++) {
        AdjListNode *cur = graph->heads[i];
        while (cur->next != NULL) {
            AdjListNode *next = cur->next;
            if (next->vertex == vet) {
                cur->next = next->next;
                free(next);
            } else {
                cur = next;
            }
        }
    }
    // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
    while (node != NULL) {
        AdjListNode *next = node->next;
        free(node);
        node = next;
    }
    free(vet);
}

/* 印出鄰接串列 */
void printGraph(const GraphAdjList *graph) {
    printf("鄰接串列 =\n");
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
