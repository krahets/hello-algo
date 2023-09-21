class dijkstra {
  static final int V = 6;

  int minDistance(List<int> dist, List<bool> sptSet) {
    int minDist = int.maxValue;
    int minIndex = -1;

    for (int v = 0; v < V; v++) {
      if (!sptSet[v] && dist[v] <= minDist) {
        minDist = dist[v];
        minIndex = v;
      }
    }

    return minIndex;
  }

  void printSolution(List<int> dist) {
    print('顶点   距离');
    for (int i = 0; i < V; i++) {
      print('$i     ${dist[i]}');
    }
  }

  void dijkstra(List<List<int>> graph, int src) {
    List<int> dist = List.filled(V, int.maxValue);
    List<bool> sptSet = List.filled(V, false);

    dist[src] = 0;

    for (int count = 0; count < V - 1; count++) {
      int u = minDistance(dist, sptSet);
      sptSet[u] = true;

      for (int v = 0; v < V; v++) {
        if (!sptSet[v] &&
            graph[u][v] != 0 &&
            dist[u] != int.maxValue &&
            dist[u] + graph[u][v] < dist[v]) {
          dist[v] = dist[u] + graph[u][v];
        }
      }
    }

    printSolution(dist);
  }
}

void main() {
  List<List<int>> graph = [
    [0, 2, 0, 6, 0, 0],
    [2, 0, 3, 8, 5, 0],
    [0, 3, 0, 0, 7, 0],
    [6, 8, 0, 0, 9, 10],
    [0, 5, 7, 9, 0, 1],
    [0, 0, 0, 10, 1, 0]
  ];

  dijkstra dijkstra = dijkstra();
  dijkstra.dijkstra(graph, 0);
}
