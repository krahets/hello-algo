#include <iostream>
#include <queue>
#include <vector>
#include <limits.h>
using namespace std;

#define V 6  // 图中顶点的数量

int minDistance(int dist[], bool sptSet[]) {
    int min = INT_MAX, min_index;
    for (int v = 0; v < V; v++) {
        if (!sptSet[v] && dist[v] <= min) {
            min = dist[v];
            min_index = v;
        }
    }
    return min_index;
}

void Dijkstra(int graph[V][V], int src) {
    int dist[V];
    bool sptSet[V];
    for (int i = 0; i < V; i++) {
        dist[i] = INT_MAX;
        sptSet[i] = false;
    }
    dist[src] = 0;
    for (int count = 0; count < V-1; count++) {
        int u = minDistance(dist, sptSet);
        sptSet[u] = true;
        for (int v = 0; v < V; v++) {
            if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX &&
                dist[u]+graph[u][v] < dist[v]) {
                dist[v] = dist[u] + graph[u][v];
            }
        }
    }
    cout << "顶点   距离" << endl;
    for (int i = 0; i < V; i++) {
        cout << i << "     " << dist[i] << endl;
    }
}

int main() {
    int graph[V][V] = { {0, 2, 0, 6, 0, 0},
                        {2, 0, 3, 8, 5, 0},
                        {0, 3, 0, 0, 7, 0},
                        {6, 8, 0, 0, 9, 10},
                        {0, 5, 7, 9, 0, 1},
                        {0, 0, 0, 10, 1, 0} };
    Dijkstra(graph, 0);
    return 0;
}
