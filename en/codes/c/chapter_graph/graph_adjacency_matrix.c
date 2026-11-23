/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

// Assume at most 100 vertices
#define MAX_SIZE 100

/* Undirected graph structure implemented with an adjacency matrix */
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

/* Add a vertex */
void addVertex(GraphAdjMat *graph, int val) {
    if (graph->size == MAX_SIZE) {
        fprintf(stderr, "The graph has reached its maximum number of vertices\n");
        return;
    }
    // Add the vertex at index n and set row n and column n to zero
    int n = graph->size;
    graph->vertices[n] = val;
    for (int i = 0; i <= n; i++) {
        graph->adjMat[n][i] = graph->adjMat[i][n] = 0;
    }
    graph->size++;
}

/* Remove a vertex */
void removeVertex(GraphAdjMat *graph, int index) {
    if (index < 0 || index >= graph->size) {
        fprintf(stderr, "Vertex index out of bounds\n");
        return;
    }
    // Remove the vertex at index `index` from the vertex list
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1];
    }
    // Remove row `index` from the adjacency matrix
    for (int i = index; i < graph->size - 1; i++) {
        for (int j = 0; j < graph->size; j++) {
            graph->adjMat[i][j] = graph->adjMat[i + 1][j];
        }
    }
    // Remove column `index` from the adjacency matrix
    for (int i = 0; i < graph->size; i++) {
        for (int j = index; j < graph->size - 1; j++) {
            graph->adjMat[i][j] = graph->adjMat[i][j + 1];
        }
    }
    graph->size--;
}

/* Add an edge */
// Parameters i and j are element indices in vertices
void addEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "Edge endpoint indices are out of bounds or equal\n");
        return;
    }
    graph->adjMat[i][j] = 1;
    graph->adjMat[j][i] = 1;
}

/* Remove an edge */
// Parameters i and j are element indices in vertices
void removeEdge(GraphAdjMat *graph, int i, int j) {
    if (i < 0 || j < 0 || i >= graph->size || j >= graph->size || i == j) {
        fprintf(stderr, "Edge endpoint indices are out of bounds or equal\n");
        return;
    }
    graph->adjMat[i][j] = 0;
    graph->adjMat[j][i] = 0;
}

/* Print the adjacency matrix */
void printGraphAdjMat(GraphAdjMat *graph) {
    printf("Vertex list = ");
    printArray(graph->vertices, graph->size);
    printf("Adjacency matrix =\n");
    for (int i = 0; i < graph->size; i++) {
        printArray(graph->adjMat[i], graph->size);
    }
}

/* Driver code */
int main() {
    // Initialize the undirected graph
    GraphAdjMat *graph = newGraphAdjMat();
    int vertices[] = {1, 3, 2, 5, 4};
    for (int i = 0; i < 5; i++) {
        addVertex(graph, vertices[i]);
    }
    int edges[][2] = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    for (int i = 0; i < 6; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nGraph after initialization:\n");
    printGraphAdjMat(graph);

    /* Add an edge */
    // Vertices 1 and 2 have indices 0 and 2, respectively
    addEdge(graph, 0, 2);
    printf("\nGraph after adding edge 1-2:\n");
    printGraphAdjMat(graph);

    /* Remove an edge */
    // Vertices 1 and 3 have indices 0 and 1, respectively
    removeEdge(graph, 0, 1);
    printf("\nGraph after removing edge 1-3:\n");
    printGraphAdjMat(graph);

    /* Add a vertex */
    addVertex(graph, 6);
    printf("\nGraph after adding vertex 6:\n");
    printGraphAdjMat(graph);

    /* Remove a vertex */
    // Vertex 3 has index 1
    removeVertex(graph, 1);
    printf("\nGraph after removing vertex 3:\n");
    printGraphAdjMat(graph);

    // Free memory
    delGraphAdjMat(graph);

    return 0;
}
