/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* Driver code */
int main() {
    int vals[] = {1, 3, 2, 5, 4};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    int egdeSize = sizeof(edges) / sizeof(edges[0]);
    GraphAdjList *graph = newGraphAdjList();
    // Add all vertices and edges
    for (int i = 0; i < size; i++) {
        addVertex(graph, v[i]);
    }
    for (int i = 0; i < egdeSize; i++) {
        addEdge(graph, edges[i][0], edges[i][1]);
    }
    printf("\nGraph after initialization:\n");
    printGraph(graph);

    /* Add an edge */
    // Vertices 1 and 2 are v[0] and v[2]
    addEdge(graph, v[0], v[2]);
    printf("\nGraph after adding edge 1-2:\n");
    printGraph(graph);

    /* Remove an edge */
    // Vertices 1 and 3 are v[0] and v[1]
    removeEdge(graph, v[0], v[1]);
    printf("\nGraph after removing edge 1-3:\n");
    printGraph(graph);

    /* Add a vertex */
    Vertex *v5 = newVertex(6);
    addVertex(graph, v5);
    printf("\nGraph after adding vertex 6:\n");
    printGraph(graph);

    /* Remove a vertex */
    // Vertex 3 is v[1]
    removeVertex(graph, v[1]);
    printf("\nGraph after removing vertex 3:\n");
    printGraph(graph);

    // Free memory
    delGraphAdjList(graph);
    free(v);
    return 0;
}
