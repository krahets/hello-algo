/**
 * File: graph_adjacency_list_test.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* Driver Code */
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
    printf("\nAfter initialization, graph is\n");
    printGraph(graph);

    /* Add edge */
    // Vertices 1, 3 are v[0], v[1]
    addEdge(graph, v[0], v[2]);
    printf("\nAfter adding edge 1-2, graph is\n");
    printGraph(graph);

    /* Remove edge */
    // Vertex 3 is v[1]
    removeEdge(graph, v[0], v[1]);
    printf("\nAfter deleting edge 1-3, graph is\n");
    printGraph(graph);

    /* Add vertex */
    Vertex *v5 = newVertex(6);
    addVertex(graph, v5);
    printf("\nAfter adding vertex 6, graph is\n");
    printGraph(graph);

    /* Remove vertex */
    // Vertex 3 is v[1]
    removeVertex(graph, v[1]);
    printf("\nAfter deleting vertex 3, graph is:\n");
    printGraph(graph);

    // Free memory
    delGraphAdjList(graph);
    free(v);
    return 0;
}
