/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// Assume max node count is 100
#define MAX_SIZE 100

/* Check if vertex has been visited */
int isVisited(Vertex **res, int size, Vertex *vet) {
    // Traverse to find node using O(n) time
    for (int i = 0; i < size; i++) {
        if (res[i] == vet) {
            return 1;
        }
    }
    return 0;
}

/* Depth-first traversal helper function */
void dfs(GraphAdjList *graph, Vertex **res, int *resSize, Vertex *vet) {
    // Record visited vertex
    res[(*resSize)++] = vet;
    // Traverse all adjacent vertices of this vertex
    AdjListNode *node = findNode(graph, vet);
    while (node != NULL) {
        // Skip vertices that have been visited
        if (!isVisited(res, *resSize, node->vertex)) {
            // Recursively visit adjacent vertices
            dfs(graph, res, resSize, node->vertex);
        }
        node = node->next;
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
void graphDFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize) {
    dfs(graph, res, resSize, startVet);
}

/* Driver Code */
int main() {
    // Add edge
    int vals[] = {0, 1, 2, 3, 4, 5, 6};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // Add all vertices and edges
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nAfter initialization, graph is\n");
    printGraph(graph);

    // Depth-first traversal
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    graphDFS(graph, v[0], res, &resSize);
    printf("\nDepth-first traversal (DFS) vertex sequence is\n");
    printArray(vetsToVals(res, resSize), resSize);

    // Free memory
    delGraphAdjList(graph);
    free(v);
    return 0;
}
