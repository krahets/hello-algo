import java.util.Arrays;

class Dijkstra{
    private static final int V = 6;

    private int minDistance(int[] dist, boolean[] sptSet) {
        int minDist = Integer.MAX_VALUE;
        int minIndex = -1;

        for (int v = 0; v < V; v++) {
            if (!sptSet[v] && dist[v] <= minDist) {
                minDist = dist[v];
                minIndex = v;
            }
        }

        return minIndex;
    }

    private void printSolution(int[] dist) {
        System.out.println("顶点   距离");
        for (int i = 0; i < V; i++) {
            System.out.println(i + "     " + dist[i]);
        }
    }

    void dijkstra(int[][] graph, int src) {
        int[] dist = new int[V];
        boolean[] sptSet = new boolean[V];

        Arrays.fill(dist, Integer.MAX_VALUE);
        Arrays.fill(sptSet, false);

        dist[src] = 0;

        for (int count = 0; count < V - 1; count++) {
            int u = minDistance(dist, sptSet);
            sptSet[u] = true;

            for (int v = 0; v < V; v++) {
                if (!sptSet[v] && graph[u][v] != 0 && dist[u] != Integer.MAX_VALUE &&
                        dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                }
            }
        }

        printSolution(dist);
    }

    public static void main(String[] args) {
        int[][] graph = {
            {0, 2, 0, 6, 0, 0},
            {2, 0, 3, 8, 5, 0},
            {0, 3, 0, 0, 7, 0},
            {6, 8, 0, 0, 9, 10},
            {0, 5, 7, 9, 0, 1},
            {0, 0, 0, 10, 1, 0}
        };

        Dijkstra dijkstra = new Dijkstra();
        dijkstra.dijkstra(graph, 0);
    }
}
