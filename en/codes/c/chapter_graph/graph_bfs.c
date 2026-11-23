/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

// Assume at most 100 vertices
#define MAX_SIZE 100

/* Vertex queue structure */
typedef struct {
    Vertex *vertices[MAX_SIZE];
    int front, rear, size;
} Queue;

/* Constructor */
Queue *newQueue() {
    Queue *q = (Queue *)malloc(sizeof(Queue));
    q->front = q->rear = q->size = 0;
    return q;
}

/* Check whether the queue is empty */
int isEmpty(Queue *q) {
    return q->size == 0;
}

/* Enqueue operation */
void enqueue(Queue *q, Vertex *vet) {
    q->vertices[q->rear] = vet;
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->size++;
}

/* Dequeue operation */
Vertex *dequeue(Queue *q) {
    Vertex *vet = q->vertices[q->front];
    q->front = (q->front + 1) % MAX_SIZE;
    q->size--;
    return vet;
}

/* Check whether a vertex has been visited */
int isVisited(Vertex **visited, int size, Vertex *vet) {
    // Search for the vertex with a linear scan in O(n) time
    for (int i = 0; i < size; i++) {
        if (visited[i] == vet)
            return 1;
    }
    return 0;
}

/* Breadth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
void graphBFS(GraphAdjList *graph, Vertex *startVet, Vertex **res, int *resSize, Vertex **visited, int *visitedSize) {
    // Use a queue to implement BFS
    Queue *queue = newQueue();
    enqueue(queue, startVet);
    visited[(*visitedSize)++] = startVet;
    // Starting from startVet, continue until all reachable vertices have been visited
    while (!isEmpty(queue)) {
        Vertex *vet = dequeue(queue); // Dequeue the front vertex
        res[(*resSize)++] = vet;      // Record the visited vertex
        // Traverse all neighbors of this vertex
        AdjListNode *node = findNode(graph, vet);
        while (node != NULL) {
            // Skip vertices that have already been visited
            if (!isVisited(visited, *visitedSize, node->vertex)) {
                enqueue(queue, node->vertex);             // Enqueue only unvisited vertices
                visited[(*visitedSize)++] = node->vertex; // Mark this vertex as visited
            }
            node = node->next;
        }
    }
    // Free memory
    free(queue);
}

/* Driver code */
int main() {
    // Initialize the undirected graph
    int vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(vals) / sizeof(vals[0]);
    Vertex **v = valsToVets(vals, size);
    Vertex *edges[][2] = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]}, {v[2], v[5]}, {v[3], v[4]},
                          {v[3], v[6]}, {v[4], v[5]}, {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
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

    // Breadth-first traversal
    // Vertex traversal sequence
    Vertex *res[MAX_SIZE];
    int resSize = 0;
    // Track vertices that have already been visited
    Vertex *visited[MAX_SIZE];
    int visitedSize = 0;
    graphBFS(graph, v[0], res, &resSize, visited, &visitedSize);
    printf("\nVertex sequence from breadth-first traversal (BFS):\n");
    printArray(vetsToVals(res, resSize), resSize);

    // Free memory
    delGraphAdjList(graph);
    free(v);
    return 0;
}
