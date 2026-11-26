/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// Assume a maximum of 100 nodes
#define MAX_SIZE 100

/* Node structure */
typedef struct AdjListNode {
    Vertex *vertex;           // Vertex
    struct AdjListNode *next; // Next node
} AdjListNode;

/* Undirected graph represented by an adjacency list */
typedef struct {
    AdjListNode *heads[MAX_SIZE]; // Array of nodes
    int size;                     // Number of nodes
} GraphAdjList;

/* Constructor */
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

/* Destructor */
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

/* Find the node for a vertex */
AdjListNode *findNode(GraphAdjList *graph, Vertex *vet) {
    for (int i = 0; i < graph->size; i++) {
        if (graph->heads[i]->vertex == vet) {
            return graph->heads[i];
        }
    }
    return NULL;
}

/* Helper for adding an edge */
void addEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *node = (AdjListNode *)malloc(sizeof(AdjListNode));
    node->vertex = vet;
    // Insert at the head
    node->next = head->next;
    head->next = node;
}

/* Add an edge */
void addEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL && head1 != head2);
    // Add the edge vet1 - vet2
    addEdgeHelper(head1, vet2);
    addEdgeHelper(head2, vet1);
}

/* Helper for removing an edge */
void removeEdgeHelper(AdjListNode *head, Vertex *vet) {
    AdjListNode *pre = head;
    AdjListNode *cur = head->next;
    // Search the linked list for the node corresponding to vet
    while (cur != NULL && cur->vertex != vet) {
        pre = cur;
        cur = cur->next;
    }
    if (cur == NULL)
        return;
    // Remove the node corresponding to vet from the linked list
    pre->next = cur->next;
    // Free the memory
    free(cur);
}

/* Remove an edge */
void removeEdge(GraphAdjList *graph, Vertex *vet1, Vertex *vet2) {
    AdjListNode *head1 = findNode(graph, vet1);
    AdjListNode *head2 = findNode(graph, vet2);
    assert(head1 != NULL && head2 != NULL);
    // Remove the edge vet1 - vet2
    removeEdgeHelper(head1, head2->vertex);
    removeEdgeHelper(head2, head1->vertex);
}

/* Add a vertex */
void addVertex(GraphAdjList *graph, Vertex *vet) {
    assert(graph != NULL);
    if (findNode(graph, vet) != NULL)
        return;
    assert(graph->size < MAX_SIZE);
    AdjListNode *head = (AdjListNode *)malloc(sizeof(AdjListNode));
    head->vertex = vet;
    head->next = NULL;
    // Add a new linked list to the adjacency list
    graph->heads[graph->size++] = head;
}

/* Remove a vertex */
void removeVertex(GraphAdjList *graph, Vertex *vet) {
    AdjListNode *node = findNode(graph, vet);
    assert(node != NULL);
    // Shift the following vertices forward to fill the gap
    int i;
    for (i = 0; i < graph->size; i++) {
        if (graph->heads[i] == node)
            break;
    }
    for (int j = i; j < graph->size - 1; j++) {
        graph->heads[j] = graph->heads[j + 1];
    }
    graph->size--;
    // Traverse the other vertices' lists and remove every edge incident to vet
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
    // Remove the linked list for vertex vet from the adjacency list
    while (node != NULL) {
        AdjListNode *next = node->next;
        free(node);
        node = next;
    }
    free(vet);
}

/* Print the adjacency list */
void printGraph(const GraphAdjList *graph) {
    printf("Adjacency list =\n");
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
