/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// Assume max vertex count is 100
#define MAX_SIZE 100

/* Undirected graph structure based on adjacency matrix */
typedef struct {
    int vertices[MAX_SIZE];
    int adjMat[MAX_SIZE][MAX_SIZE];
    int size;
} GraphAdjMat;

/* Constructor */
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

/* Destructor */
void delGraphAdjMat(GraphAdjMat *graph) {
    free(graph);
}

/* Add vertex */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "Graph vertex count has reached maximum\n");
        return;
    }
    // Add nth vertex and zero nth row and column
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* Remove vertex */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "Vertex index out of bounds\n");
        return;
    }
    // Remove the vertex at index from the vertex list
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // Remove the row at index from the adjacency matrix
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // Remove the column at index from the adjacency matrix
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* Add edge */
// Parameters i, j correspond to the vertices element indices
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "Edge index out of bounds or equal\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* Remove edge */
// Parameters i, j correspond to the vertices element indices
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "Edge index out of bounds or equal\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* Print adjacency matrix */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("Vertex list = ");
    printArray(graph->vertices, graph->size);
    printf("Adjacency matrix =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* Driver Code */
int main() {
    // Add edge
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nAfter initialization, graph is\n");
    printGraphAdjMat(graph);

    /* Add edge */
    // Add vertex
    addEdge(graph, 0, 2);
    printf("\nAfter adding edge 1-2, graph is\n");
    printGraphAdjMat(graph);

    /* Remove edge */
    // Vertices 1, 3 have indices 0, 1 respectively
    removeEdge(graph, 0, 1);
    printf("\nAfter deleting edge 1-3, graph is\n");
    printGraphAdjMat(graph);

    /* Add vertex */
    addVertex(graph, 6);
    printf("\nAfter adding vertex 6, graph is\n");
    printGraphAdjMat(graph);

    /* Remove vertex */
    // Vertex 3 has index 1
    removeVertex(graph, 1);
    printf("\nAfter deleting vertex 3, graph is\n");
    printGraphAdjMat(graph);

    // Free memory
    delGraphAdjMat(graph);

    return 0;
}
