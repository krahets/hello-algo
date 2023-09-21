#include <stdio.h>
#include <stdbool.h>
#include <limits.h>

#define V 6

int minDistance(int dist[], bool sptSet[]) {
    int min = INT_MAX, min_index,v;
    for (v = 0; v < V; v++) {
        if (!sptSet[v] && dist[v] <= min) {
            min = dist[v];
            min_index = v;
        }
    }
    return min_index;
}

void dijkstra(int graph[V][V], int src) {
    int dist[V];
    bool sptSet[V];
    int i, count, v;
    // 初始化距离数组和顶点集合
    for ( i = 0; i < V; i++) {
        dist[i] = INT_MAX;
        sptSet[i] = false;
    }

    dist[src] = 0;  // 设置起始顶点距离为0

    // 找到最短路径
    for (count = 0; count < V - 1; count++) {
        int u = minDistance(dist, sptSet);
        sptSet[u] = true;

        // 更新邻接顶点的距离
        for ( v = 0; v < V; v++) {
            if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX
                && dist[u] + graph[u][v] < dist[v]) {
                dist[v] = dist[u] + graph[u][v];
            }
        }
    }

    // 输出结果
    printf("顶点   距离\n");
    for (i = 0; i < V; i++) {
        printf("%d     %d\n", i, dist[i]);
    }
}

int main() {
    int graph[V][V] = { {0, 2, 0, 6, 0, 0},
                        {2, 0, 3, 8, 5, 0},
                        {0, 3, 0, 0, 7, 0},
                        {6, 8, 0, 0, 9, 10},
                        {0, 5, 7, 9, 0, 1},
                        {0, 0, 0, 10, 1, 0} };

    dijkstra(graph, 0);

    return 0;
}
