/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// 노드가 최대 100개라고 가정한다
#define MAX_SIZE 100

/* 노드 구조체 */
typedef struct AdjListNode {
    Vertex *vertex;           // 정점
    struct AdjListNode *next; // 다음 노드
} AdjListNode;

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
typedef struct {
    AdjListNode *heads[MAX_SIZE]; // 노드 배열
    int size;                     // 노드 개수
} GraphAdjList;

/* 생성자 */
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

/* 소멸자 */
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

/* 정점에 해당하는 노드 찾기 */
AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
    for (int i = 0; i < graph->size; i++) {
        if (graph->heads[i]->vertex == vet) {
            return graph->heads[i];
        }
    }
    return NULL;
}

/* 간선 추가 보조 함수 */
void addEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
    node->vertex = vet;
    // 맨 앞에 삽입한다
    node->next = head->next;
    head->next = node;
}

/* 간선 추가 */
void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL && head1 != head2);
    // 간선 vet1 - vet2를 추가한다
    addEdgeHelper(head1, vet2);
    addEdgeHelper(head2, vet1);
}

/* 간선 삭제 보조 함수 */
void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *pre = head;
    AdjListNode *cur = head->next;
    // 연결 리스트에서 vet에 해당하는 노드를 찾는다
    while (cur != NULL && cur->vertex != vet) {
        pre = cur;
        cur = cur->next;
    }
    if (cur == NULL)
        return;
    // 연결 리스트에서 vet에 해당하는 노드를 삭제한다
    pre->next = cur->next;
    // 메모리 해제
    free(cur);
}

/* 간선 삭제 */
void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL);
    // 간선 vet1 - vet2를 삭제한다
    removeEdgeHelper(head1, head2->vertex);
    removeEdgeHelper(head2, head1->vertex);
}

/* 정점 추가 */
void addVertex(GraphAdjList *graph, Vertex *vet) {
    assert(graph != NULL && graph->size < MAX_SIZE);
    AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
    head->vertex = vet;
    head->next = NULL;
    // 인접 리스트에 새 연결 리스트를 추가한다
    graph->heads[graph->size++] = head;
}

/* 정점 삭제 */
void removeVertex(GraphAdjList *graph, Vertex *vet) {
    AdjListNode *node = findNode(graph, vet);
    assert(node != NULL);
    // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
    AdjListNode *cur = node, *pre = NULL;
    while (cur) {
        pre = cur;
        cur = cur->next;
        free(pre);
    }
    // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
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
    // 해당 정점 뒤의 정점을 앞으로 옮겨 빈자리를 채운다
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

/* 인접 리스트 출력 */
void printGraph(const GraphAdjList *graph) {
    printf("인접 리스트 =\n");
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
